Doppiaconnessione = {}

Doppiaconnessione.VerificationMethod = 'steam' -- o 'license'
Doppiaconnessione.VerifyBoth = true -- Imposta su true se vuoi verificare la licenza di Steam e il Rockstar "Config.VerificationMethod" verrà ignorato in questo caso

Doppiaconnessione.DiscordWebhookLink = ''
Doppiaconnessione.DiscordColor = '14399065'
Doppiaconnessione.DiscordUserName = 'Blocco doppia connessione zConfa'
Doppiaconnessione.DiscordTitle = 'Tentativo di ingresso con 2 client'
Doppiaconnessione.EnableDiscordLogs = true

local function OnPlayerConnecting(name, _, deferrals)
    local player = source
	local isIdtypeAlreadyInUse = false
	local isIdtypeAlreadyInUse2 = false
    local idtype
	if Doppiaconnessione.VerifyBoth then
		local idtype2
	end
    local identifiers = GetPlayerIdentifiers(player)

    deferrals.defer()

    Wait(0)

    deferrals.update(string.format('Verifica della connessione...', name))
	
	if Doppiaconnessione.VerifyBoth then
		for _, v in pairs(identifiers) do
			if string.find(v, 'steam') then
				idtype = v
				break
			end
		end
		for _, v in pairs(identifiers) do
			if string.find(v, 'license') then
				idtype2 = v
				break
			end
		end
	else
		for _, v in pairs(identifiers) do
			if string.find(v, Doppiaconnessione.VerificationMethod) then
				idtype = v
				break
			end
		end
	end

    Wait(2500)

    deferrals.update(string.format('Verifica che non si è già presenti sul server...', name))

	if Doppiaconnessione.VerifyBoth then
		isIdtypeAlreadyInUse = IsIdtypeInUse(idtype, 'steam')
	    isIdtypeAlreadyInUse2 = IsIdtypeInUse(idtype2, 'license')
	else
		isIdtypeAlreadyInUse = IsIdtypeInUse(idtype, Doppiaconnessione.VerificationMethod)
	end

    Wait(2500)
	
	if Doppiaconnessione.VerifyBoth then
		if isIdtypeAlreadyInUse or isIdtypeAlreadyInUse2 then
			deferrals.done('Sembra che tu sia già ON bro...')
			
			if Doppiaconnessione.EnableDiscordLogs then
				local dcsend = {
					{
						['title']= Doppiaconnessione.DiscordTitle,
						['color'] = Doppiaconnessione.DiscordColor,
						['description'] = 'Nome Steam: **'..GetPlayerName(source)..'** - Steam: **'..idtype..'** - Licenza Rockstar: **'..idtype2..'**',
						['footer']=  {
							['text']= 'blocca_doppiaconnessione_zconfa',
						},
					}
				}
				PerformHttpRequest(Doppiaconnessione.DiscordWebhookLink, function(err, text, headers) end, 'POST', json.encode({ username = Doppiaconnessione.DiscordUserName, embeds = dcsend}), { ['Content-Type'] = 'application/json' })
			end
		else
			deferrals.done()
			
			-- Add any additional defferals here you may need for example queue system!
		end	
	else
		if isIdtypeAlreadyInUse then
			deferrals.done('Sembra che tu sia già ON bro...')
			
			if Doppiaconnessione.EnableDiscordLogs then
				local dcsend = {
					{
						['title']= Doppiaconnessione.DiscordTitle,
						['color'] = Doppiaconnessione.DiscordColor,
						['description'] = 'Nome Steam: **'..GetPlayerName(source)..'** - Steam: **'..idtype..'**',
						['footer']=  {
							['text']= 'blocca_doppiaconnessione_zconfa',
						},
					}
				}
				PerformHttpRequest(Doppiaconnessione.DiscordWebhookLink, function(err, text, headers) end, 'POST', json.encode({ username = Doppiaconnessione.DiscordUserName, embeds = dcsend}), { ['Content-Type'] = 'application/json' })
			end
		else
			deferrals.done()
			
			-- Add any additional defferals here you may need for example queue system!
		end
	end
end

AddEventHandler('playerConnecting', OnPlayerConnecting)

function IsIdtypeInUse(idtype, vmethod)
    local players = GetPlayers()
    for _, player in pairs(players) do
        local identifiers = GetPlayerIdentifiers(player)
        for _, id in pairs(identifiers) do
            if string.find(id, vmethod) then
                local playerIdtype = id
                if playerIdtype == idtype then
                    return true
                end
            end
        end
    end
    return false
end

