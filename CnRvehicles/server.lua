local prices = {
{id = 0, price = 2600}, --compacts
{id = 1, price = 3000}, --sedans
{id = 2, price = 4200}, --SUV's
{id = 3, price = 5400}, --coupes
{id = 4, price = 4000}, --muscle
{id = 5, price = 5500}, --sport classic
{id = 6, price = 8200}, --sport
{id = 7, price = 10000}, --super
{id = 8, price = 1200}, --motorcycle
{id = 9, price = 2800}, --offroad
{id = 10, price = nil}, --industrial
{id = 11, price = nil}, --utility
{id = 12, price = 2400}, --vans
{id = 13, price = nil}, --bicycles
{id = 14, price = nil}, --boats
{id = 15, price = nil}, --helicopter
{id = 16, price = nil}, --plane
{id = 17, price = nil}, --service
{id = 18, price = nil}, --emergency
{id = 19, price = nil}, --military
{id = 20, price = nil} --commercial
}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


----------------------------------------------------------------------------------------------------


RegisterServerEvent("sellVehicle")
AddEventHandler("sellVehicle", function(vehPrice)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addAccountMoney('black_money', vehPrice)
	CancelEvent()
end)

RegisterServerEvent("getVehPrice")
AddEventHandler("getVehPrice", function(class)
	for k, price in pairs(prices) do
		if class == price.id then
			vehPrice = price.price
			TriggerClientEvent("setVehPrice", -1, vehPrice)
		end
	end
end)

--RegisterServerEvent("sellVehicle")
--AddEventHandler("sellVehicle", function(vehPrice)
--	TriggerEvent("es:getPlayerFromId", source, function(user)
--		user.addMoney(vehPrice)
--		CancelEvent()
--	end)
--end)

RegisterServerEvent("resetMoney")
AddEventHandler("resetMoney", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user.setMoney(0)
	end)
end)


