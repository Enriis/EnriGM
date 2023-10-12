fx_version 'cerulean'
game 'gta5'


ui_page 'html/ui.html'

shared_scripts {
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    '@ox_lib/init.lua',
}

server_script 'server/main.lua'

files {
    'html/ui.html',
    'html/ui.css',
    'html/ui.js',
    'html/icon.png',
    'html/*.otf',
}

lua54 'yes'

