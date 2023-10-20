ESX.RegisterServerCallback("en_bank:getInfoBank", function(source, cb, bank)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    local xPlayer = ESX.GetPlayerFromId(source)
    if not data_banca[xPlayer.getIdentifier()] then cb(false) return end
    if not data_banca[xPlayer.getIdentifier()][bank] or data_banca[xPlayer.getIdentifier()][bank] ~= "[]" then
        cb(data_banca[xPlayer.getIdentifier()][bank])
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("en_bank:checkIBAN", function(source, cb, iban)
    local val = GetIban(iban)
    cb(val)
end)

ESX.RegisterServerCallback("en_bank:azioniPresiti", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jsonprestiti = LoadResourceFile(GetCurrentResourceName(), "json/prestiti.json")
    local data_prestiti = json.decode(jsonprestiti or '{}')
    if data_prestiti[xPlayer.getIdentifier()] then
        cb(data_prestiti[xPlayer.getIdentifier()])
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("en_bank:infoConto", function(source, cb, bank)
    local xPlayer = ESX.GetPlayerFromId(source)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    cb(data_banca[xPlayer.getIdentifier()][bank])
end)

function GetIban(iban)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    for k,v in pairs(data_banca) do
        for e,n in pairs(v) do
            if n["iban"] == iban then
                return true
            end
        end
    end
    return false
end

function PrestitiDelateAccount(source, importo, banca)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    local xPlayer = ESX.GetPlayerFormId(source)
    if data_banca[xPlayer.getIdentifier()][banca] then
        data_banca[xPlayer.getIdentifier()][banca] = nil
        SaveResourceFile(GetCurrentResourceName(), "json/bancapl.json", json.encode(data_banca, {indent = true}), -1)
    end
end

function EditMoneyIBAN(iban, tpyes, moneyAgg)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    for k,v in pairs(data_banca) do 
        for e,n in pairs(v) do
            if n["iban"] == iban then
                if tpyes == "add" then
                    n["money"] = n["money"] + moneyAgg
                elseif tpyes == "rem" then
                    n["money"] = n["money"] - moneyAgg
                end
                SaveResourceFile(GetCurrentResourceName(), "json/bancapl.json", json.encode(data_banca, {indent = true}), -1)
                return
            end
        end
    end
end


function GenerateIBAN(source, bank)
	conto = true
	local function GenerateString(numero)
		local tabella = {}
	
		for i = 48, 57 do table.insert(tabella, string.char(i)) end	-- Numeri


	  
		if numero > 0 then
		  return GenerateString(numero - 1) .. tabella[math.random(1, #tabella)]
		else
		  return ""
		end
	end
	local xPlayer = ESX.GetPlayerFromId(source)
    local nome = xPlayer.getName()
    local nomegg = string.sub(nome, 1, 2)
    local bankgg = string.sub(bank, 1, 2)
	local ibn = ''
	iban1 = GenerateString(6)
	iban2 = GenerateString(4)
	iban3 = GenerateString(4)
	iban4 = GenerateString(4)
    ibn = nomegg..'-' .. iban1 .. '-' .. iban2 .. '-' .. bankgg
    return ibn
end

function GetMoneyBankPL(identifier, bank)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    if data_banca[identifier] then
        return data_banca[identifier][bank].money
    end
end

function AggMoneyBankPL(identifier, bank, amount)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    if data_banca[identifier] then
        data_banca[identifier][bank].money = amount
        SaveResourceFile(GetCurrentResourceName(), "json/bancapl.json", json.encode(data_banca, {indent = true}), -1)
    end
end

function AddAvvisi(source, avvisi)
    print(source, avvisi)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/prestiti.json")
    local data_prestiti = json.decode(prestti or '{}')
    local xPlayer = ESX.GetPlayerFromId(source)
    if data_prestiti[xPlayer.getIdentifier()] then
        for k,v in pairs(data_prestiti[xPlayer.getIdentifier()]) do
            local avvisiss = (data_prestiti[xPlayer.getIdentifier()][k].avvisi + 1)
        end
        SaveResourceFile(GetCurrentResourceName(), "json/prestiti.json", json.encode(data_prestiti, {indent = true}), -1)
        print("Salvataggio avvisi")
    end
end

function TagPrestiti(grado)
    local max 
    local tag
    if grado == 0 then
        max = 3000000
        tag = 0.05
    elseif grado == 1 then
        max = 1000000
        tag = 0.10
    elseif grado == 2 then
        max = 500000
        tag = 0.15
    elseif grado == 3 then
        max = 200000
        tag = 0.20
    end
    local table = {max, tag}
    return table
end

function aggiungiDueSettimane()
    local dataOdierna = os.date("*t")
    dataOdierna.day = dataOdierna.day + ConfigPrestiti.giorni -- Due settimane 
    if dataOdierna.day > 28 then
      local nuovaData = os.time(dataOdierna)
      dataOdierna = os.date("*t", nuovaData)
    end
    return dataOdierna
end

function EditJsonBanca(val, bank, num)
    local jsonBanca = LoadResourceFile(GetCurrentResourceName(), "json/banca.json")
    local data_banca = json.decode(jsonBanca or '{}')
    local saldo = tonumber(data_banca[bank].fondo)
    if val == "add" then
        data_banca[bank].fondo = saldo + tonumber(num)
    elseif val == "rem" then
        data_banca[bank].fondo = saldo - tonumber(num)
    end 
    SaveResourceFile(GetCurrentResourceName(), "json/banca.json", json.encode(data_banca, {indent = true}), -1)
end

RegisterServerEvent("en_bank:createAccount", function(source, bank, tasse, grado, label, pinn)
    local xPlayer = ESX.GetPlayerFromId(source)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    local identifier = xPlayer.getIdentifier()
    local iban = GenerateIBAN(source, label)
    local metadata = {}
    if not data_banca[identifier] then
        data_banca[identifier] = {
            [bank] = {
                banca = label,
                pin = pinn,
                iban = iban,
                bloccati = 0,
                money = 0,
                grade = grado
            }
        }
        SaveResourceFile(GetCurrentResourceName(), "json/bancapl.json", json.encode(data_banca, {indent = true}), -1)
        xPlayer.removeAccountMoney('money', tasse)
        xPlayer.showNotification("Conto creato con successo presso la banca: "..label, "success") 
        EditJsonBanca("add", bank, tasse)
    elseif not data_banca[identifier][bank] then
        data_banca[identifier][bank] = {
            banca = label,
            pin = pinn,
            iban = iban,
            bloccati = 0,
            money = 0,
            grade = grado
        }
        SaveResourceFile(GetCurrentResourceName(), "json/bancapl.json", json.encode(data_banca, {indent = true}), -1)
        xPlayer.removeAccountMoney('money', tasse)
        xPlayer.showNotification("Conto creato con successo presso la banca: "..label, "success") 
        EditJsonBanca("add", bank, tasse)
    end

    metadata.iban = iban
    metadata.nome = xPlayer.getName()
    metadata.pin = pinn
    metadata.type = label.." - "..iban
    metadata.banca = label
    metadata.namebk = bank
    exports.ox_inventory:AddItem(source, "cr"..bank, 1, metadata)

end)

RegisterServerEvent("en_bank:azioni", function(azione, source, data, extra)
    local xPlayer = ESX.GetPlayerFromId(source)
    if azione == "pre" then
        local importo = data.importo
        local banca = data.banca
        local labelBank = data.label
        print(importo, banca, labelBank)
        local saldo = GetMoneyBankPL(xPlayer.getIdentifier(), banca)
        if tonumber(saldo) >= tonumber(importo) then
            if not extra then
                xPlayer.showNotification("Prelievo di: "..importo.."$ presso la banca: "..labelBank, "success")
                xPlayer.addInventoryItem("money", importo)
            end
            local impAgg = tonumber(saldo) - tonumber(importo)
            AggMoneyBankPL(xPlayer.getIdentifier(), banca, impAgg)
        else
            xPlayer.showNotification("Importo superiore al saldo disponibile", "error")
        end
    elseif azione == "dep" then
        local importo = data.importo
        local banca = data.banca
        local labelBank = data.label
        local saldo = GetMoneyBankPL(xPlayer.getIdentifier(), banca)
        xPlayer.showNotification("Deposito di: "..importo.."$ presso la banca: "..labelBank, "success")
        xPlayer.removeInventoryItem("money", importo)
        local impAgg = tonumber(saldo) + tonumber(importo)
        AggMoneyBankPL(xPlayer.getIdentifier(), banca, impAgg)
    elseif azione == "tras" then
        local importo = data.importo
        local banca = data.banca
        local labelBank = data.label
        local ibanTras = data.iban
        local saldo = GetMoneyBankPL(xPlayer.getIdentifier(), banca)
        if tonumber(saldo) >= tonumber(importo) then

            xPlayer.showNotification("Hai trasferito: "..importo.."$ all'iban: "..ibanTras, "success")
            local impAgg = tonumber(saldo) - tonumber(importo)
            AggMoneyBankPL(xPlayer.getIdentifier(), banca, impAgg)
            EditMoneyIBAN(ibanTras, "add", importo)
        else
            xPlayer.showNotification("Importo superiore al saldo disponibile", "error")
        end
    
    -- Prestiti 
    
    elseif azione == "ricprestito" then
        local banca = data.banca
        local labelBank = data.label
        local grado = data.grado
        local importo = tonumber(data.importo)
        local presito = TagPrestiti(grado)
        local MaxPresito = tonumber(presito[1]) 
        local TagPrestito = tonumber(presito[2]) 
        if importo <= MaxPresito then
            local calcolo = importo * TagPrestito
            local res = math.floor(importo + calcolo)
            TriggerClientEvent("en_bank:dialogRichiesta", xPlayer.source, banca, tonumber(res), importo, TagPrestito, labelBank)
        else
            xPlayer.showNotification("Il massimo che puoi richedere a questa banca per un prestito è di: "..MaxPresito.."$", "info")
        end
    
    elseif azione == "addPrestito" then
        local jsonprestiti = LoadResourceFile(GetCurrentResourceName(), "json/prestiti.json")
        local data_prestiti = json.decode(jsonprestiti or '{}')

        local importo = data.importo
        local banca = data.banca
        local impRest = data.restituisci
        local labelBank = data.label
        local tag = data.tag

        local nuovaData = aggiungiDueSettimane()
        nuovaData = string.format("%02d/%02d/%04d", nuovaData.day, nuovaData.month, nuovaData.year)

        data_prestiti[xPlayer.getIdentifier()] = {
            [banca] = {
                banca = banca,
                importo = importo, 
                dataRes = nuovaData,
                impRes = impRest,
                restituiti = 0,
                avvisi = 0
            }
        }
        SaveResourceFile(GetCurrentResourceName(), "json/prestiti.json", json.encode(data_prestiti, {indent = true}), -1)
        xPlayer.showNotification("Hai eseguito un prestito con la banca: "..labelBank.." di: "..impRest.."$ con il TAG del: "..tag.."%", "success")
        EditJsonBanca("rem", banca, importo)
        local saldo = GetMoneyBankPL(xPlayer.getIdentifier(), banca)
        saldo = saldo + importo
        AggMoneyBankPL(xPlayer.getIdentifier(), banca, saldo)

    elseif azione == "resprestito" then

        local jsonprestiti = LoadResourceFile(GetCurrentResourceName(), "json/prestiti.json")
        local data_prestiti = json.decode(jsonprestiti or '{}')

        local banca = data.banca
        local LabelBank = data.labelBank
        local importo = data.importo
        local grado = data.grado

        local restituiti = data_prestiti[xPlayer.getIdentifier()][banca].restituiti
        local importoDaRestituire = data_prestiti[xPlayer.getIdentifier()][banca].impRes

        if tonumber(importo) <= tonumber(importoDaRestituire) then
            local saldo = GetMoneyBankPL(xPlayer.getIdentifier(), banca)
            if tonumber(importo) <= tonumber(saldo) then
                local impAgg = tonumber(saldo) - tonumber(importo)
                AggMoneyBankPL(xPlayer.getIdentifier(), banca, impAgg)
                EditJsonBanca("add", banca, importo)
                data_prestiti[xPlayer.getIdentifier()][banca].restituiti = restituiti + tonumber(importo)
                data_prestiti[xPlayer.getIdentifier()][banca].impRes = importoDaRestituire - tonumber(importo)
                xPlayer.showNotification("Hai restituito: "..importo.."$", "success")
                if tonumber(data_prestiti[xPlayer.getIdentifier()][banca].impRes) == 0 then
                    data_prestiti[xPlayer.getIdentifier()] = nil
                    xPlayer.showNotification("Hai chiuso la pratica, hai restituito pianmente l'importo")
                end
                SaveResourceFile(GetCurrentResourceName(), "json/prestiti.json", json.encode(data_prestiti, {indent = true}), -1)
            else
                xPlayer.showNotification("Non hai a disposizione tutto quel saldo in banca", "info")
            end
        else
            xPlayer.showNotification("L'importo selezionato è superiore all'importo da restituire", "info")
        end

    end
end)

ESX.RegisterServerCallback("dd_f5:getBankAcc", function(source, cb)
    local banca = LoadResourceFile(GetCurrentResourceName(), "json/bancapl.json")
    local data_banca = json.decode(banca or '{}')
    local xPlayer = ESX.GetPlayerFromId(source)
    if data_banca[xPlayer.getIdentifier()] then
        local ritorno = {}
        for k,v in pairs(data_banca[xPlayer.getIdentifier()]) do
            table.insert(ritorno, {banca = k, info = v})
        end
        cb(ritorno)
    else 
        cb(false)
    end
end)

--[[
    SERVER SIDE CHANGELOG

    -- Aggiungere anti trigger event

    -- Sistemare controlli vari, fatti male causa test

    -- dd_utils/server/utils.lua rivedere playerloaded metodo utilizzato non funzionante 

    [IMPORTANTE] Ricostruire server side, troppe richieste 
 

]]





-- RegisterCommand("data", function(source, args)
--     local oggi = os.time()

--     local dataDaControllare = "06/20/2023"

--     local timestampData = os.time(
--         {day=tonumber(dataDaControllare:sub(4,5)), 
--         month=tonumber(dataDaControllare:sub(1,2)), 
--         year=tonumber(dataDaControllare:sub(7))}
--     )

--     if timestampData < oggi then
--     print("La data " .. dataDaControllare .. " è inferiore rispetto alla data odierna.")
--     else
--     print("La data " .. dataDaControllare .. " non è inferiore rispetto alla data odierna.")
--     end
-- end, true)

