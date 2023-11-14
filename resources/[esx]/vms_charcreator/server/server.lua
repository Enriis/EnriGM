if Config.Core == "ESX" then
    ESX = Config.CoreExport()

    if Config.AdminCommand.Enabled then
        ESX.RegisterCommand(Config.AdminCommand.Name, Config.AdminCommand.Group, function(xPlayer, args, showError)
            if (args.playerId) then
                xPlayer.showNotification("Otworzono menu skin dla gracza " .. args.playerId)
                TriggerClientEvent('vms_charcreator:openCreator', args.playerId, nil, true)
            end
        end, true, {help = Config.AdminCommand.Help, validate = true, arguments = {
            {name = 'playerId', help = Config.AdminCommand.ArgHelp, type = 'number'}
        }})
    end
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()

    if Config.AdminCommand.Enabled then
        QBCore.Commands.Add(Config.AdminCommand.Name, Config.AdminCommand.Help, {{ 
            name = 'playerId', help = Config.AdminCommand.ArgHelp
        }}, true, function(source, args)
            if (args[1]) then
                TriggerClientEvent('vms_charcreator:openCreator', args[1], nil, true)
            end
        end, Config.AdminCommand.Group)
    end

    QBCore.Functions.CreateCallback('vms_charcreator:getCurrentSkin', function(source, cb)
        local Player = QBCore.Functions.GetPlayer(source)
        local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {Player.PlayerData.citizenid, 1})
        if result[1] then
            cb(result[1].skin)
        end
    end)
end