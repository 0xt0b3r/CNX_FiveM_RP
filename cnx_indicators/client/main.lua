RegisterNetEvent('syncIndicator')
AddEventHandler('syncIndicator', function(playerId, indicator)
	if GetPlayerFromServerId(playerId) ~= PlayerId() then
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(playerId)), false)
		if indicator == 0 then
			SetVehicleIndicatorLights(vehicle, 0, false)
			SetVehicleIndicatorLights(vehicle, 1, false)
		elseif indicator == 1 then
			SetVehicleIndicatorLights(vehicle, 0, false)
			SetVehicleIndicatorLights(vehicle, 1, true)
		elseif indicator == 2 then
			SetVehicleIndicatorLights(vehicle, 0, true)
			SetVehicleIndicatorLights(vehicle, 1, false)
		elseif indicator == 3 then
			SetVehicleIndicatorLights(vehicle, 0, true)
			SetVehicleIndicatorLights(vehicle, 1, true)
		end
	end
end)

RegisterNetEvent('setIndicator')
AddEventHandler('setIndicator', function(indicator)

	local player = GetPlayerPed(-1)

	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)

		if indicator == 1 and GetVehicleIndicatorLights(vehicle) ~= 1 then		-- LEFT
			SetVehicleIndicatorLights(vehicle, 0, false)
			SetVehicleIndicatorLights(vehicle, 1, true)
		elseif indicator == 2 and GetVehicleIndicatorLights(vehicle) ~= 2 then	-- RIGHT
			SetVehicleIndicatorLights(vehicle, 0, true)
			SetVehicleIndicatorLights(vehicle, 1, false)
		elseif indicator == 3 and GetVehicleIndicatorLights(vehicle) ~= 3 then	-- HAZARDS
			SetVehicleIndicatorLights(vehicle, 0, true)
			SetVehicleIndicatorLights(vehicle, 1, true)
		else 																	-- OFF
			SetVehicleIndicatorLights(vehicle, 0, false)
			SetVehicleIndicatorLights(vehicle, 1, false)
		end

	end

end)

-- RegisterNetEvent('setHazards')
-- AddEventHandler('setHazards', function()

-- 	local player = GetPlayerPed(-1)

-- 	if (IsPedSittingInAnyVehicle(player)) then 
-- 		local vehicle = GetVehiclePedIsIn(player,false)

-- 		if GetVehicleIndicatorLights(vehicle) ~= 3 then
-- 			TriggerEvent('setIndicator', 3)
-- 			TriggerServerEvent('syncIndicator', 3)
-- 		else
-- 			TriggerEvent('setIndicator', 0)
-- 			TriggerServerEvent('syncIndicator', 0)
-- 		end
-- 	end

-- end)

local heading = 0.0
local timer = 0

Citizen.CreateThread(function()
    while true do
		
		if (IsPedSittingInAnyVehicle(GetPlayerPed(-1))) then 

			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			
			if vehicle ~= nil and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) then

				if IsControlJustReleased(0, 174) and GetLastInputMethod(2) then -- LEFT
					TriggerEvent('setIndicator', 1)
					TriggerServerEvent('syncIndicator', 1)
					timer = 0
					heading = GetEntityHeading(vehicle)
				elseif IsControlJustReleased(0, 175) and GetLastInputMethod(2) then -- RIGHT
					TriggerEvent('setIndicator', 2)
					TriggerServerEvent('syncIndicator', 2)
					timer = 0
					heading = GetEntityHeading(vehicle)
				elseif IsControlJustReleased(0, 173) and GetLastInputMethod(2) then -- DOWN (HAZARDS)
					TriggerEvent('setIndicator', 3)
					TriggerServerEvent('syncIndicator', 3)
				end

				if timer == 0 then
					if GetVehicleIndicatorLights(vehicle) ~= 0 then
						local newHeading = GetEntityHeading(vehicle)
						if math.abs(newHeading - heading) > 60.0 then
							timer = GetGameTimer() + 1500
						end
					end
				else
					if GetGameTimer() >= timer and GetVehicleIndicatorLights(vehicle) ~= 3 and (GetVehicleIndicatorLights(vehicle) == 1 or GetVehicleIndicatorLights(vehicle) == 2) then
						TriggerEvent('setIndicator', 0)
						TriggerServerEvent('syncIndicator', 0)
					end
				end

			end

			if vehicle ~= nil and vehicle ~= false and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) and IsVehicleEngineOn(vehicle) then
				if (GetEntitySpeed(vehicle) * 2.236936) < 2 and not IsControlPressed(1, 32) then
					SetVehicleBrakeLights(vehicle, true)
				end
			end

			for playerIds = 0,31 do
				if NetworkIsPlayerActive(playerIds) then
					local networkPed = GetPlayerPed(GetPlayerFromServerId(playerIds))
					local networkVehicle = GetVehiclePedIsIn(networkPed, false)

					if networkVehicle ~= nil and networkVehicle ~= false and GetPlayerFromServerId(playerIds) ~= PlayerId() and GetPedInVehicleSeat(networkVehicle, -1) == networkPed and IsVehicleEngineOn(networkVehicle) then
						if (GetEntitySpeed(networkVehicle) * 2.236936) < 2 then
							SetVehicleBrakeLights(networkVehicle, true)
						end
					end
				end
			end
		end

		Citizen.Wait(0)
    end
end)