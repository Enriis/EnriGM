RegisterServerEvent('fivem-appearance:save')
AddEventHandler('fivem-appearance:save', function(appearance)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET skin = @skin WHERE identifier = @identifier', {
		['@skin'] = json.encode(appearance),
		['@identifier'] = xPlayer.getIdentifier()
	})
end)

ESX.RegisterServerCallback('fivem-appearance:getPlayerSkin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.getIdentifier()
	}, function(users)
		local user, appearance = users[1]
		if user.skin then
			appearance = json.decode(user.skin)
		end
		cb(appearance)
	end)
end)

ESX.RegisterServerCallback('esx_skin:getPlayerSkin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.getIdentifier()
	}, function(users)
		local user, appearance = users[1]
		if user.skin then
			appearance = json.decode(user.skin)
		end
		cb(appearance)
	end)
end)

ESX.RegisterServerCallback('dd_skin:check-soldi', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() >= Config.NeededMoney then
        xPlayer.removeMoney(Config.NeededMoney)
        cb(true)
    else
		TriggerClientEvent("esx:showNotification", source, Config.Lang.notenaughcash)
        cb(false)
    end
end)


RegisterServerEvent("dd_skin:salvaOutfit", function(source, nome_outfit, pedModel, pedComponents, pedProps, job)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end
	if not job then
		MySQL.insert('INSERT INTO outfits (owner, nome, ped, components, props) VALUES (?, ?, ?, ?, ?)', {xPlayer.getIdentifier(), nome_outfit, pedModel, json.encode(pedComponents), json.encode(pedProps)}, function(rowsChanged)
			if rowsChanged > 0 then
				xPlayer.showNotification('Hai salvato il tuo outfit chiamato: '..nome_outfit..'', 'success')
			else
				xPlayer.showNotification('Impossibile salvare il tuo outfit chiamato: '..nome_outfit..'', 'error')
			end
		end)
	else
		MySQL.insert('INSERT INTO outfits (owner, nome, ped, components, props) VALUES (?, ?, ?, ?, ?)', {job, nome_outfit, pedModel, json.encode(pedComponents), json.encode(pedProps)}, function(rowsChanged)
			if rowsChanged > 0 then
				xPlayer.showNotification('Hai salvato il tuo outfit chiamato: '..nome_outfit..'', 'success')
			else
				xPlayer.showNotification('Impossibile salvare il tuo outfit chiamato: '..nome_outfit..'', 'error')
			end
		end)
	end
end)

RegisterServerEvent("dd_skin:eliminaOutfit", function(source, id, job)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end
	if not job then
		MySQL.update('DELETE FROM outfits WHERE owner = ? AND id = ?', {xPlayer.getIdentifier(), id}, function(rowsChanged)
			if rowsChanged > 0 then
				xPlayer.showNotification('Hai eliminato il tuo outfit', 'success')
			else
				xPlayer.showNotification('Impossibile eliminare il tuo outfit', 'error')
			end
		end)
	else
		MySQL.update('DELETE FROM outfits WHERE owner = ? AND id = ?', {job, id}, function(rowsChanged)
			if rowsChanged > 0 then
				xPlayer.showNotification('Hai eliminato il tuo outfit', 'success')
			else
				xPlayer.showNotification('Impossibile eliminare il tuo outfit', 'error')
			end
		end)
	end
end)

RegisterServerEvent("dd_skin:rinominaOutfit", function(source, id, nome, job)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end
	if not job then
		MySQL.execute("UPDATE outfits SET nome = @nome WHERE id = @id AND owner = @owner", {
			['@owner'] = xPlayer.getIdentifier(), 
			['@nome'] = nome, 
			['@id'] = id 
		})
	else
		MySQL.execute("UPDATE outfits SET nome = @nome WHERE id = @id AND owner = @owner", {
			['@owner'] = job, 
			['@nome'] = nome, 
			['@id'] = id 
		})
	end
	xPlayer.showNotification("Hai rinominato l'outfit in: "..nome, "success")
end)

ESX.RegisterServerCallback('dd_skin:getOutfits', function(source, cb, job)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end
	if not job then
		MySQL.query('SELECT * FROM outfits WHERE owner = ?', {xPlayer.getIdentifier()}, function(result)
			if result and (#result > 0) then
				cb(result)
			else
				cb(false)
			end
		end)
	else
		MySQL.query('SELECT * FROM outfits WHERE owner = ?', {job}, function(result)
			if result and (#result > 0) then
				cb(result)
			else
				cb(false)
			end
		end)
	end
end)

RegisterServerEvent("dd_skin:creaRichiesta:passout", function(source, id, ped, components, props, nome)
	TriggerClientEvent("dd_skin:riceventeRichiesta:outfit", id, ped, components, props, nome)
end)



--Borsone
RegisterServerEvent("dd_borsone:loadPlayerOutfits", function(pyid, val, nome)
	TriggerClientEvent("dd_borsone:indossa", pyid, val, nome)
end)