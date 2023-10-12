local ESX = exports['es_extended']:getSharedObject()


RegisterServerEvent("dd_kit:confermaKit", function(source, kit)
    local xPlayer = ESX.GetPlayerFromId(source)
    if kit == "1" then
        Wait(1000)
        xPlayer.setAccountMoney('bank', 30000)
        xPlayer.addInventoryItem("money", 5000)
        xPlayer.addInventoryItem("patente", 1)
    end
end)

