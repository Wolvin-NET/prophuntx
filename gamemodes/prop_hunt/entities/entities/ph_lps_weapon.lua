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
    self:NetworkVar( "Angle", 0, "FixAngles" )
    if (SERVER) then
        self:SetFixAngles( Angle(0,0,0) )
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
	local state = GetGlobalBool( "lps_show_weapon", 0 )
	self:SetNoDraw( !state and true or false )
end

function ENT:Think()
    
    local pl = self:GetOwner()
    if IsValid(pl) && pl:Alive() then
        local mins,maxs = pl:GetHull()
        local fixAxis = self:GetFixAngles()
        
        local pos = pl:GetPos() + Vector(0,0,maxs.z*0.6)
        local ang = pl:EyeAngles()
        ang:RotateAroundAxis(ang:Right(),   fixAxis.p)
        ang:RotateAroundAxis(ang:Up(),      fixAxis.y)
        ang:RotateAroundAxis(ang:Forward(), fixAxis.r)
        self:SetPos(pos)
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