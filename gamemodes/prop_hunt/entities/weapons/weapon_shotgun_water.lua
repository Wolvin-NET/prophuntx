
if CLIENT then
	local GunName = "weapon_shotgun_water"
	
	-- 2 = ar2
	-- / = smg1
	-- 0 = shotgun
	
	killicon.AddFont( GunName, "HL2MPTypeDeath", "0",  Color( 255, 80, 0, 255 ))
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/hud/"..GunName)
end

SWEP.Category 				= "Prop Hunt: X2Z" -- Used for Weapon Manager Plugin
SWEP.PrintName				= "Shotgun Underwater"
SWEP.Author					= "Wolvindra-Vinzuerio"
SWEP.Instructions			= "Weapon that can be used underwater."
SWEP.BounceWeaponIcon		= false
SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false
SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 24
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "Buckshot"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "None"
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Slot					= 3
SWEP.SlotPos				= 2
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true
SWEP.ViewModel				= Model("models/weapons/c_shotgun.mdl")
SWEP.WorldModel				= Model("models/weapons/w_shotgun.mdl")
SWEP.ReloadSound			= Sound("Weapon_Shotgun.Reload")
SWEP.Cone                   = 0.08716

SWEP.UseHands				= true
SWEP.ViewModelFOV			= 56

SWEP.m_WeaponDeploySpeed	= 1.25

SWEP.FireMode = 1

function SWEP:Initialize()

    self:SetWeaponHoldType( "shotgun" )

end

function SWEP:PrimaryAttack()

    if (  !self:CanPrimaryAttack() ) then return end
	
	if (self.Reloading) then
		self.Reloading = false
		timer.Destroy( "Reload_" .. self.Weapon:EntIndex() )
	end
    
	self.FireMode = 1
    self.Weapon:EmitSound( Sound("Weapon_Shotgun.NPC_Single") )
    self:ShootBullet( 6, 5, self.Cone )
    self:TakePrimaryAmmo( 1 )
    self.Owner:ViewPunch( Angle( -2.5, 0, 0 ) )
    self.Weapon:SetNextPrimaryFire( CurTime() + 0.88 )
	self.Weapon:SetNextSecondaryFire( CurTime() + 0.9 )
	
	timer.Simple(0.22, function()
		if (IsValid( self ) and self.Owner:GetActiveWeapon() == self) then
			self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )
			self.Weapon:EmitSound( Sound("Weapon_Shotgun.Special1") )
		end
	end)

end

function SWEP:SecondaryAttack()

    if (  !self:CanPrimaryAttack() ) then return end
	
	if (self.Reloading) then
		self.Reloading = false
		timer.Destroy( "Reload_" .. self.Weapon:EntIndex() )
	end
    
    if self:Clip1() > 1 then
    
		self.FireMode = 2
        self.Weapon:EmitSound( Sound("Shotgun.FireSpecial") )
        self:ShootBullet( 6, 10, self.Cone )
        self:TakePrimaryAmmo( 2 )
        self.Owner:ViewPunch( Angle( -6, 0, 0 ) )
        self.Weapon:SetNextPrimaryFire( CurTime() + 0.9 )
		self.Weapon:SetNextSecondaryFire( CurTime() + 0.9 )
		
		timer.Simple(0.35, function() 
			if (IsValid( self ) and self.Owner:GetActiveWeapon() == self) then
				self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )
				self.Weapon:EmitSound( Sound("Weapon_Shotgun.Special1") )
			end
		end)
        
    else
        
		self.FireMode = 1
        self.Weapon:EmitSound( Sound("Weapon_Shotgun.NPC_Single") )
        self:ShootBullet( 6, 5, self.Cone )
        self:TakePrimaryAmmo( 1 )
        self.Owner:ViewPunch( Angle( -2, 0, 0 ) )
        self.Weapon:SetNextPrimaryFire( CurTime() + 0.88 )
		self.Weapon:SetNextSecondaryFire( CurTime() + 0.9 )
		
		timer.Simple(0.22, function()
			if (IsValid( self ) and self.Owner:GetActiveWeapon() == self) then
				self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )
				self.Weapon:EmitSound( Sound("Weapon_Shotgun.Special1") )
			end
		end)
        
    end

end

-- Original & Credit Code to: https://github.com/Bitl/gmod-hl2survivorsweps/blob/master/HL2AC_SWEPS/lua/weapons/weapon_hl2ac_paintgun.lua
-- Controls the Reload.
function SWEP:Reload()
    if SERVER then
        if !(self.Owner:GetActiveWeapon():GetClass() == "weapon_shotgun_water") then return end
        if self.Reloading || self.Owner:GetAmmoCount( "Buckshot" ) == 0 then return end
            
        if self.Weapon:Clip1() < self.Primary.ClipSize then
            self.Weapon:SendWeaponAnim( ACT_SHOTGUN_RELOAD_START )
            self.Owner:RemoveAmmo( 1, self.Primary.Ammo, false )
            self.Weapon:SetClip1(  self.Weapon:Clip1() + 1 )
            self.Weapon:SetNextSecondaryFire(CurTime() + 1)
            self.Weapon:SetNextPrimaryFire(CurTime() + 1)
            self.Weapon:EmitSound(self.ReloadSound)
            self.Reloading = true

            local PerformReload = function()
                if !self.Reloading then 
                    timer.Destroy( "Reload_" .. self.Weapon:EntIndex() )
                    return
                end
                local Ammo = self.Weapon:Clip1( )
                
                if Ammo >= self.Primary.ClipSize || self.Owner:GetAmmoCount( "Buckshot" ) == 0 then
                    self.Reloading = false
                    timer.Destroy( "Reload_" .. self.Weapon:EntIndex() )
                    self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )
					self.Weapon:EmitSound( Sound("Weapon_Shotgun.Special1") )
                    self.Weapon:SetNextSecondaryFire(CurTime() + 0.35)
                    self.Weapon:SetNextPrimaryFire(CurTime() + 0.35)
                else
                    self.Reloading = true
                    self.Weapon:SendWeaponAnim( ACT_VM_RELOAD )
                    if self.Owner:GetAmmoCount( "Buckshot" ) <= 0 then return end
                    self.Owner:RemoveAmmo( 1, self.Primary.Ammo, false )
                    self.Weapon:SetClip1(  self.Weapon:Clip1() + 1 )
                    self.Weapon:SetNextSecondaryFire( CurTime() + 0.35 )
                    self.Weapon:SetNextPrimaryFire( CurTime() + 0.35 )
                    self.Weapon:EmitSound(self.ReloadSound)
                end
            end
            
            timer.Create( "Reload_" .. self.Weapon:EntIndex(), 0.45, 17- self.Weapon:Clip1(), PerformReload)
        end
    end
end

function SWEP:ShootEffects()

	if self.FireMode == 1 then
		self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	elseif self.FireMode == 2 then
		self:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
	end
	self.Owner:MuzzleFlash()						-- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 )		-- 3rd Person Animation

end

function SWEP:Holster()
    if self.Reloading then
        self.Reloading = false
        timer.Destroy( "Reload_" .. self.Weapon:EntIndex() )
    end
    return true
end

local conf = {
    ["Shotgun.FireSpecial"] = {chn = CHAN_WEAPON, lvl = SNDLVL_GUNFIRE, vol = 0.5, pitch = {95,105},	sound = "weapons/shotgun/shotgun_dbl_fire.wav"}
}

for name,data in pairs(conf) do
    
    local struct = {}
    struct.channel	= data.chn
    struct.name		= name
    struct.volume	= data.vol
    struct.level	= data.lvl
    struct.pitch	= data.pitch
    struct.sound	= data.sound
    
    sound.Add( struct )
    util.PrecacheSound( name )
        
end