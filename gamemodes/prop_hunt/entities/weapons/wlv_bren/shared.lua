--[[ 
Alternate version is Credited to "Blast da' Lizard": https://steamcommunity.com/id/blastdalizard
This script will only loaded after a new map changes.
if you made changes to this script with lua refresh, possible error will occurs, so a map restart is required.

Update to 16.09.21/X2Z: 
	> Add TFA Support
	> Better Weapon Base Detection
Supported Weapon Base:
	> TFA
	> M9K
	> default sandbox
]]--

-- Basic information
SWEP.Category				= "Wolvin\'s PH:X Bonus Weapon"
SWEP.Author					= "Wolvindra-Vinzuerio"
SWEP.Contact				= "wolvindra.vinzuerio@gmail.com"
SWEP.Purpose				= "Just aim and shot at those innocent props lol."
SWEP.Instructions			= "It's a gun. It's purpose is to shoot props."
SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

SWEP.PrintName				= "BREN MK II"

-- HUD Sections
if CLIENT then
	local gunmat = "vgui/hud/wlv_bren"
	SWEP.WepSelectIcon = surface.GetTextureID( gunmat )			-- Weapon Selection
	killicon.Add( "wlv_bren", gunmat, Color(255,255,255,255) )	-- Killicon
end
SWEP.Slot					= 3
SWEP.SlotPos				= 1
SWEP.Weight					= 3
SWEP.DrawAmmo				= true
SWEP.DrawWeaponInfoBox		= true
SWEP.BounceWeaponIcon   	= false
SWEP.DrawCrosshair			= true

-- Behaviour
SWEP.AutoSwitchTo			= true
SWEP.AutoSwitchFrom			= true

-- Model Basic Elements
SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= false
SWEP.HoldType 				= "ar2"	-- Just Incase if this required

-- Starting from this section; This part will be available on both base, including sandbox-based weapon.
-- However, they are shared between 2 bases below which will be depended on what base will be used.

-- Basic Ammo & Statistic
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AR2"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "None"
SWEP.Primary.RPM			= 500
SWEP.Primary.KickUp			= 0.65
SWEP.Primary.KickDown		= 0.6
SWEP.Primary.KickHorizontal	= 0.35

-- Maybe Unused, uncomment this to enable legacy support
-- SWEP.Primary.Cone		= 0.25
-- SWEP.Primary.Delay		= 0.12

-- Misc
SWEP.Gun					= ("wlv_bren")
SWEP.MuzzleAttachment		= "1"
SWEP.ShellEjectAttachment	= "2"
SWEP.AdminSpawnable			= false
SWEP.FiresUnderwater 		= false

SWEP.Secondary.IronFOV		= 55

SWEP.Primary.NumShots		= 1
SWEP.Primary.Damage			= 10

SWEP.Primary.Spread			= .025
SWEP.Primary.IronAccuracy 	= .01

SWEP.data 					= {}
SWEP.data.ironsights		= 1

SWEP.Properties = {
	[0]	= {
		vm	= "models/weapons/v_mkbren.mdl",
		wm	= "models/weapons/w_mkbren.mdl",
		snd = "BREN.Fire",
		h	= false,
		m9k	= {
			showwmdl = true,
			el = nil
		},
		tfa = nil,
		irs = {
			ispos = Vector(-3.172, -7.12, 0.425),
			isang = Vector(2.213, 0, 0),
			spos  = Vector(-3.172, -7.12, 0.425),
			apos  = Vector(2.213, 0, 0),
			rpos  = Vector(6.369, -10.244, -3.689),
			rang  = Vector(6.446, 62.852, 0)
		}
	},
	[1]	= {
		vm	= "models/weapons/c_mach_brenmk3.mdl",
		wm	= "models/weapons/w_mach_brenmk3.mdl",
		snd	= "brenmk3.single",
		h	= true,
		m9k	= {
			showwmdl = false,
			el = {
				["W_MkBren1"] = { type = "Model", model = "models/weapons/w_mach_brenmk3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.991, 0.171, -1.693), angle = Angle(0, -90.326, -6.628), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
			}
		},
		tfa	= {
			offset = {
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
		},
		irs = {
			ispos = Vector(-3.383, -5.856, 2.49),
			isang = Vector(-0.005, 0.009, 0),
			spos  = Vector(-3.383, -5.856, 2.49),
			apos  = Vector(-0.005, 0.009, 0),
			rpos  = Vector(3, -1.609, -6.97),
			rang  = Vector(-7.739, 40.804, -30.251)
		}
	}
}

SWEP.BaseMode	= "base"	-- dummy.
if ConVarExists("DebugM9K") then
	SWEP.BaseMode	= "m9k"
end
-- overwrite if tfa exists
if (ConVarExists("sv_tfa_default_clip") or ConVarExists("sv_tfa_cmenu")) then
	SWEP.BaseMode	= "tfa"
end

if SWEP.BaseMode == "m9k" then

	if SERVER then
		if (PHX and PHX ~= nil) and (PHX.VerboseMsg and PHX.VerboseMsg ~= nil) then
			PHX.VerboseMsg("[ PHX Bonus Weapon ] M9K base detected. MK Bren will use this base instead.")
		end
	end

	local mode = SWEP.Properties[GetConVar("ph_mkbren_use_new_mdl"):GetInt()]
	
	SWEP.ViewModel				= Model(mode.vm)
	SWEP.WorldModel				= Model(mode.wm)
	SWEP.UseHands				= mode.h
	SWEP.Primary.Sound			= Sound(mode.snd)

	SWEP.IronSightsPos 			= mode.irs.ispos
	SWEP.IronSightsAng 			= mode.irs.isang
	SWEP.SightsPos 				= mode.irs.spos
	SWEP.SightsAng 				= mode.irs.apos
	SWEP.RunSightsPos 			= mode.irs.rpos
	SWEP.RunSightsAng 			= mode.irs.rang
	
	SWEP.ShowWorldModel			= mode[SWEP.BaseMode].showwmdl
	if mode[SWEP.BaseMode].el ~= nil then
		SWEP.WElements 				= mode[SWEP.BaseMode].el
	end

	if (GetConVar(SWEP.Gun.."_allowed")) ~= nil then
		if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then 
			SWEP.Base 			= "bobs_blacklisted" 
			SWEP.PrintName 		= SWEP.Gun 
			return 
		end
	end
	
	-- Base that will be used
	SWEP.Base					= "bobs_gun_base"
	
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
	
elseif SWEP.BaseMode == "tfa" then

	if SERVER then
		if (PHX and PHX ~= nil) and (PHX.VerboseMsg and PHX.VerboseMsg ~= nil) then
			PHX.VerboseMsg("[ PHX Bonus Weapon ] TFA base detected. MK Bren will use this base instead.")
		end
	end

	local mode = SWEP.Properties[GetConVar("ph_mkbren_use_new_mdl"):GetInt()]
	
	SWEP.ViewModel				= Model(mode.vm)
	SWEP.WorldModel				= Model(mode.wm)
	SWEP.UseHands				= mode.h
	SWEP.Primary.Sound			= Sound(mode.snd)

	SWEP.IronSightsPos 			= mode.irs.ispos
	SWEP.IronSightsAng 			= mode.irs.isang
	SWEP.SightsPos 				= mode.irs.spos
	SWEP.SightsAng 				= mode.irs.apos
	SWEP.RunSightsPos 			= mode.irs.rpos
	SWEP.RunSightsAng 			= mode.irs.rang
	
	if mode[SWEP.BaseMode] ~= nil then
		SWEP.Offset				= mode[SWEP.BaseMode].offset
	end
	
	-- Base that will be used
	SWEP.Base					= "tfa_gun_base"
	
	-- Enable Blowback animation, like COD4 feeling.
	SWEP.LuaShellEject 			= true
	SWEP.BlowbackEnabled 		= true
	SWEP.BlowbackVector 		= Vector(0, -0.5, 0)
	
else
	
	-- Return to monke-- sandbox base.
	if SERVER then
		if (PHX and PHX ~= nil) and (PHX.VerboseMsg and PHX.VerboseMsg ~= nil) then
			PHX.VerboseMsg("[ PHX Bonus Weapon ] Server has no M9K/TFA base, Reverting to normal sandbox base.")
		end
	end
	
	-- Revert Default View/World model and make sure they are compatible.
	if GetConVar("ph_mkbren_use_new_mdl"):GetBool() then
		SWEP.Primary.Sound			= Sound("brenmk3.single")
		SWEP.ViewModel				= Model("models/weapons/c_mach_brenmk3.mdl")
		SWEP.WorldModel				= Model("models/weapons/w_mkbren.mdl")	-- we'll use old world model instead :)
		SWEP.UseHands				= true
	else
		SWEP.Primary.Sound			= Sound("BREN.Fire")
		SWEP.ViewModel				= Model("models/weapons/v_mkbren.mdl")
		SWEP.WorldModel				= Model("models/weapons/w_mkbren.mdl")
		SWEP.UseHands				= false
	end

	function SWEP:Initialize()
		self:SetWeaponHoldType( self.HoldType )
	end

	function SWEP:PrimaryAttack()
	
		local ply = self:GetOwner()

		if (not self:CanPrimaryAttack()) then 
			return
		end

		local punch = {}
		punch.x = math.random(-0.7,-0.2)
		punch.y = math.random(-0.1, 0.1)
		punch.z = 0

		self:EmitSound( self.Primary.Sound )
		self:ShootBullet( 35, 1, 0.025)
		self:TakePrimaryAmmo(1)
		if IsValid(ply) then
			ply:ViewPunch(Angle(punch.x, punch.y, punch.z))
		end
		self:SetNextPrimaryFire(CurTime() + 0.12)

	end
	
	function SWEP:Deploy()
		self:SetDeploySpeed(1)
	end

end

-- Sound Override Tables for BREN.

-- BREN: Firing Sound
local FS = {}
--  New Weapon
FS["brenmk3.single"] = "weapons/brenmk3/shoot.wav"
-- Old Weapon
FS["BREN.Fire"]		 = "weapons/mkbren/bren_1.wav"

-- BREN: Misc Sounds
local RS = {}
-- New Weapon
RS["brenmk3.draw"]			= "weapons/brenmk3/draw.wav"
RS["brenmk3.cloth"]			= "weapons/brenmk3/cloth.wav"
RS["brenmk3.boltback"]		= "weapons/brenmk3/boltback.wav"
RS["brenmk3.boltforward"]	= "weapons/brenmk3/boltforward.wav"
RS["brenmk3.magout"]		= "weapons/brenmk3/magout.wav"
RS["brenmk3.magin"]			= "weapons/brenmk3/magin.wav"
RS["brenmk3.magtap"]		= "weapons/brenmk3/magtap.wav"

-- Old Weapon
RS["BREN.MagOut"] 			= "weapons/mkbren/bren_magout.wav"
RS["BREN.MagIn"] 			= "weapons/mkbren/bren_magin.wav"
RS["BREN.BoltPull"] 		= "weapons/mkbren/bren_boltpull.wav"
RS["BREN.Draw"] 			= "weapons/mkbren/bren_draw.wav"


-- Add Weapon Sound.
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