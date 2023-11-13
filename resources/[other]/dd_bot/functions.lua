function SendLog(data, cb)
    PerformHttpRequest('http://localhost:4568/log', function(err, text, headers)
    end, 'POST', json.encode(data), {['Content-Type'] = 'application/json'})
end

        --  SendLog({
        --     embed = {
        --         id_stanza = "1156609051526967426",
        --         title = "SERVER ONLINE", 
        --         color = "5763719", 
        --         description = "Server online, connettiti."
        --     }
        --  })

function SendAlert(data, cb)

end
-- exports('sendData', sendData)

-- RegisterCommand("serveron", function(source, args)
--     if source == 0 then
--         print("console")
--         sendData({
--             embed = {
--                 id_stanza = "1156609051526967426",
--                 title = "SERVER ONLINE", 
--                 color = "5763719", 
--                 description = "Server online, connettiti."
--             }
--         })
--     else
--         print("Comando attivato dal giocatore: "..source)
--         return
--     end
-- end)

function LogAddPexBot()
end