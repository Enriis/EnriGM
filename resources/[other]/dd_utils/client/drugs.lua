Citizen.CreateThread(function()
    for k,v in pairs(ConfigDroga) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'campo_'..k,
            type = 23,
            texture = nil,
            scale = vec3(0.8,0.8,0.8),
            color = { r = 255, g = 0, b = 0 },
            pos = v.pos,
            control = 'E',
            posizione = "left-center",
            titolo = v.type,
            action = function()
                if not lib.progressActive() then
                    Azione(v.azione, v.label, v.item, v.item2)
                    TriggerServerEvent("dd_drugs:getStatusCampo", GetPlayerServerId(PlayerId()), v.label)
                else
                    PlaySoundFrontend(-1, "FAKE_ARRIVE", 'MP_PROPERTIES_ELEVATOR_DOORS', 2)
                    -- Disable control a modo mio hahahah (fox sei un coglione)
                end
            end,
            onEnter = function()
            end,
            onExit = function()
                lib.hideTextUI()
                ESX.UI.Menu.CloseAll()
            end,
            msg = "INTERAGIRE",
        })
    end
end)

function Azione(tipo, campo, item, item2)
    if tipo == "raccolta" then
        ESX.TriggerServerCallback("dd_dtrug:getStatoCampo", function(result) 
            if not result then
                ESX.ShowNotification("Campo non accessibile")
            else
                local progress = lib.progressCircle({
                    duration = 2500,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                        move = true,
                        combat = true,

                    },
                    anim = {
                        dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                        clip = 'machinic_loop_mechandplayer'
                    },
                })
                if progress then
                    TriggerServerEvent("dd_drugs:azioni", GetPlayerServerId(PlayerId()), tipo, campo, item)
                end
            end
        end, campo)
    elseif tipo == "processo" then

    end
end