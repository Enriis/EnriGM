local societa = {}


RegisterCommand("craJob", function()
    if societa == nil then return end
    local input = lib.inputDialog('CREALAVORO', {
        { type = "input", label = "Label" },                                --1 
        { type = "input", label = "Nome" },                                 --2
        { type = "number", label = "N° Gradi - MAX 5", default = 1 },       --3
        { type = "input", label = "Soldi Società" },                        --4
        { type = "input", label = "Soldi Sporchi" },                        --5
        { type = "checkbox", label = "Illegale", checked = false },         --6
    })

    local label = input[1]
    local name = input[2]
    local nGradi = input[3]
    local banca = input[4]
    local sporchi = input[5]
    local illegale = input[6]

    if societa[name] then ESX.ShowNotification("Questa società è gia registrata") return end

    TriggerServerEvent("dd_society:createJob", GetPlayerServerId(PlayerId()), name, label, banca, sporchi, nGradi, illegale)
end)

RegisterNetEvent("dd_society:sendArray", function(soc)
    societa = soc
    local count = 0
    Wait(1000)
    for k,v in pairs(ConfigLavori) do
        if societa[k] then
            count = count + 1
        else
            print("[^2DD_SOCIETY^0] Lavoro "..k.." non registrato nel file json")
        end
    end
    print("[^2DD_SOCIETY^0] Blip creati: "..count)
    CreaBlipSociety()
end)

function CreaBlipSociety()
    Citizen.CreateThread(function()
        for k, v in pairs(ConfigLavori) do 
            if v.BossMenu then
                for i, u in pairs(v.BossMenu) do 
                    TriggerEvent('gridsystem:registerMarker', {
                        name = 'boss_menu_'..i,
                        type = v.Marker.id,
                        texture = nil,
                        scale = v.Marker.scale,
                        permission = k,
                        color = { r = 255, g = 0, b = 0 },
                        pos = u.coords,
                        control = 'E',
                        posizione = "left-center",
                        titolo = "Boss Menu",
                        action = function()
                        end,
                        onEnter = function()
                            print("entrato")
                        end,
                        onExit = function()
                            lib.hideTextUI()
                            ESX.UI.Menu.CloseAll()
                        end,
                        msg = ( u.testo_notifica or "INTERAGIRE" ),
                    })
                end
            end
            if v.Depositi then
                for i, u in pairs(v.Depositi) do 
                    TriggerEvent('gridsystem:registerMarker', {
                        name = 'deposito_'..i,
                        type = v.Marker.id,
                        texture = nil,
                        scale = v.Marker.scale,
                        permission = k,
                        color = { r = 255, g = 0, b = 0 },
                        pos = u.coords,
                        control = 'E',
                        posizione = "left-center",
                        titolo = "Deposito",
                        action = function()
                            exports.ox_inventory:openInventory('stash', i)
                        end,
                        onExit = function()
                            lib.hideTextUI()
                            ESX.UI.Menu.CloseAll()
                        end,
                        msg = ( u.testo_notifica or "INTERAGIRE" ),
                    })
                end
            end
            if v.Garage then
                for i, u in pairs(v.Garage) do 
                    TriggerEvent('gridsystem:registerMarker', {
                        name = 'garage1_'..i,
                        type = v.Marker.id,
                        texture = nil,
                        scale = v.Marker.scale,
                        permission = k,
                        color = { r = 255, g = 0, b = 0 },
                        pos = u.deposito.coords,
                        control = 'E',
                        posizione = "left-center",
                        titolo = "Deposito Veicolo",
                        action = function()
                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                local plate_prefix = u.prefix_plate
                                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                local myplate = GetVehicleNumberPlateText(veh)
    
    
                                if string.find(myplate,plate_prefix) then
                                    if veh then
                                        TaskLeaveVehicle(PlayerPedId(), veh, 64)
                                        Wait(1180)
                                        ESX.Game.DeleteVehicle(veh)
                                    end
                                    ESX.ShowNotification("Hai deposito il tuo veicolo")
                                else
                                    ESX.ShowNotification("Non puoi depositare questo veicolo qui!")  
                                end
                            else
                                ESX.ShowNotification("Non sei in nessun veicolo")
                            end
                        end,
                        onExit = function()
                            lib.hideTextUI()
                            ESX.UI.Menu.CloseAll()
                        end,
                        msg = ( u.testo_notifica or "INTERAGIRE" ),
                    })

                    TriggerEvent('gridsystem:registerMarker', {
                        name = 'garage2_'..i,
                        type = v.Marker.id,
                        texture = nil,
                        scale = v.Marker.scale,
                        permission = k,
                        color = { r = 255, g = 0, b = 0 },
                        pos = u.ritiro.coords,
                        control = 'E',
                        posizione = "left-center",
                        titolo = "Garage",
                        action = function()
                            local elements = {}
    
                            for id, dat in pairs(u.veicoli) do
                                if  tonumber(ESX.PlayerData.job.grade) >=  dat.grado_minimo then
                                    table.insert(elements,{label = dat.label,model = dat.model,extra = {
                                        color1 = dat.color1 or false,
                                        color2 = dat.color2 or false,
                                        livery = dat.livery  or false
                                    }})
                                end
                            end
    
                            if next(elements) then
                                ESX.UI.Menu.CloseAll()
                                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ritiro_fnx_lavori', {
                                    title = i.." - "..string.upper(k),
                                    align = 'top-left',
                                    elements = elements
                                }, function(data, menu)
                            
                                    if data.current.model ~= nil then
                                        if not ESX.Game.IsSpawnPointClear(u.spawn, 3.0) then 
                                            ESX.ShowNotification("Si prega di spostare il veicolo che si trova sul garage prima di prenderne altri.")
                                            ESX.UI.Menu.CloseAll()
                                            return
                                        end
                                    end
                            
                                end, function(data, menu)
                                    menu.close()
                                end)
                            else
                                print("Non ci sono veicoli nel garage")
                            end
                        end,
                        onExit = function()
                            lib.hideTextUI()
                            ESX.UI.Menu.CloseAll()
                        end,
                        msg = ( u.testo_notifica or "INTERAGIRE" ),
                    })
                end
            end
        end
    end)
end


-- Billing

RegisterCommand("fattura", function()
    print("brooo")
    -- local id, coords = ESX.Game.GetClosestPlayer()
    -- if id == -1 or coords > 3.0 then
    --     ESX.ShowNotification('Non ci sono giocatori nelle vicinanze', "error")
    --     return 
    -- end
    -- if ESX.PlayerData.job.name == "unemployed" then return end
    local input = lib.inputDialog('FATTURA', {
        { type = "input", label = "Importo" },                                
        { type = "input", label = "Motivo" },                                 
    })
    local data = {
        lavoro = ESX.PlayerData.job.name, 
        motivo = tostring(input[2]), 
        importo = tonumber(input[1])
    }
    if data then
        TriggerServerEvent("dd_society:requestBilling_S", GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), data)
    end
end)

RegisterNetEvent('dd_society:requestBilling_C', function(target, data)
    local request = lib.alertDialog({
        header = 'Fattura da pearte di: '..data.lavoro,
        content = 'Importo Fattura: '..data.importo.."$ \n \n Motivo: "..data.motivo,
        centered = true,
        cancel = true
    })
    print(request)
    if request == "confirm" then
        TriggerServerEvent("dd_society:sendBilling", GetPlayerServerId(PlayerId()), target, data, true)
        ESX.ShowNotification("Hai accettato la fattura di: "..data.importo.."$ per: "..data.motivo)
    elseif request == "cancel" then
        TriggerServerEvent("dd_society:sendBilling", GetPlayerServerId(PlayerId()), target, data, false)
        ESX.ShowNotification("Hai rifiutato la fattura di: "..data.importo.."$ per: "..data.motivo)
    end
end)

RegisterCommand("fatture", function()
    MenuFatture()
end)

function MenuFatture()
    ESX.UI.Menu.CloseAll()
    local elementi = {}
    ESX.TriggerServerCallback("dd_society:getBills", function(result) 
        if result == nil or json.encode(result) == "[]" then ESX.ShowNotification("Non hai fatture da pagare") return end
        for k,v in pairs(result) do
            table.insert(elementi, {label = v.motivo.." | "..v.importo.."$", value = v.lavoro, importo = v.importo, id = k, motivo =  v.motivo, tIdentifier = v.identifier})
        end
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dd_society_billing', {
            title = "Fatture",
            align = 'top-left',
            elements = elementi
        }, function(data, menu)
            local id = data.current.id
            local importo = data.current.importo
            local lavoro = data.current.value
            local motivo = data.current.motivo
            local tIdentifier = data.current.tIdentifier
            if lavoro then
                SelezioneBancaMenu(id, importo, lavoro, motivo, tIdentifier)
            end
        end, function(data, menu)
            menu.close()
        end)
    end)
end

function SelezioneBancaMenu(id, importo, lavoro, motivo, tIdentifier)
    local elementi = {}
    ESX.TriggerServerCallback("dd_f5:getBankAcc", function(result) 
        for k,v in pairs(result) do
            table.insert(elementi, {label = v.info.banca, value = v.info, banca = v.banca})
        end
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_billing_bankAcc', {
            title = 'CONTI DISPONIBILI',
            align = 'top-left',
            elements = elementi
            }, function(data, menu)
            local verifica = data.current.value
            local banca = data.current.banca
            if verifica.money >= importo then
                TriggerServerEvent("dd_society:removeBilling", GetPlayerServerId(PlayerId()), id, importo, lavoro, motivo, tIdentifier)
                TriggerServerEvent("en_bank:azioni", "pre", GetPlayerServerId(PlayerId()), {importo = importo, banca = banca, label = verifica.banca}, true)
                ESX.UI.Menu.CloseAll()
            else
                ESX.ShowNotification("Non hai abbastanza soldi in questo conto")
            end
            
            end, function(data, menu)
                menu.close()
            end
        )
    end)
end