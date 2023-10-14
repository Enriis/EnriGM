local mp_m_freemode_01 = `mp_m_freemode_01`
local mp_f_freemode_01 = `mp_f_freemode_01`
if ESX.GetConfig().Multichar then


	CreateThread(function()
		while not ESX.PlayerLoaded do
			Wait(0)
			if NetworkIsPlayerActive(PlayerId()) then
				exports.spawnmanager:setAutoSpawn(false)
				DoScreenFadeOut(0)
				Wait(1000)
				TriggerEvent("esx_multicharacter:SetupCharacters")
				break
			end
		end
	end)

	local canRelog, cam, spawned = true, nil, nil
	local Characters =  {}

	RegisterNetEvent('esx_multicharacter:SetupCharacters')
	AddEventHandler('esx_multicharacter:SetupCharacters', function()
		ESX.PlayerLoaded = false
		ESX.PlayerData = {}
		spawned = false
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		local playerPed = PlayerPedId()
		SetEntityCoords(playerPed, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z, true, false, false, false)
		SetEntityHeading(playerPed, Config.Spawn.w)
		local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0, 1.7, 0.4)
		DoScreenFadeOut(0)
		SetCamActive(cam, true)
		RenderScriptCams(true, false, 1, true, true)
		SetCamCoord(cam, offset.x, offset.y, offset.z)
		PointCamAtCoord(cam, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z + 1.3)
		ESX.UI.HUD.SetDisplay(0.0)
		StartLoop()
		ShutdownLoadingScreen()
		ShutdownLoadingScreenNui()
		TriggerEvent('esx:loadingScreenOff')
		Wait(1000)
		TriggerServerEvent("esx_multicharacter:SetupCharacters")
	end)

	StartLoop = function()
		hidePlayers = true
		MumbleSetVolumeOverride(PlayerId(), 0.0)
		CreateThread(function()
			local keys = {18, 27, 172, 173, 174, 175, 176, 177, 187, 188, 191, 201, 108, 109}
			while hidePlayers do
				DisableAllControlActions(0)
				for i = 1, #keys do
					EnableControlAction(0, keys[i], true)
				end
				SetEntityVisible(PlayerPedId(), 0, 0)
				SetLocalPlayerVisibleLocally(1)
				SetPlayerInvincible(PlayerId(), 1)
				ThefeedHideThisFrame()
				HideHudComponentThisFrame(11)
				HideHudComponentThisFrame(12)
				HideHudComponentThisFrame(21)
				HideHudAndRadarThisFrame()
				Wait(0)
				local vehicles = GetGamePool('CVehicle')
				for i = 1, #vehicles do
					SetEntityLocallyInvisible(vehicles[i])
				end
			end
			local playerId, playerPed = PlayerId(), PlayerPedId()
			MumbleSetVolumeOverride(playerId, -1.0)
			SetEntityVisible(playerPed, 1, 0)
			SetPlayerInvincible(playerId, 0)
			FreezeEntityPosition(playerPed, false)
			Wait(10000)
			canRelog = true
		end)
		CreateThread(function()
			local playerPool = {}
			while hidePlayers do
				local players = GetActivePlayers()
				for i = 1, #players do
					local player = players[i]
					if player ~= PlayerId() and not playerPool[player] then
						playerPool[player] = true
						NetworkConcealPlayer(player, true, true)
					end
				end
				Wait(500)
			end
			for k in pairs(playerPool) do
				NetworkConcealPlayer(k, false, false)
			end
		end)
	end

	SetupCharacter = function(index)
		if spawned == false then
			exports.spawnmanager:spawnPlayer({
				x = Config.Spawn.x,
				y = Config.Spawn.y,
				z = Config.Spawn.z,
				heading = Config.Spawn.w,
				model = Characters[index].model or mp_m_freemode_01,
				skipFade = true
			}, function()
				canRelog = false
				if Characters[index] then
					local skin = Characters[index].skin or Config.default_char
					if not Characters[index].model then
						if Characters[index].sex == TranslateCap('female') then skin.sex = 1 else skin.sex = 0 end
					end
					TriggerEvent('skinchanger:loadSkin', skin)
				end
				DoScreenFadeIn(600)
			end)
		repeat Wait(200) until not IsScreenFadedOut()

		elseif Characters[index] and Characters[index].skin then
			if Characters[spawned] and Characters[spawned].model then
				RequestModel(Characters[index].model)
				while not HasModelLoaded(Characters[index].model) do
					RequestModel(Characters[index].model)
					Wait(0)
				end
				SetPlayerModel(PlayerId(), Characters[index].model)
				SetModelAsNoLongerNeeded(Characters[index].model)
			end
			TriggerEvent('skinchanger:loadSkin', Characters[index].skin)
		end
		spawned = index
		local playerPed = PlayerPedId()
		FreezeEntityPosition(PlayerPedId(), true)
		SetPedAoBlobRendering(playerPed, true)
		SetEntityAlpha(playerPed, 255)

	end

	RegisterNUICallback("disconnettiPlayer", function(data, cb)
		SendNUIMessage({
			toggle_load = true
		})
		Wait(1500)
		SendNUIMessage({
			toggle_load = false
		})
		SendNUIMessage({
			toggle = false,
		})
		SetNuiFocus(false, false)
		TriggerServerEvent('esx_multicharacter:relog', true)
		cb("ok")
	end)

	RegisterNUICallback("EliminaPlayer", function(data, cb)
		local pg = data.num
		SendNUIMessage({
			toggle_load = true
		})
		Wait(1500)
		SendNUIMessage({
			toggle_load = false
		})
		SendNUIMessage({
			toggle = false,
		})
		SetNuiFocus(false, false)
		TriggerServerEvent('esx_multicharacter:DeleteCharacter',tonumber(pg))
	end)
	
	RegisterNUICallback("SelezionaPlayer", function(data, cb)
		local pg = data.num
		SendNUIMessage({
			toggle_load = true
		})
		Wait(1500)
		SendNUIMessage({
			toggle_load = false
		})
		SendNUIMessage({
			toggle = false,
		})
		SetNuiFocus(false, false)
		TriggerServerEvent('esx_multicharacter:CharacterChosen', tonumber(pg), false)
	end)
	
	RegisterNUICallback("CreaPlayer", function(data, cb)
		local pg = data.num
		SendNUIMessage({
			toggle_load = true
		})
		Wait(1500)
		SendNUIMessage({
			toggle_load = false
		})
		SendNUIMessage({
			toggle = false,
		})
		SetNuiFocus(false, false)
		Wait(1000)
		SetNuiFocus(false, false)
		SendNUIMessage({
			toggle = false
		})        
		exports.spawnmanager:spawnPlayer({
			x = Config.Spawn.x,
			y = Config.Spawn.y,
			z = Config.Spawn.z,
			heading = Config.Spawn.w,
			model = mp_m_freemode_01,
			skipFade = true
		}, function()
			canRelog = false
			DoScreenFadeIn(400)
			Wait(400)
			local playerPed = PlayerPedId()
			SetPedAoBlobRendering(playerPed, false)
			SetEntityAlpha(playerPed, 0)
			TriggerServerEvent('esx_multicharacter:CharacterChosen', tonumber(pg), true)
			TriggerEvent('esx_identity:showRegisterIdentity')
			end)
	end)

	RegisterNetEvent('esx_multicharacter:SetupUI')
	AddEventHandler('esx_multicharacter:SetupUI', function(data, slots)
		DoScreenFadeOut(0)
		Characters = data
		slots = slots
		local Character = next(Characters)

		exports.spawnmanager:forceRespawn()

		if not Character then
			SetNuiFocus(false, false)
			SendNUIMessage({
				toggle = false
			})        
			exports.spawnmanager:spawnPlayer({
				x = Config.Spawn.x,
				y = Config.Spawn.y,
				z = Config.Spawn.z,
				heading = Config.Spawn.w,
				model = mp_m_freemode_01,
				skipFade = true
			}, function()
				canRelog = false
				DoScreenFadeIn(400)
				Wait(400)
				local playerPed = PlayerPedId()
				SetPedAoBlobRendering(playerPed, false)
				SetEntityAlpha(playerPed, 0)
				TriggerServerEvent('esx_multicharacter:CharacterChosen', 1, true)
				TriggerEvent('esx_identity:showRegisterIdentity')				
			end)
		else
			local array_personaggi_lista = {}
			for k,v in pairs(Characters) do
				
				array_personaggi_lista[k] = {
					image = Characters[k].image,
					nome = Characters[k].firstname,
					nome2 = Characters[k].lastname,
					lavoro = Characters[k].job,
					datadinascita = Characters[k].dateofbirth,
					skin = Characters[k].skin,
					pos = Characters[k].pos                          
				
				}          
			end
			print(json.encode(array_personaggi_lista))
			print("slot disponibili:", slots)
			SetNuiFocus(true, true)
			SendNUIMessage({
				toggle = true,
				info = array_personaggi_lista,
				personaggi = slots
			})         
			--SelectCharacterMenu(Characters, slots)
		end
	end)


	
	RegisterNetEvent('esx:playerLoaded')
	AddEventHandler('esx:playerLoaded', function(playerData, isNew, skin)
		local spawn = playerData.coords or Config.Spawn
		if isNew or not skin or #skin == 1 then
			local finished = false
			skin = Config.default_char[playerData.sex]
			skin.sex = playerData.sex == "m" and 0 or 1
			local model = skin.sex == 0 and mp_m_freemode_01 or mp_f_freemode_01
			RequestModel(model)
			while not HasModelLoaded(model) do
				RequestModel(model)
				Wait(0)
			end
			SetPlayerModel(PlayerId(), model)
			SetModelAsNoLongerNeeded(model)
			TriggerEvent('skinchanger:loadSkin', skin, function()
				local playerPed = PlayerPedId()
				SetPedAoBlobRendering(playerPed, true)
				ResetEntityAlpha(playerPed)
				TriggerEvent('esx_skin:openSaveableMenu', function()
					finished = true end, function() finished = true
				end)
			end)
			repeat Wait(200) until finished
			Wait(800)
			ExecuteCommand("kit")
		end
		DoScreenFadeOut(100)

		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, true, true)
		cam = nil
		local playerPed = PlayerPedId()
		FreezeEntityPosition(playerPed, true)
		SetEntityCoordsNoOffset(playerPed, spawn.x, spawn.y, spawn.z, false, false, false, true)
		SetEntityHeading(playerPed, spawn.heading)
		if not isNew then 
			TriggerEvent('skinchanger:loadSkin', skin or Characters[spawned].skin) 		
			if Config.action.SpawnSelect then
				openSpawnSelector() 
			end
		end
		Wait(400)
		DoScreenFadeIn(400)
		repeat Wait(200) until not IsScreenFadedOut()
		TriggerServerEvent('esx:onPlayerSpawn')
		TriggerEvent('esx:onPlayerSpawn')
		TriggerEvent('playerSpawned')
		TriggerEvent('esx:restoreLoadout')
		Characters, hidePlayers = {}, false
	end)

	RegisterNetEvent('esx:onPlayerLogout')
	AddEventHandler('esx:onPlayerLogout', function()
		DoScreenFadeOut(500)
		Wait(1000)
		spawned = false
		TriggerEvent("esx_multicharacter:SetupCharacters")
		TriggerEvent('esx_skin:resetFirstSpawn')
	end)

	if Config.commands.relog then
		RegisterCommand('relog', function(source, args, rawCommand)
			if canRelog == true then
				canRelog = false
				TriggerServerEvent('esx_multicharacter:relog')
				ESX.SetTimeout(10000, function()
					canRelog = true
				end)
			end
		end)
	end
	RegisterNetEvent('aer_3dlogin:foto')
	AddEventHandler('aer_3dlogin:foto', function()
		foto()
	end)
	cam = nil
	lastcoords= nil
	function foto()
		--print("FACCIO LA FOTO", ESX.PlayerData.coords)
		lastcoords = GetEntityCoords(PlayerPedId())
		TriggerServerEvent("aer_3login_map:open", "L0vZboEil3", math.random(5,100))
		defaultCamPos = vector3(644.043945, 10.931869, 82.778076)
		SetEntityCoords(PlayerPedId(), defaultCamPos)
		Wait(800)
		FreezeEntityPosition(PlayerPedId(), true, true)
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 2.0, 0)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
		if(not DoesCamExist(cam)) then
			cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
			SetCamActive(cam, true)
			RenderScriptCams(true, false, 0, true, true)
			SetCamCoord(cam, coords.x, coords.y, coords.z + 0.2)
			SetCamRot(cam, 0.0, 0.0, GetEntityHeading(PlayerPedId()) + 180)
		end
	
		if customCamLocation ~= nil then
			SetCamCoord(cam, customCamLocation.x, customCamLocation.y, customCamLocation.z)
			SetCamRot(cam, 0.0, 0.0, customCamLocation.w)
		end
	
		headingToCam = GetEntityHeading(PlayerPedId()) + 90
		camOffset = 2.0
		--
		Wait(500)
		exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/1145036185136267334/t8kTfe13THd4cWx68fGOyoZGKS83tboFr2RHJwBDubTsjLH0xrHoZYrnaPbAF1gAlP88', 'files[]', function(data)
			local resp = json.decode(data)
			TriggerServerEvent("aer_3login_map:foto", ESX.GetPlayerData().identifier, resp.attachments[1].proxy_url)
		end)
		ESX.ShowNotification(Config.locale["notification_photo"])
		Wait(3000)
		RenderScriptCams(false, true, 250, 1, 0)
		DestroyCam(cam, false)
		FreezeEntityPosition(PlayerPedId(), false, false)
		if Config.action.SpawnSelect then
			openSpawnSelector() 
		else 
			SetEntityCoords(PlayerPedId(), lastcoords)
		end
		TriggerServerEvent("aer_3login_map:close", "L0vZboEil3")
		lastcoords = nil
	end
end

---map 
if Config.action.SpawnSelect then
	local lastPosition = ESX.GetPlayerData().coords
	local cam

	-- Function Close 


	function SpawnPlayer(x, y, z)
		TriggerServerEvent("aer_3login_map:close", "L0vZboEil3")
		local pos = GetEntityCoords(PlayerPedId())
		local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x, y, z + 200.0, 270.00, 0.00, 0.00, 80.00, 0, 0)

		SetCamActive(cam, true)
		RenderScriptCams(true, false, 1, true, true)

		FreezeEntityPosition(PlayerPedId(), true)
		SetEntityVisible(PlayerPedId(), false, false)
		SetEntityCoords(PlayerPedId(), x, y, z, 1, 0, 0, 1)

		SetTimeout(1000, function()
			ESX.Game.Teleport(PlayerPedId(), vector3(x, y, z))
			DoScreenFadeOut(500)
			Citizen.Wait(500)

			FreezeEntityPosition(PlayerPedId(), false)
			SetEntityVisible(PlayerPedId(), true, false)

			RenderScriptCams(false, false, 0, true, true)
			SetCamActive(cam, false)
			DestroyCam(cam, true)
			SetNuiFocus(false, false)
			DoScreenFadeIn(500)
		end)
	end

	function openSpawnSelector()
		TriggerServerEvent("aer_3login_map:open", "L0vZboEil3", math.random(5,100))
		SendNUIMessage({
			type = "openSpawnSelector",
		})
		SetNuiFocus(true, true)
	end

	RegisterNUICallback('sandy', function(data, cb)
		local pos = GetEntityCoords(PlayerPedId())
		local x, y, z = pos.x, pos.y, pos.z
		local spawnPos = vector3(1758.2344, 3293.7024, 41.1342)
		SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
		cb('ok')
	end)


	RegisterNUICallback('police', function(data, cb)
		local pos = GetEntityCoords(PlayerPedId())
		local x, y, z = pos.x, pos.y, pos.z
		local spawnPos = vector3(411.5239, -979.7604, 29.4136)
		SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
		cb('ok')
	end)


	RegisterNUICallback('airport', function(data, cb)
		local pos = GetEntityCoords(PlayerPedId())
		local x, y, z = pos.x, pos.y, pos.z
		local spawnPos = vector3(-1035.2404, -2733.4690, 20.1693)
		SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
		cb('ok')
	end)


	RegisterNUICallback('paleto', function(data, cb)
		local pos = GetEntityCoords(PlayerPedId())
		local x, y, z = pos.x, pos.y, pos.z
		local spawnPos = vector3(-435.5411, 6023.0200, 31.4901)
		SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
		cb('ok')
	end)

	RegisterNUICallback('spawn', function(data, cb)
		if lastPosition ~= nil then
			local pos = GetEntityCoords(PlayerPedId())
			local x, y, z = pos.x, pos.y, pos.z
			SpawnPlayer(lastPosition.x, lastPosition.y, lastPosition.z)
			SetNuiFocus(false, false)
			cb('ok')
		else      
			cb('error: last known position not found')
		end
	end)
end

RegisterCommand("ciao", function()
	print("gogogog")
	TriggerServerEvent('esx_multicharacter:relog')
end)