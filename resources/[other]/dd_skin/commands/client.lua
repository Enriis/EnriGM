if Config.Commands.reloadskin then
	local sesso = false
	RegisterCommand('reloadskin', function()
		if not sesso then
			ESX.TriggerServerCallback('fivem-appearance:getPlayerSkin', function(appearance)
				exports['dd_skin']:setPlayerAppearance(appearance)
			end)
			ESX.ShowNotification(Config.Lang.skinfixed)
			sesso = true
			Citizen.Wait(5000)
			sesso = false
		else
			ESX.ShowNotification(Config.Lang.waitseconds)
		end
	end)
end

if Config.Commands.reloadprop then
	local sesso2 = false
	RegisterCommand('reloadprop', function()
		if not sesso2 then
			for k, v in pairs(GetGamePool('CObject')) do
				if IsEntityAttachedToEntity(PlayerPedId(), v) then
					SetEntityAsMissionEntity(v, true, true)
					DeleteObject(v)
					DeleteEntity(v)
				end
			end
			ESX.ShowNotification(Config.Lang.propfixed)
			sesso2 = true
			Citizen.Wait(5000)
			sesso2 = false
		else
			ESX.ShowNotification(Config.Lang.waitseconds)
		end
	end)
end

if Config.Commands.skin then
	RegisterNetEvent('fleb5:menu/skin', function(submitCb, cancelCb)
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
				end
				if submitCb then submitCb() end
			else
				if cancelCb then cancelCb() end
				if Config.ESX.useLegacy then
				ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
				end
			end
		end, config)
		TriggerEvent('skinchanger:modelLoaded')
	end)
end