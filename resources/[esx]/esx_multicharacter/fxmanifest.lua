fx_version 'cerulean'
game 'gta5'
author 'ESX-Framework - Linden - KASH'
description 'Official Multicharacter System For ESX Legacy'
version '1.9.0'
lua54 'yes'

dependencies {'es_extended', 'esx_identity', 'esx_skin'}

shared_scripts {'@es_extended/imports.lua', 'config.lua', 'src/shared.lua'}

server_scripts {'@oxmysql/lib/MySQL.lua', 'src/server/*.lua'}

client_scripts {'src/client/*.lua'}

ui_page 'dist/index.html'

files {
    'dist/*.js',
    'dist/*.html',
    'dist/*.css'
}

export 'foto'