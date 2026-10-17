local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local Maybe                 = require (cppdpath .. "Lib/Maybe")
local Lib                   = require (cppdpath .. "Lib/Lib")
local _npcExceptions        = require (cppdpath .. "Maps/MapExceptions/NpcExceptions")
local elevators             = require (cppdpath .. "Maps/MapExceptions/Elevators")
local digways               = require (cppdpath .. "Maps/MapExceptions/Digways")
local transportConfig       = require (cppdpath .. "Maps/MapExceptions/Transmats")
local transportDestinations = transportConfig.destinations


local digUndiscovered       = "I better not venture in"
local useDigway             = {"Do you want to attempt to use it?", "Do you want to attempt to use it? It leads to one of these outlets.","Where do you want to go?"}
local digIntroduction       = "It looks like this burrow could potentially be used to bypass the cave."
local digState              = {}
local function resetDigState()
    digState = {}
end
local useDive               = {"These look like deeper waters. Do you want to Dive here?", "Do you want to Dive here?", "Do you want to go to the surface?"}
local transportState        = {
    subway = {destination = nil, page = 1},
    teleport = {destination = nil, page = 1},
}

local function solveNpc(message, n1, n2)
    local npcExce = npcExceptions[n1][n2]

    assert(npcExce[2] and npcExce[3], "PathFinder --> npc dialog exception is missing some data. " .. n1 .. " -> " .. n2)
    if string.upper(message) == string.upper(npcExce[3]) then
        pushDialogAnswer(npcExce[2])
        log("Pathfinder: Pushing dialog: " .. npcExce[2])
    end
end

local function solveElevator(message, n1, n2)
    local exce = elevators[n1][n2]
    local pushLog = "Pathfinder: Pushing dialog:"
    assert(exce[2] and exce[3] and exce[4] and Maybe.isJust(exce[5] and exce[6]), "PathFinder --> elevator dialog exception is missing some data. " .. n1 .. " -> " .. n2)
    if message == exce[3] then
        for _, push in pairs(exce[2]) do
            pushDialogAnswer(push)
            pushLog = pushLog .. " " .. push
        end
        log(pushLog)
    elseif message == exce[4] then
        exce[5] = true
    end
end

local function digChoiceText(value)
    if type(value)~="string" then return "" end
    return value:gsub("%[%x+%]",""):gsub("%[%-%]","")
        :gsub("^%s+",""):gsub("%s+$",""):gsub("%s+"," "):lower()
end

-- Some menus carry numbered labels, or a whole numbered list in one choice.
-- Keep the authoritative order/index; never substitute the old static answer.
local function readDigChoices(choices)
    if type(choices)~="table" or #choices==0 then return nil,"choices missing" end
    if #choices>16 then return nil,"too many choices" end
    local parsed, numbered = {}, nil
    for _,choice in ipairs(choices) do
        if type(choice)~="string" or #choice>2048 then return nil,"invalid choice" end
        if digChoiceText(choice)=="" then return nil,"empty choice" end
        for line in (choice:gsub("\r\n","\n"):gsub("\r","\n").."\n"):gmatch("(.-)\n") do
            local text=digChoiceText(line)
            if text~="" then
                local index,label=text:match("^(%d+)[%.)]%s*(.+)$")
                local isNumbered=index~=nil
                if numbered~=nil and numbered~=isNumbered then return nil,"mixed menu format" end
                numbered=isNumbered
                if #parsed>=16 or (index and tonumber(index)~=#parsed+1) then
                    return nil,"ambiguous menu indexes"
                end
                -- Plain choices must be individual entries, not an unnumbered
                -- multiline blob whose server index mapping is unknown.
                if not isNumbered and choice:find("[\r\n]") then return nil,"unnumbered list" end
                parsed[#parsed+1]=label or text
            end
        end
    end
    if #parsed==0 then return nil,"empty menu" end
    return parsed
end

-- A shared burrow can deliver the question and its menu in separate callbacks.
-- LuaScript also puts options[0] in choices.prompt, even when it is the first
-- outlet (or the entire numbered list), not a repeated question. Restore it
-- locally; do not change the callback contract for other scripts/dialogs.
local function splitDigChoices(n1, message, choices)
    local head = message
    if (head == nil or head == "") and type(choices) == "table" then
        head = choices.prompt
    end
    head = type(head) == "string" and head or ""
    local text = digChoiceText(head)
    if not text:match("^%d+[%.)]%s*") then
        -- Unnumbered options must have a known outlet in the prompt field;
        -- an ordinary question/party selector must not become a Dig menu.
        if type(choices) ~= "table" or #choices == 0 or choices.prompt ~= head then return nil end
        local known = text == "cancel"
        for destination, edge in pairs(digways[n1]) do
            if text == digChoiceText(edge.menuName or destination:gsub("_%u$", "")) then known = true end
        end
        if not known then return nil end
    end
    local menu = {head}
    if type(choices) == "table" then
        for i = 1, math.min(#choices, 17) do menu[#menu + 1] = choices[i] end
    end
    return menu
end

local function solveDigway(n1, n2, digIndex, message, choices, pf)
    local exce = digways[n1][n2]
    local pushLog = "Pathfinder: Pushing dialog:"
    assert(exce[1] and exce[2], "PathFinder --> digway exception is missing some data. " .. n1 .. " -> " .. n2)
    local outlets=0
    for _ in pairs(digways[n1]) do outlets=outlets+1 end
    if outlets>1 then
        -- Shared burrows list only available outlets. Static answer 2 may now
        -- mean Cancel, not Mt. Silver. Never prequeue that index at a prior
        -- yes/no prompt or guess when the authoritative menu lacks the target.
        if message~="Where do you want to go?" then
            resetDigState()
            digState.from, digState.to = n1, n2
            pushDialogAnswer(1)
            return true
        end
        if digState.phase == "selected" then return true end
        digState.from, digState.to, digState.phase = n1, n2, "waiting"
        if type(choices) ~= "table" or #choices == 0 then
            -- This is a question, not yet a selection menu. Queue nothing:
            -- status-1 continuation must not leave a stale 0 ahead of the
            -- outlet answer when the subsequent menu callback arrives.
            return true
        end
        local menu,reason=readDigChoices(choices)
        local selected,cancel,ambiguous
        local target=digChoiceText(exce.menuName or n2:gsub("_%u$",""))
        for i,text in ipairs(menu or {}) do
            if text==target then
                if selected then ambiguous=true end
                selected=i
            end
            if text=="cancel" then cancel=i end
        end
        if not selected or ambiguous then
            digState.phase = "selected"
            -- A fatal Lua callback alone leaves the host's default answer 1.
            -- Queue a known Cancel, or NON-slot 0 when the mapping is unknown.
            -- Server handling of 0 is unverified; never guess a destination.
            pushDialogAnswer(cancel or 0)
            if cancel and pf.skipUnavailableDigway
                and pf.skipUnavailableDigway("outlet khong co trong menu: "..n2) then
                return true
            end
            error("Pathfinder --> Cannot safely select Dig outlet "..n2..": "
                ..(reason or (ambiguous and "ambiguous destination" or "destination absent from menu")))
        end
        if not (type(digIndex)=="number" and digIndex%1==0 and digIndex>=1 and digIndex<=6) then
            digState.phase = "selected"
            pushDialogAnswer(cancel or 0)
            error("Pathfinder --> Invalid Dig party slot")
        end
        pushDialogAnswer(selected)
        pushDialogAnswer(digIndex)
        digState.phase = "selected"
        log("Pathfinder: Dig destination selected: "..n2.."; answer="..selected)
        return true
    end
    for _, push in pairs(exce[2]) do
        pushDialogAnswer(push)
        pushLog = pushLog .. " " .. push
    end
    pushDialogAnswer(digIndex)
    Lib.log1time(pushLog .. " " .. digIndex)
end

local function solveDive(diveIndex)
    pushDialogAnswer(1)
    pushDialogAnswer(diveIndex)
    log("Pathfinder: Pushing dialog: 1 " .. diveIndex)
end

local function solveOutlet(message, pf)
    if string.find(message, digUndiscovered) then
        if pf.skipUnavailableDigway and pf.skipUnavailableDigway("outlet chua mo") then return true end
        pf.disableDigPath()
        pf.setOutlet()
        pf.resetPath()
        return true
    elseif pf.outletInNode() then -- outlet discovered
        pf.unsetOutlet()
        pf.enableDigPath()
        pushDialogAnswer(2)
        log("Pathfinder: Pushing dialog: 2 (Not using the digway just discovered).")
        return true
    end
    return false
end

local function normalizeTransportText(value)
    if type(value) ~= "string" then
        return ""
    end

    local normalized = value:gsub("^%s+", ""):gsub("%s+$", "")
    normalized = normalized:gsub("%s+", " ")
    return string.lower(normalized)
end

local function transportTextContains(text, fragment)
    return string.find(text, fragment, 1, true) ~= nil
end

local function getTransportDestinationKey(destination, transport)
    if type(destination) ~= "string" then
        return nil
    end

    local key = destination:gsub("^%s+", ""):gsub("%s+$", "")
    if transport == "subway" then
        key = key:gsub("%s+[Ss]ubway$", "")
    end
    return transportDestinations[key] and key or nil
end

local function getTransportLocationName(destinationKey, transport)
    if destinationKey == nil then
        return nil
    end

    local location = string.lower(destinationKey)
    location = location:gsub("^pokecenter%s+", "")
    location = location:gsub("%s+pokecenter$", "")
    if transport == "subway" then
        location = location:gsub("%s+subway$", "")
    end
    return location
end

-- The client also says "already at the lobby" before displaying a new
-- Transmat menu. That is only a completed transport when the named lobby is
-- the requested destination; otherwise the following menu must still be read.
local function isTransportArrival(transport, text, destinationKey)
    local isArrival
    if transport == "subway" then
        isArrival = transportTextContains(text, "you have arrived at")
    else
        isArrival = transportTextContains(text, "you have been transported to the transmat-station lobby of")
            or transportTextContains(text, "you are detected to already be at the lobby of")
    end
    if not isArrival then
        return false
    end

    local location = getTransportLocationName(destinationKey, transport)
    return location ~= nil and transportTextContains(text, location)
end

local function isTransportPrompt(transport, text)
    if transport == "subway" then
        return transportTextContains(text, "where would you like to go?")
            or transportTextContains(text, "here are the other cities and towns you can go to")
    end

    return (transportTextContains(text, "where would you like to go?")
            and transportTextContains(text, "transmat"))
        or transportTextContains(text, "here are the other cities and towns you can go to")
end

local function resetTransportState(transport)
    transportState[transport] = {destination = nil, page = 1}
end

-- Detect and solve the dialog directly in the Pathfinder core. The configuration
-- remains data-only: it supplies only the target page and answer for a city.
local function solveTransport(transport, message, destination)
    local text = normalizeTransportText(message)
    if text == "" then
        return false
    end

    local state = transportState[transport]
    if state.destination ~= destination then
        state.destination = destination
        state.page = 1
    end

    local destinationKey = getTransportDestinationKey(destination, transport)
    if isTransportArrival(transport, text, destinationKey) then
        if transport == "teleport" and destinationKey ~= nil then
            transportDestinations[destinationKey].state = true
        end
        resetTransportState(transport)
        return true
    end

    if not isTransportPrompt(transport, text) or destinationKey == nil then
        return false
    end

    local target = transportDestinations[destinationKey]
    local answer
    local selected = state.page >= target.page
    if selected then
        answer = target.answer
        state.page = 1
    else
        local isSecondaryPage = transportTextContains(text, "here are the other cities and towns you can go to")
        answer = isSecondaryPage and 5 or 4
        state.page = state.page + 1
    end

    pushDialogAnswer(answer)
    if selected then
        log("Pathfinder: " .. transport .. " destination selected: " .. destinationKey)
    else
        log("Pathfinder: " .. transport .. " next page selected for " .. destinationKey)
    end
    return true
end
local function solveDialog(message, pf, choices)
    local n1 = pf.from
    local n2 = pf.toMap
    if digState.from ~= n1 or digState.to ~= n2 then resetDigState() end
    if pf.exceptionExist(npcExceptions, n1, n2) then
        return solveNpc(message, n1, n2)
    end
    if pf.exceptionExist(digways, n1, n2) and pf.isDigPathEnabled() then
        if message == digIntroduction then
            resetDigState()
            digState.from, digState.to = n1, n2
            return true
        elseif Lib.inTable(useDigway, message) then
            return solveDigway(n1, n2, pf.abilitiesIndex.dig, message, choices, pf)
        elseif digState.phase then
            local menu = splitDigChoices(n1, message, choices)
            if menu then
                return solveDigway(n1, n2, pf.abilitiesIndex.dig, "Where do you want to go?", menu, pf)
            end
        end
    end
    if Lib.inTable(useDive, message) then
        return solveDive(pf.abilitiesIndex.dive)
    elseif solveOutlet(message, pf) then
        return
    elseif pf.exceptionExist(elevators, n1, n2) then
        return solveElevator(message, n1, n2)
    elseif pf.isSubwayPath(n1, n2) then
        return solveTransport("subway", message, n2)
    elseif n1 == "Transmat Station" or n1 == "Transmat Station Sinnoh"
        or transportState.teleport.destination ~= nil then
        -- Keep the target recorded until the authoritative arrival dialog. Some
        -- servers update the path nodes before delivering that dialog.
        return solveTransport("teleport", message, transportState.teleport.destination or n2)
    end
end

local function onDialogSolverStart()
    resetDigState()
    npcExceptions = _npcExceptions()
    resetTransportState("subway")
    resetTransportState("teleport")
end

registerHook("onStart", onDialogSolverStart)
registerHook("onStop", resetDigState)

return { solveDialog = solveDialog }
