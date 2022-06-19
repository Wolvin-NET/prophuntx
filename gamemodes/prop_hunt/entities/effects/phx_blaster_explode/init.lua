local matBulge 		= Material("Effects/strider_bulge_dudv")

function EFFECT:Init(data)
	
	self.Position = data:GetOrigin()
	self.Normal = data:GetNormal()
	self.KillTime = CurTime() + 0.65
	self:SetRenderBoundsWS(self.Position + Vector()*280,self.Position - Vector()*280)
	
	local ang = self.Normal:Angle():Right():Angle() -- D :
	local emitter = ParticleEmitter(self.Position)

	for i=1,7 do
		local vec = (self.Normal + 1.2*VectorRand()):GetNormalized()
		local particle = emitter:Add("Effects/bluespark", self.Position + math.Rand(3,30)*vec)
		particle:SetVelocity(math.Rand(700,800)*vec)
		particle:SetDieTime(math.Rand(0.8,1))
		particle:SetStartAlpha(150)
		particle:SetStartSize(math.Rand(3,4))
		particle:SetEndSize(0)
		particle:SetStartLength(math.Rand(30,40))
		particle:SetEndLength(0)
		particle:SetColor(255,255,255)
		particle:SetGravity(Vector(0,0,-400))
		particle:SetAirResistance(5)
		particle:SetCollide(true)
		particle:SetBounce(0.9)
	end
	
	for i=1,15 do
		ang:RotateAroundAxis(self.Normal,math.Rand(0,360))
		local vec = ang:Forward()
		local particle = emitter:Add("particle/particle_smokegrenade", self.Position + math.Rand(5,20)*vec)
		particle:SetVelocity(math.Rand(600,1200)*vec)
		particle:SetDieTime(math.Rand(2.5,3))
		particle:SetStartAlpha(math.Rand(16,25))
		particle:SetStartSize(math.Rand(40,50))
		particle:SetEndSize(math.Rand(70,80))
		particle:SetColor(255,241,232)
		particle:SetAirResistance(600)
	end
	
	for i=1,10 do
		local vec = (self.Normal + 0.6*VectorRand()):GetNormalized()
		local particle = emitter:Add("particle/particle_smokegrenade", self.Position + math.Rand(5,20)*vec)
		particle:SetVelocity(math.Rand(1000,1500)*vec)
		particle:SetDieTime(math.Rand(2.5,3))
		particle:SetStartAlpha(math.Rand(16,25))
		particle:SetStartSize(math.Rand(40,60))
		particle:SetEndSize(math.Rand(80,90))
		particle:SetColor(255,241,232)
		particle:SetGravity(Vector(0,0,100))
		particle:SetAirResistance(500)
	end

	emitter:Finish()
	
	
	local dlight = DynamicLight(math.random(2048,4096)) --This works for some reason.  Don't ask.
	dlight.Pos = self.Position
	dlight.Size = 500
	dlight.DieTime = CurTime() + 0.2
	dlight.r = 200
	dlight.g = 200
	dlight.b = 255
	dlight.Brightness = 1
	dlight.Decay = 1000

end


function EFFECT:Think()

	if CurTime() > self.KillTime then return false end
	return true
	
end


function EFFECT:Render()
	
	local invintrplt = (self.KillTime - CurTime())/0.65
	local intrplt = 1 - invintrplt

	local size = 280 + 200*intrplt
	
	--Experimental
	local potato = math.sin(0.5*invintrplt*math.pi)
	
	self:SetRenderBoundsWS(self.Position + Vector()*size,self.Position - Vector()*size)
	
	matBulge:SetFloat("$refractamount", potato*0.16)
--	matBulge:SetMaterialFloat("$refractamount", math.sin(0.5*invintrplt*math.pi)*0.16)
	render.SetMaterial(matBulge)
	render.UpdateRefractTexture()
	render.DrawSprite(self.Position,size,size,Color(255,255,255,150*invintrplt))

end
