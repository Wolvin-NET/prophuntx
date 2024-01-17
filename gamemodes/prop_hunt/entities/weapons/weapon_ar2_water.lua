
if CLIENT then
	local GunName = "weapon_ar2_water"
	
	-- 2 = ar2
	-- / = smg1
	-- 0 = shotgun
	
	killicon.AddFont( GunName, "HL2MPTypeDeath", "2",  Color( 255, 80, 0, 255 ))
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/hud/"..GunName)
end

SWEP.Category 				= "Prop Hunt: X2Z" -- Used for Weapon Manager Plugin
SWEP.PrintName				= "AR2 Underwater"
SWEP.Author					= "Wolvindra-Vinzuerio"
SWEP.Instructions			= "Weapon that can be used underwater."
SWEP.BounceWeaponIcon		= false
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
SWEP.Weight					= 4
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Slot					= 2
SWEP.SlotPos				= 3
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true
SWEP.ViewModel				= Model("models/weapons/c_irifle.mdl")
SWEP.WorldModel				= Model("models/weapons/w_irifle.mdl")

SWEP.UseHands				= true
SWEP.ViewModelFOV			= 56

SWEP.m_WeaponDeploySpeed	= 1.25

function SWEP:Initialize()

    self:SetWeaponHoldType( "ar2" )

end

function SWEP:PrimaryAttack()

    if (  !self:CanPrimaryAttack() ) then return end

    self.Weapon:EmitSound( "Weapon_AR2.NPC_Single" ) --"Weapon_AR2.Single"
    self:ShootBullet( 8, 1, math.Rand(0.02,0.05), self.Primary.Ammo, 1, 3 )
    self:TakePrimaryAmmo( 1 )
    self.Owner:ViewPunch( Angle( math.Rand(0.2, -0.9), math.Rand(0.3,-0.3), 0 ) )
    self.Weapon:SetNextPrimaryFire( CurTime() + 0.095 )

end

function SWEP:DoImpactEffect( tr, nDamageType )

	-- the AR2 Tracer
	--[[ local ef = EffectData()
		-- todo: Tracer kinda messed up here, will do a better fix next time.
	ef:SetScale( 4096 )
	ef:SetFlags( 1 )
	ef:SetOrigin( tr.HitPos + tr.HitNormal )
	ef:SetStart( tr.StartPos )
	util.Effect( "AR2Tracer", ef ) ]]

	if ( tr.HitSky ) then return end
	
	local effectdata = EffectData()
	effectdata:SetOrigin( tr.HitPos + tr.HitNormal )
	effectdata:SetNormal( tr.HitNormal )
	util.Effect( "AR2Impact", effectdata )

end