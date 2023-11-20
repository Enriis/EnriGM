local ESX = exports['es_extended']:getSharedObject()

RegisterCommand("kit", function()
    print("okee")
    SendNUIMessage({
        apri = true,
    })
    SetNuiFocus(true, true)
end)


RegisterNUICallback("confermaKit", function(data)
    if json.encode(data) == "[]" then return end
    SetNuiFocus(false, false)
    SendNUIMessage({
        apri = false,
    })
    ConfermaKit(data.id)
end)


function ConfermaKit(kits)
    local alert = lib.alertDialog({
        header = '👑 Artemis RolePlay 👑',
        content = 'Vuoi confermare il kit: '..kits.." ?",
        centered = true,
        cancel = true
    })
    if alert == "cancel" then
        Wait(250)
        ExecuteCommand("kit")
    else
        TriggerServerEvent("dd_kit:confermaKit", GetPlayerServerId(PlayerId()), kits)
        FreezeEntityPosition(PlayerPedId(), false)
        Wait(1000)
        TriggerEvent('vms_spawnselector:open')
		print("SpawnSelector")

    end
end

-- Add skill in base alla scelta