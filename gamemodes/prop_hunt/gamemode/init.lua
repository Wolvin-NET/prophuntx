-- Force client to download workshop. Instead of sharing files.
resource.AddWorkshop("2176546751")

-- Send required file to clients
AddCSLuaFile("sh_init.lua")
AddCSLuaFile("enhancedplus/cl_enhancedplus.lua")
AddCSLuaFile("cl_fb_core.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_chat.lua")
AddCSLuaFile("cl_tauntwindow.lua")
AddCSLuaFile("cl_hud_mask.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_menutypes.lua")
AddCSLuaFile("cl_menu.lua")
AddCSLuaFile("cl_menuadmacc.lua")
AddCSLuaFile("cl_autotaunt.lua")
AddCSLuaFile("cl_credits.lua")

-- Include the required lua files
include("sv_nettables.lua")
include("sh_init.lua")
include("sv_items.lua")
include("enhancedplus/sv_enhancedplus.lua")
include("sh_config.lua")
include("sv_admin.lua")
include("sv_tauntmgr.lua")
include("sv_bbox.lua")

-- initial value.
SetGlobalInt("unBlind_Time", math.Clamp(PHX:GetCVar( "ph_hunter_blindlock_time" ) - (CurTime() - GetGlobalFloat("RoundStartTime", 0)), 0, PHX:GetCVar( "ph_hunter_blindlock_time" )) )
SetGlobalBool("PHX.BlindStatus", false)

-- Public Variables
PHX.EXPLOITABLE_DOORS = {
	["func_door"]			= true,
	["prop_door_rotating"]	= true, 
	["func_door_rotating"]	= true
}
PHX.VOICE_IS_END_ROUND  = 0
PHX.SPECTATOR_CHECK     = 0
PHX.CurPlys             = {}
IS_ROUND_FORCED_END     = false

-- Local Variables
local hunterdamagefix = {
	["func_breakable"]	= true,
	["func_physbox"]	= true,
	["ph_fake_prop"]	= true
}
local phx_blind_unlocktime = 0
local playerModels = { "combine", "combineprison", "combineelite", "police" }   -- Default Player Models. Do not Edit.
local HLAModels = {
    -- Additional HLA: Combine Models -- this is OPTIONAL.
    --[[
        Models can be found at:
        https://steamcommunity.com/sharedfiles/filedetails/?id=2109019567
        https://steamcommunity.com/sharedfiles/filedetails/?id=2068446620
        https://steamcommunity.com/sharedfiles/filedetails/?id=2064138107
        https://steamcommunity.com/sharedfiles/filedetails/?id=2059548654
        https://steamcommunity.com/sharedfiles/filedetails/?id=2035168341
    ]]
    "models/hlvr/characters/combine/grunt/combine_grunt_hlvr_player.mdl",
    "models/hlvr/characters/combine/grunt/combine_beta_grunt_hlvr_player.mdl",
    "models/hlvr/characters/combine_captain/combine_captain_hlvr_player.mdl",
    "models/hlvr/characters/combine/suppressor/combine_suppressor_hlvr_player.mdl",
    "models/hlvr/characters/combine/heavy/combine_heavy_hlvr_player.mdl",
    "models/hlvr/characters/hazmat_worker/hazmat_worker_player.mdl",
    "models/hlvr/characters/worker/worker_player.mdl"
}
local bAlreadyStarted = false

-- Control Taunt Window whether it should be Forced Close or Allow to be used.
-- Used for checking if player is dead, round is ended, or any other meaning.
local function ControlTauntWindow(num)
	if num == 1 then
		net.Start("PH_ForceCloseTauntWindow")
		net.Broadcast()
	elseif num == 0 then
		net.Start("PH_AllowTauntWindow")
		net.Broadcast()
	end
end

local function ClearBlindedHuntersList()
	for _,ply in ipairs( team.GetPlayers(TEAM_HUNTERS) ) do
        local tmrUnblind = ply.TimerBlindID or "tmr.hunterUnblind:"..ply:EntIndex()
        if timer.Exists(tmrUnblind) then timer.Remove(tmrUnblind) end
		ply.TimerBlindID = nil
		if ply:GetBlindState() then ply:Blind(false) end
		if ply:IsFrozen() then ply:UnLock() end
		if !GAMEMODE:InRound() then ply.PHXHasLoadout = false end
		timer.Simple(0.1, function()
			-- a delay to prevent weapons spawn twice
			if !(ply.PHXHasLoadout) and GAMEMODE:InRound() and !PHX:IsBlindStatus() and (ply._LoadOutUnblind) then 
				PHX:VerboseMsg('[Loadout] Spawning late weapon loadouts (possibly player was respawned manually or during blind time)')
				ply._LoadOutUnblind( ply )
				ply.PHXHasLoadout = true
			end
		end)
    end
end

local function ClearTimer()

    PHX:SetBlindStatus(false)

	if timer.Exists("tmr_handleUnblindHook") then timer.Remove("tmr_handleUnblindHook") end
    if timer.Exists("phx.tmr_GiveGrenade") then timer.Remove("phx.tmr_GiveGrenade") end
    
    ClearBlindedHuntersList()
	
end

local function sendGroupInfo( ply )
	local data,size = util.PHXQuickCompress( PHX.IgnoreMutedUserGroup )
    net.Start("PHX.MutedGroupInfo")
        net.WriteUInt(size,16)
        net.WriteData(data,size)
    net.Send( ply )

    local data,size = util.PHXQuickCompress( PHX.SVAdmins )
    net.Start("PHX.AdminGroupInfo")
        net.WriteUInt(size,16)
        net.WriteData(data,size)
    net.Send( ply )
end

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

-- Called alot
function GM:CheckPlayerDeathRoundEnd()
	if !GAMEMODE.RoundBased || !GAMEMODE:InRound() then 
		return
	end

	local Teams = GAMEMODE:GetTeamAliveCounts()

	if table.Count(Teams) == 0 then
		
		GAMEMODE:RoundEndWithResult(1001, "HUD_LOSE")
		PHX.VOICE_IS_END_ROUND = 1
		ControlTauntWindow(1)
		
		PHX:PlayWinningSound( 3 ) -- 3 because for lose. You can set this to 0 or 1001 tho.
		
		hook.Call("PH_OnRoundDraw", nil)
		
		ClearTimer()
		return
	end
	if table.Count(Teams) == 1 then
		local TeamID = table.GetKeys(Teams)[1]
		
		if (TeamID == TEAM_PROPS or TeamID == TEAM_HUNTERS) then
		
			-- debug
			PHX:VerboseMsg("[Round] Round Result: "..team.GetName(TeamID).." ("..TeamID..") Wins!")
			
			-- End Round
			GAMEMODE:RoundEndWithResult(TeamID, "HUD_TEAMWIN")
			
			PHX.VOICE_IS_END_ROUND = 1
			ControlTauntWindow(1)
			
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

-- Called when an entity takes damage
function EntityTakeDamage(ent, dmginfo)
	local att = dmginfo:GetAttacker()
	
	-- Code from: https://facepunch.com/showthread.php?t=1500179 , Special thanks from AlcoholicoDrogadicto(http://steamcommunity.com/profiles/76561198082241865/) for suggesting this.
	if GAMEMODE:InRound() && ent && ent:IsPlayer() && ent:Alive() && ent:Team() == TEAM_PROPS && ent.ph_prop then
		-- Prevent Prop 'Friendly Fire'
		if ( dmginfo:GetAttacker():IsPlayer() && dmginfo:GetAttacker():Team() == ent:Team() ) then 
			PHX:VerboseMsg("[TakeDamage] DMGINFO::ATTACKED!!-> "..ent:Nick().."(Victim) <- "..tostring(dmginfo:GetAttacker()).."! DMGTYPE: "..dmginfo:GetDamageType())
			return
		end
		--Debug purpose.
		PHX:VerboseMsg("[TakeDamage] " .. ent:Name() .. "'s PLAYER entity appears to have taken damage, we can redirect it to the prop! (Model is: " .. ent.ph_prop:GetModel() .. ")")
		ent.ph_prop:TakeDamageInfo(dmginfo)
		
		return	-- don't continue below.
	end
	
	if GAMEMODE:InRound() && ent && (ent:GetClass() != "ph_prop" && !hunterdamagefix[ent:GetClass()] && PHX:IsUsablePropEntity(ent:GetClass()) && !ent:IsPlayer()) && 
		(att && att:IsPlayer() && att:Team() == TEAM_HUNTERS && att:Alive()) then
        
        local penalty = PHX:GetCVar( "ph_hunter_fire_penalty" )
        local allow   = PHX:GetCVar( "ph_allow_armor" )
		if allow and att:Armor() >= 5 && penalty >= 5 then
			att:SetHealth(att:Health() - (math.Round( penalty/2 )))
			att:SetArmor(att:Armor() - 15)
			if att:Armor() < 0 then att:SetArmor(0) end
		else
			att:SetHealth(att:Health() - penalty)
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
	
	-- Allow props damage to hunters
	if GAMEMODE:InRound() and ply:Team() == TEAM_HUNTERS and (IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TEAM_PROPS) then
		return true
	end
	
	if ( IsValid( attacker ) and attacker:IsPlayer() and GAMEMODE.NoPlayerPlayerDamage ) then return false end
	if ( IsValid( attacker ) and !attacker:IsPlayer() and GAMEMODE.NoNonPlayerPlayerDamage ) then return false end
	
	return true
	
end

-- Called when player tries to pickup a weapon / items
function GM:PlayerCanPickupWeapon(pl, ent)
	if pl:Team() ~= TEAM_HUNTERS then
		return false
	end
	
	return true
end

function GM:PlayerCanPickupItem(pl, item)
    if pl:Team() ~= TEAM_HUNTERS then
        return false
    end
    
    return true
end

-- Don't use "GM:DoPlayerDeath" and we'll use a hook version instead.
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


-- function to respawn players during blind mode.
-- this is usually noticed when the player is falling, changing team, or etc.
local function AutoRespawnCheck( ply, bWasDeadOrSuicide )
	-- Require at least 3 players.
	if player.GetCount() > 2 and (ply:Team() == TEAM_PROPS or ply:Team() == TEAM_HUNTERS) then

		local SpecChange = PHX:GetCVar("ph_allow_respawn_from_spectator")
		local TeamChange = PHX:GetCVar("ph_allow_respawnonblind_teamchange")
		local tim 		 = math.Clamp( PHX:GetCVar("ph_allow_respawnonblind_team_only"), 0, TEAM_PROPS )

		if CurTime() < phx_blind_unlocktime then --Remaining blindfold percentage time
			local dospawn=false
			if bWasDeadOrSuicide then
				if (ply._Team2TeamDisabledSuicide) and !ply._joinCameFrom then
					ply._Team2TeamDisabledSuicide = nil
				elseif !ply._joinCameFrom then
					dospawn=true;
				end
			end
			if SpecChange and (ply._joinCameFrom) and ply._joinCameFrom == TEAM_SPECTATOR then dospawn=true; end
			if TeamChange then
				if (ply._joinCameFrom) and ply._joinCameFrom == TEAM_HUNTERS and ply:Team() == TEAM_PROPS then
					dospawn = true
				elseif (ply._joinCameFrom) and ply._joinCameFrom == TEAM_PROPS and ply:Team() == TEAM_HUNTERS then
					dospawn = true
				end
			end

			if dospawn and (tim == ply:Team() or tim == 0) then
				if ply.PHXHasLoadout then ply.PHXHasLoadout = false end
				if ply:Alive() then ply:KillSilent() end
				ply._joinCameFrom = nil
				ply._Team2TeamDisabledSuicide = nil
				ply:Spawn() --ply._joinCameFrom will also nile from PlayerSpawn hook, just double checking though
				ControlTauntWindow(0)
				if tim > 0 then
					ply:PHXChatInfo( "NOTICE", "BLIND_RESPAWN_TEAM", PHX:TranslateName( tim, ply ), math.Round(phx_blind_unlocktime - CurTime()) )
				else
					ply:PHXChatInfo( "NOTICE", "BLIND_RESPAWN", math.Round(phx_blind_unlocktime - CurTime()) )
				end

				return
			end
		end

	end

	ply._joinCameFrom = nil
	ply._Team2TeamDisabledSuicide = nil
	
end
hook.Add("PostPlayerDeath", "autoPlayerRepsawnDuringDeath", function(ply)
	-- Force Close the Taunt Menu whenever a player is dead.
	if ply:Team() == TEAM_PROPS or ply:Team() == TEAM_HUNTERS then
		net.Start( "PH_ForceCloseTauntWindow" )
		net.Send(ply)
	end

	if !PHX:GetCVar( "ph_allow_respawnonblind" ) then return end
	if !GAMEMODE:InRound() then return end

	local time = 0.45
	timer.Simple(time, function()
		if IsValid(ply) and GAMEMODE:InRound() then AutoRespawnCheck(ply, true) end
	end)

end)

hook.Add("PlayerChangedTeam", "changeteam", function(ply, old, new)

	local AllowRespawn = PHX:GetCVar( "ph_allow_respawnonblind" )
	local FromSpectator = PHX:GetCVar( "ph_allow_respawn_from_spectator" )
	local FromTeamToTeam = PHX:GetCVar( "ph_allow_respawnonblind_teamchange" )

	if !AllowRespawn then return end
	if !GAMEMODE:InRound() then return end

	local time = 0.5
	if FromSpectator then
		if (old == TEAM_SPECTATOR and new == TEAM_HUNTERS) or (old == TEAM_SPECTATOR and new == TEAM_PROPS) then
			ply._joinCameFrom = TEAM_SPECTATOR
			timer.Simple(time, function()
				if IsValid(ply) and GAMEMODE:InRound() then AutoRespawnCheck(ply) end
			end)
		end
	end

	if FromTeamToTeam then
		if old == TEAM_HUNTERS and new == TEAM_PROPS then
			ply._joinCameFrom = TEAM_HUNTERS
			timer.Simple(time, function()
				if IsValid(ply) and GAMEMODE:InRound() then AutoRespawnCheck(ply) end
			end)
		elseif old == TEAM_PROPS and new == TEAM_HUNTERS then
			ply._joinCameFrom = TEAM_PROPS
			timer.Simple(time, function()
				if IsValid(ply) and GAMEMODE:InRound() then AutoRespawnCheck(ply) end
			end)
		end

		ply._Team2TeamDisabledSuicide = nil
		return
	end

	ply._Team2TeamDisabledSuicide = true

end)



hook.Add("OnPlayerChangedTeam", "TeamChange_switchLimitter", function(ply, old, new)
	local MAX_TEAMCHANGE_LIMIT = PHX:GetCVar( "ph_max_teamchange_limit" )

	if MAX_TEAMCHANGE_LIMIT ~= -1 and (not ply:IsBot()) and !ply:PHXIsStaff() then
		if new ~= TEAM_SPECTATOR then
			ply.ChangeLimit = ply.ChangeLimit + 1
			ply:PHXChatInfo("WARNING", "CHAT_SWAPTEAM_WARNING", ply.ChangeLimit, MAX_TEAMCHANGE_LIMIT)
			PHX:VerboseMsg("[Team] "..ply:Nick().." has switched team "..ply.ChangeLimit.."x.")
		end
		
		if ply.ChangeLimit > MAX_TEAMCHANGE_LIMIT and new ~= TEAM_SPECTATOR then
			ply.ChangeLimit = MAX_TEAMCHANGE_LIMIT
			timer.Simple(0.3, function()
				if old ~= TEAM_SPECTATOR then
					if (ply.PHXHasLoadout) then ply.PHXHasLoadout = false end
					ply:SetTeam(old)
					ply:PHXChatInfo("ERROR", "CHAT_SWAPTEAM_REVERT", PHX:TranslateName(new,ply))
					PHX:VerboseMsg("[Team] Reverting "..ply:Nick().."\'s team to "..team.GetName(old))
				end
			end)
		end
	end
end)

hook.Add("PostCleanupMap", "PH_ResetStats", function()
	-- Force close any taunt menu windows
	ControlTauntWindow(0)
	PHX.VOICE_IS_END_ROUND = 0
	
	-- Called every round restart: make sure this was set publicly and make it synced accross clients.
	SetGlobalInt("unBlind_Time", math.Clamp(PHX:GetCVar( "ph_hunter_blindlock_time" ) - (CurTime() - GetGlobalFloat("RoundStartTime", 0)), 0, PHX:GetCVar( "ph_hunter_blindlock_time" )) )
    PHX:SetBlindStatus(true)
	
	local cvarPercent	= PHX:GetCVar( "ph_blindtime_respawn_percent" )
	local blindTime		= GetGlobalInt("unBlind_Time", 0)
	local percent		= blindTime * cvarPercent
	phx_blind_unlocktime = CurTime() + percent
	
    -- Call a hook/set global state that Blind Time is over.
	timer.Create("tmr_handleUnblindHook", blindTime, 1, function()
        PHX:SetBlindStatus(false)
		hook.Call("PH_BlindTimeOver", nil)
		ClearBlindedHuntersList()
	end)
    
end)

-- Check if HLA Playermodels exists.
if (PHX:GetCVar( "ph_add_hla_combine" )) then
	for _,model in pairs(HLAModels) do
		if (file.Exists(model, "GAME")) then
			local hlacombine = player_manager.TranslateToPlayerModelName(model)
			if (hlacombine ~= "kleiner") then
				PHX:VerboseMsg("[Misc] HLA Model found: " .. hlacombine .. ", adding to random combine model list...")
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

	if !self:InRound() then return; end
	if !IsValid(pl) then return; end
	if !IsValid(ent) then return; end

	if pl:Team() == TEAM_PROPS && PHX:IsUsablePropEntity(ent:GetClass()) && ent:GetModel() then
		-- Prop Launcher: Don't allow if Prop is a Trash (Residue of PROP Launcher item/LPS)
		if (ent._PropTrash) then return end
		if PHX:GetCVar( "ph_banned_models" ) and table.HasValue(PHX.BANNED_PROP_MODELS, ent:GetModel()) then
			pl:PHXChatInfo("ERROR", "PHX_PROP_IS_BANNED")
		elseif IsValid(ent:GetPhysicsObject()) && (pl.ph_prop:GetModel() != ent:GetModel() || pl.ph_prop:GetSkin() != ent:GetSkin()) then
        
            -- Disallow props that has maximum bounding box's less than 0.5 units (originally 1 but because we have "ph_tmp_accurate_hull" convar )
            if math.Max(ent:OBBMaxs().x, ent:OBBMaxs().y) <= 0.5 then
                pl:PHXChatInfo("ERROR", "PHX_PROP_TOO_THIN")
                return
            end
			
			-- Restriction to enable/disable prop crouch/isonground.
			if PHX:GetCVar( "ph_prop_must_standing" ) and ( pl:Crouching() or (not pl:IsOnGround()) ) then
				return
			end
        
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
            -- Free the rotation: This will prevent rare bug for Yaw-only rotation and bug for Pitch rotation.
            pl:SetPlayerLockedRot( false )
            pl:SendRotState( 0 )
            pl:PrintCenter( "HUD_ROTFREE", Color(32,200,72) )
            pl:EnablePropPitchRot( true )
			
			local OffsetMult = PHX:GetCVar( "ph_prop_viewoffset_mult" )
			local UseFullHull = PHX:GetCVar( "ph_tmp_accurate_hull" )
			
			if PHX:GetCVar( "ph_sv_enable_obb_modifier" ) && ent:GetNWBool("hasCustomHull",false) then
				local hmin	= ent.m_Hull[1]
				local hmax 	= ent.m_Hull[2] * OffsetMult
				
				if hmax.z < self.ViewCam.cHullzMins then
                    pl:PHAdjustView( self.ViewCam.cHullzMins, self.ViewCam.cHullzMins )
				elseif hmax.z > self.ViewCam.cHullzMaxs then
                    pl:PHAdjustView( self.ViewCam.cHullzMaxs, self.ViewCam.cHullzMaxs )
				else
                    pl:PHAdjustView( hmax.z )
				end
                
                pl:SetHull(hmin,hmax)
				pl:SetHullDuck(hmin,hmax)
				local vMax = math.Max(hmax.x,hmax.y)
                local xymax = UseFullHull and vMax or math.Round(vMax)
                pl:PHSendHullInfo( xymax*-1, xymax, hmax.z, new_health )
			else
				local vMax = math.Max(ent:OBBMaxs().x, ent:OBBMaxs().y)
				local vMaxZ = ent:OBBMaxs().z-ent:OBBMins().z
				
                local hullxymax = UseFullHull and vMax or math.Round(vMax)
				local hullxymin = hullxymax * -1
				local hullz     = (UseFullHull and vMaxZ or math.Round(vMaxZ)) * OffsetMult
                
                if ent:GetClass() == "prop_ragdoll" then -- Optional (but Better): Add 'PHX:GetCVar( "ph_usable_prop_type" ) >= 3' for extra checks.
                    -- We'll use GetModelBounds() instead of using CollisionBounds or OBBMins/Maxs.
                    -- Reason because is that ragdoll's Coll/OBBs bounds values are always changing when they move.
                    local mins,maxs = ent:GetModelBounds()
                    
					local vRagMax = math.Max( maxs.x, maxs.y)
					local vRagMaxZ = maxs.z-mins.z
                    hullxymax   = UseFullHull and vRagMax or math.Round( vRagMax )
                    hullxymin   = hullxymax * -1
                    hullz       = (UseFullHull and vRagMaxZ or math.Round(vRagMaxZ)) * OffsetMult
                    
                    -- Override health back to 100 and set their solid back to BBOX.
                    pl.ph_prop:SetSolid(SOLID_BBOX)
                    pl:SetHealth(100)
                    pl.ph_prop.health 		= 100
                    pl.ph_prop.max_health 	= 100
                    
                    pl:EnablePropPitchRot( false ) --Do not use Pitch Rotation when prop_ragdoll being used.
                    -- Bug Explanation: Bullet can still goes through if using SOLID_BBOX.
                    -- Using SOLID_OBB **DOES NOT** Helps: This will produce ANOTHER bug that
                    -- hunters are completely stucked when the prop is rotated. This appear to be engine's bug.
                end
            
				if hullz < self.ViewCam.cHullzMins then
					pl:PHAdjustView( self.ViewCam.cHullzMins, self.ViewCam.cHullzMins )
				elseif hullz > self.ViewCam.cHullzMaxs then                
					pl:PHAdjustView( self.ViewCam.cHullzMaxs, self.ViewCam.cHullzMaxs )
				else
                    pl:PHAdjustView( hullz )
				end
                
				pl:SetHull(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
				pl:SetHullDuck(Vector(hullxymin, hullxymin, 0), Vector(hullxymax, hullxymax, hullz))
                pl:PHSendHullInfo( hullxymin, hullxymax, hullz, new_health )

			end
		end
		
		hook.Call("PH_OnChangeProp", nil, pl, ent)
	end
	
end

-- Called when a player tries to use an object. By default this pressed ['E'] button. MouseClick 1 will be mentioned below at line @351
function GM:PlayerUse(pl, ent)
	if !pl:Alive() || pl:Team() == TEAM_SPECTATOR || pl:Team() == TEAM_UNASSIGNED then return false; end
	
	-- Prevent Execution Spam by holding ['E'] button too long.
	if pl:Team() == TEAM_PROPS && pl:GetVar("UseTime",0) <= CurTime() then
		
		local hmx,hmy,hz = ent:GetPropSize()
        local proptype = PHX:GetCVar( "ph_usable_prop_type" )
		if PHX:GetCVar( "ph_check_for_rooms" ) && !pl:CheckHull(hmx, hmy, hz) then
            if (proptype <= 2 && PHX:IsUsablePropEntity( ent:GetClass() )) then
                pl:PHXChatInfo("WARNING", "CHAT_PROP_NO_ROOM")
            end
		else
			if ( proptype >= 3 && PHX.CVARUseAbleEnts[proptype][ent:GetClass()] ) then
				if PHX:QCVar( "ph_usable_prop_type_notice" ) then
					pl:PrintCenter( "NOTIFY_PROP_ENTTYPE" )
				end
			else
				self:PlayerExchangeProp(pl, ent)
			end
		end
		
		pl:SetVar("UseTime",CurTime()+1)
		
	end
	
	-- control who can pick up objects
	if PHX:IsUsablePropEntity(ent:GetClass()) then
		local state = PHX:GetCVar( "ph_allow_pickup_object" )
		local cls = ent:GetClass()
		
		-- Fix where you cant open doors or use+ing any entities.
		if PHX.EXPLOITABLE_DOORS[cls] then return end
		if cls == "ph_luckyball" or cls == "ph_devilball" then return end
		if ent:IsVehicle() then return end -- for ph_factory map
	
		if state <= 0 then
			return false
		elseif (state == 1 or state == 2) then
			if pl:Team() ~= state then return false end
		end
	end
	
	
	-- Prevent the door exploit
	if PHX.EXPLOITABLE_DOORS[ent:GetClass()] && pl:GetVar("LastDoorUseTime",0) + 1 > CurTime() then
		return false
	end
    
    pl:SetVar("LastDoorUseTime", CurTime())
    
    -- Sorry, but Props are not allowed to enter vehicle, this is due to new code fixes for ph_prop :(
    -- This is temporarily disabled and re-enabled again if there is a workaround
    -- https://github.com/Facepunch/garrysmod-issues/issues/1150
    -- https://github.com/Facepunch/garrysmod-issues/issues/2620
    if pl:Team() == TEAM_PROPS and ent:IsVehicle() then
        return false
    end
	
	return true
end

-- Called when a player leaves
hook.Add("PlayerDisconnected", "PH_PlayerDisconnected", function( ply )
    ply:RemoveProp()
    
    if IsValid(ply.propdecoy) then
        ply.propdecoy:SetOwner(NULL)
        ply.propdecoy = nil
    end
	
	-- Save player Change Team info -- this will reset after map has been changed
	if PHX:GetCVar( "ph_max_teamchange_limit" ) ~= -1 and !ply:PHXIsStaff() and (not ply:IsBot()) then
	
		local id = ply:SteamID()
		PHX.CurPlys[id] = ply.ChangeLimit
		
		PHX:VerboseMsg("[Team] Saving player team change information of "..ply:Nick().." ("..ply:SteamID()..") -> ["..ply.ChangeLimit.."]")
		
	end
end)

function GM:Initialize()
    PHX:ManageGroupInfo( true, false, "SVAdmins", "admins", "PHX.AdminGroupInfo" )
	PHX:ManageGroupInfo( true, false, "IgnoreMutedUserGroup", "muted_groups", "PHX.MutedGroupInfo" )
	
	if GAMEMODE.RoundBased then
		timer.Simple(3, function()
			GAMEMODE:StartRoundBasedGame()
		end)
	end
end

function GM:Think()
	self.BaseClass:Think() --... required?
	
	for k,v in pairs( player.GetAll() ) do
	
		local Class = v:GetPlayerClass()
		if Class and istable(Class) then
			v:CallClassFunction( "Think" )
		end
		
	end

	-- Game time related
	if( !GAMEMODE.IsEndOfGame && ( !GAMEMODE.RoundBased || ( GAMEMODE.RoundBased && GAMEMODE:CanEndRoundBasedGame() ) ) && CurTime() >= GAMEMODE.GetTimeLimit() ) then
		GAMEMODE:EndOfGame( true )
	end
	
end

-- Set specific variable for checking in player initial spawn, then use Player:IsHoldingEntity()
hook.Add("PlayerInitialSpawn", "PHX.SetupInitData", function(ply)
	if not PHX.cvarsynced then PHX:InitCVar() end

	ply.LastPickupEnt	= NULL
	ply.ChangeLimit		= 0
	
	-- Player Switch Teams Initialisations	
	if IsValid(ply) && PHX:GetCVar( "ph_max_teamchange_limit" ) ~= -1 && !ply:PHXIsStaff() && !ply:IsBot() then
		
		local id = ply:SteamID()
		PHX.CurPlys[id] = PHX.CurPlys[id] or 0
		
		if PHX.CurPlys[id] == 0 then
			ply.ChangeLimit = 0
			PHX:VerboseMsg("[Team] "..ply:Nick().."'s team switch limit initialised.")
		elseif PHX.CurPlys[id] > 0 then
			ply.ChangeLimit = PHX.CurPlys[id]
			PHX:VerboseMsg("[Team] "..ply:Nick().."'s has "..tostring(PHX.CurPlys[id]).."x team switches remaining.")
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
	
	-- Inform Player to recently joined with X2Z's Tutorial
	timer.Simple(5, function()
		if IsValid(ply) then
			local info = ply:GetInfoNum("ph_cl_show_introduction",0)
			if tobool( info ) then
				net.Start("phx_showVeryFirstTutorial")
				net.Send(ply)
			end
		end
	end)
    
    -- Low chance of being unreliable: Send/Update admin data info
    hook.Add( "SetupMove", ply, function( self, ply, _, cmd )
		if self == ply and not cmd:IsForced() then
			hook.Run( "PHX.PlayerFullLoad", self ) -- it behave like think but predicted. do not use here.
			hook.Remove( "SetupMove", self )
            sendGroupInfo( self ) -- if this not being sent properly, use -> timer.Simple(0, function() sendGroupInfo( self ) end)
		end
	end )

end)

hook.Add("AllowPlayerPickup", "PHX.IsHoldingEntity", function(ply,ent)
	ply.LastPickupEnt = ent
	ent.LastPickupPly = ply
end)

-- Spray Controls
hook.Add( "PlayerSpray", "PH.GeneralSprayFunc", function( ply )
	if ( ( !ply:Alive() ) || ( ply:Team() == TEAM_SPECTATOR ) || ( ply:Team() == TEAM_UNASSIGNED ) ) then
		return true
	end
end )

-- Called when the players spawns
hook.Add("PlayerSpawn", "PH_PlayerSpawn", function(pl)
	pl._joinCameFrom=nil
	pl._Team2TeamDisabledSuicide=nil
    pl:SetPlayerLockedRot( false )
	pl:SetNWBool("InFreezeCam", false)
	pl:SetNWEntity("PlayerKilledByPlayerEntity", nil)
	pl:Blind(false)
	pl:RemoveProp()
	pl:SetColor(Color(255,255,255,255))
	pl:SetRenderMode(RENDERMODE_TRANSALPHA)
	pl:UnLock()
    -- Reset Fake taunts
	pl:ResetTauntRandMapCount()
	
	pl:SetLastTauntTime( "LastTauntTime", CurTime() )
	pl:SetLastTauntTime( "CLastTauntTime", CurTime() )
    pl.propdecoy = nil -- don't link to your decoy prop
	
	pl:ResetHull() -- Always call this.
	net.Start("ResetHull")
	net.Send(pl)
	
	net.Start("DisableDynamicLight")
	net.Send(pl)
	
	pl:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
	pl:CollisionRulesChanged()
	
	if pl:Team() == TEAM_HUNTERS then
		pl:SetJumpPower(160 * PHX:GetCVar( "ph_hunter_jumppower" )) --1
	elseif pl:Team() == TEAM_PROPS then
		pl:SetJumpPower(160 * PHX:GetCVar( "ph_prop_jumppower" )) --1.5
	end

	-- Listen server host
	if !game.IsDedicated() then pl:SetNWBool("ListenServerHost", pl:IsListenServerHost()) end
end)


-- Called when round ends
hook.Add("PH_RoundEnd", "PHX.RoundIsEnd", function()
    -- Unblind the hunters
	for _, pl in pairs(team.GetPlayers(TEAM_HUNTERS)) do
		pl:Blind(false)
		pl:UnLock()
	end
	
	-- Give rewards for living props for a decoy
    if GetGlobalInt("RoundNumber") > 2 and (not IS_ROUND_FORCED_END) then -- It should start giving after 2nd Round and not forced round end.
        for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
            if PHX:GetCVar( "ph_enable_decoy_reward" ) and pl:Alive() and pl:Health() > 0 and (not pl:HasFakePropEntity()) then
                pl:SetFakePropEntity(true)
                pl:PHXChatPrint( "DECOY_GET_REWARD", Color(50,248,56), true )
				pl:PHXNotify( "DECOY_GET_REWARD", "GENERIC", 5, true )
            end
        end
    end
	
	-- Stop autotaunting
	net.Start("AutoTauntRoundEnd")
	net.Broadcast()
end)


-- This is called when the round time ends (props win)
function GM:RoundTimerEnd()
	if !GAMEMODE:InRound() then
		return
	end

	GAMEMODE:RoundEndWithResult(TEAM_PROPS, "HUD_TEAMWIN")
	PHX.VOICE_IS_END_ROUND = 1
	ControlTauntWindow(1)
	
	PHX:PlayWinningSound( TEAM_PROPS )
	
	hook.Call("PH_OnTimerEnd", nil)
end

-- Force End current Round.
local function ForceEndRound( ply )
    if GAMEMODE:InRound() and ( util.IsStaff( ply ) ) then
    
        IS_ROUND_FORCED_END = true
    
        GAMEMODE:RoundEndWithResult(1001, "HUD_LOSE")
        PHX.VOICE_IS_END_ROUND = 1
        ControlTauntWindow(1)
        
        PHX:PlayWinningSound( 3 )
        ClearTimer()    -- Always check if any timers running.
        
        MsgAll("Round was forced end. No one Wins!\n")
    
    else
        if ply == NULL then
			print( "[PHX] Cannot Restart round: Not in active round!" )
		else
			ply:PrintMessage(HUD_PRINTTALK, "[PHX] Sorry, this command is unavailable.")
		end
    end
end
concommand.Add("ph_force_end_round", ForceEndRound, nil, "Force End Active Round")

-- Called before start of round
function GM:OnPreRoundStart(num)
    IS_ROUND_FORCED_END = false

	game.CleanUpMap()
	
	if GetGlobalInt("RoundNumber") != 1 && (PHX:GetCVar( "ph_swap_teams_every_round" ) || ((team.GetScore(TEAM_PROPS) + team.GetScore(TEAM_HUNTERS)) > 0)) then
		for _, pl in pairs(player.GetAll()) do

			-- Clear player's last_taunt
			pl.last_taunt = nil
		
			if pl:Team() == TEAM_PROPS || pl:Team() == TEAM_HUNTERS then
			
				if pl:Team() == TEAM_PROPS then
					pl:SetTeam(TEAM_HUNTERS)
				else
					pl:SetTeam(TEAM_PROPS)
                    if pl:HasFakePropEntity() then pl:PHXNotify( "DECOY_REMINDER_GET", "GENERIC", 18, true ) end
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
		
		-- Props will gain a Bonus Armor points if Hunter teams has more than 4 players in it. More player means more armor they can get.
		-- Tweaked from PHE:Plus
        local allow = PHX:GetCVar( "ph_allow_armor" )
        if allow then
            timer.Simple(1, function()
                local NumHunter = team.NumPlayers( TEAM_HUNTERS )
				
				if NumHunter < 4 then return end
				
				local min,max = 1,3
				if NumHunter >= 8 then min,max = 3,7 end
				
                for _,prop in pairs( team.GetPlayers(TEAM_PROPS) ) do
					if IsValid(prop) then prop:SetArmor(math.random(min,max) * 15) end
				end
            end)
        end
		
		hook.Call("PH_OnPreRoundStart", nil, num, PHX:GetCVar( "ph_swap_teams_every_round" ))
	end
	
	-- Balance teams. We need to set this "TRUE" to make sure the switched player isn't killed during team switch.
	-- These both have :SetTeam option, making HasLoadout stays true, bellow will fixes it.
	if PHX:GetCVar( "ph_enable_teambalance" ) then
		if PHX:GetCVar( "ph_team_balance_classic" ) then
			GAMEMODE:CheckTeamBalance( true )
		else
			GAMEMODE:CheckTeamBalanceCustom()
		end
	end
    
    -- Timer to give grenades, if ph_give_grenade_near_roundend is set.
    timer.Create( "phx.tmr_GiveGrenade", GAMEMODE.RoundLength - PHX:GetCVar( "ph_give_grenade_roundend_before_time" ), 1, function()
        if PHX:GetCVar( "ph_give_grenade_near_roundend" ) and GAMEMODE:InRound() then
            for _,h in ipairs(team.GetPlayers( TEAM_HUNTERS )) do
                if h:Alive() and h:HasWeapon( "weapon_smg1" ) then
                    local numGrenade = PHX:GetCVar( "ph_smggrenadecounts" )
                    h:SetAmmo(numGrenade, "SMG1_Grenade")
                    h:SendSurfaceSound("misc/grenadepickup.wav")
                    h:PHXNotify( "NOTICE_GRENADE_SMG_GIVEN", "GENERIC", 5, true )
                end
            end
        end
    end)
	
	-- Clear All Hunter's HasLoadout
	for _,h in ipairs(team.GetPlayers( TEAM_HUNTERS )) do h.PHXHasLoadout = false; end
	UTIL_StripAllPlayers()
	UTIL_SpawnAllPlayers()
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

-- Bonus Drop. Only works on prop_* entities apparently.
hook.Add("PropBreak", "Props_OnBreak_WithDrops", function( ply, ent )
    if PHX:GetCVar( "ph_enable_lucky_balls" ) and GAMEMODE:InRound() then
		if IsValid(ent) then
			local pos = ent:GetPos()
			if math.random() < 0.08 then -- 8%
				local lb = ents.Create("ph_luckyball")
                lb:SetPos(Vector(pos.x, pos.y, pos.z + 32))
                lb:SetAngles(Angle(0,0,0))
                lb:SetColor(Color(math.Round(math.random(0,255)),math.Round(math.random(0,255)),math.Round(math.random(0,255)),255))
                lb:Spawn()
			end
		end
	end
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

-- Round Control Override
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
hook.Add("KeyPress", "PlayerPressedKey", function( pl, key )
    -- Use traces to select a prop
	if pl && pl:IsValid() && pl:Alive() && pl:Team() == TEAM_PROPS then
        local min,max = pl:GetHull()
	
		if key == IN_ATTACK then
			local trace = {}

            trace = GAMEMODE.ViewCam:CommonCamCollEnabledView( pl:EyePos(), pl:EyeAngles(), max.z )
			local filter = {}
            table.Add(filter, ents.FindByClass("ph_prop"))
            table.Add(filter, player.GetAll())

			trace.filter = filter
			
			local trace2 = util.TraceLine(trace) 
			if trace2.Entity && trace2.Entity:IsValid() && PHX:IsUsablePropEntity(trace2.Entity:GetClass()) then
				if pl:GetVar("UseTime",0) <= CurTime() then
					if !pl:IsHoldingEntity() then
						local hmx,hmy,hz = trace2.Entity:GetPropSize()
						if PHX:GetCVar( "ph_check_for_rooms" ) && !pl:CheckHull(hmx, hmy, hz) then
							pl:PHXChatInfo("WARNING", "CHAT_PROP_NO_ROOM")
						else
							GAMEMODE:PlayerExchangeProp(pl, trace2.Entity)
						end
					end
					pl:SetVar("UseTime",CurTime()+1)
				end
			end
		end
	end
end)

-- DO NOT OVERRIDE.
local SNDLVL_TAUNT_CHOICE = {75, 80, 85, 90, 95, 100}
function PHX:PlayTaunt( pl, sndTaunt, bIsPitchEnabled, iPitchLevel, bIsRandomized, LastTauntTimeID )
	if !pl or !IsValid(pl) then
		print("[Taunt:PlayTaunt] Error: 'Player' entity argument on PHX:PlayTaunt is required!")
		return
	end

	bIsPitchEnabled = bIsPitchEnabled or 0
	iPitchLevel = iPitchLevel or 100
	bIsRandomized = bIsRandomized or 0
	if !LastTauntTimeID or LastTauntTimeID == "" then
		print("[Taunt:PlayTaunt] Error: LastTauntTimeID argument on PHX:PlayTaunt is Required!")
		return
	end

	-- Re-strict team check.
	
	if (pl:Team() == TEAM_PROPS or pl:Team() == TEAM_HUNTERS) then
		-- sndTaunt can be either boolean or string.
		local taunt
		local cvSndLevel = SNDLVL_TAUNT_CHOICE[PHX:GetCVar( "ph_taunt_soundlevel" )]
		local cvStopSound = PHX:GetCVar( "ph_overlap_taunt" )

		if (not cvStopSound and (pl.last_taunt)) then
			pl:StopSound( pl.last_taunt )
		end
		
		if isbool(sndTaunt) and (sndTaunt) then
			if (TAUNT_FALLBACK) then
				taunt = "vo/coast/odessa/male01/nlo_cheer0"..math.random(1,4)..".wav"
			else
				repeat
					taunt = PHX:GetRandomTaunt( pl:Team() )
				until taunt != pl.last_taunt
				pl.last_taunt = taunt
			end
			
		elseif isstring(sndTaunt) then
			taunt = sndTaunt
			pl.last_taunt = taunt
		end
		
		local pitch = 100
		if PHX:GetCVar( "ph_taunt_pitch_enable" ) and tobool( bIsPitchEnabled ) then		
			if tobool( bIsRandomized ) then
				pitch = math.random( PHX:GetCVar("ph_taunt_pitch_range_min"), PHX:GetCVar("ph_taunt_pitch_range_max") )
			else
				pitch = math.Clamp( iPitchLevel, PHX:GetCVar("ph_taunt_pitch_range_min"), PHX:GetCVar("ph_taunt_pitch_range_max") )
			end
		end
		pl:EmitSound( taunt, cvSndLevel, pitch )
		pl:SetLastTauntTime( LastTauntTimeID, CurTime() )
		
	end

end

hook.Add("PlayerButtonDown", "PlayerButton_ControlTaunts", function(pl, key)
	if !GAMEMODE:InRound() then return end

	local TauntKey 		= pl:GetInfoNum("ph_default_taunt_key", 0)
	local ctInfo 		= pl:GetInfoNum("ph_default_customtaunt_key", 0)
	local lockInfo 		= pl:GetInfoNum("ph_default_rotation_lock_key", 0)
	local freezePropKey = pl:GetInfoNum("ph_prop_midair_freeze_key", 0)
	
	local pitchApplyRand = pl:GetInfoNum("ph_cl_pitch_apply_random", 0)		-- Also applies for random taunt, specified with pitch level
	local plPitchLevel	= pl:GetInfoNum("ph_cl_pitch_level", 100)			-- Pitch level to use
	local isRandomPitch = pl:GetInfoNum("ph_cl_pitch_randomized_random", 0)	-- Use Randomized pitch for Random Taunts instead of specified level
    local isRightClickMode = pl:GetInfoNum("ph_prop_right_mouse_taunt", 0)  -- Right Click for taunt. Changed to clientside convar instead
	
	local decoyKey		= pl:GetInfoNum("ph_cl_decoy_spawn_key", 0)			-- Used for spawning decoy
	local unstuckKey	= pl:GetInfoNum("ph_cl_unstuck_key", 0)				-- The Unstuck Key

	local plTeam = pl:Team()
	
	if IsValid(pl) and pl:Alive() and (plTeam == TEAM_PROPS or plTeam == TEAM_HUNTERS) then
		
		-- Taunt Access
		-- if you're excluding custom taunts not to be played on random taunts or use them *only* for specific 'groups', you're evil. jk it's good tho :)	
		local tauntmode  = PHX:GetCVar( "ph_custom_taunt_mode" )
		local tauntdelay = PHX:GetCVar( "ph_normal_taunt_delay" )
		if (key == TauntKey or (plTeam == TEAM_PROPS and ( tobool(isRightClickMode) and key == MOUSE_RIGHT ) )) then
			if tauntmode == 1 then
				pl:ConCommand("ph_showtaunts")
			elseif tauntmode == 0 or tauntmode == 2 and pl:GetLastTauntTime( "LastTauntTime" ) + tauntdelay <= CurTime() then
				-- Random taunts rules: Use Cached; includes range from: [custom, stock, externals]. That's it.
				local TauntPath = true
				if ( table.IsEmpty(PHX.CachedTaunts[plTeam]) or TAUNT_FALLBACK ) then
					TauntPath = "vo/coast/odessa/male01/nlo_cheer0"..math.random(1,4)..".wav"
					pitchApplyRand = 0; plPitchLevel = 100; isRandomPitch = 0;
				end
				PHX:PlayTaunt( pl, TauntPath, pitchApplyRand, plPitchLevel, isRandomPitch, "LastTauntTime" )
			end
		end
		
		-- Both Team goes here.
		if (key == ctInfo) then
			pl:ConCommand("ph_showtaunts")
		end
		
		if (PHX:GetCVar( "ph_use_unstuck" ) and key == unstuckKey) then
			GAMEMODE:UnstuckPlayer(pl)
		end
	
		-- Team Props
		if plTeam == TEAM_PROPS then
	
			-- Lock rotation
			if (key == lockInfo) then
				if pl:GetPlayerLockedRot() then
					pl:SetPlayerLockedRot( false )
					pl:SendRotState(0)
					pl:PrintCenter( "HUD_ROTFREE", Color(32,200,72) )
				else
					pl:SetPlayerLockedRot( true )
					pl:SendRotState(1)
					pl:PrintCenter( "HUD_ROTLOCK", Color(255,128,40) )
				end
			end
			
			-- Freeze Prop while midair
			if (key == freezePropKey) then
				pl:FreezePropMidAir()
			end
			
			-- Spawn Decoy
			if pl:HasFakePropEntity() and (key == decoyKey) then
				pl:PlaceDecoyProp()
			end
			
		-- Team Hunters
		elseif plTeam == TEAM_HUNTERS then
			
			-- Add Something here for hunters. Sometimes in future I think.
			
		end
	end
end)

-- Addition from PH:E/Plus: Fall Damage
function GM:GetFallDamage(ply, flFallSpeed)
	local Real = PHX:GetCVar( "ph_falldamage_real" )
	local IsEnabled = PHX:GetCVar( "ph_falldamage" )

	if !GAMEMODE:InRound() or !IsEnabled then return 0 end
	if Real then return flFallSpeed / 8 end

	return 10
end