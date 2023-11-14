local StatusManette = {}

RegisterServerEvent("en_f5:thief:ammanettaTarget", function(source, target, playerheading, playerCoords, playerlocation)
    if StatusManette[target] then xPlayer.showNotification("Il giocatore è gia ammanettato", "info") return end
    StatusManette[target] = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local zTarget = ESX.GetPlayerFromId(target)
    xPlayer.triggerEvent("en_f5:thief:ammanettaTarget_c", 1)
    zTarget.triggerEvent("en_f5:thief:ammanettaTarget_c", 2, playerheading, playerCoords, playerlocation)
end)

RegisterServerEvent("en_f5:thief:smanettaTarget", function(source, target, playerheading, playerCoords, playerlocation)
    if not StatusManette[target] then xPlayer.showNotification("Il giocatore è gia smanettato", "info") return end
    StatusManette[target] = false
    local xPlayer = ESX.GetPlayerFromId(source)
    local zTarget = ESX.GetPlayerFromId(target)
    xPlayer.triggerEvent("en_f5:thief:smanettaTarget_c", 1)
    zTarget.triggerEvent("en_f5:thief:smanettaTarget_c", 2, playerheading, playerCoords, playerlocation)
end)