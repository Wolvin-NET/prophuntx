
if CLIENT then
	local GunName = "weapon_smg1_water"
	
	-- 2 = ar2
	-- / = smg1
	-- 0 = shotgun
	
	killicon.AddFont( GunName, "HL2MPTypeDeath", "/",  Color( 255, 80, 0, 255 ))
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/hud/"..GunName)
end

SWEP.Category 				= "UNDERWATAAAA"
SWEP.PrintName				= "SMG1 Underwater"
SWEP.Author					= "Wolvindra-Vinzuerio"
SWEP.Instructions			= "Weapon that can be used underwater."
SWEP.BounceWeaponIcon		= false
SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false
SWEP.Primary.ClipSize		= 45
SWEP.Primary.DefaultClip	= 225
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Secondary.ClipSize		= 1
SWEP.Secondary.DefaultClip	= 1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "SMG1_Grenade"
SWEP.Weight					= 2
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Slot					= 2
SWEP.SlotPos				= 1
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true
SWEP.ViewModel				= Model("models/weapons/c_smg1.mdl")
SWEP.WorldModel				= Model("models/weapons/w_smg1.mdl")

SWEP.UseHands				= true
SWEP.ViewModelFOV			= 56

SWEP.m_WeaponDeploySpeed	= 1.25

function SWEP:Initialize()

    self:SetWeaponHoldType( "smg" )

end

function SWEP:PrimaryAttack()

    if ( !self:CanPrimaryAttack() ) then return end
    
    self.Weapon:EmitSound( Sound( "Weapon_SMG1.Single" ) )
    self:ShootBullet( 4, 1, math.Rand(0.03, 0.05 ), self.Primary.Ammo, 1, 2 )
    self:TakePrimaryAmmo( 1 )
    self.Owner:ViewPunch( Angle( math.Rand(0.2, -0.8), math.Rand(0.2,-0.2), 0 ) )
    self.Weapon:SetNextPrimaryFire( CurTime() + 0.07 )

end

function SWEP:Reload()
	if ( self:Clip1() < self:GetMaxClip1() ) then
		self.Weapon:EmitSound( Sound( "Weapon_SMG1.Reload" ) )
	end
	self:DefaultReload( ACT_VM_RELOAD )
end

function SWEP:SecondaryAttack()

    local ply = self:GetOwner()
    if !IsValid(ply) then return end
        
    if self:Ammo2() > 0 then
        
        self.Weapon:EmitSound( Sound( "NPC_Combine.GrenadeLaunch" ) )
        
        if SERVER then
            local Forward = ply:EyeAngles():Forward()
            
            local g = ents.Create("grenade_ar2")
            if (IsValid(g)) then
                g:SetPos( ply:GetShootPos() + Forward * 32 )
                g:SetAngles( ply:EyeAngles() )
                g:SetMoveType( MOVETYPE_FLYGRAVITY )
                g:SetMoveCollide( MOVECOLLIDE_FLY_BOUNCE )
                g:Spawn()
                
                g:SetVelocity( Forward * 1000 )
                g:SetLocalAngularVelocity(Angle(math.random(-400,400),math.random(-400,400),math.random(-400,400)))
                g:SetSaveValue("m_flDamage", 100)
                g:SetOwner(ply)
            end
        end
        
        ply:ViewPunch( Angle(-7.5, 0, 0) )
		self.Weapon:SetNextPrimaryFire( CurTime() + 0.5 )
        self.Weapon:SetNextSecondaryFire( CurTime() + 1.25 )
        self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
        self.Owner:RemoveAmmo( 1, self.Weapon:GetSecondaryAmmoType() )
        
    else
    
        self:EmitSound( "Weapon_Pistol.Empty" )
        self:SetNextSecondaryFire( CurTime() + 0.2 )
        
    end
end