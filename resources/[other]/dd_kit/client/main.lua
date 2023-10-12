local ESX = exports['es_extended']:getSharedObject()

RegisterCommand("kit", function()
    TriggerScreenblurFadeIn(300)
    SendNUIMessage({
        apri = true,
    })
    SetNuiFocus(true, true)
end)


RegisterNUICallback("confermaKit", function(data)
    print(json.encode(data))
    if json.encode(data) == "[]" then return end
    TriggerScreenblurFadeOut(300)
    SetNuiFocus(false, false)
    SendNUIMessage({
        apri = false,
    })
    ConfermaKit(data.id)
end)


function ConfermaKit(num)
    local alert = lib.alertDialog({
        header = '👑 Artemis RolePlay 👑',
        content = 'Vuoi confermare il kit: '..num.." ?",
        centered = true,
        cancel = true
    })
    print(alert)
    if alert == "cancel" then
        Wait(250)
        ExecuteCommand("kit")
    else
        TriggerServerEvent("dd_kit:confermaKit", GetPlayerServerId(PlayerId()), "1")
        FreezeEntityPosition(PlayerPedId(), false)
    end
end

-- Add skill in base alla scelta