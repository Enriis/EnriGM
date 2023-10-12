ESX = exports.es_extended:getSharedObject()

local Morto = {}

AddEventHandler(Morte.EventLoaded,function (src,xPlayer)
    local pp = ESX.GetPlayerFromId(src)
    local identifier = pp.identifier
    if Morto[identifier] == nil then
        MySQL.Async.fetchAll('SELECT is_dead FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(result)
            if result[1].is_dead ~= nil then
                if result[1] ~= nil and result[1].is_dead == 1 then
                    Morto[identifier] = true
                elseif result[1] ~= nil and result[1].is_dead == 2 then
                    Morto[identifier] = 'knock'
                else
                    Morto[identifier] = false
                end
            end
            Wait(3500)
            TriggerClientEvent("dd_morte:updatedeath2",src,Morto[identifier])
        end)
    else
        Wait(3500)
        TriggerClientEvent("dd_morte:updatedeath2",src,Morto[identifier])        
    end
end)

RegisterServerEvent('dd_morte:removeItem',function(antic)
    local xPlayer = ESX.GetPlayerFromId(source)
    if antic == 'NxnMorteAC1234' then
        if xPlayer ~= nil then
            for i=1, #xPlayer.inventory, 1 do
                exports['ox_inventory']:ClearInventory(xPlayer.inventory[i])
                if xPlayer.inventory[i].count > 0 then
                    xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
                end
            end
            if xPlayer.getMoney() > 0 then
                xPlayer.removeMoney(xPlayer.getMoney())
            end
            MySQL.update('UPDATE users SET is_dead = @is_dead WHERE identifier = @ide', {['@is_dead'] = 0, ['@ide'] = xPlayer.identifier})
        end
    end
end)

ESX.RegisterUsableItem(Morte.BandageItemName, function(source)
    local _source  = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent("nxn_item", source, 'bandage')
    xPlayer.removeInventoryItem(Morte.BandageItemName, 1)
end)

RegisterServerEvent('dd_morte:UpdateDeathStatus',function(stato)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    Morto[xPlayer.identifier] = stato
end)

RegisterServerEvent("dd_morte:setHeal")
AddEventHandler("dd_morte:setHeal",function (data,target)
    local src = source
    if target == nil or target == 0 then target = src end
    if type(data) == 'table' then
        if data.removeitem then
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer.getInventoryItem(data.name) and xPlayer.getInventoryItem(data.name).count > 0 then
                xPlayer.removeInventoryItem(data.name, 1)
                TriggerClientEvent("dd_morte:updatedeath", target, true)
            else
                xPlayer.showNotification("Non hai un/a"..xPlayer.getInventoryItem(data.name).label)
            end 
        end
        if not data.revive then
            TriggerClientEvent("dd_morte:setHeal",target,data.health)
        else
            TriggerClientEvent("dd_morte:updatedeath",target,true)
        end
    elseif type(data) == 'boolean' or type(data) == 'number' then
        TriggerClientEvent("dd_morte:updatedeath", target, data)
    end
end)
 
RegisterCommand(Morte.ReviveAllCommand, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == 'admin' then
        for _, playerId in ipairs(ESX.GetPlayers()) do
            TriggerClientEvent("dd_morte:updatedeath",playerId,true)
        end 
    end
end)

RegisterCommand(Morte.ReviveCommand, function(src, args)
    if src == 0 or src == nil then
        TriggerClientEvent("dd_morte:updatedeath",tonumber(args[1]),true)
    else
        local xPlayer = ESX.GetPlayerFromId(src)
        for k,v in pairs(Morte.Permission) do
            if v == xPlayer.getGroup() then
                if #args > 0 and tonumber(args[1]) then
                    TriggerClientEvent("dd_morte:updatedeath",tonumber(args[1]),true)
                else 
                    TriggerClientEvent("dd_morte:updatedeath",src,true)
                end
            end
        end
    end
end)

AddEventHandler('playerDropped', function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    if identifier ~= nil then
        if Morto[identifier] == nil then
            Morto[identifier] = false
            MySQL.update('UPDATE users SET is_dead = @is_dead WHERE identifier = @ide', {['@ide'] = identifier, ['@is_dead'] = 0})
        else
            if Morto[identifier] == true then
                MySQL.update('UPDATE users SET is_dead = @is_dead WHERE identifier = @ide', {['@ide'] = identifier, ['@is_dead'] = 1})
            elseif Morto[identifier] == 'knock' then
                MySQL.update('UPDATE users SET is_dead = @is_dead WHERE identifier = @ide', {['@ide'] = identifier, ['@is_dead'] = 2})
            elseif Morto[identifier] == false then
                MySQL.update('UPDATE users SET is_dead = @is_dead WHERE identifier = @ide', {['@ide'] = identifier, ['@is_dead'] = 0})
            end
        end
    end
end)

RegisterNetEvent('dd_morte:rimuovi',function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        if xPlayer.getInventoryItem(item).count > 0 then
            xPlayer.removeInventoryItem(item, 1)
        end
    end
end)