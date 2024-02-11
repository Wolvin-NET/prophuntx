resource.AddWorkshop("2176546751")
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
include("sv_nettables.lua")
include("sh_init.lua")
include("sv_items.lua")
include("enhancedplus/sv_enhancedplus.lua")
include("sh_config.lua")
include("sv_admin.lua")
include("sv_tauntmgr.lua")
include("sv_bbox.lua")

SetGlobalBool("PHX.BlindStatus",false)
PHX:SetupBlindTime()

-- PUBLIC VARIABLES
GM.ReconnectedPlayers	= {}
PHX.EXPLOITABLE_DOORS	= {
	["func_door"]			= true,
	["prop_door_rotating"]	= true, 
	["func_door_rotating"]	= true,
	
	-- Leaving this disabled because maps rarely using a combination of door and button, will re-enabled once this needed.
	-- ["func_button"]		= true,
	-- ["func_rot_button"]	= true,

	-- These below has to be the rarest map possible if a they're using the entities as for doors
	-- ["momentary_rot_button"] = true,
}
CTRL_VOICE_ISENDROUND	= 0
CTRL_ROUND_FORCEDEND	= false
CTRL_TEAMLMT_DCPLAYERS	= {}

--PHX.SPECTATOR_CHECK     = 0 -- Obsolete

function PHX:PlayTaunt( pl, sndTaunt, bIsPitchEnabled, iPitchLevel, bIsRandomized, LastTauntTimeID )
	if not pl or not IsValid(pl) then
		print("[Taunt:PlayTaunt] Error: A 'Player' entity is required!")
		return
	end

	local cvPitchEnabled = self:GetCVar( "ph_taunt_pitch_enable" )
	local cvPitchMin	 = self:GetCVar( "ph_taunt_pitch_range_min" )
	local cvPitchMax	 = self:GetCVar( "ph_taunt_pitch_range_max" )
	local curTeam		 = pl:Team()

	if ( curTeam == TEAM_PROPS or curTeam == TEAM_HUNTERS ) then
		local taunt = "vo/k_lab/kl_fiddlesticks.wav"
		
		-- sndTaunt can be either boolean or string.
		if isbool(sndTaunt) and (sndTaunt) then
			repeat
				taunt = self:GetRandomTaunt( curTeam )
			until taunt != pl.last_taunt
			pl.last_taunt = taunt
			
		elseif isstring(sndTaunt) then
			taunt = sndTaunt
		end
		
		local pitch = 100
		if cvPitchEnabled and tobool( bIsPitchEnabled ) then		
			if tobool( bIsRandomized ) then
				pitch = math.random( cvPitchMin, cvPitchMax )
			else
				pitch = math.Clamp( iPitchLevel, cvPitchMin, cvPitchMax )
			end
		end
		pl:EmitSound( taunt, 100, pitch )
		pl:SetLastTauntTime( LastTauntTimeID, CurTime() )
	end
end

-- LOCAL VARIABLES
local game_RndAlreadyStarted = false
local PlayerQueues = {}
local HunterNoPenaltyEnts = {
	["func_breakable"]	= true,
	["func_physbox"]	= true,
	["ph_fake_prop"]	= true
}
local HBlindUnlockTimeRem = 0
local TeamCanPickupWepItem = { [TEAM_HUNTERS]=true }
local DefaultPM = { "combine", "combineprison", "combineelite", "police" }   -- Default Player Models. Do not Edit.
local DefaultHLAPM = {
    "models/hlvr/characters/combine/grunt/combine_grunt_hlvr_player.mdl",
    "models/hlvr/characters/combine/grunt/combine_beta_grunt_hlvr_player.mdl",
    "models/hlvr/characters/combine_captain/combine_captain_hlvr_player.mdl",
    "models/hlvr/characters/combine/suppressor/combine_suppressor_hlvr_player.mdl",
    "models/hlvr/characters/combine/heavy/combine_heavy_hlvr_player.mdl",
    "models/hlvr/characters/hazmat_worker/hazmat_worker_player.mdl",
    "models/hlvr/characters/worker/worker_player.mdl"
}

--[[
Additional "Half-Life: Alyx" Combine models, this is OPTIONAL!
https://steamcommunity.com/sharedfiles/filedetails/?id=2109019567
https://steamcommunity.com/sharedfiles/filedetails/?id=2068446620
https://steamcommunity.com/sharedfiles/filedetails/?id=2064138107
https://steamcommunity.com/sharedfiles/filedetails/?id=2059548654
https://steamcommunity.com/sharedfiles/filedetails/?id=2035168341
]]

-- LOCAL FUNCTIONS
local function IsPlayerPlaying(ply, idTeam) ply:PHIsPlayerAndAlive( idTeam ); end
local function IsPlayerAlive(ply, idTeam) ply:PHIsAlive( idTeam ); end

local function Game_MngTauntWindow( bool )
	-- true: Force Close
	-- false: Allow Opening Taunt Window
	bool = tobool(bool)
	if bool then
		net.Start("PH_ForceCloseTauntWindow")
		net.Broadcast()
		return
	end

	net.Start("PH_AllowTauntWindow")
	net.Broadcast()
end

local function Game_ClearBlindedHunters()
	util.AllTeamPlayers( TEAM_HUNTERS, function( ply )
        
		local tmrUnblind = ply.TimerBlindID or "tmr.hunterUnblind:"..ply:EntIndex()
        if timer.Exists(tmrUnblind) then timer.Remove(tmrUnblind) end
		ply.TimerBlindID = nil
		if ply:GetBlindState() then ply:Blind(false) end
		if ply:IsFrozen() then ply:UnLock() end
		if !PHX:GameInRound() then ply.PHXHasLoadout = false end
		timer.Simple(0.1, function()
			-- a delay to prevent weapons spawned twice
			if !(ply.PHXHasLoadout) and PHX:GameInRound() and !PHX:IsBlindStatus() and (ply._LoadOutUnblind) then 
				PHX:VerboseMsg('[Loadout] Spawning late weapon loadouts (possibly player was respawned manually or during blind time)')
				ply._LoadOutUnblind( ply )
				ply.PHXHasLoadout = true
			end
		end)

    end)
end

local function Game_ResetStatusTimer()
    PHX:SetBlindStatus(false)
	if timer.Exists("tmr_handleUnblindHook") then timer.Remove("tmr_handleUnblindHook") end
    if timer.Exists("phx.tmr_GiveGrenade") then timer.Remove("phx.tmr_GiveGrenade") end
    Game_ClearBlindedHunters()
end

local function Game_ResetOnRestart()
	-- Force close any taunt menu windows
	Game_MngTauntWindow(false)
	CTRL_VOICE_ISENDROUND = 0
	
	-- Called every round restart: make sure this was set publicly and make it synced accross clients.
	PHX:SetupBlindTime()
    PHX:SetBlindStatus(true)
	
	local cvPercent			= PHX:GetCVar( "ph_blindtime_respawn_percent" )
	local CurBlindTime		= PHX:GetUnblindTime()
	local percent			= CurBlindTime * cvPercent
	HBlindUnlockTimeRem 	= CurTime() + percent
	
    -- Call a hook/set global state that Blind Time is over.
	timer.Create("tmr_handleUnblindHook", CurBlindTime, 1, function()
        PHX:SetBlindStatus(false)
		hook.Call("PH_BlindTimeOver", nil)
		Game_ClearBlindedHunters()
	end)
end

local function Core_SendGroupInfo( ply )
	
	PHX:VerboseMsg( "[Core] Sending Groups (Server Admins/Group Data) to client for accessing Admin Menus..." )

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

local function Core_PHZSendAdditionalInfos( ply )
	if !ply or !IsValid( ply ) then return end
	hook.Call("PHZ_PlayerInitUpdateData", nil, ply)
end

-- Player Join/Leave message
gameevent.Listen( "player_connect" )
hook.Add( "player_connect", "PHXHook.BroadcastPlayerJoinServer", function( data )
	if PHX:GetCVar( "ph_notify_player_join_leave" ) then
		util.AllPlayers(function(v) v:PHXChatInfo( "NOTICE", "EV_PLAYER_CONNECT", data.name ) end)
	end
end )
gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "PHXHook.BroadcastPlayerDisconnected", function( data )
	if PHX:GetCVar( "ph_notify_player_join_leave" ) then
		util.AllPlayers( function(v) v:PHXChatInfo( "NOTICE", "EV_PLAYER_DISCONNECT", data.name, data.reason ) end)
	end
end )

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
	if CTRL_VOICE_ISENDROUND == 0 && listen:Alive() && !speaker:Alive() then return false, false end
	
	-- Listen to all dead players while you dead.
	if !listen:Alive() && !speaker:Alive() then return true, false end
	
	-- However, Living players can be heard from dead players.
	if !listen:Alive() && speaker:Alive() then return true, false end
	
	-- Event: On Round End/Time End. Listen to everyone.
	if CTRL_VOICE_ISENDROUND == 1 && listen:Alive() && !speaker:Alive() then return true, false end

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
		if CTRL_VOICE_ISENDROUND == 0 && listen:Alive() && !speaker:Alive() then return false end
		if !listen:Alive() && !speaker:Alive() then return true end
		if !listen:Alive() && speaker:Alive() then return true end
		if CTRL_VOICE_ISENDROUND == 1 && listen:Alive() && !speaker:Alive() then return true end
		if listen:Team() == TEAM_SPECTATOR && listen:Alive() && speaker:Alive() then return false end
	end
	
	local alltalk_cvar = GetConVar("sv_alltalk"):GetInt()
	if (alltalk_cvar > 0) then return true end
	
	-- Generic Checks
	if ( !IsValid( speaker ) || !IsValid( listen ) ) then return false end
	
	-- Only alive players can see other living players.
	if listen:Alive() && speaker:Alive() then return true end
	
	-- Event: On Round Start. Living Players don't see dead players' chat.
	if CTRL_VOICE_ISENDROUND == 0 && listen:Alive() && !speaker:Alive() then return false end
	
	-- See Chat to all dead players while you dead.
	if !listen:Alive() && !speaker:Alive() then return true end
	
	-- However, Living players' chat can be seen from dead players.
	if !listen:Alive() && speaker:Alive() then return true end
	
	-- Event: On Round End/Time End. See Chat to everyone.
	if CTRL_VOICE_ISENDROUND == 1 && listen:Alive() && !speaker:Alive() then return true end

	-- Spectator can only read from themselves.
	if listen:Team() == TEAM_SPECTATOR && listen:Alive() && speaker:Alive() then return false end
	
	return true
end

-- Called when an entity takes damage
hook.Add("EntityTakeDamage", "PHXHook.ManageEntityTakeDamage", function( ent, dmginfo )
	if not ent then return end
	local att = dmginfo:GetAttacker()
	if not att or not IsValid(att) then return end

	if PHX:GameInRound() then
		if IsPlayerPlaying( ent, TEAM_PROPS ) then
			local plyProp = ent:GetPlayerPropEntity()
			if IsValid( plyProp ) then
				if ( att:IsPlayer() and att:Team() == ent:Team() ) then return end -- Prevent Prop 'Friendly Fire'
				plyProp:TakeDamageInfo(dmginfo)
				return
			end
		end

		local EntClass		= ent:GetClass()
		local NoPenalty		= HunterNoPenaltyEnts[EntClass]
		local IsUsableProp	= PHX:IsUsablePropEntity(EntClass)
		if NoPenalty and IsUsableProp and not ent:IsPlayer() and IsPlayerPlaying(att, TEAM_HUNTERS) then
			
			local cvPenalty		= PHX:GetCVar( "ph_hunter_fire_penalty" )
			local cvUseArmor	= PHX:GetCVar( "ph_allow_armor" )

			local plHealth,plArmor = att:Health(),att:Armor()
			local newHealth,newArmor = plHealth,plArmor

			if cvUseArmor and plArmor >= 5 and cvPenalty >= 5 then
				local halved = math.Round( cvPenalty/2 )
				newHealth = plHealth - halved
				if plArmor > 0 then 
					newArmor = math.Clamp( plArmor - 15, 0, 255)
				end
			else
				newHealth = plHealth - cvPenalty
			end
			
			att:SetHealth( newHealth )
			att:SetArmor( newArmor )

			if att:Health() <= 0 then
				MsgAll(att:Name() .. " felt guilty for hurting so many innocent props and committed suicide.\n")
				att:Kill()
				hook.Run("PH_HunterDeathPenalty", att)
			end
		end
	end
	




	--[[ if PHX:GameInRound() && ent && ent:IsPlayer() && ent:Alive() && ent:Team() == TEAM_PROPS && ent.ph_prop then
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
	
	if PHX:GameInRound() && ent && (ent:GetClass() != "ph_prop" && !HunterNoPenaltyEnts[ent:GetClass()] && PHX:IsUsablePropEntity(ent:GetClass()) && !ent:IsPlayer()) && 
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
	end ]]

end

function GM:PlayerShouldTakeDamage(ply, attacker)
	
	if IsValid( attacker ) then

		if attacker:IsPlayer() then
			if self:InRound() and ply:Team() == TEAM_HUNTERS and attacker:Team() == TEAM_PROPS then return true end	-- Allow props damage to hunters
			-- default fretta values
			if self.NoPlayerSelfDamage and ply == attacker then return false end	-- NoPlayerSelfDamage = false
			if self.NoPlayerDamage then return false end							-- NoPlayerDamage = false
			if self.NoPlayerTeamDamage and ply:Team() == attacker:Team() and ply ~= attacker then return false end	-- NoPlayerTeamDamage = true
			if self.NoPlayerPlayerDamage then return false end		-- NoPlayerPlayerDamage = true
		else
			if self.NoNonPlayerPlayerDamage then return false end	-- NoNonPlayerPlayerDamage = true, Assume NPCs or other things
		end

	end

	--[[ if ( GAMEMODE.NoPlayerSelfDamage and IsValid( attacker ) and attacker:IsPlayer() and ply == attacker ) then return false end
	if ( GAMEMODE.NoPlayerDamage ) then return false end
	
	if ( GAMEMODE.NoPlayerTeamDamage and IsValid( attacker ) and attacker:IsPlayer() ) then
		if ( attacker.Team and ply:Team() == attacker:Team() and ply ~= attacker ) then return false end
	end
	
	-- Allow props damage to hunters
	if self:InRound() and ply:Team() == TEAM_HUNTERS and (IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TEAM_PROPS) then
		return true
	end
	
	if ( IsValid( attacker ) and attacker:IsPlayer() and GAMEMODE.NoPlayerPlayerDamage ) then return false end
	if ( IsValid( attacker ) and !attacker:IsPlayer() and GAMEMODE.NoNonPlayerPlayerDamage ) then return false end ]]
	
	return true
	
end

-- Called when player tries to pickup a weapon / items
function GM:PlayerCanPickupWeapon(pl, wep)
	if not TeamCanPickupWepItem[pl:Team()] then return false end
	if pl:Team()==TEAM_HUNTERS and wep:GetClass()=="weapon_lps" then return false end
	return true
end
function GM:PlayerCanPickupItem(pl, item)
    if not TeamCanPickupWepItem[pl:Team()] then return false end
    return true
end

-- Allow FreezeCam for Hunters when they're get killed by Props.
hook.Add("DoPlayerDeath", "PHXHook.HunterFreezeCam", function(ply, attacker, dmginfo)
	local cvFreezeCamOn = PHX:GetCVar( "ph_freezecam_hunter" )
	if ( cvFreezeCamOn and
		ply:Team() == TEAM_HUNTERS and IsValid( attacker ) and
		attacker:IsPlayer() and attacker ~= ply and attacker:Team() == TEAM_PROPS ) then

		ply:StartFreezeCam( attacker )
	end
end)


-- Function to respawn players during blind mode.
-- Purpose: Respawn players after certain death: Fall, Killed too early, etc.
local function AutoRespawnCheck( ply, bWasDeadOrSuicide )
	-- Require at least 3 players.
	if player.GetCount() > 2 and ply:PHIsPlaying() then

		local SpecChange = PHX:GetCVar("ph_allow_respawn_from_spectator")
		local TeamChange = PHX:GetCVar("ph_allow_respawnonblind_teamchange")
		local tim 		 = math.Clamp( PHX:GetCVar("ph_allow_respawnonblind_team_only"), 0, TEAM_PROPS )

		if CurTime() < HBlindUnlockTimeRem then --Remaining blindfold percentage time
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
				Game_MngTauntWindow(false)
				if tim > 0 then
					ply:PHXChatInfo( "NOTICE", "BLIND_RESPAWN_TEAM", PHX:TranslateName( tim, ply ), math.Round(HBlindUnlockTimeRem - CurTime()) )
				else
					ply:PHXChatInfo( "NOTICE", "BLIND_RESPAWN", math.Round(HBlindUnlockTimeRem - CurTime()) )
				end

				return
			end
		end

	end

	ply._joinCameFrom = nil
	ply._Team2TeamDisabledSuicide = nil
	
end
hook.Add("PostPlayerDeath", "PHXHook.AutoRespawnEarlyDeath", function(ply)
	-- Force Close the Taunt Menu whenever a player is dead.
	if ply:PHIsPlaying() then
		net.Start( "PH_ForceCloseTauntWindow" )
		net.Send(ply)
	end

	if not PHX:GetCVar( "ph_allow_respawnonblind" ) then return end
	if not PHX:GameInRound() then return end

	local time = 0.45
	timer.Simple(time, function()
		if IsValid(ply) and PHX:GameInRound() then AutoRespawnCheck(ply, true) end
	end)

end)

-- usually called after PostPlayerDeath, then this called, then calls OnPlayerChangedTeam
hook.Add("PlayerChangedTeam", "PHXHook.PlyChangedTeam", function(ply, old, new)

	local AllowRespawn = PHX:GetCVar( "ph_allow_respawnonblind" )
	local FromSpectator = PHX:GetCVar( "ph_allow_respawn_from_spectator" )
	local FromTeamToTeam = PHX:GetCVar( "ph_allow_respawnonblind_teamchange" )

	if !AllowRespawn then return end
	if !PHX:GameInRound() then return end

	local time = 0.5
	if FromSpectator then
		if (old == TEAM_SPECTATOR and new == TEAM_HUNTERS) or (old == TEAM_SPECTATOR and new == TEAM_PROPS) then
			ply._joinCameFrom = TEAM_SPECTATOR
			timer.Simple(time, function()
				if IsValid(ply) and PHX:GameInRound() then AutoRespawnCheck(ply) end
			end)
		end
	end

	if FromTeamToTeam then
		if old == TEAM_HUNTERS and new == TEAM_PROPS then
			ply._joinCameFrom = TEAM_HUNTERS
			timer.Simple(time, function()
				if IsValid(ply) and PHX:GameInRound() then AutoRespawnCheck(ply) end
			end)
		elseif old == TEAM_PROPS and new == TEAM_HUNTERS then
			ply._joinCameFrom = TEAM_PROPS
			timer.Simple(time, function()
				if IsValid(ply) and PHX:GameInRound() then AutoRespawnCheck(ply) end
			end)
		end

		ply._Team2TeamDisabledSuicide = nil
		return
	end

	ply._Team2TeamDisabledSuicide = true

end)

hook.Add("OnPlayerChangedTeam", "PHXHook.OnPlyChangedTeam_TeamLimit", function(ply, old, new)
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

function GM:PlayerSetModel(pl)
	
	local cvUseCustom	=	PHX:GetCVar( "ph_use_custom_plmodel" )
	local Translate = player_manager.TranslatePlayerModel

	-- intentional to prevent "twice-damage"
	local player_model = "models/props_idbs/phenhanced/box.mdl"

	if cvUseCustom then
		local CustModels = Translate( pl:GetInfo("cl_playermodel") )
		if pl:Team() == TEAM_HUNTERS then player_model = CustModels; end
	else
		local tDefModels = DefaultPM[math.random(1,#DefaultPM)]
		local DefModels = Translate( tDefModels )
		if pl:Team() == TEAM_HUNTERS then player_model = DefModels; end
	end
	
	util.PrecacheModel(player_model)
	pl:SetModel(player_model)

end

-- The [E] & Mouse Click 1 behaviour is now moved in here!
function GM:PlayerExchangeProp(pl, ent)

	if !self:InRound() then return; end
	if !IsValid(pl) then return; end
	if !IsValid(ent) then return; end
	
	local PlayerProp = pl.ph_prop
	if !IsValid( PlayerProp ) then return; end

	local PropModel = ent:GetModel()
	local PropClass = ent:GetClass()
	
	if pl:Team() == TEAM_PROPS && PHX:IsUsablePropEntity( PropClass ) and PropModel then
		
		-- Prop Launcher: Don't allow if Prop is a Trash (Residue of PROP Launcher item/LPS)
		if (ent._PropTrash) then return end
		
		local PropSkin  = ent:GetSkin()
		local PropPhys  = ent:GetPhysicsObject()
		
		local prModel	= PlayerProp:GetModel()
		local prSkin	= PlayerProp:GetSkin()
		
		local cvBannedModels = PHX:GetCVar( "ph_banned_models" )
		local cvPropMustStand= PHX:GetCVar( "ph_prop_must_standing" )
		local cvOBBModded	 = PHX:GetCVar( "ph_sv_enable_obb_modifier" )
		--local cvIsUsableType = PHX:GetCVar( "ph_usable_prop_type" )
		local OffsetMult	 = PHX:GetCVar( "ph_prop_viewoffset_mult" )
		
		if cvBannedModels and table.HasValue( PHX.BANNED_PROP_MODELS, PropModel ) then
			pl:PHXChatInfo("ERROR", "PHX_PROP_IS_BANNED")
			return
		end
			
		if IsValid( PropPhys ) and (prModel ~= PropModel or prSkin ~= PropSkin) then
			
			local MINS,MAXS = ent:OBBMins(),ent:OBBMaxs()
			local XYMAX 	= math.Max( MAXS.x, MAXS.y )
			
			-- Disallow props that has maximum bounding box's less than 1 units.
            if XYMAX <= 1 then
                pl:PHXChatInfo("ERROR", "PHX_PROP_TOO_THIN")
                return
            end
			
			local ISCROUCH = pl:Crouching()
			local ISGROUND = pl:IsOnGround()
			
			-- Prop Must Standing?
			if cvPropMustStand and ( ISCROUCH or (not ISGROUND) ) then return; end
        
			local max_health = 200
			local ent_health = math.Clamp( PropPhys:GetVolume() / 250, 1, max_health )
			local new_health = math.Clamp( (PlayerProp.health / PlayerProp.max_health) * ent_health, 1, max_health )
			local PropHasCHull = ent:GetNWBool("hasCustomHull",false)
			local PlyPos	= pl:GetPos()
			local PlyAng	= pl:EyeAngles() --pl:GetAngles()
			local StartPos	= PlyPos - Vector(0, 0, MINS.z)
			local SOLID  	= SOLID_VPHYSICS
			local PITCHROT	= true
			local prColor   = color_white
			if ent:GetClass() == "ph_luckyball" then prColor = ent:GetColor(); end -- Get Color from 'ph_luckyball', if UsablePropType == 3
			
			-- default values
			local VEC_VIEW = 72
			local VMIN,VMAX = vector_origin,vector_origin
			local VHXYMINS = XYMAX*-1
			local VHXYMAXS = XYMAX
			local VHZ = VEC_VIEW
			-- end of default values
			
			if cvOBBModded and PropHasCHull then
				local hmin	= ent.m_Hull[1]
				local hmax 	= ent.m_Hull[2]
				local hz = hmax.z * OffsetMult
				
				local viewz = hz				
				if hz < self.ViewCam.cHullzMins then
                    viewz = self.ViewCam.cHullzMins
				elseif hz > self.ViewCam.cHullzMaxs then
                    viewz = self.ViewCam.cHullzMaxs
				end
				
				local xymax = math.Round( math.Max(hmax.x,hmax.y) )
				hmin = Vector(xymax*-1, xymax*-1, 0) --Z should never below 0.
				hmax = Vector(xymax, xymax, hmax.z)
                
				VEC_VIEW = viewz
                VMIN = hmin; VMAX = hmax;
                VHXYMINS = xymax*-1
				VHXYMAXS = xymax
				VHZ 	 = hmax.z
			else
                local hullxymax = math.Round( XYMAX )
				local hullxymin = hullxymax * -1
				local hullz     = math.Round( MAXS.z-MINS.z )
				local viewz 	= hullz * OffsetMult
                
                if ent:GetClass() == "prop_ragdoll" then -- and cvIsUsableType >= 3 then...
                    local mins,maxs = ent:GetModelBounds()
                    hullxymax   = math.Round( math.Max( maxs.x, maxs.y) )
                    hullxymin   = hullxymax * -1
                    hullz       = math.Round( maxs.z-mins.z )
					viewz		= hullz * OffsetMult
                    SOLID		= SOLID_BBOX
                    new_health 	= 100
                    max_health 	= 100
                    -- TODO: Implement AABB on next update!
                    PITCHROT 	= false --Do not use Pitch Rotation when prop_ragdoll being used.
                end
            
				if hullz < self.ViewCam.cHullzMins then
					viewz = self.ViewCam.cHullzMins
				elseif hullz > self.ViewCam.cHullzMaxs then                
					viewz = self.ViewCam.cHullzMaxs
				end
				
				VEC_VIEW = viewz
                VMIN = Vector( hullxymin, hullxymin, 0 ); VMAX = Vector( hullxymax, hullxymax, hullz );
                VHXYMINS = hullxymin
				VHXYMAXS = hullxymax
				VHZ 	 = hullz
			end
			
			-- Start Applying
			PlayerProp.health 		= new_health
			PlayerProp.max_health   = ent_health
			--PlayerProp:SetHealth( new_health )
			--PlayerProp:SetMaxHealth( max_health )
			PlayerProp:SetModel( PropModel )
			PlayerProp:SetSkin( PropSkin )
			PlayerProp:SetSolid( SOLID )
			PlayerProp:SetPos( StartPos )
			PlayerProp:SetAngles( PlyAng )
			PlayerProp:SetColor( prColor )
			pl:SetHealth( new_health )            
            pl:SetPlayerLockedRot( false ) -- Free the rotation: Prevent rare bug for Yaw-only rotation and bug for Pitch rotation.
            pl:SendRotState( 0 )
            pl:PrintCenter("HUD_ROTFREE", PHX_COL_ROTFREE)
            pl:EnablePropPitchRot( PITCHROT )
			
			pl:PHAdjustView( VEC_VIEW )
			pl:SetHull( VMIN, VMAX )
			pl:SetHullDuck( VMIN, VMAX )
            pl:PHSendHullInfo( VHXYMINS, VHXYMAXS, VHZ, new_health )
			
			hook.Call("PH_OnChangeProp", nil, pl, ent)
			
		end

	end
	
end

-- Called when a player tries to use an object. By default this pressed ['E'] button. MouseClick 1 will be mentioned below.
function GM:PlayerUse(pl, ent)
	
	if not pl:Alive() or pl:PHIsSpectators() then return false; end
	
	local PropClass			= ent:GetClass()
	local AllowPickupObj 	= PHX:GetCVar( "ph_allow_pickup_object" )
	local IsUsableEnt		= PHX:IsUsablePropEntity( PropClass )
	local PreventDoorSpam	= PHX.EXPLOITABLE_DOORS[PropClass]

	if pl:Team() == TEAM_PROPS and pl:GetVar("UseTime",0) <= CurTime() then
		
		local hmx,hmy,hz		= ent:GetPropSize()
        local proptype 			= PHX:GetCVar( "ph_usable_prop_type" )
		local checkroom 		= PHX:GetCVar( "ph_check_for_rooms" )
		local notice 			= PHX:GetCVar( "ph_usable_prop_type_notice" )
		
		if checkroom and (not pl:CheckHull(hmx, hmy, hz)) then
            if (proptype <= 2 and IsUsableEnt) then
                pl:PHXChatInfo("WARNING", "CHAT_PROP_NO_ROOM")
            end
		else
			if ( proptype >= 3 and PHX.CVARUseAbleEnts[proptype][PropClass] ) then
				if notice then pl:PrintCenter( "NOTIFY_PROP_ENTTYPE" ); end
			else
				self:PlayerExchangeProp(pl, ent)
			end
		end
		
		pl:SetVar("UseTime",CurTime()+1)
		
	end
	
	-- control who can pick up objects
	if IsUsableEnt then
		if AllowPickupObj <= 0 then
			return false
		elseif (AllowPickupObj == 1 or AllowPickupObj == 2) then
			if pl:Team() ~= AllowPickupObj then return false end
		end
	end
	
	
	-- Prevent the door exploit
	if PreventDoorSpam and pl:GetVar("LastDoorUseTime",0) + 1 > CurTime() then return false; end
    pl:SetVar("LastDoorUseTime", CurTime())
    
    -- Sorry, but Props are not allowed to enter vehicle, this is due to new code fixes for ph_prop :(
    -- This is temporarily disabled and re-enabled again if there is a workaround
    -- https://github.com/Facepunch/garrysmod-issues/issues/1150
    -- https://github.com/Facepunch/garrysmod-issues/issues/2620
    if pl:Team() == TEAM_PROPS and ent:IsVehicle() then return false; end
	
	return true
end

function GM:PlayerReconnected( ply )
	local cvMaxChange	= PHX:GetCVar( "ph_max_teamchange_limit" )

	-- Check Player Team-Switch Limits if they were recently reconnected to the server.
	-- This will reset after new map has changed.
	if IsValid( ply ) and cvMaxChange ~= -1 and not ply:PHXIsStaff() and not ply:IsBot() then
		
		local id = ply:SteamID()
		local RecentPly = CTRL_TEAMLMT_DCPLAYERS[id] or 0
		RecentPly = math.Clamp( RecentPly, 0, cvMaxChange )
		
		if RecentPly > 0 then
			ply.ChangeLimit = RecentPly
			PHX:VerboseMsg("[Team] "..ply:Nick().." has remaining "..tostring(RecentPly).."x team switches (Max: "..cvMaxChange..")")
		else
		--	ply.ChangeLimit = 0
			PHX:VerboseMsg("[Team] "..ply:Nick().." has no reamining team switches.")
		end
		
	end

	hook.Run("PH_PlayerReconnected", ply)
end
function GM:CheckPlayerReconnected( ply )
	if self.ReconnectedPlayers[ ply:SteamID() ] then self:PlayerReconnected( ply ) end
end
function GM:PlayerDisconnected( ply )
	local cvMaxChanges	= PHX:GetCVar( "ph_max_teamchange_limit" )
	self.ReconnectedPlayers[ply:SteamID()] = true
	
	ply:RemoveProp()
    if IsValid(ply.propdecoy) then
        ply.propdecoy:SetOwner(NULL)
        ply.propdecoy = nil
    end
	
	if cvMaxChanges ~= -1 and not ply:PHXIsStaff() and not ply:IsBot() then
	
		local id = ply:SteamID()
		local plName = ply:Nick()
		CTRL_TEAMLMT_DCPLAYERS[id] = ply.ChangeLimit
		
		PHX:VerboseMsg("[Team] Saving player team change information of "..name.." ("..id..") => "..ply.ChangeLimit.."x")
		
	end

	self.BaseClass:PlayerDisconnected( ply )
end

function GM:Initialize()
    PHX:ManageGroupInfo( true, false, "SVAdmins", "admins", "PHX.AdminGroupInfo" )
	PHX:ManageGroupInfo( true, false, "IgnoreMutedUserGroup", "muted_groups", "PHX.MutedGroupInfo" )
	local cvAddHLA		= PHX:GetCVar( "ph_add_hla_combine" )

	-- Half-Life: Alyx Models, if exists. COMPLETELY OPTIONAL.
	if cvAddHLA then
		for _,model in pairs(DefaultHLAPM) do
			if (file.Exists(model, "GAME")) then
				local hlacombine = player_manager.TranslateToPlayerModelName(model)
				if (hlacombine ~= "kleiner") then
					PHX:VerboseMsg("[Misc] HLA Model found: " .. hlacombine .. ", adding to random combine model list...")
					table.insert(DefaultPM, hlacombine)
				end
			end
		end
	end
	
	if GAMEMODE.RoundBased then
		timer.Simple(3, function()
			GAMEMODE:StartRoundBasedGame()
		end)
	end
end

function GM:Think()
	self.BaseClass:Think()
	
	util.AllPlayers( function(v)
	
		local Class = v:GetPlayerClass()
		if Class and istable(Class) then
			v:CallClassFunction( "Think" )
		end
		
	end)

	-- Game time related
	if( !GAMEMODE.IsEndOfGame and ( !GAMEMODE.RoundBased or ( GAMEMODE.RoundBased and GAMEMODE:CanEndRoundBasedGame() ) ) and CurTime() >= GAMEMODE.GetTimeLimit() ) then
		GAMEMODE:EndOfGame( true )
	end
	
end

--hook.Add("PlayerInitialSpawn", "PHX.SetupPlayerInit", function(ply)
function GM:PlayerInitialSpawn( ply )
	--if not PHX.cvarsynced then PHX:InitCVar() end --Deprecated

	ply.LastPickupEnt		= NULL
	ply.ChangeLimit			= 0
	ply.HasTauntScannedData = false --Obsolete...?
	PHX:VerboseMsg("[Team] "..ply:Nick().."'s team switch limit initialised.")

	ply:SetTeam( TEAM_SPECTATOR )
	ply:SetPlayerClass( "Spectator" )
	ply.m_bFirstSpawn = true
	ply:UpdateNameColor()

	self:CheckPlayerReconnected( ply )
	
	-- Info Player Spawns
	timer.Simple(3.5, function()
		if PHX:GetCVar( "ph_notify_player_join_leave" ) then
			util.AllPlayers( function(v)
				if IsValid(ply) then v:PHXChatInfo( "NOTICE", "EV_PLAYER_JOINED", ply:Nick() ) end
			end)
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
    
	PlayerQueues[ ply ] = true
    -- Low chance of being unreliable: Send/Update admin data info
   --[[  hook.Add( "SetupMove", ply, function( self, ply, _, cmd )
		if self == ply and not cmd:IsForced() then
			hook.Run( "PHX.PlayerFullLoad", self ) -- it behave like think but predicted. do not use here.
			hook.Remove( "SetupMove", self )
            Core_SendGroupInfo( self ) -- if this not being sent properly, use -> timer.Simple(0, function() Core_SendGroupInfo( self ) end)
		end
	end ) ]]

end

hook.Add( "SetupMove", "PHXHook._PreparePHXData", function( ply, _, cmd )
	if PlayerQueues[ply] and not cmd:IsForced() then
		PlayerQueues[ply] = nil
		Core_SendGroupInfo( ply )
		Core_PHZSendAdditionalInfos( ply )
	end
end )

-- Called when the players spawns
hook.Add( "PlayerSpawn", "PHXHook.DoPlayerSpawn", function(pl)
	local HunterJumpPower 	= PHX:GetCVar( "ph_hunter_jumppower" )
	local PropJumpPower		= PHX:GetCVar( "ph_prop_jumppower" )

	pl:SetColor( color_white )
	pl:SetRenderMode(RENDERMODE_TRANSCOLOR)
	pl:UnLock()
	pl:ResetHull()
	pl:PHResetStat()
	pl:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
	pl:CollisionRulesChanged()
	
	local JumpPower = 160
	if pl:Team() == TEAM_HUNTERS then
		JumpPower = JumpPower * HunterJumpPower
	elseif pl:Team() == TEAM_PROPS then
		JumpPower = JumpPower * PropJumpPower
	end
	pl:SetJumpPower( JumpPower )

	-- Listen server host
	if not game.IsDedicated() then pl:SetNWBool("ListenServerHost", pl:IsListenServerHost()) end
end)


--[[ hook.Add("PH_RoundEnd", "PHX.RoundIsEnd", function()
    -- Unblind the hunters
	util.AllTeamPlayers( TEAM_HUNTERS, function(pl)
		pl:Blind(false)
		pl:UnLock()
	end )
	
	-- Give rewards for living props for a decoy
    if PHX:GetRoundNumber() > 2 and (not CTRL_ROUND_FORCEDEND) then -- It should start giving after 2nd Round and not forced round end.
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
end) ]]

-- //////// Begin of Round Control Override ////////

function GM:CheckPlayerDeathRoundEnd()
	if not self.RoundBased or not self:InRound() then return end

	local Teams = self:GetTeamAliveCounts()
	if table.Count(Teams) == 0 then
		
		PHX:VerboseMsg("[Round] Round Result: DRAW (No one wins)")
		self:RoundEndWithResult(1001, "HUD_LOSE")

		CTRL_VOICE_ISENDROUND = 1
		Game_MngTauntWindow(true)
		Game_ResetStatusTimer()
		PHX:PlayWinningSound(3)
		hook.Call("PH_OnRoundDraw", nil)

		return
	end

	if table.Count(Teams) == 1 then
		
		local TeamID = table.GetKeys(Teams)[1]
		if (TeamID == TEAM_PROPS or TeamID == TEAM_HUNTERS) then
		
			PHX:VerboseMsg("[Round] Round Result: "..team.GetName(TeamID).." ("..TeamID..") Wins!")
			self:RoundEndWithResult(TeamID, "HUD_TEAMWIN")

			CTRL_VOICE_ISENDROUND = 1
			Game_MngTauntWindow(true)
			Game_ResetStatusTimer()
			PHX:PlayWinningSound( TeamID )
			hook.Call("PH_OnRoundWinTeam", nil, TeamID)

			return
		end

	end
end

-- This is called when the round time ends (props win)
function GM:RoundTimerEnd()
	if not self:InRound() then return end

	PHX:VerboseMsg("[Round] Round Result: Props Wins! (Round Time Over)")
	self:RoundEndWithResult(TEAM_PROPS, "HUD_TEAMWIN")

	CTRL_VOICE_ISENDROUND = 1
	Game_MngTauntWindow(true)
	PHX:PlayWinningSound( TEAM_PROPS )
	hook.Call("PH_OnTimerEnd", nil)
end

-- Temporary Workaround for Spectating Props in OBS_MODE_IN_EYE
function GM:ChangeObserverMode( pl, mode )
	
	if pl:Team()==TEAM_PROPS and mode == OBS_MODE_IN_EYE then mode = OBS_MODE_CHASE end

	if ( mode == OBS_MODE_IN_EYE || mode == OBS_MODE_CHASE ) then
		self:StartEntitySpectate( pl, mode )
	end
	
	pl:SpectateEntity( NULL )
	pl:Spectate( mode )

end

-- Temporary Workaround for Spectating Props in OBS_MODE_IN_EYE
function GM:StartEntitySpectate( pl, mode )

	local CurrentSpectateEntity = pl:GetObserverTarget()

	if IsValid( CurrentSpectateEntity ) and CurrentSpectateEntity:Team() == TEAM_PROPS and mode == OBS_MODE_IN_EYE then
		mode = OBS_MODE_CHASE
		pl:Spectate( mode )
	end
	
	for i=1, 32 do
	
		if ( self:IsValidSpectatorTarget( pl, CurrentSpectateEntity ) ) then
			pl:SpectateEntity( CurrentSpectateEntity )
			pl:SetupHands( CurrentSpectateEntity )
			return
		end
	
		CurrentSpectateEntity = self:FindRandomSpectatorTarget( pl )
	
	end

end

-- Called every server tick.
--[[ function GM:Think()	
	-- Prop spectating is a bit messy so let us clean it up a bit
	if PHX.SPECTATOR_CHECK < CurTime() then
		for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
			if IsValid(pl) && !pl:Alive() && pl:GetObserverMode() == OBS_MODE_IN_EYE then
				hook.Call("ChangeObserverMode", GAMEMODE, pl, OBS_MODE_ROAMING)
			end
		end
		PHX.SPECTATOR_CHECK = CurTime() + PHX.SPECTATOR_CHECK_ADD
	end
end ]]

function GM:AddRoundTime() end
--[[ Temporarily disabled, I have to think about this
function GM:AddRoundTime( iAddedTime )
	
	if not self:InRound() then return end
	
	SetGlobalFloat( "RoundEndTime", GetGlobalFloat( "RoundEndTime", CurTime() ) + iAddedTime );
	timer.Adjust( "RoundEndTimer", GetGlobalFloat( "RoundEndTime" ) - GetGlobalFloat( "RoundStartTime" ), 0, function() 
		self:RoundTimerEnd() 
	end)
	
	BroadcastLua( string.format( "GAMEMODE:UpdateHUD_AddedTime(%d)", iAddedTime ) )

	hook.Run("PH_AddRoundTime", iAddedTime )

end ]]

function GM:RoundEndWithResult( result, resulttext )

	resulttext = self:ProcessResultText( result, resulttext )

	-- we will never use *RoundWinner because it's for invidiual player winning system.
	-- but because prop hunt is Round Based so it must be a Team Result winning system.
	
	if isnumber( result ) then
		self:SetRoundResult( result, resulttext )
		self:RoundEnd()
		self:OnRoundResult( result, resulttext )
	else
		self:SetRoundWinner( result, resulttext )
		self:RoundEnd()
		self:OnRoundWinner( result, resulttext )
	end

	hook.Call("PH_RoundEndResult", nil, result, resulttext)
	
end

-- Called when round: PreRoundEnd?, End, OnRoundEnd
function GM:RoundEnd()

	if ( !self:InRound() ) then 
		-- if someone uses RoundEnd incorrectly then do a trace.
		MsgN("WARNING: RoundEnd being called while gamemode not in round...")
		debug.Trace()
		return
	end

	local RoundNum = GetGlobalInt( "RoundNumber" )
	
	self:OnRoundEnd( RoundNum )
	self:SetInRound( false )
	
	timer.Destroy( "RoundEndTimer" )
	timer.Destroy( "CheckRoundEnd" )
	SetGlobalFloat( "RoundEndTime", -1 )
	timer.Simple( self.RoundPostLength, function() self:PreRoundStart( RoundNum + 1 ) end )

	--
	-- Unblind all hunters
	util.AllTeamPlayers( TEAM_HUNTERS, function(pl) pl:Blind(false); pl:UnLock() end )
	
	-- Give rewards for living props for a decoy after 2nd Round onwards and not forced by round end.
    if RoundNum > 2 and (not CTRL_ROUND_FORCEDEND) then
		util.AllTeamPlayers( TEAM_PROPS, function(pl)
            if PHX:GetCVar( "ph_enable_decoy_reward" ) and pl:Alive() and pl:Health() > 0 and (not pl:HasFakePropEntity()) then
                pl:SetFakePropEntity(true)
                pl:PHXChatPrint( "DECOY_GET_REWARD", Color(50,248,56), true )
				pl:PHXNotify( "DECOY_GET_REWARD", "GENERIC", 5, true )
            end
        end )
    end
	
	-- Stop autotaunting
	net.Start("AutoTauntRoundEnd")
	net.Broadcast()
	--
	
	hook.Call("PH_RoundEnd", nil)
	
end

function GM:OnRoundEnd( num )
	local cvWaitPlayers	= PHX:GetCVar( "ph_waitforplayers" )
	local cvMinPlayers	= math.Clamp(PHX:GetCVar( "ph_waitforplayers" ),  1, game.MaxPlayers())
	-- local game_RndAlreadyStarted = false --what happens if placed here?

	if ( cvWaitPlayers ) ) then
		local NumHunters = team.NumPlayers(TEAM_HUNTERS)
		local NumProps	 = team.NumPlayers(TEAM_PROPS)
		-- Take away a round number quickly before it adds another when there are not enough players
		-- Set to false
		if ( ( NumHunters < cvMinPlayers ) or ( NumProps < cvMinPlayers ) ) then
			game_RndAlreadyStarted = false
		end

		-- Set to true
		-- Posibly at this section causing "Waiting for New Round Start" due to New Balance is Active?
		if ( ( NumHunters >= cvMinPlayers ) and ( NumProps >= cvMinPlayers ) ) then
			game_RndAlreadyStarted = true
		end
		
		-- Check if the round was already started before so we count it as a fully played round
		if ( not game_RndAlreadyStarted ) then
			SetGlobalInt( "RoundNumber", GetGlobalInt("RoundNumber") - 1 )
		end
	end
	
	Game_ResetStatusTimer()
	
	hook.Call("PH_OnRoundEnd", nil, num)
	
end

-- Called when round: PreStart, Start, OnStart
function GM:OnPreRoundStart(num)
    CTRL_ROUND_FORCEDEND = false
	local cvSwapTeam		= PHX:GetCVar( "ph_swap_teams_every_round" )
	local cvNoticeRotation	= PHX:GetCVar( "ph_notice_prop_rotation" )
	local cvUsablePropType	= PHX:GetCVar( "ph_usable_prop_type" )
	local cvAllowArmor		= PHX:GetCVar( "ph_allow_armor" )

	local cvEnableBalance	= PHX:GetCVar( "ph_enable_teambalance" )
	local cvBalanceClassic	= PHX:GetCVar( "ph_team_balance_classic" )

	local cvGiveNadeNearEnd			= PHX:GetCVar( "ph_give_grenade_near_roundend" )
	local cvGiveNadeBeforeEndTime	= PHX:GetCVar( "ph_give_grenade_roundend_before_time" )
	local cvNadeCounts		= PHX:GetCVar( "ph_smggrenadecounts" )

	--https://github.com/Facepunch/garrysmod-issues/issues/5702
	Game_ResetOnRestart()
	game.CleanUpMap(false,nil,function()end) -- if this could crash a server when there is a fire entity: nil => { "env_fire", "entityflame", "_firesmoke" }
	
	if PHX:GetRoundNumber() ~= 1 and (cvSwapTeam or ((team.GetScore(TEAM_PROPS) + team.GetScore(TEAM_HUNTERS)) > 0)) then
		util.AllPlayers( function(pl)
			if pl:Team() == TEAM_PROPS or pl:Team() == TEAM_HUNTERS then
			
				if pl:Team() == TEAM_PROPS then
					pl:SetTeam(TEAM_HUNTERS)
				else
					pl:SetTeam(TEAM_PROPS)
                    if pl:HasFakePropEntity() then pl:PHXNotify( "DECOY_REMINDER_GET", "GENERIC", 18, true ); end
					if cvNoticeRotation then
						timer.Simple(0.5, function() pl:PHXNotify( "NOTIFY_IN_PROP_TEAM", "UNDO", 20, true ); end)
						pl:PHXNotify( "NOTIFY_ROTATE_NOTICE", "GENERIC", 18, true )
					end
					if cvUsablePropType > 2 then
						timer.Simple(0.75, function() pl:PHXChatInfo("NOTICE", "NOTIFY_CUST_ENT_TYPE_IS_ON"); end)
					end
				end
			
				pl:PHXChatInfo("NOTICE", "CHAT_SWAP")
			end
		end)
		
		-- Props will gain a Bonus Armor points if Hunter teams has more than 4 players in it. More player means more armor they can get.

        if cvAllowArmor then
            timer.Simple(1, function()
                local NumHunter = team.NumPlayers( TEAM_HUNTERS )
				if NumHunter < 4 then return end
				
				local min,max = 1,3
				if NumHunter >= 8 then min,max = 3,7 end
				
                util.AllTeamPlayers( TEAM_PROPS, function( ply )
					if IsValid(ply) then ply:SetArmor( math.random(min,max) * 15 ) end
				end )
            end)
        end
		
	end
	
	-- Balance teams. We need to set this "TRUE" to make sure the switched player isn't killed during team switch.
	-- These both have :SetTeam option, making HasLoadout stays true, bellow will fixes it.
	if cvEnableBalance then
		if cvBalanceClassic then
			self:CheckTeamBalance(true)
		else
			self:CheckTeamBalanceCustom()
		end
	end
    
    -- Timer to give grenades, if ph_give_grenade_near_roundend is set.
    timer.Create( "phx.tmr_GiveGrenade", self.RoundLength - cvGiveNadeBeforeEndTime, 1, function()
        if cvGiveNadeNearEnd and self:InRound() then

            util.AllTeamPlayers( TEAM_HUNTERS, function(h)
                if h:Alive() and h:HasWeapon( "weapon_smg1" ) then
                    h:SetAmmo( cvNadeCounts, "SMG1_Grenade" )
                    h:SendSurfaceSound("misc/grenadepickup.wav")
                    h:PHXNotify( "NOTICE_GRENADE_SMG_GIVEN", "GENERIC", 5, true )
                end
            end )

        end
    end)
	
	-- Clear All Hunter's HasLoadout
	for _,h in ipairs(team.GetPlayers( TEAM_HUNTERS )) do h.PHXHasLoadout = false; end
	UTIL_StripAllPlayers()
	UTIL_SpawnAllPlayers()
	
	hook.Call("PH_OnPreRoundStart", nil, num, cvSwapTeam)
end

function GM:RoundStart()

	local roundNum 		= GetGlobalInt( "RoundNumber" )
	local roundDuration = self:GetRoundTime( roundNum )

	local cvWaitPlayers	= PHX:GetCVar( "ph_waitforplayers" )
	local cvMinPlayers	= math.Clamp(PHX:GetCVar( "ph_waitforplayers" ),  1, game.MaxPlayers())
	
	self:OnRoundStart( roundNum )

	timer.Create( "RoundEndTimer", roundDuration, 0, function() self:RoundTimerEnd() end )
	timer.Create( "CheckRoundEnd", 1, 0, function() self:CheckRoundEnd() end )
	SetGlobalFloat( "RoundEndTime", CurTime() + roundDuration );
	
	if ( cvWaitPlayers ) then
	
		-- Pause these timers if there are not enough players on the teams in the server
		local NumHunters = team.NumPlayers(TEAM_HUNTERS)
		local NumProps	 = team.NumPlayers(TEAM_PROPS)

		if ( ( NumHunters < cvMinPlayers ) or ( NumProps < cvMinPlayers ) ) then
		
			if ( timer.Exists( "RoundEndTimer" ) and timer.Exists( "CheckRoundEnd" ) ) then
			
				timer.Pause( "RoundEndTimer" )
				timer.Pause( "CheckRoundEnd" )
				SetGlobalFloat( "RoundEndTime", -1 );
				
				team.SetScore(TEAM_PROPS, 0)
				team.SetScore(TEAM_HUNTERS, 0)

				util.AllPlayers( function(pl) pl:PHXChatInfo("ERROR", "CHAT_NOPLAYERS"); end)

			end
		
		end
	
	end
	
	-- Send this as a global boolean
	SetGlobalBool( "RoundWaitForPlayers", cvWaitPlayers ) -- -> Fretta's GM:RefreshHUD()
	
	hook.Call("PH_RoundStart", nil)
	
end

function GM:OnRoundStart( num )
	UTIL_UnFreezeAllPlayers()
	hook.Call("PH_OnRoundStart", nil, num)
end

-- //////// End of Round Control Override //////// --

-- 'MOUSE1/CLICK' props replication behaviour
hook.Add( "KeyPress", "PHXHook.PlayerKeyPress", function( pl, key )
	if IsValid(pl) and IsPlayerAlive( TEAM_PROPS ) then	
		if key == IN_ATTACK then
			local trace = {}
			local cvCheckRoom = PHX:GetCVar( "ph_check_for_rooms" )
			local min,max = pl:GetHull()
			local filter = {}
            
			table.Add(filter, ents.FindByClass("ph_prop"))
            table.Add(filter, player.GetAll())
            trace = GAMEMODE.ViewCam:CommonCamCollEnabledView( pl, pl:EyePos(), pl:EyeAngles(), false, max.z )
			trace.filter = filter
			
			local trace2 = util.TraceLine(trace)
			local Ent = trace2.Entity
			if IsValid( Ent ) and PHX:IsUsablePropEntity( Ent:GetClass() ) then
				if pl:GetVar("UseTime",0) <= CurTime() and not pl:IsHoldingEntity() then
					local hmx,hmy,hz = Ent:GetPropSize()
					if cvCheckRoom and !pl:CheckHull(hmx, hmy, hz) then
						pl:PHXChatInfo("WARNING", "CHAT_PROP_NO_ROOM")
					else
						GAMEMODE:PlayerExchangeProp(pl, Ent)
					end
					pl:SetVar("UseTime",CurTime()+1)
				end
			end
		end
	end
end)

hook.Add( "PlayerButtonDown", "PHXHook.ButtonDown_KeyBinds", function(pl, key)
	if not PHX:GameInRound() then return end

	local plkey_RTaunt 		= pl:GetInfoNum("ph_default_taunt_key", 0)
	local plkey_CTaunt		= pl:GetInfoNum("ph_default_customtaunt_key", 0)
	local plkey_RotLock		= pl:GetInfoNum("ph_default_rotation_lock_key", 0)
	local plkey_PropFreeze	= pl:GetInfoNum("ph_prop_midair_freeze_key", 0)
	local plkey_Decoy		= pl:GetInfoNum("ph_cl_decoy_spawn_key", 0)
	local plkey_Unstuck		= pl:GetInfoNum("ph_cl_unstuck_key", 0)
	
	if IsValid(pl) and pl:Alive() and (pl:Team() == TEAM_PROPS or pl:Team() == TEAM_HUNTERS) then
		-- if you're excluding custom taunts not to be played on random taunts or use them *only* for specific 'groups', you're evil. jk it's good tho :)
		local tn_pitchRand		= pl:GetInfoNum("ph_cl_pitch_apply_random", 0)				-- Also applies for random taunt, specified with pitch level
		local tn_pitchLevel		= pl:GetInfoNum("ph_cl_pitch_level", 100)					-- Pitch level to use
		local tn_bIsRandomPitch	= tobool(pl:GetInfoNum("ph_cl_pitch_randomized_random", 0))	-- Use Randomized pitch for Random Taunts instead of specified level
    	local tn_bIsRClickMode	= tobool(pl:GetInfoNum("ph_prop_right_mouse_taunt", 0))  	-- Right Click for taunt. Changed to clientside convar instead
		local cvTauntMode		= PHX:GetCVar( "ph_custom_taunt_mode" )
		local cvTauntDelay		= PHX:GetCVar( "ph_normal_taunt_delay" )
		local cvUseUnstuck		= PHX:GetCVar( "ph_use_unstuck" )

		-- Section: Both Team
		if (key == plkey_RTaunt) or ( pl:Team() == TEAM_PROPS and (tn_bIsRClickMode and key == MOUSE_RIGHT) ) then
			if cvTauntMode == 1 then
				pl:ConCommand("ph_showtaunts")
			elseif cvTauntMode == 0 or cvTauntMode == 2 and pl:GetLastTauntTime( "LastTauntTime" ) + cvTauntDelay <= CurTime() then
				local CachedTauntsProp,CachedTauntHunter = PHX.CachedTaunts[TEAM_PROPS],PHX.CachedTaunts[TEAM_HUNTERS]
				if CachedTauntsProp and table.IsEmpty(CachedTauntsProp) then return end
				if CachedTauntHunter and table.IsEmpty(CachedTauntHunter) then return end
				
				PHX:PlayTaunt( pl, true, tn_pitchRand, tn_pitchLevel, tn_bIsRandomPitch, "LastTauntTime" )
			end
			return
		end
		
		if (key == plkey_CTaunt) then pl:ConCommand("ph_showtaunts"); return; end
		if (key == plkey_Unstuck) and cvUseUnstuck then GAMEMODE:UnstuckPlayer(pl); return; end
	
		-- Team Props
		if pl:Team() == TEAM_PROPS then
	
			-- Lock rotation
			if (key == plkey_RotLock) then
				local SetLockRot = true
				local SetRotState = 1
				local Text		= { "HUD_ROTLOCK", PHX_COL_ROTLOCK }
				if pl:GetPlayerLockedRot() then
					SetLockRot	= false
					SetRotState	= 0
					Text		= { "HUD_ROTFREE", PHX_COL_ROTFREE }
				end
				pl:SetPlayerLockedRot( SetLockRot )
				pl:SendRotState( SetRotState )
				pl:PrintCenter( unpack( Text ) )

				return
			end
			
			-- Freeze Prop while midair
			if (key == plkey_PropFreeze) then pl:FreezePropMidAir(); return; end
			-- Spawn Decoy
			if (key == plkey_Decoy) and pl:HasFakePropEntity() then pl:PlaceDecoyProp(); return; end
			
			return
		-- Team Hunters
		elseif pl:Team() == TEAM_HUNTERS then
			
			-- Add Something here for hunters. Sometimes in future I think.
			return
			
		end
	end
end)

-- //////// Miscellaneous Stuffs //////// --

-- Spray Control
hook.Add( "PlayerSpray", "PHXHook.PlayerSpraying", function( ply )
	if not ply:Alive() or ply:PHIsSpectators() then return true; end
end)

hook.Add( "AllowPlayerPickup", "PHXHook.AllowPlayerPickup", function(ply,ent)
	ply.LastPickupEnt = ent; ent.LastPickupPly = ply;
end)

-- Addition from PH:E/Plus: Fall Damage
function GM:GetFallDamage(ply, flFallSpeed)
	local Real = PHX:GetCVar( "ph_falldamage_real" )
	local IsEnabled = PHX:GetCVar( "ph_falldamage" )

	if !self:InRound() or !IsEnabled then return 0 end
	if Real then return flFallSpeed / 8 end

	return 10
end

-- Lucky Balls
function GM:PropBreak( ply, ent )
	if IsValid(ent) then
		local cvLuckyBall = PHX:GetCVar( "ph_enable_lucky_balls" )
		if cvLuckyBall and self:InRound() and math.random() < 0.08 then
			local Mins,Maxs = ent:GetModelBounds()
			local pos = ent:GetPos() + Vector(0,0,Maxs.z) --will spawn at very top of bounding boxes

			local lb = ents.Create( "ph_luckyball" )
			lb:SetPos(pos)
			lb:SetAngles( angle_zero )
			lb:SetColor( ColorRand() )
			
			lb:Spawn()
			lb:Activate()
		end
	end
end

-- Flashlight toggling
function GM:PlayerSwitchFlashlight(pl, on)
	if pl:Alive() then
		if pl:Team() == TEAM_HUNTERS then return true end
		if pl:Team() == TEAM_PROPS then pl:PropSwitchLight(); end
	end
	return false
end

local function cmd_ForceEndRound( ply )
    if PHX:GameInRound() and ( util.IsStaff( ply ) ) then
    
        CTRL_ROUND_FORCEDEND = true
        GAMEMODE:RoundEndWithResult(1001, "HUD_LOSE")
        CTRL_VOICE_ISENDROUND = 1
        Game_MngTauntWindow(true)
        
        PHX:PlayWinningSound( 3 )
        Game_ResetStatusTimer()    -- Always check if any timers running.
        
        MsgAll("Round was forced end. No one Wins!\n")
    
    else
        if ply == NULL then
			print( "[PHX] Cannot Restart round: Not in active round!" )
		else
			ply:PrintMessage(HUD_PRINTTALK, "[PHX] Sorry, this command is unavailable.")
		end
    end
end
concommand.Add("ph_force_end_round", cmd_ForceEndRound, nil, "Force End Active Round")