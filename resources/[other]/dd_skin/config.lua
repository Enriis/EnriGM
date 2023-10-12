Config = {}

Config.ESX = {
    useExport = true,                           					-- use esx export to load the framework (better then other kind of load)
    useEventTrigger = 'esx:getSharedObject',    					-- shared object trigger, working if useExport set to false
	useLegacy = true,   											-- use esx legacy
}

Config.GroupAllowist = {                        					-- admin group of your server
	["admin"] = true
}

Config.NeededMoney = 250											--	money required to save outfit and hairstyle

Config.Menu = {														-- menus settings
	-- ############## General Menu ############## --
	personaloutfitsmenu = true,
	joboutfitsmenu = true,
	factionoutfitsmenu = true,

	-- ############## Personal Outfits Menu ############## --
	ChangePersonalOutfit = true,
	SavePersonalOutfit = true,
	DeletePersonalOutfit = true,

	-- ############## Job Outfits Menu ############## --
	ChangeJobOutfit = false,
	SaveJobOutfit = true,
	DeleteJobOutfit = true,

	-- ############## Faction Outfits Menu ############## --
	ChangeFactionOutfit = false,
	SaveFactionOutfit = true,
	DeleteFactionOutfit = true,
}

Config.Job = {
	bossRank = "boss",
	unemployedJob2Rank = "disoccupato1",
}

Config.Commands = {													-- commands settings
	reloadskin = true,												-- everyone have access to this commands
	reloadprop = true,												-- everyone have access to this commands
	skin = true,													-- only Config.GroupAllowist have access to this commands
}

Config.Lang = {                                		 				-- translate here in your language
	-- ############## General ############## --
	['controlpress'] = "per interagire",
	['title'] = "Negozio di vestiti",
	['store'] = "Negozio",
	['wardarobe'] = "Guardaroba",
	['nameoutfit'] = "Nome outfit",

	-- ############## Store Menu ############## --
	['personaloutfits'] = "Outfit Personali",
	['joboutfits'] = "Outfit Lavori",
	['factionsoutfits'] = "Outfit Fazione",

	-- ############## Menu ############## --
	['changeoutfit'] = "Cambia Outfit",
	['saveoutfit'] = "Salva Outfit",
	['deleteoutfit'] = "Cancella Outfit",

	-- ############## Notifications ############## --
	-- Personal
	['outfitsavedpersonal'] = "Outfit salvato con successo!",
	['outfitdeletedpersonal'] = "Outfit rimosso con successo!",
	-- Jobs
	['outfitsavedjobs'] = "Outfit salvato con successo! - Lavoro:",
	['outfitdeletedjobs'] = "Outfit rimosso con successo! - Lavoro:",
	-- Factions
	['outfitsavedfactions'] = "Outfit salvato con successo! - Fazione:",
	['outfitdeletedfactions'] = "Outfit rimosso con successo! - Fazione:",
	-- Money
	['notenaughcash'] = "Non hai "..Config.NeededMoney.." dollari!",
	['moneypaid'] = "Hai pagato "..Config.NeededMoney.." dollari!",
	['savedandpaid'] = "Outfit salvato con successo, hai pagato "..Config.NeededMoney.." dollari!",
	-- Perms
	['notperms'] = "Non hai abbastanza permessi!",
	-- Wait Seconds
	['waitseconds'] = "Attendi 5 secondi prima di utilizzare questo comando!",
	-- Fix Commands
	['propfixed'] = "Prop fixati!",
	['skinfixed'] = "Skin fixata!",
}

Config.Blips = {													-- blips settings
	-- ############## Clothes Shops ############## --
	clotheshop = true,
	clotheshopblipconfig = {
		sprite = 73,
		color = 47,
		scale = 0.7,
		text = "Negozio di Vestiti",
	},
	clotheshopblips = {
		vector3(72.254, -1399.102, 28.876),
		vector3(-703.776, -152.258, 36.915),
		vector3(-167.863, -298.969, 39.233),
		vector3(428.694, -800.106, 28.991),
		vector3(-829.413, -1073.710, 10.828),
		vector3(11.632, 6514.224, 31.377),
		vector3(123.646, -219.440, 54.057),
		vector3(1696.291, 4829.312, 41.563),
		vector3(618.093, 2759.629, 41.588),
		vector3(1190.550, 2713.441, 37.722),
		vector3(-1193.429, -772.262, 16.824),
		vector3(-3172.496, 1048.133, 20.363),	
		vector3(-1108.441, 2708.923, 18.607)
	},

	-- ############## Barber Shops ############## --
	barbershop = true,
	barbershopblipconfig = {
		sprite = 71,
		color = 47,
		scale = 0.7,
		text = "Barbiere",
	},
	barbershopblips = {
		vector3(-814.308, -183.823, 37.068),
		vector3(136.826, -1708.373, 28.791),
		vector3(-1282.604, -1116.757, 6.490),
		vector3(1931.513, 3729.671, 32.344),
		vector3(1212.840, -472.921, 65.708),
		vector3(-32.885, -152.319, 56.576),
		vector3(-278.077, 6228.463, 31.195)
	},
}

-- ############## Marker Functions ############## --

Config.MarkerThreadWaitTime = 1000										-- wait time inserted in the marker thread

Config.ClotheShopMarker = function()									-- clotheshop marker settings (client function)
	for k,v in ipairs(Config.Blips.clotheshopblips) do
		TriggerEvent('gridsystem:registerMarker', {
			name = "vestiti" .. v.x,
			type = -1,
			texture = "negoziovestiti",
			scale = vector3(0.8, 0.8, 0.8),
			color = { r = 0, g = 51, b = 204 },
			posizione = "left-center",
			titolo = "Negozio",
			pos = v,
			action = function()
				TriggerEvent("dd_skin:menunegoziogenerale")
			end,
			onExit = function()
				lib.hideTextUI()
				ESX.UI.Menu.CloseAll()
			end,
			msg = Config.Lang.controlpress,
		})
	end
end

Config.BarberShopMarker = function()									-- barbershop marker settings (client function)
	for k,v in ipairs(Config.Blips.barbershopblips) do
		TriggerEvent('gridsystem:registerMarker', {
			name = "barbiere" .. v.x,
			type = -1,
			texture = "barbiere",
			scale = vector3(0.8, 0.8, 0.8),
			color = { r = 0, g = 51, b = 204 },
			posizione = "left-center",
			titolo = "Negozio",
			pos = v,
			action = function()
				TriggerEvent("dd_skin:barbiere")
			end,
			onExit = function()
				lib.hideTextUI()
				ESX.UI.Menu.CloseAll()
			end,
			msg = Config.Lang.controlpress,
		})
	end
end


-- Developed by Enrii#6627
