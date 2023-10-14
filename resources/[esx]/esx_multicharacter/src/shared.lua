
if IsDuplicityVersion() then
    Notifica = function(source, text, tipo)
        TriggerClientEvent('esx:showNotification', source, text, tipo)
    end
else 
    Notifica = function(text, tipo)
        TriggerEvent('esx:showNotification', text, tipo)
    end
end