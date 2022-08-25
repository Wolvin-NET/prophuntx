SWEP.Category 				= "UNDERWATAAAA"
SWEP.PrintName				= "SMG1 Underwater"
SWEP.Author					= "Wolvindra-Vinzuerio"
SWEP.Instructions			= "Weapon that can be used underwater."
SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false
SWEP.Primary.ClipSize		= 45
SWEP.Primary.DefaultClip	= 225
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Secondary.ClipSize		= 1
SWEP.Secondary.DefaultClip	= 2
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "SMG1_Grenade"
SWEP.Weight					= 2
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Slot					= 1
SWEP.SlotPos				= 1
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true
SWEP.ViewModel				= Model("models/weapons/c_smg1.mdl")
SWEP.WorldModel				= Model("models/weapons/w_smg1.mdl")

SWEP.UseHands				= true

function SWEP:Initialize()

    self:SetWeaponHoldType( "smg" )

end

function SWEP:PrimaryAttack()

    if ( !self:CanPrimaryAttack() ) then return end
    
    self.Weapon:EmitSound( Sound( "Weapon_SMG1.Single" ) )
    self:ShootBullet( 10, 1, 0.04 )
    self:TakePrimaryAmmo( 1 )
    self.Owner:ViewPunch( Angle( -0.5, 0, 0 ) )
    self.Weapon:SetNextPrimaryFire( CurTime() + 0.085 )

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
        
        ply:ViewPunch( Angle(5, 0, 0) )
        self.Weapon:SetNextSecondaryFire( CurTime() + 1.25 )
        self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
        self.Owner:RemoveAmmo( 1, self.Weapon:GetSecondaryAmmoType() )
        
    else
    
        self:EmitSound( "Weapon_Pistol.Empty" )
        self:SetNextSecondaryFire( CurTime() + 0.2 )
        
    end
end