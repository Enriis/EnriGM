ESX.RegisterUsableItem("pos", function(source, cb, extra)
    --TriggerClientEvent("dd_pos:scegliGiocatore", source)
    TriggerClientEvent("dd_pos:apriMenuCarte_Cl", source, 10000, "Menu 5x - 3x", "police", source)
end)

RegisterServerEvent("dd_pos:apriMenuCarte", function(source, id, importo, motivo, soc)
    TriggerClientEvent("dd_pos:apriMenuCarte_Cl", id, importo, motivo, soc, source)
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

RegisterServerEvent("dd_pos:paga", function(source, iban, bank, importo, motivo, soc, idPl, LabelBank)
    local xPlayer = ESX.GetPlayerFromId(source)
    local zTarget = ESX.GetPlayerFromId(idPl)
    local PlMoney = GetMoneyBankPL(xPlayer.getIdentifier(), bank)
    if tonumber(PlMoney) >= tonumber(importo) then
        EditMoneyIBAN(iban, "rem", importo)
        xPlayer.showNotification("Hai pagato "..importo.."$ per "..motivo.." da "..LabelBank, "success")
        zTarget.showNotification("Transazione approvata da "..importo.."$ per "..motivo, "success")
        TriggerEvent("dd_soc:posSystem", soc, importo)
    else
        xPlayer.showNotification("Non hai abbastanza soldi su questo conto", "error")
        zTarget.showNotification("Transazione NEGATA, Saldo insuffiscente", "error")
    end
end)

RegisterServerEvent("dd_pos:alert", function(source, target, tipo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local zTarget = ESX.GetPlayerFromId(target)
    if tipo == "nocr" then
        xPlayer.showNotification("Il giocatore: "..zTarget.getName().." non ha carte con se")
    elseif tipo == "pinerr" then
        xPlayer.showNotification("Il pin inserito dal giocatore non è corretto")
    end
end)