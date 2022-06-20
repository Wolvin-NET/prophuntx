local matBlueFlash 	= Material("Effects/blueblackflash")
local matBlueMuzzle	= Material("Effects/bluemuzzle")
matBlueMuzzle:SetInt("$spriterendermode",9) -- 8 ?

function EFFECT:Init(data)
	
	self.Shooter        = data:GetEntity():GetOwner()
	self.Attachment     = data:GetAttachment()
	self.WeaponEnt      = self.Shooter:GetLPSWeaponEntity()
	self.KillTime       = 0
	self.ShouldRender   = false
	
    self.SpriteSize = 55
    self.FlashSize = 110
	
	if not self.WeaponEnt:IsValid() then return end	

	local Muzzle = 	self.WeaponEnt:GetAttachment(self.Attachment)
	self:SetRenderBoundsWS(Muzzle.Pos + Vector() * self.SpriteSize, Muzzle.Pos - Vector() * self.SpriteSize)

	self.KillTime = CurTime() + 2
	self.ShouldRender = true

end


function EFFECT:Think()

	if CurTime() > self.KillTime then return false end
	if not self.Shooter then return false end
	if not IsValid(self.WeaponEnt) then return false end

	return true
	
end


function EFFECT:Render()

	if not self.ShouldRender then return end

	local Muzzle    = 	self.WeaponEnt:GetAttachment(self.Attachment)
	if not Muzzle then return end
	
	local RenderPos = Muzzle.Pos
	self:SetRenderBoundsWS(RenderPos + Vector()*self.SpriteSize,RenderPos - Vector()*self.SpriteSize)	

	local invintrplt = (self.KillTime - CurTime())/2
	local intrplt = 1 - invintrplt

	local size
	
	if invintrplt > 0.8 then
		render.SetMaterial(matBlueMuzzle)
		size = 2*self.FlashSize*(invintrplt - 0.5)
		local alpha = 1275*(invintrplt - 0.8)
		render.DrawSprite(RenderPos,size,size,Color(255,255,255,alpha))
	end

	render.SetMaterial(matBlueFlash)
	size = self.SpriteSize*invintrplt
	render.DrawSprite(RenderPos,size,size,Color(255,255,255,100*invintrplt))
	

end
