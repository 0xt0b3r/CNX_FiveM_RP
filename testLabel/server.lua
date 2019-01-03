bannerShow = false
-- Toggle Test Banner --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/testbanner" then
		CancelEvent()
		--------------
		TriggerClientEvent('testbanner', -1)
	end
end)