fx_version 'cerulean'
game 'gta5'
author 'Enrii'
version '0.0'
lua54 'yes'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

export "GetJobs"

files {
    'json/*.json'
}