local QBCore = exports['qb-core']:GetCoreObject()
local isGathering = false

-- helper: request an anim dict
local function ensureAnimDict(dict)
    RequestAnimDict(dict)
    local tries = 0
    while not HasAnimDictLoaded(dict) and tries < 200 do
        Wait(10)
        tries = tries + 1
    end
    return HasAnimDictLoaded(dict)
end

-- robust arg extractor (works with your qb-target single-table and others)
local function extractArgs(...)
    local a1, a2 = ...
    -- Your qb-target: sends ONE big table with .args or .data inside
    if type(a1) == "table" then
        if a1.args and type(a1.args) == "table" then return a1.args end
        if a1.data and type(a1.data) == "table" then return a1.data end
        if a1.item then return a1 end  -- some targets pass args directly
    end
    -- Standard qb-target: (entity, args)
    if type(a2) == "table" then
        if a2.args and type(a2.args) == "table" then return a2.args end
        if a2.data and type(a2.data) == "table" then return a2.data end
        if a2.item then return a2 end
    end
    return nil
end

-- Create all gathering zones from config
CreateThread(function()
    for i, v in ipairs(Config.GatheringLocations) do
        local zoneName = "gather_spot_" .. i

        local options = {
            {
                name = zoneName,
                icon = v.icon or "fas fa-hand-paper",
                label = v.label or ("Gather " .. v.item),
                event = "gathering:start",
                args = {
                    item = v.item,
                    loading = v.loading,
                    time = v.time or 5000,
                    anim = v.anim
                }
            }
        }

        if v.type == "box" then
            exports.ox_target:addBoxZone({
                name = zoneName,
                coords = v.coords,
                size = vec3(
                    v.length or 1.5,
                    v.width or 1.5,
                    v.height or 0.5
                ),
                rotation = v.heading or 0,
                debug = Config.Debug,
                options = options
            })

        elseif v.type == "circle" then
            exports.ox_target:addSphereZone({
                name = zoneName,
                coords = v.coords,
                radius = v.radius or 2.0,
                debug = Config.Debug,
                options = options
            })

        else
            print(("[GATHER][ERROR] Invalid zone type for index %d: %s"):format(i, tostring(v.type)))
        end
    end
end)

-- Ensure cleanup on resource stop
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    local ped = PlayerPedId()
    ClearPedTasksImmediately(ped)
    isGathering = false
end)

RegisterNetEvent("gathering:start", function(...)
    if isGathering then
        QBCore.Functions.Notify("You're already gathering.", "error")
        return
    end

    local args = extractArgs(...)
    if Config.Debug then
        print("[GATHER][DEBUG] event payload:", json.encode({...}))
        print("[GATHER][DEBUG] extracted args:", json.encode(args or {}))
    end

    if not args or not args.item or not args.time then
        QBCore.Functions.Notify("Invalid gathering data", "error")
        return
    end

    local ped = PlayerPedId()
    isGathering = true

    -- Start animation (NO freeze; progressbar will block input)
    local anim = args.anim or {}
    local startedAnim = false

    if anim.type == "scenario" and anim.name then
        TaskStartScenarioInPlace(ped, anim.name, 0, true)
        startedAnim = true
    elseif anim.type == "dict" and anim.dict and anim.clip then
        if ensureAnimDict(anim.dict) then
            -- Play looping anim; duration -1, we stop it when done
            TaskPlayAnim(ped, anim.dict, anim.clip, 3.0, -3.0, -1, anim.flag or 1, 0.0, false, false, false)
            startedAnim = true
        end
    else
        -- Fallback scenario if none provided
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
        startedAnim = true
    end

    if not startedAnim and Config.Debug then
        print("[GATHER][DEBUG] could not start animation; proceeding anyway")
    end

    QBCore.Functions.Progressbar("gathering_item", args.loading , args.time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- success
        ClearPedTasksImmediately(ped)
        isGathering = false
        TriggerServerEvent("gathering:giveItem", args.item)
    end, function() -- cancel
        ClearPedTasksImmediately(ped)
        isGathering = false
        QBCore.Functions.Notify("You stopped gathering.", "error")
    end)
end)
