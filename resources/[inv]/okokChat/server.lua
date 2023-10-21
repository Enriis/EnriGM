ESX = exports['es_extended']:getSharedObject()
RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:server:ClearChat')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not message or not author or not xPlayer then return end
	local PlayerHEX = xPlayer.identifier
    local PlayerGroup = xPlayer.getGroup()
	local PlayerName = xPlayer.getName()
	local testoTemplate = nil
	if PlayerHEX == '37eea78d5f6bacba03ba57777a93b644f795aab8' or PlayerHEX == '9939685ed09a857ad1187f475933e05ca1839164' then
		testoTemplate = '<div class="chat-message staff"><i class="fas fa-shield-alt"></i> <b><span style="color: #1ebc62">[FOUNDER] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>'
    elseif PlayerHEX == 'f19382d2514c7fa2d7e4bcd720ae95b9f147cad0' then
		testoTemplate = '<div class="chat-message staff"><i class="fas fa-shield-alt"></i> <b><span style="color: #1ebc62">[CO-FOUNDER] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>'
    elseif PlayerHEX == 'c0c215e0121d511296274d7f24c0e2407d864711' or PlayerHEX == '04d842bce8972fb14fce26cef7965e071fe2d2f7' then
		testoTemplate = '<div class="chat-message staff"><i class="fas fa-laptop"></i> <b><span style="color: #12ebd9">[DEV] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>'
	--elseif PlayerGroup == 'streamer' then
		--testoTemplate = '<div class="chat-message twitchc"><i class="fas fa-twitch"></i> <b><span style="color: #6441a5">[STREAMER PARTNER] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>'
    elseif PlayerGroup ~= 'user' and PlayerGroup ~= 'streamer' then
		testoTemplate = '<div class="chat-message staff"><i class="fas fa-shield-alt"></i> <b><span style="color: #1ebc62">[STAFF] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>'
	end
	if testoTemplate then
		TriggerClientEvent('chat:addMessage', -1, {
			template = testoTemplate,
			args = {PlayerName, message}
		})
	end
	TriggerEvent('chatMessage', source, author, message)
	if not WasEventCanceled() then
		TriggerClientEvent('chatMessage', -1, author, {255, 255, 255}, message)
	end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
	local name = GetPlayerName(source)
	TriggerEvent('chatMessage', source, name, '/' .. command)
	if not WasEventCanceled() then
		TriggerClientEvent('chatMessage', -1, name, {255, 255, 255}, '/' .. command) 
	end
	CancelEvent()
end)

local function refreshCommands(player)
	if GetRegisteredCommands then
		local registeredCommands = GetRegisteredCommands()
		local suggestions = {}
		for _, command in ipairs(registeredCommands) do
			if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
				table.insert(suggestions, {
					name = '/' .. command.name,
					help = ''
				})
			end
		end
		TriggerClientEvent('chat:addSuggestions', player, suggestions)
	end
end

AddEventHandler('onServerResourceStart', function(resName)
	Wait(500)
	for _, player in ipairs(GetPlayers()) do
		refreshCommands(player)
	end
end)

AddEventHandler("chatMessage", function(source, color, message)
	local src = source
	args = stringsplit(message, " ")
	if not args then return end
	CancelEvent()
	if string.find(args[1], "/") then
		local cmd = args[1]
		table.remove(args, 1)
	end
end)


commands = {}
commandSuggestions = {}

function starts_with(str, start)
	return str:sub(1, #start) == start
end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end