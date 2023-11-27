-- Evento gestione server conessione giocatore

function GetDiscordID(id)
    if not id then return {} end
    local table = {}
    local discordID = ""
    for i = 0, (GetNumPlayerIdentifiers(id) - 1), 1 do 
        local id = GetPlayerIdentifier(id, i)
        if id then
            if string.find(id, 'discord') then
                discordID = id
            end
        end
    end
    return discordID
end

function CheckStaff(data, playerId)
    PerformHttpRequest('http://localhost:4568/checkRole', function(err, text, headers)
        TriggerEvent("dd_admin:sendPex", playerId, text)

        exports.dd_bot:SendLog({
            embed = {
                id_stanza = "1173592760897523712",
                title = "ADD PEX GAME", 
                color = "5763719", 
                description = "Aggiunto ruolo: **"..text.."** al giocatore **ID: "..playerId.." | NOME: "..GetPlayerName(playerId).."**"
            }
         })

    end, 'POST', json.encode(data), {['Content-Type'] = 'application/json'})
end

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer, isNew)
    if playerId then


        -- Funziona primo evento playerLoaded  del server

        -- Banca

        -- local prestti = LoadResourceFile(GetCurrentResourceName(), "json/prestiti.json")
        -- local data_prestiti = json.decode(prestti or '{}')

        -- local xPlayer = ESX.GetPlayerFromId(playerId)
        -- if data_prestiti[xPlayer.getIdentifier()] then
        --     for k,v in pairs(data_prestiti[xPlayer.getIdentifier()]) do
        --         local data = data_prestiti[xPlayer.getIdentifier()][k].dataRes
        --         local avvisi = data_prestiti[xPlayer.getIdentifier()][k].avvisi
        --         local importoMancante = data_prestiti[xPlayer.getIdentifier()][k].impRes
        --         local oggi = os.time()

        --         local timestampData = os.time(
        --             {day=tonumber(data:sub(1,2)), 
        --             month=tonumber(data:sub(4,5)), 
        --             year=tonumber(data:sub(7))}
        --         )

        --         if timestampData < oggi then
        --             Wait(5000)
        --             if tonumber(avvisi) == 0 then 
        --                 xPlayer.showNotification("Prestito presso la banca: "..k.." scaduto. Hai ricevuto un supplemento di 3 giorni per restituire il prestito. Mancano: "..importoMancante)
        --                 avvisi = tonumber(avvisi + 1)
        --                 print("Salvataggio", avvisi)
        --                 SaveResourceFile(GetCurrentResourceName(), "json/prestiti.json", json.encode(data_prestiti, {indent = true}), -1)
        --             elseif tonumber(avvisi) >= 6 then
        --                 xPlayer.showNotification("Prestito presso la banca: "..k.." scaduto. Non hai restituito in tempo il prestito. Saldo azzerato.")
        --                 PrestitiDelateAccount(playerId, importoMancante, k)
        --             end
        --         end
        --     end
        -- end 

        -- Skill
        CheckSkillPlayer(playerId)

        -- Ped
        xPlayer.triggerEvent("dd_skin:changeHealthPed")

        -- Bot Discord
        local discordID = string.sub(GetDiscordID(playerId), 9)
        if discordID == nil or discordID == "" then
            --espelli
            DropPlayer(playerId, "Non hai una connessione a discord")
        end
        CheckStaff({array = {
            id = discordID
        }}, playerId)

        -- Container

        CaricaContainer()
        
    end
end)


ESX.RegisterServerCallback("dd_utils:getAccount", function(source, cb, types)
    local xPlayer = ESX.GetPlayerFromId(source)
    local account = xPlayer.getAccount(types)
    cb(account)
end)

RegisterServerEvent("dd_uitils:main_s", function(source, tipo)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    if tipo == "status" then
        xPlayer.triggerEvent('dd_hud:updateStatus', xPlayer.getStatus(true))
    end
end)