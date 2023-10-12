DD = {}
local Freeze = {}
local lastcoords = {}
local pexSrc 

DD.GetAllPlayer = function()
    local giocatori = {}
    local count = 0
    local xPlayers = ESX.GetExtendedPlayers() 
    for i=1, #(xPlayers) do 
        local xPlayer = xPlayers[i]
        count = count + 1
        local id = xPlayer.source
        giocatori[id] = {
            id = id,
            nome = xPlayer.getName(),
            gruppo = xPlayer.getGroup(),
            steam = xPlayer.getIdentifier(),
            contanti = xPlayer.getAccount('money').money,
            sporchi = xPlayer.getAccount('black_money').money,
            banca = xPlayer.getAccount('bank').money,
            job = xPlayer.getJob().label,
            grado = xPlayer.getJob().grade_label
        }
    end
    if count == #xPlayers then
        return giocatori
    else
        print("^1[DD_ADMIN]^0 Controllo giocatori online e count errato, controllare lista player")
    end
end

ESX.RegisterServerCallback("dd_admin:getAllPl", function(source, cb)
    
end)

RegisterServerEvent("dd_admin:sendPex", function(source, pex)
    pexSrc = pex
    TriggerClientEvent("dd_admin:sendPexCl", source, pex)
    TriggerEvent("dd_extended:updatePexStaff", source, pex)
end)


-- Evento principale

RegisterServerEvent("dd_admin:azioni", function(source, clID, id, azione, data)
    if source == clID then
        local xPlayer = ESX.GetPlayerFromId(id)
        if not DD.ControlloPermessi(source, azione) then
            xPlayer.showNotification("Non puoi eseguire questa azione", "error")
            return
        end
        if azione == "heal" then
            xPlayer.resetStatus('fame')
            xPlayer.resetStatus('sete')
            TriggerClientEvent("dd_admin:healPlayer", id)
        elseif azione == "giveg" then
            local val = data.val
            if val then
                TriggerClientEvent("dd_admin:givegPlayer", id, tonumber(val))
            else
                TriggerClientEvent("dd_admin:givegPlayer", id, 100)
            end
        elseif azione == "" then

        end
    else
        ESX.Medder(source, "dd_admin", "HA TRIGGERATO UN EVENTO IL COGLIONE", "DAdmin-01")
    end
end)


DD.FreezePlayer = function(source, id, val)
    Freeze[id] = not Freeze[id]
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)
    xTarget.triggerEvent("dd_admin:freezePlayer", Freeze[id])
end

DD.BringPlayer = function(source, id, val)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)
    lastcoords[id] = GetEntityCoords(GetPlayerPed(id))
    if not val then
        xTarget.setCoords(GetEntityCoords(GetPlayerPed(xPlayer.source)))
        xTarget.showNotification("Ti hanno tippato dal giocatore: "..xPlayer.source)
    else
        xTarget.setCoords(lastcoords[id])
        xTarget.showNotification("Sei tornato nella tua posizione")
    end
end

DD.GotoPlayer = function(source, id, val)
    lastcoords[source] = GetEntityCoords(GetPlayerPed(source))
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)
    if not val then
        xPlayer.setCoords(GetEntityCoords(GetPlayerPed(xTarget.source)))
        xPlayer.showNotification("Ti sei tippato dal giocatore: "..xTarget.source)
    else
        xPlayer.setCoords(lastcoords[source])
        xPlayer.showNotification("Sei tornato nella tua posizione")
    end
end

DD.TpPlayerToWaypoint = function(source, id, coords)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)
    xTarget.setCoords(coords)
    xPlayer.showNotification("Hai tippato il player alla tua meta")
    xTarget.showNotification("Sei stato tippato alla meta")
end

-- Funzioni Controllo permessi

DD.ControlloPermessi = function(source, azione)
    for k,v in pairs(ConfigAdmin[pexSrc]) do
        if v == azione then
            return true
        elseif v == "all" then 
            return true
        end
    end
    return false
end


RegisterServerEvent('dd_admin:givev:target', function(source, id, Data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(source)
    local props = Data.props
    local tipo = tostring(Data.type)
    if xTarget then
        if tipo == 'car' or tipo == 'boat' or tipo == 'plane' then
            MySQL.insert('INSERT INTO owned_vehicles (plate,vehicle,owner,type,garage, nomeveicolo) VALUES (?,?,?,?,?, ?)',{
                props[2],
                json.encode(props),
                xTarget.getIdentifier(),
                tipo,
                (tipo == 'boat' and 'BARCHE_1') or (tipo == 'plane' and 'AEREI_1') or 'A',
                Data.label
            },function(id)
                if id then
                    TriggerEvent('as_misc:garage:addPlayerVehicle', xTarget.source, {
                        plate = props[2],
                        vehicle = props,
                        type = tipo,
                        garage = (tipo == 'boat' and 'BARCHE_1') or (tipo == 'plane' and 'AEREI_1') or 'A',
                    })
                    xPlayer.showNotification('Hai dato un veicolo targato '..tostring(props[2])..' da '..xTarget.getName()..'', 'success')
                    xTarget.showNotification('Hai ricevuto un veicolo targato '..tostring(props[2])..' da '..xPlayer.getName()..'', 'success')
                end
            end)
        end
    else
        xPlayer.showNotification("Giocatore OFFLINE")
        return
    end
end)


-- Sistema report

Report = {}

RegisterServerEvent('dd_admin:report:addReport', function(source, azione, testo)
    local xPlayer = ESX.GetPlayerFromId(source)
    if Report[source] then xPlayer.showNotification("Hai gia un ticket aperto", "error") return end
    Report[source] = { 
        id = source, 
        tipo = azione, 
        info = testo, 
        nome = GetPlayerName(source) 
    }
    xPlayer.showNotification("Hai aperto un ticket, attendi l'arrivo dello staff", "success")
end)

RegisterServerEvent('dd_admin:report:chiudiReport', function(source, id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)
    if Report[id] then
        Report[id] = nil
    else
        xPlayer.showNotification("Problema con il report del player: "..id.." contatta un developer", "error")
    end
    if xTarget then
        xTarget.showNotification("Il tuo report è stato chiuso", "success")
    end
    xPlayer.showNotification("Hai chiuso il report di "..GetPlayerName(id).." ", "info")
end)

lib.callback.register('dd_admin:report:getReport', function()
    return Report
end)