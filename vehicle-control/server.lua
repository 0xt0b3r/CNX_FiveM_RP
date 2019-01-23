-- E N G I N E --
RegisterCommand('engine', function(source, args, raw)
	TriggerClientEvent('engine', source)
end, false)

-- T R U N K --
RegisterCommand('trunk', function(source, args, raw)
	TriggerClientEvent('trunk', source)
end, false)

-- D O O R S --
RegisterCommand('doors', function(source, args, raw)
	if args ~= nil then
		TriggerClientEvent('doors', source, tonumber(args[1]))
	else
		TriggerClientEvent('doors', source)
	end
end, false)

-- H O O D --
RegisterCommand('hood', function(source, args, raw)
	TriggerClientEvent('hood', source)
end, false)

-- L O C K --
RegisterCommand('lock', function(source, args, raw)
	TriggerClientEvent('lock', source)
end, false)

-- S A V E --
RegisterCommand('save', function(source, args, raw)
	TriggerClientEvent('save', source)
end, false)

-- R E M O T E --
RegisterCommand('sveh', function(source, args, raw)
	TriggerClientEvent('controlsave', source)
end, false)

-- R O L L W I N D O W --
RegisterCommand('rw', function(source, args, raw)
	if args ~= nil then
		TriggerClientEvent('rollwindow', source, tonumber(args[1]))
	else
		TriggerClientEvent('rollwindow', source)
	end
end, false)

-- C O N V E R T I B L E   T O P --
RegisterCommand('ctop', function(source, args, raw)
	TriggerClientEvent('ctop', source)
end, false)

-- M Y P O S --
RegisterCommand('mypos', function(source, args, raw)
	TriggerClientEvent('mypos', source)
end, false)