-- E N G I N E --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/engine off" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('engineoff', s)
-- 	elseif message == "/engine on" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('engineon', s)
-- 	elseif message == "/engine" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('engine', s)
-- 	end
-- end)

RegisterCommand('engine', function(source, args, raw)
	TriggerClientEvent('engine', source)
end, false)

-- T R U N K --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/trunk" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('trunk', s)
-- 	end
-- end)

RegisterCommand('trunk', function(source, args, raw)
	TriggerClientEvent('trunk', source)
end, false)

-- F R O N T  D O O R S --

RegisterCommand('doors', function(source, args, raw)
	TriggerClientEvent('doors', source)
end, false)

-- R E A R  D O O R S --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/rdoors" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('rdoors', s)
-- 	end
-- end)

RegisterCommand('doors', function(source, args, raw)
	if args ~= nil then
		TriggerClientEvent('doors', source, args[1])
	else
		TriggerClientEvent('doors', source)
	end
end, false)

-- H O O D --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/hood" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('hood', s)
-- 	end
-- end)

RegisterCommand('hood', function(source, args, raw)
	TriggerClientEvent('hood', source)
end, false)

-- L O C K --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/lock" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('lock', s)
-- 	end
-- end)

RegisterCommand('lock', function(source, args, raw)
	TriggerClientEvent('lock', source)
end, false)

-- S A V E --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/save" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('save', s)
-- 	end
-- end)

RegisterCommand('save', function(source, args, raw)
	TriggerClientEvent('save', source)
end, false)

-- R E M O T E --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/sveh" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('controlsave', s)
-- 	end
-- end)

RegisterCommand('sveh', function(source, args, raw)
	TriggerClientEvent('controlsave', source)
end, false)

-- R O L L W I N D O W --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/rw" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent("rollwindow", s)
-- 	end
	
-- end)

RegisterCommand('rw', function(source, args, raw)
	if args ~= nil then
		TriggerClientEvent('rollwindow', source, args[1])
	else
		TriggerClientEvent('rollwindow', source)
	end
end, false)

-- C O N V E R T I B L E   T O P --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/ctop" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent("ctop", s)
-- 	end
	
-- end)

RegisterCommand('ctop', function(source, args, raw)
	TriggerClientEvent('ctop', source)
end, false)

-- M Y P O S --
-- AddEventHandler('chatMessage', function(s, n, m)
-- 	local message = string.lower(m)
-- 	if message == "/mypos" then
-- 		CancelEvent()
-- 		--------------
-- 		TriggerClientEvent('mypos', s)
-- 	end
-- end)

RegisterCommand('mypos', function(source, args, raw)
	TriggerClientEvent('mypos', source)
end, false)