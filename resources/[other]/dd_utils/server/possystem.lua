ESX.RegisterUsableItem("pos", function(source, cb, extra)
    TriggerClientEvent("dd_pos:scegliGiocatore", source)
end)

ESX.RegisterServerCallback("dd_pos:getCard", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local pac = xPlayer.getInventoryItem("crpacific").count
    local flee = xPlayer.getInventoryItem("crfleeca").count
    local array = {}
    if tonumber(pac) >= 1 then
        local slot = exports.ox_inventory:GetSlotIdWithItem(source, "crpacific", nil, true)
        local meta = exports.ox_inventory:GetSlot(source, slot)
        local metass = meta["metadata"]
        array[metass.namebk] = metass
    end
    if tonumber(flee) >= 1 then
        local slot = exports.ox_inventory:GetSlotIdWithItem(source, "crfleeca", nil, true)
        local meta = exports.ox_inventory:GetSlot(source, slot)
        local metass = meta["metadata"]
        array[metass.namebk] = metass
    end
    cb(array)
end)