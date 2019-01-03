function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if _bannerShow then
			drawTxt(1.0, 1.0+0.42, 1.0,1.0,1.0, "| SERVER MAINTENANCE IN PROGRESS |", 255, 255, 0, 255)
		end
	end
end)

-- toggle banner --
RegisterNetEvent('testbanner')
AddEventHandler('testbanner',function() 
	if _bannerShow then
		_bannerShow = false
		drawNotification("SERVER TEST DISABLED")
	else
		_bannerShow = true
		drawNotification("SERVER TEST ENABLED")
	end
end)

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end