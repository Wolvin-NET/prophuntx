-- Custom LPS Weapon, similar on how PHX.LPS.WEAPON_NEW is structured.
-- Weapon "Name" must lowercased and recommend that shouldn't contain spaces.

-- Create an accurately-overpowered gun but very slow delay.
list.Set("LPS.XCustomWeapon", "awesomegun", { -- name "my awesome gun" must be lowercased.

	Delay           = 5,
	AmmoCount       = 200, -- Can be an Existing ConVar, e.g: "sv_my_awesome_gun_ammo"
	WorldModel      = Model("models/weapons/w_pistol.mdl"),
	ShootSound      = Sound("Weapon_Mortar.Single"),
	Type            = "weapon", --"weapon" for normal weapon firing. "custom" is more advanced one such as blaster, rocket rpg, laser and other things.
	ViewPunch       = {
		x = {-25,-5},
		y = {-0.025,0.3}
	},
	
	FixAngles		= Angle(0,180,0), --Fix Local Angles, if any.
	FixPos          = Vector(0,8,0), -- Fix Local Position, if any.
	MuzzleFx        = function( ent, pos, endpos, ang )
		local m = EffectData()
		m:SetEntity( ent )
		m:SetStart( pos )
		m:SetOrigin( endpos )
		m:SetAngles( ang )
		m:SetFlags( 5 )
		util.Effect( "MuzzleFlash", m )
	end,
	
	Num 			= 1,
	Spread	        = 0.01,
	Tracer		    = 1, -- How much tracer will shown. Setting to 3 will makes every 3 shots will show the tracer.
	TracerName 	    = "AR2Tracer",
	Force		    = 10, -- Force of the bullet when it hit something
	AmmoType        = "357",
	Damage		    = 100 -- Can be an existing ConVar, e.g: "sv_my_awesome_gun_damage"

})