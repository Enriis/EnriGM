function GetDrugsAll()
    local droga = LoadResourceFile(GetCurrentResourceName(), "json/drugs.json")
    local data_droga = json.decode(droga or '{}')
    return data_droga
end

function GetDrugsVal(campo)
    local droga = LoadResourceFile(GetCurrentResourceName(), "json/drugs.json")
    local data_droga = json.decode(droga or '{}')
    return data_droga[campo]
end

function SetQuantita(campo, tipo, val)
    local droga = LoadResourceFile(GetCurrentResourceName(), "json/drugs.json")
    local data_droga = json.decode(droga or '{}')
    if data_droga[campo] then
        if tipo == "add" then
            data_droga[campo].quantita = data_droga[campo].quantita + val
        elseif tipo == "remove" then
            data_droga[campo].quantita = data_droga[campo].quantita - val
        end
        SaveResourceFile(GetCurrentResourceName(), "json/drugs.json", json.encode(data_droga, {indent = true}), -1)
    end
end

function SetStato(campo, stato)
    local droga = LoadResourceFile(GetCurrentResourceName(), "json/drugs.json")
    local data_droga = json.decode(droga or '{}')
    if data_droga[val] then
        data_droga[val].stato = tonumber(stato)
        SaveResourceFile(GetCurrentResourceName(), "json/drugs.json", json.encode(data_droga, {indent = true}), -1)
    end
end

RegisterServerEvent("dd_drugs:azioni", function(source, tipo, campo, item, item2)
    local xPlayer = ESX.GetPlayerFromId(source)
    if tipo == "raccolta" then
        local quant = math.random(1, 3)
        if tonumber(GetDrugsVal(campo).quantita) >= tonumber(quant) then
            SetQuantita(campo, "remove", quant)  
            xPlayer.addInventoryItem(item, quant)
            xPlayer.showNotification("Hai raccolto x"..quant.." "..item)
        else
            xPlayer.showNotification("Sostanza Terminata", "error")
        end
    elseif tipo == "processo" then

    end
end)

ESX.RegisterServerCallback("dd_dtrug:getStatoCampo", function(source, cb, campo)
    local droga = LoadResourceFile(GetCurrentResourceName(), "json/drugs.json")
    local data_droga = json.decode(droga or '{}')
    if data_droga[campo] then
        if data_droga[campo].stato then
            if data_droga[campo].stato == 1 then
                cb(true)
            elseif data_droga[campo].stato == 0 then
                cb(false)
            end
        end
    end
end)