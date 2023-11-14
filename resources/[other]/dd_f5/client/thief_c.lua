local ammanettato = false


function ControlloMenette()
    return ammanettato
end

RegisterNetEvent("en_f5:thief:ammanettaTarget_c", function(types, playerheading, playerCoords, playerlocation)
    if types == 1 then -- Player
        Citizen.Wait(250)
        loadanimdict('mp_arrest_paired')
        TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
        Citizen.Wait(3000)
    elseif types == 2 then -- Target
        if ammanettato then return end
        playerPed = GetPlayerPed(-1)
        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
        local x, y, z = table.unpack(playerCoords + playerlocation * 1.0)
        SetEntityCoords(GetPlayerPed(-1), x, y, z)
        SetEntityHeading(GetPlayerPed(-1), playerheading)
        Citizen.Wait(250)
        loadanimdict('mp_arrest_paired')
        TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
        Citizen.Wait(3760)
        loadanimdict('mp_arresting')
        TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
        lib.disableControls:Add(24,257,25,263,45,22,44,37,289,168,57,166,288,182,311,289,170,167,0,26,73,199,59,71,72,36,47,264,257,140,141,142,143,75,21,22)
        ammanettato = true
    end
end)

RegisterNetEvent("en_f5:thief:smanettaTarget_c", function(types, playerheading, playerCoords, playerlocation)
    if types == 1 then -- Player
        Citizen.Wait(250)
        loadanimdict('mp_arresting')
        TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
        Citizen.Wait(5500)
        ClearPedTasks(GetPlayerPed(-1))
    elseif types == 2 then -- Target
        if not ammanettato then return end
        local x, y, z = table.unpack(playerCoords + playerlocation * 1.0)
        SetEntityCoords(GetPlayerPed(-1), x, y, z)
        SetEntityHeading(GetPlayerPed(-1), playerheading)
        Citizen.Wait(250)
        PlayAnim('mp_arresting', 'b_uncuff')
        Citizen.Wait(5500)
        ClearPedTasks(GetPlayerPed(-1))
        lib.disableControls:Remove(24,257,25,263,45,22,44,37,289,168,57,166,288,182,311,289,170,167,0,26,73,199,59,71,72,36,47,264,257,140,141,142,143,75,21,22)
        ammanettato = false
    end
end)

-- Funzioni
function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname)
		while not HasAnimDictLoaded(dictname) do
			Citizen.Wait(1)
		end
	end
end
