local DD = {}

RegisterCommand("f5", function()
    local ammanettato = ControlloMenette()
    if ammanettato then return end
    DD.MenuMain()
end)

-- RegisterNetEvent("print", function(val, id)
--     for k,v in pairs(val) do
--         if v.Owner == id then
--             print("oke")
--             local nome = v.Name
--             local pos = vector3(v.Entrance.x, v.Entrance.y, v.Entrance.z)
--             local chiusa = v.Locked
--         end 
--     end
-- end)

--LocalPlayer.state.infoPl.identifier

RegisterKeyMapping('f5', 'Menu F5', 'keyboard', "F5")

DD.MenuMain = function()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dd_f5_main', {
        title = 'Menu Personale | ID: '..GetPlayerServerId(PlayerId()),
        align = 'top-right',
        elements = {
            {label = "Informazioni Personali", value = "pers"},
            {label = "Azioni Giocatore", value = "thief"},
            {label = "Informazioni Finanze", value = "banca"},
            {label = "Informazioni Veicoli", value = "garage"},
            {label = "Informazioni Proprietà", value = "case"}
        }
    }, function(data, menu)
        local verifica = data.current.value
        if verifica == "thief" then
            DD.ThiefMenu()
        elseif verifica == "pers" then
            DD.MenuPerosnale()
        elseif verifica == "banca" then
            DD.BankAccount()
        elseif verifica == "case" then
            DD.CaseMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
end

DD.MenuPerosnale = function()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dd_f5_main_pers', {
        title = 'Menu Personale | ID: '..GetPlayerServerId(PlayerId()),
        align = 'top-right',
        elements = {
            {label = "Lavoro: "..ESX.PlayerData.job.label, value = false},
            {label = "Grado: "..ESX.PlayerData.job.grade_label, value = false},
        }
    }, function(data, menu)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

DD.ThiefMenu = function()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dd_f5_main_thief', {
        title = 'Azioni Giocatore | ID: '..GetPlayerServerId(PlayerId()),
        align = 'top-right',
        elements = {
            {label = "Ammanetta", value = "amm"},
            {label = "Smanetta", value = "sman"},
        }
    }, function(data, menu)
        local verifica = data.current.value
        local id, distance = ESX.Game.GetClosestPlayer()
        if id < 0 and distance < 0 then
            ESX.ShowNotification("Nessun player nelle vicinanze", "error")
            return
        end
        local target = GetPlayerServerId(id)
        if verifica == "amm" then
            local playerheading = GetEntityHeading(GetPlayerPed(-1))
            local playerCoords = GetEntityCoords(GetPlayerPed(-1))
            local playerlocation = GetEntityForwardVector(PlayerPedId())
            TriggerServerEvent("en_f5:thief:ammanettaTarget", GetPlayerServerId(PlayerId()), target, playerheading, playerCoords, playerlocation)
        elseif verifica == "sman" then
            local playerheading = GetEntityHeading(GetPlayerPed(-1))
            local playerCoords = GetEntityCoords(GetPlayerPed(-1))
            local playerlocation = GetEntityForwardVector(PlayerPedId())
            TriggerServerEvent("en_f5:thief:smanettaTarget", GetPlayerServerId(PlayerId()), target, playerheading, playerCoords, playerlocation)
        end
    end, function(data, menu)
        menu.close()
    end)
end

DD.BankAccount = function()
    local elementi = {}
    ESX.TriggerServerCallback("dd_f5:getBankAcc", function(result) 
        if not result then ESX.ShowNotification("Non hai conti aperti") return end
        for k,v in pairs(result) do
            table.insert(elementi, {label = v.info.banca, value = v.info})
        end
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_f5_bankAcc', {
        title = 'GESTIONE FINANZE',
        align = 'top-left',
        elements = elementi
        }, function(data, menu)
        local verifica = data.current.value
        local banca = data.current.label
        if verifica then
            DD.BankAccountSubMenu(banca, verifica)
        end
        
        end, function(data, menu)
            menu.close()
        end)

    end)
end

DD.BankAccountSubMenu = function(banca, info)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_f5_bank_submenu', {
       title = info.banca,
       align = 'top-left',
       elements = {
            {label = 'IBAN: '..info.iban, value = info.money},
            {label = 'Saldo: '..info.money.."$", value = info.money}
            --{label = 'Pin: '..info.pin, value = info.pin}
       }
    },  function(data, menu)
        local verifica = data.current.value
    
        if verifica then
            lib.setClipboard(verifica)
        end
        
        end, function(data, menu)
            menu.close()
        end
    )
end

DD.CaseMenu = function()
    local elementi = {}
    ESX.TriggerServerCallback("dd_f5:getPropertyOwners", function(result) 
        for k,v in pairs(result) do
            if v.Owner == LocalPlayer.state.infoPl.identifier then
                local nome = v.Name
                local position = vector3(v.Entrance.x, v.Entrance.y, v.Entrance.z)
                local chiusa = v.Locked
                local setName = v.setName
                table.insert(elementi, {label = setName, pos = position, stato = chiusa, value = nome})
            else
                ESX.ShowNotification("Non hai case") 
                return 
            end 
        end
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_F5_CASE', {
            title = 'CASE',
            align = 'top-left',
            elements = elementi
        }, function(data, menu)
            local verifica = data.current.value
            local pos = data.current.pos
            local chiusa = data.current.stato
            if verifica then
                if chiusa then
                    chiusa = "Chiusa"
                elseif not chiusa then
                    chiusa = "Aperta"
                end
                DD.CaseMenuSubMenu(verifica, pos, chiusa)
            end
            
            end, function(data, menu)
                menu.close()
            end
        )
    end)
end


DD.CaseMenuSubMenu = function(nome, pos, stato)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_F5_CASE_submenu', {
        title = nome,
        align = 'top-left',
        elements = {
            {label = "Stato casa: "..stato, notifica = "Casa chiusa", value = false},
            {label = "Posizione ", notifica = "GPS Impostato alla casa: "..nome, value = pos},
        }
    }, function(data, menu)
        local verifica = data.current.value
        ESX.ShowNotification(data.current.notifica)
        if verifica then
            SetNewWaypoint(pos.x, pos.y)
        end
        
        end, function(data, menu)
            menu.close()
        end
    )
end