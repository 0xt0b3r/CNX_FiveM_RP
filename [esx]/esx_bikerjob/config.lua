Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer		= false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.BikerStations = {

	Biker = {

		Blip = {
			Pos     = { x = 986.57257080078, y = -145.18644714355, z = 30.711 },
	    	Sprite  = 492, -- radar_biker_clubhouse -- Reference: https://docs.fivem.net/game-references/blips/
	    	Display = 4,
	    	Scale   = 1.2,
	    	Colour  = 25 -- Green -- Reference: https://wiki.gtanet.work/index.php?title=Blips
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL50',			price = 9000 },
			{ name = 'WEAPON_ASSAULTRIFLE',		price = 30000 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',	price = 1125000 },
			{ name = 'WEAPON_MOLOTOV',     		price = 1500000 },
			{ name = 'WEAPON_BAT',      		price = 600000 },
		-- 	{ name = 'WEAPON_STUNGUN',          price = 50000 },
		-- 	{ name = 'WEAPON_FLASHLIGHT',       price = 800 },
		-- 	{ name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
		-- 	{ name = 'WEAPON_FLAREGUN',         price = 6000 },
		-- 	{ name = 'GADGET_PARACHUTE',        price = 3000 },
		-- 	{ name = 'WEAPON_STICKYBOMB',       price = 200000 },
		-- 	{ name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
		-- 	{ name = 'WEAPON_FIREWORK',         price = 30000 },
		-- 	{ name = 'WEAPON_GRENADE',          price = 180000 },
		-- 	{ name = 'WEAPON_BZGAS',            price = 120000 },
		-- 	{ name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
		-- 	{ name = 'WEAPON_APPISTOL',         price = 70000 },
		-- 	{ name = 'WEAPON_CARBINERIFLE',     price = 1100000 },
		-- 	{ name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
		-- 	{ name = 'WEAPON_MINIGUN',          price = 700000 },
		-- 	{ name = 'WEAPON_RAILGUN',          price = 2500000 }
		},

		Cloakrooms = {
			{ x = 985.46, y = -92.01, z = 73.85 }
		},

		Armories = {
			{ x = 977.09, y = -104.15, z = 73.85 }
		},

		Vehicles = {
			{
				Spawner    = { x = 969.79, y = -113.97, z = 73.35 },
				SpawnPoints = { 
					{ x = 967.47393798828, y = -125.96086120605, z = 73.354141235352, heading = 151.298, radius = 6.0 }
				}
			}
		},

		--Helicopters = {
		--	{
		--		Spawner    = { x = 466.477, y = -982.819, z = 42.691 },
		--		SpawnPoint = { x = 450.04, y = -981.14, z = 42.691 },
		--		Heading    = 0.0
		--	}
		--},

		VehicleDeleters = {
			{ x = 954.15002441406, y = -133.45330810547, z = 73.452224731445 }
		},

		BossActions = {
			{ x = 974.95, y = -100.74, z = 73.87 }
		},

	},

}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {
		{
			model = 'gburrito2',
			label = 'Lost MC Van'
		},
		{
			model = 'avarus',
			label = 'Avarus'
		},
		{
			model = 'sanctus',
			label = 'Sanctus'
		},
		{
			model = 'guardian',
			label = 'Guardian'
		}
	},

	prospect = {

	},

	member = {
	
	},

	enforcer = {
		
	},

	boss = {

	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	prospect = {
		--male = {
		--	['tshirt_1'] = 59,  ['tshirt_2'] = 1,
		--	['torso_1'] = 55,   ['torso_2'] = 0,
		--	['decals_1'] = 0,   ['decals_2'] = 0,
		--	['arms'] = 41,
		--	['pants_1'] = 25,   ['pants_2'] = 0,
		--	['shoes_1'] = 25,   ['shoes_2'] = 0,
		--	['helmet_1'] = 46,  ['helmet_2'] = 0,
		--	['chain_1'] = 0,    ['chain_2'] = 0,
		--	['ears_1'] = 2,     ['ears_2'] = 0
		--},
		--female = {
		--	['tshirt_1'] = 36,  ['tshirt_2'] = 1,
		--	['torso_1'] = 48,   ['torso_2'] = 0,
		--	['decals_1'] = 0,   ['decals_2'] = 0,
		--	['arms'] = 44,
		--	['pants_1'] = 34,   ['pants_2'] = 0,
		--	['shoes_1'] = 27,   ['shoes_2'] = 0,
		--	['helmet_1'] = 45,  ['helmet_2'] = 0,
		--	['chain_1'] = 0,    ['chain_2'] = 0,
		--	['ears_1'] = 2,     ['ears_2'] = 0
		--}
	},
	member = {
		
	},
	enforcer = {
		
	},
	boss = {
		
	}

}