ESX = exports.es_extended:getSharedObject()

RegisterServerEvent('atn_rec:morte_deathinfo')
AddEventHandler('atn_rec:morte_deathinfo', function(data)
    local src = source
    local table = {}
    if (data.type == 'suicide') then
       table = {type = 'suicide', ids = PlayerIdentifier(src), source = src, name = GetPlayerName(src), id = '991036845603315722', cause = 'suicide'}
    elseif (data.type == 'killed_by_player') then
        table = {type = 'kill', ids = PlayerIdentifier(src), source = src, name = GetPlayerName(src), id = '991036845603315722', cause = data.deathcause, killerid = data.killerid, kName = GetPlayerName(data.killerid), kids = PlayerIdentifier(data.killerid)}
    end
    sendData(table)
end)

-- {
--     type = 'join', 
--     name = GetPlayerName(src), 
--     source = src, 
--     ids = PlayerIdentifier(src), 
--     role = '859123280619503696', 
--     id = '859123594402201610' -- Stanza 
-- }

-- AddEventHandler('esx:playerLoaded', function(src, xPlayer)
--     sendData({titolo = 'INGRESSO', name = GetPlayerName(src), source = src, ids = PlayerIdentifier(src), role = '859123280619503696', id = '859123594402201610'})
-- end)

local ad = {
    id_stanza = "sadasdas",
    embed = {
        title = "ASD",
        color = "#123123",
        description = "asdasdsa"
    }
}

local test = {
    body = {
        embed = {
            id_stanza = "1156609051526967426",
            title = "SERVER ONLINE", 
            color = "#57F287", 
            description = "Server online, connettiti."
        }
    }
}

-- RegisterServerEvent('atn_logs:spawn', function(src) -- Spawn triggerano nel fnx-login
--     sendData({type = 'join', name = GetPlayerName(src), source = src, ids = PlayerIdentifier(src), id = '991036555856609362'})
-- end)

-- AddEventHandler('esx:playerDropped', function(src, reason)
--     sendData({type = 'quit', name = GetPlayerName(src), source = src, ids = PlayerIdentifier(src), r = reason, id = '991036627726000299'})
-- end)



--[[
AddEventHandler('onResourceStart', function(rName)
    if rName then
        sendData({
            sendEmbed = true, 
            name = 'LOG SCRIPTER [START]', 
            fields = {
                {name = '**Risorsa:**', value = (rName) or 'Non Disponibile'},
            }, 
            id = '859123612371910677', 
            type = 'customTrigger', 
            color = 'RANDOM'
        })
    end
end)

AddEventHandler('onResourceStop', function(rName)
    if rName then
        sendData({
            sendEmbed = true, 
            name = 'LOG SCRIPTER [STOP]', 
            fields = {
                {name = '**Risorsa:**', value = (rName) or 'Non Disponibile'},
            }, 
            id = '859123612371910677', 
            type = 'customTrigger', 
            color = 'RANDOM'
        })
    end
end)

AddEventHandler('playerConnecting', function(name, kick, def)
    local src = source
    def.defer()
    Citizen.Wait(50)
    def.update('Benvenuto '..tostring(name).. ' stiamo controllando le tue informazioni...')
    Citizen.Wait(1500)
    sendData({type = 'join', name = name, source = src, ids = PlayerIdentifier(src), id = '859123594402201610', role = '859123280619503696'}, function(data)
        if not data or not data.text or data.text == 'OK' or data.text == 'ERROR' then
            def.done()
        elseif data.text == 'STEAM' then
            def.done('Accesso non Autorizzato: Non hai Steam collegato a FiveM. https://discord.gg/artemisrp')
        elseif data.text == 'DISCORD_NOT_CONNECTED' then
            def.done('Accesso non Autorizzato: Non hai Discord collegato a FiveM. https://discord.gg/artemisrp')
        elseif data.text == 'DISCORD_GUILD' then
            def.done('Accesso non Autorizzato: Non sei nel server Discord. https://discord.gg/artemisrp')
        elseif data.text == 'BANNED' then
            def.done('Accesso non Autorizzato: Sei stato Bannato su Discord. https://discord.gg/artemisrp')
        else
            print('Altro: '..tostring(data.text)..'')
        end
    end)
end)
]]