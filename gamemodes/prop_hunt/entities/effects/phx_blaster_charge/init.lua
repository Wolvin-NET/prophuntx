local matPinch 		= Material("Effects/strider_pinch_dudv")
local matBlueFlash 	= Material("Sprites/strider_blackball")
local matBlueBeam	= Material("Effects/blueblacklargebeam")
matBlueFlash:SetInt("$spriterendermode",8)

function EFFECT:Init(data)
	
	self.Ent			= data:GetEntity()
	
	if not IsValid( self.Ent ) or self.Ent == NULL then return end
	
	self.Shooter        = self.Ent:GetOwner() -- currently Player.
	
	if not IsValid(self.Shooter) then return end
	
	self.Attachment     = data:GetAttachment()
	self.WeaponEnt      = self.Shooter:GetLPSWeaponEntity()
	self.KillTime       = 0
	self.ShouldRender   = false

    self.RefractScale   = 0.16
    self.SizeScale      = 1
    self.RefractSize    = 280
    self.SpriteSize     = 55
    self.BeamWidth      = 8
	
	if not self.WeaponEnt:IsValid() then return end	
	
	local Muzzle        = self.WeaponEnt:GetAttachment( self.Attachment )
	local hitpos        = self.Shooter:GetEyeTrace().HitPos
	self:SetRenderBoundsWS(Muzzle.Pos + Vector() * self.RefractSize, hitpos - Vector() * self.RefractSize)
	
	self.KillTime = CurTime() + 1.35
	self.ShouldRender = true

end


function EFFECT:Think()

	if not self.KillTime or self.KillTime == nil then return false end
	if CurTime() > self.KillTime then return false end
	if not IsValid(self.Shooter) then return false end
	if not IsValid(self.WeaponEnt) then return false end

	return true
	
end


function EFFECT:Render()

	if not self.ShouldRender then return end
	if not IsValid( self.Shooter ) then return end

	local Muzzle = 	self.WeaponEnt:GetAttachment( self.Attachment )
	if not Muzzle then return end
	
	local MuzzleAng = self.Shooter:GetAimVector()
	local RenderPos = Muzzle.Pos
	local hitpos = self.Shooter:GetEyeTrace().HitPos
	self:SetRenderBoundsWS(RenderPos + Vector()*self.RefractSize,hitpos - Vector()*self.RefractSize)	
	
	local invintrplt = (self.KillTime - CurTime())/1.35
	local intrplt = 1 - invintrplt
	
	render.SetMaterial(matBlueBeam)
	render.DrawBeam(RenderPos,hitpos,intrplt*self.BeamWidth,0,0,Color(255, 255, 255, intrplt*100))
	
	--matPinch:SetMaterialFloat("$refractamount", math.sin(0.5*intrplt*math.pi)*self.RefractScale)
	matPinch:SetFloat("$refractamount", math.sin(0.5*intrplt*math.pi)*self.RefractScale)
	render.SetMaterial(matPinch)
	render.UpdateRefractTexture()
	render.DrawSprite(RenderPos,self.RefractSize,self.RefractSize,Color(255,255,255,150))
	
	render.SetMaterial(matBlueFlash)
	if intrplt < 0.5 then
	
		local size = 2*self.SpriteSize*intrplt
		render.DrawSprite(RenderPos,size,size,Color(0,0,0,100))
		
	else
	
		local clr = 255*(2*intrplt - 1)
		render.DrawSprite(RenderPos,self.SpriteSize,self.SpriteSize,Color(clr,clr,clr,100))
		
	end


end
