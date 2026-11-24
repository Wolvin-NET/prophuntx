-- ph_kleiner Configuration.
-- Add some Invisible Wall to prevent Exploit. Additionaly, Force all player props become Kleiner model after 0.5 seconds of respawn.
PHX:VerboseMsg("[Map Config] Config for 'ph_kliener_v2' has been loaded.")

local function RemoveClipBrush()
	for _,pc in pairs(ents.FindByClass("brush_playerclip")) do
		if !IsValid(pc) then return end
		PHX:VerboseMsg("[Map Config] Removing Anti Exploit Brush -> #"..pc:EntIndex())
		pc:Remove()
	end
end
hook.Add("PreCleanupMap", "PHX.ph_kliener_v2.RemoveClip", RemoveClipBrush)

local Clips = {
	{ mins = Vector(1040, -273, 1000), 		maxs = Vector(-1159, -156, 1500) 	},
	{ mins = Vector(-1020, 639, -50),  		maxs = Vector(-1306, 669, 850) 		},
	{ mins = Vector(-1299, 659, -50),  		maxs = Vector(-1312, -1440, 1510) 	},
	{ mins = Vector(-1302, -1434, -371),	maxs = Vector(1042, -3500, 1500) 	},
	{ mins = Vector(1049, -1432, -50), 		maxs = Vector(1058, -217, 1400) 	}
}

local function PostCreatePlayerClip()
	PHX:VerboseMsg("[Map Config] Creating Anti Exploit walls...")
	
	for _,bounds in pairs(Clips) do
		PHX:CreatePlayerClip(bounds.mins, bounds.maxs)
	end
	
	-- Disable all shadows
	local ShadowControl = ents.Create( "shadow_control" )
	ShadowControl:SetPos( Vector( 0, 0, 0 ) )
	ShadowControl:SetKeyValue( "disableallshadows", "1" )
	ShadowControl:Spawn()
	ShadowControl:Activate()
	
	-- Force all players become Kleiner on respawn!
	timer.Simple(2, function()
		for k,v in pairs(ents.FindByClass("ph_prop")) do
			v:SetModel("models/player/kleiner.mdl")
			v:DrawShadow( false )
			v:SetEntColorEnabled( false )
		end
	end)
end
hook.Add("PostCleanupMap", "PHX.ph_kliener_v2.config", PostCreatePlayerClip)

hook.Add("PlayerSpawn", "PHX.ph_kliener_v2.IsKleiner", function( ply )
	timer.Simple(0, function()
		if IsValid(ply) and ply:GetModel() == "models/player/kleiner.mdl" then
			ply:SetPlayerColor(Vector( 0.24, 0.34, 0.41 ))
		end
	end)
end)