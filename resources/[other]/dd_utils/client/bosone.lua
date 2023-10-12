-- Aggiungere animazione borsone a terra. Se viene utilizzato elimnare l'item quando lo raccoglie givvarlo

-- RegisterCommand("borsone", function()
--     ESX.ShowNotification("HaI RICEVUTO L'ITEM BORSONE")
--     TriggerServerEvent("en_borsone:giveItem", GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
-- end)

local function CountBagOutfits(metas)
    local count = 0
    for k,v in pairs(metas) do
        if k then
            count = count + 1
        end
    end
    if tonumber(count) >= 5 then
        return false
    else
        return true
    end
end

RegisterNetEvent("en_borsone:apriMenu", function(metadata, slot)
    local elementi = {}
    if json.encode(metadata) ~= "[]" then
        elementi = {
            {label = "Lista Outfits", val = "meta"},
            {label = "Salva Outfits", val = "save"}
        }
    else
        elementi = {
            {label = "Salva Outfits", val = "save"}
        }
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_ioutfi_menu', {
       title = 'Borsone',
       align = 'top-left',
       elements = elementi
    }, function(data, menu)
        local verifica = data.current.val

        if verifica == "meta" then
            ListaOutfits(metadata, slot)
        elseif verifica == "save" then
            if CountBagOutfits(metadata) then
                local input = lib.inputDialog('Nome Outfits', {'Inserici il nome'})
                if input[1] then
                    local pedModel = exports['dd_skin']:getPedModel(PlayerPedId())
                    local pedComponents = exports['dd_skin']:getPedComponents(PlayerPedId())
                    local pedProps = exports['dd_skin']:getPedProps(PlayerPedId())
                    TriggerServerEvent("dd_borsone:saveOutfits", GetPlayerServerId(PlayerId()), slot, tostring(input[1]), pedModel, pedComponents, pedProps)
                    ESX.UI.Menu.CloseAll()
                else
                    ESX.ShowNotification("Non hai dato un nome al vestito", "error")
                end
            else
                ESX.ShowNotification("Hai esaurito lo spazio all'interno del borsone", "info")
            end
        end

        end, function(data, menu)
            menu.close()
        end
    )
end)

function ListaOutfits(meta, slot)
    local elementi = {}

    for k,v in pairs(meta) do    
        table.insert(elementi, {label = k, value = v})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_lista_borsone_out', {
       title = 'LISTA OUTFITS',
       align = 'top-left',
       elements = elementi
    }, function(data, menu)
        local verifica = data.current.value
        local nome = data.current.label
    
        if verifica then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'en_borsoni_azioni_type', {
                title = 'ASDDAS',
                align = 'top-left',
                elements = {
                    {label = 'Indossa', value = 'indossa'},
                    {label = 'Passa', value = 'passa'},
                    {label = 'Elimina', value = 'elimina'}
                }
            }, function(data2, menu2)
                local verifica2 = data2.current.value
                if verifica2 then
                    AzioniVest(verifica2, verifica, nome, slot)
                    ESX.UI.Menu.CloseAll()
                end
                
                end, function(data2, menu2)
                    menu2.close()
                end
            )
        end
    
        end, function(data, menu)
            menu.close()
        end
    )           
end

function AzioniVest(types, val, nome, slot)
    if types == "indossa" then
        TriggerEvent("dd_borsone:indossa", val, nome)
    elseif types == "passa" then
        getMousePlayer(function(closestPlayer, closestDistance)
            if (closestPlayer and closestDistance) and ((closestPlayer ~= -1) and (closestDistance > 0 and closestDistance <= 3.0)) then
                local targetPlayer = GetPlayerServerId(closestPlayer)
                if targetPlayer then
                    TriggerServerEvent("dd_borsone:loadPlayerOutfits", targetPlayer, val, nome)
                    ESX.ShowNotification("Hai passato l'outfit "..nome.." al giocatore: "..targetPlayer)
                end
            else
                ESX.ShowNotification("Non ci sono player nelle vicinanze", "error")
            end
        end)
    elseif types == "elimina" then
        TriggerServerEvent("dd_borsone:elimina", GetPlayerServerId(PlayerId()), nome, slot)
        ESX.ShowNotification("Hai eliminato il completo: "..nome, "info")
    end
end
