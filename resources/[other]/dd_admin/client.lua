local DD = {}
local StatePexCl

RegisterNetEvent("dd_admin:sendPexCl", function(pex)
    StatePexCl = pex
end)

local function CheckPex(pex)
    for k,v in pairs(ConfigAdmin[StatePexCl]) do
        if v == pex then
            return true
        else
            return false
        end
    end
end

DD.CreaMenu = function()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dd_admin_main_menu', {
        title = 'ADMIN MENU',
        align = 'top-left',
        elements = {
            {label = 'Lista Giocatori', value = 'lista'},
            {label = 'Menu Personale', value = "pers"}, 
            {label = "Menu Veicolo", value = "veicolo"},
            {label = "Azioni Giocatore", value = "playerid"},
            {label = "Superadmin Event", value = "superadmin"}
        }
    }, function(data, menu)
        local verifica = data.current.value

        if verifica == 'lista' then
            DD.LoadPlayers()
        elseif verifica == "pers" then
            DD.PersonalMenu()
        elseif verifica == "veicolo" then
            DD.Veicolo()
        elseif verifica == "playerid" then
            DD.OXIdPlayer()
        elseif verifica == "superadmin" then
            if CheckPex("all") then
                DD.SuperAdmin()
            end
        end
        
        end, function(data, menu)
            menu.close()
        end
    )
end

RegisterKeyMapping('adminmenu', 'Menu STAFF', 'keyboard', "INSERT")

RegisterCommand("adminmenu", function()
    print(LocalPlayer.state.infoPl.staff)
    if ConfigAdmin[LocalPlayer.state.infoPl.staff] then
        DD.CreaMenu()
    else
        ESX.ShowNotification("Non hai i permessi adatti", "error")
    end
end)


DD.LoadPlayers = function()
    ESX.TriggerServerCallback("dd_admin:getAllPl", function(player) 
        local elementi = {}
        for k,v in pairs(player) do
            print(v.nome)
            table.insert(elementi, {label = v.nome, id = k, staff = v.gruppo, steam = v.steam, contanti = v.contanti, sporchi = v.sporchi, lavoro = v.job, grado = v.grado})
        end
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_admin_listapl', {
            title = 'LITSA GIOCATORI',
            align = 'top-left',
            elements = elementi
        }, function(data, menu)
            local verifica = data.current.value
        
            end, function(data, menu)
                menu.close()
            end
        )
    end)
end


DD.PersonalMenu = function()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_personal_menu', {
        title = 'MENU STAFF PERSONALE',
        align = 'top-left',
        elements = {
            {label = 'Heal', value = 'heal'},
            {label = 'GiveG', value = 'giveg'}
        }
        }, function(data, menu)
        local verifica = data.current.value
        
        if verifica then
            TriggerServerEvent("dd_admin:azioni", GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), verifica, data)
            ESX.UI.Menu.CloseAll()
        end

        end, function(data, menu)
            menu.close()
        end
    )
end



-- Eventi

RegisterNetEvent('dd_admin:healPlayer')
AddEventHandler('dd_admin:healPlayer', function()
    SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
end)

RegisterNetEvent('dd_admin:givegPlayer')
AddEventHandler('dd_admin:givegPlayer', function(val)
    SetPedArmour(PlayerPedId(), val)
end)

















































-- SIstema Report

RegisterCommand("report", function()
    local input = lib.inputDialog('REPORT SYSTEM', {
        { type = 'select', label = 'Motivo Report', options = {
            { value = 'Segnalazione Player', label = 'Segnalazione Player' },
            { value = 'Segnalazione Bug', label = 'Segnalazione Bug' },
            { value = 'Donazione', label = 'Donazione'},
        }},
        { type = "input", label = "Spiegaci il problema" },
    })
    if input[1] and input[2] then
        local info  = input[1]
        local testo = input[2]
        TriggerServerEvent("dd_admin:report:addReport", GetPlayerServerId(PlayerId()), info, testo)
    else
        ESX.ShowNotification("Compila tutti i campi", "info")
    end
end)

RegisterCommand("areport", function()
    ESX.UI.Menu.CloseAll()
    if LocalPlayer.state.infoPl.staff == "user" then return end
    local count = lib.callback.await('dd_admin:report:getReport', false)
    if #count <= 0 then ESX.ShowNotification("Non ci sono report", "success") return end
    local elementi = {}
    for k,v in pairs(count) do
        table.insert(elementi, {label = v.nome.." | "..v.id, value = v.tipo, testo = v.info, id = v.id, nome = v.nome})
    end
    if next(elementi) then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dd_admin_report_action', {
            title = 'Report',
            align = 'top-left',
            elements = elementi
        }, function(data, menu)
            local verifica = data.current.value
            local testo = data.current.testo
            local idPl = data.current.id
            local nomePl = data.current.nome

            if verifica then
                ESX.UI.Menu.CloseAll()
                ReportInfo(verifica, testo, idPl, nomePl)
                return
            end
        end, function(data, menu)
            ESX.UI.Menu.CloseAll()
        end)
    end
end)


function ReportInfo(verifica, testo, idPl, nomePl)
    ESX.UI.Menu.CloseAll()
    Wait(250)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dd_admin_report_id', {
        title = 'REPORT '..nomePl,
        align = 'top-left',
        elements = {
            {label = 'Mostra Testo', value = 'txt'},
            {label = 'Goto', value = "goto"}, 
            {label = "Bring", value = "bring"},
            {label = "Chiudi Report", value = "chiudi"}
        }
    }, function(data2, menu2)
        local verifica2 = data2.current.value

        if verifica2 == 'txt' then
            local alert = lib.alertDialog({
                header = 'Report di '..nomePl,
                content = "Motivazione Report: "..verifica.."\n \n"..testo,
                centered = true,
                cancel = false
            })
        elseif verifica2 == "goto" then

        elseif verifica2 == "bring" then

        elseif verifica2 == "chiudi" then
            TriggerServerEvent("dd_admin:report:chiudiReport", GetPlayerServerId(PlayerId()), idPl)
            ESX.UI.Menu.CloseAll()
        end
        
        end, function(data2, menu2)
            ESX.UI.Menu.CloseAll()
        end
    )
end

-- Comandi



RegisterCommand("coords", function()
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    lib.registerContext({
        id = 'example_menu',
        title = 'Copy Coords',
        onExit = function()
            ESX.ShowNotification("Coords copiate", "info")
            ESX.UI.Menu.CloseAll()
        end,
        options = {
            {
                title = 'Vector 3',
                onSelect = function(args)
                    lib.setClipboard("vector3("..coords.x..","..coords.y..","..coords.z..")")
                end,
            },
            {
                title = 'Vector 4',
                onSelect = function(args)
                    lib.setClipboard("vector4("..coords.x..","..coords.y..","..coords.z..","..heading..")")
                end,
            },
            {
                title = 'Heading',
                onSelect = function(args)
                    lib.setClipboard(heading)
                end,
            },
            {
                title = 'Array',
                onSelect = function(args)
                    lib.setClipboard("{ x = "..coords.x.." , y = "..coords.y.." , z = "..coords.z.." }")
                end,
            },
        },
    })
    lib.showContext('example_menu')
end)



-- RegisterCommand('boost', function()
-- 	local input = lib.inputDialog('Police locker', {
--         { type = "slider", label = "Boost", min = 1, max = 1024},
--     })
-- 	local speed = tonumber(''..input[1]..'.0') or false
-- 	if input and speed then
-- 		if speed <= 0 then
-- 			speed = 0.0
-- 		elseif speed >= 1024 then
-- 			speed = 1024.0
-- 		end
-- 		local veh, dist = ESX.Game.GetClosestVehicle()
-- 		if not veh or not DoesEntityExist(veh) then
-- 			return
-- 		end
-- 		SetVehicleEnginePowerMultiplier(veh, speed)
-- 		ESX.ShowNotification('Boost impostato a '..tostring(speed)..'', 'warning')
-- 	else
-- 		ESX.ShowNotification('Inserisci un valore valido', 'error')
-- 	end
-- end)

GeneratePlate = function()
    local charset = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }
    local number = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' }
    local plate = "BIT"
    for i = 1, 3 do
        plate = plate .. charset[math.random(1, #number)]
    end
    for i = 1, 2 do
        plate = plate .. charset[math.random(1, #charset)]
    end
    return plate
end


RegisterCommand("givev", function()
    local input = lib.inputDialog('Give Veicolo', {
        { type = "input", label = "Nome spawn veicolo"},
        { type = 'select', label = 'Tipo veicolo', options = {
            { value = 'car', label = 'Auto/Moto' },
            { value = 'boat', label = 'Barca' },
            { value = 'plane', label = 'Aereo'},
        }}
    })
    if input[1] and input[2] then
        ESX.Game.SpawnVehicle(input[1], GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(PlayerId()))), GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(PlayerId()))) - 180, function(veh)
            if not veh then return end
            props = ESX.Game.GetVehicleProperties(veh, true)
            props[2] = GeneratePlate()
            local nome = GetDisplayNameFromVehicleModel(props.model)
            Data = { props = props, type = input[2], label = nome }
            SetVehicleNumberPlateText(veh, props[2])
            TriggerServerEvent("dd_admin:givev:target", GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), Data)
        end)
    else
        ESX.ShowNotification("Devi compilare tutti i campi")
        return
    end
end)
