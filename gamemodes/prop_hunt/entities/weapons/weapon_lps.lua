
--[[ 
    A DIRTY HACK Dummy Weapon Script for Last Prop Standing's for Prediction & Resolving Entity:EmitSound() issues.
]]--

SWEP.Category 				= "Prop Hunt: X2Z" -- Used for Weapon Manager Plugin
SWEP.Author					= "Wolvindra-Vinzuerio"
SWEP.Contact				= "wolvindra.vinzuerio@gmail.com"
SWEP.Purpose				= "Yes."
SWEP.Instructions			= "It does nothing."
SWEP.PrintName				= "Last Prop Standing Gun"
SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false
SWEP.Slot					= 0
SWEP.SlotPos				= 1
SWEP.Weight					= 1
SWEP.DrawAmmo				= false
SWEP.DrawWeaponInfoBox		= false
SWEP.BounceWeaponIcon   	= false
SWEP.ViewModelFOV			= 75
SWEP.ViewModelFlip			= false
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= -1
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "None"

function SWEP:Initialize()
    self:SetWeaponHoldType( "normal" )
    
    if CLIENT then
        self:SetNoDraw( true )
    end
end

if CLIENT then
    -- Don't Draw ViewModel & WorldModel
    function SWEP:DrawWorldModel() end
    function SWEP:ShouldDrawViewModel() return false end
end

function SWEP:PrimaryAttack() return end
function SWEP:SecondaryAttack() return end

-- Remove the weapon once dropped. In case if someone uses :DropWeapon() addon
function SWEP:OnDrop()
    timer.Simple(0, function() self:Remove() end)
end

function SWEP:OnRemove()
    -- possibly if any important removal is needed.
end