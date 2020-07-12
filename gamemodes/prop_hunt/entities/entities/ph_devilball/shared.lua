-- Entity information
ENT.Type = "anim"
ENT.Base = "base_anim"

function ENT:ShowEffects(ent, fx_name, v_start, v_origin)
	
	local eData = EffectData()
	eData:SetEntity(ent) -- parent
	eData:SetStart(v_start)
	eData:SetOrigin(v_origin) -- hit
	eData:SetAttachment(1)
	eData:SetMagnitude(15)
	eData:SetScale(15)
	eData:SetRadius(20)
	util.Effect(fx_name, eData, true, true)
	
end

function ENT:Think()
	-- make it rotate from client only.
	if CLIENT then
		self.Entity:SetAngles(self.Entity:GetAngles() + Angle(0,1,0))
	end
end