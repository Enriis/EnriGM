RegisterServerEvent("en_borsone:giveItem", function(source, id)
    local xPlayer = ESX.GetPlayerFromId(source)
    metadata = {}
    exports.ox_inventory:AddItem(id, "borsone", 1, metadata)
end)

ESX.RegisterUsableItem("borsone", function(source, sos, info)
    TriggerClientEvent("en_borsone:apriMenu", source, info.metadata, info.slot)
end)

RegisterServerEvent('dd_borsone:saveOutfits', function(source, slot, nome, pedmodel, components, props)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = exports.ox_inventory:GetSlot(source, slot)
    local metass = items["metadata"]
    metass[nome] = {
        ped = pedmodel,
        components = components,
        props = props
    }
    exports.ox_inventory:SetMetadata(source, slot, metass)
end)

RegisterServerEvent("dd_borsone:elimina", function(source, nome, slot)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = exports.ox_inventory:GetSlot(source, slot)
    local metass = items["metadata"]
    if metass[nome] then
        metass[nome] = nil
    else
        xPlayer.showNotification("Completo non trovato, riporovare", "info")
    end
    exports.ox_inventory:SetMetadata(source, slot, metass)
end)