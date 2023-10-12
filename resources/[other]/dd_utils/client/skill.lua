local skills = nil

RegisterNetEvent("en_skill:loadClient", function(skillSource)
    skills = skillSource
end)

function GetLvlSkill(lvl)
    local LivelloAttuale = tonumber(lvl)
    local max 
    local min 
    local SkillLevel
    local Livello 
    if LivelloAttuale <= 100 then
        SkillLevel = 'Livello 0 - XP: '..math.round(LivelloAttuale)
        min = 0
        max = 100
        Livello = 0 
    elseif LivelloAttuale > 100 and LivelloAttuale <= 200 then 
        SkillLevel = 'Livello 1 - XP: '..math.round(LivelloAttuale)
        min = 100
        max = 200
        Livello = 1 
    elseif LivelloAttuale > 200 and LivelloAttuale <= 400 then
        SkillLevel = 'Livello 2 - XP: '..math.round(LivelloAttuale)
        min = 200
        max = 400
        Livello = 2
    elseif LivelloAttuale > 400 and LivelloAttuale <= 1600 then
        SkillLevel = 'Livello 3 - XP: '..math.round(LivelloAttuale)
        min = 400
        max = 1600
        Livello = 3
    elseif LivelloAttuale > 1600 and LivelloAttuale <= 3200 then
        SkillLevel = 'Livello 4 - and: '..math.round(LivelloAttuale)
        min = 1600
        max = 3200
        Livello = 4
    elseif LivelloAttuale > 3200 and LivelloAttuale <= 6400 then
        SkillLevel = 'Livello 5 - XP: '..math.round(LivelloAttuale)
        min = 3200
        max = 6400
        Livello = 5
    elseif LivelloAttuale > 6400 and LivelloAttuale <= 12000 then
        SkillLevel = 'Livello 6 - XP: '..math.round(LivelloAttuale)
        min = 6400
        max = 12000
        Livello = 6
    elseif LivelloAttuale > 12000 then
        SkillLevel = 'Livello 7 - XP: '..math.round(LivelloAttuale)
        min = 12000
        max = 100000
        Livello = 7
    end
    return max, min, SkillLevel, Livello
end

RegisterCommand("skill", function()
    local options = {}
    for k,v in pairs(skills) do
        local icons = ConfigSkillIcon[k]
        local LivelloAttuale = tonumber(v)
        local max, min, SkillLevel = GetLvlSkill(LivelloAttuale)
        local cu = math.floor((LivelloAttuale - min) / (max - min) * 100)

        local color = ""
        
        if cu >= 0 and cu <= 20 then
            color = "red"
        elseif cu > 20 and cu <= 40 then
            color = "orange"
        elseif cu > 40 and cu <= 70 then
            color = "yellow"
        elseif cu > 70 and cu <= 100 then
            color = "green"
        end
        
        table.insert(options, {
            arrow = true,
            icon = icons,
            title = k,
            description = '( '..SkillLevel..' ) Totale XP ( '..math.round(max)..' )',
            progress = math.floor((LivelloAttuale - min) / (max - min) * 100),
            colorScheme = color
        })

    end
    lib.registerContext({
        id = 'test',
        title = "Skill Giocaotre",
        options = options,
    })
    lib.showContext('test')
end)
