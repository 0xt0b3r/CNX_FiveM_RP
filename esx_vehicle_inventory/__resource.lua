resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'ESX truck inventory'

version '1.0.0'

server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  'config.lua',
  'client/main.lua'
}
