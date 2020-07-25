-- Code base: Credit to http://steamcommunity.com/id/INCONCEIVABLEINCONCEIVABLE .
-- Weapon base are now removed due of M9K's version differences.

-- Alternate version - Credits to: Blast da' Lizard - https://steamcommunity.com/id/blastdalizard

-- These code are now supports with 3 bases: 
-- --> TFA
-- --> M9K
-- --> Sandbox/default

local function CheckConVar(cvar)
	if cvar == nil then return false end
	if cvar != nil then return true end
	if IsValid(cvar) then return true end
	return false
end

if CheckConVar(GetConVar("DebugM9K")) or (CheckConVar(GetConVar("sv_tfa_conv_m9konvert")) && GetConVar("sv_tfa_conv_m9konvert"):GetBool()) then -- check if M9K or TFA is Exists on server. otherwise will use from Default base instead.

	SWEP.Gun = ("wlv_bren")
	if (GetConVar(SWEP.Gun.."_allowed")) != nil then
		if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then 
			SWEP.Base = "bobs_blacklisted" 
			SWEP.PrintName = SWEP.Gun 
			return 
		end
	end
	
	local icol = Color( 255, 255, 255, 255 )
	if CLIENT then
		killicon.Add( SWEP.Gun, "vgui/hud/"..SWEP.Gun, icol )
	end
	
	SWEP.Category				= "Wolvin\'s PH Bonus Weapon"
	SWEP.Author					= "Wolvindra-Vinzuerio"
	SWEP.Contact				= "wolvindra.vinzuerio@gmail.com"
	SWEP.Purpose				= "Just aim and shot at those innocent props lol."
	SWEP.Instructions			= "Step 1: Acquire This Gun.\nStep 2: Shoot.\nStep 3: Profit."	--> Brain 404: Not Found.
	SWEP.MuzzleAttachment		= "1"
	SWEP.ShellEjectAttachment	= "2"
	SWEP.PrintName				= "Bren MK II"
	SWEP.Slot					= 3
	SWEP.SlotPos				= 1
	SWEP.DrawAmmo				= true
	SWEP.DrawWeaponInfoBox		= true
	SWEP.BounceWeaponIcon   	= false
	SWEP.DrawCrosshair			= true
	SWEP.Weight					= 10
	SWEP.AutoSwitchTo			= true
	SWEP.AutoSwitchFrom			= true
	SWEP.HoldType 				= "ar2"

	SWEP.ViewModelFOV			= 60
	SWEP.ViewModelFlip			= false
	if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
		SWEP.ViewModel				= Model("models/weapons/c_mach_brenmk3.mdl")
		SWEP.WorldModel				= Model("models/weapons/w_mach_brenmk3.mdl")
		-- this one is used for M9K. TFA may ignore this.
		SWEP.ShowWorldModel			= false
		
		SWEP.UseHands				= true
	else
		SWEP.ViewModel				= Model("models/weapons/v_mkbren.mdl")
		SWEP.WorldModel				= Model("models/weapons/w_mkbren.mdl")
		-- this one is used for M9K. TFA may ignore this.
		SWEP.ShowWorldModel			= true
		
		SWEP.UseHands				= false
	end
	
	SWEP.ShowWorldModel			= true
	SWEP.Base					= "bobs_gun_base"
	SWEP.Spawnable				= false
	SWEP.AdminSpawnable			= false

	SWEP.FiresUnderwater 		= false

	if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
		SWEP.Primary.Sound			= Sound("brenmk3.single")
	else
		SWEP.Primary.Sound			= Sound("BREN.Fire")
	end
	SWEP.Primary.RPM			= 500
	SWEP.Primary.ClipSize		= 30
	SWEP.Primary.DefaultClip	= 90
	SWEP.Primary.KickUp			= 0.85
	SWEP.Primary.KickDown		= 0.6
	SWEP.Primary.KickHorizontal	= 0.5
	SWEP.Primary.Automatic		= true
	SWEP.Primary.Ammo			= "ar2"

	SWEP.Secondary.IronFOV		= 55

	SWEP.data 					= {}
	SWEP.data.ironsights		= 1

	SWEP.Primary.NumShots		= 1
	SWEP.Primary.Damage			= 10	-- 35 for PH is bit OP, but hopefully this already balance the game since this is a rare drop.
	SWEP.Primary.Spread			= .025
	SWEP.Primary.IronAccuracy 	= .01

	if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
		SWEP.IronSightsPos = Vector(-3.383, -5.856, 2.49)
		SWEP.IronSightsAng = Vector(-0.005, 0.009, 0)
		SWEP.SightsPos = Vector(-3.383, -5.856, 2.49)
		SWEP.SightsAng = Vector(-0.005, 0.009, 0)
		SWEP.RunSightsPos = Vector(3, -1.609, -6.97)
		SWEP.RunSightsAng = Vector(-7.739, 40.804, -30.251)
		-- for M9K
		SWEP.WElements = {
			["W_MkBren1"] = { type = "Model", model = "models/weapons/w_mach_brenmk3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.991, 0.171, -1.693), angle = Angle(0, -90.326, -6.628), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
		}
		-- for TFA
		SWEP.Offset = {
			Pos = {
				Up = -2.1,
				Right = 0,
				Forward = 5.5
			},
			Ang = {
				Up = 90,
				Right = 178,
				Forward = 176
			},
			Scale = 0.9
		}
	else
		SWEP.IronSightsPos 			= Vector(-3.172, -7.12, 0.425)
		SWEP.IronSightsAng 			= Vector(2.213, 0, 0)
		SWEP.SightsPos				= Vector(-3.172, -7.12, 0.425)
		SWEP.SightsAng				= Vector(2.213, 0, 0)
		SWEP.RunSightsPos			= Vector(6.369, -10.244, -3.689)
		SWEP.RunSightsAng			= Vector(6.446, 62.852, 0)
	end

	-- M9K Weapon properties
	if GetConVar("M9KDefaultClip") == nil then
		print("M9KDefaultClip is missing! You may have hit the lua limit!")
	else
		if GetConVar("M9KDefaultClip"):GetInt() != -1 then
			SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * GetConVar("M9KDefaultClip"):GetInt()
		end
	end

	if GetConVar("M9KUniqueSlots") != nil then
		if not (GetConVar("M9KUniqueSlots"):GetBool()) then 
			SWEP.SlotPos = 3
		end
	end

else
	-- Revert to default base, if server has no M9K.
	
	if CLIENT then
		killicon.Add( "wlv_bren", "vgui/hud/wlv_bren", Color(255,255,255,255) )
	end
	
	if SERVER then
		if PHX and PHX.VerboseMsg then
			PHX.VerboseMsg("[ Bren MK ] Server has no default M9K Base, Reverting to normal sandbox base!")
		end
	end

	SWEP.Category 				= "Wolvindra-Vinzuerio"
	SWEP.PrintName				= "BREN MK II"
	SWEP.Author					= "Wolvindra-Vinzuerio"
	SWEP.Instructions			= "Simply shoot at props."
	SWEP.Spawnable 				= true
	SWEP.AdminOnly 				= false

	SWEP.Primary.ClipSize		= 30
	SWEP.Primary.DefaultClip	= 90
	SWEP.Primary.Automatic		= true
	SWEP.Primary.Ammo			= "AR2"
	SWEP.Secondary.ClipSize		= -1
	SWEP.Secondary.DefaultClip	= -1
	SWEP.Secondary.Automatic	= false
	SWEP.Secondary.Ammo			= "None"

	SWEP.AutoSwitchTo			= false
	SWEP.AutoSwitchFrom			= false
	SWEP.Slot					= 3
	SWEP.SlotPos				= 1
	SWEP.Weight					= 3
	SWEP.DrawAmmo				= true
	SWEP.DrawCrosshair			= true

	SWEP.ViewModelFOV			= 60
	SWEP.ViewModelFlip			= false

	if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
		SWEP.ViewModel				= Model("models/weapons/c_mach_brenmk3.mdl")
		SWEP.WorldModel				= Model("models/weapons/w_mkbren.mdl")
		SWEP.UseHands				= true
	else
		SWEP.ViewModel				= Model("models/weapons/v_mkbren.mdl")
		SWEP.WorldModel				= Model("models/weapons/w_mkbren.mdl")
		SWEP.UseHands				= false
	end

	function SWEP:Initialize()
		self:SetWeaponHoldType("ar2")
	end

	function SWEP:PrimaryAttack()

		if (!self:CanPrimaryAttack()) then 
			return
		end

		local punch = {}
		punch.x = math.random(-0.7,-0.2)
		punch.y = math.random(0, 0.1)
		punch.z = 0
		
		if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
			self.Weapon:EmitSound( Sound("brenmk3.single") )
		else
			self.Weapon:EmitSound( Sound("BREN.Fire") )
		end
		self:ShootBullet( 35, 1, 0.025)
		self:TakePrimaryAmmo(1)
		self.Owner:ViewPunch(Angle(punch.x, punch.y, punch.z))
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.12)

	end
	
	function SWEP:Deploy()
		self:SetDeploySpeed(1)
	end
	
end

-- Sound Override Tables for BREN.

-- BREN: Firing Sound
local FS = {}
	if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
		FS["brenmk3.single"] = "weapons/brenmk3/shoot.wav"
	else
		FS["BREN.Fire"]		 = "weapons/mkbren/bren_1.wav"
	end

-- BREN: Reloading Sound
local RS = {}
	if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
		RS["brenmk3.draw"]		= "weapons/brenmk3/draw.wav"
		RS["brenmk3.cloth"]		= "weapons/brenmk3/cloth.wav"
		RS["brenmk3.boltback"]	= "weapons/brenmk3/boltback.wav"
		RS["brenmk3.boltforward"]	= "weapons/brenmk3/boltforward.wav"
		RS["brenmk3.magout"]		= "weapons/brenmk3/magout.wav"
		RS["brenmk3.magin"]		= "weapons/brenmk3/magin.wav"
		RS["brenmk3.magtap"]		= "weapons/brenmk3/magtap.wav"
	else
		RS["BREN.MagOut"] 	= "weapons/mkbren/bren_magout.wav"
		RS["BREN.MagIn"] 	= "weapons/mkbren/bren_magin.wav"
		RS["BREN.BoltPull"] = "weapons/mkbren/bren_boltpull.wav"
		RS["BREN.Draw"] 	= "weapons/mkbren/bren_draw.wav"
	end

-- Assign to table.
local wepsnd = {}

wepsnd.fire = {
	channel = CHAN_WEAPON,
	volume = 1,
	soundlevel = 120,
	pitchstart = 100,
	pitchend = 100
}

for k, v in pairs(FS) do
	wepsnd.fire.name = k
	wepsnd.fire.sound = v
		
	sound.Add(wepsnd.fire)
end	

wepsnd.weps = {
	channel = CHAN_STATIC,
	volume = 1,
	soundlevel = 70,
	pitchstart = 100,
	pitchend = 100
}
	
for k, v in pairs(RS) do
	wepsnd.weps.name = k
	wepsnd.weps.sound = v
	
	sound.Add(wepsnd.weps)
end