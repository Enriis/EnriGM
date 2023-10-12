local curPaused
local curPed
local curCinematic

Citizen.CreateThread(function ()
  while true do
    if nuiReady and ESX.PlayerLoaded then
      local ped = PlayerPedId()

      local paused = IsPauseMenuActive()
      if paused ~= curPaused then
        SendMessage('toggleHud', not paused)
        curPaused = paused
      end

      local inVehicle = IsPedInAnyVehicle(ped, false)

      if cinematic ~= curCinematic then
        DisplayRadar(false)
        curCinematic = cinematic
      elseif not cfg.persistentRadar and not cinematic then
        local isRadarHidden = IsRadarHidden()
        if inVehicle == isRadarHidden then
          DisplayRadar(inVehicle)
          SetRadarZoom(1150)
        end
      end

      if ped ~= curPed then
        if IsPedSwimming(ped) then
          local timer = 5000
          while not maxUnderwaterTime do
            Citizen.Wait(1000)
            timer -= 1000
            if not IsPedSwimmingUnderWater(ped) then
              if timer == 0 then maxUnderwaterTime = GetPlayerUnderwaterTimeRemaining(playerId) end
            else timer = 5000 end
          end
        else maxUnderwaterTime = GetPlayerUnderwaterTimeRemaining(playerId) end
        curPed = ped
      end
    end
    Citizen.Wait(cfg.refreshRates.checks)
  end
end)

local lastHealth
local lastArmour
local onSurface
local offVehicle
local isResting

CreateThread(function()
  while true do
    if nuiReady and ESX.PlayerLoaded then
      local ped = PlayerPedId()

      local curHealth = GetEntityHealth(ped)
      if curHealth ~= lastHealth then
        SendMessage('setHealth', { current = curHealth, max = GetEntityMaxHealth(ped) })
        lastHealth = curHealth
      end

      SendMessage('setArmour', curArmour)

      if cfg.stamina then
        local curStamina = GetPlayerStamina(playerId)
        local maxStamina = GetPlayerMaxStamina(playerId)
        --print(maxStamina)
        if curStamina < maxStamina then
          SendMessage('setStamina', {
            current = curStamina,
            max = maxStamina
          })
          isResting = false
        elseif not isResting then
          SendMessage('setStamina', false)
          isResting = true
        end
      end

      while not maxUnderwaterTime and IsPedSwimmingUnderWater(ped) do
        ESX.ShowHelpNotification('Initializating HUD... please stay on surface at least 5 seconds!', true)
        Citizen.Wait(0)
      end

      if maxUnderwaterTime then
        local curUnderwaterTime = GetPlayerUnderwaterTimeRemaining(playerId)
        if curUnderwaterTime < maxUnderwaterTime then
          SendMessage('setOxygen', {
            current = curUnderwaterTime,
            max = maxUnderwaterTime
          })
          onSurface = false
        elseif not onSurface then
          SendMessage('setOxygen', false)
          onSurface = true
        end
      end

      local inVehicle = IsPedInAnyVehicle(ped, false)
      if inVehicle then
        local curVehicle = GetVehiclePedIsUsing(ped, false)
        SendMessage('setVehicle', {
          speed = {
            current = GetEntitySpeed(curVehicle),
            max = GetVehicleModelMaxSpeed(GetEntityModel(curVehicle))
          },
          unitsMultiplier = cfg.metricSystem and 3.6 or 2.236936,
          fuel = cfg.fuel and GetVehicleFuelLevel(curVehicle),
        })
        offVehicle = false
      elseif not offVehicle then
        SendMessage('setVehicle', false)
        offVehicle = true
      end
    end
    Citizen.Wait(cfg.refreshRates.base)
  end
end)

local hunger
local thirst
local stress

local comandohud = true

RegisterCommand("hud", function()
  comandohud = not comandohud
  if comandohud then
    ESX.ShowNotification("Hai abilitato l'hud")
  else
    ESX.ShowNotification("Hai nascosto l'hud")
  end
  SendMessage('toggleHud', comandohud)
end)

RegisterNetEvent('dd_hud:updateStatus')
AddEventHandler('dd_hud:updateStatus', function(data)
    if data then
      hunger = data['fame']
      thirst = data['sete']
      curArmour = data['armour']
    end
end)

CreateThread(function()
  while true do
    if nuiReady and ESX.PlayerLoaded then
      SendMessage('status', {
        hunger = hunger,
        thirst = thirst,
        stress = cfg.stress and stress,
      })
    end
    Wait(cfg.refreshRates.status)
  end
end)

local InitializeHUD = function()
  SendMessage('setPlayerId', GetPlayerServerId(playerId))
  if cfg.serverLogo then SendMessage('setLogo') end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
 	ESX.PlayerLoaded = true
  SendMessage('toggleHud', true)
  InitializeHUD()
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
  SendMessage('toggleHud', false)
end)

AddEventHandler('onResourceStart', function(resourceName)
  if (currentResourceName == resourceName) then
    repeat Citizen.Wait(100) until nuiReady
    InitializeHUD()
  end
end)
