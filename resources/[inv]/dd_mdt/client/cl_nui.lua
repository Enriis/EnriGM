local display = false

RegisterCommand("cs..", function(source, args)
    ESX.TriggerServerCallback("atn_rec:newsoc:getInfo", function(result) 
        for k,v in pairs(result) do
            SendNUIMessage({
                tipo = "carica",
                soc = LocalPlayer.state.infoPl.lavoro,
                dipendention = v.dipon,
                dipendentioff = v.dipoff,
                dipendentitot  = v.ndip,
                soldi = v.soldi,
                sporchi = v.sporchi,
                fatture = v.inarrivo
            })
        end
    end, "police")
    SetDisplay(not display)
    TriggerScreenblurFadeIn(1)
end)

RegisterNUICallback("chiudi", function()
    SetDisplay(false)
    TriggerScreenblurFadeOut(1000)
end)

RegisterNUICallback("notifica", function(data)
    if data.messaggio then
        if data.tipo == nil then data.tipo = "success" end
        ESX.ShowNotification(data.messaggio, data.tipo)
    else    
        print("Errore in js")
    end
end)

RegisterNUICallback("azioni", function(data)
    if data.tipo then
        TriggerServerEvent("atn_soc:azioni", GetPlayerServerId(PlayerId()), data.tipo, data.input)
    end
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        tipo = "pagina",
        stato = bool,
    })
end


