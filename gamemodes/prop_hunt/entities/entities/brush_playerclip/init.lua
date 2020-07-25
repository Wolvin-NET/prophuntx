-- Credit to Awesome guy: D4UNKN0WNMAN :D
-- Had to place this entity for ph_kleiner maps. for purpose: Anti Exploiting.

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	local w = self.max.x - self.min.x
	local l = self.max.y - self.min.y
	local h = self.max.z - self.min.z
	
	local min = Vector(0 - (w / 2), 0 - (l / 2), 0 - (h / 2))
	local max = Vector(w / 2, l / 2, h / 2) 
	
	self:DrawShadow(false)
	self:SetCollisionBounds(min, max)
	self:SetSolid(SOLID_BBOX)
	self:SetNoDraw(true)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:SetMoveType(0)
	self:SetTrigger(false)
end