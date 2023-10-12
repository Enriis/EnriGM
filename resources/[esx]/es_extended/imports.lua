ESX = exports['es_extended']:getSharedObject()

if not IsDuplicityVersion() then -- Only register this event for the client
    AddEventHandler('esx:setPlayerData', function(key, val, last)
        if GetInvokingResource() == 'es_extended' then
            ESX.PlayerData[key] = val
            if OnPlayerData then
                OnPlayerData(key, val, last)
            end
        end
    end)

    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        ESX.PlayerLoaded = true
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        ESX.PlayerLoaded = false
        ESX.PlayerData = {}
    end)
end


local isSelectingActive = false
local closestPed = nil

local function detectClosestPedToMouse()
    local plyPed = PlayerPedId()
    closestPed = nil
    while isSelectingActive do
        Citizen.Wait(200)
        local plyPos = GetEntityCoords(plyPed) 
        local xClosestDistance = 5.0
        local yClosestDistance = 5.0
        for k, currentPed in pairs(GetGamePool('CPed')) do
            if IsPedAPlayer(currentPed) and currentPed ~= plyPed then
                local currentPedCoords = GetPedBoneCoords(currentPed, 24818, 0.0, 0.0, 0.0)
                local distance = GetDistanceBetweenCoords(currentPedCoords, plyPos, true)
                if distance < 6 then
                    local _, screenX, screenY = GetScreenCoordFromWorldCoord(currentPedCoords.x, currentPedCoords.y, currentPedCoords.z)
                    if screenX > 0 and screenY > 0 then
                        local mouseX, mouseY = GetNuiCursorPosition()
                        local screenWidth, screenHeight = GetActiveScreenResolution()
                        if (mouseX <= screenWidth and mouseY <= screenHeight) then
                            mouseX = mouseX/screenWidth
                            mouseY = mouseY/screenHeight
                            local xScreenDistance = math.abs(mouseX-screenX)
                            local yScreenDistance = math.abs(mouseY-screenY)
                            if xScreenDistance < 0.03 and yScreenDistance < 0.1 then
                                if xClosestDistance > xScreenDistance and yClosestDistance > yScreenDistance then
                                    xClosestDistance = xScreenDistance
                                    yClosestDistance = yScreenDistance
                                    closestPed = currentPed
                                end
                            else
                                if currentPed == closestPed then
                                    closestPed = nil
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function getMousePlayer(cb)
    if (isSelectingActive) then return end
    isSelectingActive = true
    Citizen.CreateThread(detectClosestPedToMouse)
    Citizen.CreateThread(function() 
        SetNuiFocus(false, true)
        SetCursorLocation(0.5, 0.5)
        AddTextEntry('billing_ui_select_player', 'Usa il mouse per selezionare')
        while isSelectingActive do
            DisplayHelpTextThisFrame('billing_ui_select_player', false)
            if (closestPed) then
                local pedCoords = GetPedBoneCoords(closestPed, 24817, 0.0, 0.0, 0.0)
                DrawMarker(3, pedCoords.x, pedCoords.y, (pedCoords.z + 1.0), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.35, 0.35, 0.35, 0, 0, 255, 200, true, true, 2, false, nil, nil, false)
                if IsDisabledControlJustReleased(0, 24) then
                    local targetPlayer = NetworkGetPlayerIndexFromPed(closestPed)
                    isSelectingActive = false
					SetNuiFocus(false, false)
					DisablePlayerFiring(PlayerPedId(),false)
					cb(targetPlayer, (#(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestPed))))
                end
            end
            if IsDisabledControlJustReleased(0, 200) then
				isSelectingActive = false
				SetNuiFocus(false, false)
				DisablePlayerFiring(PlayerPedId(),false)
				cb(false, false)
            end
			DisablePlayerFiring(PlayerPedId(),true)
			DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 200, true)
            Citizen.Wait(0)
        end
        closestPed = nil
    end)
end