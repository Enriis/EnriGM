ESX.RegisterCommand('heal', {'helper', 'mod', 'admin', 'superadmin'}, function(xPlayer, args, showError)
	args.playerId.resetStatus('fame')
    args.playerId.resetStatus('sete')
    args.playerId.triggerEvent('dd_admin:healPlayer')
	if xPlayer then
		if args.playerId.source == xPlayer.source then
			xPlayer.showNotification('Ti sei curato' ,"success")
		else
			xPlayer.showNotification('Hai curato '..args.playerId.name..'', "success")
			args.playerId.showNotification('Il player '..xPlayer.getName()..' ti ha curato', "success")
		end
	end
end, true, {help = 'Completa la vita al Player', validate = true, arguments = {
	{name = 'playerId', help = 'The player id', type = 'player'}
}})
