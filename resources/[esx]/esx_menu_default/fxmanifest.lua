resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script '@ox_lib/init.lua'
shared_script '@es_extended/imports.lua'

client_scripts {
	--'@qb-core/client/wrapper.lua',
	'client/main.lua'
}


ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/js/mustache.min.js',
	'html/js/app.js',
	'html/js/TweenMax.min.js',
	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf',
	'html/swipe.ogg',
	'html/select.ogg'
}

