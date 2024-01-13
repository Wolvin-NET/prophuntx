AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.PrintName 	= "Prop Last Prop Standing"
ENT.Author 		= "Wolvindra-Vinzuerio"
ENT.Information	= "LPS Prop, original code LPS implementation idea to PH:E by Phyremaster (76561198154859523)"
ENT.Category 	= ""
--ENT.Editable 	= true
ENT.Spawnable 	= true
ENT.AdminOnly 	= false
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar( "Angle", 0,    "FixAngles" )
    self:NetworkVar( "Vector", 0,   "TranslatePos" )

    if (SERVER) then
        self:SetFixAngles( Angle(0,0,0) )
        self:SetTranslatePos( Vector(0,0,0) )
    end
end

function ENT:Initialize()
	self.Entity:DrawShadow( false ) -- don't draw shadows.
end

if CLIENT then
	function ENT:Draw()
		self.Entity:DrawModel()
	end
end

function ENT:ShouldDraw()
	if IsValid( self:GetOwner() ) then

		local state = GetGlobalBool( "lps_show_weapon", false )
		self:SetNoDraw( (!state or self:GetOwner():IsLPSHolstered()) and true or false )
		
	end
end

function ENT:Think()
    
    local pl = self:GetOwner()
    if IsValid(pl) && pl:Alive() then
        local maxs = 72
        local pos = pl:GetPos()
        local ph_prop = pl:GetPlayerPropEntity()
        if IsValid(ph_prop) then
            local center = ph_prop:OBBCenter().z
            pos  = ph_prop:GetPos() + Vector(0,0,center)
        end
        local fixAxis = self:GetFixAngles()
        local fixPos  = self:GetTranslatePos()
        
        local ang = pl:EyeAngles()
        
        local xPos = ang:Forward() * fixPos.x + ang:Right() * fixPos.y + ang:Up() * fixPos.z
        ang:RotateAroundAxis(ang:Right(),   fixAxis.p)
        ang:RotateAroundAxis(ang:Up(),      fixAxis.y)
        ang:RotateAroundAxis(ang:Forward(), fixAxis.r)
        
        self:SetPos(pos + xPos)
        self:SetAngles( ang )
    end
    
    if SERVER then
		-- DO NOT USE `self:ShouldDraw()` or this entity will be glitched!
        self:NextThink( CurTime() )
    elseif CLIENT then
		self:ShouldDraw()
        self:SetNextClientThink( CurTime() )
    end
    return true
    
end