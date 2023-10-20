RegisterNetEvent("dd_pos:scegliGiocatore", function()
    getMousePlayer(function(closestPlayer, closestDistance)
        if (closestPlayer and closestDistance) and ((closestPlayer ~= -1) and (closestDistance > 0 and closestDistance <= 3.0)) then
            local targetPlayer = GetPlayerServerId(closestPlayer)
            if targetPlayer then
                local input = lib.inputDialog('Pos '..ESX.PlayerData.job.label, {
                    {type = 'number', label = 'Importo', description = 'Inserisci importo', required = true, icon = {'fas', 'dollar'}},
                    {type = 'input', label = 'Motivo', description = 'Informazioni acquisto', required = true, min = 4, max = 16},
                })
                if input then
                    TriggerServerEvent("dd_pos:apriMenuCarte",  GetPlayerServerId(PlayerId()), targetPlayer, input[1], input[2], ESX.PlayerData.job.label)
                end
            end
        end
    end)
end)


RegisterNetEvent("dd_pos:apriMenuCarte_Cl", function(importo, motivo, soc, idPl)
    ESX.TriggerServerCallback("dd_pos:getCard", function(result)
        local info = {}
        if not next(result) then ESX.ShowNotification("Non hai carte con te") TriggerServerEvent("dd_pos:alert", idPl, GetPlayerServerId(PlayerId()), "nocr") return end
        for k,v in pairs(result) do
            table.insert(info, {label = v.banca, value = v.namebk})
        end
        local input = lib.inputDialog('Pagamento: '..importo.."$", {
            { type = 'select', label = 'Seleziona Carta', required = true,
                options = info
            },
            { type = "input", label = "Inserisci il pin", required = true,  password = true},
            { type = "textarea", label = "Informazioni Transazione", placeholder = " Importo: "..importo.."$\n Info: "..motivo, disabled = true},
        })

        local bank = input[1]
        local inputpin = input[2]
        local iban = result[bank].iban
        local pin = result[bank].pin
        local LabelBank = result[bank].banca
        if tonumber(inputpin) == tonumber(pin) then
            TriggerServerEvent("dd_pos:paga", GetPlayerServerId(PlayerId()), iban, bank, importo, motivo, soc, idPl, LabelBank)
        else
            ESX.ShowNotification("Il pin inserito non è corretto", "error")
            TriggerServerEvent("dd_pos:alert", idPl, GetPlayerServerId(PlayerId()), "pinerr")
        end
    end)
end)

