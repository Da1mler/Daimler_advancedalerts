fx_version 'cerulean'
game { 'gta5' }

author 'Daimler Development'
description 'Advanced Alerts (join, hunger and thirst)'
version '1.0'

discord 'discord.gg/daimler' -- or https://discord.gg/8vWKFrVHhd

lua54 'yes'

client_scripts{ 
  "client.lua",
}

shared_scripts {
  '@ox_lib/init.lua',
}

dependency {
  'ox_lib'
}
