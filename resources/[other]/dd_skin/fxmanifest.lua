fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'Enrii#6627'

shared_script '@ox_lib/init.lua'
shared_script '@es_extended/imports.lua'

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'config.lua',
  'server.lua',
  'commands/server.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'typescript/client.js',
  'config.lua',
  'client.lua',
  'commands/client.lua'

}

files {
  'typescript/ui/index.html',
  'typescript/ui/static/js/*.js',
  'locales/*.json',
  'peds.json'
}

provides {
  'skinchanger',
  'esx_skin'
}

ui_page 'typescript/ui/index.html'
