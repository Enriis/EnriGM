fx_version "adamant"
game "gta5"

author "Lucifer#3333"
description "https://github.com/5mLucifer/Video-Code"

shared_script '@es_extended/imports.lua'

client_scripts {"client/cl_nui.lua"}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "client/sv_nui.lua"
}

ui_page {
    "html/index.html"
}

files {
    "html/*.*"
}