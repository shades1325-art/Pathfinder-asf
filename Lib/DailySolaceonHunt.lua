-- Daily-only routing/patrol policy. Pathfinder and the Core still own all movement.
local Hunt = {}
-- Four encounter cells total, i.e. at most three steps between endpoints.
local MAX_PATROL_CELLS = 4
-- The cached Sky Pillar 3F map has Outside=true but no grass; its existing
-- Land spawn rows use plain floor. Outside describes map presentation, not
-- encounter terrain. Keep this evidence-backed exception scoped to that floor
-- rather than assuming every outdoor town's normal ground has encounters.
local normalGroundLandMaps = {["Sky Pillar 3F"] = true}

function Hunt.new(pf, spawns, graph, submaps)
    local self = { blockedEdges = {}, rejected = {}, badCells = {} }

    local function key(x, y) return x .. ":" .. y end
    local function edge(a, b) return a .. "\n" .. b end
    local function resetPatrol()
        self.patrol, self.cells, self.cursor = nil, nil, 1
        self.badCells = {}
    end
    local function stop(reason)
        log("Daily Solaceon: " .. reason)
        return fatal("Daily Solaceon: " .. reason)
    end
    local function timeKey()
        return (isMorning() and "M" or "") .. (isNoon() and "D" or "")
            .. (isNight() and "N" or "") .. tostring(isAccountMember())
    end
    local function candidates(name)
        local result = {}
        for _, row in ipairs(spawns[name] or {}) do
            if tonumber(row.FishingOnly) == 0
                and (not row.MemberOnly or isAccountMember())
                and ((isMorning() and tonumber(row.Morning) == 1)
                    or (isNoon() and tonumber(row.Day) == 1)
                    or (isNight() and tonumber(row.Night) == 1))
                and (row.MapType == "Land" or row.MapType == "Surf") then
                local nodes = submaps[row.Map] or { [row.Map] = true }
                for node in pairs(nodes) do
                    if graph[node] and not self.rejected[node] then
                        -- Prefer land only when both encounter types share the same node.
                        if not result[node] or row.MapType == "Land" then
                            result[node] = row.MapType
                        end
                    end
                end
            end
        end
        return result
    end
    local function selectTarget(name, current)
        local options = candidates(name)
        local checks = 0
        while next(options) do
            local nodes = {}
            for node in pairs(options) do nodes[#nodes + 1] = node end
            table.sort(nodes)
            -- Reuse Pathfinder's weighted multi-target search, without a map-count cap.
            local route, cost = pf.getPath(current, nodes)
            checks = checks + 1
            if not route or #route == 0 then break end
            local destination, blocked = route[#route], false
            for i = 1, #route - 1 do
                if self.blockedEdges[edge(route[i], route[i + 1])] then blocked = true end
            end
            if not options[destination] then break end
            if not blocked then
                self.target = { node = destination, terrain = options[destination] }
                resetPatrol()
                log(string.format("Daily Solaceon: %s -> %s (%s, Pathfinder cost %.2f).",
                    name, destination, options[destination], cost or 0))
                return true
            end
            -- Do not alter the shared graph or guess how to bypass an NPC gate.
            options[destination] = nil
            self.rejected[destination] = true
            -- Many spawn nodes may share a blocked gate; do not run an
            -- unbounded number of global searches in a single callback.
            if checks >= 8 and next(options) then return nil end
        end
        return false
    end
    local function inNode(x, y)
        local ok, node = pcall(pf.getMapNode, getMapName(), x, y)
        return ok and node == self.target.node
    end
    local function validCell(x, y, terrain)
        return x >= 0 and y >= 0 and x <= getMapWidth() and y <= getMapHeight()
            and not self.badCells[key(x, y)] and getCellType(x, y) == terrain
            and not isNpcOnCell(x, y) and inNode(x, y)
    end
    local function safePath(x, y)
        local route = pf.getPathInMap(x, y)
        if not route then return false end
        for _, cell in ipairs(route) do
            if getCellType(cell.x, cell.y) == "Link" or not inNode(cell.x, cell.y) then
                return false
            end
        end
        return true
    end
    local function buildCells()
        local terrain = self.target.terrain == "Surf" and "Water" or "Grass"
        local cells = {}
        local function collect()
            for y = 0, getMapHeight() do
                for x = 0, getMapWidth() do
                    if validCell(x, y, terrain) then cells[#cells + 1] = { x = x, y = y } end
                end
            end
        end
        collect()
        -- Cave encounters use normal ground. Never roam arbitrary outdoor ground.
        if #cells == 0 and terrain == "Grass"
            and (not isOutside() or normalGroundLandMaps[getMapName()]) then
            terrain = "Normal Ground"
            collect()
        end
        local px, py = getPlayerX(), getPlayerY()
        table.sort(cells, function(a, b)
            local da, db = math.abs(a.x - px) + math.abs(a.y - py),
                math.abs(b.x - px) + math.abs(b.y - py)
            if da ~= db then return da < db end
            if a.y ~= b.y then return a.y < b.y end
            return a.x < b.x
        end)
        self.cells, self.terrain, self.cursor = cells, terrain, 1
    end
    local function patrol()
        if self.patrol then
            local a, b = self.patrol[1], self.patrol[#self.patrol]
            local valid = true
            for _,cell in ipairs(self.patrol) do
                if not validCell(cell.x,cell.y,self.terrain) then valid=false; break end
            end
            if valid then
                local dest = getPlayerX() == a.x and getPlayerY() == a.y and b or a
                -- Longer legs must not let Core's recalculated approach cross
                -- an exit/other region, even when starting on an endpoint.
                if safePath(dest.x, dest.y) and moveToCell(dest.x, dest.y) then return true end
                self.badCells[key(dest.x, dest.y)] = true
                self.patrol, self.cells = nil, nil
                return waitForState(250)
            end
            self.patrol, self.cells = nil, nil
        end
        if not self.cells then buildCells() end
        local directions = { {1, 0}, {0, 1}, {-1, 0}, {0, -1} }
        -- Bound expensive local path checks per tick; continue scanning next tick.
        local last = math.min(#self.cells, self.cursor + 23)
        for i = self.cursor, last do
            local a = self.cells[i]
            self.cursor = i + 1
            if validCell(a.x, a.y, self.terrain) then
                local strip
                for _, d in ipairs(directions) do
                    local candidate = {a}
                    for offset=1,MAX_PATROL_CELLS-1 do
                        local cell={x=a.x+d[1]*offset,y=a.y+d[2]*offset}
                        if not validCell(cell.x,cell.y,self.terrain) then break end
                        candidate[#candidate+1]=cell
                    end
                    if #candidate>=2 and (not strip or #candidate>#strip) then strip=candidate end
                end
                if strip then
                    local b=strip[#strip]
                    local dest = getPlayerX() == a.x and getPlayerY() == a.y and b or a
                    if safePath(dest.x, dest.y) then
                        if moveToCell(dest.x, dest.y) then
                            self.patrol = strip
                            log(string.format("Daily Solaceon: patrol %s (%d,%d) <-> (%d,%d), %d cells (limit %d).",
                                self.target.node, a.x, a.y, b.x, b.y,#strip,MAX_PATROL_CELLS))
                            return true
                        end
                        self.badCells[key(dest.x, dest.y)] = true
                        return waitForState(250)
                    end
                end
            end
        end
        if self.cursor <= #self.cells then return waitForState(1) end
        log("Daily Solaceon: no reachable encounter patrol on " .. self.target.node
            .. "; terrain="..tostring(self.terrain).."; candidates="..#self.cells
            .. "; outside="..tostring(isOutside()).."; selecting another node.")
        self.rejected[self.target.node], self.target = true, nil
        resetPatrol()
        return waitForState(1)
    end

    function self.step(name)
        if self.name ~= name or self.time ~= timeKey() then
            self.name, self.time, self.target = name, timeKey(), nil
            self.blockedEdges, self.rejected, self.failure = {}, {}, nil
            resetPatrol()
        end
        local current = pf.mapName()
        if not self.target then
            local selected = selectTarget(name, current)
            if selected == nil then return waitForState(1) end
            if not selected then
                return stop("no reachable non-fishing spawn for " .. name .. " at the current game time.")
            end
        end
        if current == self.target.node then
            self.failure = nil
            return patrol()
        end
        -- Travel must return here, even when it fails. Never hunt on the wrong node.
        local ok, moved = pcall(pf.moveTo, current, self.target.node)
        if ok and moved then
            self.failure = nil
            return true
        end
        local signature = current .. ":" .. key(getPlayerX(), getPlayerY()) .. ":" .. self.target.node
        if ok and self.failure ~= signature then
            self.failure = signature
            return waitForState(250) -- one retry for a rejected action, not encounter pacing
        end
        if not ok then log("Daily Solaceon: route failed: " .. tostring(moved)) end
        local route = pf.getPath(current, self.target.node)
        if route and route[2] then self.blockedEdges[edge(route[1], route[2])] = true end
        log("Daily Solaceon: blocked route from " .. current .. " to " .. self.target.node .. "; selecting another node.")
        self.rejected[self.target.node], self.target, self.failure = true, nil, nil
        resetPatrol()
        return waitForState(1)
    end
    return self
end

return Hunt
