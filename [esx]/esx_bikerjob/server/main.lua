ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'biker', Config.MaxInService)
end

--TriggerEvent('esx_phone:registerNumber', 'biker', _U('alert_biker'), true, true)
TriggerEvent('esx_society:registerSociety', 'biker', 'Biker', 'society_biker', 'society_biker', 'society_biker', {type = 'public'})

RegisterServerEvent('esx_biker:giveWeapon')
AddEventHandler('esx_biker:giveWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'biker' then
		xPlayer.addWeapon(weapon, ammo)
	else
		print(('esx_biker: %s attempted to give weapon!'):format(xPlayer.identifier))
	end
end)

--RegisterServerEvent('esx_biker:confiscatePlayerItem')
--AddEventHandler('esx_biker:confiscatePlayerItem', function(target, itemType, itemName, amount)
--	local _source = source
--	local sourceXPlayer = ESX.GetPlayerFromId(_source)
--	local targetXPlayer = ESX.GetPlayerFromId(target)
--
--	if sourceXPlayer.job.name ~= 'biker' then
--		print(('esx_biker: %s attempted to confiscate!'):format(xPlayer.identifier))
--		return
--	end
--
--	if itemType == 'item_standard' then
--		local targetItem = targetXPlayer.getInventoryItem(itemName)
--		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
--
--		-- does the target player have enough in their inventory?
--		if targetItem.count > 0 and targetItem.count <= amount then
--
--			-- can the player carry the said amount of x item?
--			if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
--				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
--			else
--				targetXPlayer.removeInventoryItem(itemName, amount)
--				sourceXPlayer.addInventoryItem   (itemName, amount)
--				TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
--				TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
--			end
--		else
--			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
--		end
--
--	elseif itemType == 'item_account' then
--		targetXPlayer.removeAccountMoney(itemName, amount)
--		sourceXPlayer.addAccountMoney   (itemName, amount)
--
--		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
--		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, sourceXPlayer.name))
--
--	elseif itemType == 'item_weapon' then
--		if amount == nil then amount = 0 end
--		targetXPlayer.removeWeapon(itemName, amount)
--		sourceXPlayer.addWeapon   (itemName, amount)
--
--		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
--		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
--	end
--end)

--RegisterServerEvent('esx_biker:handcuff')
--AddEventHandler('esx_biker:handcuff', function(target)
--	local xPlayer = ESX.GetPlayerFromId(source)
--
--	if xPlayer.job.name == 'biker' then
--		TriggerClientEvent('esx_biker:handcuff', target)
--	else
--		print(('esx_biker: %s attempted to handcuff a player (not cop)!'):format(xPlayer.identifier))
--	end
--end)

--RegisterServerEvent('esx_biker:drag')
--AddEventHandler('esx_biker:drag', function(target)
--	local xPlayer = ESX.GetPlayerFromId(source)
--
--	if xPlayer.job.name == 'biker' then
--		TriggerClientEvent('esx_biker:drag', target, source)
--	else
--		print(('esx_biker: %s attempted to drag (not cop)!'):format(xPlayer.identifier))
--	end
--end)

--RegisterServerEvent('esx_biker:putInVehicle')
--AddEventHandler('esx_biker:putInVehicle', function(target)
--	local xPlayer = ESX.GetPlayerFromId(source)
--
--	if xPlayer.job.name == 'biker' then
--		TriggerClientEvent('esx_biker:putInVehicle', target)
--	else
--		print(('esx_biker: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
--	end
--end)

--RegisterServerEvent('esx_biker:OutVehicle')
--AddEventHandler('esx_biker:OutVehicle', function(target)
--	local xPlayer = ESX.GetPlayerFromId(source)
--
--	if xPlayer.job.name == 'biker' then
--		TriggerClientEvent('esx_biker:OutVehicle', target)
--	else
--		print(('esx_biker: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
--	end
--end)

RegisterServerEvent('esx_biker:getStockItem')
AddEventHandler('esx_biker:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)

end)

RegisterServerEvent('esx_biker:putStockItems')
AddEventHandler('esx_biker:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

	end)

end)

--ESX.RegisterServerCallback('esx_biker:getOtherPlayerData', function(source, cb, target)
--
--	if Config.EnableESXIdentity then
--
--		local xPlayer = ESX.GetPlayerFromId(target)
--
--		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
--			['@identifier'] = xPlayer.identifier
--		})
--
--		local firstname = result[1].firstname
--		local lastname  = result[1].lastname
--		local sex       = result[1].sex
--		local dob       = result[1].dateofbirth
--		local height    = result[1].height
--
--		local data = {
--			name      = GetPlayerName(target),
--			job       = xPlayer.job,
--			inventory = xPlayer.inventory,
--			accounts  = xPlayer.accounts,
--			weapons   = xPlayer.loadout,
--			firstname = firstname,
--			lastname  = lastname,
--			sex       = sex,
--			dob       = dob,
--			height    = height
--		}
--
--		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
--			if status ~= nil then
--				data.drunk = math.floor(status.percent)
--			end
--		end)
--
--		if Config.EnableLicenses then
--			TriggerEvent('esx_license:getLicenses', target, function(licenses)
--				data.licenses = licenses
--				cb(data)
--			end)
--		else
--			cb(data)
--		end
--
--	else
--
--		local xPlayer = ESX.GetPlayerFromId(target)
--
--		local data = {
--			name       = GetPlayerName(target),
--			job        = xPlayer.job,
--			inventory  = xPlayer.inventory,
--			accounts   = xPlayer.accounts,
--			weapons    = xPlayer.loadout
--		}
--
--		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
--			if status ~= nil then
--				data.drunk = math.floor(status.percent)
--			end
--		end)
--
--		TriggerEvent('esx_license:getLicenses', target, function(licenses)
--			data.licenses = licenses
--		end)
--
--		cb(data)
--
--	end
--
--end)

--ESX.RegisterServerCallback('esx_biker:getFineList', function(source, cb, category)
--	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
--		['@category'] = category
--	}, function(fines)
--		cb(fines)
--	end)
--end)

-- ESX.RegisterServerCallback('esx_biker:getVehicleInfos', function(source, cb, plate)

-- 	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
-- 		['@plate'] = plate
-- 	}, function(result)

-- 		local retrivedInfo = {
-- 			plate = plate
-- 		}

-- 		if result[1] then

-- 			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
-- 				['@identifier'] = result[1].owner
-- 			}, function(result2)

-- 				if Config.EnableESXIdentity then
-- 					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
-- 				else
-- 					retrivedInfo.owner = result2[1].name
-- 				end

-- 				cb(retrivedInfo)
-- 			end)
-- 		else
-- 			cb(retrivedInfo)
-- 		end
-- 	end)
-- end)

-- ESX.RegisterServerCallback('esx_biker:getVehicleFromPlate', function(source, cb, plate)
-- 	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
-- 		['@plate'] = plate
-- 	}, function(result)
-- 		if result[1] ~= nil then

-- 			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
-- 				['@identifier'] = result[1].owner
-- 			}, function(result2)

-- 				if Config.EnableESXIdentity then
-- 					cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
-- 				else
-- 					cb(result2[1].name, true)
-- 				end

-- 			end)
-- 		else
-- 			cb(_U('unknown'), false)
-- 		end
-- 	end)
-- end)

ESX.RegisterServerCallback('esx_biker:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_biker', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)

end)

ESX.RegisterServerCallback('esx_biker:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)

	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_biker', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)

end)

ESX.RegisterServerCallback('esx_biker:removeArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, 500)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_biker', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)

end)


ESX.RegisterServerCallback('esx_biker:buy', function(source, cb, amount)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_biker', function(account)
		if account.money >= amount then
			account.removeMoney(amount)
			cb(true)
		else
			cb(false)
		end
	end)

end)

ESX.RegisterServerCallback('esx_biker:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_biker:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local _source = source
	
	-- Did the player ever join?
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)
		
		-- Is it worth telling all clients to refresh?
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'biker' then
			Citizen.Wait(5000)
			TriggerClientEvent('esx_biker:updateBlip', -1)
		end
	end	
end)

RegisterServerEvent('esx_biker:spawned')
AddEventHandler('esx_biker:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'biker' then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_biker:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_biker:forceBlip')
AddEventHandler('esx_biker:forceBlip', function()
	TriggerClientEvent('esx_biker:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_biker:updateBlip', -1)
	end
end)

-- AddEventHandler('onResourceStop', function(resource)
-- 	if resource == GetCurrentResourceName() then
-- 		TriggerEvent('esx_phone:removeNumber', 'biker')
-- 	end
-- end)

-- RegisterServerEvent('esx_biker:message')
-- AddEventHandler('esx_biker:message', function(target, msg)
-- 	TriggerClientEvent('esx:showNotification', target, msg)
-- end)