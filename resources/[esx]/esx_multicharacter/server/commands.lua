RegisterCommand("aggiungiSlot", function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and args[1] then
		local id = tonumber(args[1])
		local xTarget = ESX.GetPlayerFromId(id)
		if xTarget then
			local identifier = xTarget.getIdentifier()
			if args[2] then
				local nSlot = tonumber(args[2])	
				if nSlot == 1 then nSlot = nSlot + 1 end
				local idagg = string.sub(identifier, 7)
				MySQL.update('INSERT INTO `multicharacter_slots` (`identifier`, `slots`) VALUES (?, ?)', {
					idagg,
					nSlot
				})
				xPlayer.showNotification("Hai aggiunto il pg "..nSlot.." a "..GetPlayerName(id))
			else
				print("Numero slot non inserito")
			end
		else
			print("Giocatore offline")
		end
	else
		print("player o args non inseriti")
	end
end)

RegisterCommand("rimuoviSlot", function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and args[1] then
		local id = tonumber(args[1])
		local xTarget = ESX.GetPlayerFromId(id)
		if xTarget then
			local identifier = xTarget.getIdentifier()
			local idagg = string.sub(identifier, 7)
			MySQL.update('DELETE FROM `multicharacter_slots` WHERE `identifier` = ?', {
				idagg
			})
			xPlayer.showNotification("Hai rimosso il pg a "..GetPlayerName(id))
			DropPlayer(id, "Rimozione PG. Riavvia FiveM e riconnettiti al server")
		else
			print("Giocatore offline")
		end
	else
		print("player o args non inseriti")
	end
end)


RegisterCommand("relog", function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(args[1])
	if args[1] then
		if xTarget then
			xPlayer.showNotification("Hai effettuato il relog al giocatore: "..xTarget.source)
			xTarget.showNotification("L' "..xPlayer.getGroup().." "..GetPlayerName(source).." ti ha effettuato il relog.")
			Wait(2000)
			xTarget.showNotification("Hai 10 secondi per terminare le tue attivita")
			Wait(10000)
			TriggerEvent('esx:playerLogout', xTarget.source)
		else
			xPlayer.showNotification("Il giocatore non è online")
		end
	else
		TriggerEvent('esx:playerLogout', source)
	end	
end)
