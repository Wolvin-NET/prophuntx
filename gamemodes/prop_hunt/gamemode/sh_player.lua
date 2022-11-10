local Player = FindMetaTable("Player")
local Entity = FindMetaTable("Entity")
if !Player then return end
if !Entity then return end

function Entity:GetPropSize()
    local hullxymax=0
    local hullz=0
    hullxymax     = math.Round(math.Max(self:OBBMaxs().x - self:OBBMins().x, self:OBBMaxs().y - self:OBBMins().y) / 2)
    hullz         = math.Round(self:OBBMaxs().z - self:OBBMins().z)
	
    -- don't do a hull check. It's kinda bugged and causing low framerate problems.
	if self:GetClass() == "prop_ragdoll" then
		return 0,0,0
	end
	
	return hullxymax, hullxymax, hullz --this is intentional. We might to re-add "Y" in the future for ragdolls.
end

function Player:CheckHull(hx,hy,hz)
	local tr = {}
	tr.start = self:GetPos()
	tr.endpos = self:GetPos()
	tr.filter = { self, self:GetPlayerPropEntity() }
	tr.maxs = Vector(hx,hy,hz)
	tr.mins = Vector(-hx,-hy,0)
	
	local trx = util.TraceHull(tr)
	if trx.Hit then return false end
	return true
end

-- From Enhanced Plus

function Player:IsPlaying()
	return self:Team() == TEAM_HUNTERS or self:Team() == TEAM_PROPS
end

-- Do this act as a quick trace?
function Player:TraceLineFromPlayer(endpos, usehull)
	local trace = {}
	trace.filter = {self, self.ph_prop}
	trace.start = self:GetPos()
	trace.endpos = endpos
	trace.mask = MASK_PLAYERSOLID
	
	local traceResult = util.TraceLine(trace)
	
	if (usehull) then
		trace.mins = self.ph_prop:OBBMins()
		trace.maxs = self.ph_prop:OBBMaxs()
	
		traceResult = util.TraceHull(trace)
	end
	return traceResult
end

function Player:SetForceAsProp( bool )
	if PHX:GetCVar( "ph_enable_teambalance" ) and !PHX:GetCVar( "ph_rotateteams" ) then
		self:SetNWBool("bPHX.ForcedAsProp", bool)
	end
end

function Player:IsCurrentlyForcedAsProp()
	return self:GetNWBool("bPHX.ForcedAsProp", false)
end

-- End of Enhanced Plus

-- Blinds the player by setting view out into the void
function Player:Blind(bool)
	if !self:IsValid() then return end
	if bool == nil then bool = false end
	
	self:SetNWBool("isBlind", bool)
end

function Player:GetBlindState()
	local bool = self:GetNWBool("isBlind", false)
	return bool
end

function Player:GetPlayerLockedRot()
	return self:GetNWBool("PlayerLockedRotation", false)
end

-- Player's prop entity
function Player:GetPlayerPropEntity()
	return self:GetNWEntity("PlayerPropEntity", nil)
end

-- Removes the prop given to the player
function Player:RemoveProp()
	if CLIENT || !self:IsValid() then return end
	
	if self.ph_prop && self.ph_prop:IsValid() then
		self.ph_prop:Remove()
		self.ph_prop = nil
	end
end

-- Returns ping for the scoreboard
function Player:ScoreboardPing()
	-- If this is not a dedicated server and player is the host
	if self:GetNWBool("ListenServerHost") then
		return "DERMA_SERVER_TAG" --return "SV"
	elseif self:IsBot() then
		return "DERMA_BOT_TAG" --return "BOT" -- otherwise this will act very strange.
	end
	-- Return normal ping value otherwise
	return self:Ping()
end

function Player:SetHealthProp( num )
	if !num then num = 0 end
	
	if IsValid(self.ph_prop) then
		self.ph_prop.health = num
	end
	self:SetHealth( num )
end

function Player:AddHealthProp( num )
	if !num then num = 0 end
	
	if self.ph_prop and IsValid(self.ph_prop) then
		self.ph_prop.health = self.ph_prop.health + num
	end
	self:SetHealth( self:Health() + num )
end

function Player:CheckUserGroup()
    local group = self:GetUserGroup()
    if PHX.SVAdmins[group] then return true end
	return false
end

function Player:PHXIsStaff()
	if (self:CheckUserGroup() or self:IsSuperAdmin()) then
		return true
	end
	return false
end

function Player:GetTauntRandMapPropCount()  -- Fake Taunt
	return self:GetNWInt("iRandMapPropCount", 0)
end

function Player:HasFakePropEntity()
	return self:GetNWBool("PlayerFakePropEnt",false)
end

function Player:HasPropPitchRotAllowed()
    return self:GetNWBool("PlayerPitchRot",false)
end

function Player:PHSetColor( ColOverride )

    if !self:Alive() or self:Team() == TEAM_UNASSIGNED or self:Team() == TEAM_SPECTATOR then return end

    local col = Vector( 0, 0, 0 )
    col = Vector( self:GetInfo("cl_playercolor") )
    
    if ColOverride and ColOverride ~= nil and isvector(ColOverride) then col = ColOverride end
    
    if self:Team() == TEAM_HUNTERS and PHX:GetCVar( "ph_enable_hunter_player_color" ) then
    
        self:SetPlayerColor( col )
        
    elseif self:Team() == TEAM_PROPS then -- and PHX:GetCVar( "ph_enable_prop_player_color" )
    
        local ph_prop = self:GetPlayerPropEntity()
        ph_prop:SetEntityColor( col )
        
    end
    
end

function Player:SetLastTauntTime( idStringID, int )
	if !idStringID or idStringID == nil then print("[:SetLastTauntTime] Error: idStringID is empty!"); return end
	if !int or int == nil or !isnumber(int) then int = 0 end
	
	if SERVER then --make this only available on serverside. in clientside, this can be unreliable.
		self:SetVar( idStringID, int )
	end
	self:SetNWFloat( idStringID, int )
end

function Player:GetLastTauntTime( idStringID, useNet )

	if useNet == nil then useNet = false end
	
	if ( useNet or CLIENT ) then
		return self:GetNWFloat( idStringID, 0.00 )
	end
	
	-- Force it
	if SERVER then
		return self:GetVar( idStringID, 0.00 )
	end
	
	-- if anything does not match any criteria:
	return 0
end

if SERVER then
    function Player:EnablePropPitchRot( bool )
        self:SetNWBool("PlayerPitchRot", bool)
    end

    function Player:CreatePlayerPropEntity()
    
        self:EnablePropPitchRot( false ) --don't allow pitch rotation. This is intentional because of bugs on ragdoll usable prop types.
        -- Todo: if this causes issues, next time: Try make kleiner's physics using 1 single solid instead.
        
        self.ph_prop = ents.Create("ph_prop")
        self.ph_prop:SetPos( self:GetPos() )
        self.ph_prop:SetAngles( self:GetAngles() )
        self.ph_prop:Spawn()
        
        if PHX:GetCVar( "ph_use_custom_plmodel_for_prop" ) then
            self.m_ShortToModel = player_manager.TranslatePlayerModel( self:GetInfo("cl_playermodel") )
            
            if table.HasValue( PHX.PROP_PLMODEL_BANS, string.lower( self.m_ShortToModel ) ) then
                self.ph_prop:SetModel("models/player/kleiner.mdl")
                self:PHXChatInfo("WARNING", "PROP_PLAYERMDL_BANNED")
            elseif table.HasValue( PHX.PROP_PLMODEL_BANS, string.lower( self:GetInfo("cl_playermodel") ) ) then
                self.ph_prop:SetModel("models/player/kleiner.mdl")
                self:PHXChatInfo("WARNING", "PROP_PLAYERMDL_BANNED")
            else
                self.ph_prop:SetModel( self.m_ShortToModel )
            end
        end
        
        self.ph_prop:SetSolid(SOLID_BBOX)
        self.ph_prop:SetOwner( self )
        self:SetNWEntity("PlayerPropEntity", self.ph_prop)
    
    end

    function Player:PHSendHullInfo( xymin, xymax, zmax, health )
        net.Start( "SetHull" )
			net.WriteVector( Vector(xymin, xymin, 0) )
			net.WriteVector( Vector(xymax, xymax, zmax) )
            net.WriteInt( health, 9 )
        net.Send(self)
    end
    
    function Player:SetPlayerLockedRot( bool )
        self:SetNWBool("PlayerLockedRotation", bool)
    end
    
    function Player:SendRotState( int )    
        net.Start( "PHX.rotateState" )
            net.WriteUInt(int, 1)
        net.Send( self )
    end
    
    function Player:PHAdjustView( hullz )
        self:SetViewOffset( Vector(0,0,hullz) )
        self:SetViewOffsetDucked( Vector(0,0,hullz) )
    end
    
    function Player:PHResetView()
        self:SetViewOffset( Vector(0,0,64) )
        self:SetViewOffsetDucked( Vector(0,0,36) )
    end

	function Player:SubTauntRandMapPropCount()
		local count = self:GetNWInt("iRandMapPropCount", 0)
		if count <= 0 then return end
		count = count - 1
		self:SetNWInt("iRandMapPropCount", count)
	end

	function Player:ResetTauntRandMapCount()
		local maxCount = PHX:GetCVar( "ph_randtaunt_map_prop_max" )
		self:SetNWInt("iRandMapPropCount", maxCount)
	end

	function Player:SetFakePropEntity( bool )
		if bool == nil then bool = false end
		self:SetNWBool("PlayerFakePropEnt", bool)
	end

	function Player:PlaceDecoyProp()
	
		if (not PHX:GetCVar( "ph_enable_decoy_reward" )) then
			self:PHXChatInfo( "ERROR", "DECOY_DISABLED" )
			return
		end
	
		if self:HasFakePropEntity() and self:Alive() and self:Team() == TEAM_PROPS then
			local trace = {}
			local dist = PHX.DecoyDistance
            local min,max = self:GetHull()
            local playercolor = self:GetInfo("cl_playercolor")
            
            trace           = GAMEMODE.ViewCam:CamColEnabled( self:EyePos(), self:EyeAngles(), trace, "start", "endpos", dist, dist, dist, max.z )
			trace.mask		= MASK_PLAYERSOLID
			trace.filter	= ents.FindByClass('ph_prop')
            table.insert(trace.filter, self)
			
			local tr = util.TraceLine( trace )
			if (tr.Hit and tr.HitNormal.z > 0.5) then
				local pos = tr.HitPos
				
				self.propdecoy = ents.Create("ph_fake_prop")
                if self.ph_prop:GetModel() == "models/player/kleiner.mdl" or
                    self.ph_prop:GetModel() == player_manager.TranslatePlayerModel( tostring(self:GetInfo("cl_playermodel")) ) then
                    self.propdecoy:SetPos( pos )
                else
                    self.propdecoy:SetPos( pos - Vector(0,0, self.ph_prop:OBBMins().z ) ) 
                end
				self.propdecoy:SetAngles( self.ph_prop:GetAngles() )
                self.propdecoy:SetfEntityColor( Vector( playercolor ) )
				self.propdecoy:Spawn()
                
				self.propdecoy:ChangeModel( self.ph_prop )
                self.propdecoy:SetOwner( self )
                
				timer.Simple(0, function() 
					self:SendSurfaceSound('buttons/lever4.wav')
				end)
				
				self:SetFakePropEntity(false)
				self:PHXChatInfo( "PRIMARY", "DECOY_PUT_SUCC" )
			else
				self:PHXChatInfo( "WARNING", "DECOY_CANT_PUT_HERE" )
			end
		end
	end
	
	function Player:SendSurfaceSound( strSnd )
		self:SendLua( 'surface.PlaySound("'..strSnd..'")' )
	end

	-- bShouldUseTheirOwnLang: Unless if you have your own language SET in your /langs/<language>.lua, Force this to TRUE.
	-- Example: msg = "MY_CUSTOM_TEXT" will be translated if bShouldUseTheirOwnLang = true. If you want regular message, just put normal text on <msg> argument.
	
	-- Todo: Add Var Args
	function Player:PHXChatPrint( msg, color, bShouldUseTheirOwnLang )
		
		if bShouldUseTheirOwnLang == nil then bShouldUseTheirOwnLang = false end
		if !color or color == nil then color = color_white end
	
		net.Start("PHX.ChatPrint")
			net.WriteString(msg)
			net.WriteColor(color)
			net.WriteBool(bShouldUseTheirOwnLang)
		net.Send(self)
	end
	
	function Player:PrintCenter( msg, color, bShowInput, nInputNum )
		
		if !color or color == nil then color = color_white end
		if bShowInput == nil then bShowInput = false end
		if !nInputNum or nInputNum == nil then nInputNum = 0 end
	
		net.Start("PHX.CenterPrint")
			net.WriteString(msg)
			net.WriteColor(color)
			net.WriteBool(bShowInput)
			net.WriteInt(nInputNum, 9)
		net.Send(self)
	end
	
	local kinds = {
		["GENERIC"]	= 0,
		["ERROR"]	= 1,
		["UNDO"]	= 2,
		["HINT"]	= 3,
		["CLEANUP"] = 4
	}
	
	-- NOTE: DUE TO NET LIBRARY LIMITATIONS,
	-- VAR ARGS CANNOT CONTAIN OBJECT/USERDATA. See: https://wiki.facepunch.com/gmod/net.ReadTable
	function Player:PHXNotify( msg, kind, time, bShouldUseTheirOwnLang, ... )
		
		if !kind then kind = "GENERIC" end
		if bShouldUseTheirOwnLang == nil then bShouldUseTheirOwnLang = false end
		if !time then time = 8 end
		if time > 30 then time = 30 end
		
		local args = {...}
		if !args then args = { false } end
		
		local t = {}
		for i=1,#args do
			t["ARG"..i] = args[i]
		end
		
		if !t then t = { ["ARG1"] = false } end
		
		net.Start("PHX.bubbleNotify")
			net.WriteString(msg)
			net.WriteUInt(kinds[kind], 3)
			net.WriteUInt(time, 5)
			net.WriteBool(bShouldUseTheirOwnLang)
			net.WriteTable(t)
		net.Send(self)
	end
	
	-- NOTE: DUE TO NET LIBRARY LIMITATIONS,
	-- VAR ARGS CANNOT CONTAIN OBJECT/USERDATA. See: https://wiki.facepunch.com/gmod/net.ReadTable
	function Player:PHXChatInfo( kind, msg , ... )
		if !kind then kind = "PRIMARY" end
		if !msg then msg = "<NO_MESSAGE>" end
		
		local args = {...}
		if !args then args = { false } end
		
		local t = {}
		for i=1,#args do
			t["ARG"..i] = args[i]
		end
		
		if !t then t = { ["ARG1"] = false } end
		
		net.Start("PHX.ChatInfo")
			net.WriteString(msg)
			net.WriteString(kind)
			net.WriteTable(t)
		net.Send(self)
	end

	function Player:IsHoldingEntity()
		if !self.LastPickupEnt then
			return false 
		end
		if !IsValid(self.LastPickupEnt) then
			return false 
		end
		
		local ent = self.LastPickupEnt
		
		if ent.LastPickupPly != self then
			return false 
		end
		
		return self.LastPickupEnt:IsPlayerHolding()
	end
	
	function Player:FreezePropMidAir()
		if !self.ispropfroze then
			self.ispropfroze = false
		end

		if self:Team() == TEAM_PROPS and self:Alive() and not self:IsOnGround() then
			
			if !self.ispropfroze then
				self:SetMoveType(MOVETYPE_NONE)
				self.ispropfroze = true
			else
				self:SetMoveType(MOVETYPE_WALK)
				self.ispropfroze = false
			end
			
		end
	end
	hook.Add("PostPlayerDeath", "PHX.ResetMoveType", function( ply ) if ply.ispropfroze then ply.ispropfroze = false end end)
	hook.Add("PlayerSpawn", "PHX.ResetMoveType_onSpawn", function( ply ) if ply.ispropfroze then ply.ispropfroze = false end end)
end