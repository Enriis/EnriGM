fx_version 'cerulean'
game 'gta5'
author 'ESX-Framework - Linden - KASH'
description 'Redesign by JGUsman#5140'
version '1.8.5'
lua54 'yes'

dependencies {'es_extended', 'esx_menu_default', 'esx_identity', 'esx_skin'}

shared_scripts {'@es_extended/imports.lua', '@es_extended/locale.lua', 'locales/*.lua', 'config.lua', '@ox_lib/init.lua'}

server_scripts {'@oxmysql/lib/MySQL.lua', 'server/*.lua'}

client_scripts {'client/*.lua'}

ui_page {'html/ui.html'}

files {'html/ui.html', 'html/css/main.css', 'html/js/app.js', 'html/locales/*.js'}
