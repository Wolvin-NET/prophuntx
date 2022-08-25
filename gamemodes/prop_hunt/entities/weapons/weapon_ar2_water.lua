SWEP.Category 				= "UNDERWATAAAA"
SWEP.PrintName				= "AR2 Underwater"
SWEP.Author					= "Wolvindra-Vinzuerio"
SWEP.Instructions			= "Weapon that can be used underwater."
SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 90
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "AirboatGun"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "None"
SWEP.Weight					= 4
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Slot					= 1
SWEP.SlotPos				= 3
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true
SWEP.ViewModel				= Model("models/weapons/c_irifle.mdl")
SWEP.WorldModel				= Model("models/weapons/w_irifle.mdl")

SWEP.UseHands				= true

function SWEP:Initialize()

    self:SetWeaponHoldType( "ar2" )

end

function SWEP:PrimaryAttack()

    if (  !self:CanPrimaryAttack() ) then return end

    self.Weapon:EmitSound( "Weapon_AR2.Single" )
    self:ShootBullet( 20, 1, 0.05 )
    self:TakePrimaryAmmo( 1 )
    self.Owner:ViewPunch( Angle( -0.7, 0, 0 ) )
    self.Weapon:SetNextPrimaryFire( CurTime() + 0.085 )

end