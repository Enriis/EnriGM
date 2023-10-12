local ox_inventory = exports.ox_inventory
local proprietario = false

Citizen.CreateThread(function()
    TriggerEvent('gridsystem:registerMarker', {
        name = 'blip_cont_buy',
        type = 23,
        texture = nil,
        scale = vector3(0.8,0.8,0.8),
        color = {r = 255, g = 0, b = 0},
        pos = vector3(1067.4896240234,-388.73794555664,67.150382995605),
        control = 'E',
        posizione = "left-center",
        titolo = "Container in vendita",
        action = function()
            ContainerDisponibili()
        end,
        onExit = function()
            lib.hideTextUI()
            ESX.UI.Menu.CloseAll()
        end,
        msg = "[E] Per controllare i container disponibili",
    })
end)

function ContainerDisponibili()
    ESX.TriggerServerCallback("en_container:containerDisponibili", function(result) 
        local info = {}
        if json.encode(result) == "[]" then ESX.ShowNotification("Non ci sono container in vendita") return end
        for k,v in pairs(result) do
            table.insert(info, {label = k, prezzo = v.prezzo, peso = v.peso, slot = v.slot, nome = k})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_container_buy', {
            title = 'Container Disponibili',
            align = 'top-left',
            elements = info
        }, function(data, menu)
            local prezzo = data.current.prezzo
            local peso = data.current.peso
            local slot = data.current.slot
            local nome = data.current.nome
    
            local alert = lib.alertDialog({
                header = 'Container: '..nome,
                content = 'INFORMAZIONI CONTAINER \n\n Prezzo: '..prezzo.."$ \n\n Peso Inventario: "..peso.." \n\n Slot Invetario: "..slot.." \n\n \n\n CLICCANDO CONFERMA ACQUISTI IL CONTAINER: "..nome.." AL PREZZO DI: "..prezzo.."$",
                centered = true,
                cancel = true
            })

            if alert == "confirm" then
                ESX.UI.Menu.CloseAll()
                local data = {
                    nome = nome,
                    prezzo = prezzo
                }
                TriggerServerEvent("en_container:azioni", GetPlayerServerId(PlayerId()), "acquista", data)
            end

            end, function(data, menu)
                menu.close()
            end
        )

    end)
end

function ControllaChiavi(chaivi, identifier)
    for k,v in pairs(chaivi) do
        if v.id == identifier then
            return true
        end
    end
    return false
end

local function ApriInventario(nome)
    PlaySoundFrontend(-1, "Drill_Pin_Break", 'DLC_HEIST_FLEECA_SOUNDSET', 1)
    ox_inventory:openInventory('stash', nome)
end

local function MenuAzioniContainer(nome, keys)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_container_azioni_contianer', {
        title = 'Container: '..nome,
        align = 'top-left',
        elements = {
            {label = 'Dai chiavi', value = 'dai'},
            {label = 'Rimuovi chiavi', value = 'prendi'},
            {label = 'Vendi', value = 'sell'},
        }
    }, function(data, menu)
        local verifica = data.current.value

        if verifica == 'dai' then
            ESX.UI.Menu.CloseAll()
            -- local data2 = {
            --     nome = nome,
            --     id = GetPlayerServerId(PlayerId())
            -- }
            -- TriggerServerEvent("en_container:azioni", GetPlayerServerId(PlayerId()), "key", data2) TEST EVENT
            local elementis = {}

            local playersInArea = ESX.Game.GetPlayersInArea(entering, 10.0)
            if json.encode(playersInArea) == "[]" then
                ESX.ShowNotification("Non ci sono giocatori nelle vicinanze")
                return 
            end
            for i=1, #playersInArea, 1 do
                if playersInArea[i] ~= PlayerId() then
                    table.insert(elementis, {label = GetPlayerServerId(playersInArea[i]), value = GetPlayerServerId(playersInArea[i])})
                end
            end
        
        
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_container_idList', {
                title = "DAI CHIAVI",
                align = 'top-left',
                elements = elementis
            }, 	function(data, menu)
                    local playerId = data.current.value 
                    ESX.UI.Menu.CloseAll()
                    local data = {
                        nome = nome,
                        id = tonumber(playerId)
                    }
                    TriggerServerEvent("en_container:azioni", GetPlayerServerId(PlayerId()), "key", data)
                end, 
                function(data, menu)
                    ESX.UI.Menu.CloseAll()
                end
            )

        elseif verifica == 'prendi' then
            local elementsss = {}
            ESX.TriggerServerCallback("en_contianer:getLabelKeys", function(result) 
                if json.encode(result) == "[]" or result == nil then ESX.ShowNotification("Non ci sono chiavi in giro", "info") return end
                for k,v in pairs(result) do
                    table.insert(elementsss, {label = v.nome, value = v.id})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_container_prendi_chaivi', {
                    title = 'ELENCO CHIAVI',
                    align = 'top-left',
                    elements = elementsss
                }, function(data2, menu2)
                    local verifica2 = data2.current.value
                    local nomes = data2.current.label

                    if verifica2 then
                        local alert = lib.alertDialog({
                            header = 'RIMOZIONE CHIAVI',
                            content = 'Vuoi rimuovere le chiavi a: '..nomes,
                            centered = true,
                            cancel = true
                        })

                        if alert == "confirm" then
                            ESX.UI.Menu.CloseAll()
                            local data = {
                                container = nome,
                                nome = nomes,
                                id = verifica2
                            }
                            TriggerServerEvent("en_container:azioni", GetPlayerServerId(PlayerId()), "key_2", data)
                        end
                    end
            
                    end, function(data2, menu2)
                        MenuAzioniContainer(nome, keys)
                    end
                )
            end, nome)
        elseif verifica == 'sell' then
            
            ESX.TriggerServerCallback("en_container:getPrezzoContainer", function(result) 
                if result then
                    local prezzosc = tonumber(result)
                    local prezzo = tonumber(result)
                    local sconto = math.floor(prezzo * 0.25)
                    prezzo = prezzo - sconto


                    local alert = lib.alertDialog({
                        header = 'Container: '..nome,
                        content = 'Vuoi vendere il container: '..nome..' al prezzo di: '..prezzo.."$",
                        centered = true,
                        cancel = true
                    })
        
                    if alert == "confirm" then
                        ESX.UI.Menu.CloseAll()
                        local data = {
                            nome = nome,
                            prezzo = prezzo,
                            prezzosc = prezzosc
                        }
                        TriggerServerEvent("en_container:azioni", GetPlayerServerId(PlayerId()), "vendi", data)
                    end

                end
            end, nome)

        end

        end, function(data, menu)
            ESX.UI.Menu.CloseAll()
        end
    )
end

local function MenuContainer(nome, owner, key)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_container_ownerAction', {
        title = 'Container: '..nome,
        align = 'top-left',
        elements = {
            {label = 'Gestisci Container', value = 'en-gest'},
            {label = 'Apri Deposito', value = 'en-dep'}
        }
    }, function(data, menu)
        local verifica = data.current.value

        if verifica == 'en-gest' then
            MenuAzioniContainer(nome, key)
        elseif verifica == "en-dep" then
            ESX.UI.Menu.CloseAll()
            Wait(100)
            ApriInventario(nome)
        end

        end, function(data, menu)
            menu.close()
        end
    )
end

local function ApriCont(nome, owner, key)
    if owner == LocalPlayer.state.infoPl.identifier then 
        proprietario = true 
    elseif json.encode(key) ~= "[]" then
        if not ControllaChiavi(key, LocalPlayer.state.infoPl.identifier) then return else ApriInventario(nome) end
    else
        ESX.ShowNotification("Non puoi accedere a questo container")
    end

    if proprietario then
        MenuContainer(nome, owner, key)
    end
end


-- Funzioni Marker
function CaricaMarkerContainer()
    Citizen.CreateThread(function()
        ESX.TriggerServerCallback("en_container:containerAcquistati", function(result) 
            for k,v in pairs(result) do 
                TriggerEvent('gridsystem:registerMarker', {
                    name = 'blip_container_'..k,
                    type = 23,
                    texture = nil,
                    scale = vector3(0.8,0.8,0.8),
                    color = {r = 255, g = 0, b = 0},
                    pos = vector3(v.coords.x, v.coords.y, v.coords.z),
                    control = 'E',
                    posizione = "left-center",
                    titolo = k,
                    action = function()
                        ApriCont(k, v.owner, v.key)
                    end,
                    onExit = function()
                        lib.hideTextUI()
                        ESX.UI.Menu.CloseAll()
                    end,
                    msg = "[E] Per accedere al container: "..k,
                })
            end
        end)
    end)
end

-- Funzioni carica marker on player join

CaricaMarkerContainer()

-- Evento delete marker container venduto

RegisterNetEvent('en_container:refreshClientSource', function(grid)
    if grid then 
        TriggerEvent('gridsystem:unregisterMarker', 'blip_container_'..grid)
    else
        CaricaMarkerContainer()
    end
end)

RegisterCommand("CreaCont", function()
    local isStaff = LocalPlayer.state.infoPl.staff --Da modificare
    if isStaff == "user" then return end
    local coords = GetEntityCoords(PlayerPedId())

    local val = lib.inputDialog('CONTAINER', {
        { type = "input", label = "Nome Container"},
        { type = "input", label = "Prezzo"},
        { type = "input", label = "Slot Inv"},
        { type = "input", label = "Peso Inv (*1000)"}
    })

    if not val then ESX.ShowNotification("Compila tutti i campi") return end 

    local data = {
        nome = val[1],
        prezzo = val[2],
        slot = val[3],
        peso = val[4],
        coords = coords
    }

    TriggerServerEvent("en_container:creaContainer", GetPlayerServerId(PlayerId()), data)
    Wait(5000)
    CaricaMarkerContainer()
end)


-- RegisterCommand("chiavi", function()
--     print("Okeee")
--     local data = {
--         nome = "A-001",
--         id = tonumber(1)
--     }
--     TriggerServerEvent("en_container:azioni", GetPlayerServerId(PlayerId()), "key", data)
-- end)

--[[ 
        EDIT DA FARE
    
    Sistemare server side creazione container - Causa pex con state
    Rivedere sistema client chiavi per aprire il deposito visto che utilizza lo state
    
    
    [NEXT CHANGELOG] Aggiungere funzione che permette al proprietario di aprire il container anche a chi non ha le chiavi
    
    
    !!! IMPORTANTE !!! Sisteamre tutti i callback ( fatti a cazzo causa test )

]]