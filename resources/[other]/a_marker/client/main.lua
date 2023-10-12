MyPed = nil
MyCoords = vector3(0,0,0)
CurrentZone = nil

local CurrentChunk = nil
local CurrentChunks = {}
local MarkersToCheck = {}
RegisteredMarkers = {}
MarkerWithJob = {}
TempMarkerWithJob = {}
CurrentJob = nil

LetSleep = true
local abs = math.abs

CreateThread(function ()
    while not ESX.IsPlayerLoaded() do
        Wait(10)
    end

    CurrentJob = ESX.GetPlayerData().job
    RegisterTempMarkers()
end)

CreateThread(function ()
    while true do
        MyPed = PlayerPedId()
        MyCoords = GetEntityCoords(MyPed)
        Wait(250)
    end
end)

CreateThread(function()
    while true do
        local chunk = GetCurrentChunk(MyCoords)
        if chunk ~= CurrentChunk then
            CurrentChunks = GetNearbyChunks(MyCoords)
        end
        MarkersToCheck = {}
        for i = 1, #CurrentChunks do
            if RegisteredMarkers[CurrentChunks[i]] then
                for _, zone in pairs(RegisteredMarkers[CurrentChunks[i]]) do
                    table.insert(MarkersToCheck, zone)
                end
            end
        end
        Wait(1100)
    end
end)

CreateThread(function ()
    while true do
        local isInMarker, _currentZone = false, nil
        LetSleep = true
        for i = 1, #MarkersToCheck do
            local zone = MarkersToCheck[i]
            local distance = #(MyCoords - zone.pos)
            if distance < zone.drawDistance then
                LetSleep = false
                if zone.show3D then
                    DrawText3D(zone.pos.x, zone.pos.y, zone.pos.z, zone.msg)
                else
                    if zone.type ~= -1 then
                        DrawMarker(zone.type, zone.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, zone.scale.x, zone.scale.y, zone.scale.z, zone.color.r, zone.color.g, zone.color.b, 100, false, true, 2, false, nil, nil, false)
                    elseif zone.texture ~= nil then
                        if not HasStreamedTextureDictLoaded("marker") then
                            RequestStreamedTextureDict("marker", true)
                            while not HasStreamedTextureDictLoaded("marker") do
                                Wait(1)
                            end
                        else
                            DrawMarker(9, zone.pos, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, zone.scale.x, zone.scale.y, zone.scale.z, 255, 255, 255, 255, false, true, 2, false, "marker", zone.texture, false)
                        end 
                    end
                end
                if #(MyCoords.xy - zone.pos.xy) < #(zone.scale.xy/2) and abs(MyCoords.z - zone.pos.z) < zone.scaleZ then
                    isInMarker, _currentZone = true, zone    
                end
            end
        end

		if isInMarker and not HasAlreadyEnteredMarker then
            CurrentZone = _currentZone
			HasAlreadyEnteredMarker = true
			TriggerEvent("gridsystem:hasEnteredMarker", _currentZone)
		end
		if HasAlreadyEnteredMarker and ( not isInMarker or _currentZone ~= CurrentZone) then
			HasAlreadyEnteredMarker = false
			TriggerEvent("gridsystem:hasExitedMarker")
		end
        Wait(3)
		if LetSleep then
			Citizen.Wait(750)
		end
    end
end)



CreateThread(function ()
    while true do
        if CurrentZone then
            local _zone = CurrentZone
            if _zone and not _zone.mustExit then
                if not _zone.show3D then
                    if _zone.titolo and _zone.posizione then
                    --     TriggerEvent("dd:Apri", _zone.icona, _zone.titolo, _zone.tasto, _zone.msg)
                    -- else
                    --     ESX.ShowHelpNotification(_zone.msg)
                    -- end
                        lib.showTextUI('[E] - '.._zone.titolo, {position = _zone.posizione, icon = 'hand', style = {borderRadius = 10, backgroundColor = '#D14527', color = 'white'}})
                    else
                        ESX.ShowHelpNotification(_zone.msg)
                    end
                end

                if IsControlJustReleased(0, _zone.control) then 
                    if _zone.action then
                        local status, err = pcall(_zone.action)
                        if not status then
                            LogError(string.format("Error executing action for marker %s. Error: %s", _zone.name, err))
                        end
                    end

                    if _zone.forceExit then
                        CurrentZone.mustExit = true
                    end
                end
            end
        end
        Wait(0)
        if LetSleep then
            Wait(700)
        end
    end
end)