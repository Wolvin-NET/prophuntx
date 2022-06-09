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

ENT.LaughsSound = {
	-- SoundDuration() is broken, we have to put this temporarily.
	{ "vo/ravenholm/madlaugh04.wav", 2.5 },
	{ "misc/fakeprop_laugh1.mp3", 11.5 },
	{ "misc/fakeprop_laugh2.mp3", 10 }
}


if SERVER then	
	
	function ENT:OnTakeDamage(dmg)
		local attacker = dmg:GetAttacker()
		local inflictor = dmg:GetInflictor()
		local owner = self:GetOwner()

		-- Health
		if GAMEMODE:InRound() and IsValid(owner) and owner:IsPlayer() and attacker:IsPlayer() and attacker:Team() == TEAM_HUNTERS and dmg:GetDamage() > 0 then
			self.health = self.health - dmg:GetDamage()
			
			if self.health <= 0 then
				hook.Call("PH_OnFakePropKilled", nil, attacker)
				
				-- Steal attacker's frags and give the frags to the owner of this prop!
				attacker:SetFrags( attacker:Frags() - 1 )
				owner:AddFrags( 1 )
				owner:PHXChatInfo( "GOOD", "DECOY_FRAGS_RECEIVED", attacker:Nick() )
				
				local targ = ents.Create("info_target")
				targ:SetPos(self:GetPos())
				targ:SetAngles(self:GetAngles())
				targ:Spawn()
				
				--todo: util.Effect for self?
				
				local randLaugh = self.LaughsSound[math.random(1,#self.LaughsSound)]
				timer.Simple(0, function()
					targ:EmitSound( randLaugh[1] , 85, math.random(80, 120) ) 
				end)
				
				SafeRemoveEntityDelayed(targ, randLaugh[2])
				
				GAMEMODE:AddDeathNotice( attacker:Nick(), -1, inflictor, "#ph_fake_prop", -1 )
				self:Remove()
			end
		end
	end
	
end