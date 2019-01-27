RegisterServerEvent('syncIndicator')
AddEventHandler('syncIndicator', function(indicator)

    local playerid = source
    TriggerClientEvent('syncIndicator', -1, playerid, indicator)

end)