-- Send required file to clients
AddCSLuaFile("sh_init.lua")
AddCSLuaFile("cl_fb_core.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_chat.lua")
AddCSLuaFile("cl_tauntwindow.lua")
AddCSLuaFile("cl_hud_mask.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_menutypes.lua")
AddCSLuaFile("cl_menu.lua")
AddCSLuaFile("cl_targetid.lua")
AddCSLuaFile("cl_autotaunt.lua")
AddCSLuaFile("cl_credits.lua")

-- Include the required lua files
include("sv_networkfunctions.lua")
include("sh_init.lua")
include("sh_config.lua")
include("sv_admin.lua")
include("sv_autotaunt.lua")
include("sv_tauntwindow.lua")
include("sv_bbox_addition.lua")

-- initial value.
SetGlobalInt("unBlind_Time", math.Clamp(PHX:GetCVar( "ph_hunter_blindlock_time" ) - (CurTime() - GetGlobalFloat("RoundStartTime", 0)), 0, PHX:GetCVar( "ph_hunter_blindlock_time" )) )

-- Server only constants
PHX.EXPLOITABLE_DOORS = {
	"func_door",
	"prop_door_rotating", 
	"func_door_rotating"
}

-- Voice Control Constant init
PHX.VOICE_IS_END_ROUND = 0

-- Update cvar to variables changes every so seconds
PHX.UPDATE_CVAR_TO_VARIABLE = 0

-- Spectator check
PHX.SPECTATOR_CHECK = 0

-- Player Join/Leave message
gameevent.Listen( "player_connect" )
hook.Add( "player_connect", "AnnouncePLJoin", function( data )
	if PHX:GetCVar( "ph_notify_player_join_leave" ) then
		for k, v in pairs( player.GetAll() ) do
			v:PHXChatInfo( "NOTICE", "EV_PLAYER_CONNECT", data.name )
		end
	end
end )

gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "AnnouncePLLeave", function( data )
	if PHX:GetCVar( "ph_notify_player_join_leave" ) then
		for k,v in pairs( player.GetAll() ) do
			v:PHXChatInfo( "NOTICE", "EV_PLAYER_DISCONNECT", data.name, data.reason )
		end
	end
end )

-- Force Close taunt window function, determined whenever the round ends, or team winning.
local function ForceCloseTauntWindow(num)
	if num == 1 then
		net.Start("PH_ForceCloseTauntWindow")
		net.Broadcast()
	elseif num == 0 then
		net.Start("PH_AllowTauntWindow")
		net.Broadcast()
	end
end

local function ClearTimer()
	if timer.Exists("tmr_handleUnblindHook") then
		timer.Remove("tmr_handleUnblindHook")
	end
end

-- Called alot
function GM:CheckPlayerDeathRoundEnd()
	if !GAMEMODE.RoundBased || !GAMEMODE:InRound() then 
		return
	end

	local Teams = GAMEMODE:GetTeamAliveCounts()

	if table.Count(Teams) == 0 then
		
		GAMEMODE:RoundEndWithResult(1001, "HUD_LOSE")
		PHX.VOICE_IS_END_ROUND = 1
		ForceCloseTauntWindow(1)
		
		PHX:PlayWinningSound( 3 ) -- 3 because for lose. You can set this to 0 or 1001 tho.
		
		hook.Call("PH_OnRoundDraw", nil)
		
		ClearTimer()
		return
	end
	if table.Count(Teams) == 1 then
		local TeamID = table.GetKeys(Teams)[1]
		
		if (TeamID == TEAM_PROPS or TeamID == TEAM_HUNTERS) then
		
			-- debug
			PHX.VerboseMsg("Round Result: "..team.GetName(TeamID).." ("..TeamID..") Wins!")
			
			-- End Round
			GAMEMODE:RoundEndWithResult(TeamID, "HUD_TEAMWIN")
			
			PHX.VOICE_IS_END_ROUND = 1
			ForceCloseTauntWindow(1)
			
			-- send the win notification
			PHX:PlayWinningSound( TeamID )
			
			hook.Call("PH_OnRoundWinTeam", nil, TeamID)
			
			ClearTimer()
			return
			
		end

	end
	
end

-- Player Voice & Chat Control to prevent Metagaming. (As requested by some server owners/suggestors.)
-- You can disable this feature by typing 'sv_alltalk 1' in console to make everyone can hear.

-- Control Player Voice
function GM:PlayerCanHearPlayersVoice(listen, speaker)
	
	local alltalk_cvar = GetConVar("sv_alltalk"):GetInt()
	if (alltalk_cvar > 0) then return true, false end
	
	-- prevent Loopback check.
	if (listen == speaker) then return false, false end

	-- Only alive players can listen other living players.
	if listen:Alive() && speaker:Alive() then return true, false end
	
	-- Event: On Round Start. Living Players don't listen to dead players.
	if PHX.VOICE_IS_END_ROUND == 0 && listen:Alive() && !speaker:Alive() then return false, false end
	
	-- Listen to all dead players while you dead.
	if !listen:Alive() && !speaker:Alive() then return true, false end
	
	-- However, Living players can be heard from dead players.
	if !listen:Alive() && speaker:Alive() then return true, false end
	
	-- Event: On Round End/Time End. Listen to everyone.
	if PHX.VOICE_IS_END_ROUND == 1 && listen:Alive() && !speaker:Alive() then return true, false end

	-- Spectator can only read from themselves.
	if listen:Team() == TEAM_SPECTATOR && listen:Alive() && speaker:Alive() then return false, false end
	
	-- This is for ULX "Permanent Gag". Uncomment this if you have some issues.
	-- if speaker:GetPData( "permgagged" ) == "true" then return false, false end
	
	-- does return true, true required here?
end

-- Control Players Chat
function GM:PlayerCanSeePlayersChat(txt, onteam, listen, speaker)
	
	if ( onteam ) then
		-- Generic Specific OnTeam chats
		if ( !IsValid( speaker ) || !IsValid( listen ) ) then return false end
		if ( listen:Team() != speaker:Team() ) then return false end
		
		-- ditto, this is same as below.
		if listen:Alive() && speaker:Alive() then return true end
		if PHX.VOICE_IS_END_ROUND == 0 && listen:Alive() && !speaker:Alive() then return false end
		if !listen:Alive() && !speaker:Alive() then return true end
		if !listen:Alive() && speaker:Alive() then return true end
		if PHX.VOICE_IS_END_ROUND == 1 && listen:Alive() && !speaker:Alive() then return true end
		if listen:Team() == TEAM_SPECTATOR && listen:Alive() && speaker:Alive() then return false end
	end
	
	local alltalk_cvar = GetConVar("sv_alltalk"):GetInt()
	if (alltalk_cvar > 0) then return true end
	
	-- Generic Checks
	if ( !IsValid( speaker ) || !IsValid( listen ) ) then return false end
	
	-- Only alive players can see other living players.
	if listen:Alive() && speaker:Alive() then return true end
	
	-- Event: On Round Start. Living Players don't see dead players' chat.
	if PHX.VOICE_IS_END_ROUND == 0 && listen:Alive() && !speaker:Alive() then return false end
	
	-- See Chat to all dead players while you dead.
	if !listen:Alive() && !speaker:Alive() then return true end
	
	-- However, Living players' chat can be seen from dead players.
	if !listen:Alive() && speaker:Alive() then return true end
	
	-- Event: On Round End/Time End. See Chat to everyone.
	if PHX.VOICE_IS_END_ROUND == 1 && listen:Alive() && !speaker:Alive() then return true end

	-- Spectator can only read from themselves.
	if listen:Team() == TEAM_SPECTATOR && listen:Alive() && speaker:Alive() then return false end
	
	return true
end

local hunterdamagefix = {
	["func_breakable"]	= true,
	["func_physbox"]	= true,
	["ph_fake_prop"]	= true
}

-- add damage return from prop to hunter

-- Called when an entity takes damage
function EntityTakeDamage(ent, dmginfo)
	local att = dmginfo:GetAttacker()
	
	-- Code from: https://facepunch.com/showthread.php?t=1500179 , Special thanks from AlcoholicoDrogadicto(http://steamcommunity.com/profiles/76561198082241865/) for suggesting this.
	if GAMEMODE:InRound() && ent && ent:IsPlayer() && ent:Alive() && ent:Team() == TEAM_PROPS && ent.ph_prop then
		-- Prevent Prop 'Friendly Fire'
		if ( dmginfo:GetAttacker():IsPlayer() && dmginfo:GetAttacker():Team() == ent:Team() ) then 
			PHX.VerboseMsg("DMGINFO::ATTACKED!!-> "..ent:Nick().."(Victim) <- "..tostring(dmginfo:GetAttacker()).."! DMGTYPE: "..dmginfo:GetDamageType())
			return
		end
		--Debug purpose.
		PHX.VerboseMsg("!! " .. ent:Name() .. "'s PLAYER entity appears to have taken damage, we can redirect it to the prop! (Model is: " .. ent.ph_prop:GetModel() .. ")")
		ent.ph_prop:TakeDamageInfo(dmginfo)
		
		return	-- don't continue below.
	end
	
	if GAMEMODE:InRound() && ent && (ent:GetClass() != "ph_prop" && !hunterdamagefix[ent:GetClass()] && PHX:IsUsablePropEntity(ent:GetClass()) && !ent:IsPlayer()) && 
		(att && att:IsPlayer() && att:Team() == TEAM_HUNTERS && att:Alive()) then		
		if att:Armor() >= 5 && PHX:GetCVar( "ph_hunter_fire_penalty" ) >= 5 then
			att:SetHealth(att:Health() - (math.Round(PHX:GetCVar( "ph_hunter_fire_penalty" )/2)))
			att:SetArmor(att:Armor() - 15)
			if att:Armor() < 0 then att:SetArmor(0) end
		else
			att:SetHealth(att:Health() - PHX:GetCVar( "ph_hunter_fire_penalty" ))
		end
		if att:Health() <= 0 then
			-- this is debug console, no need to be translated.
			MsgAll(att:Name() .. " felt guilty for hurting so many innocent props and committed suicide\n")
			att:Kill()
			
			hook.Call("PH_HunterDeathPenalty", nil, att)
		end
	end
end
hook.Add("EntityTakeDamage", "PH_EntityTakeDamage", EntityTakeDamage)

function GM:PlayerShouldTakeDamage(ply, attacker)
	
	-- Recheck: added :IsPlayer()
	-- Recheck: are they still get killed after PH_EndRoundResult? - should not be happening because of EntityTakeDamage hook
	if ( GAMEMODE.NoPlayerSelfDamage and IsValid( attacker ) and attacker:IsPlayer() and ply == attacker ) then return false end
	if ( GAMEMODE.NoPlayerDamage ) then return false end
	
	if ( GAMEMODE.NoPlayerTeamDamage and IsValid( attacker ) and attacker:IsPlayer() ) then
		if ( attacker.Team and ply:Team() == attacker:Team() and ply ~= attacker ) then return false end
	end
	
	-- Allow only prop damage to hunters
	if GAMEMODE:InRound() and ply:Team() == TEAM_HUNTERS and (IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TEAM_PROPS) then
		return true
	end
	
	if ( IsValid( attacker ) and attacker:IsPlayer() and GAMEMODE.NoPlayerPlayerDamage ) then return false end
	if ( IsValid( attacker ) and !attacker:IsPlayer() and GAMEMODE.NoNonPlayerPlayerDamage ) then return false end
	
	return true
	
end

-- Called when player tries to pickup a weapon
function GM:PlayerCanPickupWeapon(pl, ent)
	if pl:Team() != TEAM_HUNTERS then
		return false
	end
	
	return true
end

-- Don't use GM:DoPlayerDeath, we'll use hook instead.
-- Freeze Cam Fix for Hunters
hook.Add("DoPlayerDeath", "HunterFreezeCam", function(ply, attacker, dmginfo)
	if ( PHX:GetCVar( "ph_freezecam_hunter" ) && 
		ply:Team() == TEAM_HUNTERS && IsValid( attacker ) && 
		attacker:IsPlayer() && attacker ~= ply && attacker:Team() == TEAM_PROPS ) then
		
		timer.Simple(0.5, function()
			if ply and IsValid(ply) and !ply:GetNWBool("InFreezeCam", false) then
				net.Start("PlayFreezeCamSound")
				net.Send(ply)
			
				ply:SetNWEntity("PlayerKilledByPlayerEntity", attacker)
				ply:SetNWBool("InFreezeCam", true)
				ply:SpectateEntity( attacker )
				ply:Spectate( OBS_MODE_FREEZECAM )
			end
		end)
		
		timer.Simple(4.5, function()
			if ply and IsValid(ply) and ply:GetNWBool("InFreezeCam", false) then
				local randHunter = {}
				for _,v in pairs(team.GetPlayers(TEAM_HUNTERS)) do
					if v:Alive() then
						table.insert(randHunter, v)
					end
				end
				
				ply:SetNWBool("InFreezeCam", false)
				ply:Spectate( OBS_MODE_CHASE )
				if #randHunter > 0 then
					local huntPly = randHunter[math.random(1,#randHunter)]
					ply:SpectateEntity( huntPly )
				else
					ply:SpectateEntity( nil )
				end
			end
		end)
		
	end
end)

local phx_blind_unlocktime = 0
-- function to respawn players during blind mode.
-- this is usually noticed when the player is falling, changing team, or etc.
local function AutoRespawnCheck(ply)

	-- Require at least 3 players.
	if PHX:GetCVar( "ph_allow_respawnonblind" ) and player.GetCount() > 2 and (ply:Team() == TEAM_PROPS or ply:Team() == TEAM_HUNTERS) then
	
		if CurTime() < phx_blind_unlocktime then
			timer.Simple(math.random(0.5,1), function() if 
				IsValid(ply) then
					local tim = PHX:GetCVar( "ph_allow_respawnonblind_team_only" )
					if tim > 0 and ply:Team() == tim then
						ply:Spawn()
						ply:PHXChatInfo( "NOTICE", "BLIND_RESPAWN_TEAM", team.GetName( tim ), math.Round(phx_blind_unlocktime - CurTime()) )
					elseif tim == 0 then
						ply:Spawn()
						ply:PHXChatInfo( "NOTICE", "BLIND_RESPAWN", math.Round(phx_blind_unlocktime - CurTime()) )
					end
				end 
			end)
		end
	
	end
	
end
hook.Add("PostPlayerDeath", "autoPlayerRepsawnDuringDeath", AutoRespawnCheck)

function GM:PlayerChangedTeam(ply, old, new)
	if PHX:GetCVar( "ph_allow_respawn_from_spectator" ) and (old == TEAM_SPECTATOR && (new == TEAM_HUNTERS or new == TEAM_PROPS)) then
		timer.Simple(math.random(0.5,1), function()
			if IsValid(ply) then AutoRespawnCheck( ply ) end
		end)
	end
	
	-- not recommended if this enabled. See: "help ph_allow_respawnonblind_teamchange" in the console for more information.
	if PHX:GetCVar( "ph_allow_respawnonblind_teamchange" ) and ( (old == TEAM_HUNTERS and new == TEAM_PROPS) or (old == TEAM_PROPS and new == TEAM_HUNTERS) ) then
		timer.Simple(math.random(0.5,1), function()
			if IsValid(ply) then AutoRespawnCheck( ply ) end
		end)
	end
end

hook.Add("OnPlayerChangedTeam", "TeamChange_switchLimitter", function(ply, old, new)
	local MAX_TEAMCHANGE_LIMIT = PHX:GetCVar( "ph_max_teamchange_limit" )

	if MAX_TEAMCHANGE_LIMIT ~= -1 and (not ply:IsBot()) and !ply:CheckUserGroup() then
		if new ~= TEAM_SPECTATOR then
			ply.ChangeLimit = ply.ChangeLimit + 1
			ply:PHXChatInfo("WARNING", "CHAT_SWAPTEAM_WARNING", ply.ChangeLimit, MAX_TEAMCHANGE_LIMIT)
			PHX.VerboseMsg("[PHX] "..ply:Nick().." has switched team "..ply.ChangeLimit.."x.")
		end
		
		if ply.ChangeLimit > MAX_TEAMCHANGE_LIMIT and new ~= TEAM_SPECTATOR then
			ply.ChangeLimit = MAX_TEAMCHANGE_LIMIT
			timer.Simple(0.3, function()
				if old ~= TEAM_SPECTATOR then
					ply:SetTeam(old)
					ply:PHXChatInfo("ERROR", "CHAT_SWAPTEAM_REVERT", team.GetName(new))
					PHX.VerboseMsg("[PHX] Reverting "..ply:Nick().."\'s team to "..team.GetName(old))
				end
			end)
		end
	end
end)

function PHX.ResetStuffs()
	-- Force close any taunt menu windows
	ForceCloseTauntWindow(0)
	-- Extra additional
	PHX.VOICE_IS_END_ROUND = 0
	
	-- Called every round restart: make sure this was set publicly and make it synced accross clients.
	SetGlobalInt("unBlind_Time", math.Clamp(PHX:GetCVar( "ph_hunter_blindlock_time" ) - (CurTime() - GetGlobalFloat("RoundStartTime", 0)), 0, PHX:GetCVar( "ph_hunter_blindlock_time" )) )
	
	local cvarPercent	= PHX:GetCVar( "ph_blindtime_respawn_percent" )
	local blindTime		= GetGlobalInt("unBlind_Time", 0)
	local percent		= blindTime * cvarPercent
	phx_blind_unlocktime = CurTime() + percent
	
	timer.Create("tmr_handleUnblindHook", blindTime, 1, function()
		hook.Call("PH_BlindTimeOver")
	end)
end
hook.Add("PostCleanupMap", "PH_ResetCustomTauntWindow", PHX.ResetStuffs)

-- Make a variable for 4 unique combines.
-- Clean up, sorry btw.
local playerModels = {
	"combine",
	"combineprison",
	"combineelite",
	"police"
	-- you may add more here.
}

-- Additional HLA: Combine Models -- this is OPTIONAL.
--[[
	Models can be found at:
	https://steamcommunity.com/sharedfiles/filedetails/?id=2109019567
	https://steamcommunity.com/sharedfiles/filedetails/?id=2068446620
	https://steamcommunity.com/sharedfiles/filedetails/?id=2064138107
	https://steamcommunity.com/sharedfiles/filedetails/?id=2059548654
	https://steamcommunity.com/sharedfiles/filedetails/?id=2035168341
]]
local HLAModels = {
    "models/hlvr/characters/combine/grunt/combine_grunt_hlvr_player.mdl",
    "models/hlvr/characters/combine/grunt/combine_beta_grunt_hlvr_player.mdl",
    "models/hlvr/characters/combine_captain/combine_captain_hlvr_player.mdl",
    "models/hlvr/characters/combine/suppressor/combine_suppressor_hlvr_player.mdl",
    "models/hlvr/characters/combine/heavy/combine_heavy_hlvr_player.mdl",
    "models/hlvr/characters/hazmat_worker/hazmat_worker_player.mdl",
    "models/hlvr/characters/worker/worker_player.mdl"
}
-- Check if HLA Playermodels exists.
if (PHX:GetCVar( "ph_add_hla_combine" )) then
	for _,model in pairs(HLAModels) do
		if (file.Exists(model, "GAME")) then
			local hlacombine = player_manager.TranslateToPlayerModelName(model)
			if (hlacombine ~= "kleiner") then
				PHX.VerboseMsg("[PHX] HLA Model found: " .. hlacombine .. ", adding to random combine model list...")
				table.insert(playerModels, hlacombine)
			end
		end
	end
end

function GM:PlayerSetModel(pl)
	
	-- player actual model to prevent multi-damage hitbox.
	local player_model = "models/props_idbs/phenhanced/box.mdl"

	if PHX:GetCVar( "ph_use_custom_plmodel" ) then
		-- Use a delivered player model info from cl_playermodel ConVar.
		-- This however will use a custom player selection. It'll immediately apply once it is selected.
		local mdlinfo = pl:GetInfo("cl_playermodel")
		local mdlname = player_manager.TranslatePlayerModel(mdlinfo)

		if pl:Team() == TEAM_HUNTERS then
			player_model = mdlname
		end
	else
		-- Otherwise, Use Random one based from a table above.
		local customModel = table.Random(playerModels)
		local customMdlName = player_manager.TranslatePlayerModel(customModel)

		if pl:Team() == TEAM_HUNTERS then
			player_model = customMdlName
		end
	end
	
	-- precache and Set the model.
	util.PrecacheModel(player_model)
	pl:SetModel(player_model)
end

-- The [E] & Mouse Click 1 behaviour is now moved in here!
function GM:PlayerExchangeProp(pl, ent)

	if !IsValid(pl) then return; end
	if !IsValid(ent) then return; end

	if pl:Team() == TEAM_PROPS && pl:IsOnGround() && !pl:Crouching() && PHX:IsUsablePropEntity(ent:GetClass()) && ent:GetModel() then
		if table.HasValue(PHX.BANNED_PROP_MODELS, ent:GetModel()) then
			pl:ChatPrint("[PHX] Notice: That prop has been banned from the server.")
		elseif IsValid(ent:GetPhysicsObject()) && (pl.ph_prop:GetModel() != ent:GetModel() || pl.ph_prop:GetSkin() != ent:GetSkin()) then
			local ent_health = math.Clamp(ent:GetPhysicsObject():GetVolume() / 250, 1, 200)
			local new_health = math.Clamp((pl.ph_prop.health / pl.ph_prop.max_health) * ent_health, 1, 200)
			pl.ph_prop.health = new_health
			
			pl.ph_prop.max_health = ent_health
			pl.ph_prop:SetModel(ent:GetModel())
			pl.ph_prop:SetSkin(ent:GetSkin())
			pl.ph_prop:SetSolid(SOLID_VPHYSICS)
			pl.ph_prop:SetPos(pl:GetPos() - Vector(0, 0, ent:OBBMins().z))
			pl.ph_prop:SetAngles(pl:GetAngles())
			
			-- Special Prop Entity: ph_luckyball (if Prop Type == 3)
			if ent:GetClass() == "ph_luckyball" then
				pl.ph_prop:SetColor(ent:GetColor())
			else
				pl.ph_prop:SetColor(color_white)
			end
			
			pl:SetHealth(new_health)
			
			if PHX:GetCVar( "ph_sv_enable_obb_modifier" ) && ent:GetNWBool("hasCustomHull",false) then
				local hmin	= ent.m_Hull[1]
				local hmax 	= ent.m_Hull[2]
				local dmin	= ent.m_dHull[1]
				local dmax	= ent.m_dHull[2]
				
				if hmax.z < 24 || dmax.z < 24 then
					pl:SetViewOffset(Vector(0,0,24))
					pl:SetViewOffsetDucked(Vector(0,0,24))
				elseif hmax.z > 84 || dmax.z > 84 then --what the heck Duck Size is 84? BigMomma.mdl?
					pl:SetViewOffset(Vector(0,0,84))
					pl:SetViewOffsetDucked(Vector(0,0,84))
				else
					pl:SetViewOffset(Vector(0,0,hmax.z))
					pl:SetViewOffsetDucked(Vector(0,0,dmax.z))
				end
				
				pl:SetHull(hmin,hmax)
				pl:SetHullDuck(dmin,dmax)
				
				net.Start("SetHull")
					net.WriteInt(math.Round(math.Max(hmax.x,hmax.y)),32)
					net.WriteInt(hmax.z,32)
					net.WriteInt(dmax.z,32)
					net.WriteInt(new_health,9)
				net.Send(pl)
			elseif ent:GetClass() == "prop_ragdoll" then -- Add: 'PHX:GetCVar( "ph_usable_prop_type" ) >= 3' for extra check.
				-- Reset to default 72 normal and 36 for duck for ANY KIND OF RAGDOLLS. This doesn't mater how big or how small it is
				-- because we don't want to fuck up Prop's bbox which is copied from Ragdoll's dynamic collission bounds/BBOX.
				-- Use Ragdolls at your own risk!
				
				pl:SetHull(Vector(-16, -16, 0), Vector(16, 16, 72))
				pl:SetHullDuck(Vector(-16, -16, 0), Vector(16, 16, 36))
				
				pl:SetViewOffset(Vector(0,0,72))
				pl:SetViewOffsetDucked(Vector(0,0,36))
				
				pl:SetHealth(100)
				pl.ph_prop:SetSolid(SOLID_BBOX)
				pl.ph_prop.health 		= 100
				pl.ph_prop.max_health 	= 100
				
				net.Start("SetHull")
					net.WriteInt(16, 32) -- x/y width
					net.WriteInt(72, 32) -- normal
					net.WriteInt(36, 32) -- duck
					net.WriteInt(100, 9) -- health
				net.Send(pl)
				
			else
				local hullxymax = math.Round(math.Max(ent:OBBMaxs().x, ent:OBBMaxs().y))
				local hullxymin = hullxymax * -1
				local hullz = math.Round(ent:OBBMaxs().z - ent:OBBMins().z)
				
				local dhullz = hullz
				if hullz > 10 && hullz <= 30 then
					dhullz = hullz-(hullz*0.5)
				elseif hullz > 30 && hullz <= 40 then
					dhullz = hullz-(hullz*0.2)
				elseif hullz > 40 && hullz <= 50 then
					dhullz = hullz-(hullz*0.1)
				else
					dhullz = hullz
				end
			
				if hullz < 24 then
					pl:SetViewOffset(Vector(0,0,24))
					pl:SetViewOffsetDucked(Vector(0,0,24))
				elseif hullz > 84 then
					pl:SetViewOffset(Vector(0,0,84))
					pl:SetViewOffsetDucked(Vector(0,0,84))
				else
					pl:SetViewOffset(Vector(0,0,hullz))
					pl:SetViewOffsetDucked(Vector(0,0,dhullz))
				end
			
				pl:SetHull(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
				pl:SetHullDuck(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, dhullz))
			
				net.Start("SetHull")
					net.WriteInt(hullxymax, 32)
					net.WriteInt(hullz, 32)
					net.WriteInt(dhullz, 32)
					net.WriteInt(new_health, 9)
				net.Send(pl)
			end
		end
		
		hook.Call("PH_OnChangeProp", nil, pl, ent)
	end
	
end

-- Called when a player tries to use an object. By default this pressed ['E'] button. MouseClick 1 will be mentioned below at line @351
function GM:PlayerUse(pl, ent)
	if !pl:Alive() || pl:Team() == TEAM_SPECTATOR || pl:Team() == TEAM_UNASSIGNED then return false; end
	
	-- Prevent Execution Spam by holding ['E'] button too long.
	if pl:Team() == TEAM_PROPS && pl.UseTime <= CurTime() then
		
		local hmx, hz = ent:GetPropSize()
		if PHX:GetCVar( "ph_check_props_boundaries" ) && !pl:CheckHull(hmx, hmx, hz) then
			pl:PHXChatInfo("WARNING", "CHAT_PROP_NO_ROOM")
		else
			local proptype = PHX:GetCVar( "ph_usable_prop_type" )
			if ( proptype >= 3 && PHX.CVARUseAbleEnts[proptype][ent:GetClass()] ) then
				if PHX:QCVar( "ph_usable_prop_type_notice" ) then
					pl:PrintCenter( "NOTIFY_PROP_ENTTYPE" )
				end
			else
				self:PlayerExchangeProp(pl, ent)
			end
		end
		
		pl.UseTime = CurTime() + 1
		
	end
	
	-- control who can pick up objects
	if PHX:IsUsablePropEntity(ent:GetClass()) then
		local state = PHX:GetCVar( "ph_allow_pickup_object" )
	
		if state <= 0 then
			return false
		elseif (state == 1 or state == 2) then
			if pl:Team() ~= state then return false end
		end
	end
	
	
	-- Prevent the door exploit
	if table.HasValue(PHX.EXPLOITABLE_DOORS, ent:GetClass()) && pl.last_door_time && pl.last_door_time + 1 > CurTime() then
		return false
	end
	
	pl.last_door_time = CurTime()
	return true
end

-- Called when a player leaves
function PlayerDisconnected(ply)
	ply:RemoveProp()
    
    if IsValid(ply.propdecoy) then
        ply.propdecoy:SetOwner(NULL)
        ply.propdecoy = nil
    end
	
	-- Save player Change Team info -- this will reset after map has been changed
	if PHX:GetCVar( "ph_max_teamchange_limit" ) ~= -1 and !ply:CheckUserGroup() and (not ply:IsBot()) then
	
		local id = ply:SteamID()
		PHX.CurPlys[id] = ply.ChangeLimit
		
		PHX.VerboseMsg("[PHX] Saving player team change information of "..ply:Nick().." ("..ply:SteamID()..") -> ["..ply.ChangeLimit.."]")
		
	end
end
hook.Add("PlayerDisconnected", "PH_PlayerDisconnected", PlayerDisconnected)

-- Set specific variable for checking in player initial spawn, then use Player:IsHoldingEntity()
PHX.CurPlys = {}
hook.Add("PlayerInitialSpawn", "PHX.SetupInitData", function(ply)
	if not PHX.cvarsynced then PHX:InitCVar() end

	ply.LastPickupEnt	= NULL
	ply.UseTime			= 0
	ply.ChangeLimit		= 0
	
	-- Player Switch Teams Initialisations	
	if IsValid(ply) && PHX:GetCVar( "ph_max_teamchange_limit" ) ~= -1 && !ply:CheckUserGroup() && !ply:IsBot() then
		
		local id = ply:SteamID()
		PHX.CurPlys[id] = PHX.CurPlys[id] or 0
		
		if PHX.CurPlys[id] == 0 then
			ply.ChangeLimit = 0
			PHX.VerboseMsg("[PHX] "..ply:Nick().."'s team switch limit initialised.")
		elseif PHX.CurPlys[id] > 0 then
			ply.ChangeLimit = PHX.CurPlys[id]
			PHX.VerboseMsg("[PHX] "..ply:Nick().."'s has "..tostring(PHX.CurPlys[id]).."x team switches remaining.")
		end
		
	end
	
	-- Info Player Spawns
	timer.Simple(3.5, function()
		if PHX:GetCVar( "ph_notify_player_join_leave" ) then
			for k,v in pairs( player.GetAll() ) do
				if (IsValid(v) and IsValid(ply)) then
					v:PHXChatInfo( "NOTICE", "EV_PLAYER_JOINED", ply:Nick() )
				end
			end
		end
	end)

end)

hook.Add("AllowPlayerPickup", "PHX.IsHoldingEntity", function(ply,ent)
	ply.LastPickupEnt = ent
	ent.LastPickupPly = ply
end)

-- Spray Controls
hook.Add( "PlayerSpray", "PH.GeneralSprayFunc", function( ply )
	if ( ( !ply:Alive() ) || ( ply:Team() == TEAM_SPECTATOR ) ) then
		return true
	end
end )

-- Called when the players spawns
function PlayerSpawn(pl)
	pl:SetNWBool("PlayerLockedRotation", false)
	pl:SetNWBool("InFreezeCam", false)
	pl:SetNWEntity("PlayerKilledByPlayerEntity", nil)
	pl:Blind(false)
	pl:RemoveProp()
	pl:SetColor(Color(255,255,255,255))
	pl:SetRenderMode(RENDERMODE_TRANSALPHA)
	pl:UnLock()
	pl:ResetHull()
	pl:SetNWFloat("LastTauntTime", CurTime())
    -- Reset Fake taunts
	pl:ResetTauntRandMapCount()
	
    pl.last_taunt_time = 0
    pl.propdecoy = nil -- don't link to your decoy prop
	
	net.Start("ResetHull")
	net.Send(pl)
	
	net.Start("DisableDynamicLight")
	net.Send(pl)
	
	pl:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
	pl:CollisionRulesChanged()
	
	if pl:Team() == TEAM_HUNTERS then
		pl:SetJumpPower(160)
	elseif pl:Team() == TEAM_PROPS then
		pl:SetJumpPower(160 * PHX:GetCVar( "ph_prop_jumppower" ))
	end

	-- Listen server host
	if !game.IsDedicated() then
		pl:SetNWBool("ListenServerHost", pl:IsListenServerHost())
	end
end
hook.Add("PlayerSpawn", "PH_PlayerSpawn", PlayerSpawn)


-- Called when round ends
function RoundEnd()
	-- Unblind the hunters
	for _, pl in pairs(team.GetPlayers(TEAM_HUNTERS)) do
		pl:Blind(false)
		pl:UnLock()
	end
	
	-- Give rewards for living props for a decoy
	for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
		if PHX:GetCVar( "ph_enable_decoy_reward" ) and pl:Alive() and pl:Health() > 0 and (not pl:HasFakePropEntity()) then
			pl:SetFakePropEntity(true)
			pl:PHXChatPrint( "DECOY_GET_REWARD", Color(50,248,56), true )
		end
	end
	
	-- Stop autotaunting
	net.Start("AutoTauntRoundEnd")
	net.Broadcast()
end
hook.Add("PH_RoundEnd", "PHX.RoundIsEnd", RoundEnd)


-- This is called when the round time ends (props win)
function GM:RoundTimerEnd()
	if !GAMEMODE:InRound() then
		return
	end

	GAMEMODE:RoundEndWithResult(TEAM_PROPS, "HUD_TEAMWIN")
	PHX.VOICE_IS_END_ROUND = 1
	ForceCloseTauntWindow(1)
	
	PHX:PlayWinningSound( TEAM_PROPS )
	
	hook.Call("PH_OnTimerEnd", nil)
end


-- Called before start of round
function GM:OnPreRoundStart(num)
	game.CleanUpMap()
	
	if GetGlobalInt("RoundNumber") != 1 && (PHX:GetCVar( "ph_swap_teams_every_round" ) || ((team.GetScore(TEAM_PROPS) + team.GetScore(TEAM_HUNTERS)) > 0)) then
		for _, pl in pairs(player.GetAll()) do
		
			if pl:Team() == TEAM_PROPS || pl:Team() == TEAM_HUNTERS then
			
				if pl:Team() == TEAM_PROPS then
					pl:SetTeam(TEAM_HUNTERS)
				else
					pl:SetTeam(TEAM_PROPS)
                    if pl:HasFakePropEntity() then pl:PHXChatInfo( "GOOD", "DECOY_REMINDER_GET" ) end
					if PHX:GetCVar( "ph_notice_prop_rotation" ) then
						timer.Simple(0.5, function() 
							pl:PHXNotify( "NOTIFY_IN_PROP_TEAM", "UNDO", 20, true )
						end)
						pl:PHXNotify( "NOTIFY_ROTATE_NOTICE", "GENERIC", 18, true ) -- the R key need to be added from binder.
					end
					
					if PHX:GetCVar( "ph_usable_prop_type" ) > 2 then
						timer.Simple(0.75, function()
							pl:PHXChatInfo("NOTICE", "NOTIFY_CUST_ENT_TYPE_IS_ON")
						end)
					end
				end
			
			pl:PHXChatInfo("NOTICE", "CHAT_SWAP")
			end
		end
		
		-- Props will gain a Bonus Armor points Hunter teams has more than 4 players in it. More player means more armor they can get.
		timer.Simple(1, function()
			local NumHunter = table.Count(team.GetPlayers(TEAM_HUNTERS))
			if NumHunter >= 4 && NumHunter <= 8 then
				for _,prop in pairs(team.GetPlayers(TEAM_PROPS)) do
					if IsValid(prop) then prop:SetArmor(math.random(1,3) * 15) end
				end
			elseif NumHunter > 8 then
				for _,prop in pairs(team.GetPlayers(TEAM_PROPS)) do
					if IsValid(prop) then prop:SetArmor(math.random(3,7) * 15) end
				end
			end
		end)
		
		hook.Call("PH_OnPreRoundStart", nil, PHX:GetCVar( "ph_swap_teams_every_round" ))
	end
	
	-- temporary team balance option, we set "TRUE" to make sure player isn't killed during team switch.
	if PHX:GetCVar( "ph_enable_teambalance" ) then
		GAMEMODE:CheckTeamBalance(true)
	end
	
	UTIL_StripAllPlayers()
	UTIL_SpawnAllPlayers()
	UTIL_FreezeAllPlayers()
end


-- Called every server tick.
function GM:Think()	
	-- Prop spectating is a bit messy so let us clean it up a bit
	if PHX.SPECTATOR_CHECK < CurTime() then
		for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
			if IsValid(pl) && !pl:Alive() && pl:GetObserverMode() == OBS_MODE_IN_EYE then
				hook.Call("ChangeObserverMode", GAMEMODE, pl, OBS_MODE_ROAMING)
			end
		end
		PHX.SPECTATOR_CHECK = CurTime() + PHX.SPECTATOR_CHECK_ADD
	end
end

-- Bonus Drop :D
function PH_Props_OnBreak(ply, ent)
	if PHX:GetCVar( "ph_enable_lucky_balls" ) then
		if IsValid(ent) then
			local pos = ent:GetPos()
			if math.random() < 0.08 then -- 8% Chance of drops.
				local dropent = ents.Create("ph_luckyball")
				if IsValid(dropent) then
					dropent:SetPos(Vector(pos.x, pos.y, pos.z + 32)) -- to make sure the Lucky Ball didn't fall underground.
					dropent:SetAngles(Angle(0,0,0))
					dropent:SetColor(Color(math.Round(math.random(0,255)),math.Round(math.random(0,255)),math.Round(math.random(0,255)),255))
					dropent:Spawn()
				end
			end
		end
	end
end
hook.Add("PropBreak", "Props_OnBreak_WithDrops", PH_Props_OnBreak)

-- Force Close the Taunt Menu whenever the prop is being killed.
function close_PlayerKilledSilently(ply)
	net.Start( "PH_ForceCloseTauntWindow" )
	net.Send(ply)
end
hook.Add("PlayerSilentDeath", "Silent.Taunt_ForceClose", function(ply)
	if ply:Team() == TEAM_PROPS then close_PlayerKilledSilently(ply) end
end)
hook.Add("PlayerDeath", "Taunt_ForceClose", function(ply)
	if ply:Team() == TEAM_HUNTERS then close_PlayerKilledSilently(ply) end
end)

-- Flashlight toggling
function GM:PlayerSwitchFlashlight(pl, on)
	if pl:Alive() && pl:Team() == TEAM_HUNTERS then
		return true
	end
	
	if pl:Alive() && pl:Team() == TEAM_PROPS then
		net.Start("PlayerSwitchDynamicLight")
		net.Send(pl)
	end
	
	return false
end

-- Round Control
cvars.AddChangeCallback("ph_min_waitforplayers", function(cvar, old, new)
	if tonumber(new) < 1 then
		RunConsoleCommand("ph_min_waitforplayers", "1")
		print("[PHX] Warning: Value must not be 0! Use ph_waitforplayers 0 to disable.")
	end
end)

local bAlreadyStarted = false
function GM:OnRoundEnd( num )
	-- Check if PHX:GetCVar( "ph_waitforplayers" ) is true
	-- This is a fast implementation for a waiting system
	-- Make optimisations if needed
	if ( PHX:GetCVar( "ph_waitforplayers" ) ) then
		-- Take away a round number quickly before it adds another when there are not enough players
		-- Set to false
		if ( ( team.NumPlayers( TEAM_HUNTERS ) < PHX:GetCVar( "ph_min_waitforplayers" ) ) || ( team.NumPlayers( TEAM_PROPS ) < PHX:GetCVar( "ph_min_waitforplayers" ) ) ) then
			bAlreadyStarted = false
		end

		-- Set to true
		if ( ( team.NumPlayers( TEAM_HUNTERS ) >= PHX:GetCVar( "ph_min_waitforplayers" ) ) && ( team.NumPlayers( TEAM_PROPS ) >= PHX:GetCVar( "ph_min_waitforplayers" ) ) ) then
			bAlreadyStarted = true
		end
		
		-- Check if the round was already started before so we count it as a fully played round
		if ( !bAlreadyStarted ) then
			SetGlobalInt( "RoundNumber", GetGlobalInt("RoundNumber") - 1 )
		end
	end
	
	-- forgot to add this; Remove handleUnblindHook
	ClearTimer()
	
	hook.Call("PH_OnRoundEnd", nil, num)
	
end

function GM:RoundStart()

	local roundNum = GetGlobalInt( "RoundNumber" );
	local roundDuration = GAMEMODE:GetRoundTime( roundNum )
	
	GAMEMODE:OnRoundStart( roundNum )

	timer.Create( "RoundEndTimer", roundDuration, 0, function() GAMEMODE:RoundTimerEnd() end )
	timer.Create( "CheckRoundEnd", 1, 0, function() GAMEMODE:CheckRoundEnd() end )
	
	SetGlobalFloat( "RoundEndTime", CurTime() + roundDuration );
	
	-- Check if PHX:GetCVar( "ph_waitforplayers" ) is true
	-- This is a fast implementation for a waiting system
	-- Make optimisations if needed
	if ( PHX:GetCVar( "ph_waitforplayers" ) ) then
	
		-- Pause these timers if there are not enough players on the teams in the server
		if ( ( team.NumPlayers( TEAM_HUNTERS ) < PHX:GetCVar( "ph_min_waitforplayers" ) ) || ( team.NumPlayers( TEAM_PROPS ) < PHX:GetCVar( "ph_min_waitforplayers" ) ) ) then
		
			if ( timer.Exists( "RoundEndTimer" ) && timer.Exists( "CheckRoundEnd" ) ) then
			
				timer.Pause( "RoundEndTimer" )
				timer.Pause( "CheckRoundEnd" )
			
				SetGlobalFloat( "RoundEndTime", -1 );
			
				for _,pl in pairs (player.GetAll()) do
					pl:PHXChatInfo("ERROR", "CHAT_NOPLAYERS")
				end
				-- Reset the team score
				team.SetScore(TEAM_PROPS, 0)
				team.SetScore(TEAM_HUNTERS, 0)
			end
		
		end
	
	end
	
	-- Send this as a global boolean
	SetGlobalBool( "RoundWaitForPlayers", PHX:GetCVar( "ph_waitforplayers" ) )
	
	hook.Call("PH_RoundStart", nil)
	
end
-- End of Round Control Override

-- Player pressed a key
function PlayerPressedKey(pl, key)
	-- Use traces to select a prop
	local min,max = pl:GetHull()
	if pl && pl:IsValid() && pl:Alive() && pl:Team() == TEAM_PROPS then
		plhullz = max.z
	
		if key == IN_ATTACK then
			local trace = {}
			-- Wolvin: careful and pay attention after modifying cl_init's cHullz min & max, where min = 24, max = 84 in here.
			if plhullz < 24 then
				trace.start = pl:EyePos() + Vector(0, 0, plhullz + (24 -  plhullz))
				trace.endpos = pl:EyePos() + Vector(0, 0, plhullz + (24 - plhullz)) + pl:EyeAngles():Forward() * 100
			elseif plhullz > 84 then
				trace.start = pl:EyePos() + Vector(0, 0, plhullz - 84)
				trace.endpos = pl:EyePos() + Vector(0, 0, plhullz - 84) + pl:EyeAngles():Forward() * 300
			else
				trace.start = pl:EyePos() + Vector(0, 0, 8)
				trace.endpos = pl:EyePos() + Vector(0, 0, 8) + pl:EyeAngles():Forward() * 100
			end
			--trace.filter = ents.FindByClass("ph_prop")
			--Fix by Codingale: https://github.com/Codingale, https://github.com/prop-hunt-enhanced/prop-hunt-enhanced/pull/11
			local filter = {} -- We need to filter out players and the ph_prop.

			for k,v in pairs(ents.GetAll()) do
				if v:GetClass() == "ph_prop" or string.lower(v:GetClass()) == "player" then
					table.insert(filter, v)
				end
			end

			trace.filter = filter
			
			local trace2 = util.TraceLine(trace) 
			if trace2.Entity && trace2.Entity:IsValid() && PHX:IsUsablePropEntity(trace2.Entity:GetClass()) then
				if pl.UseTime <= CurTime() then
					if !pl:IsHoldingEntity() then
						local hmx, hz = trace2.Entity:GetPropSize()
						if PHX:GetCVar( "ph_check_props_boundaries" ) && !pl:CheckHull(hmx, hmx, hz) then
							pl:PHXChatInfo("WARNING", "CHAT_PROP_NO_ROOM")
						else
							GAMEMODE:PlayerExchangeProp(pl, trace2.Entity)
						end
					end
					pl.UseTime = CurTime() + 1
				end
			end
		end
	end
	
end
hook.Add("KeyPress", "PlayerPressedKey", PlayerPressedKey)

hook.Add("PlayerButtonDown", "PlayerButton_ControlTaunts", function(pl, key)
	local info 	 		= pl:GetInfoNum("ph_default_taunt_key", 0)
	local ctInfo 		= pl:GetInfoNum("ph_default_customtaunt_key", 0)
	local lockInfo 		= pl:GetInfoNum("ph_default_rotation_lock_key", 0)
	local freezePropKey = pl:GetInfoNum("ph_prop_midair_freeze_key", 0)
	
	local pitchApplyRand = pl:GetInfoNum("ph_cl_pitch_apply_random", 0)		-- Also applies for random taunt, specified with pitch level
	local plPitchLevel	= pl:GetInfoNum("ph_cl_pitch_level", 100)			-- Pitch level to use
	
	local isRandomPitch = pl:GetInfoNum("ph_cl_pitch_randomized_random", 0)	-- Use Randomized pitch for Random Taunts instead of specified level
	
	local decoyKey		= pl:GetInfoNum("ph_cl_decoy_spawn_key", 0)			-- Used for spawning decoy
    local isRightClickMode = pl:GetInfoNum("ph_prop_right_mouse_taunt", 0)  -- Right Click for taunt. Changed to clientside convar instead
	
	-- Freeze Prop while midair
	if pl:Alive() and pl:Team() == TEAM_PROPS and (key == freezePropKey) then
		pl:FreezePropMidAir()
	end
	
	-- if you're excluding custom taunts not to be played on random taunts or use them *only* for specific 'groups', you're evil. jk it's good tho :)
	if pl and pl:IsValid() and pl:Alive() and (key == info or (pl:Team() == TEAM_PROPS and ( tobool(isRightClickMode) and key == MOUSE_RIGHT ))) then
		if (PHX:GetCVar( "ph_custom_taunt_mode" ) == 1) && GAMEMODE:InRound() then
			pl:ConCommand("ph_showtaunts")
		elseif ((PHX:GetCVar( "ph_custom_taunt_mode" ) == 0) or (PHX:GetCVar( "ph_custom_taunt_mode" ) == 2)) and
			GAMEMODE:InRound() and pl:Alive() and (pl:Team() == TEAM_HUNTERS || pl:Team() == TEAM_PROPS) and 
			pl.last_taunt_time + PHX:GetCVar( "ph_normal_taunt_delay" ) <= CurTime() and
			-- for Random taunts, we'll use Cached taunts instead so EVERY taunts (including Customs) will also played. NO EXCEPTION.
			(!table.IsEmpty(PHX.CachedTaunts[TEAM_PROPS]) and !table.IsEmpty(PHX.CachedTaunts[TEAM_HUNTERS])) then
			
			local rand_taunt
			
			repeat
				if pl:Team() == TEAM_HUNTERS then
					rand_taunt = PHX:GetRandomTaunt( TEAM_HUNTERS )
				else
					rand_taunt = PHX:GetRandomTaunt( TEAM_PROPS )
				end
			until rand_taunt != pl.last_taunt
			
			pl.last_taunt_time = CurTime() + PHX:GetCVar( "ph_normal_taunt_delay" )
			pl.last_taunt = rand_taunt
			
			local pitch = 100
			if PHX:GetCVar("ph_taunt_pitch_enable") then
				if tobool(pitchApplyRand) then	-- is it Specified?
                    if tobool( isRandomPitch ) then 	-- is it Randomized?
                        pitch = math.random(PHX:GetCVar("ph_taunt_pitch_range_min"), PHX:GetCVar("ph_taunt_pitch_range_max"))
                    else
                        pitch = plPitchLevel
                    end
				end
			end
			pl:EmitSound(rand_taunt, 100, pitch)
			pl:SetNWFloat("LastTauntTime", CurTime())
			
		end
	end
	
	if pl and pl:IsValid() and pl:Alive() and (key == ctInfo) then
		pl:ConCommand("ph_showtaunts")
	end
	
	-- Prop rotation lock key, and spawn decoy key
	if pl && pl:IsValid() && pl:Alive() && pl:Team() == TEAM_PROPS then
		-- Lock rotation
		if key == lockInfo then
			if pl:GetPlayerLockedRot() then
				pl:SetNWBool("PlayerLockedRotation", false)
				--pl:PHXNotify( "HUD_ROTFREE", "UNDO", 3, true )
				pl:PrintCenter( "HUD_ROTFREE", Color(32,200,72) )
				net.Start("PHX.rotateState")
					net.WriteInt(0, 2)
				net.Send(pl)
			else
				pl:SetNWBool("PlayerLockedRotation", true)
				--pl:PHXNotify( "HUD_ROTLOCK", "ERROR", 3, true )
				pl:PrintCenter( "HUD_ROTLOCK", Color(255,128,40) )
				net.Start("PHX.rotateState")
					net.WriteInt(1, 2)
				net.Send(pl)
			end
		end
		
		-- Spawn Decoy
		if GAMEMODE:InRound() and pl:HasFakePropEntity() and key == decoyKey then
			pl:PlaceDecoyProp()
		end
	end
end)