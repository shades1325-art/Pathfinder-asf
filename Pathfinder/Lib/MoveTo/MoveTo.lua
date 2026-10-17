local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path
local cpppdpath = rmlast(cppdpath) -- callee parent parent of parent dir path

local aStar               = require (cppdpath .. "Lib/lua-astar/AStar")
local Lib                 = require (cppdpath .. "Lib/Lib")
local Game                = require (cppdpath .. "Lib/Game")
local Table               = require (cppdpath .. "Lib/Table")
local Work                = require (cppdpath .. "Lib/Work")
local _ss                 = require (cpppdpath .. "Settings/Static_Settings")
local _globalMap          = require (cppdpath .. "Maps/GlobalMap")
local subMaps             = require (cppdpath .. "Maps/MapExceptions/SubstituteMaps")
local mapLinks            = require (cppdpath .. "Maps/MapLink")
local linkExceptions      = require (cppdpath .. "Maps/MapExceptions/LinkExceptions")
local _npcExceptions      = require (cppdpath .. "Maps/MapExceptions/NpcExceptions")
local digways             = require (cppdpath .. "Maps/MapExceptions/Digways")
local mapExceptions       = require (cppdpath .. "Maps/MapExceptions/MapExceptions")
local dialogSolver        = require (cppdpath .. "Lib/MoveTo/DialogSolver")
-- Preserve main1's explicit opt-out: do not enable discovery hooks/logs.
local CELL_CRAWL_ENABLED = false
local cellCrawl = {
    attachPathfinder = function() end,
    getLearnedLinks = function() return {} end,
    logLearnedLinks = function() end,
    setMaxSourceLinkDistance = function() end,
    getKnowledgeSummary = function() return "CellCrawl disabled by main1 preference" end,
    moveToFrontier = function() return false, "CellCrawl disabled by main1 preference" end,
}
if CELL_CRAWL_ENABLED then
    cellCrawl = require (cppdpath .. "Lib/MoveTo/CellCrawl")
end
local elevatorExceptions  = require (cppdpath .. "Maps/MapExceptions/Elevators")
-- SpawnData is only needed by getMapToPokemon(). Loading it here made every
-- Pathfinder script parse the whole hunt database during startup.
local spawnDataPath       = cppdpath .. "Spawn/SpawnData"
local spawnData           = nil
local function getSpawnDataIndex()
    if spawnData == nil then
        spawnData = require(spawnDataPath)
    end
    return spawnData
end
local transmatExceptions  = require (cppdpath .. "Maps/MapExceptions/Transmats")
local moveAbilities       = {["cut"] = 0, ["surf"] = 0, ["dig"] = 155, ["rock smash"] = 0, ["dive"] = 155}
local workAbilities       = {["headbutt"] = 155, ["dig"] = 0}
local moveItems           = {"Fresh Water", "Marsh Badge", "Zephyr Badge", "Bicycle", "Go-Goggles", "Green Bicycle", "Blue Bicycle", "Yellow Bicycle"}
local globalMap           = {}
local mapRegions          = {}
local pathSolution        = {}
local settings            = {}
local destStore           = ""
local routePolicyStore    = ""
local digFallbackActive   = false
local blockedDigways      = {}
local skipUnavailableDigway
local npcExceptions       = nil
local outlet              = nil
local playerNode          = nil
local from                = nil
local toMap               = nil
local digIndex            = nil
local walkingCheckpoints  = {}
local routeLength         = 0

-- Optional Quest Studio observer. This reports existing Pathfinder state and
-- never participates in routing or action selection.
local function studioPathfinder(state, destination, currentEdge, progress, failure)
    if type(questStudioPathfinder) == "function" then
        questStudioPathfinder(state or "Unavailable", destination or "",
            currentEdge or "", progress or "", failure or "")
    end
end

local function studioTrace(eventName, details)
    if type(questStudioTrace) == "function" then
        questStudioTrace(eventName, tostring(details or ""))
    end
end

-----------------------------------
----- A* NECESSARY  FUNCTIONS -----
-----------------------------------

-- checks if the link restrictions are matched depending on your team / items.
local function isLinkRestrictionMatched(data)
    if data.items then
        for _, item in ipairs(data.items) do
            if not settings.accountItems[item] then
                return false
            end
        end
    elseif data.abilities then
        for _, ability in ipairs(data.abilities) do
            if not settings.abilitiesIndex[ability] or ability == "dig" and not settings.dig then
                return false
            end
        end
    else error("Pathfinder --> Unknown link restriction.")
    end
    return true
end

-- check for subway paths in Kanto or Johto.
local function isSubwayPath(n1, n2)
    return type(n1) == "string" and type(n2) == "string"
        and string.find(n1, "Subway", 1, true) ~= nil
        and string.find(n2, "Subway", 1, true) ~= nil
end

local function getTransportType(n1, n2)
    if isSubwayPath(n1, n2) then
        return "subway"
    end
    if n1 == "Transmat Station" or n1 == "Transmat Station Sinnoh" then
        return "teleport"
    end
    return nil
end

local function isTransportAvailable(transportType)
    if transportType == nil then
        return true
    end
    return settings.transportAvailable == nil
        or settings.transportAvailable[transportType] ~= false
end

-- return a new table containing only valid links
local function getUsableLinks(fromNode, links)
    local usableLinks = {}
    for link, data in pairs(links) do
        assert(type(data) == "table", "Pathfinder --> Link " .. link .. " data is not a table")
        local isTransportValid = isTransportAvailable(getTransportType(fromNode, link))
        local isLinkValid = isTransportValid and #data == 1
        for i = 2, #data do
            if isTransportValid and isLinkRestrictionMatched(data[i]) then
                isLinkValid = true
                break;
            end
        end
        if isLinkValid and not (blockedDigways[fromNode] and blockedDigways[fromNode][link]) then
            usableLinks[#usableLinks + 1] = link
        end
    end
    return usableLinks
end

-- return a table of node, linked to the node n
local function expand(n)
    -- A newly released or event map may not exist in the authored graph yet.
    -- Returning no authored neighbors lets CellCrawl inspect its authoritative
    -- live link cells instead of terminating before discovery can begin.
    if type(globalMap[n]) ~= "table" then
        return {}
    end
    return getUsableLinks(n, globalMap[n])
end

-- Take 2 nodes return dist
local function cost(from, to)
    if type(globalMap[from][to]) == "table" then
        return globalMap[from][to][1]
    end
    return globalMap[from][to]
end

-- return estimated cost of goal, 0 is dijkstra
local function heuristic(n)
    return 0
end

-- return true if destination is reached
local function goal(targets)
    return function(current)
        return Lib.inTable(targets, current)
    end
end

-- call simplification
local simpleAStar = aStar(expand)(cost)(heuristic)

local function refreshTransportAvailability()
    settings.transportConfigured = settings.transportConfigured or {
        subway = true,
        teleport = true,
    }
    settings.transportAvailable = {
        subway = settings.transportConfigured.subway ~= false,
        teleport = settings.transportConfigured.teleport ~= false,
    }
end

---------------------------
--- EXCEPTION  HANDLING ---
---------------------------

-- check for exceptions in table
local function exceptionExist(t, n1, n2)
    return t[n1] and t[n1][n2]
end

local function solveElevatorExce(n1, n2)
    local exce = elevatorExceptions[n1][n2]
    if exce[5] then
        exce[5] = false
        return assert(moveToCell(table.unpack(exce[6])), "Pathfinder --> Error: Elevator exception failed on moving to map for: " .. n1 .. " -> " .. n2)
    else return assert(talkToNpcOnCell(table.unpack(exce[1])), "Pathfinder --> Error: Elevator exception invalid for talking to npc on map: " .. n1 .. " -> " .. n2)
    end
end

local function solveTransmatExce(n2)
    local destination = transmatExceptions.destinations[n2]
    if destination == nil then
        log("Pathfinder --> No Transmat dialog configuration for destination: " .. tostring(n2))
        return false
    end

    if destination.state then
        destination.state = false
        return assert(moveToCell(9, 10), "Pathfinder --> Failed to exit Transmat Station.")
    end
    return assert(talkToNpcOnCell(4, 4), "Pathfinder --> Failed to talk to npc in Transmat Station")
end

local function solveMapExce(mapExceptions, n1, n2)
    local exception = mapExceptions[n1][n2]
    local coords = exception[1]
    if #coords == 2 then
        -- A two-way scripted link does not fire again while the player is still
        -- standing on its arrival cell.  An optional second cell lets us step
        -- off once; the following tick can then step back onto the link.
        if getPlayerX() == coords[1] and getPlayerY() == coords[2] and exception[2] then
            local reset = exception[2]
            return assert(moveToCell(reset[1], reset[2]),
                "Pathfinder --> Error: could not reset map link for: " .. n1 .. " -> " .. n2)
        end
        return assert(moveToCell(coords[1], coords[2]),
            "Pathfinder --> Error: moveToCell invalid for: " .. n1 .. " -> " .. n2)
    elseif #coords == 4 then
        return assert(moveToRectangle(coords[1], coords[2], coords[3], coords[4]),
            "Pathfinder --> Error: moveToRectangle invalid for: " .. n1 .. " -> " .. n2)
    else
        error("Pathfinder --> Error: Unsupported coordinates format for: " .. n1 .. " -> " .. n2)
    end
end

-- check if the nodes are the same map
-- Current cached/server spelling uses "Falls"; the authored graph and region
-- rectangles use legacy "falls". Resolve this proven alias only. Keep suffix
-- regions distinct and never turn arbitrary misspellings into valid maps.
local mapNameAliases = {["Meteor Falls 1F 1R"] = "Meteor falls 1F 1R"}
local function canonicalMapName(map)
    if type(map) ~= "string" then return map end
    local physical, suffix = map:match("^(.-)(_%u)$")
    physical = physical or map
    return (mapNameAliases[physical] or physical) .. (suffix or "")
end

local function isSameMap(n1, n2)
    n1, n2 = canonicalMapName(n1), canonicalMapName(n2)
    return n1:gsub("_%u$", "") == n2:gsub("_%u$", "")
end

-- An explicit region is an exact destination, not merely the physical map.
-- Keep generic-map callers compatible; isSameMap remains the physical check.
local function isDestination(n1, n2)
    n1, n2 = canonicalMapName(n1), canonicalMapName(n2)
    if n2:match("_%u$") and n1 ~= n2 then return false end
    return n1:gsub("_%u$", "") == n2:gsub("_%u$", "") and not exceptionExist(npcExceptions, n1, n2) and not exceptionExist(digways, n1, n2) and not exceptionExist(mapExceptions, n1, n2)
end

-- skip nodes in the path if they are the same map and no exception exist between them
-- return the next destination node and her predecessor for exception handling.
local function getNextNodes()
    local from = playerNode
    while pathSolution[1] and isSameMap(playerNode, pathSolution[1]) do
        local toMap = pathSolution[1]
        -- log(exceptionExist(digways, from, toMap))
        if exceptionExist(npcExceptions, from, toMap) or exceptionExist(digways, from, toMap) or exceptionExist(mapExceptions, from, toMap) then
            return from, toMap
        end
        from = pathSolution[1]
        table.remove(pathSolution, 1)
    end
    return from, pathSolution[1]
end

-- check for exceptions from n1 to n2, and solve it
local function handleException(n1, n2)
	if exceptionExist(npcExceptions, n1, n2) then
        return assert(talkToNpcOnCell(table.unpack(npcExceptions[n1][n2][1])), "Pathfinder --> Error: Exception invalid for: " .. n1 .. " -> " .. n2)
    elseif exceptionExist(elevatorExceptions, n1, n2) then
        return solveElevatorExce(n1, n2)
    elseif exceptionExist(digways, n1, n2) then
        if digFallbackActive then
            -- A cached route may outlive a party/item change. Some legacy Dig
            -- graph edges are unconditional; never queue a nil/obsolete slot.
            settings.abilitiesIndex.dig=hasItem("Shovel") and 1
                or Game.getPokemonNumberWithMove("dig",moveAbilities.dig)
            if not settings.abilitiesIndex.dig then
                skipUnavailableDigway(n1,n2,"khong co Dig hop le")
                return waitForState(1)
            end
            local x,y=table.unpack(digways[n1][n2][1])
            local talk=tryTalkToNpcOnCell
            if type(talk)~="function" then
                -- Old hosts: avoid the fatal missing-NPC binding where possible.
                if type(isNpcOnCell)~="function" or not isNpcOnCell(x,y) then
                    skipUnavailableDigway(n1,n2,"NPC khong san sang")
                    return waitForState(1)
                end
                talk=talkToNpcOnCell
            end
            local ok,accepted=pcall(talk,x,y)
            if ok and accepted then return true end
            skipUnavailableDigway(n1,n2,ok and "khong the tuong tac" or "loi tuong tac Dig")
            -- Do not attempt another game action after a rejected interaction.
            -- Yield once, then replan the SAME goal on the next ready bot tick.
            return waitForState(1)
        end
        return assert(talkToNpcOnCell(table.unpack(digways[n1][n2][1])), "Pathfinder --> Error: Exception invalid for: " .. n1 .. " -> " .. n2)
    elseif exceptionExist(mapExceptions, n1, n2) then
        return solveMapExce(mapExceptions, n1, n2)
    elseif isSubwayPath(n1, n2) then
        return talkToNpcOnCell(10, 9)
    elseif n1 == "Transmat Station" or n1 == "Transmat Station Sinnoh" then
        return solveTransmatExce(n2)
    end
end

-- return the node coresponding to the current player pos. Also used to return the current map, with submap tag if applicable
local function getPlayerNode(map)
	map = canonicalMapName(map or getMapName())
	local playerInRectangle = Lib.inRectangle(getPlayerX(), getPlayerY())
	if subMaps[map] then
		for subMap, locs in pairs(subMaps[map]) do
			for _, rect in ipairs(locs) do
				if playerInRectangle(table.unpack(rect)) then
					return subMap
				end
			end
		end
		error("Pathfinder --> sub map could not be defined, map: " .. map .. "  x: " .. getPlayerX() .. "  y: " .. getPlayerY())
	end
	-- Unknown current maps are handed to CellCrawl. Destinations remain
	-- validated by mapsToNodes, so this does not turn misspelled targets into
	-- discovery requests.
	return map
end

-- return the node coresponding to the current player pos. Also used to return the current map, with submap tag if applicable
local function getMapNode(map, x, y)
	map = canonicalMapName(map or getMapName())
	local playerInRectangle = Lib.inRectangle(x, y)
	if subMaps[map] then
		for subMap, locs in pairs(subMaps[map]) do
			for _, rect in ipairs(locs) do
				if playerInRectangle(table.unpack(rect)) then
					return subMap
				end
			end
		end
		error("Pathfinder --> sub map could not be defined, map: " .. map .. "  x: " .. getPlayerX() .. "  y: " .. getPlayerY())
	end
	return map
end

-- create a new list replacing maps by all nodes corresponding to them
local function mapsToNodes(mapList)
    local nodeList = {}
    if type(mapList) == "string" then
        mapList = {mapList}
    end
    for _, map in pairs(mapList) do
        map = canonicalMapName(map)
        if subMaps[map] then  -- if the map has sub maps
            for submap, _ in pairs(subMaps[map]) do
                table.insert(nodeList, submap)
            end
        elseif globalMap[map] then
            table.insert(nodeList, map)
        else error("Pathfinder -> Requested dest does not exist in the map : " .. map)
        end
    end
    return nodeList
end


---------------------
-- DISCOVERING OUTLET
---------------------

local function unsetOutlet()
    outlet = nil
end

local function setOutlet()
    outlet = {}
    outlet.node = toMap
    outlet.fromNode = playerNode
    outlet.found = false
end

local function outletInNode()
    return outlet and playerNode == outlet.node
end

-- discover outlet if possible
local function checkOutlet()
    if outletInNode() then
        return assert(talkToNpcOnCell(table.unpack(digways[playerNode][outlet.fromNode][1])), "Pathfinder -> could not discover outlet, node: " .. playerNode .. " -> " .. outlet.fromNode)
    end
    return false
end

---------------------------
--- FUNCTION FOR MOVETO ---
---------------------------

-- reset path
-- Separate channels: Lib.log1time remembers only ONE message, so alternating
-- progress/checkpoint lines otherwise defeat each other's duplicate check.
local lastProgressLog,lastCheckpointLog
local function navigationLog(channel,message)
	if channel == "progress" then
		if message == lastProgressLog then return end
		lastProgressLog = message
	else
		if message == lastCheckpointLog then return end
		lastCheckpointLog = message
	end
	log(message)
end
local function resetPath()
	destStore = ""
	routePolicyStore = ""
	digFallbackActive = false
	lastProgressLog,lastCheckpointLog = nil,nil
	walkingCheckpoints = {}
	routeLength = 0
	from = nil
	toMap = nil
	studioPathfinder("Idle", "", "", "Idle", "")
end

skipUnavailableDigway=function(n1,n2,reason)
    blockedDigways[n1]=blockedDigways[n1] or {}
    if not blockedDigways[n1][n2] then
        blockedDigways[n1][n2]=true
        log("Pathfinder: Bo qua duong tat Dig "..n1.." -> "..n2.." ("..reason
            .."); tinh lai tuyen thuong toi cung dich, KHONG ghi DONE.")
    end
    -- Unlike legacy outlet discovery, do not force another Dig interaction on
    -- arrival after travelling around the unavailable shortcut.
    outlet=nil
    resetPath()
end

local function pointToRectangleDistance(x, y, target)
    if type(target) ~= "table" then
        return nil
    end

    local x1 = tonumber(target[1])
    local y1 = tonumber(target[2])
    local x2 = tonumber(target[3]) or x1
    local y2 = tonumber(target[4]) or y1
    if x1 == nil or y1 == nil or x2 == nil or y2 == nil then
        return nil
    end

    local minX, maxX = math.min(x1, x2), math.max(x1, x2)
    local minY, maxY = math.min(y1, y2), math.max(y1, y2)
    local dx = x < minX and minX - x or (x > maxX and x - maxX or 0)
    local dy = y < minY and minY - y or (y > maxY and y - maxY or 0)
    return dx + dy
end

-- MapLink may contain several doors/exits for the same destination. The old
-- implementation selected one randomly, which could send the player across a
-- large city unnecessarily. Select the closest valid cell/rectangle instead.
local function getNearestMapLink(linkList, x, y)
    if type(linkList) ~= "table" then
        return nil
    end

    local nearest, nearestDistance = nil, math.huge
    for _, target in ipairs(linkList) do
        local distance = pointToRectangleDistance(x, y, target)
        if distance ~= nil and distance < nearestDistance then
            nearest = target
            nearestDistance = distance
        end
    end
    return nearest, nearestDistance
end

local function closestPointOnTarget(x, y, target)
    if type(target) ~= "table" then
        return nil
    end
    local x1 = tonumber(target[1])
    local y1 = tonumber(target[2])
    local x2 = tonumber(target[3]) or x1
    local y2 = tonumber(target[4]) or y1
    if x1 == nil or y1 == nil or x2 == nil or y2 == nil then
        return nil
    end

    return {
        x = math.max(math.min(x, math.max(x1, x2)), math.min(x1, x2)),
        y = math.max(math.min(y, math.max(y1, y2)), math.min(y1, y2)),
    }
end

local function targetCentre(target)
    -- A few legacy MapLink entries are weight-only placeholders rather than
    -- { x, y } / { x1, y1, x2, y2 } coordinates. They are still traversable
    -- through the authored graph, but cannot supply an arrival coordinate.
    if type(target) ~= "table" then
        return nil
    end
    local x1 = tonumber(target[1])
    local y1 = tonumber(target[2])
    local x2 = tonumber(target[3]) or x1
    local y2 = tonumber(target[4]) or y1
    if x1 == nil or y1 == nil or x2 == nil or y2 == nil then
        return nil
    end
    return {
        x = math.floor((x1 + x2) / 2),
        y = math.floor((y1 + y2) / 2),
    }
end

-- MapLink stores one or more source cells for ordinary edges.  The legacy
-- LinkExceptions table stores the same kind of authored source coordinate as
-- a single { x, y } target for split/ambiguous maps.  Keep MapLink authoritative
-- when both exist, but consume LinkExceptions before considering live frontier
-- exploration: those coordinates identify which of several real exits belongs
-- to the graph edge.
local function getAuthoredLinkTargets(fromNode, toNode)
    local regularTargets = mapLinks[fromNode] and mapLinks[fromNode][toNode]
    if type(regularTargets) == "table" then
        return regularTargets, "MapLink"
    end

    local exceptionTarget = linkExceptions[fromNode]
        and linkExceptions[fromNode][toNode]
    if type(exceptionTarget) == "table" then
        return { exceptionTarget }, "LinkExceptions"
    end
    return nil, nil
end

-- Optional harvest planning policy, not a change to the graph or its costs.
-- A discovery-only edge must not send a harvesting tour across several maps
-- before discovering that its final checkpoint was never authored. Ordinary
-- getPath callers retain the legacy finite discovery penalty and behavior.
local function hasActionableEdge(fromNode, toNode)
    if getTransportType(fromNode,toNode) ~= nil
        or exceptionExist(npcExceptions,fromNode,toNode)
        or exceptionExist(elevatorExceptions,fromNode,toNode)
        or exceptionExist(digways,fromNode,toNode)
        or exceptionExist(mapExceptions,fromNode,toNode) then return true end
    local targets = getAuthoredLinkTargets(fromNode,toNode)
    for _,target in ipairs(targets or {}) do
        if type(target) == "table" and (#target == 2 or #target == 4)
            and targetCentre(target) ~= nil then return true end
    end
    return false
end

-- Map graph costs describe service/restriction weights.  For regular walking
-- edges, refine that coarse value with the actual distance from the current
-- entry point to the selected MapLink cell.  This replaces random exits with
-- a deterministic shortest walking segment without loading other map files.
local FALLBACK_WALKING_DISTANCE = 20
-- Preserve main1's graph-only route preference, without letting missing
-- authored checkpoints outrank routes that can actually issue movement.
local USE_GRAPH_COST_ONLY = true
-- A graph edge without an authored source cell is still eligible for
-- CellCrawl discovery when it is the only route.  It must not, however, beat
-- a fully actionable route merely because its unknown walking distance uses
-- the small fallback estimate.  Keep unactionable edges behind every
-- realistic authored walking route while leaving them finite for discovery.
local UNAUTHORED_LINK_PENALTY = 1000000

local function walkingSegment(fromNode, toNode, x, y)
    local linkList = getAuthoredLinkTargets(fromNode, toNode)
    if linkList == nil then
        -- NPC/elevator/Dig/map handlers issue a real action without a walking
        -- MapLink. In particular, authored ferry dialogs are not missing data.
        if hasActionableEdge(fromNode,toNode) then
            return tonumber(cost(fromNode,toNode)) or 1, nil, nil
        end
        return UNAUTHORED_LINK_PENALTY
            + math.max(1, tonumber(cost(fromNode, toNode)) or 1), nil, nil
    end
    if USE_GRAPH_COST_ONLY then
        return tonumber(cost(fromNode, toNode)) or 1, nil, nil
    end
    if x ~= nil and y ~= nil and linkList ~= nil then
        local target, distance = getNearestMapLink(linkList, x, y)
        if target ~= nil then
            return math.max(1, distance) + (tonumber(cost(fromNode, toNode)) or 1),
                target, closestPointOnTarget(x, y, target)
        end
    end
    return math.max(1, tonumber(cost(fromNode, toNode)) or 1)
        * FALLBACK_WALKING_DISTANCE, nil, nil
end

local function entryPointsFor(nextNode, fromNode, exitPoint)
    if USE_GRAPH_COST_ONLY then return {{x=nil, y=nil}} end
    if exitPoint ~= nil and isSameMap(fromNode, nextNode) then
        return { exitPoint }
    end

    local reverseLinks = getAuthoredLinkTargets(nextNode, fromNode)
    local entries = {}
    if type(reverseLinks) == "table" then
        for _, target in ipairs(reverseLinks) do
            local centre = targetCentre(target)
            if centre ~= nil then
                entries[#entries + 1] = centre
            end
        end
    end

    -- One-way warps and special transitions have no reverse map link.  Keep a
    -- single unknown entry state and use the authored graph weight next time.
    if #entries == 0 then
        entries[1] = { x = nil, y = nil }
    end
    return entries
end

local function routeStateKey(node, x, y)
    return tostring(node) .. "\30" .. tostring(x or "?") .. ":" .. tostring(y or "?")
end

local function newPriorityQueue()
    return { size = 0 }
end

local function pushPriority(queue, priority, key)
    local index = queue.size + 1
    queue.size = index
    queue[index] = { priority = priority, key = key }
    while index > 1 do
        local parent = math.floor(index / 2)
        if queue[parent].priority <= priority then
            break
        end
        queue[index] = queue[parent]
        index = parent
    end
    queue[index] = { priority = priority, key = key }
end

local function popPriority(queue)
    if queue.size == 0 then
        return nil
    end

    local result = queue[1]
    local last = queue[queue.size]
    queue[queue.size] = nil
    queue.size = queue.size - 1
    if queue.size > 0 then
        local index = 1
        while true do
            local left = index * 2
            local right = left + 1
            local child = left
            if right <= queue.size and queue[right].priority < queue[left].priority then
                child = right
            end
            if child > queue.size or queue[child].priority >= last.priority then
                break
            end
            queue[index] = queue[child]
            index = child
        end
        queue[index] = last
    end
    return result
end

local function rebuildRoute(lastKey, states, cameFrom)
    local reversed = {}
    local key = lastKey
    while key ~= nil do
        reversed[#reversed + 1] = states[key].node
        key = cameFrom[key]
    end

    local path = {}
    for index = #reversed, 1, -1 do
        path[#path + 1] = reversed[index]
    end
    return path
end

-- Dijkstra over map-entry states. A state includes the current map node and
-- the known entry cell, allowing each walking map segment to be scored by real
-- local distance. Transport edges retain their configured Static_Settings
-- weights, and disabled services are filtered by getUsableLinks().
local function getTravelPath(startNode, targets, requireActionable, walkingOnly)
    local targetSet = {}
    for _, target in ipairs(targets) do
        targetSet[target] = true
    end
    if targetSet[startNode] then
        return { startNode }, 0
    end

    local startX, startY = getPlayerX(), getPlayerY()
    if USE_GRAPH_COST_ONLY then startX, startY = nil, nil end
    local startKey = routeStateKey(startNode, startX, startY)
    local states = {
        [startKey] = { node = startNode, x = startX, y = startY },
    }
    local scores = { [startKey] = 0 }
    local cameFrom = { [startKey] = nil }
    local open = newPriorityQueue()
    pushPriority(open, 0, startKey)

    while true do
        local openEntry = popPriority(open)
        while openEntry ~= nil and scores[openEntry.key] ~= openEntry.priority do
            openEntry = popPriority(open)
        end
        if openEntry == nil then
            return nil, math.huge
        end
        local stateKey = openEntry.key

        local state = states[stateKey]
        if targetSet[state.node] then
            return rebuildRoute(stateKey, states, cameFrom), scores[stateKey]
        end

        local links = globalMap[state.node]
        if type(links) ~= "table" then
            return nil, math.huge
        end
        for _, nextNode in ipairs(getUsableLinks(state.node, links)) do
            if (not walkingOnly or getTransportType(state.node,nextNode)==nil)
                    and (not requireActionable or hasActionableEdge(state.node,nextNode)) then
                local transportType = getTransportType(state.node, nextNode)
                local segmentCost, exitPoint
                if transportType ~= nil then
                    segmentCost = tonumber(cost(state.node, nextNode)) or 1
                else
                    segmentCost, _, exitPoint = walkingSegment(state.node, nextNode,
                        state.x, state.y)
                end

                for _, entryPoint in ipairs(entryPointsFor(nextNode, state.node, exitPoint)) do
                    local nextKey = routeStateKey(nextNode, entryPoint.x, entryPoint.y)
                    local newCost = scores[stateKey] + segmentCost
                    if scores[nextKey] == nil or newCost < scores[nextKey] then
                        states[nextKey] = {
                            node = nextNode,
                            x = entryPoint.x,
                            y = entryPoint.y,
                        }
                        scores[nextKey] = newCost
                        cameFrom[nextKey] = stateKey
                        pushPriority(open, newCost, nextKey)
                    end
                end
            end
        end
    end
end

-- Graph-only mode needs two walking trees, not one full search per station.
-- Reuse the existing queue, edge/restriction checks and segment costs. Reverse
-- edges are only a planning index: they never add a traversable reverse link.
local function serviceWalkingTrees(startNode, targets, strict)
    local forward,reverse={},{}
    for source,links in pairs(globalMap) do
        for _,dest in ipairs(getUsableLinks(source,links)) do
            if not getTransportType(source,dest) and (not strict or hasActionableEdge(source,dest)) then
                local c=walkingSegment(source,dest,nil,nil)
                forward[source]=forward[source] or {}
                forward[source][#forward[source]+1]={node=dest,cost=c}
                reverse[dest]=reverse[dest] or {}
                reverse[dest][#reverse[dest]+1]={node=source,cost=c}
            end
        end
    end
    for _,graph in ipairs({forward,reverse}) do
        for _,links in pairs(graph) do table.sort(links,function(a,b) return a.node<b.node end) end
    end
    local function tree(starts,graph)
        local scores,parents,open={},{},newPriorityQueue()
        for _,n in ipairs(starts) do scores[n]=0; pushPriority(open,0,n) end
        while true do
            local entry=popPriority(open)
            if not entry then return scores,parents end
            if scores[entry.key]==entry.priority then
                for _,edge in ipairs(graph[entry.key] or {}) do
                    local c=entry.priority+edge.cost
                    if not scores[edge.node] or c<scores[edge.node] then
                        scores[edge.node]=c; parents[edge.node]=entry.key
                        pushPriority(open,c,edge.node)
                    end
                end
            end
        end
    end
    local accessCost,accessParents=tree({startNode},forward)
    local egressCost,egressParents=tree(targets,reverse)
    local function route(n,parents,backwards)
        local p={}
        while n do p[#p+1]=n; n=parents[n] end
        if backwards then
            for i=1,math.floor(#p/2) do p[i],p[#p-i+1]=p[#p-i+1],p[i] end
        end
        return p
    end
    return function(n) return accessCost[n] and route(n,accessParents,true),accessCost[n] end,
        function(n) return egressCost[n] and route(n,egressParents,false),egressCost[n] end
end

-- Opt-in service priority for harvesting. The usual query still minimizes the
-- original graph cost. For a fixed destination which otherwise needs no
-- service, compare authored access -> service -> egress candidates instead.
-- Access/egress cannot use another service; rejecting repeated nodes prevents
-- visiting a station merely to return to the same map (Forest -> Maze, etc.).
-- Prefer a service only when its access + egress reduces walking graph cost.
-- The service's configured weight is excluded from that progress check, so a
-- useful trip can still beat a lower-total-cost walk without forcing a local
-- PC -> subway -> another city -> original city/gym detour with unique nodes.
-- Never invent a station, override a disabled service, or change graph weights.
local function getRequestedTravelPath(startNode, targets, options)
    local strict=type(options)=="table" and options.requireActionable==true
    local path,pathCost=getTravelPath(startNode,targets,strict)
    if not path or #path<2 or type(options)~="table" or options.preferTransport~=true then
        return path,pathCost
    end
    for i=1,#path-1 do
        if getTransportType(path[i],path[i+1]) then return path,pathCost end
    end
    local services={}
    for source,links in pairs(globalMap) do
        for _,dest in ipairs(getUsableLinks(source,links)) do
            if getTransportType(source,dest) then services[#services+1]={source,dest} end
        end
    end
    if #services==0 then return path,pathCost end
    -- Stable tie-breaking; pairs() order must not decide which station to use.
    table.sort(services,function(a,b)
        if a[1]==b[1] then return a[2]<b[2] end
        return a[1]<b[1]
    end)
    local access,egress={},{}
    local accessRoute,egressRoute
    if USE_GRAPH_COST_ONLY then accessRoute,egressRoute=serviceWalkingTrees(startNode,targets,strict) end
    local best,bestCost
    for _,edge in ipairs(services) do
        local source,dest=edge[1],edge[2]
        if not access[source] then
            local p,c
            if accessRoute then p,c=accessRoute(source)
            else p,c=getTravelPath(startNode,{source},strict,true) end
            access[source]={path=p,cost=c}
        end
        if access[source].path then
            if not egress[dest] then
                local p,c
                if egressRoute then p,c=egressRoute(dest)
                else p,c=getTravelPath(dest,targets,strict,true) end
                egress[dest]={path=p,cost=c}
            end
            if egress[dest].path and access[source].cost+egress[dest].cost<pathCost then
                local c=access[source].cost+cost(source,dest)+egress[dest].cost
                if not bestCost or c<bestCost then
                    local candidate,seen={},{}
                    for _,n in ipairs(access[source].path) do
                        candidate[#candidate+1]=n; seen[n]=true
                    end
                    local unique=true
                    for _,n in ipairs(egress[dest].path) do
                        if seen[n] then unique=false; break end
                        candidate[#candidate+1]=n; seen[n]=true
                    end
                    if unique then best,bestCost=candidate,c end
                end
            end
        end
    end
    return best or path,bestCost or pathCost
end

local function buildWalkingCheckpoints(path)
    walkingCheckpoints = {}
    if type(path) ~= "table" then
        return
    end

    for index = 1, #path - 1 do
        local fromNode, toNode = path[index], path[index + 1]
        if getTransportType(fromNode, toNode) == nil then
            walkingCheckpoints[#walkingCheckpoints + 1] = {
                from = fromNode,
                to = toNode,
            }
        end
    end
end

local function logWalkingCheckpoints()
    if #walkingCheckpoints == 0 then
        return
    end

    local labels = {}
    for _, checkpoint in ipairs(walkingCheckpoints) do
        labels[#labels + 1] = checkpoint.from .. " -> " .. checkpoint.to
    end
    log("Pathfinder: walking checkpoints: " .. table.concat(labels, " | "))
end

local function errorInPath(from, toMap)
	local failedDestination = destStore
	local failedEdge = tostring(from) .. " -> " .. tostring(toMap)
	studioTrace("RESYNC", "Pathfinder route reset after an unexpected map transition")
	resetPath()
	studioPathfinder("Recovery", failedDestination, failedEdge,
		"Recalculating", "Unexpected map transition")
	Lib.log1time("Pathfinder --> Error in Path: from " .. from .. " to " .. toMap .. " -- Reset and Recalc")
	swapPokemon(getTeamSize(), getTeamSize() - 1)
end

-- try to move with exception, and with the map name if no exception are found.
local function movingApply(from, toMap)
	local completed = math.max(0, routeLength - #pathSolution)
	studioPathfinder("Routing", destStore, tostring(from) .. " -> " .. tostring(toMap),
		tostring(completed) .. " / " .. tostring(math.max(1, routeLength - 1)) .. " map edges", "")
	if not isSameMap(from, getMapName()) then
		-- Unexpectedly changed maps, could be due to black-out or moveToGrass/Water/NormalGround putting us on a link
		errorInPath(from, toMap)
		return true
	end
	navigationLog("progress", "Path: Maps Remains: " .. #pathSolution .. "  Moving To: --> " .. toMap)
	if handleException(from, toMap) then
		return true
	end

	local mapLink, checkpointSource = getAuthoredLinkTargets(from, toMap)
	if mapLink then
		local target = getNearestMapLink(mapLink, getPlayerX(), getPlayerY())
		if target == nil then
			studioPathfinder("Failed", destStore, tostring(from) .. " -> " .. tostring(toMap),
				"Blocked", "No usable walking checkpoint")
			studioTrace("ERROR", "Pathfinder found no usable walking checkpoint")
			log("Pathfinder: no usable walking checkpoint for "
				.. tostring(from) .. " -> " .. tostring(toMap) .. ".")
			return false
		elseif #target == 2 then
			navigationLog("checkpoint", "Pathfinder: authored checkpoint source="
				.. tostring(checkpointSource) .. "; edge=" .. tostring(from)
				.. " -> " .. tostring(toMap) .. ".")
			return moveToCell(target[1], target[2])
		end
		navigationLog("checkpoint", "Pathfinder: authored checkpoint source="
			.. tostring(checkpointSource) .. "; edge=" .. tostring(from)
			.. " -> " .. tostring(toMap) .. ".")
		return moveToRectangle(target[1], target[2], target[3], target[4])
	end

	-- The graph can know that two maps are connected while the authored
	-- MapLink database still lacks the source coordinate. Returning true here
	-- used to report a successful Lua action without queuing movement, causing
	-- the bot to stop with "No action executed". Continue only through an
	-- unambiguous live link frontier; otherwise fail explicitly rather than
	-- silently becoming idle.
	local exploring, stallReason = cellCrawl.moveToFrontier(from, toMap, destStore)
	if exploring then
		studioPathfinder("Exploring", destStore,
			tostring(from) .. " -> " .. tostring(toMap),
			"Moving to frontier", "Missing authored map-link coordinate")
		return true
	end

	studioPathfinder("Failed", destStore,
		tostring(from) .. " -> " .. tostring(toMap),
		"Blocked", tostring(stallReason or "No actionable checkpoint"))
	studioTrace("ERROR", "Pathfinder stalled before " .. tostring(from)
		.. " -> " .. tostring(toMap) .. ": " .. tostring(stallReason))
	error("Pathfinder --> Cannot continue " .. tostring(from) .. " -> "
		.. tostring(toMap) .. ": no authored checkpoint and no safe frontier ("
		.. tostring(stallReason or "unknown") .. ").")
end

-- remove already crossed nodes then try to move
local function moveWithCalcPath()
    if #pathSolution > 0 then
        if pathSolution[1] == playerNode then
            table.remove(pathSolution, 1)
            from, toMap = getNextNodes()
            if #pathSolution > 0 then
                return movingApply(from, toMap)
            end
            log("Pathfinder: Destination Reached.")
			studioPathfinder("Complete", destStore, "", "Complete", "")
			studioTrace("ROUTE COMPLETE", destStore)
			-- Release dialog ownership as soon as the authoritative map reaches
			-- the destination. Questing remains responsible for the next step.
			from = nil
			toMap = nil
            return false
        else
            return movingApply(from, toMap)
        end
    end
    return false
end

---------------------------
-------- SETTINGS ---------
---------------------------

-- check if the player can use TM / HM moves.
local function validateAbilitiesIndex(dirtyList, abilityList)
    local pokeIndexTable = {}
    local teamSize = getTeamSize()
    for ability, happinessReq in pairs(abilityList) do
        if ability == "dig" and hasItem("Shovel") then
            pokeIndexTable[ability] = 1
        elseif ability == "cut" and hasItem("Tree Axe") then
            pokeIndexTable[ability] = 1
        elseif ability == "rock smash" and hasItem("Pick Axe") then
            pokeIndexTable[ability] = 1
        elseif ability == "surf" then
            pokeIndexTable[ability] = 1
        else
             local pokeIndex = dirtyList[ability]
            if not pokeIndex or teamSize < pokeIndex or not hasMove(pokeIndex, ability) or not (getPokemonHappiness(pokeIndex) > happinessReq) then
                pokeIndexTable[ability] = Game.getPokemonNumberWithMove(ability, happinessReq)
            else pokeIndexTable[ability] = pokeIndex
            end
        end

    end
    return pokeIndexTable
end

-- Snapshot the small restriction-item list at each route calculation.
-- Replacing the table while skipping old true entries erased owned items on
-- alternate calls (e.g. getPath -> moveTo incorrectly lost Bicycle).
-- Re-read authoritative inventory so consumed/removed items do not stay true.
local function validateItems(_currentItems, items)
    local accountItems = {}
    for _, item in ipairs(items) do
        accountItems[item] = hasItem(item)
    end
    return accountItems
end

-- init setting on start, uses preset and bot team / items
local function initSettings(ss)
    settings.abilitiesIndex = validateAbilitiesIndex({}, moveAbilities)
    settings.mount = ss.MOUNT
    settings.dig = true
    settings.workOpts = {
    ["dig"] = ss.DIG,
    ["harvest"] = ss.HARVEST,
    ["headbutt"] = ss.HEADBUTT,
    ["discover"] = ss.DISCOVER
    }
    settings.transportConfigured = {
        subway = ss.USE_SUBWAY ~= false,
        teleport = ss.USE_TELEPORT ~= false,
    }
    if settings.workOpts.headbutt and not Game.getPokemonNumberWithMove("Headbutt", 151) then
        log("Pathfinder: Warning, cannot Headbutt trees.")
    end
    if settings.workOpts.dig and not Game.getPokemonNumberWithMove("Dig", 151) then
        log("Pathfinder: Warning, cannot Dig.")
    end
    refreshTransportAvailability()
end

-- try to find a path changing settings
local function findSettings(dest)
    local message = "Pathfinder --> Path Not Found ERROR. From " .. playerNode .. " to " .. destStore .. "."

    for ability, _ in pairs(moveAbilities) do
        if not settings.abilitiesIndex[ability] then
            settings.abilitiesIndex[ability] = 1
            if simpleAStar(goal(dest))(playerNode) then
                error(message .. " A Pokemon with the move " .. ability .. " would open a path.")
            end
        end
    end
    for _, item in ipairs(moveItems) do
        if not settings.accountItems[item] then
            settings.accountItems[item] = 1
            if simpleAStar(goal(dest))(playerNode) then
                error(message .. " Item: " .. item .. " would open a path.")
            end
        end
    end
    error(message)
end

-- main function called by users
-- Use these setters (rather than the globals) when Pathfinder owns navigation.
-- Its pre-route item and GameClient's per-step remount must select the same item,
-- including when one queued route crosses from Surf onto land. Do not rewrite
-- Static_Settings or change legacy scripts which explicitly clear setMount("").
local function setGroundMount(mount)
    if type(mount) ~= "string" or (mount ~= "" and not hasItem(mount))
        or type(setMount) ~= "function" then return false end
    if not setMount(mount) then return false end
    settings.mount = mount
    return true
end

local function setSurfMount(mount)
    if type(mount) ~= "string" or (mount ~= "" and not hasItem(mount))
        or type(setWaterMount) ~= "function" then return false end
    -- Configuration only: the existing client owns Surf eligibility, entering
    -- water and the authoritative mount response. Never use a water item on land.
    return setWaterMount(mount)
end

local function useMount()
    if type(settings.mount) ~= "string" or settings.mount == "" then return false end
    return Lib.useMount(settings.mount)
end

local function moveTo(map, dest, options)
	if not dest then
		dest = map
		map = getMapName()
	end
	refreshTransportAvailability()
	local policy=type(options)=="table" and
		(tostring(options.requireActionable==true)..":"..tostring(options.preferTransport==true)
		..":"..tostring(options.digFallback==true)) or "false:false:false"
	playerNode = getPlayerNode(map)
	dest = mapsToNodes(dest)
	if useMount() then
		return true
	elseif checkOutlet() then
		return true
	elseif Work.isWorking(map, settings.workOpts) then

		return true
	elseif destStore == table.concat(dest, " | ") and routePolicyStore==policy then
		return moveWithCalcPath()
	else
		digFallbackActive=type(options)=="table" and options.digFallback==true
		settings.abilitiesIndex = validateAbilitiesIndex(settings.abilitiesIndex, moveAbilities)
		settings.accountItems = validateItems(settings.accountItems, moveItems)
		local requestedDestination = table.concat(dest, " | ")
		local routeCost = nil
		pathSolution, routeCost = getRequestedTravelPath(playerNode, dest, options)
		if not pathSolution then
			local exploring = cellCrawl.moveToFrontier(playerNode, nil,
				requestedDestination)
			if exploring then
				-- Keep destStore different so the newly learned graph edge causes a
				-- complete route recalculation on the next Lua path tick.
				destStore = ""
				routePolicyStore = ""
				studioPathfinder("Exploring", requestedDestination, "",
					"Moving to frontier", "No graph route with current links")
				return true
			end
			destStore = requestedDestination
			routePolicyStore = policy
			studioPathfinder("Failed", destStore, "", "No route", "Path not found")
			studioTrace("ERROR", "Pathfinder route not found: " .. destStore)
			return findSettings(dest)
		end
		destStore = requestedDestination
		routePolicyStore = policy
		lastProgressLog,lastCheckpointLog = nil,nil
		routeLength = #pathSolution
		Lib.log1time("Pathfinder diagnostic: destination=" .. destStore
			.. "; " .. tostring(cellCrawl.getKnowledgeSummary())
			.. "; routeResult=found; routeNodes=" .. tostring(routeLength)
			.. "; routeCost=" .. tostring(routeCost or "unknown")
			.. (type(options)=="table" and options.preferTransport==true and "; transportPolicy=prefer" or "") .. ".")
		studioPathfinder("Routing", destStore, tostring(playerNode),
			"0 / " .. tostring(math.max(1, routeLength - 1)) .. " map edges", "")
		studioTrace("ROUTE START", tostring(playerNode) .. " -> " .. destStore)
		buildWalkingCheckpoints(pathSolution)
		log("Path: " .. table.concat(pathSolution,"->"))
		if settings.transportAvailable.subway == false
			or settings.transportAvailable.teleport == false then
			logWalkingCheckpoints()
		end
		return moveWithCalcPath()
	end
	return false
end

local function getPath(start, dest, options)
	refreshTransportAvailability()
    settings.abilitiesIndex = validateAbilitiesIndex(settings.abilitiesIndex, moveAbilities)
    settings.accountItems = validateItems(settings.accountItems, moveItems)
    return getRequestedTravelPath(canonicalMapName(start), mapsToNodes(dest),options)
end


-- allow user control for digway shortcuts
local function enableDigPath()
    settings.dig = true
    log("Pathfinder: Dig paths enabled.")
end

local function disableDigPath()
    settings.dig = false
    log("Pathfinder: Dig paths disabled.")
end

local function isDigPathEnabled()
    return settings.dig
end
------------------------
--- GOAL FOR POKEMON -----
------------------------
local function mapsToNodes2(mapList)
    local nodeList = {}
    if type(mapList) == "string" then
        mapList = {mapList}
    end
    for _, map in pairs(mapList) do
        if subMaps[map] then  -- if the map has sub maps
            for submap, _ in pairs(subMaps[map]) do
                table.insert(nodeList, submap)
            end
        elseif globalMap[map] then
            table.insert(nodeList, map)
        end
    end
    return nodeList
end

local DEFAULT_HUNT_CANDIDATE_LIMIT = 40
local MAX_HUNT_CANDIDATE_LIMIT = 64
local tierPriority = { Common = 1, Uncommon = 2, Rare = 3 }

local function getTierValue(data)
    return tierPriority[data.Tier] or 4
end

local function isBetterSpawnCandidate(candidate, current)
    local candidateTier = getTierValue(candidate)
    local currentTier = getTierValue(current)
    if candidateTier ~= currentTier then
        return candidateTier < currentTier
    end
    if candidate.MapType ~= current.MapType then
        return candidate.MapType == "Land"
    end
    return candidate.Map < current.Map
end

local function collectSpawnCandidates(spawnList, isDay, isNoon, isNight,
        isAccountMember, maxLoop)
    local candidatesByMap = {}
    local eligibleCount = 0
    local memberAccount = isAccountMember == true or tonumber(isAccountMember) == 1

    for _, data in ipairs(spawnList) do
        -- A 1 means that period is acceptable. Passing 1,1,1 therefore means
        -- "any time", which is what DailySolaceon requests.
        local timeOk = (tonumber(isDay) == 1 and data.Day == 1)
            or (tonumber(isNoon) == 1 and data.Morning == 1)
            or (tonumber(isNight) == 1 and data.Night == 1)
        local canUseSpawn = not data.FishingOnly or data.FishingOnly == 0

        if timeOk and canUseSpawn and (memberAccount or not data.MemberOnly) then
            eligibleCount = eligibleCount + 1
            local current = candidatesByMap[data.Map]
            if current == nil or isBetterSpawnCandidate(data, current) then
                candidatesByMap[data.Map] = data
            end
        end
    end

    local candidates = {}
    for _, data in pairs(candidatesByMap) do
        candidates[#candidates + 1] = data
    end
    table.sort(candidates, function(a, b)
        local tierA = getTierValue(a)
        local tierB = getTierValue(b)
        if tierA ~= tierB then
            return tierA < tierB
        end
        if a.Map ~= b.Map then
            return a.Map < b.Map
        end
        return a.MapType < b.MapType
    end)

    local requestedLimit = math.floor(tonumber(maxLoop)
        or DEFAULT_HUNT_CANDIDATE_LIMIT)
    requestedLimit = math.max(1, math.min(requestedLimit,
        MAX_HUNT_CANDIDATE_LIMIT))
    while #candidates > requestedLimit do
        candidates[#candidates] = nil
    end

    return candidates, eligibleCount
end

local function findNearestCandidateForTier(start, candidates, tierValue)
    local candidateByNode = {}

    for _, data in ipairs(candidates) do
        if getTierValue(data) == tierValue then
            for _, node in ipairs(mapsToNodes2(data.Map)) do
                local current = candidateByNode[node]
                if current == nil or isBetterSpawnCandidate(data, current) then
                    candidateByNode[node] = data
                end
            end
        end
    end

    if next(candidateByNode) == nil then
        return nil
    end

    local targetNodes = {}
    for node in pairs(candidateByNode) do
        targetNodes[#targetNodes + 1] = node
    end
    local path, cost = getTravelPath(start, targetNodes)
    if not path or #path == 0 then
        return nil
    end

    if cost == nil then
        cost = #path - 1
    end
    return candidateByNode[path[#path]], path, cost
end

-- Find a hunting map without sorting/mutating the shared spawn list or running
-- one A* search per entry. At most MAX_HUNT_CANDIDATE_LIMIT unique maps are
-- considered and a multi-target search is performed once per rarity tier.
local function getMapToPokemon(start, pokemonName, isDay, isNoon, isNight,
        isAccountMember, maxLoop)
    local bestMap, bestPath, bestCost, mapType = nil, nil, math.huge, nil
    local bestTierValue = math.huge
    local spawnList = getSpawnDataIndex()[pokemonName]
    if not spawnList or #spawnList == 0 then
        log("No spawn data for " .. tostring(pokemonName) .. ".")
        return nil
    end

    local candidates, eligibleCount = collectSpawnCandidates(spawnList,
        isDay, isNoon, isNight, isAccountMember, maxLoop)
    if #candidates == 0 then
        log("No eligible non-fishing spawn for " .. tostring(pokemonName) .. ".")
        return nil
    end

    -- Account traversal capabilities are invariant during this lookup.
    refreshTransportAvailability()
    settings.abilitiesIndex = validateAbilitiesIndex(settings.abilitiesIndex,
        moveAbilities)
    settings.accountItems = validateItems(settings.accountItems, moveItems)

    -- Preserve the old cost-first, tier-on-tie behavior without emitting a log
    -- for every individual spawn/map candidate.
    for tierValue = 1, 4 do
        local data, path, cost = findNearestCandidateForTier(start,
            candidates, tierValue)
        if data and ((cost < bestCost)
                or (cost == bestCost and tierValue < bestTierValue)) then
            bestMap = data.Map
            bestPath = path
            bestCost = cost
            mapType = data.MapType
            bestTierValue = tierValue
        end
    end

    if bestMap then
        log(string.format(
            "Pokemon hunt route: %s -> %s (cost=%s, candidates=%d/%d).",
            tostring(pokemonName), tostring(bestMap), tostring(bestCost),
            #candidates, eligibleCount))
    else
        log("No reachable spawn map for " .. tostring(pokemonName) .. ".")
    end

    return bestMap, bestPath, bestCost, mapType
end

------------------------
local pfData     = {
resetPath        = resetPath,
skipUnavailableDigway = function(reason)
    if not digFallbackActive or not exceptionExist(digways,from,toMap) then return false end
    skipUnavailableDigway(from,toMap,reason)
    return true
end,
enableDigPath    = enableDigPath,
disableDigPath   = disableDigPath,
isDigPathEnabled = isDigPathEnabled,
exceptionExist   = exceptionExist,
setOutlet        = setOutlet,
unsetOutlet      = unsetOutlet,
outletInNode     = outletInNode,
isSubwayPath     = isSubwayPath,
}

------------------------
-------- HOOKS ---------
------------------------

-- we handle dialogs in DialogSolver
local function onPathfinderDialogMessage(message, choices)
	-- Loading Pathfinder into a quest script must not make it answer unrelated
	-- quest, evolution, HM, or transport dialogs. It owns dialogs only while a
	-- Pathfinder route has an active edge.
	if from == nil or toMap == nil then
		return false
	end
    pfData.from = from
    pfData.toMap = toMap
    pfData.abilitiesIndex = settings.abilitiesIndex
    -- Current host supplies selection prompts/choices in the existing second
    -- callback argument. Keep one-argument scripts and ordinary text intact.
    if (message==nil or message=="") and type(choices)=="table" then
        message=type(choices.prompt)=="string" and choices.prompt or ""
    end
    dialogSolver.solveDialog(message, pfData, choices)
end

local function onPathfinderSystemMessage(message)
    if stringContains(message, "Your Safari Time is over!") then resetPath() end
end

-- load map and settings
local function onPathfinderStart()
    blockedDigways={}
    digFallbackActive=false
    local graph,regions = _globalMap()
    globalMap = assert(graph, "Pathfinder --> Error : failed to load map")
    mapRegions = regions or {}
    local ss = assert(_ss(), "Pathfinder --> Error : failed to load settings")
    npcExceptions = _npcExceptions()
    cellCrawl.attachPathfinder(globalMap, getMapNode)
    initSettings(ss)
end

-- reset path on stop
local function onPathfinderStop()
    resetPath()
    blockedDigways={}
end

registerHook("onStart", onPathfinderStart)
registerHook("onDialogMessage", onPathfinderDialogMessage)
registerHook("onSystemMessage", onPathfinderSystemMessage)
registerHook("onStop", onPathfinderStop)

-- return table for users
return {
	moveTo = moveTo,
    setMount = setGroundMount,
    setWaterMount = setSurfMount,
    useMount = useMount,
    getMapNode = getMapNode,
    getRegion = function(node)
        node=canonicalMapName(node or getMapName())
        return mapRegions[node] or mapRegions[node:gsub("_%u$", "")]
    end,
    isSameMap = isSameMap,
	getPath = getPath,
	enableDigPath = enableDigPath,
	disableDigPath = disableDigPath,
	isDigPathEnabled = isDigPathEnabled,
	mapName = getPlayerNode,
    isDestination = isDestination,
    getMapToPokemon = getMapToPokemon,
    getWalkingCheckpoints = function() return walkingCheckpoints end,
    getLearnedMapLinks = cellCrawl.getLearnedLinks,
    logLearnedMapLinks = cellCrawl.logLearnedLinks,
    setCellCrawlLinkDistance = cellCrawl.setMaxSourceLinkDistance,
}
