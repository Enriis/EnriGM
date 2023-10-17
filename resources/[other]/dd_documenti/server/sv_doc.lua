-- FOTO SPAWN
ox = exports.ox_inventory


ESX.RegisterServerCallback('dd_doc:requestDati',function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local tabella = {}
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier},function(res)
            for i=1, #res, 1 do
                table.insert(tabella,{
                    no = res[i].firstname,
                    co = res[i].lastname,
                    d = res[i].dateofbirth,
                    s = res[i].sex,
                    h = res[i].height,
                })
            end
            cb(tabella)
        end)
    end
end)

RegisterServerEvent('dd_doc:daiDoc',function(source, link)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(Documenti.NomeItem).count >= 1 then
        xPlayer.removeInventoryItem(Documenti.NomeItem, 1)
    end
    MySQL.update('UPDATE users SET immagine = @immagine WHERE identifier = @ide', {['@immagine'] = link, ['@ide'] = xPlayer.identifier})
    Wait(300)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier},function(res)
        metadata = {}
        metadata.nome = res[1].firstname
        metadata.cognome = res[1].lastname
        metadata.data = res[1].dateofbirth
        metadata.sesso = res[1].sex
        metadata.alt = res[1].height
        metadata.linkImg = link
        metadata.type = ' di '..res[1].firstname.. " "..res[1].lastname
        ox:AddItem(xPlayer.source, Documenti.NomeItem, 1, metadata)
    end)
end)

RegisterServerEvent('dd_doc:daiDocCustom',function(source, nomeItem, png)
    local xPlayer = ESX.GetPlayerFromId(source)
    Wait(300)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier},function(res)
        metadata = {}
        metadata.nome = res[1].firstname
        metadata.cognome = res[1].lastname
        metadata.data = res[1].dateofbirth
        metadata.sesso = res[1].sex
        metadata.alt = res[1].height
        metadata.custom = png
        if res[1].immagine == nil then
            metadata.linkImg = 'https://cdn.discordapp.com/attachments/886768309377323038/962373711112077392/nofoto.png'
        else
            metadata.linkImg = res[1].immagine
        end
        metadata.type = ' di '..res[1].firstname.. " "..res[1].lastname
        ox:AddItem(xPlayer.source, nomeItem, 1, metadata)
    end)
end)

RegisterServerEvent('dd_doc:daiDocToTarget',function(target, png)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xT = ESX.GetPlayerFromId(target)
    Wait(300)
    if xPlayer.job == 'police' then
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xT.identifier},function(res)
            metadata = {}
            if res[1].immagine == nil then
                MySQL.Async.execute('UPDATE users SET immagine = ? WHERE identifier = ?', {png, xT.identifier})
            end
            metadata.nome = res[1].firstname
            metadata.cognome = res[1].lastname
            metadata.data = res[1].dateofbirth
            metadata.sesso = res[1].sex
            metadata.alt = res[1].height
            metadata.linkImg = png

            metadata.type = ' di '..res[1].firstname.. " "..res[1].lastname
            xPlayer.showNotification("Hai scattato la foto per i documenti a "..xPlayer.getName())
            xT.showNotification("Hai ricevuto i documenti")
            ox:AddItem(xT.source, Documenti.NomeItem, 1, metadata)
        end)
    else
        print("^8[Noxon Service] ^0"..xPlayer.source..' MODDER')
    end
end)
ESX.RegisterUsableItem(Documenti.NomeItem,function(source, cazzo, nxn)
    if nxn.metadata ~= nil then
        TriggerClientEvent("dd_doc:usaDocumento" ,source, nxn.metadata)
    else
        xPlayer.showNotification("Questo documento è vuoto!")
    end
end)

RegisterServerEvent(Documenti.DmvTrigger,function(source, tipo, img)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    Wait(500)
    if xPlayer.getInventoryItem(Documenti.NomeItemPatente).count >= 1 then
        xPlayer.removeInventoryItem(Documenti.NomeItemPatente, 1)
    end
    Wait(300)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier},function(res)
        metadata = {}
        metadata.nome = res[1].firstname
        metadata.cognome = res[1].lastname
        metadata.data = res[1].dateofbirth
        metadata.sesso = res[1].sex
        metadata.alt = res[1].height
        if res[1].immagine == nil then
            metadata.linkImg = img
        else
            metadata.linkImg = res[1].immagine
        end
        metadata.type = ' di '..res[1].firstname.. " "..res[1].lastname
        if tipo == "drive" then
            metadata.drive = true
        elseif tipo == "drive_bike" then
            metadata.drive_bike = true
        elseif tipo == "drive_truck" then
            metadata.drive_truck = true
        else
            metadata.drive = false
            metadata.drive_bike = false
            metadata.drive_truck = false
        end
        Wait(1000)
        ox:AddItem(xPlayer.source, Documenti.NomeItemPatente, 1, metadata)
    end)
end)
ESX.RegisterUsableItem(Documenti.NomeItemPatente,function(source, cazzo, nxn)
    if nxn.metadata ~= nil then
        TriggerClientEvent("dd_doc:usaDocumento" ,source, nxn.metadata, 'patente')
    else
        xPlayer.showNotification("Questo documento è vuoto!")
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Documenti.CreateDoc) do
        ESX.RegisterUsableItem(v.nomeItem,function(source, cazzo, nxn)
            if nxn.metadata ~= nil then
                TriggerClientEvent("dd_doc:custom" ,source, nxn.metadata)
            else
                xPlayer.showNotification("Questo documento è vuoto!")
            end
        end)
    end
end)
