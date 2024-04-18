local societa = {}

function GetAllJobs()
    local file = json.decode(LoadResourceFile(GetCurrentResourceName(), "jobs.json"))
    societa = file
    TriggerClientEvent("dd_society:sendArray", -1, societa)
    print("Caricate societa")
end


function GetAllStorage()
    local count = 0
	for nomejob, b in pairs(ConfigLavori) do
		if b.Depositi then
			for e, f in pairs(b.Depositi) do
				exports.ox_inventory:RegisterStash(e, 'Deposito', f.slot, f.peso*1000)
                count = count + 1
			end
		end
		print("[^2DD_SOCIETY^0] Sono stati caricati: "..count.." depositi")
	end
end


RegisterServerEvent('es_extended:sendArraySociety', function(source)
    TriggerClientEvent("dd_society:sendArray", -1, societa)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('dd_hud:updateStatus', xPlayer.getStatus(true))
end)

Citizen.CreateThread(function()
    Wait(2000)
    GetAllJobs()
    GetAllStorage()
end)

GetAllJobs()
GetAllStorage()

SetSocietyAccount = function(job, account, val)
    if not societa[job] then return false end
    if not societa[job][account] then return false end
    societa[job][account] = val
    Wait(1000)
    SaveResourceFile(GetCurrentResourceName(), "jobs.json", json.encode(societa, {indent = true}), -1)
end

ReturnSocietyAccount = function(job, account)
    if not societa[job] then return false end
    if not societa[job][account] then return false end
    return societa[job][account]
end

ReturnSociety = function(job)
    if not societa[job] then return false end
    return societa[job]
end



RegisterServerEvent("dd_society:createJob", function(source, nome, label, banca, sporchi, gradi, illegale)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "admin" then TriggerClientEvent("esx:showNotification", source, "NON SEI UNO STAFFER", "error") return end 
    if not nome then TriggerClientEvent("esx:showNotification", source, "Il campo nome è vuoto", "error") end
    if not label then TriggerClientEvent("esx:showNotification", source, "Il campo label è vuoto", "error") end
    if not banca then banca = 0 end
    if not sporchi then sporchi = 0 end
    local file = LoadResourceFile(GetCurrentResourceName(), "jobs.json")
    local file_data = json.decode(file or '{}')
    file_data[nome] = {
        nome = nome,
        label = label,
        saldo = tonumber(banca), 
        sporchi = tonumber(sporchi),
        fatture = {}
    }
    SaveResourceFile(GetCurrentResourceName(), "jobs.json", json.encode(file_data, {indent = true}), -1)

    local id = MySQL.insert.await('INSERT INTO jobs (name, label) VALUES (?, ?)', {nome, label})

    if illegale then
        if tonumber(gradi) == 1 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'recluta', 'Recluta', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'boss', 'Capo', 0})
        elseif tonumber(gradi) == 2 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'recluta', 'Recluta', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'sicario', 'Sicario', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 2, 'boss', 'Capo', 0})
        elseif tonumber(gradi) == 3 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'recluta', 'Recluta', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'sicario', 'Sicario', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 2, 'vice', 'Vice', 0})
            local id4 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 3, 'boss', 'Capo', 0})
        elseif tonumber(gradi) == 4 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'recluta', 'Recluta', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'sicario', 'Sicario', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 2, 'gestore', 'Gestore', 0})
            local id4 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 4, 'vice', 'Vice', 0})
            local id5 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 4, 'boss', 'Capo', 0})
        elseif tonumber(gradi) == 5 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'recluta', 'Recluta', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'sicario', 'Sicario', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 2, 'gestore', 'Gestore', 0})
            local id4 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 3, 'spalla', 'Spalla Destra', 0})
            local id5 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 4, 'vice', 'Vice', 0})
            local id6 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 5, 'boss', 'Capo', 0})
        end
    else
        if tonumber(gradi) == 1 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'dipendente', 'Dipendente', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'boss', 'Proprietario', 0})
        elseif tonumber(gradi) == 2 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'dipendente', 'Dipendente', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'impiegato', 'Impiegato', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 2, 'boss', 'Proprietario', 0})
        elseif tonumber(gradi) == 3 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'dipendente', 'Dipendente', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'impiegato', 'Impiegato', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 4, 'vice', 'Vice Capo', 0})
            local id4 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 3, 'boss', 'Proprietario', 0})
        elseif tonumber(gradi) == 4 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'dipendente', 'Dipendente', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'impiegato', 'Impiegato', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 3, 'capo', 'Capo Reparto', 0})
            local id4 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 4, 'vice', 'Vice Capo', 0})
            local id5 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 4, 'boss', 'Proprietario', 0})
        elseif tonumber(gradi) == 5 then
            local id1 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 0, 'recluta', 'Recluta', 0})
            local id2 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 1, 'dipendente', 'Dipendente', 0})
            local id3 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 2, 'impiegato', 'Impiegato', 0})
            local id4 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 3, 'capo', 'Capo Reparto', 0})
            local id5 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 4, 'vice', 'Vice Capo', 0})
            local id6 = MySQL.insert.await('INSERT INTO job_grades (job_name, grade, name, label, salary) VALUES (?, ?, ?, ?, ?)', {nome, 5, 'boss', 'Proprietario', 0})
        end
    end
    TriggerClientEvent("esx:showNotification", source, "Hai creato il lavoro: "..label.." con soldi: "..banca.." e sporchi: "..sporchi.." con "..gradi.." gradi", "success")

    GetAllJobs()
    GetAllStorage()
    Wait(1000)
    ESX.RefreshJobs()
    print("[^2DD_SOCIETY^0] Lavori caricati")

end)



-- Billing

CreateIdBilling = function()
    local totTxt = ""
    for i = 1,32 do
        totTxt = totTxt..string.char(math.random(97,122))
    end
    return totTxt
end

RegisterServerEvent('dd_society:requestBilling_S', function(source, id, data)
    local xTarget = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(id)
    if xPlayer then
        TriggerClientEvent("dd_society:requestBilling_C", xPlayer.source, id, data)
    end
end)

RegisterServerEvent('dd_society:sendBilling', function(source, id, data, stato)
    local xTarget = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(id)
    if not stato then xTarget.showNotification(xPlayer.getName().." ha rifiutato la fattura di: "..data.importo.."$") return end
    if not xPlayer then return end
    if data and data.lavoro and data.motivo and data.importo then
        local fatture = LoadResourceFile(GetCurrentResourceName(), "billing.json")
        local data_fatture = json.decode(fatture or '{}')
        local identifier = xPlayer.getIdentifier()
        if not data_fatture[identifier] then
            data_fatture[identifier] = {
                [CreateIdBilling()] = {
                    lavoro = data.lavoro,
                    motivo = data.motivo,
                    importo = data.importo, 
                    identifier = xTarget.getIdentifier()
                }
            }
        else
            data_fatture[identifier][CreateIdBilling()] = {
                lavoro = data.lavoro,
                motivo = data.motivo,
                importo = data.importo,
                identifier = xTarget.getIdentifier()
            }
        end
        xPlayer.showNotification("Hai ricevuto una fattura di: "..data.importo.."$ da: "..data.lavoro)
        xTarget.showNotification("Hai inviato una fattura di: "..data.importo.."$ a: "..xPlayer.getName())
        SaveResourceFile(GetCurrentResourceName(), "billing.json", json.encode(data_fatture, {indent = true}), -1)
    else
        ESX.Modder(source, "dd_society:sendBilling", "Ha provato a triggerare sbagliando array il down", "DD-Soc:Billing1")
    end
end)

RegisterServerEvent('dd_society:removeBilling', function(source, id, importo, lavoro, motivo, tIdentifier)
    local fatture = LoadResourceFile(GetCurrentResourceName(), "billing.json")
    local data_fatture = json.decode(fatture or '{}')
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromIdentifier(tIdentifier)
    if xTarget then
        xTarget.showNotification(xPlayer.getName().." ha pagato una fattura di: "..importo.."$ per "..motivo)
    else
        local GiocatoriON = ESX.GetPlayers()
        for i=1, #GiocatoriON, 1 do
            local CBPlayer = ESX.GetPlayerFromId(GiocatoriON[i])
            if CBPlayer.job.name == 'police' then
                TriggerClientEvent('esx:showNotification', CBPlayer[i], xPlayer.getName().." ha pagato una fattura di: "..importo.."$ per "..motivo, "success")
                
            end
        end
    end
    data_fatture[identifier][id] = nil
    if json.encode(data_fatture[identifier]) == "{}" then
        data_fatture[identifier] = nil
    end
    SaveResourceFile(GetCurrentResourceName(), "billing.json", json.encode(data_fatture, {indent = true}), -1)
    local soldiSoc = tonumber(ReturnSocietyAccount(lavoro, "saldo"))
    local SaldoAggSoc = tonumber(soldiSoc + tonumber(importo))
    SetSocietyAccount(lavoro, "saldo", SaldoAggSoc)
    xPlayer.showNotification("Hai pagato la fattura: "..motivo.." di "..importo.."$")
end)

ESX.RegisterServerCallback("dd_society:getBills", function(source, cb)
    local fatture = LoadResourceFile(GetCurrentResourceName(), "billing.json")
    local data_fatture = json.decode(fatture or '{}')
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    cb(data_fatture[identifier])
end)


RegisterServerEvent("dd_soc:posSystem", function(job, val)
    local money = ReturnSocietyAccount(job, "saldo")
    local SaldoAggSoc2 = tonumber(money + tonumber(val))
    SetSocietyAccount(job, "saldo", SaldoAggSoc2)
end)
