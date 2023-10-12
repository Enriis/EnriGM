Morte = {
    BleedOut = 30, -- Secondi
    KnockTime = 60, -- Secondi
    ReviveTime = 10, -- Secondi
    CallMediciWait = 1,-- Minuti
    rprogress = true, -- se è falso allora vedrai un testo 3D
    TriggerPhone    = "esx_addons_gcphone:call",
    GksPhone = false, -- se true quello di sopra non serve a un cazzo :)
    EventLoaded     = 'esx:playerLoaded',
    JobName         = "ambulance",
    UseSiringa = false, -- se attivato potrai usare la siringa quando sei a terra per rianimarti
    SiringaKey = 'G', -- tasto per autoressarsi quando sei atterrato, cliccando il tasto inserito ti ressi...
    TimeSiringa = 1,
    CanReviveKnockedPlayer = true,
    ReviveAllCommand = 'reviveall',
    ReviveCommand = 'revive',
    Permission = {
        'admin',
        'superadmin',
        'mod',
        'helper',
    },
    BandageItemName = "bandage",
    SiringaItemName = "siringa",
    RessItemName = 'medikit',
    AmbulanceJob = 'ems', -- default ambulance!
    ChiamaSoccorsiKey = 'G', -- non metterle uguali Chiamasoccorsi e respawn!
    RespawnKey = 'E',
    rprogressRGB = "rgba(0, 0, 255, 1.0)",
    RespawnCoords = vec3(296.426392, -581.274719, 43.147217),
    RemoveItemAfterRespawn = true,  -- quando quitta e rientra o respawna all'osp
}

Lang = {
    ["start_call"]                          = "Hai chiamato i soccorsi. Potrai rifarlo fra "..Morte.CallMediciWait.." minuti.",
    ["press_Call_and_respawn_temp1"]        = "Premi ~g~["..Morte.ChiamaSoccorsiKey.."]~w~ per chiamare i soccorsi,  \nPotrai respawnare tra %s secondi",
    ["press_E_to_respawn"]                  = "Premi ~r~["..Morte.RespawnKey.."]~w~ per Respawnare",
    -- ["bleedout"]                            = "Premi ~r~["..Morte.RespawnKey.."]~w~ per Respawnare",
    ["no_player_nearby"]                    = "Nessun player vicino",
    ["only_death"]                          = "Puoi usarlo solo da morto",
    ["text_knock"]                          = "Sei a terra",
    ['you_have_call']                       = "Hai giò chiamato i soccorsi, aspetta 5 minuti per fare un altra chiamata",
    ['revive_player']                       = "[~b~E~s~] Rianima",
    ['reviving']                            = 'Rianimando',
    ['you_need_item']                       = 'Non hai abbastanza '..Morte.RessItemName,
    ['use_siringa']                         = '[~b~'..Morte.SiringaKey..'~s~] per usare la siringa',
    ['using_siringa']                       = 'Usando siringa'
}

StartCall = function ()
    ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'nxn_chiamamedici',
		{
		  title = 'Richiesta soccorso'
		},
		function(data, menu)
            ESX.ShowNotification(Lang["start_call"])
            if Morte.GksPhone then
                local myPos = GetEntityCoords(PlayerPedId())
                local GPS = 'GPS: ' .. myPos.x .. ', ' .. myPos.y
                ESX.TriggerServerCallback('gksphone:namenumber', function(Races)
                    local name = Races[2].firstname .. ' ' .. Races[2].lastname
                    TriggerServerEvent('gksphone:gkcs:jbmessage', name, Races[1].phone_number, data.value, '', GPS, Morte.JobName)
                end)
            else
                TriggerEvent(Morte.TriggerPhone, {
                    coords = GetEntityCoords(GetPlayerPed(-1)),
                    job = Morte.JobName,
                    message = data.value,
                    display = "911"
                })
            end

            menu.close()
		end,
	function(data, menu)
		menu.close()
	end)
end