local PlTentativi = 0

function StartaRapina(rap)
    if PlTentativi > 3 then 
        ESX.ShowNotification("Tentativi superati, allarme scattata", "success")
        SetTimeout(60000, function()
            PlTentativi = 0
        end)
        return
    end
    local LabelRap = rap.label
    local CoordsRap = rap.coords
    local TimeRap = rap.time
    local success = lib.skillCheck({'easy', 'medium', {areaSize = 60, speedMultiplier = 1.5}, 'hard'}, {'w', 'a', 's', 'd'})
    print(success)
    if success then

    else
        PlTentativi = PlTentativi + 1
    end
end
local function ControlloRapina(rapina)
    if PlTentativi > 3 then return end
    -- local arma, hash = GetCurrentPedWeapon(PlayerPedId())
    -- local ListHash = { -- Aggiornare lista
    --     453432689,
    --     -1075685676,
    --     1593441988,
        
    -- }
    -- for k,v in pairs(ListHash) do
        -- if hash == v then
            -- local count = GlobalState.lavori["police"] 
            -- if count == nil then
            --     count = 0 
            -- end
            -- if tonumber(count) >= rapina.cops then
                StartaRapina(rapina)
            -- else
            --     ESX.ShowNotification("Non c'e abbastanza polizia in servizio")
            -- end
        -- end
    -- end
end


Citizen.CreateThread(function()
    for k,v in pairs(ConfigRapine) do
        CreaBlips("Rapina "..k, 272, 1, v.coords, 0.6)
        local data = {}
        TriggerEvent('gridsystem:registerMarker', {
            name = v.blip_name,
            type = 29,
            texture = nil,
            scale = vec3(0.4,0.4,0.4),
            color = { r = 0, g = 255, b = 0 },
            pos = v.coords,
            control = 'E',
            posizione = "left-center",
            titolo = "Rapina: "..k,
            action = function()
                data = {
                    label = k,
                    cops = v.police,
                    time = v.time, 
                    coords = v.coords
                }
                ControlloRapina(data)
            end,
            onEnter = function()
            end,
            onExit = function()
                lib.hideTextUI()
                ESX.UI.Menu.CloseAll()
            end,
            msg = ( v.notifica or "INTERAGIRE" ),
        })
    end
end)

