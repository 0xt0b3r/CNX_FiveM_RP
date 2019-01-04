-- Toggle Test Banner --
AddEventHandler('chatMessage', function(s, n, msg)
    local args = stringsplit(msg, ' ')

    if string.lower(args[1]) == "/fwr" then
        CancelEvent()
        --------------
        TriggerClientEvent('fwr', -1)
    elseif string.lower(args[1]) == "/fw" then
        if args[2] ~= nil and args[3] ~= nil then
            CancelEvent()
            --------------
            TriggerClientEvent('fw', args[2], args[3], -1)
        else
            print "must provide valid arguments dict and asset"
        end
    end

end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end