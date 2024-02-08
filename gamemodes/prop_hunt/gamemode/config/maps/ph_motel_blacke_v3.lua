local map = game.GetMap()
local hookname="PHX.MapConfig_"..map
local VecAdd = Vector(0,0,6)
local VecHigh = Vector(0,0,78)

local Mins = Vector(1136,762,-373)
local Maxs = Vector(-913,-1326,0)

local function DoMapConfig()

	PHX:VerboseMsg("[Map Config] Creating an invisible walls to prevent players no-clipped outside from the world...")
	PHX:CreatePlayerClip( Mins, Maxs )

	-- Add More Spawn
	local PlayerSpawns = ents.FindByClass('info_player_start')
	
	for _,v in ipairs(PlayerSpawns) do
	
		-- Move the Z up a bit.
		local pos = v:GetPos()
		v:SetPos( pos+VecAdd )
		
		-- Add New Spawn Above them
		local spawn = ents.Create( 'info_player_start' )
		spawn:SetPos( pos+VecHigh )
		spawn:SetAngles( angle_zero )
		spawn:Spawn()
	
	end

end

hook.Add("PreCleanupMap", hookname, DoMapConfig)
hook.Add("PostCleanupMap", hookname, DoMapConfig)