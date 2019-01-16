ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local selling = false
local success = false
local copscalled = false
local notintrested = false

RegisterNetEvent('drugs:trigger')
AddEventHandler('drugs:trigger', function()
selling = true
    if selling == true then
		TriggerEvent('pass_or_fail')
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 1)
		TriggerClientEvent("pNotify:SendNotification", source, {
	        text = "trying to convince person to buy the product",
	        type = "error",
	        queue = "lmao",
	        timeout = 2500,
	        layout = "Centerleft"
    	})
 	end
end)

RegisterServerEvent('fetchjob')
AddEventHandler('fetchjob', function()
    local xPlayer  = ESX.GetPlayerFromId(source)
    TriggerClientEvent('getjob', source, xPlayer.job.name)
end)


RegisterNetEvent('drugs:sell')
AddEventHandler('drugs:sell', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count
	local numBaggies = math.random (Config.SellNPCMin,Config.SellNPCMax)


	if coke >= 1 and success == true then
		if numBaggies > coke then
			numBaggies = coke
		end
		local cashMade = (numBaggies * Config.CokeSellNPC)
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You sold some " .. numBaggies .. " for $" .. cashMade ,
			type = "success",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		TriggerClientEvent("animation", source)
		xPlayer.removeInventoryItem('coke_pooch', numBaggies)
		xPlayer.addAccountMoney('black_money', cashMade)
		selling = false
	elseif weed >= 1 and success == true then
		if numBaggies > weed then
			numBaggies = weed
		end
		local cashMade = (numBaggies * Config.WeedSellNPC)
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You unloaded " .. numBaggies .. " weed for $" .. cashMade ,
			type = "success",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		TriggerClientEvent("animation", source)
		TriggerClientEvent("test", source)
		xPlayer.removeInventoryItem('weed_pooch', numBaggies)
		xPlayer.addAccountMoney('black_money', cashMade)
		selling = false
	elseif meth >= 1 and success == true then
		if numBaggies > meth then
			numBaggies = meth
		end
		local cashMade = (numBaggies * Config.MethSellNPC)
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You sold " .. numBaggies .. " Meth for $" .. cashMade ,
			type = "success",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		TriggerClientEvent("animation", source)
		xPlayer.removeInventoryItem('meth_pooch', numBaggies)
		xPlayer.addAccountMoney('black_money', cashMade)
		selling = false
	elseif opium >= 1 and success == true then
		if numBaggies > opium then
			numBaggies = opium
		end
		local cashMade = (numBaggies * Config.OpiumSellNPC)
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You have sold " .. numBaggies .. " baggies Opium for $" .. cashMade ,
			type = "success",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		TriggerClientEvent("animation", source)
		xPlayer.removeInventoryItem('opium_pooch', numBaggies)
		xPlayer.addAccountMoney('black_money', cashMade)
		selling = false
	elseif selling == true and success == false and notintrested == true then
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "They are not interested",
			type = "error",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
			selling = false
	elseif meth < 1 and coke < 1 and weed < 1 and opium < 1 then
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You dont have any drugs",
			type = "error",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
	elseif copscalled == true and success == false then
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "They are not interested",
			type = "error",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		TriggerClientEvent("notifyc", source)
		selling = false
	end
end)

RegisterNetEvent('pass_or_fail')
AddEventHandler('pass_or_fail', function()
	math.randomseed(GetGameTimer())
	local percent = math.random(1, 11)
	if percent == 7 or percent == 8 or percent == 9 then
		success = false
		notintrested = true
	elseif percent ~= 8 and percent ~= 9 and percent ~= 10 and percent ~= 7 then
		success = true
		notintrested = false
	else
		notintrested = false
		success = false
		copscalled = true
	end
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "You moved too far away",
		type = "error",
		progressBar = false,
		queue = "lmao",
		timeout = 2000,
		layout = "CenterLeft"
	})
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count

	if meth >= 1 or coke >= 1 or weed >= 1 or opium >= 1 then
		TriggerClientEvent("checkR", source, true)
	else
		TriggerClientEvent("checkR", source, false)
	end

end)
