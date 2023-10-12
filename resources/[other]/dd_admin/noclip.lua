

local LocalNoclip = {
    Controls = {
        goUp = 85, -- Q
        goDown = 48, -- Z
        turnLeft = 34, -- A
        turnRight = 35, -- D
        goForward = 32,  -- W
        goBackward = 33, -- S
    },
    Speeds = {
        {speed = 0.1},
        {speed = 0.5},
        {speed = 2},
        {speed = 5},
        {speed = 10},
        {speed = 15},
        {speed = 20},
    },
    Offsets = {
        y = 0.5,
        z = 0.2,
        h = 3,
    },
}

local FollowCamMode = false
local statoNoClip = false
local index = 1
local CurrentSpeed = LocalNoclip.Speeds[index].speed
local form = nil

function ChiamaNoClipStaff()
    statoNoClip = not statoNoClip
    if statoNoClip then
        ESX.ShowNotification('Hai abilitato il noclip', 'success')
    else
        ESX.ShowNotification('Hai disabilitato il noclip', 'success')
    end
    Citizen.CreateThread(function()
        while true do
            form = setupScaleform('instructional_buttons', CurrentSpeed)
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped) then
                ped = GetVehiclePedIsUsing(ped)
            end
            if DoesEntityExist(ped) then
                if statoNoClip then
                    --[[DisableAllControlActions()]]
                    EnableControlAction(0, 1, true)
                    EnableControlAction(0, 2, true)
                    SetEntityInvincible(ped, true)
                    SetEntityVisible(ped, false, false)
                    SetEntityAlpha(ped, 75, false)
                    SetBlockingOfNonTemporaryEvents(ped, true)
                    ForcePedMotionState(ped, -1871534317, 0, 0, 0)
                    SetLocalPlayerVisibleLocally(true)
                    SetEntityCollision(ped, false, false)
                    local yoff = 0.0
                    local zoff = 0.0
                    if IsDisabledControlPressed(0, LocalNoclip.Controls.goForward) then
                        yoff = LocalNoclip.Offsets.y
                    end
                    if IsDisabledControlPressed(0, LocalNoclip.Controls.goBackward) then
                        yoff = -LocalNoclip.Offsets.y
                    end
                    if IsDisabledControlPressed(0, LocalNoclip.Controls.goUp) then
                        zoff = LocalNoclip.Offsets.z
                    end
                    if IsDisabledControlPressed(0, LocalNoclip.Controls.goDown) then
                        zoff = -LocalNoclip.Offsets.z
                    end
                    if not FollowCamMode and IsDisabledControlPressed(0, LocalNoclip.Controls.turnLeft) then
                        SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())+LocalNoclip.Offsets.h)
                    end
                    if not FollowCamMode and IsDisabledControlPressed(0, LocalNoclip.Controls.turnRight) then
                        SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-LocalNoclip.Offsets.h)
                    end
                    local newPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, yoff * (CurrentSpeed + 0.3), zoff * (CurrentSpeed + 0.3))
                    local heading = GetEntityHeading(ped)
                    SetEntityVelocity(ped, 0.0, 0.0, 0.0)
                    SetEntityRotation(ped, 0.0, 0.0, 0.0, 0, false)
                    if FollowCamMode then
                        SetEntityHeading(ped, GetGameplayCamRelativeHeading())
                    else
                        SetEntityHeading(ped, heading)
                    end
                    SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, true, true, true)
                    SetLocalPlayerVisibleLocally(true)
                else
                    SetEntityInvincible(ped, false)
                    ResetEntityAlpha(ped)
                    SetEntityVisible(ped, true, false)
                    SetEntityCollision(ped, true, false)
                    SetBlockingOfNonTemporaryEvents(ped, false)
                    break
                end
            end
            Citizen.Wait(0)
        end
    end)
end

RegisterCommand('noclip', function()
    if LocalPlayer.state.infoPl.staff ~= "user" then
        ChiamaNoClipStaff()
    end
end, false)

RegisterCommand('_NoClipCam', function()
    if statoNoClip then
        FollowCamMode = not FollowCamMode
    end
end, false)

RegisterCommand('_NoClipSpeed', function()
    if statoNoClip then
        if index ~= #LocalNoclip.Speeds then
            index = index + 1
            CurrentSpeed = LocalNoclip.Speeds[index].speed
            setupScaleform('instructional_buttons')
        else
            CurrentSpeed = LocalNoclip.Speeds[1].speed
            setupScaleform('instructional_buttons')
            index = 1
        end
    end
end, false)

RegisterKeyMapping('noclip', 'Attiva/Disattiva NoClip [STAFF]', 'KEYBOARD', 'HOME')
RegisterKeyMapping('_NoClipCam', 'Modalità NoClip [STAFF]', 'KEYBOARD', 'H')
RegisterKeyMapping('_NoClipSpeed', 'Velocità NoClip [STAFF]', 'KEYBOARD', 'LSHIFT')

function ButtonMessage(text)
    BeginTextCommandScaleformString('STRING')
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function setupScaleform(scaleform, CurrentSpeed)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
    DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 0, 0)
    PushScaleformMovieFunction(scaleform, 'CLEAR_ALL')
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, 'SET_DATA_SLOT')
    PushScaleformMovieFunctionParameterInt(0)
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 21, true))
    ButtonMessage('Velocità: '..tostring(CurrentSpeed)..'x')
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, 'SET_CLEAR_SPACE')
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, 'SET_DATA_SLOT')
    PushScaleformMovieFunctionParameterInt(1)
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 74, true))
    ButtonMessage('Modalità NoClip')
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, 'SET_DATA_SLOT')
    PushScaleformMovieFunctionParameterInt(2)
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 35, true))
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 33, true))
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 34, true))
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 32, true))
    ButtonMessage('Movimento')
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, 'SET_DATA_SLOT')
    PushScaleformMovieFunctionParameterInt(3)
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 48, true))
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 85, true))
    ButtonMessage('Su/Giù')
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, 'DRAW_INSTRUCTIONAL_BUTTONS')
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, 'SET_BACKGROUND_COLOUR')
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
    return scaleform
end
