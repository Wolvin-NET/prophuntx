-- WARNING: THIS CODE IS UNFINISHED!!!!

-- Finds the player Player/Entities table
local Player = FindMetaTable("Player")
local Entity = FindMetaTable("Entity")
if !Player then return end
if !Entity then return end

-- Checks player hull to make sure it does not even stuck with the world/other objects.
function Entity:GetPropSize()
	local hullxymax = math.Round(math.Max(self:OBBMaxs().x-self:OBBMins().x, self:OBBMaxs().y-self:OBBMins().y))
	local hullz = math.Round(self:OBBMaxs().z - self:OBBMins().z)
	
	return hullxymax,hullz
end

function Player:CheckHull(hx,hy,hz)
	local tr = {}
	tr.start = self:GetPos()
	tr.endpos = self:GetPos()
	tr.filter = {self, self.ph_prop}
	tr.maxs = Vector(hx,hy,hz)
	tr.mins = Vector(-hx,-hy,0)
	
	local trx = util.TraceHull(tr)
	if trx.Hit then return false end
	return true
end

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

-- Player has locked prop rotation?
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
		return "SV"
	elseif self:IsBot() then
		return "BOT" -- otherwise this will act very strange.
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

if SERVER then
	function Player:ChatPrintX( msg, color )
		net.Start("PHX.ChatPrint")
			net.WriteString(msg)
			net.WriteColor(color)
		net.Send(self)
	end
	
	local kinds = {
		["GENERIC"]	= 0,
		["ERROR"]	= 1,
		["UNDO"]	= 2,
		["HINT"]	= 3,
		["CLEANUP"] = 4
	}
	
	function Player:PHXNotify( msg, kind, time )
		if !time then time = 8 end
		if time > 30 then time = 30 end
		
		net.Start("PHX.bubbleNotify")
			net.WriteString(msg)
			net.WriteUInt(kinds[kind], 3)
			net.WriteUInt(time, 5)
		net.Send(self)
	end
	
	function Player:ChatInfo( msg, kind )
		if !kind then kind = "PRIMARY" end
		net.Start("PHX.ChatInfo")
			net.WriteString(msg)
			net.WriteString(kind)
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
end