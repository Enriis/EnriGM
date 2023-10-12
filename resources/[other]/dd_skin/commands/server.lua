if Config.Commands.skin then
	RegisterCommand("skin", function (source, args)
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer and Config.GroupAllowist[xPlayer.getGroup()] then
			if args[1] ~= nil then 
				TriggerClientEvent("fleb5:menu/skin", tonumber(args[1]))
			else 
				TriggerClientEvent("fleb5:menu/skin", source)
			end
		else
			TriggerClientEvent("esx:showNotification", source, Config.Lang.notperms)
		end
	end)
end