Config = {}
-- For more info check https://codem.gitbook.io/codem-documentation/

Config.Theme = 'blvck' --  sky, blvck, cherry, kush, mango, proxima
Config.Logo = 'https://media.discordapp.net/attachments/1033291709049733170/1037914761456799754/DD.png?ex=653b1ef2&is=6528a9f2&hm=2080bd10ff8d48246472ce629656d0b073a11c5b89132d00650ced0eaef2e0bc&=&width=449&height=449' -- Default or URL link
Config.BackgroundImage = 'background.png' -- default or custom image/video
-- Backgrounds can be found in html/assets/background/
-- Config.BackgroundImage = 'background.png'



-- To display on left menu (must be an image)
-- Supports max 2 images
Config.AlbumsThumbnail = {
    {
        source = 'https://i.imgur.com/5v9y4AD.png', -- Must be a link
    },
    {
        source = 'https://i.imgur.com/5v9y4AD.png', -- Must be a link
    }
}

Config.Albums = {
    {
        source = 'https://i.imgur.com/5v9y4AD.png', -- Must be a link
    },
    {
        source = 'EjaorVlUcn0'  -- Must be a link
    }
}


Config.EnableHintMessages = true
Config.HintMessages = {
    {
        text= 'Sosyalleşmek için şehirin belirli yerlerinde takılabilirsin. Motel, Tequila, Hastane vb. yerlerde oyuncu bulma olasılığın çok yüksek!',
        time= 8000,
    },
    {
        text= 'Oyuna giriş yapan her oyuncu kuralları okumuş sayılır.',
        time= 3000,
    },
    {

        text= 'Zarar karşılama için açılan ticketlarda video kaydınızın bulunması zorunludur',
        time= 1000,
    }
}

Config.PlayMusicByDefault = false -- if true plays the music when loading screen is active

Config.ButtonLinks = {
    -- ["twitter"] = 'https://twitter.com',
    ["instagram"] = 'https://www.instagram.com/qroleplay0',
    -- ["reddit"] = 'https://www.reddit.com/',
    ["discord"] = 'https://discord.gg/qrp',
}

Config.ServerName = 'Q ROLEPLAY'

Config.Language = {
    ["WELCOME"] = 'WELCOME TO',
    ["INSIDE_CITY"] = 'Sunucudan Kareler',
    ["FOOTAGES"] = 'Sunucudan Son Görüntüler',
    ["PATCH_NOTES"] = 'Güncelleme Notları',
    ["PATCH_NOTES_VERSION"] = 'Güncelleme Notları V1.0',
    ["LATEST_UPDATES"] = 'Son güncellemeler...',
    ["FOLLOW_CITY"] = 'Sosyal medyada bizi takip edin.',


    ["CITY_LOADING"] = 'Lütfen bekleyin, sunucu yükleniyor...',
    ["SETTINGS"] = 'Ayarlar',
    ["ENABLE_MUSIC"] = 'Müziği aç/kapa',
    ["SHOW_MENU"] = 'Sol menüyü göster',
    ["SHOW_HINT"] = 'İpucu göster',
    ["SHOW_ALL"] = 'Bütün arayüzü göster',



    ["KEYBINDS_INFO"] = 'Bir tuşun işlevini görmek için o tuşun üstüne tıklayınız',
    ["KEYBINDS_INFO_2"] = 'Bazı tuş atamaları oyun ayarlarından değiştirilebilir,',
    ["GO_TO"] = 'değiştirmek için',
    ["FIVEM_SETTINGS"] = 'ESC>Settings>Keybindings>FiveM',
    ["PRESS"] = 'Tıkla',
    ["DOUBLE_PRESS"] = 'Çift Tıkla',
    ["COMBINATIONS"] = 'Kombinasyonlar',
    ["KEYBINDS_INFO_3"] = 'Bir tuşun atamasını görmek için üstüne tıklayın.',
    ["KEYBINDS_INFO_4"] = 'Bu tuş atamalarının komutların kısayolları olduğunu unutmayın. Daha oyun içinde ataması olmayan birçok komut bulunmakta.',

    ["COMMANDS"] = 'Komutlar',
    ["SHOW_ALL"] = 'Bütün komutları göster',
    ["SELECT_COMMAND"] = 'Lütfen bir komut seçiniz',
    ["DISPLAY_BINDING"] = 'atamayı göster',
    ["COMMANDS_INFO"] = 'Bir komutun fonksiyonunu görmek için komutun üstüne tıklayın',
    ["HINT"] = 'İpucu',

}

Config.PatchNotes = {
    "Motel sistemi değiştirildi",
    "Legal mesleklerin 2 ve 3. seviyesinde fiyat değişikliğine gidildi.",
    "Birkaç araç galeriden kaldırıldı",
    "Polisler için elektronik kelepçe eklendi.",
}

Config.Keybinds = {
    ["ESC"] = false,
    ["F1"] = {
        ["pressInfo"] = 'Telefonu açar',
        ["doublePressInfo"] = false,
    },
    ["F2"] = {
        ["pressInfo"] = 'Envanteri açar',
    },
    ["F3"] = false,
    ["F4"] = false,
    ["F5"] = false,
    ["F6"] = {
        ["pressInfo"] = 'Meslek menülerini açar',
    },
    ["F7"] = {
        ["pressInfo"] = 'Animasyon menülerini açar',
    },
    ["F8"] = false,
    ["F9"] = {
        ["pressInfo"] = 'Telsiz menüsünü açar',
    },
    ["F10"] = false,
    ["F11"] = {
        ["pressInfo"] = 'Konuşma ayarını değiştirir.',
    },
    ["F12"] = false,
    ["“"] = {
        ["pressInfo"] = 'Polis dispatch menüsünü açar',
    },
    ["1"] = {
        ["pressInfo"] = 'Envanter Kısayolu',
    },
    ["2"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["3"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["4"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["5"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["6"] = {
        ["pressInfo"] = 'Envanter Kısayolu',
    },
    ["7"] = false,
    ["8"] = false,
    ["9"] = false,
    ["0"] = false,
    ["-"] = false,
    ["+"] = false,
    ["BACKSPACE"] = false,
    ["TAB"] = {
        ["pressInfo"] = 'Envanter kısayollarını gösterir',
    },
    ["Q"] = false,
    ["W"] = false,
    ["E"] = false,
    ["R"] = false,
    ["T"] = {
        ["pressInfo"] = 'Chati açar',
    },
    ["Y"] = false,
    ["U"] = {
        ["pressInfo"] = 'Aracı kilitler',
    },
    ["I"] = false,
    ["O"] = false,
    ["P"] = false,
    ["["] = false,
    ["]"] = false,
    ["ENTER"] = {
        ["pressInfo"] = 'Chati açar',
    },
    ["CAPS"] = false,
    ["A"] = false,
    ["S"] = false,
    ["D"] = false,
    ["F"] = false,
    ["G"] = {
        ["pressInfo"] = 'Ellerini kaldıran şahsın üstünü arar.',
    },
    ["H"] = false,
    ["J"] = false,
    ["K"] = false,
    ["L"] = false,
    [";"] =  false,
    ["@"] =  false,
    ["LSHIFT"] =  {
        ["pressInfo"] = 'Run',
        ["doublePressInfo"] = false,
        ["combinations"] = {
            {
                ["key"] = 'E',
                ["info"] = 'Çelme takar',
            },
            {
                ["key"] = 'E',
                ["info"] = 'Aracı iter',
            },
            
        },
    },
    ["Z"] =  false,
    ["X"] =  false,
    ["C"] =  false,
    ["V"] =  false,
    ["B"] =  false,
    ["N"] =  false,
    ["M"] =  false,
    ["<"] =  false,
    [">"] =  false,
    ["?"] =  false,
    ["RSHIFT"] =  false,
    ["LCTRL"] =  false,
    ["ALT"] =  false,
    ["SPACE"] = false,
    ["ALTGR"] = false,
    ["RCTRL"] = false,
}
-- add only 2 commands here
Config.PreviewCommands = {
    ["hud"]= 'HUD ayarlarını açar',
    ["gfix"]= 'Galeride takılı kaldığınızda galeriden çıkmanızı sağlar',
}

Config.Commands = {
    ["hud"]= 'HUD ayarlarını açar',
    ["gfix"]= 'Galeride takılı kaldığınızda galeriden çıkmanızı sağlar',
    ["e"]= 'İstediğiniz animasyonu yapmanızı sağlar',
    ["mdt"]= 'MDTyi açar',
}



