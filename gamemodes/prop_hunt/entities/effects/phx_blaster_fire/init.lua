
local matBulge 		= Material("Effects/strider_bulge_dudv")
local matBlueBeam	= Material("Effects/blueblacklargebeam")

function EFFECT:Init(data)
	
	self.Shooter        = data:GetEntity():GetOwner()
	self.EndPos         = data:GetOrigin()
	self.Attachment     = data:GetAttachment()
	self.WeaponEnt      = self.Shooter:GetLPSWeaponEntity()
	self.KillTime       = 0
	self.ShouldRender   = false
	
	if not self.Shooter or not self.Shooter:IsValid() then return end
	if not self.WeaponEnt or not self.WeaponEnt:IsValid() then return end
	
	self.BeamWidth      = 32
	
	if not self.WeaponEnt:IsValid() then return end	

	local Muzzle    = 	self.WeaponEnt:GetAttachment(self.Attachment)
	
	self.RenderAng  = Muzzle.Pos - self.EndPos 
	self.RenderDist = self.RenderAng:Length()
	self.RenderAng  = self.RenderAng/self.RenderDist
	
	self.Duration   = self.RenderDist/8000
	self.KillTime   = CurTime() + self.Duration
	
	self:SetRenderBoundsWS(Muzzle.Pos + Vector()*280, self.EndPos - Vector()*280)
	
	self.ShouldRender = true

end


function EFFECT:Think()

	if CurTime() > self.KillTime then return false end
	return true
	
end


function EFFECT:Render()

	if not self.ShouldRender then return end
	
	local invintrplt    = (self.KillTime - CurTime())/self.Duration
	local intrplt       = 1 - invintrplt
	
	local RenderPos     = self.EndPos + self.RenderAng*(self.RenderDist*invintrplt)
	self:SetRenderBoundsWS(RenderPos + Vector()*280,self.EndPos - Vector()*280)
	
	matBulge:SetFloat("$refractamount", 0.16)
	render.SetMaterial(matBulge)
	render.UpdateRefractTexture()
	render.DrawSprite(RenderPos,280,280,Color(255,255,255,150))
	
	render.SetMaterial(matBlueBeam)
	render.DrawBeam(RenderPos,self.EndPos,self.BeamWidth,0,0,Color(255, 255, 255, 160))
	
end
