local ESX = exports['es_extended']:getSharedObject()


RegisterServerEvent("dd_kit:confermaKit", function(source, kit)
    local xPlayer = ESX.GetPlayerFromId(source)
    if kit == "Criminale" then
        xPlayer.addInventoryItem("money", 18000)
        xPlayer.addInventoryItem("portafoglio", 1)
        xPlayer.addInventoryItem("radio", 1)
        xPlayer.addInventoryItem("phone", 1)
        xPlayer.addInventoryItem("zaino", 1)
    elseif kit == "Giustizia" then
        xPlayer.addInventoryItem("money", 18000)
        xPlayer.addInventoryItem("portafoglio", 1)
        xPlayer.addInventoryItem("phone", 1)
    elseif kit == "Affari" then
        xPlayer.addInventoryItem("money", 20000)
        xPlayer.addInventoryItem("portafoglio", 1)
        xPlayer.addInventoryItem("phone", 1)
        --xPlayer.addInventoryItem("contratto-work", 1) -- Item che permette al giocatore di avere piu facilmente il lavoro
    elseif kit == "Cittadino" then
        xPlayer.addInventoryItem("money", 18000)
        xPlayer.addInventoryItem("portafoglio", 1)
        xPlayer.addInventoryItem("phone", 1)
    end
    Wait(1000)
end)

