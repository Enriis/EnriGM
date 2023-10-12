SetMapName('San Andreas')
SetGameType('ESX Legacy')

local loadPexStaffPl 

local newPlayer = 'INSERT INTO `users` SET `accounts` = ?, `identifier` = ?, `group` = ?'
local loadPlayer = 'SELECT `accounts`, `job`, `job_grade`, `group`, `position`, `inventory`, `skin`, `loadout`, `armour`, `status`'

if Config.Multichar then
  newPlayer = newPlayer .. ', `firstname` = ?, `lastname` = ?, `dateofbirth` = ?, `sex` = ?, `height` = ?'
end

if Config.Multichar or Config.Identity then
  loadPlayer = loadPlayer .. ', `firstname`, `lastname`, `dateofbirth`, `sex`, `height`'
end

loadPlayer = loadPlayer .. ' FROM `users` WHERE identifier = ?'

if Config.Multichar then
  AddEventHandler('esx:onPlayerJoined', function(src, char, data)
    while not next(ESX.Jobs) do
      Wait(50)
    end

    if not ESX.Players[src] then
      local identifier = char .. ':' .. ESX.GetIdentifier(src)
      if data then
        createESXPlayer(identifier, src, data)
      else
        loadESXPlayer(identifier, src, false)
      end
    end
  end)
else
  RegisterNetEvent('esx:onPlayerJoined')
  AddEventHandler('esx:onPlayerJoined', function()
    local _source = source
    while not next(ESX.Jobs) do
      Wait(50)
    end

    if not ESX.Players[_source] then
      onPlayerJoined(_source)
    end
  end)
end

function onPlayerJoined(playerId)
  local identifier = ESX.GetIdentifier(playerId)
  if identifier then
    if ESX.GetPlayerFromIdentifier(identifier) then
      DropPlayer(playerId,
        ('there was an error loading your character!\nError code: identifier-active-ingame\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same Rockstar account.\n\nYour Rockstar identifier: %s'):format(
          identifier))
    else
      local result = MySQL.scalar.await('SELECT 1 FROM users WHERE identifier = ?', {identifier})
      if result then
        loadESXPlayer(identifier, playerId, false)
      else
        createESXPlayer(identifier, playerId)
      end
    end
  else
    DropPlayer(playerId,
      'there was an error loading your character!\nError code: identifier-missing-ingame\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
  end
end

function createESXPlayer(identifier, playerId, data)
  local accounts = {}

  for account, money in pairs(Config.StartingAccountMoney) do
    accounts[account] = money
  end


	if Core.IsServerOwner(playerId) then
		defaultGroup = 'superadmin'
	else
		defaultGroup = 'user'
	end

  if not Config.Multichar then
    MySQL.prepare(newPlayer, {json.encode(accounts), identifier, defaultGroup}, function()
      loadESXPlayer(identifier, playerId, true)
    end)
  else
    MySQL.prepare(newPlayer,
      {json.encode(accounts), identifier, defaultGroup, data.firstname, data.lastname, data.dateofbirth, data.sex, data.height}, function()
        loadESXPlayer(identifier, playerId, true)
      end)
  end
end

if not Config.Multichar then
  AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
    deferrals.defer()
    local playerId = source
    local identifier = ESX.GetIdentifier(playerId)

    if identifier then
      if ESX.GetPlayerFromIdentifier(identifier) then
        deferrals.done(
          ('There was an error loading your character!\nError code: identifier-active\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same account.\n\nYour identifier: %s'):format(
            identifier))
      else
        deferrals.done()
      end
    else
      deferrals.done(
        'There was an error loading your character!\nError code: identifier-missing\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
    end
  end)
end

GlobalState.lavori = {} 
local TempArray = {}

function loadESXPlayer(identifier, playerId, isNew)
  local userData = {accounts = {}, inventory = {}, job = {}, loadout = {}, playerName = GetPlayerName(playerId), weight = 0, status = {}, armour = 0}

  local result = MySQL.prepare.await(loadPlayer, {identifier})
  local job, grade, jobObject, gradeObject = result.job, tostring(result.job_grade)
  local foundAccounts, foundItems = {}, {}
  local currentStatus = json.decode(result.status) or nil

  -- Accounts
  if result.accounts and result.accounts ~= '' then
    local accounts = json.decode(result.accounts)

    for account, money in pairs(accounts) do
      foundAccounts[account] = money
    end
  end

  for account, data in pairs(Config.Accounts) do
    if data.round == nil then
      data.round = true
    end
    local index = #userData.accounts + 1
    userData.accounts[index] = {
      name = account, 
      money = foundAccounts[account] or Config.StartingAccountMoney[account] or 0,
      label = data.label, 
      round = data.round,
      index = index
    }
  end

  -- Job
  if ESX.DoesJobExist(job, grade) then
    jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
  else
    print(('[^3WARNING^7] Ignoring invalid job for ^5%s^7 [job: ^5%s^7, grade: ^5%s^7]'):format(identifier, job, grade))
    job, grade = 'unemployed', '0'
    jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
  end

  userData.job.id = jobObject.id
  userData.job.name = jobObject.name
  userData.job.label = jobObject.label

  userData.job.grade = tonumber(grade)
  userData.job.grade_name = gradeObject.name
  userData.job.grade_label = gradeObject.label
  userData.job.grade_salary = gradeObject.salary

  userData.job.skin_male = {}
  userData.job.skin_female = {}

  if gradeObject.skin_male then
    userData.job.skin_male = json.decode(gradeObject.skin_male)
  end
  if gradeObject.skin_female then
    userData.job.skin_female = json.decode(gradeObject.skin_female)
  end

  -- Group
  if result.group then
    if result.group == "superadmin" then
      userData.group = "admin"
    else
      userData.group = result.group
    end
  else
    userData.group = 'user'
  end

  -- Position
  if result.position and result.position ~= '' then
    userData.coords = json.decode(result.position)
  else
    print('[^3WARNING^7] Column ^5"position"^0 in ^5"users"^0 table is missing required default value. Using backup coords, fix your database.')
    userData.coords = {x = -269.4, y = -955.3, z = 31.2, heading = 205.8}
  end

  -- Skin
  if result.skin and result.skin ~= '' then
    userData.skin = json.decode(result.skin)
  else
    if userData.sex == 'f' then
      userData.skin = {sex = 1}
    else
      userData.skin = {sex = 0}
    end
  end

  -- Identity
  if result.firstname and result.firstname ~= '' then
    userData.firstname = result.firstname
    userData.lastname = result.lastname
    userData.playerName = userData.firstname .. ' ' .. userData.lastname
    if result.dateofbirth then
      userData.dateofbirth = result.dateofbirth
    end
    if result.sex then
      userData.sex = result.sex
    end
    if result.height then
      userData.height = result.height
    end
  end

  
  -- Status Giocatore
  if type(currentStatus) == 'table' then
    userData.status = currentStatus
  else
    userData.status = {fame = 100, sete = 100, stress = 100, drunk = 0}
  end

    -- Armatura Giocatore
    if type(result.armour) == 'number' then 
    userData.armour = result.armour
  else
    userData.armour = 0
  end

  -- Inventario load player

  if result.inventory and result.inventory ~= '' then
    userData.inventory = json.decode(result.inventory)
  else
    userData.inventory = {}
  end


  local xPlayer = CreateExtendedPlayer(playerId, identifier, userData.group, userData.accounts, userData.inventory, userData.weight, userData.job,
    userData.loadout, userData.playerName, userData.coords, userData.status, userData.armour)
  ESX.Players[playerId] = xPlayer

  if userData.firstname then
    xPlayer.set('firstName', userData.firstname)
    xPlayer.set('lastName', userData.lastname)
    if userData.dateofbirth then
      xPlayer.set('dateofbirth', userData.dateofbirth)
    end
    if userData.sex then
      xPlayer.set('sex', userData.sex)
    end
    if userData.height then
      xPlayer.set('height', userData.height)
    end
  end

  TriggerEvent('esx:playerLoaded', playerId, xPlayer, isNew)

  xPlayer.triggerEvent('esx:playerLoaded',
    {
      accounts = xPlayer.getAccounts(), 
      coords = xPlayer.getCoords(), 
      identifier = xPlayer.getIdentifier(), 
      inventory = xPlayer.getInventory(),
      job = xPlayer.getJob(), 
      loadout = xPlayer.getLoadout(), 
      maxWeight = xPlayer.getMaxWeight(), 
      money = xPlayer.getMoney(),
      sex = xPlayer.get("sex") or "m",
      dead = false,
      armour = userData.armour,
      status = userData.status
    }, isNew,
  userData.skin)

  
  local infoPlayer = Player(playerId)
  infoPlayer.state.infoPl = {
    lavoro = xPlayer.getJob().label,
    grado = xPlayer.getJob().grade_label,
    gradename = xPlayer.getJob().grade_name,
    nome = xPlayer.getJob().name,
    identifier = xPlayer.getIdentifier()
  }

  if not TempArray[xPlayer.getJob().name] then
    TempArray[xPlayer.getJob().name] = 1
  else
    TempArray[xPlayer.getJob().name] = TempArray[xPlayer.getJob().name] + 1
  end

  GlobalState.lavori = TempArray
  exports.ox_inventory:setPlayerInventory(xPlayer, userData.inventory)

  xPlayer.triggerEvent('esx:registerSuggestions', Core.RegisteredCommands)
  --print("[^2ES_EXTENDED^0] Giocatore: ^5"..xPlayer.getName().."^0 - ID: ^5"..playerId.."^0 si sta ^2connettendo^0 al ^1SERVER^0")
end

RegisterServerEvent("dd_extended:updateStateJob", function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
  local infoPlayer = Player(source)
  infoPlayer.state.infoPl = {
    lavoro = xPlayer.getJob().label,
    grado = xPlayer.getJob().grade_label,
    gradename = xPlayer.getJob().grade_name,
    nome = xPlayer.getJob().name,
    staff =  loadPexStaffPl,
    identifier = xPlayer.getIdentifier()
  }
	print("[^4ES_EXTENDED^0] Aggiorno lavoro al player ^6"..GetPlayerName(source).."^0 al lavoro: ^1"..xPlayer.getJob().label.."^0")
end)

RegisterServerEvent("dd_extended:updatePexStaff", function(source, pex)
  if not pex then
    for i = 1, 50 do
      Wait(1200)
      print("^1BOT DISCORD NON AVVIATO^0")
    end
  end
  loadPexStaffPl = pex
  local xPlayer = ESX.GetPlayerFromId(source)
  local infoPlayer = Player(source)
  infoPlayer.state.infoPl = {
    lavoro = xPlayer.getJob().label,
    grado = xPlayer.getJob().grade_label,
    gradename = xPlayer.getJob().grade_name,
    nome = xPlayer.getJob().name,
    staff =  loadPexStaffPl,
    identifier = xPlayer.getIdentifier()
  }
  xPlayer.showNotification("Hai ricevuto i permessi da: "..loadPexStaffPl)
  print("[^4ES_EXTENDED^0] Permessi "..pex.." aggiornati al giocatore: "..GetPlayerName(source).." ID: "..source)
end)

AddEventHandler('playerDropped', function(reason)
  local playerId = source
  local xPlayer = ESX.GetPlayerFromId(playerId)

  if xPlayer then
    TriggerEvent('esx:playerDropped', playerId, reason)

    Core.SavePlayer(xPlayer, function()
      ESX.Players[playerId] = nil
    end)

    if not TempArray[xPlayer.getJob().name] then
      TempArray[xPlayer.getJob().name] = 0
    elseif TempArray[xPlayer.getJob().name] == 0 then
      TempArray[xPlayer.getJob().name] = 0
    else
      TempArray[xPlayer.getJob().name] = TempArray[xPlayer.getJob().name] - 1
    end
    GlobalState.lavori = TempArray
    --print(json.encode(xPlayer.getInventory(), {indent = true}))
  end
end)

AddEventHandler('esx:playerLogout', function(playerId, cb)
  local xPlayer = ESX.GetPlayerFromId(playerId)
  if xPlayer then
    TriggerEvent('esx:playerDropped', playerId)

    Core.SavePlayer(xPlayer, function()
      ESX.Players[playerId] = nil
      if cb then
        cb()
      end
    end)
  end
  TriggerClientEvent("esx:onPlayerLogout", playerId)
end)

RegisterNetEvent('esx:updateCoords')
AddEventHandler('esx:updateCoords', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer then
    xPlayer.updateCoords()
    xPlayer.removeStatus('fame', ESX.Math.Round(math.random(1, 3)/9,1))
    xPlayer.removeStatus('sete', ESX.Math.Round(math.random(1, 3)/9,1))
    xPlayer.triggerEvent('dd_hud:updateStatus', xPlayer.getStatus(true))
  end
end)

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  cb({identifier = xPlayer.identifier, accounts = xPlayer.getAccounts(), inventory = xPlayer.getInventory(), job = xPlayer.getJob(),
      loadout = xPlayer.getLoadout(), money = xPlayer.getMoney(), position = xPlayer.getCoords(true)})
end)

ESX.RegisterServerCallback('esx:isUserAdmin', function(source, cb)
	local bools = Core.IsPlayerAdmin(source)
	if bools ~= nil then
		cb(bools)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx:getGameBuild', function(source, cb)
  cb(tonumber(GetConvar("sv_enforceGameBuild", 1604)))
end)

ESX.RegisterServerCallback('esx:getOtherPlayerData', function(source, cb, target)
  local xPlayer = ESX.GetPlayerFromId(target)

  cb({identifier = xPlayer.identifier, accounts = xPlayer.getAccounts(), inventory = xPlayer.getInventory(), job = xPlayer.getJob(),
      loadout = xPlayer.getLoadout(), money = xPlayer.getMoney(), position = xPlayer.getCoords(true)})
end)

ESX.RegisterServerCallback('esx:getPlayerNames', function(source, cb, players)
  players[source] = nil

  for playerId, v in pairs(players) do
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer then
      players[playerId] = xPlayer.getName()
    else
      players[playerId] = nil
    end
  end

  cb(players)
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
  if eventData.secondsRemaining == 60 then
    CreateThread(function()
      Wait(50000)
      Core.SavePlayers()
    end)
  end
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
  Core.SavePlayers()
end)


-- Status Ox
RegisterServerEvent("dd_status:add", function(source, array)
  local xPlayer = ESX.GetPlayerFromId(source)
  for k,v in pairs(array) do
      xPlayer.addStatus(k, v)
  end
end)