local map = game.GetMap()
local hookname="PHX.MapConfig_"..map
local DefaultColor = Vector(62/255, 88/255, 106/255)
local Shadow="shadow_control"
local Clips = {
	{ mins = Vector(1040, -273, 1000), 		maxs = Vector(-1159, -156, 1500) 	},
	{ mins = Vector(-1020, 639, -50),  		maxs = Vector(-1306, 669, 850) 		},
	{ mins = Vector(-1299, 659, -50),  		maxs = Vector(-1312, -1440, 1510) 	},
	{ mins = Vector(-1302, -1434, -371),	maxs = Vector(1042, -3500, 1500) 	},
	{ mins = Vector(1049, -1432, -50), 		maxs = Vector(1058, -217, 1400) 	}
}

local function DoMapConfig()
	PHX:VerboseMsg("[Map Config] Creating invisible walls to prevent players escaping from playable areas...")
	for _,bounds in pairs(Clips) do
		PHX:CreatePlayerClip( bounds.mins, bounds.maxs )
	end
	
	local shadows = ents.FindByClass(Shadow)
	if #shadows > 0 then
		for _,s in ipairs( shadows ) do s:Remove() end
	end
	
	PHX:VerboseMsg("[Map Config] Disabling shadows on everything!")
	local ShadowControl = ents.Create( Shadow )
	ShadowControl:SetPos( vector_origin )
	ShadowControl:SetKeyValue( "disableallshadows", "1" )
	ShadowControl:Spawn()
	ShadowControl:Activate()
	
	PHX:VerboseMsg("[Map Config] Forcing all prop players become kleiner on first spawn!")
	timer.Simple(2, function()
		for k,v in pairs(ents.FindByClass("ph_prop")) do
			v:SetModel("models/player/kleiner.mdl")
			v:DrawShadow( false )
			v:SetEntityColor(DefaultColor)
			v:SetEntColorEnabled(false)
		end
	end)
end
hook.Add("PostCleanupMap", hookname, DoMapConfig)

hook.Add("PlayerSpawn", hookname, function( ply )
	timer.Simple(0, function()
		if IsValid(ply) and ply:GetModel() == "models/player/kleiner.mdl" then ply:SetPlayerColor( DefaultColor ); end
	end)
end)