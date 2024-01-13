AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.model = {
	"models/dav0r/hoverball.mdl", -- R.I.P dav0r 🙏
	"models/maxofs2d/hover_basic.mdl",
	"models/maxofs2d/hover_classic.mdl",
	"models/maxofs2d/hover_rings.mdl"
}

ENT.sounds = {
	"prop_idbs/bc_pickup.wav",
	"prop_idbs/np_pickup.wav",
	"prop_idbs/venta_pickup.wav",
	"prop_idbs/biva_pickup.wav"
}

function ENT:Initialize()
	self:SetModel( self.model[math.random(1,#self.model)] )
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	
	local phys = self:GetPhysicsObject() 
	if IsValid(phys) then  		
		phys:Wake()
		phys:SetMass(20)
	end

	self:SetHealth(100)
end

function ENT:Use(activator)
	if GAMEMODE:InRound() && activator:IsPlayer() && activator:Alive() && activator:Team() == TEAM_HUNTERS then
		if activator:Team() == TEAM_HUNTERS and activator:Alive() then
			local DoItem = PHX.LUCKY_BALL.Items[math.random(1,#PHX.LUCKY_BALL.Items)]; DoItem(activator);
			hook.Call("PH_OnLuckyBallPickup", nil, activator)
			self:EmitSound( Sound( self.sounds[math.random(1,#self.sounds)] ) )
			self:Remove()
		end
	end
end

function ENT:OnTakeDamage(dmg)
	if dmg:IsDamageType(DMG_CRUSH) then dmg:ScaleDamage(2) end
	
	local hit = dmg:GetDamage()
	self:SetHealth( self:Health()-hit )
	
	if self:Health() < 0 then
		self:EmitSound(Sound("physics/glass/glass_cup_break"..math.random(1,2)..".wav"))
		self:ShowEffects(self, "cball_explode", self:GetPos(), self:GetPos())
		self:Remove()
	end
end