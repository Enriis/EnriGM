Citizen.CreateThread(function()
    Wait(2000)
    if GetGameBuildNumber() < 2612 then
        print('^1 DD-SHOP: errore durante il caricamento della build!')
    else
        print('^1DD-SHOP^0: caricate ^2'..GetNumResources()..'^0 risorse con ^2successo!^0')
    end
end)

local blipsMappa = {}

function CreaBlips(nome, tipo, colore, pos, scale, radius)
    pos = pos or vector3(0, 0, 0)
    if not blipsMappa[pos] then
        blipsMappa[pos] = AddBlipForCoord(pos.x, pos.y, pos.z)
    else
        print('Valore Duplicato: '..tostring(nome)..', '..tostring(pos)..'')
        return
    end
    SetBlipSprite(blipsMappa[pos], tipo or 1)
    SetBlipDisplay(blipsMappa[pos], 4)
    SetBlipScale(blipsMappa[pos], scale or 0.6)
    SetBlipColour(blipsMappa[pos], colore or 0)
    SetBlipAsShortRange(blipsMappa[pos], true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(nome or 'Non Disponibile')
    EndTextCommandSetBlipName(blipsMappa[pos])
    if radius then
        blipsMappa[pos] = AddBlipForRadius(pos.x, pos.y, pos.z, tonumber(radius))
        SetBlipColour(blipsMappa[pos], colore or 0)
        SetBlipAlpha(blipsMappa[pos], 100)
    end
end

exports('CreaBlips',function(nome, tipo, colore, pos, scale, radius)
    CreaBlips(nome, tipo, colore, pos, scale, radius)
end)


function CheckItems(items, quantita)
    if not items or not tonumber(quantita) then return end
    for i = 1, #items do
        local exports = exports.ox_inventory:Search('count', items[i])
        if exports > quantita then 
            return true 
        end
    end
    return false
end

RegisterCommand("fixmenu", function()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.CloseAll()
    Wait(1000)
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.CloseAll()
    print("[EN DEBUG] Fix nui esx_menu_default")
end)

RegisterNetEvent("dd_skin:changeHealthPed", function()
    print("okeeeessasas")
    local pedModel = exports['dd_skin']:getPedModel(PlayerPedId())
    if pedModel == "mp_f_freemode_01" then
        print("load femmina")
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 25)
    end 
end)

RegisterCommand("fr", function()
    FreezeEntityPosition(PlayerPedId(), false)
    SetCamActive(cam, false)
end)

-- RegisterNetEvent("dd_utils:giveg", function(val)
--     SetPedArmour(PlayerPedId(), val)
--     print("Impostata armatura val: "..val)
-- end)

RegisterCommand("getvita", function()
    print(GetEntityHealth(PlayerPedId()))
end)