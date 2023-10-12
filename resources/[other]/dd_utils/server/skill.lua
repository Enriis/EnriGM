function CheckSkillPlayer(id)
    local xPlayer = ESX.GetPlayerFromId(id)
    local skill = LoadResourceFile(GetCurrentResourceName(), "json/skill.json")
    local data_skill = json.decode(skill or '{}')
    if not data_skill[xPlayer.getIdentifier()] then
        data_skill[xPlayer.getIdentifier()] = {
            Stamina = 0,
            Stress = 0,
            Raccolta = 0,
            Illegale = 0
        }
    end
    SaveResourceFile(GetCurrentResourceName(), "json/skill.json", json.encode(data_skill, {indent = true}), -1)
    Wait(1000)
    TriggerClientEvent("en_skill:loadClient", id, data_skill[xPlayer.getIdentifier()])
end

RegisterServerEvent("en_skill:loadSS", function(source)
    CheckSkillPlayer(source)
end)

function ManagmentValSkill(source, types, skills, valore)
    local xPlayer = ESX.GetPlayerFromId(source)
    local skill = LoadResourceFile(GetCurrentResourceName(), "json/skill.json")
    local data_skill = json.decode(skill or '{}')
    local val 
    if data_skill[xPlayer.getIdentifier()][skills] then
        local lastValSkill = data_skill[xPlayer.getIdentifier()][skills]
        if types == "add" then
            val = tonumber(lastValSkill) + tonumber(valore)
            data_skill[xPlayer.getIdentifier()][skills] = val
            xPlayer.showNotification("Hai ricevuto: "..valore.." XP della skill: "..skills)
        elseif types == "remove" then
            val = tonumber(lastValSkill) - tonumber(valore)
            data_skill[xPlayer.getIdentifier()][skills] = val
            xPlayer.showNotification("Hai perso: "..valore.." XP della skill: "..skills)
        end
        SaveResourceFile(GetCurrentResourceName(), "json/skill.json", json.encode(data_skill, {indent = true}), -1)
        TriggerClientEvent("en_skill:loadClient", source, data_skill[xPlayer.getIdentifier()])
    end
end

-- RegisterCommand('addSkill', function(source, args)
--     ManagmentValSkill(source, args[1], args[2], args[3])
-- end)