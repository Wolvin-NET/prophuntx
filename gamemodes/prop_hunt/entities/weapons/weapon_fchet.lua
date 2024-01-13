AddCSLuaFile()

if (CLIENT) then
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/hud/weapon_fchet")
end

SWEP.PrintName 	= "#GMOD_FlechetteGun"
SWEP.Author 	= "garry"
SWEP.Purpose 	= "Shoot flechettes with primary or secondary attack."

SWEP.Slot 		= 3
SWEP.SlotPos 	= 2

SWEP.Spawnable 	= true

SWEP.ViewModel 		= Model( "models/weapons/c_superphyscannon.mdl" )
SWEP.WorldModel 	= Model( "models/weapons/w_physics.mdl" )
SWEP.ViewModelFOV 	= 54
SWEP.UseHands 		= true

SWEP.Primary.ClipSize 		= 60
SWEP.Primary.DefaultClip 	= 60
SWEP.Primary.Automatic 		= true
SWEP.Primary.Ammo 			= "AlyxGun"

SWEP.Secondary.ClipSize 	= 1
SWEP.Secondary.DefaultClip 	= 2
SWEP.Secondary.Automatic 	= false
SWEP.Secondary.Ammo 		= "SMG1_Grenade"

SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true
SWEP.BounceWeaponIcon		= false

SWEP.m_WeaponDeploySpeed	= 1.25

-- game.AddParticles( "particles/hunter_flechette.pcf" )
-- game.AddParticles( "particles/hunter_projectile.pcf" )

local ShootSound = Sound( "NPC_Hunter.FlechetteShoot" )

function SWEP:Initialize()

	self:SetHoldType( "physgun" )

end

function SWEP:Reload()
end

function SWEP:CanBePickedUpByNPCs()
	return true
end

function SWEP:PrimaryAttack()

	if ( !self:CanPrimaryAttack() ) then return end

	self:EmitSound( ShootSound )
	self:ShootEffects( self )
	
	local owner = self:GetOwner()
	
	owner:ViewPunch( Angle( math.Rand(0.2, -0.8), math.Rand(0.2,-0.2), 0 ) )
	
	self:TakePrimaryAmmo( 1 )
    self:SetNextPrimaryFire( CurTime() + 0.15 )

	if ( CLIENT ) then return end

	SuppressHostEvents( NULL ) -- Do not suppress the flechette effects

	local ent = ents.Create( "hunter_flechette" )
	if ( !IsValid( ent ) ) then return end

	local Forward = owner:GetAimVector()
	
	ent:SetPos( owner:GetShootPos() + Forward * 32 )
	ent:SetAngles( owner:EyeAngles() )
	ent:SetOwner( owner )
	ent:Spawn()
	ent:Activate()

	ent:SetVelocity( Forward * 2000 )

end

local AddZ = Vector(0,0,32)
function SWEP:SecondaryAttack()

	local ply = self:GetOwner()
    if !IsValid(ply) then return end
	
	if ( !self:CanSecondaryAttack() ) then return end
	
	ply:ViewPunch( AngleRand(-7.5, 1.5) )
        
    if self:Ammo2() > 0 then
        
        self.Weapon:EmitSound( Sound( "Weapon_IRifle.Single" ) )
        
        if SERVER then
		
			for i=0,360,30 do
		
				SuppressHostEvents( NULL ) -- Do not suppress the flechette effects

				local ent = ents.Create( "hunter_flechette" )
				if ( !IsValid( ent ) ) then return end

				local owner = self:GetOwner()
				
				local ang=Angle(0,i,0)
				
				ent:SetPos( owner:GetPos()+AddZ )
				ent:SetAngles( ang )
				ent:SetOwner( owner )
				ent:Spawn()
				ent:Activate()

				ent:SetVelocity( ang:Forward() * 1500 )
				
			end
        end
        
		self:GetOwner():SetVelocity( Angle(0,90,0):Forward() * 100 )
		self:DrawRing()

		self.Weapon:SetNextPrimaryFire( CurTime() + 1 )
        self.Weapon:SetNextSecondaryFire( CurTime() + 2 )
        self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
        self.Owner:RemoveAmmo( 1, self.Weapon:GetSecondaryAmmoType() )
        
    else
    
        self:EmitSound( "Weapon_Pistol.Empty" )
        self:SetNextSecondaryFire( CurTime() + 0.2 )
        
    end

end

function SWEP:ShouldDropOnDie()
	return false
end

function SWEP:DrawRing()
	effects.BeamRingPoint(self:GetOwner():GetPos() + Vector(0,0,32), 0.5, 32, 800, 32, 0, Color(6,128,225,160),{
		speed=0,
		spread=0,
		delay=0,
		framerate=2,
		material="sprites/laserbeam.vmt"
	})
	-- Shockring
	effects.BeamRingPoint(self:GetOwner():GetPos() + Vector(0,0,32), 1, 32, 640, 32, 0, Color(230,230,210,128),{
		speed=0,
		spread=0,
		delay=0,
		framerate=2,
		material="sprites/physbeam.vmt"
	})
end

function SWEP:GetNPCRestTimes()

	-- Handles the time between bursts
	-- Min rest time in seconds, max rest time in seconds

	return 0.3, 0.6

end

function SWEP:GetNPCBurstSettings()

	-- Handles the burst settings
	-- Minimum amount of shots, maximum amount of shots, and the delay between each shot
	-- The amount of shots can end up lower than specificed

	return 1, 6, 0.1

end

function SWEP:GetNPCBulletSpread( proficiency )

	-- Handles the bullet spread based on the given proficiency
	-- return value is in degrees

	return 1

end
