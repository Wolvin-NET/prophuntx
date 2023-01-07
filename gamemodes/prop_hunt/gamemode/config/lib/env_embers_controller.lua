-- Original: https://gist.github.com/49efabee56a1ad4755c9a526a9026f48
-- By Vinzuerio (Wolvindra-Vinzuerio)

-- This hook is currently set on Serverside, therefore you must place this code under
-- garrysmod/lua/autorun/server/sv_env_embers_onoff_helper.lua

-- This code was made because I was too annoyed with the use function that will never show up again if the "use" input was called.

-- A Dirty Workaround was made for env_embers to control "On" and "Off". Can't guarantee if this works on shared realm.
-- It must have "Toggle" (2) spawnflags to be set. otherwise it does nothing.

-- See: https://developer.valvesoftware.com/wiki/Env_embers @ Flags: 2
-- See: https://github.com/ValveSoftware/source-sdk-2013/blob/master/sp/src/game/server/effects.cpp#L1721

-- Warning: Input Name are Case Sensitive! However you can use string.lower(inp) to accept Case Insensitiveness.
if SERVER then
	hook.Add( "AcceptInput", "env_embers_control", function( ent, inp ) -- Activator, Callers and Data are not needed.
		-- If so, if you want to specify the activator for Player or Entity, use Player(#) or Entity(1,...) instead, or it can be any entity tbh doesn't matter.
		
		if ( ent:GetClass() == "env_embers" ) and ent:HasSpawnFlags(2) then --bitsSF_EMBERS_TOGGLE, 2
			
			-- As default, we'll use Worldspawn activator instead (Required). Because env_embers does not belong to anyone.
			local ActivatorUSEr = Entity(0)
			
			-- has parent? we'll use parent entity instead.
			-- Does not matter if the entity is player or not, but our +USE simulation will always use type "USE_SET" anyway.
			local p = ent:GetParent()
			if (p) and p ~= nil and IsValid( p ) then ActivatorUSEr = p end
			
			if inp == "TurnOff" then --OR: if string.lower(inp) == "turnoff" then
				-- Simulate the "+USE" behaviour, as mentioned on https://wiki.facepunch.com/gmod/Entity:Use(function)
				-- Caller is always NULL. Or you could use ActivatorUSEr for that. It's optional to you to change this to any Player or any Trigger Entities.
				ent:Use( ActivatorUSEr, NULL, USE_SET, 0 ) 
			elseif inp == "TurnOn" then ----OR: if string.lower(inp) == "turnon" then
				ent:Use( ActivatorUSEr, NULL, USE_SET, 1 ) 
			end 
		end 

	end )

	-- If you're creating a map, Make an Input something like this:
	-- trigger_once -> OnTrigger -> env_ember -> TurnOff / TurnOn

	-- Disabled: Uncomment these to enable debugging.
	--[[
	local function TestEmbers( ply, cmd, tArg )
		local val = tArg[1]
		
		if (val) and val ~= nil and isnumber(val) then
			
			for _,emb in pairs(ents.FindByClass('env_embers')) do
				if val == 1 then
					emb:Fire("TurnOn","",0)
				elseif val == 0 then
					emb:Fire("TurnOff","",0)
				end
			end
			
		end
		
	end
	concommand.Add( 'ember_state_test', TestEmbers )
	]]--
end