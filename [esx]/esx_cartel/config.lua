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

Config.CartelStations = {

	Cartel = {

		Blip = {
			Pos     = { x = 1172.7686767575, y = 2636.0771484375, z = 36.78857421875},
	    	Sprite  = 492, -- radar_biker_clubhouse -- Reference: https://docs.fivem.net/game-references/blips/
	    	Display = 4,
	    	Scale   = 1.2,
	    	Colour  = 50 -- Purple -- Reference: https://wiki.gtanet.work/index.php?title=Blips
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_SAWNOFFSHOTGUN',	price = 9000 },
			{ name = 'WEAPON_PISTOL50',			price = 30000 },
			{ name = 'WEAPON_BULLPUPSHOTGUN',	price = 1125000 },
			{ name = 'WEAPON_COMPACTRIFLE',		price = 1500000 }--,
		 -- { name = 'WEAPON_PUMPSHOTGUN',		price = 600000 },
		 -- { name = 'WEAPON_STUNGUN',			price = 50000 },
		 -- { name = 'WEAPON_FLASHLIGHT',		price = 800 },
		 -- { name = 'WEAPON_FIREEXTINGUISHER',	price = 1200 },
		 -- { name = 'WEAPON_FLAREGUN',			price = 6000 },
		 -- { name = 'GADGET_PARACHUTE',		price = 3000 },
		 -- { name = 'WEAPON_BAT',				price = 3000 },
		 -- { name = 'WEAPON_STICKYBOMB',		price = 200000 },
		 -- { name = 'WEAPON_SNIPERRIFLE',		price = 2200000 },
		 -- { name = 'WEAPON_FIREWORK',			price = 30000 },
		 -- { name = 'WEAPON_GRENADE',			price = 180000 },
		 -- { name = 'WEAPON_BZGAS',			price = 120000 },
		 -- { name = 'WEAPON_SMOKEGRENADE',		price = 100000 },
		 -- { name = 'WEAPON_APPISTOL',			price = 70000 },
		 -- { name = 'WEAPON_CARBINERIFLE',		price = 1100000 },
		 -- { name = 'WEAPON_HEAVYSNIPER',		price = 2000000 },
		 -- { name = 'WEAPON_MINIGUN',			price = 700000 },
		 -- { name = 'WEAPON_RAILGUN',			price = 2500000 }
		},

		Cloakrooms = {
			{ x = -811.78, y = 175.17, z = 75.75}
		},

		Armories = {
			{ x = -809.70, y = 172.41, z = 75.74}
		},

		Vehicles = {
			{
				Spawner    = { x = -808.62, y = 187.17, z = 71.48 },
				SpawnPoints = { 
					{ x = -820.15, y = 184.04, z = 71.13, heading = 116.36, radius = 6.0 }
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
			{ x = -812.06, y = 188.29, z = 71.48 }
		},

		BossActions = {
			{ x = -811.68, y = 180.74, z = 75.74 }
		},

	},

}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {
		{
			model = 'cognoscenti2',
			label = 'Armored Town Car'
		},
		{
			model = 'Manchez',
			label = 'Dirtbike'
		},
		{
			model = 'Contender',
			label = '4WD Truck'
		},
		{
			model = 'felon',
			label = 'Town Car'
		}
	},

	associate = {

	},

	soldier = {
	
	},

	lieutenant = {
		
	},

	boss = {

	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	associate = {
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
	soldier = {
		
	},
	lieutenant = {
		
	},
	boss = {
		
	},
	cartel_wear = {
		male = {
			['tshirt_1'] = 3,		['tshirt_2'] = 0,
			['torso_1'] = 4,		['torso_2'] = 0,
			['decals_1'] = 0,		['decals_2'] = 0,
			['arms'] = 1,			['arms_2'] = 0,
			['pants_1'] = 13,		['pants_2'] = 0,
			['shoes_1'] = 10,		['shoes_2'] = 0,
			['helmet_1'] = -1,		['helmet_2'] = 0,
			['chain_1'] = 0,		['chain_2'] = 0,
			['ears_1'] = -1,		['ears_2'] = 0,
			['glasses_1'] = -1,		['glasses_2'] = 2,
			['mask_1'] = -1,		['mask_2'] = 0			
		}
	},
	field_wear = {
		male = {
			['tshirt_1'] = 55,		['tshirt_2'] = 0,
			['torso_1'] = 53,		['torso_2'] = 0,
			['decals_1'] = 0,		['decals_2'] = 0,
			['arms'] = 96,			['arms_2'] = 0,
			['pants_1'] = 31,		['pants_2'] = 0,
			['shoes_1'] = 24,		['shoes_2'] = 0,
			['helmet_1'] = 83,		['helmet_2'] = 0,
			['chain_1'] = 0,		['chain_2'] = 0,
			['ears_1'] = -1,		['ears_2'] = 0,
			['glasses_1'] = 24,		['glasses_2'] = 2,
			['mask_1'] = 51,		['mask_2'] = 0
		}
	}

}