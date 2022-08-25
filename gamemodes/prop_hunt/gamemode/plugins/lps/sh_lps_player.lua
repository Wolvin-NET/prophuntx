local Player = FindMetaTable("Player")
if !Player then return end

if SERVER then
    function Player:SetLastStanding( bool )
        self:SetNWBool( "bLps.LastStanding", bool )
    end
    
    function Player:CreateLPSTrail( ... )
        self.lpstrail = util.SpriteTrail(self, ...)
        -- can we set the color?
        
        local ph_prop = self:GetPlayerPropEntity()
        if ph_prop and IsValid(ph_prop) then
            ph_prop:DeleteOnRemove( self.lpstrail )
        end
    end
    
    -- In case if needed:
    function Player:RemoveLPSTrail()
        if IsValid(self.lpstrail) then
            self.lpstrail:Remove()
        end
    end
    
    function Player:CreateLPSWeaponEntity( model, hasFixAngle, hasFixPos )
    
        if !IsValid(self:GetPlayerPropEntity()) then return end
        if !hasFixAngle or hasFixAngle == nil then hasFixAngle = angle_zero end
        if !hasFixPos or hasFixPos == nil then hasFixPos = Vector(0,0,0) end
    
        --local mins,maxs = self:GetHull()
        local maxs = self:GetPlayerPropEntity():OBBMaxs()
        self._lpsWepEnt = ents.Create( "ph_lps_weapon" )
        self._lpsWepEnt:SetPos( self:GetPos() + Vector(0,0,maxs.z*1.1) )
        self._lpsWepEnt:GetAngles( Vector(0, self:GetAngles().y, 0) )
        
        self._lpsWepEnt:SetSolid( SOLID_NONE )
        self._lpsWepEnt:SetOwner( self )
        self._lpsWepEnt:SetModel( Model(model) )
		self._lpsWepEnt:SetMoveType(MOVETYPE_NONE)
        
        self._lpsWepEnt:SetFixAngles( hasFixAngle )
        self._lpsWepEnt:SetTranslatePos( hasFixPos )
        
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

end

--[[ STATES
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

function Player:SetLPSAmmoCount( intAmmo )
    self:SetNWInt( "bLps.AmmoCount", intAmmo )
end

function Player:LPSFiringState( bool )
    self:SetNWBool( "bLps.FiringState", bool )
end

function Player:LPSNextFire( delay )
    self:SetNWFloat( "bLps.CurTime", CurTime() + delay )
end

function Player:LPSNextFireDelay()
    return self:GetNWFloat( "bLps.CurTime", 0.0 )
end

function Player:LPSSubAmmoCount()
    if SERVER then
        local ammo = self:GetLPSAmmo()
        ammo = ammo - 1
        self:SetLPSAmmoCount( ammo )    
    end
end

function Player:LPSCheckEntityCanShoot( tblFilter )

    if !tblFilter or tblFilter == nil then tblFilter = { self:GetPlayerPropEntity() } end -- make it default, if filter is empty.

    local _,plmaxs = self:GetHull()
    local qt = GAMEMODE.ViewCam:CommonCamCollEnabledView( self:EyePos(), self:EyeAngles(), plmaxs.z )
    qt.filter = tblFilter
    local trx = util.TraceLine(qt)
    if trx.Entity and trx.Entity:IsValid() and PHX:IsUsablePropEntity( trx.Entity:GetClass() ) then
        return false
    end

    return true
    
end

function Player:LPSCreatePropTrace( tblFilter, startpos, angle, strStart, strEnd, small, big, normal )

    if !tblFilter or tblFilter == nil then tblFilter = { self:GetPlayerPropEntity() } end
    if !startpos or startpos == nil then startpos = self:EyePos() end
    if !angle or angle == nil then angle = self:EyeAngles() end
    if !strStart or strStart == nil then strStart = "start" end
    if !strEnd or strEnd == nil then strEnd = "endpos" end
    
    local long = 32768
    if !small or small == nil then small = long/2 end
    if !big or big == nil then big = long end
    if !normal or normal == nil then normal = long/2 end

    if self:Team() ~= TEAM_PROPS or !self:Alive() then return nil end --return nil instead of table.

    local _,plmaxs = self:GetHull() --Todo: OBBMaxs
    local trace    = {}
    trace          = GAMEMODE.ViewCam:CamColEnabled( startpos, angle, trace, strStart, strEnd, small, big, normal, plmaxs.z )
    trace.filter   = tblFilter
    
    return util.TraceLine(trace)

end

function Player:LPSShootBullets()

    if !IsValid(self) and self:Team() ~= TEAM_PROPS and !self:Alive() then return end
    if !GetGlobalBool("InRound", false) then return end
    if !PHX:GetCVar( "lps_enable" ) then return end
    if !self:IsLastStanding() then return end
    if self:GetLPSAmmo() == 0 then return end
    
    local _,plmaxs      = self:GetHull()
    local ph_prop       = self:GetPlayerPropEntity()
    
    local CanShootEntity = self:LPSCheckEntityCanShoot()
    if !CanShootEntity then return end
    
    local name          = self:GetLPSWeaponName()
    local wepdata       = PHX.LPS.WEAPON_NEW[name]
    if !name or name == "" or name =="No Weapon" or name == nil or 
    !wepdata or wepdata == nil then 
        return
    end
    
    local wepType = wepdata.Type
    
    -- // Weapon is using Normal Bullets. e.g: SMG, Shotgun, etc...
    if wepType == "weapon" then
        if ( self:LPSNextFireDelay() > CurTime() ) then return end
        
        self:LPSNextFire( wepdata.Delay )
        self:SetLPSAmmoCount( self:GetLPSAmmo() )
        
        local wepEntity      = self:GetLPSWeaponEntity()
        local att            = wepEntity:GetAttachment(1)
        local shootOrg       = att.Pos
        local shootAng       = self:EyeAngles()
        local aimTraceResult = util.LPSgetAccurateAim( { ph_prop }, self:EyePos(), shootOrg, shootAng, plmaxs.z )
        local AmmoCount      = util.LPSgetConValue( wepdata.AmmoCount )
        local bullet = {}
            bullet.Num          = wepdata.Num
            bullet.Src          = shootOrg
            bullet.Dir          = aimTraceResult.Normal
            bullet.Spread       = util.LPSgetSpread( wepdata.Spread )
            bullet.Tracer       = wepdata.Tracer
            bullet.TracerName   = wepdata.TracerName
            bullet.Force        = wepdata.Force
            bullet.Damage       = util.LPSgetConValue( wepdata.Damage )
            bullet.AmmoType     = wepdata.AmmoType
            bullet.Attacker     = self
            bullet.IgnoreEntity = ph_prop
            bullet.Callback = function(atk,_,cDamage)
                cDamage:SetInflictor( atk:GetLPSWeaponEntity() ) -- DON'T USE self ! let the CDamageInfo handles it.
            end
        
        -- Fire Bullet and make us Lag Compesated
        self:LagCompensation(true)
        self:FireBullets( bullet )
        self:LagCompensation(false)
        
        local curWep = self:GetActiveWeapon()
        if self:HasWeapon( PHX.LPS.DUMMYWEAPON ) and curWep:GetClass() == PHX.LPS.DUMMYWEAPON then
            -- Emit from Weapon to prevent Duplicated Effect
            curWep:EmitSound( wepdata.ShootSound )
        end
        if wepdata.MuzzleFx and wepdata.MuzzleFx ~= nil then
			-- arg: Entity, StartPos, EndPos (Origin), Angles
            wepdata.MuzzleFx( wepEntity, shootOrg, aimTraceResult.HitPos, shootAng )
        end
        local viewpunchAng = wepdata.ViewPunch
        if viewpunchAng and viewpunchAng ~= nil then
            self:ViewPunch( Angle( math.random(viewpunchAng.x[1],viewpunchAng.x[2]), math.random(viewpunchAng.y[1],viewpunchAng.y[2]), 0 ) )
        end
        
        if AmmoCount > 0 then
            self:LPSSubAmmoCount()
        end
        
        if self:GetLPSAmmo() == 0 then
            self:SetLPSWeaponState( LPS_WEAPON_OUTOFAMMO )
        end
    
    -- // Weapon is using Custom Bullets & Functions. e.g: Blaster, RPG, Lasers...
    elseif wepType == "custom" then
    
        if ( self:LPSNextFireDelay() > CurTime() ) then
            if wepdata.Reload then 
                self:SetLPSWeaponState( LPS_WEAPON_RELOAD )
            end
            return
        end
		
		self:LPSNextFire( wepdata.Delay )
        self:SetLPSAmmoCount( self:GetLPSAmmo() )
        
        if !wepdata.Reload and self:GetLPSAmmo() > 0 or self:GetLPSAmmo() == -1 then
            self:SetLPSWeaponState( LPS_WEAPON_READY )
        end
        
        local AmmoCount = util.LPSgetConValue( wepdata.AmmoCount )
        
        -- Judy, do the thing!
        wepdata:Function( self )
        
        if AmmoCount > 0 then
            self:LPSSubAmmoCount()
        end
        
        if self:GetLPSAmmo() == 0 then
            self:SetLPSWeaponState( LPS_WEAPON_OUTOFAMMO )
        end
        
    end

end

function Player:LPSFiringStatus()
    return self:GetNWBool( "bLps.FiringState", false )
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

function Player:GetLPSAmmo()
    return self:GetNWInt( "bLps.AmmoCount", 0 ) -- can also -1.
end