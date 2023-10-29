-- Local Server
local StateCarThiefServer = 0

-- Local Client 
local FurtoScelto
local veicolospawnato = false

RegisterNetEvent("dd_thief:setValCLGlob", function(val, type)
    if ConfigCarthief.debug then
        if type == 1 then
            print("Ricevuto dal server allo start")
        else
            print("Refresh azione dal giocatore: "..type)
        end
    end
    StateCarThiefServer = tonumber(val)
    print(StateCarThiefServer)
end)


Citizen.CreateThread(function()
    if ConfigCarthief.debug then
        FreezeEntityPosition(PlayerPedId(), false)
        print("load furto veicolo")
    end
    TriggerServerEvent("dd_thief:loadLocalClient", GetPlayerServerId(PlayerId()))
    for k,v in pairs(ConfigCarthief) do
        if k == "Pablo" then
            TriggerEvent('gridsystem:registerMarker', {
                name = 'furto_'..k,
                type = 23,
                texture = nil,
                scale = vec3(0.8,0.8,0.8),
                color = { r = 255, g = 0, b = 0 },
                pos = v.pos,
                control = 'E',
                posizione = "left-center",
                titolo = v.label,
                action = function()
                    if FurtoScelto then ESX.ShowNotification("Hai gia iniziato un furto di veicolo", "error") return end
                    FreezeEntityPosition(PlayerPedId(), true)
                    if StateCarThiefServer < 2 then
                        if lib.progressBar({
                            duration = 2000,
                            label = 'Talk Pablo',
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                            },
                            anim = {
                                dict = 'anim@amb@casino@brawl@vincent@',
                                clip = 'walk_and_talk_vincent_s_m_y_doorman_01'
                            },
                        }) then else return end
                        FreezeEntityPosition(PlayerPedId(), false)
                        StartFurto()
                    elseif StateCarThiefServer >= 2 then
                        --No
                        ESX.ShowNotification("C'e gia un furto di veicolo in corso, Attendi", "info")
                        FreezeEntityPosition(PlayerPedId(), false)
                        return
                    end
                end,
                onEnter = function()
                end,
                onExit = function()
                    lib.hideTextUI()
                    ESX.UI.Menu.CloseAll()
                end,
                msg = "INTERAGIRE",
            })
        end
    end
end)



function StartFurto()
    TriggerServerEvent("dd_thief:action", GetPlayerServerId(PlayerId()), "addFurto")
    ::bella::
    local count = 0
    count = count + 1
    local rendom = math.random(1,8)
    FurtoScelto = ConfigCarthief["SpawnCar"][rendom]
    if not ESX.Game.IsSpawnPointClear(vector3(FurtoScelto.pos.x, FurtoScelto.pos.y, FurtoScelto.pos.z), 4,0) then
        goto bella
    end
    SetNewWaypoint(FurtoScelto.pos.x, FurtoScelto.pos.y)
    ESX.ShowNotification("Recati alla posizione del veicolo") -- Da mandare tramite telefono
    if ConfigCarthief.debug then
        print(count)
    end
    GeneraVeicolo()
end

function GeneraVeicolo()
    -- Creazione blip
    TriggerEvent('gridsystem:registerMarker', {
        name = 'veicoloFurto_'..FurtoScelto.pos.x,
        type = -1,
        texture = nil,
        scale = vec3(3.8,3.8,3.8),
        color = { r = 255, g = 0, b = 0 },
        pos = vector3(FurtoScelto.pos.x, FurtoScelto.pos.y, FurtoScelto.pos.z),
        control = 'E',
        posizione = "left-center",
        titolo = "Scassina il veicolo",
        action = function()
            FreezeEntityPosition(PlayerPedId(), true)
            StartVehicleAlarm(veicolospawnato)
            if lib.progressCircle({
                duration = 14800,
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                anim = {
                    dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                    clip = 'machinic_loop_mechandplayer'
                },
                disable = {
                    move = true
                }
            }) then else return end
            StartFuga()
        end,
        onEnter = function()
        end,
        onExit = function()
            lib.hideTextUI()
            ESX.UI.Menu.CloseAll()
        end,
        msg = "INTERAGIRE",
    })

    ESX.Game.SpawnVehicle(FurtoScelto.car, vector3(FurtoScelto.pos.x, FurtoScelto.pos.y, FurtoScelto.pos.z-1.05), FurtoScelto.pos.h, function(ilmioveicolo)
        
        veicolospawnato = ilmioveicolo

        SetEntityAsMissionEntity(veicolospawnato, true, true)
        SetVehicleDoorsLocked(veicolospawnato, 2)
        FreezeEntityPosition(veicolospawnato, true)
        SetVehicleAlarm(veicolospawnato, true)
        if ConfigCarthief.debug then
            print("Veicolo spawnato ", ilmioveicolo)
        end
    end)    
end

function StartFuga()
    StartTimerLeft()
    TriggerEvent("gridsystem:unregisterMarker", 'veicoloFurto_'..FurtoScelto.pos.x)
    StartCopsBlip()
    FreezeEntityPosition(PlayerPedId(), false)
    SetVehicleDoorsLocked(veicolospawnato, 0)
    FreezeEntityPosition(veicolospawnato, false)
end

function StartCopsBlip()
    -- da fare
end

-- ConfigCarthief.timerFurto
function StartTimerLeft()
    local timeLeftDeleteFurto = 60
    local time = ConfigCarthief.timerFurto
    Citizen.CreateThread(function()
        while veicolospawnato do
            if ConfigCarthief.debug then
                print("Test")
            end
            if IsPedSittingInAnyVehicle(PlayerPedId())  then
                local veicoloinuso = GetVehiclePedIsUsing(PlayerPedId())
                local modello = GetEntityModel(veicoloinuso)
                local modvei = GetDisplayNameFromVehicleModel(modello)
                if ConfigCarthief.debug then
                    print(modvei, FurtoScelto.car)
                end
                if modvei == FurtoScelto.car then 
                    if ConfigCarthief.debug then
                        print("Test 2")
                        print(time)
                    end
                    if time <= 0 then
                        CreatePosEndFurto()
                        return
                    else
                        time = time - 1
                    end
                else
                    ESX.ShowNotification("Non è il veicolo del furto")
                    return
                end
            else
                if ConfigCarthief.debug then
                    print("Test 3")
                end
                ESX.ShowNotification("Risali nel veicolo, hai "..timeLeftDeleteFurto.." secondi di tempo")
                if timeLeftDeleteFurto <= 0 then
                    StopFurtoExitCar()
                    return
                else
                    timeLeftDeleteFurto = timeLeftDeleteFurto - 1
                end
            end
            Citizen.Wait(1000)
        end
    end)
end

function StopFurtoExitCar()
    DeleteVehicle(veicolospawnato)
    FurtoScelto = nil
    veicolospawnato = false
    ESX.ShowNotification("Hai terminato il rempo a disposizione per rientrare nel veicolo", "info")
    TriggerServerEvent("dd_thief:action", GetPlayerServerId(PlayerId()), "remFurto")
end


function CreatePosEndFurto()
    local random = math.random(1,8)
    local posEndCar = ConfigCarthief["EndCar"][random]
    SetNewWaypoint(posEndCar.x, posEndCar.y)
    ESX.ShowNotification("Dirigiti alla posizione per consegnare il veicolo", "info")
    local adssda = FurtoScelto.ricompensa
    TriggerEvent('gridsystem:registerMarker', {
        name = 'end_car'..posEndCar.y,
        type = -1,
        texture = nil,
        scale = vec3(3.8,3.8,3.8),
        color = { r = 255, g = 0, b = 0 },
        pos = vector3(posEndCar.x, posEndCar.y, posEndCar.z-1),
        control = 'E',
        posizione = "left-center",
        titolo = "Consegna il veicolo",
        action = function()
            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                local veicoloinuso = GetVehiclePedIsUsing(PlayerPedId())
                local vitaVeicolo = GetEntityHealth(veicolospawnato)
                local modello = GetEntityModel(veicoloinuso)
                local modvei = GetDisplayNameFromVehicleModel(modello)
                if ConfigCarthief.debug then
                    print("Vita Veicolo: "..vitaVeicolo)
                end
                if vitaVeicolo > 850 then
                    --ottimo
                elseif vitaVeicolo > 450 then
                    --discreto
                elseif vitaVeicolo >= 0  then
                    --merda
                end
                if modvei == FurtoScelto.car then 
                    DeleteVehicle(veicolospawnato)
                    ESX.ShowNotification("Hai consegnato il veicolo, il tuo compenso è di: "..adssda.." $")
                    TriggerServerEvent("dd_thief:action", GetPlayerServerId(PlayerId()), "consegna", adssda)
                    TriggerEvent("gridsystem:unregisterMarker", 'end_car'..posEndCar.y)
                    FurtoScelto = nil
                    veicolospawnato = false
                else
                    ESX.ShowNotification("Non hai ricevuto il compenso, il veicolo consegnato non è quello del furto", "error")
                end
            else
                ESX.ShowNotification("Devi essere all'interno del veicolo per consegnarlo", "error")
            end
        end,
        onEnter = function()
        end,
        onExit = function()
            lib.hideTextUI()
            ESX.UI.Menu.CloseAll()
        end,
        msg = "INTERAGIRE",
    })

end