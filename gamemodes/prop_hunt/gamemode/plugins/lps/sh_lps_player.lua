local Player = FindMetaTable("Player")
if !Player then return end

if SERVER then
    function Player:SetLastStanding( bool )
        self:SetNWBool( "bLps.LastStanding", bool )
    end
    
    function Player:CreateLPSTrail( ... )
        self.lpstrail = util.SpriteTrail(self, ...)
    end
    
    function Player:RemoveLPSTrail()
        SafeRemoveEntity( self.lpstrail )
    end
    
    -- Only used if mode == 1
    function Player:CreateLPSWeaponEntity( model )
        local min,max = self:GetHull()
        self._lpsWepEnt = ents.Create("prop_dynamic")
        self._lpsWepEnt:SetPos( self:GetPos() + Vector( 0, 0, (max.z*0.5)) )
        self._lpsWepEnt:GetAngles( self:GetAngles() )
        self._lpsWepEnt:SetParent( self:GetPlayerPropEntity() )
        self._lpsWepEnt:SetModel( Model(model) )
        self._lpsWepEnt:SetSolid( SOLID_NONE )
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
end

function Player:IsLastStanding()
    return self:GetNWBool( "bLps.LastStanding", false )
end

function Player:GetLPSWeaponEntity()
    return self:GetNWEntity( "bLps.WeaponEnt", NULL )
end

function Player:GetLPSWeaponState()
    return self:GetNWInt( "bLps.WeaponState", 0 )
end

function Player:GetLPSWeaponName()
    return self:GetNWString( "bLps.WeaponName" )
end