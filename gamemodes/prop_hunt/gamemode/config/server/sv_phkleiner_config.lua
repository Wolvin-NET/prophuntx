-- ph_kleiner Configuration.
-- Add some Invisible Wall to prevent Exploit. Additionaly, Force all player props become Kleiner model after 0.5 seconds of respawn.

function PH_Create_PlayerClip(min, max)
	local pc = ents.Create("brush_playerclip")
	
	pc.min = min
	pc.max = max
	pc.pos = pc.max - ((pc.max - pc.min) / 2)
	
	pc:SetPos(pc.pos)
	pc:Spawn()
end


local function RemoveClipBrush()
	for _,pc in pairs(ents.FindByClass("brush_playerclip")) do
		if !IsValid(pc) then return end
		PHX.VerboseMsg("[PH_Kleiner_v2.Config] Removing Anti Exploit Brush -> #"..pc:EntIndex())
		pc:Remove()
	end
end
hook.Add("PreCleanupMap", "PH_RemoveClip", RemoveClipBrush)

local function PostCreatePlayerClip()
	if game.GetMap() == "ph_kliener_v2" && engine.ActiveGamemode() == "prop_hunt" then
		PHX.VerboseMsg("Creating Anti Exploit walls...")
		PH_Create_PlayerClip(Vector(1040, -273, 1000), Vector(-1159, -156, 1500))
		PH_Create_PlayerClip(Vector(-1020, 639, -50), Vector(-1306, 669, 850))
		PH_Create_PlayerClip(Vector(-1299, 659, -50), Vector(-1312, -1440, 1510))
		PH_Create_PlayerClip(Vector(-1302, -1434, -371), Vector(1042, -3500, 1500))
		PH_Create_PlayerClip(Vector(1049, -1432, -50), Vector(1058, -217, 1400))

		-- Force all players become Kleiner on respawn!
		timer.Simple(5, function()
			for k,v in pairs(ents.FindByClass("ph_prop")) do
				v:SetModel("models/player/kleiner.mdl")
				v:DrawShadow(false)
			end
		end)
		
		-- Disable all shadows
		local ShadowControl = ents.Create( "shadow_control" )
		ShadowControl:SetPos( Vector( 0, 0, 0 ) )
		ShadowControl:SetKeyValue( "disableallshadows", "1" )
		ShadowControl:Spawn()
		ShadowControl:Activate()
	end
end
hook.Add("PostCleanupMap", "PH_AddClipBrush", PostCreatePlayerClip)