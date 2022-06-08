AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.PrintName 	= "Prop Decoy Entity"
ENT.Author 		= "Wolvindra-Vinzuerio"
ENT.Information	= "A fake prop entity, which only have 10 damage"
ENT.Category 	= ""
ENT.Editable 	= true
ENT.Spawnable 	= true
ENT.AdminOnly 	= false
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables() end

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/player/kleiner.mdl")
		self:SetLagCompensated(true)			
		self:SetMoveType(MOVETYPE_NONE)
		self:SetSolid(SOLID_BBOX)
		self.health = 10
	else
	
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end
	
function ENT:TakeModelFromMap()
	local physProp = ents.FindByClass("prop_physics*")
	local RandomProp = physProp[math.random(1, #physProp)]
	
	self:SetModel( RandomProp:GetModel() )
	self:SetCollisionBounds( RandomProp:GetCollisionBounds() )
end



if SERVER then	
	
	function ENT:OnTakeDamage(dmg)
		local attacker = dmg:GetAttacker()
		local inflictor = dmg:GetInflictor()

		-- Health
		if GAMEMODE:InRound() and attacker:IsPlayer() and attacker:Team() == TEAM_HUNTERS and dmg:GetDamage() > 0 then
			self.health = self.health - dmg:GetDamage()
			
			if self.health <= 0 then
				hook.Call("PH_OnFakePropKilled", nil, attacker)
				
				local targ = ents.Create("info_target")
				targ:SetPos(self:GetPos())
				targ:SetAngles(self:GetAngles())
				targ:Spawn()
				
				timer.Simple(0, function() targ:EmitSound( Sound("vo/ravenholm/madlaugh04.wav") , 100 ) end)
				
				SafeRemoveEntityDelayed(targ,2.5)
				self:Remove()
			end
		end
	end
	
end