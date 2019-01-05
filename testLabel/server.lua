local showBanner = false

-- Toggle Test Banner
RegisterCommand('indev', function(source, args, raw)
	showBanner = not showBanner

	if showBanner then
		TriggerClientEvent('InDev:Start', -1)
	else
		TriggerClientEvent('InDev:Stop', -1)
	end

end, false)

-- Check InDev Status
RegisterServerEvent('InDev:Status')
AddEventHandler('InDev:Status', function()

	if showBanner then
		TriggerClientEvent('InDev:Start', source)
	end

end)