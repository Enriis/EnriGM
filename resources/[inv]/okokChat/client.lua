local chatInputActive = false
local chatInputActivating = false
local chatHidden = true
local chatLoaded = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:client:ClearChat')
RegisterNetEvent('__cfx_internal:serverPrint')
RegisterNetEvent('_chat:messageEntered')

AddEventHandler('chatMessage', function(author, color, text)
	local args = {text}
	if author ~= '' then
		table.insert(args, 1, author)
	end
	SendNUIMessage({
		type = 'ON_MESSAGE',
		message = {
			color = color,
			args = args
		}
	})
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
	SendNUIMessage({
		type = 'ON_MESSAGE',
		message = {
			templateId = 'print',
			args = {msg}
		}
	})
end)

local nascosta = false
RegisterCommand('chat', function()
	if not nascosta then
		nascosta = true
		SendNUIMessage({
			type = 'ON_CLEAR'
		})
		TriggerEvent('esx:showNotification', 'Hai disabilitato la chat', 'success')
	else
		nascosta = false
		TriggerEvent('esx:showNotification', 'Hai abilitato la chat', 'success')
	end
end)

exports('toggleChat', function(state)
	nascosta = state
	SendNUIMessage({
		type = 'ON_CLEAR'
	})
end)

AddEventHandler('chat:addMessage', function(message, group)
	group = group or 'user'
	if not nascosta or group ~= 'user' then
		SendNUIMessage({
			type = 'ON_MESSAGE',
			message = message
		})
	end
end)

AddEventHandler('chat:addSuggestion', function(name, help, params)
	SendNUIMessage({
		type = 'ON_SUGGESTION_ADD',
		suggestion = {
			name = name,
			help = help,
			params = params or nil
		}
	})
end)

AddEventHandler('chat:addSuggestions', function(suggestions)
	for _, suggestion in ipairs(suggestions) do
		SendNUIMessage({
			type = 'ON_SUGGESTION_ADD',
			suggestion = suggestion
		})
	end
end)

AddEventHandler('chat:removeSuggestion', function(name)
	SendNUIMessage({
		type = 'ON_SUGGESTION_REMOVE',
		name = name
	})
end)

RegisterNetEvent('chat:resetSuggestions')
AddEventHandler('chat:resetSuggestions', function()
	SendNUIMessage({
		type = 'ON_COMMANDS_RESET'
	})
end)

AddEventHandler('chat:addTemplate', function(id, html)
	SendNUIMessage({
		type = 'ON_TEMPLATE_ADD',
		template = {
			id = id,
			html = html
		}
	})
end)

AddEventHandler('chat:client:ClearChat', function(name)
	SendNUIMessage({
		type = 'ON_CLEAR'
	})
end)

RegisterNUICallback('chatResult', function(data, cb)
	chatInputActive = false
	SetNuiFocus(false)
	if not data.canceled then
		local id = PlayerId()
		local r, g, b = 0, 0x99, 255
		if data.message:sub(1, 1) == '/' then
			ExecuteCommand(data.message:sub(2))
		else
			TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), {r, g, b}, data.message)
		end
	end
	cb('ok')
end)

local function refreshCommands()
	if GetRegisteredCommands then
		local registeredCommands = GetRegisteredCommands()
		local suggestions = {}
		for _, command in ipairs(registeredCommands) do
			if IsAceAllowed(('command.%s'):format(command.name)) then
				table.insert(suggestions, {
					name = '/' .. command.name,
					help = ''
				})
			end
		end
		TriggerEvent('chat:addSuggestions', suggestions)
	end
end

local function refreshThemes()
	local themes = {}
	for resIdx = 0, GetNumResources() - 1 do
		local resource = GetResourceByFindIndex(resIdx)
		if GetResourceState(resource) == 'started' then
			local numThemes = GetNumResourceMetadata(resource, 'chat_theme')
			if numThemes > 0 then
				local themeName = GetResourceMetadata(resource, 'chat_theme')
				local themeData = json.decode(GetResourceMetadata(resource, 'chat_theme_extra') or 'null')
				if themeName and themeData then
					themeData.baseUrl = 'nui://' .. resource .. '/'
					themes[themeName] = themeData
				end
			end
		end
	end
	SendNUIMessage({
		type = 'ON_UPDATE_THEMES',
		themes = themes
	})
end

AddEventHandler('onClientResourceStart', function(resName)
	Wait(500)
	refreshCommands()
	refreshThemes()
end)

AddEventHandler('onClientResourceStop', function(resName)
	Wait(500)
	refreshCommands()
	refreshThemes()
end)

RegisterNUICallback('loaded', function(data, cb)
	TriggerServerEvent('chat:init');
	refreshCommands()
	refreshThemes()
	chatLoaded = true
	cb('ok')
end)

local function CicloChat()
	Citizen.CreateThread(function()
		while chatInputActivating do
			if not IsControlPressed(0, 245) then
				SetNuiFocus(true)
				chatInputActivating = false
			end
			Wait(5)
		end
	end)
end

RegisterCommand('_ApriNuiChat', function()
	if not chatInputActive then
		chatInputActive = true
		chatInputActivating = true
		CicloChat()
		SendNUIMessage({
			type = 'ON_OPEN'
		})
	end
end)

Citizen.CreateThread(function()
	SetTextChatEnabled(false)
	SetNuiFocus(false)
	RegisterKeyMapping('_ApriNuiChat', 'Apri Chat', 'KEYBOARD', 'T')
end)