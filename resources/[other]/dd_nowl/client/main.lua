local function ApriListaLavori(jobs)
    local elementi = {}
    for k,v in pairs(jobs) do
        table.insert(elementi, {label = v, value = v})
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_main_lavori_nowl', {
        title = 'Seleziona uno dei '..#jobs.." lavori",
        align = 'top-left',
        elements = elementi
    }, function(data, menu)
        local verifica = data.current.value

        if verifica == 'Minatore' then
            FreezeEntityPosition(PlayerPedId(), true)
            ExecuteCommand("e shakeoff")
            Wait(3500)
            FreezeEntityPosition(PlayerPedId(), false)
        elseif verifica == 'Falegname' then
        elseif verifica == 'Netturbino' then
        elseif verifica == 'Camionista' then
        end

        end, 
        function(data, menu)
            menu.close()
    end)
end

Citizen.CreateThread(function()
    for k,v in pairs(ConfigJobCenter) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'lavoro_'..k,
            type = 20,
            texture = nil,
            scale = vector3(1.0, 1.0, 1.0),
            color = { r = 255, g = 12, b = 12 },
            pos = v.pos,
            control = 'E',
			posizione = "left-center",
			titolo = k,
            action = function()
                ApriListaLavori(v.lavori)
            end,
            onExit = function()
                lib.hideTextUI()
                ESX.UI.Menu.CloseAll()
            end,
            msg = " per richiedere il lavoro",
        })
    end
end)
