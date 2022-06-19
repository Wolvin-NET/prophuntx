local Player = FindMetaTable("Player")
if !Player then return end

if SERVER then
    function Player:SetLastStanding( bool )
        self:SetNWBool( "bLps.LastStanding", bool )
    end
    
    function Player:CreateLPSTrail( ... )
        self.lpstrail = util.SpriteTrail(self, ...)
        
        local ph_prop = self:GetPlayerPropEntity()
        if ph_prop and IsValid(ph_prop) then
            ph_prop:DeleteOnRemove( self.lpstrail )
        end
    end
    
    -- In case if this needed.
    function Player:RemoveLPSTrail()
        if IsValid(self.lpstrail) then
            self.lpstrail:Remove()
        end
    end
    
    -- Only used if mode == 1
    function Player:CreateLPSWeaponEntity( model, hasFixAngle )
    
        if !hasFixAngle or hasFixAngle == nil then hasFixAngle = angle_zero end
    
        local mins,maxs = self:GetHull()
        self._lpsWepEnt = ents.Create( "ph_lps_weapon" )
        self._lpsWepEnt:SetPos( self:GetPos() + Vector(0,0,maxs.z*0.5) )
        self._lpsWepEnt:GetAngles( Vector(0, self:GetAngles().y, 0) )
        
        self._lpsWepEnt:SetSolid( SOLID_NONE )
        self._lpsWepEnt:SetOwner( self )
        self._lpsWepEnt:SetModel( Model(model) )
        self._lpsWepEnt:SetSolid(SOLID_NONE)
		self._lpsWepEnt:SetMoveType(MOVETYPE_NONE)
        
        self._lpsWepEnt:SetFixAngles( hasFixAngle )
        
        self._lpsWepEnt:Spawn()
        -- Delete weapon prop when ph_prop is removed.
        self:GetPlayerPropEntity():DeleteOnRemove( self._lpsWepEnt )
        
        self:SetNWEntity( "bLps.WeaponEnt", self._lpsWepEnt )
    end
    
    function Player:RemoveLPSWeaponEntity()
        if self._lpsWepEnt and IsValid( self._lpsWepEnt ) then
            self:SetNWEntity( "bLps.WeaponEnt", NULL )
            self._lpsWepEnt:Remove()
        end
    end
    
    --[[
        LPS_WEAPON_UNARMED      = 0
        LPS_WEAPON_READY        = 1
        LPS_WEAPON_RELOAD       = 2
        LPS_WEAPON_OUTOFAMMO    = 3
    ]]--
    function Player:SetLPSWeaponState( state )
        self.LPSWepState = state
        self:SetNWInt( "bLps.WeaponState", self.LPSWepState )
    end
    
    function Player:SetLPSWeapon( strWeapon )
        self.LPSWeapon = strWeapon
        self:SetNWString( "bLps.WeaponName", self.LPSWeapon )
    end
    
    function Player:SetLPSWeaponReloadType( bool )
        self:SetNWBool( "bLps.WeaponReloadType", bool )
    end
    
    function Player:SetLPSAmmoCount( intAmmo )
        -- do not use self.propLPSAmmo!
        self:SetNWInt( "bLps.AmmoCount", intAmmo )
    end
end

function Player:IsLastStanding()
    return self:GetNWBool( "bLps.LastStanding", false )
end

function Player:GetLPSWeaponEntity()
    return self:GetNWEntity( "bLps.WeaponEnt", NULL )
end

function Player:HasLPSWeapon()
    return IsValid( self:GetNWEntity( "bLps.WeaponEnt", NULL ) )
end

function Player:GetLPSWeaponState()
    return self:GetNWInt( "bLps.WeaponState", 0 )
end

function Player:GetLPSWeaponName()
    return self:GetNWString( "bLps.WeaponName", "No Weapon" )
end

function Player:GetLPSWeaponReloadType()
    return self:GetNWBool( "bLps.WeaponReloadType", false )
end

function Player:GetLPSAmmo()
    return self:GetNWInt( "bLps.AmmoCount", 0 ) -- can also -1.
end