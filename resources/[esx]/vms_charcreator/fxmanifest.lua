

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'vames™️'
description 'vms_charcreator'
version '1.1.1'
shared_script 'config.lua'
client_scripts {
	'client/*.lua',
}
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua',
}
ui_page 'html/ui.html'
files {
	'html/*.*',
	'html/icons/*.svg',
	'html/parents/*.png',
	'translation.js'
}
escrow_ignore {
	'config.lua',
	'client/*.lua',
	'server/*.lua',
	'server/version_check.lua',
}
dependency '/assetpacks'