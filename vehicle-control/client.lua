-- C O N F I G --
interactionDistance = 3.5 --The radius you have to be in to interact with the vehicle.
lockDistance = 25 --The radius you have to be in to lock your vehicle.

--  V A R I A B L E S --
engineoff = false
saved = false
controlsave_bool = false


-- E N G I N E --
IsEngineOn = true
RegisterNetEvent('engine')
AddEventHandler('engine',function() 
	local player = GetPlayerPed(-1)
	
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
		else
			IsEngineOn = true
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

-- T R U N K --
RegisterNetEvent('trunk')
AddEventHandler('trunk',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,5,0,0)
				else
				SetVehicleDoorShut(vehicle,5,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)

-- T O G G L E  D O O R S --
RegisterNetEvent('doors')
AddEventHandler('doors',function(door) 
	local player = GetPlayerPed(-1)

	if controlsave_bool == true then
		vehicle = saveVehicle
	else
		vehicle = GetVehiclePedIsIn(player,true)
	end

	local isopen = 0
	if door ~= nil then
		isopen = GetVehicleDoorAngleRatio(vehicle,door)
	else
		isopen = GetVehicleDoorAngleRatio(vehicle,0) or GetVehicleDoorAngleRatio(vehicle,1) or GetVehicleDoorAngleRatio(vehicle,2) or GetVehicleDoorAngleRatio(vehicle,3)
	end

	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
	
	if distanceToVeh <= interactionDistance then
		if (isopen == 0) then
			if door ~= nil then
				SetVehicleDoorOpen(vehicle, door, 0, 0)
			else
				SetVehicleDoorOpen(vehicle,0,0,0)
				SetVehicleDoorOpen(vehicle,1,0,0)
				SetVehicleDoorOpen(vehicle,2,0,0)
				SetVehicleDoorOpen(vehicle,3,0,0)
			end
		else
			if door ~= nil then
				SetVehicleDoorShut(vehicle,door,0,0)
			else
				SetVehicleDoorsShut(vehicle,0)
			end
		end
	else
		ShowNotification("~r~You must be near your vehicle to do that.")
	end
end)		

-- H O O D --
RegisterNetEvent('hood')
AddEventHandler('hood',function() 
	local player = GetPlayerPed(-1)
    	if controlsave_bool == true then
			vehicle = saveVehicle
		else
			vehicle = GetVehiclePedIsIn(player,true)
		end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,4,0,0)
				else
				SetVehicleDoorShut(vehicle,4,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)

-- L O C K --
RegisterNetEvent('lockLights')
AddEventHandler('lockLights',function()
local vehicle = saveVehicle
	StartVehicleHorn(vehicle, 100, 1, false)
	SetVehicleLights(vehicle, 2)
	Wait (200)
	SetVehicleLights(vehicle, 0)
	StartVehicleHorn(vehicle, 100, 1, false)
	Wait (200)
	SetVehicleLights(vehicle, 2)
	Wait (400)
	SetVehicleLights(vehicle, 0)
end)

RegisterNetEvent('lock')
AddEventHandler('lock',function()
	local player = GetPlayerPed(-1)
    local vehicle = saveVehicle
	local islocked = GetVehicleDoorLockStatus(vehicle)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
		if DoesEntityExist(vehicle) then
			if distanceToVeh <= lockDistance then
				if (islocked == 1)then
				SetVehicleDoorsLocked(vehicle, 2)
				ShowNotification("You have locked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				else
				SetVehicleDoorsLocked(vehicle,1)
				ShowNotification("You have unlocked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
		else
			ShowNotification("~r~No saved vehicle.")
		end
	end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

-- S A V E --
RegisterNetEvent('save')
AddEventHandler('save',function() 
	local player = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(player)) then 
		if  saved == true then
			--remove from saved.
			saveVehicle = nil
			RemoveBlip(targetBlip)
			ShowNotification("Saved vehicle ~r~removed~w~.")
			saved = false
		else
			RemoveBlip(targetBlip)
			saveVehicle = GetVehiclePedIsIn(player,true)
			local vehicle = saveVehicle
			targetBlip = AddBlipForEntity(vehicle)
			SetBlipSprite(targetBlip,225)
			ShowNotification("This ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~ is now your~g~ saved ~w~vehicle.")
			saved = true
		end
	end
end)

-- R E M O T E --
RegisterNetEvent('controlsave')
AddEventHandler('controlsave',function() 
		if controlsave_bool == false then
			controlsave_bool = true
			if saveVehicle == nil then
			ShowNotification("~r~No saved vehicle.")
			else
			ShowNotification("You are no longer controlling your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		else
			controlsave_bool = false
			if saveVehicle == nil then
			ShowNotification("~r~No saved vehicle.")
			else
			ShowNotification("You are no longer controlling your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		end
end)

-- T O G G L E  W I N D O W S --
local windowup = true
RegisterNetEvent('rollwindow')
AddEventHandler('rollwindow', function(window)
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				if window ~= nil then
					RollDownWindow(playerCar, window)
				else
					RollDownWindows(playerCar)
				end
				--TriggerEvent('chatMessage', '', {255,0,0}, 'Windows down')
				windowup = false
			else
				if window ~= nil then
					RollUpWindow(playerCar, window)
				else
					RollUpWindow(playerCar, 0)
					RollUpWindow(playerCar, 1)
					RollUpWindow(playerCar, 2)
					RollUpWindow(playerCar, 3)
				end
				--TriggerEvent('chatMessage', '', {255,0,0}, 'Windows up')
				windowup = true
			end
		end
	end
end)

-- C O N V E R T I B L E   T O P --
local topup = true
RegisterNetEvent('ctop')
AddEventHandler('ctop', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( topup ) then
				LowerConvertibleRoof(playerCar, true, true)
				TriggerEvent('chatMessage', '', {255,0,0}, 'Top down')
				topup = false
			else
				RaiseConvertibleRoof(playerCar, true, true)
				TriggerEvent('chatMessage', '', {255,0,0}, 'Top up')
				topup = true
			end
		end
	end
end)

-- M Y P O S --
RegisterNetEvent('mypos')
AddEventHandler('mypos',function() 
	local ped = GetPlayerPed(-1)			
	local pos = GetEntityCoords(ped, true)
	local heading = GetEntityHeading(ped)
	TriggerEvent('chatMessage', '', {255,255,255}, 'Pos X: ' .. pos.x .. ' Pos Y: ' .. pos.y .. ' Pos Z: ' .. pos.z .. ' Heading: ' .. heading)
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/rw', 'Toggle Window(s) up/down', {{ name="window", help="No arguments = All Windows; 0 = Front Driver; 1 = Front Passenger; 2 = Rear Driver; 3 = Rear Passenger"}})
	TriggerEvent('chat:addSuggestion', '/doors', 'Toggle Door(s) open/closed', {{ name="doors", help="No arguments = All Doors; 0 = Front Driver; 1 = Front Passenger; 2 = Rear Driver; 3 = Rear Passenger"}})
end)