function indicator(indicator)
	local player = GetPlayerPed(-1)

	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)

		if indicator == 1 and GetVehicleIndicatorLights(vehicle) ~= 1 then	-- LEFT
			SetVehicleIndicatorLights(vehicle, 0, false)
			SetVehicleIndicatorLights(vehicle, 1, true)
		elseif indicator == 2 and GetVehicleIndicatorLights(vehicle) ~= 2 then	-- RIGHT
			SetVehicleIndicatorLights(vehicle, 0, true)
			SetVehicleIndicatorLights(vehicle, 1, false)
		elseif indicator == 3 and GetVehicleIndicatorLights(vehicle) ~= 3 then	-- HAZARDS
			SetVehicleIndicatorLights(vehicle, 0, true)
			SetVehicleIndicatorLights(vehicle, 1, true)
		else
			SetVehicleIndicatorLights(vehicle, 0, false)
			SetVehicleIndicatorLights(vehicle, 1, false)
		end

	end

end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustReleased(0, 174) and GetLastInputMethod(2) then -- LEFT
			indicator(1);
		end
		if IsControlJustReleased(0, 175) and GetLastInputMethod(2) then -- RIGHT
			indicator(2);
		end
		if IsControlJustReleased(0, 173) and GetLastInputMethod(2) then -- DOWN (HAZARDS)
			indicator(3);
		end
    end
end)