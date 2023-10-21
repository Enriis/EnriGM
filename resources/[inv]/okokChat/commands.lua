local chatMuted = {}


RegisterCommand('clear', function(source, args, rawCommand)
	TriggerClientEvent('chat:client:ClearChat', source)
end)

--[[local chatAdmins = {}
AddEventHandler('esx:playerLoaded',function(playerId, xPlayer)
	if xPlayer then
		local xGroup = xPlayer.getGroup()
		if xGroup then
			if xGroup ~= 'user' and xGroup ~= 'streamer' then
				if chatAdmins[xPlayer.identifier] == nil then
					chatAdmins[xPlayer.identifier] = {}
				end
				table.insert(chatAdmins[xPlayer.identifier], {name = xPlayer.getName(), src = playerId, group = xGroup})
			end
		end
	end
end)]]

local BannedWords = {
	'negro',
	'negr0',
	'negri',
	'n3gr1',
	'negr1',
	'negraccio',
	'negracci',
	'frocio',
	'gay',
	'g4y',
	'duce',
	'hitler',
	'h1tler',
	'dump',
	'cheats',
	'cheat',
	'n3gr0',
	'dumper',
	'impero',
	'vanquest',
	'iprp',
	'nazista',
	'discepoli',
	'coglioni',
	'ebreo',
	'3br30',
	'ebr3o',
	'3bre0',
	'paguri',
	'negra',
	'obeso',
	'obesa',
	'mongolo',
	'ricchione',
	'falkon',
	'disabile',
	'imperiale',
	'down',
	'duce',
	'duc3',
	'dux',
	'porcodio',
	'bocchini',
	'b0cchin1',
	'ritardato',
	'mussolini',
	'mussolin1',
	'muss0lin1',
	'muss0l1n1',
	'stalin',
	'stal1n',
	'rdm',
	'powergame',
	'modder',
	'staff',
	'richiamo',
	'admin',
	'angelo',
	'angioletto',
	'gesu',
	'assist',
}

RegisterCommand('clearall', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local time = os.date(Config.DateFormat)
		if isAdmin(xPlayer) then
			TriggerClientEvent('chat:client:ClearChat', -1)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">ARTEMIS</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{0}</span></b><div style="margin-top: 5px; font-weight: 300;">La chat è stata cancellata</div></div>',
				args = {time}
			})
		end
	end
end)

RegisterCommand('staff', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local length = string.len('staff')
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		if isAdmin(xPlayer) then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message staff"><i class="fas fa-exclamation-triangle"></i> <b><span style="color: #d8d51d">STAFF: {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
				args = {xPlayer.getName(), message, time}
			}, xPlayer.getGroup())
		end
	end
end)

RegisterCommand('staffo', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local length = string.len('staffo')
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		if isAdmin(xPlayer) then
			showOnlyForAdmins(function(admins)
				TriggerClientEvent('chat:addMessage', admins, {
					template = '<div class="chat-message staffonly"><i class="fas fa-eye-slash"></i> <b><span style="color: #1ebc62">[STAFF ONLY] {0} ['..xPlayer.source..']</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
					args = {xPlayer.getName(), message, time}
				})
			end)
		end
	end
end)

RegisterCommand('ad', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local mutato, index = isMutato(xPlayer.identifier)
		if not mutato then
			if xPlayer.job.name ~= 'unemployed' and xPlayer.job.name ~= 'police' and xPlayer.job.name ~= 'ambulance' then
				local length = string.len('ad')
				local message = rawCommand:sub(length + 1)
				local time = os.date(Config.DateFormat)
				local ckeckWords = isBanned(message, source)
				if ckeckWords then
					TriggerClientEvent('chat:addMessage', -1, {
						template = '<div class="chat-message advertisement"><i class="fas fa-ad"></i> <b><span style="color: #aca924e6">ANNUNCIO '..string.upper(tostring(xPlayer.job.label))..'</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
						args = {message, time}
					})
				end
			else
				xPlayer.showNotification('Non puoi esegiure questo comando', 'error')
			end
		else
			return
			xPlayer.showNotification('Sei stato mutato con motivazione: '..chatMuted[index].motivo..'')
		end
	end
end)

RegisterCommand('lspd', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local length = string.len('lspd')
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">LSPD</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = {message, time}
			})
		else
			xPlayer.showNotification('Non puoi esegiure questo comando', 'error')
		end
	end
end)

RegisterCommand('ems', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local length = string.len('ems')
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		if xPlayer.job.name == 'ambulance' then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message ambulance"><i class="fas fa-ambulance"></i> <b><span style="color: #ff0000b3">EMS</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = {message, time}
			})
		else
			xPlayer.showNotification('Non puoi esegiure questo comando', 'error')
		end
	end
end)

RegisterCommand('anon', function(source, args, rawCommand)
	TriggerClientEvent('chat:addMessage', source, {
		template = '<div class="chat-message system"><i class="fas fa-bell"></i> <b><span style="color: #ff0000b3">ARTEMIS</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">La chat ANON è stata disabilitata, ti consigliamo di usare la dark chat sul telefono</div></div>',
	})
--[[local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local mutato, index = isMutato(xPlayer.identifier)
		if not mutato then
			local length = string.len('anon')
			local message = rawCommand:sub(length + 1)
			local time = os.date(Config.DateFormat)
			local ckeckWords = isBanned(message, source)
			if ckeckWords then
				TriggerClientEvent('chat:addMessage', -1, {
					template = '<div class="chat-message twitter"><i class="fab fa-twitter"></i> <b><span style="color: #2aa9e0">@ANONIMO</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
					args = {message, time}
				})
			end
		else
			return
			xPlayer.showNotification('Sei stato mutato con motivazione: '..chatMuted[index].motivo..'')
		end
	end]]
end)

RegisterCommand('ooc', function(source, args, rawCommand)
	TriggerClientEvent('chat:addMessage', source, {
		template = '<div class="chat-message system"><i class="fas fa-bell"></i> <b><span style="color: #ff0000b3">ARTEMIS</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">La chat OOC è stata disabilitata, se necessiti di uno STAFF fai /assist</div></div>',
	})
end)

RegisterCommand('azione', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local mutato, index = isMutato(xPlayer.identifier)
		if not mutato then
			local length = string.len('azione')
			local message = rawCommand:sub(length + 1)
			local time = os.date(Config.DateFormat)
			local coordsSource = xPlayer.coords
			local checkBan = isBanned(message, xPlayer.source)
			if checkBan then
				for k, v in pairs(GetPlayers()) do
					local xPlayerz = ESX.GetPlayerFromId(tonumber(v))
					if xPlayerz then
						local coordsTarget = xPlayerz.coords
						local coords = #(vector3(coordsSource.x,coordsSource.y,coordsSource.z)-vector3(coordsTarget.x,coordsTarget.y,coordsTarget.z))
						if coords < 300.0 then
							TriggerClientEvent('chat:addMessage', v, {
								template = '<div class="chat-message azione"><i class="fas fa-gun"></i> <b><span style="color: #c87528e6100">AZIONE: {0} ['..xPlayer.source..']</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
								args = {xPlayer.getName(), message, time}
							})
						end
					end
				end
			end
		else
			return
			xPlayer.showNotification('Sei stato mutato con motivazione: '..chatMuted[index].motivo..'')
		end
	end
end)

--[[
RegisterServerEvent('chat:azione')
AddEventHandler('chat:azione', function(id, players, rawCommand)
	local length = string.len('azione')
	local message = rawCommand:sub(length + 1)
	if id and players then
		TriggerClientEvent('chat:addMessage', players, {
			template = '<div class="chat-message azione"><i class="fas fa-gun"></i> <b><span style="color: #c87528e6100">AZIONE: {0} ['..id..']</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
			args = {GetPlayerName(id), message, os.date(Config.DateFormat)}
		})
	end
end)
]]

RegisterCommand('cartello', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if xPlayer.getGroup() == 'superadmin' or xPlayer.job2.name == 'cartello' then
			local length = string.len('cartello')
			local message = rawCommand:sub(length + 1)
			local time = os.date(Config.DateFormat)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message cartello"><i class="fas fa-bomb"></i> <b><span style="color: #8d28c8">CARTELLO</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = {message, time}
			})
		else
			xPlayer.showNotification('Non puoi esegiure questo comando', 'error')
		end
	end
end)

RegisterCommand('procura', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if xPlayer.job.name == 'procura' then
			local length = string.len('procura')
			local message = rawCommand:sub(length + 1)
			local time = os.date(Config.DateFormat)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message procura"><i class="fas fa-gavel"></i> <b><span style="color: #d8811d">PROCURA</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = {message, time}
			})
		else
			xPlayer.showNotification('Non puoi esegiure questo comando', 'error')
		end
	end
end)

RegisterCommand('dm', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if isAdmin(xPlayer) then
			local target = tonumber(args[1])
			if target then
				local xTarget = ESX.GetPlayerFromId(target)
				if xTarget then
					local length = string.len('dm')
					local message = ''
					for i, theArg in pairs(args) do
                        if i ~= 1 then
                            message = ''..message..' '..theArg..''
                        end
                    end
					local time = os.date(Config.DateFormat)
					for k, v in pairs(GetPlayers()) do
						local xPlayerz = ESX.GetPlayerFromId(tonumber(v))
						if xPlayerz then
							if xPlayerz.source == xPlayer.source or xPlayerz.source == xTarget.source then
								TriggerClientEvent('chat:addMessage', v, {
									template = '<div class="chat-message staffonly"><i class="fas fa-comments"></i> <b><span style="color: #1ebc62">MESSAGGIO PRIVATO: {0} ['..xPlayer.source..']</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
									args = {xPlayer.getName(), message, time}
								})
							end
						end
					end
				else
					xPlayer.showNotification('Il player non è online', 'error')
				end
			end
		end
	end
end)

RegisterCommand('mute', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if isAdmin(xPlayer) then
			local target = tonumber(args[1])
			if target then
				local xTarget = ESX.GetPlayerFromId(target)
				if xTarget then
					local checkMutato, index = isMutato(xTarget.identifier)
					if not checkMutato then
						local motivo = tostring(args[2] or 'Nessuna Motivazione')
						if motivo then
							xPlayer.showNotification('Hai mutato '..xTarget.getName()..' dalla chat', 'success')
							xTarget.showNotification('Sei stato mutato da '..xPlayer.getName()..'', 'success')
							table.insert(chatMuted, {id = xTarget.identifier, motivo = motivo})
						end
					else
						xPlayer.showNotification('Hai smutato '..xTarget.getName()..' dalla chat', 'success')
						xTarget.showNotification('Sei stato smutato da '..xPlayer.getName()..'', 'success')
						table.remove(chatMuted, index)
					end
				else
					xPlayer.showNotification('Il player non è online', 'error')
				end
			else
				xPlayer.showNotification('Inserisci un ID valido', 'error')
			end
		else
			xPlayer.showNotification('Non puoi esegiure questo comando', 'error')
		end
	end
end)

function isMutato(identifier)
	for k, v in pairs(chatMuted) do 
		if v.id == identifier then
			return true, k
		end
	end
	return false, 0
end

function isBanned(phrase, source)
	for k, v in pairs(BannedWords) do
		if string.match(string.lower(tostring(phrase)), string.lower(tostring(v))) then
			print('Player: '..source..', Kickato per parola bannata: '..v..'')
			DropPlayer(source, 'Artemis Roleplay: Non puoi usare questa parola in chat! \nParola Usata: '..v..'')
			return false
		end
	end
	return true
end

function isAdmin(xPlayer)
	if xPlayer.getGroup() ~= 'user' and xPlayer.getGroup() ~= 'streamer' then 
		return true 
	end
	--[[if chatAdmins[xPlayer.identifier] then
		return true 
	end]]
	return false
end

function showOnlyForAdmins(cb)
	for k, v in ipairs(ESX.GetPlayers()) do
		if isAdmin(ESX.GetPlayerFromId(v)) then
			cb(v)
		end
	end
end
