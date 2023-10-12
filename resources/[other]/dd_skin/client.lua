RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerLoaded = true
end)

if Config.Blips.clotheshop then
	Citizen.CreateThread(function()
		for k,v in ipairs(Config.Blips.clotheshopblips) do
			local blip = AddBlipForCoord(v)

			SetBlipSprite (blip, Config.Blips.clotheshopblipconfig.sprite)
			SetBlipColour (blip, Config.Blips.clotheshopblipconfig.color)
			SetBlipScale (blip, Config.Blips.clotheshopblipconfig.scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(Config.Blips.clotheshopblipconfig.text)
			EndTextCommandSetBlipName(blip)
		end
	end)
end


if Config.Blips.barbershop then
	Citizen.CreateThread(function()
		for k,v in ipairs(Config.Blips.barbershopblips) do
			local blip = AddBlipForCoord(v)

			SetBlipSprite (blip, Config.Blips.barbershopblipconfig.sprite)
			SetBlipColour (blip, Config.Blips.barbershopblipconfig.color)
			SetBlipScale (blip, Config.Blips.barbershopblipconfig.scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(Config.Blips.barbershopblipconfig.text)
			EndTextCommandSetBlipName(blip)
		end
	end)
end


function BlipSkin()
	for k,v in ipairs(Config.Blips.clotheshopblips) do
		TriggerEvent('gridsystem:registerMarker', {
			name = "vestiti" .. v.x,
			type = -1,
			texture = "negoziovestiti",
			scale = vector3(0.8, 0.8, 0.8),
			color = { r = 0, g = 51, b = 204 },
			pos = vector3(v.x, v.y, v.z),
			control = 'E',
			posizione = "left-center",
			titolo = "Negozio",
			action = function()
				TriggerEvent("dd_skin:menunegoziogenerale")
			end,
			onExit = function()
				lib.hideTextUI()
				ESX.UI.Menu.CloseAll()
			end,
			msg = Config.Lang.controlpress,
		})
	end

	for k,v in ipairs(Config.Blips.barbershopblips) do
		TriggerEvent('gridsystem:registerMarker', {
			name = "barbiere" .. v.x,
			type = -1,
			texture = "barbiere",
			scale = vector3(0.8, 0.8, 0.8),
			color = { r = 0, g = 51, b = 204 },
			pos = vector3(v.x, v.y, v.z),
			control = 'E',
			posizione = "left-center",
			titolo = "Negozio",
			action = function()
				TriggerEvent("dd_skin:barbiere")
			end,
			onExit = function()
				lib.hideTextUI()
				ESX.UI.Menu.CloseAll()
			end,
			msg = Config.Lang.controlpress,
		})
	end
	print("Marker skin creati con successo")
end

Citizen.CreateThread(function()
	Wait(1000)
	BlipSkin()
	Wait(10000)
	BlipSkin()
end)

RegisterNetEvent("dd_skin:registerMarker", function()
	BlipSkin()
end)

RegisterNetEvent('dd_skin:barbiere', function()
	local config = {
		ped = false,
		headBlend = false,
		faceFeatures = false,
		headOverlays = true,
		components = false,
		props = false
	}
	
	exports['dd_skin']:startPlayerCustomization(function (appearance)
		if (appearance) then
			ESX.TriggerServerCallback('dd_skin:check-soldi', function(peppesessone)
				if peppesessone then
					TriggerServerEvent('fivem-appearance:save', appearance)
					TriggerEvent('skinchanger:modelLoaded')
					ESX.ShowNotification(Config.Lang.moneypaid)
					TriggerEvent("atn_rec:metadata:docAggImm")
					TriggerEvent("dd_skin:loadTattoos")
				else
					ESX.TriggerServerCallback('fivem-appearance:getPlayerSkin', function(appearance)
						exports['dd_skin']:setPlayerAppearance(appearance)
					end)
				end
			end)
		end
	end, config)
end)



RegisterNetEvent('dd_skin:menunegoziogenerale', function()

	local elements = {}
	table.insert(elements, {label = "Negozio", value = 1})
	table.insert(elements, {label = "Guardaroba", value = 2})
	table.insert(elements, {label = "Salva outfit", value = 3})

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'clothes_shop', {
		title = Config.Lang.title,
		align = "top-left",
		elements = elements
	}, function(data, menu)
			if data.current.value == 1 then 
				ESX.UI.Menu.CloseAll()
				TriggerEvent("dd_skin:menunegozietti")
			elseif data.current.value == 2 then
				SkinMenuOutfit()
			elseif data.current.value == 3 then
				ESX.UI.Menu.CloseAll()
				SkinMenuSalvaOutfit()
			end
		end, function(data2, menu2)
		ESX.UI.Menu.CloseAll()
	end)
end)

RegisterNetEvent('dd_skin:menunegozietti', function()
	local config = {
		ped = false,
		headBlend = false,
		faceFeatures = false,
		headOverlays = false,
		components = true,
		props = true
	}
	
	exports['dd_skin']:startPlayerCustomization(function (appearance)
		if (appearance) then
			TriggerServerEvent('fivem-appearance:save', appearance)
			if Config.ESX.useLegacy then
				ESX.SetPlayerData('ped', PlayerPedId()) -- Fix per esx legacy
				TriggerEvent("dd_skin:loadTattoos")
			end
		else
			if Config.ESX.useLegacy then
				ESX.SetPlayerData('ped', PlayerPedId()) -- Fix per esx legacy
				TriggerEvent("dd_skin:loadTattoos")
			end
		end
	end, config)
end)

RegisterNetEvent('dd_skin:outfitmenu', function()
    local elements = {}
	local JobFazione = Config.TriggerToGetSecondJob()
	local PlayerData = ESX.GetPlayerData()
	
	if Config.Menu.personaloutfitsmenu then
		table.insert(elements, {label = Config.Lang.personaloutfits, event = "dd_skin:outfitpersonali"})
	end
	if Config.Menu.joboutfitsmenu then
		if PlayerData.job ~= nil and PlayerData.job.grade_name == Config.Job.bossRank then
			table.insert(elements, {label = Config.Lang.joboutfits, event = "dd_skin:outfitlavori"})
		end
	end
	if Config.Menu.factionoutfitsmenu then
		if JobFazione ~= nil and JobFazione.grade_name ~= Config.Job.unemployedJob2Rank then
			table.insert(elements, {label = Config.Lang.factionsoutfits, event = "dd_skin:outfitfazione"})
		end
	end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
		title = Config.Lang.wardarobe,
		align = "top-left",
		elements = elements
	}, function(data, menu)
			TriggerEvent(data.current.event)
		end, function(data2, menu2)
		ESX.UI.Menu.CloseAll()
	end)
end)

RegisterNetEvent('fivem-appearance:setOutfit')
AddEventHandler('fivem-appearance:setOutfit', function(data)
	local pedModel = data.ped
	local pedComponents = data.components
	local pedProps = data.props
	local playerPed = PlayerPedId()
	local currentPedModel = exports['dd_skin']:getPedModel(playerPed)

	if currentPedModel ~= pedModel then
    	exports['dd_skin']:setPlayerModel(pedModel)
		Citizen.Wait(500)
		playerPed = PlayerPedId()
		exports['dd_skin']:setPedComponents(playerPed, pedComponents)
		exports['dd_skin']:setPedProps(playerPed, pedProps)
		local appearance = exports['dd_skin']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
		if Config.ESX.useLegacy then
			ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
		end
	else
		exports['dd_skin']:setPedComponents(playerPed, pedComponents)
		exports['dd_skin']:setPedProps(playerPed, pedProps)
		local appearance = exports['dd_skin']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
		if Config.ESX.useLegacy then
			ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
		end
	end
	TriggerEvent('skinchanger:modelLoaded')
	TriggerEvent("dd_skin:loadTattoos")
end)

-- Add compatibility with skinchanger and esx_skin TriggerEvents
RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin, cb)
	if not skin.model then skin.model = 'mp_m_freemode_01' end
	exports['dd_skin']:setPlayerAppearance(skin)
	TriggerEvent("dd_skin:loadTattoos")
	if cb ~= nil then
		cb()
	end
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb)
	local config = {
		ped = true,
		headBlend = true,
		faceFeatures = true,
		headOverlays = true,
		components = true,
		props = true
	}
	exports['dd_skin']:startPlayerCustomization(function (appearance)
		if (appearance) then
			TriggerServerEvent('fivem-appearance:save', appearance)
			if Config.ESX.useLegacy then
			   ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
			   TriggerEvent("dd_skin:loadTattoos")
			end
			if submitCb then submitCb() end
		else
			if cancelCb then cancelCb() end
			if Config.ESX.useLegacy then
			   ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
			   TriggerEvent("dd_skin:loadTattoos")
			end
		end
	end, config)
	TriggerEvent('skinchanger:modelLoaded')
	TriggerEvent("dd_skin:loadTattoos")
end)

function ShowDialog(title, cb)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dialogo',
    	{title = title}, function(data, menu)
        menu.close()
        cb(data.value)
    end, function(_, menu) menu.close() end, function(_, _) end)
end

exports("ShowDialog",ShowDialog)

RegisterCommand("skins", function()
	TriggerEvent("dd_skin:mainMenu", "police")
end)

RegisterNetEvent("dd_skin:mainMenu")
AddEventHandler("dd_skin:mainMenu", function(job)
	local elementi = {}

	table.insert(elementi, {label = "Articoli", value = "crea"})
	table.insert(elementi, {label = "Salva Outfit", value = "salva"})
	table.insert(elementi, {label = "Outfit", value = "outfit"})

	if job then
		table.insert(elementi, {label = "DIVISE", value = "divise"})
		if job == "police" then
			table.insert(elementi, {label = "Giubbotto", value = "giubb"})
		end
	end	

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'atn_skin_mainmenu', {
        align = 'top-left',
        title = "ARMADIETTO",
        elements = elementi
    }, 	function(data, menu)
            local verifica = data.current.value

            if verifica == "crea" then
				ESX.UI.Menu.CloseAll()
				TriggerEvent("dd_skin:menunegozietti")
			elseif verifica == "salva" then
				ESX.UI.Menu.CloseAll()
				SkinMenuSalvaOutfit()
			elseif verifica == "outfit" then
				SkinMenuOutfit()
			elseif verifica == "divise" then
				SkinMenuDivise(job)
			elseif verifica == "giubb" then
				SetPedArmour(PlayerPedId(), 100)
			elseif verifica == "salvadiv" then
				ESX.UI.Menu.CloseAll()
				local quest2 = lib.alertDialog({
					header = 'OUTFIT',
					content = "Vuoi salvare la divisa che stai indossando?",
					centered = true,
					cancel = true
				})
				if quest2 then
					if quest2 == "confirm" then
						Wait(200)
						local input = lib.inputDialog('OUTFIT', {'Inserisci il nome con cui vuoi salvare questo outfit'})
						local importo = input[1]
						local pedModel = exports['dd_skin']:getPedModel(PlayerPedId())
						local pedComponents = exports['dd_skin']:getPedComponents(PlayerPedId())
						local pedProps = exports['dd_skin']:getPedProps(PlayerPedId())
						Citizen.Wait(500)
						TriggerServerEvent('dd_skin:salvaOutfit', GetPlayerServerId(PlayerId()), input[1], pedModel, pedComponents, pedProps, job)
					end
				end
            end
        end, 
        function(data, menu)
            menu.close()
        end
    )
end)

function SkinMenuDivise(job)
	ESX.TriggerServerCallback('dd_skin:getOutfits', function(result)
		local elementi = {}
		print(result)
		if not result then ESX.ShowNotification("Non hai outfits salvati") return end
		for i = 1, #result, 1 do
			if result[i] then
				table.insert(elementi, {label = result[i].nome, value = {ped = result[i].ped, components = json.decode(result[i].components), props = json.decode(result[i].props), id = result[i].id, nome = result[i].nome}})
			end
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'atn_skin_divisemenu', {
			align = 'top-left',
			title = "DIVISE SALVATE",
			elements = elementi
		}, 	function(data, menu)
				local verifica = data.current.value

				if verifica then
					AzioniDivise(verifica, job)
				end
			end, 
			function(data, menu)
				menu.close()
			end
		)

	end, job)
end

function AzioniDivise(infoval, job)
	local elementi = {}

	table.insert(elementi, {label = "Indossa", value = "indossa"})
	if LocalPlayer.state.infoPl.gradename == "boss" then
		table.insert(elementi, {label = "Elimina", value = "elimina"})
		table.insert(elementi, {label = "Rinomina", value = "rinomina"})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'atn_skin_divisemenu_azioni', {
		align = 'top-left',
		title = "AZIONI DIVISE",
		elements = elementi
	}, 	function(data, menu)
			local verifica = data.current.value

			if verifica == "indossa" then
				IndossaVestiti(infoval)
			elseif verifica == "elimina" then
				ESX.UI.Menu.CloseAll()
				TriggerServerEvent("dd_skin:eliminaOutfit", GetPlayerServerId(PlayerId()), infoval.id, job)
			elseif verifica == "rinomina" then
				ESX.UI.Menu.CloseAll()
				local input = lib.inputDialog('OUTFIT', {'Inserisci il nome con cui vuoi salvare questo outfit'})
				local importo = input[1]
				TriggerServerEvent("dd_skin:rinominaOutfit", GetPlayerServerId(PlayerId()), infoval.id, input[1], job)
			end
		end, 
		function(data, menu)
			menu.close()
		end
	)
end


function SkinMenuSalvaOutfit()
	local input = lib.inputDialog('OUTFIT', {'Inserisci il nome con cui vuoi salvare questo outfit'})
	local importo = input[1]
	local pedModel = exports['dd_skin']:getPedModel(PlayerPedId())
	local pedComponents = exports['dd_skin']:getPedComponents(PlayerPedId())
	local pedProps = exports['dd_skin']:getPedProps(PlayerPedId())
	Citizen.Wait(500)
	TriggerServerEvent('dd_skin:salvaOutfit', GetPlayerServerId(PlayerId()), input[1], pedModel, pedComponents, pedProps, false)
end

function SkinMenuOutfit()
	ESX.TriggerServerCallback('dd_skin:getOutfits', function(result)
		local elementi = {}
		if not result then ESX.ShowNotification("Non hai outfits salvati") return end
		for i = 1, #result, 1 do
			if result[i] then
				table.insert(elementi, {label = result[i].nome, value = {ped = result[i].ped, components = json.decode(result[i].components), props = json.decode(result[i].props), id = result[i].id, nome = result[i].nome}})
			end
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'atn_skin_outfitsmenu', {
			align = 'top-left',
			title = "OUTFITS SALVATI",
			elements = elementi
		}, 	function(data, menu)
				local verifica = data.current.value

				if verifica then
					Azionioutfits(verifica)
				end
			end, 
			function(data, menu)
				menu.close()
			end
		)

	end, false)
end


function Azionioutfits(infoval)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'atn_skin_outfitsmenu_azioni', {
		align = 'top-left',
		title = "AZIONI OUTFITS",
		elements = {
			{label = "Indossa", value = "indossa"},
			{label = "Elimina", value = "elimina"},
			{label = "Rinomina", value = "rinomina"},
			{label = "Passa Outfits", value = "passa"}
		}
	}, 	function(data, menu)
			local verifica = data.current.value

			if verifica == "indossa" then
				IndossaVestiti(infoval)
			elseif verifica == "elimina" then
				ESX.UI.Menu.CloseAll()
				TriggerServerEvent("dd_skin:eliminaOutfit", GetPlayerServerId(PlayerId()), infoval.id, false)
			elseif verifica == "rinomina" then
				ESX.UI.Menu.CloseAll()
				local input = lib.inputDialog('OUTFIT', {'Inserisci il nome con cui vuoi salvare questo outfit'})
				local importo = input[1]
				TriggerServerEvent("dd_skin:rinominaOutfit", GetPlayerServerId(PlayerId()), infoval.id, input[1], false)
			elseif verifica == "passa" then
				ESX.UI.Menu.CloseAll()
				getMousePlayer(function(closestPlayer, closestDistance)
					if (closestPlayer and closestDistance) and ((closestPlayer ~= -1) and (closestDistance > 0 and closestDistance <= 3.0)) then
						local targetPlayer = GetPlayerServerId(closestPlayer)
						if targetPlayer then
							ESX.ShowNotification("Hai passato l'outfit "..infoval.nome, "success")
							TriggerServerEvent("dd_skin:creaRichiesta:passout", GetPlayerServerId(PlayerId()), targetPlayer, infoval.ped, infoval.components, infoval.props, infoval.nome)
						end
					else
						ESX.ShowNotification("Non ci sono player nelle vicinanze", "error")
					end
				end)
			end
		end, 
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent("dd_borsone:indossa", function(val, nome)
	IndossaVestiti(val, nome)
end)

function IndossaVestiti(value, nome)
	if not value then return end
	local pedModel = value.ped
	local pedComponents = value.components
	local pedProps = value.props
	local playerPed = PlayerPedId()
	local currentPedModel = exports['dd_skin']:getPedModel(playerPed)
	if currentPedModel ~= pedModel then
    	exports['dd_skin']:setPlayerModel(pedModel)
		Citizen.Wait(500)
		playerPed = PlayerPedId()
		exports['dd_skin']:setPedComponents(playerPed, pedComponents)
		exports['dd_skin']:setPedProps(playerPed, pedProps)
		local appearance = exports['dd_skin']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
	else
		exports['dd_skin']:setPedComponents(playerPed, pedComponents)
		exports['dd_skin']:setPedProps(playerPed, pedProps)
		local appearance = exports['dd_skin']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
	end
	TriggerEvent('skinchanger:modelLoaded')
	if not nome then
		ESX.ShowNotification("Hai indossato l'outfits: "..value.nome, 'success')
	else
		ESX.ShowNotification("Hai indossato l'outfits: "..nome, 'success')
	end
end



RegisterNetEvent("dd_skin:riceventeRichiesta:outfit")
AddEventHandler("dd_skin:riceventeRichiesta:outfit", function(ped, components, props, nome)
	local value = {ped = ped, components = components, props = props, nome = nome}
    local alert = lib.alertDialog({
        header = 'OUTFIT',
        content = 'Hai ricevuto una outfit. Nome: '..nome,
        centered = true,
        cancel = true
    })
    if alert then
        if alert == "confirm" then
			TriggerServerEvent('dd_skin:salvaOutfit', GetPlayerServerId(PlayerId()), nome, ped, components, props, false)
			Wait(450)
			local quest2 = lib.alertDialog({
				header = 'OUTFIT',
				content = "Vuoi indossare l'outfit?",
				centered = true,
				cancel = true
			})
			if quest2 then
				if quest2 == "confirm" then
            		Wait(200)
					IndossaVestiti(value)
				end
			end
        end
    end
end)