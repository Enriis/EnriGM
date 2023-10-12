Citizen.CreateThread(function()

	local Keys = {
		["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
		["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
		["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
		["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
		["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
		["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
		["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
		["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
		["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
	}

	local GUI      = {}
	GUI.Time       = 0
	local MenuType = 'default'

	local openMenu = function(namespace, name, data)
		-- number = #data.elements
		-- table.insert(data, number)
		SendNUIMessage({
			action    = 'openMenu',
			namespace = namespace,
			name      = name,
			data      = data,
		})
		
		-- FreezeEntityPosition(PlayerPedId(), true)
		-- SetPedCombatAttributes(PlayerPedId(), 292, true)
	end

	local closeMenu = function(namespace, name)

		SendNUIMessage({
			action    = 'closeMenu',
			namespace = namespace,
			name      = name,
			data      = data,
		})
		-- FreezeEntityPosition(PlayerPedId(), false)
		-- SetPedCombatAttributes(PlayerPedId(), 292, false)
	end

	ESX.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)

	RegisterNUICallback('menu_submit', function(data, cb)
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		
		if menu.submit ~= nil then
			menu.submit(data, menu)
			PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_CLOTHESSHOP_SOUNDSET", false)
		end

		cb('OK')
	end)

	RegisterNUICallback('menu_cancel', function(data, cb)
		
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		
		if menu.cancel ~= nil then
			menu.cancel(data, menu)
			PlaySoundFrontend(-1, "BACK", "HUD_MINI_GAME_SOUNDSET", false)					
		end

		cb('OK')
	end)

	RegisterNUICallback('menu_change', function(data, cb)
		
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		
		for i=1, #data.elements, 1 do
			
			menu.setElement(i, 'value', data.elements[i].value)

			if data.elements[i].selected then
				menu.setElement(i, 'selected', true)
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_CLOTHESSHOP_SOUNDSET", false)						
			else
				menu.setElement(i, 'selected', false)
			end

		end

		if menu.change ~= nil then
			menu.change(data, menu)
		end

		cb('OK')
	end)


	RegisterCommand("_D_D_ENTER", function()
		if (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'ENTER'
			})

			GUI.Time = GetGameTimer()
		end
	end)
	RegisterKeyMapping('_D_D_ENTER', 'Azione ENTER [MENU_DEFAULT]', 'KEYBOARD', 'RETURN')
	RegisterCommand("_D_D_BACKSPACE", function()
		if (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'BACKSPACE'
			})

			GUI.Time = GetGameTimer()
		end
	end)
	RegisterKeyMapping('_D_D_BACKSPACE', 'Azione BACK [MENU_DEFAULT]', 'KEYBOARD', 'BACK')
	RegisterCommand("_D_D_TOP", function()
		if (GetGameTimer() - GUI.Time) > 150 then

			SendNUIMessage({
				action  = 'controlPressed',
				control = 'TOP'
			})

			GUI.Time = GetGameTimer()
		end
	end)
	RegisterKeyMapping('_D_D_TOP', 'Azione UP [MENU_DEFAULT]', 'KEYBOARD', 'UP')
	RegisterCommand("_D_D_DOWN", function()
		if (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'DOWN'
			})

			GUI.Time = GetGameTimer()
		end
	end)
	RegisterKeyMapping('_D_D_DOWN', 'Azione DOWN [MENU_DEFAULT]', 'KEYBOARD', 'DOWN')
	RegisterCommand("_D_D_LEFT", function()
		if (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'LEFT'
			})

			GUI.Time = GetGameTimer()
		end
	end)
	RegisterKeyMapping('_D_D_LEFT', 'Azione LEFT [MENU_DEFAULT]', 'KEYBOARD', 'LEFT')
	RegisterCommand("_D_D_RIGHT", function()
		if (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'RIGHT'
			})

			GUI.Time = GetGameTimer()
		end
	end)
	RegisterKeyMapping('_D_D_RIGHT', 'Azione RIGHT [MENU_DEFAULT]', 'KEYBOARD', 'RIGHT')
end)
