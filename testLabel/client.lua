local cancelBanner = false

-- Check for resource load
AddEventHandler('onClientResourceStart', function(resource) 

    if GetCurrentResourceName() == resource then
        TriggerServerEvent('InDev:Status')
    end

end)

-- Start Drawing Banner
RegisterNetEvent('InDev:Start')
AddEventHandler('InDev:Start', function()
    while true do
        drawTxt(1.0, 1.0+0.42, 1.0,1.0,1.0, "| SERVER MAINTENANCE IN PROGRESS |", 255, 255, 0, 255)
        
        if cancelBanner then
            cancelBanner = false
            return
        end

        Citizen.Wait(0)
    end
end)

-- Stop Drawing Banner
RegisterNetEvent('InDev:Stop')
AddEventHandler('InDev:Stop', function()

    cancelBanner = true

end)

-- Draw Banner
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