local QBCore = exports['qb-core']:GetCoreObject()


local GatherItems = {}
for _, v in ipairs(Config.GatheringLocations) do
    GatherItems[v.item] = {
        minAmount = v.minAmount or 1,
        maxAmount = v.maxAmount or 1
    }
end

RegisterNetEvent("gathering:giveItem", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local itemData = GatherItems[item]
    if not itemData then
        print(("[GATHER] Invalid item attempted by %d: %s"):format(src, item))
        return
    end

    local amount = math.random(itemData.minAmount, itemData.maxAmount)
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('QBCore:Notify', src, ("You gathered %d %s(s)!"):format(amount, item), "success")
end)
