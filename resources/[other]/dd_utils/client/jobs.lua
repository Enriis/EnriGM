local LavoriPl = {}

Citizen.CreateThread(function()
    Wait(1000)
    if json.encode(LavoriPl) == "[]" then
        print("load client")
        TriggerServerEvent("dd_lavori:loadClient_s", GetPlayerServerId(PlayerId()))
    else
        print(json.encode(LavoriPl))
    end
end)

RegisterNetEvent("dd_lavori:loadClient_c", function(args)
    LavoriPl = args
end)

RegisterCommand("lavori", function()
    for k,v in pairs(LavoriPl) do
        print(k, v.lavoro)
    end
end)
