-- This is an example to add weapons for hunters.
-- If you use Workshop collection, make sure your workshop collection is publicly available so that your friend(s) can download your weapons.
-- Additionally, a `resource.AddWorkshop()` is needed in order to get weapons downloaded to clients.

local WeaponsWorkshopIDs = {
	"123456789", -- Enter your weapon Workshop ID. THIS IS REQUIRED. Example: https://steamcommunity.com/sharedfiles/filedetails/?id=1310008131 , the "1310008131" after "?id=" is the Workshop ID.
	--"enter id here",
	--"enter id here",
}

for _,id in ipairs( WeaponsWorkshopIDs ) do
	resource.AddWorkshop( id )
end

local SpawnRandomLoadout = false --true to use Random Loadouts
local KeepDefaultWeapon = false --true to keep default Prop Hunt weapon (Crowbar, 357, and Shotgun)

--//////// Simple Loadout Weapons Table ////////--
local Simple_Loadout = {
	"tfa_csgo_ak47",
	"cw2_mp41",
	"weapon_ak47",
	"tfa_your_weapon_names_here",
	"weapon names here",
	-- "add more here",
	-- "add more here",
}

--//////// Random Loadout Weapons Table ////////--
local Random_Loadout = {	-- Configure your loadouts here!
	[1]	= { 
		{ weapon = "mg_mike4", 		ammo = { 32, "ar2"	  } },
		{ weapon = "mg_m9", 		ammo = { 90, "smg1"	  } },
		{ weapon = "tfa_dod_nambu",	ammo = {100, "pistol" } },
	},
	[2]	= { 
		{ weapon = "weapon_ar2", 	ammo = { 32, "ar2"	  } },
		{ weapon = "weapon_mp5",	ammo = { 90, "smg1"	  } },
		{ weapon = "weapon_deagle",	ammo = {100, "357" 	  } },
	},
	[3]	= { 
		{ weapon = "weapon_stunstick" 	},	-- no ammo
		{ weapon = "tfa_rpg_rocket",	ammo = {3, "rpg_rounds"} },
		{ weapon = "weapon_crossbow",	ammo = {5, "XBowbolt"  } },
		{ weapon = "weapon_tf2_pan" 	},	-- no ammo
		{ weapon = "weapon_smg1" 		},  -- no ammo
	},
	--[[ Example codes
	===> To get all default weapon Ammo Types: https://wiki.facepunch.com/gmod/Default_Ammo_Types
	[4]	= { 
		{ weapon = "<weapon_name>",	ammo = { <amount>, "<ammo type>" } },
	},
	[5]	= { 
		{ weapon = "weapon_ak47",	ammo = { 60, "ar2" } },
		{ weapon = "weapon_m4a1"	}, -- without ammo, optional
	},
	-- ... add more here
	]]
}

hook.Add("PH_OnHunterLoadOut", "Give Test Weapon", function (pl)

	if !pl:Alive() then return end --make sure they're alive
	
	if (SpawnRandomLoadout) then
		local SelectRandomly = Random_Loadout[ math.random( 1, #Random_Loadout ) ]		
		for _,WeaponData in pairs( SelectRandomly ) do
			if (WeaponData.weapon) then ply:Give( WeaponData.weapon ) end
			if (WeaponData.ammo) then ply:GiveAmmo( WeaponData.ammo[1], WeaponData.ammo[2] ) end
		end
	else
		for _,weapon in ipairs(Simple_Loadout) do ply:Give( weapon ) end
	end
	
	return KeepDefaultWeapon
	
end)