_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Animazioni", "", 200, 0, 'commonmenu', 'interaction_bgd')
_menuPool:Add(mainMenu)

local primoSpawn = true

function ShowNotification(...)
  TriggerEvent('esx:showNotification', ...)
end

local EmoteTable = {}
local FavEmoteTable = {}
local KeyEmoteTable = {}
local DanceTable = {}
local PropETable = {}
local WalkTable = {}
local FaceTable = {}
local ShareTable = {}
local FavoriteEmote = ""

lang = Config.MenuLanguage
function AddEmoteMenu(menu)
  local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['emotes'], "", "", Menuthing, Menuthing)
  local dancemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['danceemotes'], "", "", Menuthing, Menuthing)
  local propmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['propemotes'], "", "", Menuthing, Menuthing)
  table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
  table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
  if Config.SharedEmotesEnabled then
    sharemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['shareemotes'], Config.Languages[lang]['shareemotesinfo'], "", Menuthing, Menuthing)
    shareddancemenu = _menuPool:AddSubMenu(sharemenu, Config.Languages[lang]['sharedanceemotes'], "", "", Menuthing, Menuthing)
    table.insert(ShareTable, 'none')
    table.insert(EmoteTable, Config.Languages[lang]['shareemotes'])
  end
  if not Config.SqlKeybinding then
    unbind2item = NativeUI.CreateItem(Config.Languages[lang]['rfavorite'], Config.Languages[lang]['rfavorite'])
    unbinditem = NativeUI.CreateItem(Config.Languages[lang]['prop2info'], "")
    favmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['favoriteemotes'], Config.Languages[lang]['favoriteinfo'], "", Menuthing, Menuthing)
    favmenu:AddItem(unbinditem)
    favmenu:AddItem(unbind2item)
    table.insert(FavEmoteTable, Config.Languages[lang]['rfavorite'])
    table.insert(FavEmoteTable, Config.Languages[lang]['rfavorite'])
    table.insert(EmoteTable, Config.Languages[lang]['favoriteemotes'])
  else
    table.insert(EmoteTable, "keybinds")
    keyinfo = NativeUI.CreateItem(Config.Languages[lang]['keybinds'], Config.Languages[lang]['keybindsinfo'] .. " /emotebind [~y~num4-9~w~] [~g~emotename~w~]")
    submenu:AddItem(keyinfo)
  end
  for a, b in pairsByKeys(DP.Emotes) do
    x, y, z = table.unpack(b)
    emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
    submenu:AddItem(emoteitem)
    table.insert(EmoteTable, a)
    if not Config.SqlKeybinding then
      favemoteitem = NativeUI.CreateItem(z, Config.Languages[lang]['set'] .. z .. Config.Languages[lang]['setboundemote'])
      favmenu:AddItem(favemoteitem)
      table.insert(FavEmoteTable, a)
    end
  end
  for a, b in pairsByKeys(DP.Dances) do
    x, y, z = table.unpack(b)
    danceitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
    sharedanceitem = NativeUI.CreateItem(z, "")
    dancemenu:AddItem(danceitem)
    if Config.SharedEmotesEnabled then
      shareddancemenu:AddItem(sharedanceitem)
    end
    table.insert(DanceTable, a)
  end
  if Config.SharedEmotesEnabled then
    for a, b in pairsByKeys(DP.Shared) do
      x, y, z, otheremotename = table.unpack(b)
      if otheremotename == nil then
        shareitem = NativeUI.CreateItem(z, "/nearby (~g~" .. a .. "~w~)")
      else
        shareitem = NativeUI.CreateItem(z, "/nearby (~g~" .. a .. "~w~) " .. Config.Languages[lang]['makenearby'] .. " (~y~" .. otheremotename .. "~w~)")
      end
      sharemenu:AddItem(shareitem)
      table.insert(ShareTable, a)
    end
  end
  for a, b in pairsByKeys(DP.PropEmotes) do
    x, y, z = table.unpack(b)
    propitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
    propmenu:AddItem(propitem)
    table.insert(PropETable, a)
    if not Config.SqlKeybinding then
      propfavitem = NativeUI.CreateItem(z, Config.Languages[lang]['set'] .. z .. Config.Languages[lang]['setboundemote'])
      favmenu:AddItem(propfavitem)
      table.insert(FavEmoteTable, a)
    end
  end
  if not Config.SqlKeybinding then
    favmenu.OnItemSelect = function(sender, item, index)
      if FavEmoteTable[index] == Config.Languages[lang]['rfavorite'] then
        FavoriteEmote = ""
        ShowNotification(Config.Languages[lang]['rfavorite'], 2000)
        return
      end
      if Config.FavKeybindEnabled then
        FavoriteEmote = FavEmoteTable[index]
        ShowNotification("~o~" .. firstToUpper(FavoriteEmote) .. Config.Languages[lang]['newsetemote'])
      end
    end
  end
  dancemenu.OnItemSelect = function(sender, item, index)
    EmoteMenuStart(DanceTable[index], "dances")
  end
  if Config.SharedEmotesEnabled then
    sharemenu.OnItemSelect = function(sender, item, index)
      if ShareTable[index] ~= 'none' then
        target, distance = GetClosestPlayer()
        if (distance ~= -1 and distance < 3) then
          _, _, rename = table.unpack(DP.Shared[ShareTable[index]])
          TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), ShareTable[index])
          HelpNotification('Richiesta inviata a ~g~' .. GetPlayerName(target) .. '~s~')
        else
          HelpNotification(Config.Languages[lang]['nobodyclose'])
        end
      end
    end
    shareddancemenu.OnItemSelect = function(sender, item, index)
      target, distance = GetClosestPlayer()
      if (distance ~= -1 and distance < 3) then
        _, _, rename = table.unpack(DP.Dances[DanceTable[index]])
        TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), DanceTable[index], 'Dances')
        HelpNotification('Richiesta inviata a ~g~' .. GetPlayerName(target) .. '~s~')
      else
        HelpNotification(Config.Languages[lang]['nobodyclose'])
      end
    end
  end
  propmenu.OnItemSelect = function(sender, item, index)
    EmoteMenuStart(PropETable[index], "props")
  end
  submenu.OnItemSelect = function(sender, item, index)
    if EmoteTable[index] ~= Config.Languages[lang]['favoriteemotes'] then
      EmoteMenuStart(EmoteTable[index], "emotes")
    end
  end
end

function AddCancelEmote(menu)
  local newitem = NativeUI.CreateItem(Config.Languages[lang]['cancelemote'], '')
  menu:AddItem(newitem)
  menu.OnItemSelect = function(sender, item, checked_)
    if item == newitem then
      EmoteCancel()
      DestroyAllProps()
      ShowNotification("~g~Emote Cancellata~w~") 
    end
  end
end

function AddWalkMenu(menu)
  local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['walkingstyles'], "", "", Menuthing, Menuthing)
  walkreset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
  submenu:AddItem(walkreset)
  table.insert(WalkTable, Config.Languages[lang]['resetdef'])
  WalkInjured = NativeUI.CreateItem("Injured", "")
  submenu:AddItem(WalkInjured)
  table.insert(WalkTable, "move_m@injured")
  for a,b in pairsByKeys(DP.Walks) do
    x = table.unpack(b)
    walkitem = NativeUI.CreateItem(a, "")
    submenu:AddItem(walkitem)
    table.insert(WalkTable, x)
  end
  submenu.OnItemSelect = function(sender, item, index)
    if item ~= walkreset then
      WalkMenuStart(WalkTable[index])
    else
      ResetPedMovementClipset(PlayerPedId())
    end
  end
end

function AddFaceMenu(menu)
  local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['moods'], "", "", Menuthing, Menuthing)
  facereset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
  submenu:AddItem(facereset)
  table.insert(FaceTable, "")
  for a,b in pairsByKeys(DP.Expressions) do
    x,y,z = table.unpack(b)
    faceitem = NativeUI.CreateItem(a, "")
    submenu:AddItem(faceitem)
    table.insert(FaceTable, a)
  end
  submenu.OnItemSelect = function(sender, item, index)
    if item ~= facereset then
      EmoteMenuStart(FaceTable[index], "expression")
    else
      ClearFacialIdleAnimOverride(PlayerPedId())
    end
  end
end

function OpenEmoteMenu()
  mainMenu:Visible(not mainMenu:Visible())
end

function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

AddEmoteMenu(mainMenu)
AddCancelEmote(mainMenu)
if Config.WalkingStylesEnabled then
  AddWalkMenu(mainMenu)
end
if Config.ExpressionsEnabled then
  AddFaceMenu(mainMenu)
end

RegisterNetEvent("dp:Update")
AddEventHandler("dp:Update", function(state)
  UpdateAvailable = state
  _menuPool:RefreshIndex()
end)

RegisterNetEvent("dpEmotes:apriMenu")
AddEventHandler("dpEmotes:apriMenu", function()
  _menuPool:RefreshIndex()
  if primoSpawn then
    primoSpawn = false
    Citizen.CreateThread(function()
      while true do
        local CicloDefault = 500
        if _menuPool ~= nil and _menuPool:IsAnyMenuOpen() then
          CicloDefault = 0
          _menuPool:ProcessMenus()
        end
        Citizen.Wait(CicloDefault)
      end
    end)
  end
  OpenEmoteMenu()
end)