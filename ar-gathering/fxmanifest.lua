fx_version 'cerulean'
game 'gta5'

description 'A Simple Gathering Script for QBCore Framework created by Arthiis'
creator 'Arthiis'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'qb-core',
    'ox_lib',
    'ox_target',
    'ps-inventory'
}
