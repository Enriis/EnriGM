local tentativi = 0

Citizen.CreateThread(function()
    for k,v in pairs(ConfigBanche) do 
        CreaBlips(v.label, 108, 2, v.pos, 0.8)
        TriggerEvent('gridsystem:registerMarker', {
            name = 'blip_container_'..k,
            type = 23,
            texture = nil,
            scale = vector3(0.8,0.8,0.8),
            color = {r = 255, g = 0, b = 0},
            pos = v.pos,
            control = 'E',
            posizione = "left-center",
            titolo = v.label,
            action = function()
                Banca(k, v.grado, v.tasse, v.label)
            end,
            onExit = function()
                ESX.UI.Menu.CloseAll()
            end,
            msg = "[E] Per accedere alla banca: "..v.label,
        })
    end
end)

function Banca(nome, grado, tasse, label)
    local elementi = {}
    local pin 
    ESX.TriggerServerCallback("en_bank:getInfoBank", function(result) 
        if not result then 
            table.insert(elementi, {label = "Crea Conto", value = "crea"}) 
        else
            table.insert(elementi, {label = "Accedi", value = "acc"})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_main_menu', {
            title = label,
            align = 'top-left',
            elements = elementi
        }, function(data, menu)
            local verifica = data.current.value
            
            if verifica == 'crea' then

                ESX.TriggerServerCallback("dd_utils:getAccount", function(returnss) 
                    if tonumber(returnss.money) >= tonumber(tasse) then 
                        local input = lib.inputDialog('Creazione Conto', {
                            {type = 'number', label = 'Pin Conto', description = 'Pin per accesso al conto'}
                        })

                        if not input[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") return else pin = tonumber(input[1]) end
                        TriggerServerEvent("en_bank:createAccount", GetPlayerServerId(PlayerId()), nome, tasse, grado, label, pin)
                        ESX.UI.Menu.CloseAll()
                    else
                        local calcolo 
                        if tonumber(returnss.money) == 0 then
                            calcolo = tasse
                        else 
                            calcolo = tasse - returnss.money
                        end
                        ESX.ShowNotification("Non hai abbastanza soldi in contanti, servono altri: "..calcolo.."$")
                        ESX.UI.Menu.CloseAll()
                    end
                end, "money")
                    


            elseif verifica == 'acc' then

                if tentativi > 5 then
                    print("Test furto acc credenziali rubate") -- Sviluppare alla fine 
                end
                local input = lib.inputDialog('Accesso Conto', {
                    {type = 'number', label = 'Pin Conto', description = 'Pin per l\'accesso al conto'}
                })

                if not input[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") 
                    return 
                elseif tonumber(input[1]) ~= tonumber(result.pin) then 
                    ESX.ShowNotification("Il pin non è corretto") 
                    tentativi = tentativi + 1 
                else
                    tentativi = 0
                    Accesso(nome, label, grado)
                end
            end
    
            end, function(data, menu)
                menu.close()
            end
        )

    end, nome)
end


function Accesso(nome, label, grado)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_bank_acc_account_bank', {
        title = label,
        align = 'top-left',
        elements = {
            {label = 'Informazioni Conto', value = 'info'},
            {label = 'Preleva', value = 'pre'},
            {label = 'Deposita', value = 'dep'},
            {label = 'Azioni Prestiti', value = 'siti'},
            {label = 'Bonifico', value = 'iban'}
            -- {label = 'Fatture', value = 'bills'}
        }
    }, function(data, menu)
        local verifica = data.current.value

        if verifica == "info" then
            ESX.TriggerServerCallback("en_bank:infoConto", function(result) 
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_bank_info_menu', {
                    title = 'Informazioni Conto',
                    align = 'top-left',
                    elements = {
                        {label = 'IBAN: '..result.iban, value = true, information = result.iban, info = "IBAN"},
                        {label = 'SALDO: '..result.money.."$", value = true, information = result.money.."$", info = "saldo"},
                        {label = 'PIN: '..result.pin, value = true, information = result.pin, info = "pin"}
                    }
                    }, function(data, menu)
                    local verifica = data.current.value
                    local infonot = data.current.info
                    if verifica then
                        lib.setClipboard(data.current.information)
                        ESX.ShowNotification("Hai copiato: "..infonot)
                    end
                    
                    end, function(data, menu)
                        menu.close()
                    end
                )
            end, nome)
        elseif verifica == 'pre' then
            local input = lib.inputDialog('Preleva Importo', {
                {type = 'number', label = 'Importo', description = 'Digitare l\'importo da prelevare'}
            })
            if not input[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") return end
            if tonumber(input[1]) > 0 then
                local data = {
                    importo = tonumber(input[1]),
                    banca = nome,
                    label = label, 
                    grado = grado
                }
                TriggerServerEvent("en_bank:azioni", "pre", GetPlayerServerId(PlayerId()), data)
            else
                ESX.ShowNotification("Non puoi prelevare 0$", "error")
            end
        elseif verifica == "dep" then
            local input = lib.inputDialog('Deposita Importo', {
                {type = 'number', label = 'Importo', description = 'Digitare l\'importo da depositare'}
            })
            if not input[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") return end

            if tonumber(input[1]) > 0 then
                ESX.TriggerServerCallback("dd_utils:getAccount", function(result) 
                    if tonumber(result.money) >= tonumber(input[1]) then
                        local data = {
                            importo = tonumber(input[1]),
                            banca = nome,
                            label = label, 
                            grado = grado
                        }
                        TriggerServerEvent("en_bank:azioni", "dep", GetPlayerServerId(PlayerId()), data)
                        if tonumber(input[1]) > 200000 then
                            -- Allerta polizia o reparto dedicato causa reciclaggio
                        end
                    else
                        ESX.ShowNotification("Non disponi di quella somma in contanti")
                        return
                    end
                end, "money")
            else
                ESX.ShowNotification("Non puoi depositare 0$", "error")
            end
        elseif verifica == "siti" then
            local elementi = {}
            local dataPrestito 
            local importoPresito
            local restituitiPrestito

            ESX.TriggerServerCallback("en_bank:azioniPresiti", function(result)
                if not result then
                    table.insert(elementi, {label = "Richeidi Prestito", value = "ric"})
                else    
                    for k,v in pairs(result) do
                        dataPrestito = v.dataRes
                        importoPresito = v.impRes
                        restituitiPrestito = v.restituiti
                    end
                    table.insert(elementi, {label = "Informazioni Prestito", value = "info"})
                    table.insert(elementi, {label = "Restituisci Prestito", value = "restituisci"})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_bank_azioni_prestiti', {
                    title = 'Azioni Prestiti',
                    align = 'top-left',
                    elements = elementi
                }, function(data, menu)
                    local verifica = data.current.value
            
                    if verifica == 'ric' then
                        local input = lib.inputDialog('IMPORTO', {
                            {type = 'number', label = 'IMPORTO', description = 'Digitare l\'importo del prestito'}
                        })
                        if not input[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") return end
                        local importo = input[1]
    
                        if tonumber(input[1]) > 0 then
                            local data = {
                                banca = nome,
                                grado = grado,
                                label = label,
                                importo = importo
                            }
        
                            TriggerServerEvent("en_bank:azioni", "ricprestito", GetPlayerServerId(PlayerId()), data)
                            ESX.UI.Menu.CloseAll()
                        else
                            ESX.ShowNotification("Non puoi richiedere 0$", "error")
                        end
                        
                    elseif verifica == "info" then
                        ESX.UI.Menu.CloseAll()
                        local alert = lib.alertDialog({
                            header = 'INFORMAZIONI PRESTITO',
                            content = "Hai un'operazione aperta con la banca: "..label.." \n \n Importo da RESTITUIRE: "..importoPresito.."$ \n \n Data di Scadenza: "..dataPrestito.."\n \n Importo Restituito: "..restituitiPrestito.."$",
                            centered = true,
                            cancel = false
                        })

                    elseif verifica == "restituisci" then
                        local input = lib.inputDialog('IMPORTO PRESTITO', {
                            {type = 'number', label = 'IMPORTO PRESTITO', description = 'Digitare l\'importo che desideri restituire'}
                        })
                        if not input[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") return end

                        if tonumber(input[1]) > 0 then
                            local data = {
                                banca = nome,
                                labelBank = label,
                                grado = grado,
                                importo = input[1]
                            }
                            TriggerServerEvent("en_bank:azioni", "resprestito", GetPlayerServerId(PlayerId()), data)
                        else
                            ESX.ShowNotification("Non puoi restituire 0$", "error")
                        end

                    end
            
                    end, function(data, menu)
                        menu.close()
                    end
                )

            end)

        elseif verifica == "iban" then
            local input = lib.inputDialog('IBAN', {
                {type = 'input', label = 'IBAN', description = 'Digitare l\'iban per il trasferimento'}
            })
            if not input[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") return end
            local iban = input[1]
            ESX.TriggerServerCallback("en_bank:checkIBAN", function(result) 
                if result then
                    local inputs = lib.inputDialog('Importo', {
                        {type = 'number', label = 'IMPORTO', description = 'Digitare l\'importo per il trasferimento'}
                    })
                    if not inputs[1] then ESX.ShowNotification("Non puoi lasciare il campo vuoto") return end
                    if tonumber(inputs[1]) > 0 then
                        local data = {
                            importo = tonumber(inputs[1]),
                            banca = nome,
                            label = label, 
                            grado = grado,
                            iban = iban
                        }
                        TriggerServerEvent("en_bank:azioni", "tras", GetPlayerServerId(PlayerId()), data)
                        ESX.UI.Menu.CloseAll()
                    else
                        ESX.ShowNotification("Non puoi trasferire 0$", "error")
                    end
                else
                    ESX.ShowNotification("Iban inesistente", "error")
                    ESX.UI.Menu.CloseAll()
                    return
                end
            end, iban)
        end

        end, function(data, menu)
            menu.close()
        end
    )
end


RegisterNetEvent("en_bank:dialogRichiesta", function(banca, res, importo, tag, labelBank)
    local alert = lib.alertDialog({
        header = 'INFORMAZIONI PRESTITO',
        content = 'Vuoi confermare il prestito da parte della banca: '..banca..' di: '..importo.."$ al TAG del: "..tag.."% \n \n Alllo scadere del prestito devi restituire: "..res.."$",
        centered = true,
        cancel = true
    })

    if alert == "confirm" then
        local data = {
            restituisci = res,
            banca = banca,
            importo = importo,
            label = labelBank,
            tag = tag
        }
        TriggerServerEvent("en_bank:azioni", "addPrestito", GetPlayerServerId(PlayerId()), data)
    elseif alert == "cancel" then
        ESX.ShowNotification("Hai annullato l'azione di presito presso la banca: "..banca, "info")
    end
end)


    --TriggerServerEvent("en_bank:createAccount", GetPlayerServerId(PlayerId()), nome, tasse, grado, label, pin)