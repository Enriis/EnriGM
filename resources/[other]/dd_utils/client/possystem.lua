RegisterNetEvent("dd_pos:scegliGiocatore", function()

    -- local input = lib.inputDialog('Pos '..ESX.PlayerData.job.label, {
    --     {type = 'number', label = 'Importo', description = 'Inserisci importo', required = true, icon = {'fas', 'dollar'}},
    --     {type = 'input', label = 'Motivo', description = 'Informazioni acquisto', required = true, min = 4, max = 16},
    -- })


    -- options = {
    --     { value = '1', label = 'Segnalazione Player' },
    --     { value = '2', label = 'Segnalazione Bug' },
    --     { value = '3', label = 'Donazione'},
    -- }


    ESX.TriggerServerCallback("dd_pos:getCard", function(result)
        local info = {}
        for k,v in pairs(result) do
            table.insert(info, {label = v.banca, value = v.namebk})
        end
        Wait(200)
        local input = lib.inputDialog('Pagamento', {
            { type = 'select', label = 'Seleziona Carta', required = true,
                options = info
            },
            { type = "number", label = "Inserisci il pin", required = true },
        })
    
        local bank = input[1]
        local inputpin = input[2]
        local iban = result[bank].iban
        local pin = result[bank].pin
        if inputpin == tonumber(pin) then
            TriggerServerEvent("dd_pos:paga", GetPlayerServerId(PlayerId()), iban, importo, motivo)
        else
            ESX.ShowNotification("Il pin inserito non è corretto", "erro")
        end
    end)

        

    -- getMousePlayer(function(closestPlayer, closestDistance)
    --     if (closestPlayer and closestDistance) and ((closestPlayer ~= -1) and (closestDistance > 0 and closestDistance <= 3.0)) then
    --         local targetPlayer = GetPlayerServerId(closestPlayer)
    --         if targetPlayer then
    --         end
    --     end
    -- end)
end)