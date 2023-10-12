local infos = {}
local fattures = {}

ESX.RegisterServerCallback("atn_rec:newsoc:getInfo", function(source, cb, soc)
    local xPlayer = ESX.GetPlayerFromId(source)
    SocGetMoney(soc)
    GetImportoFattureDaPagare(soc)
    local info = {}
    Wait(100)
    MySQL.Async.fetchAll('SELECT identifier, job_grade, firstname, lastname FROM users WHERE job = @job ORDER BY job_grade DESC', {
        ['@job'] = soc,
    },function(result)
        print(#result)
        info[soc] = {
            ndip = #result,
            dipon = ESX.CountJob(soc),
            dipoff = (#result - ESX.CountJob(soc)),
            soldi = infos[soc].soldi,
            sporchi = xPlayer.getInventoryItem("black_money").count,
            inarrivo = fattures[soc].money
        }
        cb(info)
    end)

end)


function GetImportoFattureDaPagare(soc)
    MySQL.Async.fetchAll('SELECT * FROM billing WHERE societaemitt = @societaemitt', {
        ['@societaemitt'] = soc
    }, function(result)
        local contantiinarrivo = 0
        for k,v in pairs(result) do
            contantiinarrivo = contantiinarrivo + v.importo
        end
        fattures[soc] = { money = contantiinarrivo}
    end)
end


function SocGetMoney(soc)
    MySQL.Async.fetchAll('SELECT * FROM registrasocieta WHERE nome = @nome', {
        ['@nome'] = soc,
    },function(result)
        for k,v in pairs(result) do
            infos[soc] = {
                soldi = v.soldi
            }
        end
    end)
end

local function ATN_Soc_SendInfoAzienda(nome, soldi)
    MySQL.Async.execute("UPDATE registrasocieta SET soldi = @soldi WHERE nome = @nome", {
        ['@nome'] = nome, 
        ['@soldi'] = soldi
    })
end

RegisterServerEvent("atn_soc:azioni", function(source, tipo, importo)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local soc = xPlayer.getJob().name
        if tipo == "preleva" then
            if tonumber(infos[soc].soldi) >= tonumber(importo) then
                xPlayer.addInventoryItem("money", tonumber(importo))
                local aggiornato = tonumber(infos[soc].soldi) - tonumber(importo)
                ATN_Soc_SendInfoAzienda(soc, aggiornato)
            else
                xPlayer.showNotification("Non disponi di tutti quesi soldi in azienda")
            end
        elseif tipo == "deposita" then
            local contanti = xPlayer.getInventoryItem("money").count
            if contanti >= tonumber(importo) then
                xPlayer.removeInventoryItem("money", tonumber(importo))
                local aggiornato = tonumber(infos[soc].soldi) + tonumber(importo)
                ATN_Soc_SendInfoAzienda(soc, aggiornato)
            else
                xPlayer.showNotification("Non hai tutti quei soldi con te")
            end
        elseif tipo == "pulisci" then
            local soldisporchi = xPlayer.getInventoryItem("black_money").count
            if soldisporchi >= tonumber(importo) then
                xPlayer.removeInventoryItem("black_money", tonumber(importo))
                local imp = ((tonumber(importo) / 100) * 20)
                importo = importo - imp
                xPlayer.addInventoryItem("money", tonumber(importo))
            else
                xPlayer.showNotification("Non hai tutti quei soldi con te")
            end
        end
    end
end)
