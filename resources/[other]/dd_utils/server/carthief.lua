CountServerFurti = 0

RegisterServerEvent("dd_thief:action", function(source, azione)
    local xPlayer = ESX.GetPlayerFromId(source)
    if azione == "addFurto" then
        CountServerFurti = CountServerFurti + 1
        Wait(100)
        TriggerClientEvent("dd_thief:setValCLGlob", -1, CountServerFurti, xPlayer.getName())
    elseif azione == "remFurto" then
        CountServerFurti = CountServerFurti - 1
        Wait(100)
        TriggerClientEvent("dd_thief:setValCLGlob", -1, CountServerFurti, xPlayer.getName())
    end
end)

RegisterServerEvent("dd_thief:loadLocalClient", function(source)
    TriggerClientEvent("dd_thief:setValCLGlob", source, CountServerFurti, 1)
end)