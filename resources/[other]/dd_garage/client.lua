
function CreaGarage()
    Citizen.CreateThread(function()
        Wait(1000)
        for k,v in pairs(GarageConfigBello) do
            exports.dd_utils:CreaBlips("Garage", 524, 29, v.marker)
            TriggerEvent('gridsystem:registerMarker', {
                name = 'marker_garage_'..k,
                type = 21,
                texture = nil,
                scale = vector3(0.8, 0.8, 0.8),
                color = { r = 0, g = 51, b = 204 },
                pos = v.marker,
                control = 'E',
                posizione = "left-center",
                titolo = "Garage: "..k,
                action = function()
                    if not IsPedInAnyVehicle(PlayerPedId()) then
                        MenuVeicoli(k)
                    else
                        ESX.ShowNotification("Scendi dal veicolo", "error")
                        return 
                    end
                end,
                onExit = function()
                    lib.hideTextUI()
                    ESX.UI.Menu.CloseAll()
                end,
                msg = "Garage: "..k,
            })

            TriggerEvent('gridsystem:registerMarker', {
                name = 'deposito_garage_'..k,
                type = 23,
                texture = nil,
                scale = vector3(3.8, 3.8, 3.8),
                color = { r = 0, g = 51, b = 204 },
                pos = v.deposito,
                control = 'E',
                posizione = "left-center",
                titolo = "Parcheggia Veicolo",
                action = function()
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        DepositoVeicoli(k)
                    else
                        ESX.ShowNotification("Devi essere in un veicolo", "error")
                        return 
                    end
                end,
                onExit = function()
                    lib.hideTextUI()
                    ESX.UI.Menu.CloseAll()
                end,
                msg = "Parcheggia veicolo",
            })
        end
    end)
end

CreaGarage()

function MenuVeicoli(garage)
end

function SpawnVeicolo(stat)
end

function DepositoVeicoli(garage)
end