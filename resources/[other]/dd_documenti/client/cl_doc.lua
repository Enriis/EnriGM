local screenLink

-- FUNCTION

RegisterCommand("ChiudiDoc", function()
    SendNUIMessage({ action="ChiudiDoc"})
end)
RegisterKeyMapping('ChiudiDoc', 'Chiusura Documenti', 'keyboard', 'BACK')


local requests = {}

local function GenerateId()
    local id = ""
    for i = 1, 15 do
        id = id .. (math.random(1, 2) == 1 and string.char(math.random(97, 122)) or tostring(math.random(0,9)))
    end
    return id
end

local function ClearHeadshots()
    for i = 1, 32 do
        if IsPedheadshotValid(i) then 
            UnregisterPedheadshot(i)
        end
    end
end

local function GetHeadshot(ped)
    ClearHeadshots()
    if not ped then ped = PlayerPedId() end
    if DoesEntityExist(ped) then
        local handle, timer = RegisterPedheadshot(ped), GetGameTimer() + 5000
        while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
            Wait(50)
            if GetGameTimer() >= timer then
                return {success=false, error="Could not load ped headshot."}
            end
        end

        local txd = GetPedheadshotTxdString(handle)
        local url = string.format("https://nui-img/%s/%s", txd, txd)
        return {success=true, url=url, txd=txd, handle=handle}
    end
end

function GetBase64(ped)
    if not ped then ped = PlayerPedId() end
    local headshot = GetHeadshot(ped)
    if headshot.success then
        local requestId = GenerateId()
        requests[requestId] = nil
        SendNUIMessage({
            type = "convert_base64",
            img = headshot.url,
            handle = headshot.handle,
            id = requestId
        })

        local timer = GetGameTimer() + 5000
        while not requests[requestId] do
            Wait(250)
            if GetGameTimer() >= timer then
                return {success=false, error="Waiting for base64 conversion timed out."}
            end
        end
        return {success=true, base64=requests[requestId]}
    else
        return headshot
    end
end

RegisterNUICallback("base64", function(data, cb)
    if data.handle then
        UnregisterPedheadshot(data.handle)
    end
    if data.id then
        requests[data.id] = data.base64
        Wait(1500)
        requests[data.id] = nil
    end

    cb({ok=true})
end)


function DocV2_ApriNUI(bool, meta2, dioc)
    if dioc ~= 'patente' then
        SendNUIMessage({
            action = 'doc',
            nui = bool,
            meta = meta2,
        })
    else
        SendNUIMessage({
            action = 'patente',
            nui = bool,
            meta = meta2,
        })
    end
end

function DocV2_ApriNUICustom(bool, meta2)
    SendNUIMessage({
        action = 'docCustom',
        nui = bool,
        meta = meta2,
        img = meta2.linkImg,
        immagine = meta2.custom,
    })
end


RegisterNetEvent('dd_doc:usaDocumento',function(meta, dioc)
    if dioc ~= 'patente' then
        DocV2_ApriNUI(true, meta)
    else
        DocV2_ApriNUI(true, meta, 'patente')
    end
end)

RegisterNetEvent('dd_doc:custom',function(meta, nomeImm)
    DocV2_ApriNUICustom(true, meta, nomeImm)
end)


local function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end


local function createDocs()
    exports.ox_inventory:Progress({
        duration = 8000,
        label = 'Firmando documenti...',
        useWhileDead = false,
        canCancel = false,
        disable = false,
        anim = {
            dict = 'missfam4',
            clip = 'base',
            flag = 49,
        },
        prop = {
            model = 'p_amb_clipboard_01',
            pos = vec3(0.16, 0.08, 0.1),
            rot = vec3(-130.0, -50.0, 0.0),
            bone = 36029
        },
    }, function(cancel)
        if not cancel then
            CreateMobilePhone(1)
            CellCamActivate(true, true)
            CellFrontCamActivate(true)
            exports.ox_inventory:Progress({
                duration = 3000,
                label = 'Creando foto...',
                useWhileDead = false,
                canCancel = false,
                disable = false
            }, function(Cancel)
                if not Cancel then
                    local url = GetBase64(PlayerPedId()).base64
                    print(url)
                    TriggerServerEvent('dd_doc:daiDoc', GetPlayerServerId(PlayerId()), url)
                    Citizen.Wait(1000)
                    CellFrontCamActivate(false)
                    DestroyMobilePhone()
                    CellCamActivate(false, false)
                end
            end) 
        end
    end)
end



Citizen.CreateThread(function()
    TriggerEvent('gridsystem:registerMarker', {
        name = 'blip_documenti_spawn_player',
        type = 23,
        texture = nil,
        scale = vector3(3.8, 3.8, 3.8),
        color = { r = 0, g = 51, b = 204 },
        pos = vector3(-260.939, -965.6827, 31.22434),
        control = 'E',
        posizione = "left-center",
        titolo = "Documenti",
        action = function()
            createDocs()
        end,
        onExit = function()
            lib.hideTextUI()
            ESX.UI.Menu.CloseAll()
        end,
        msg = " per ricevere i documenti",
    })
end)