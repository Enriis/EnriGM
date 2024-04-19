PlayersJobs = {} --

local jobs = LoadResourceFile(GetCurrentResourceName(), "json/jobs.json")
local data_jobs = json.decode(jobs or '{}')

local pljobs = LoadResourceFile(GetCurrentResourceName(), "json/jobs_data.json")
local data_pljobs = json.decode(pljobs or '{}')
PlayersJobs = data_pljobs


function EditJson(tabled)
    SaveResourceFile(GetCurrentResourceName(), "json/jobs_data.json", json.encode(tabled, {indent = true}), -1)
end


function setLavoro(id, index, job, job_grade)
    local steam = id.getIdentifier()
    for k,v in pairs(data_jobs[job].gradi) do
        if k == job_grade then
            job_grade = v
        end
    end
    if PlayersJobs[steam] then
        if not PlayersJobs[steam][index] then
            PlayersJobs[steam][index] = {
                lavoro = job,
                grado = job_grade,
                labels = data_jobs[job].label
            }
            sprint("Aggiunto lavoro al giocatore")
        else
            sprint("^1il giocatore ha gia un lavoro su questo index ^0")
            return
        end
    else
        PlayersJobs[steam] = {
            [index] = {
                lavoro = job,
                grado = job_grade,
                labels = data_jobs[job].label
            }
        }

    end
    -- sprint("jobs: "..json.encode(PlayersJobs, {indent = true}))
    EditJson(PlayersJobs)
    TriggerEvent("dd_lavori:loadClient_s", id.source)
end

RegisterCommand("dailavoro", function(source, args)
    if source < 1 then print("NOT FOUND CONSOLE COMMAND") return end
    local xPlayer = ESX.GetPlayerFromId(args[1])
    if xPlayer then
        local index = tostring(args[2])
        local lavoro = tostring(args[3])
        local grado = args[4]
        if data_jobs[lavoro] then
            setLavoro(xPlayer, index, lavoro, grado)
        else
            sprint("mahhh0")
        end
    else
        sprint("giocatore non trovato")
    end
end)

RegisterServerEvent("dd_lavori:loadClient_s", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent("dd_lavori:loadClient_c", PlayersJobs[xPlayer.getIdentifier()])
    xPlayer.triggerEvent("dd_lavori:loadF5", PlayersJobs[xPlayer.getIdentifier()])
end)