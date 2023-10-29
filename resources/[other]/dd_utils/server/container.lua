local Container = {}

RegisterServerEvent('en_container:azioni', function(source, azione, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nomeGrid = nil
    if azione == "acquista" then
        local container = data.nome
        local prezzo = data.prezzo
        if tonumber(xPlayer.getAccount('money').money) >= tonumber(prezzo) then
            for k,v in pairs(Container) do
                if k == container then
                    v.owner = xPlayer.getIdentifier()
                end
            end
            xPlayer.removeInventoryItem("money", tonumber(prezzo))
            xPlayer.showNotification("Hai comprato il container: "..container.." al prezzo di: "..prezzo.."$")
        else
            xPlayer.showNotification("Non hai abbastanza soldi in contanti")
            return
        end
    elseif azione == "key" then
        local container = data.nome
        local id = data.id 
        local xTarget = ESX.GetPlayerFromId(id)
        if not xTarget then return end
        local chiavi = {}
        if json.encode(Container[container].key) ~= "[]" then
            table.insert(chiavi, {nome = xTarget.getName(), id = xTarget.getIdentifier()})
            for k,v in pairs(Container[container].key) do
                table.insert(chiavi, v)
            end
        else
            chiavi = {{nome = xTarget.getName(), id = xTarget.getIdentifier()}}
        end

        for k,v in pairs(Container) do
            if k == container then
                v.key = chiavi
            end
        end

    elseif azione == "key_2" then
        local container = data.container
        local labelPl = data.nome
        local id = data.id

        if json.encode(Container[container].key) ~= "[]" then
            for k,v in pairs(Container[container].key) do
                if v.id == id then
                    Container[container].key[k] = nil
                end
            end
        end

    elseif azione == "vendi" then
        local prezzointero = data.prezzosc
        local prezzo = data.prezzo
        local nomecont = data.nome
        nomeGrid = data.nome

        Container[nomecont].owner = "staff"
        Container[nomecont].key = {}

        xPlayer.addInventoryItem("money", tonumber(prezzo))
        xPlayer.showNotification("Hai venduto il container al prezzo di: "..prezzo.."$")
    end

    SaveResourceFile(GetCurrentResourceName(), "json/container.json", json.encode(Container, {indent = true}), -1)
    TriggerClientEvent("en_container:refreshClientSource", xPlayer.source, nomeGrid)
end)

function CaricaContainer() 
    local container = LoadResourceFile(GetCurrentResourceName(), "json/container.json")
    local data_container = json.decode(container or '{}')
    Container = data_container
    for k,v in pairs(Container) do 
        exports.ox_inventory:RegisterStash(v.nome, "Container", tonumber(v.slot), tonumber(v.peso), false)
        print("Caricato inventario container: "..v.nome, v.slot, v.peso)
    end
end

CaricaContainer() 

RegisterServerEvent('en_container:creaContainer', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    CreaContainer(data.nome, data.prezzo, data.peso, data.slot, nil, data.coords)
end)

ESX.RegisterServerCallback("en_container:containerAcquistati", function(source, cb)
    local ContDisponibili = {}
    for k,v in pairs(Container) do
        if v.owner ~= "staff" then
            ContDisponibili[v.nome] = {nome = v.name, prezzo = v.prezzo, peso = v.peso, slot = v.slot, owner = v.owner, key = v.key, coords = v.coords}
        end
    end

    cb(ContDisponibili)
end)

ESX.RegisterServerCallback("en_contianer:getLabelKeys", function(source, cb, nome)
    if Container[nome] then
        if json.encode(Container[nome].key) ~= "[]" then
            local chiavi = Container[nome].key
            cb(chiavi)
        else
            cb(nil)
        end
    end

end)

ESX.RegisterServerCallback("en_container:containerDisponibili", function(source, cb)
    local ContDisponibili2 = {}
    for k,v in pairs(Container) do
        if v.owner == "staff" then
            ContDisponibili2[v.nome] = {nome = v.name, prezzo = v.prezzo, peso = v.peso, slot = v.slot, owner = v.owner, key = v.key, coords = v.coords}
        end
    end
    cb(ContDisponibili2)
end)

ESX.RegisterServerCallback("en_container:getPrezzoContainer", function(source, cb, nome)
    if Container[nome] then
        cb(Container[nome].prezzo)
    end
end)

function CreaContainer(nome, prezzo, peso, slot, own, coords)
    local container = LoadResourceFile(GetCurrentResourceName(), "json/container.json")
    local data_container = json.decode(container or '{}')
    data_container[nome] = {
        nome = nome,
        prezzo = prezzo,
        peso = (peso * 1000),
        slot = slot,
        owner = "staff",
        key = {},
        coords = coords
    }
    Wait(100)
    Container = data_container
    SaveResourceFile(GetCurrentResourceName(), "json/container.json", json.encode(data_container, {indent = true}), -1)
    CaricaContainer() 
end