-- WARNING: THIS CODE IS UNFINISHED!!!!

------------------------------------------------------------
-- There are only few modifications made on Line: @49, @57, @266, @271
------------------------------------------------------------

-- Send required file to clients
AddCSLuaFile("sh_init.lua")
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
SetGlobalInt("unBlind_Time", math.Clamp(PHX.CVAR.BlindTime:GetInt() - (CurTime() - GetGlobalFloat("RoundStartTime", 0)), 0, PHX.CVAR.BlindTime:GetInt()) )

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
	for k, v in pairs( player.GetAll() ) do
		v:PHXChatInfo( "NOTICE", "EV_PLAYER_CONNECT", data.name )
	end
end )

gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "AnnouncePLLeave", function( data )
	for k,v in pairs( player.GetAll() ) do
		v:PHXChatInfo( "NOTICE", "EV_PLAYER_DISCONNECT", data.name, data.reason )
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
		GAMEMODE:RoundEndWithResult(1001, "Draw, everyone loses!")
		PHX.VOICE_IS_END_ROUND = 1
		ForceCloseTauntWindow(1)
		
		net.Start("PH_RoundDraw_Snd")
		net.Broadcast()
		
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
			GAMEMODE:RoundEndWithResult(TeamID, team.GetName(TeamID).." win!")
			PHX.VOICE_IS_END_ROUND = 1
			ForceCloseTauntWindow(1)
			
			-- send the win notification
			net.Start("PH_TeamWinning_Snd")
				net.WriteString(PHX.WINNINGSOUNDS[TeamID])
			net.Broadcast()
			
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
		if ( dmginfo:GetAttacker():IsPlayer() && dmginfo:GetAttacker():Team() == ent:Team() ) 
			then PHX.VerboseMsg("DMGINFO::ATTACKED!!-> "..tostring(dmginfo:GetAttacker())..", DMGTYPE: "..dmginfo:GetDamageType())
			return 
		end
		--Debug purpose.
		PHX.VerboseMsg("!! " .. ent:Name() .. "'s PLAYER entity appears to have taken damage, we can redirect it to the prop! (Model is: " .. ent.ph_prop:GetModel() .. ")")
		ent.ph_prop:TakeDamageInfo(dmginfo)
		return
	end
	
	if GAMEMODE:InRound() && ent && (ent:GetClass() != "ph_prop" && ent:GetClass() != "func_breakable" && ent:GetClass() != "prop_door_rotating" && ent:GetClass() != "prop_dynamic*") && !ent:IsPlayer() && att && att:IsPlayer() && att:Team() == TEAM_HUNTERS && att:Alive() then
		if att:Armor() >= 5 && PHX.CVAR.HunterPenalty:GetInt() >= 5 then
			att:SetHealth(att:Health() - (math.Round(PHX.CVAR.HunterPenalty:GetInt()/2)))
			att:SetArmor(att:Armor() - 15)
			if att:Armor() < 0 then att:SetArmor(0) end
		else
			att:SetHealth(att:Health() - PHX.CVAR.HunterPenalty:GetInt())
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

-- Called when player tries to pickup a weapon
function GM:PlayerCanPickupWeapon(pl, ent)
	if pl:Team() != TEAM_HUNTERS then
		return false
	end
	
	return true
end

local phx_blind_unlocktime = 0
-- function to respawn players during blind mode.
-- this is usually noticed when the player is falling, changing team, or etc.
local function AutoRespawnCheck(ply)

	-- Require at least 3 players.
	if PHX.CVAR.AllowRespawnOnBlind:GetBool() and player.GetCount() > 2 and (ply:Team() == TEAM_PROPS or ply:Team() == TEAM_HUNTERS) then
	
		if CurTime() < phx_blind_unlocktime then
			timer.Simple(math.random(0.5,1), function() if 
				IsValid(ply) then
					local tim = PHX.CVAR.AllowRespawnOnBlindTeam:GetInt()
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
	if PHX.CVAR.AllowSpectatorRespawnOnBlind:GetBool() and (old == TEAM_SPECTATOR && (new == TEAM_HUNTERS or new == TEAM_PROPS)) then
		timer.Simple(math.random(0.5,1), function()
			if IsValid(ply) then AutoRespawnCheck( ply ) end
		end)
	end
	
	-- not recommended if this enabled. See: "help ph_allow_respawnonblind_teamchange" in the console for more information.
	if PHX.CVAR.AllowRespawnOnBlindBetweenTeams:GetBool() and ( (old == TEAM_HUNTERS and new == TEAM_PROPS) or (old == TEAM_PROPS and new == TEAM_HUNTERS) ) then
		timer.Simple(math.random(0.5,1), function()
			if IsValid(ply) then AutoRespawnCheck( ply ) end
		end)
	end
end

hook.Add("OnPlayerChangedTeam", "TeamChange_switchLimitter", function(ply, old, new)
	local MAX_TEAMCHANGE_LIMIT = PHX.CVAR.ChangeTeamLimit:GetInt()

	if MAX_TEAMCHANGE_LIMIT ~= -1 and (not ply:IsBot()) and !ply:CheckUserGroup() then
		if new ~= TEAM_SPECTATOR then
			ply.ChangeLimit = ply.ChangeLimit + 1
			ply:ChatPrint("[PHX] You're switching teams "..ply.ChangeLimit.."x (".. tostring(MAX_TEAMCHANGE_LIMIT) .."x MAX). After that, You can no longer switch to opposite team.")
			PHX.VerboseMsg("[PHX] "..ply:Nick().." has switched team "..ply.ChangeLimit.."x.")
		end
		
		if ply.ChangeLimit > MAX_TEAMCHANGE_LIMIT and new ~= TEAM_SPECTATOR then
			ply.ChangeLimit = MAX_TEAMCHANGE_LIMIT
			timer.Simple(0.3, function()
				if old ~= TEAM_SPECTATOR then
					ply:SetTeam(old)
					ply:ChatPrint("[PHX] Cannot join to team ".. team.GetName(new) .." Because you have exceeded the number of team changes.")
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
	SetGlobalInt("unBlind_Time", math.Clamp(PHX.CVAR.BlindTime:GetInt() - (CurTime() - GetGlobalFloat("RoundStartTime", 0)), 0, PHX.CVAR.BlindTime:GetInt()) )
	
	local cvarPercent	= PHX.CVAR.BlindRespawnTimePercent:GetFloat()
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
if (PHX.CVAR.HLACombine:GetBool()) then
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

	if PHX.CVAR.UseCustomModel:GetBool() then
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

	if pl:Team() == TEAM_PROPS && pl:IsOnGround() && !pl:Crouching() && table.HasValue(PHX.USABLE_PROP_ENTITIES, ent:GetClass()) && ent:GetModel() then
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
			
			pl:SetHealth(new_health)
			
			if PHX.CVAR.EnableOBBMod:GetBool() && ent:GetNWBool("hasCustomHull",false) then
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
	if pl.UseTime <= CurTime() then
		
		local hmx, hz = ent:GetPropSize()
		if PHX.CVAR.CheckSpace:GetBool() && !pl:CheckHull(hmx, hmx, hz) then
			pl:SendLua("chat.AddText(Color(235, 10, 15), \"[PHX]\", Color(220, 220, 220), \" There is no room to change that prop!\")")
		else
			self:PlayerExchangeProp(pl, ent)
		end
		
		pl.UseTime = CurTime() + 1
		
	end
	
	-- control who can pick up objects
	if table.HasValue(PHX.USABLE_PROP_ENTITIES, ent:GetClass()) then
		local state = PHX.CVAR.AllowPickupProp:GetInt()
	
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
	
	-- Save player Change Team info -- this will reset after map has been changed
	if PHX.CVAR.ChangeTeamLimit:GetInt() ~= -1 and !ply:CheckUserGroup() and (not ply:IsBot()) then
	
		local id = ply:SteamID()
		PHX.CurPlys[id] = ply.ChangeLimit
		
		PHX.VerboseMsg("[PHX] Saving player team change information of "..ply:Nick().." ("..ply:SteamID()..") -> ["..ply.ChangeLimit.."]")
		
	end
end
hook.Add("PlayerDisconnected", "PH_PlayerDisconnected", PlayerDisconnected)

-- Set specific variable for checking in player initial spawn, then use Player:IsHoldingEntity()
PHX.CurPlys = {}
hook.Add("PlayerInitialSpawn", "PHX.SetupInitData", function(ply)
	ply.LastPickupEnt	= NULL
	ply.UseTime			= 0
	ply.ChangeLimit		= 0
	
	-- Player Switch Teams Initialisations	
	if IsValid(ply) && PHX.CVAR.ChangeTeamLimit:GetInt() ~= -1 && !ply:CheckUserGroup() && !ply:IsBot() then
		
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
	pl.last_taunt_time = 0
	
	net.Start("ResetHull")
	net.Send(pl)
	
	net.Start("DisableDynamicLight")
	net.Send(pl)
	
	pl:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
	pl:CollisionRulesChanged()
	
	if pl:Team() == TEAM_HUNTERS then
		pl:SetJumpPower(160)
	elseif pl:Team() == TEAM_PROPS then
		pl:SetJumpPower(160 * PHX.CVAR.PropJumpPower:GetFloat())
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
	
	-- Stop autotaunting
	net.Start("AutoTauntRoundEnd")
	net.Broadcast()
end
hook.Add("PH_RoundEnd", "PH.ForceHuntersUnblind", RoundEnd)


-- This is called when the round time ends (props win)
function GM:RoundTimerEnd()
	if !GAMEMODE:InRound() then
		return
	end

	GAMEMODE:RoundEndWithResult(TEAM_PROPS, "Props win!")
	PHX.VOICE_IS_END_ROUND = 1
	ForceCloseTauntWindow(1)
	
	net.Start("PH_TeamWinning_Snd")
	net.WriteString(PHX.WINNINGSOUNDS[TEAM_PROPS])
	net.Broadcast()
	
	hook.Call("PH_OnTimerEnd", nil)
end


-- Called before start of round
function GM:OnPreRoundStart(num)
	game.CleanUpMap()
	
	if GetGlobalInt("RoundNumber") != 1 && (PHX.CVAR.SwapTeam:GetInt() == 1 || ((team.GetScore(TEAM_PROPS) + team.GetScore(TEAM_HUNTERS)) > 0)) then
		for _, pl in pairs(player.GetAll()) do
			if pl:Team() == TEAM_PROPS || pl:Team() == TEAM_HUNTERS then
				if pl:Team() == TEAM_PROPS then
					pl:SetTeam(TEAM_HUNTERS)
				else
					pl:SetTeam(TEAM_PROPS)
					if PHX.CVAR.PropNotifyRotation:GetBool() then
						timer.Simple(0.5, function() pl:SendLua( [[notification.AddLegacy("You are in Prop Team with Rotate support! You can rotate the prop around by moving your mouse.", NOTIFY_UNDO, 20 )]] ) end)
						pl:SendLua( [[notification.AddLegacy("Additionally you can toggle lock rotation by pressing R key!", NOTIFY_GENERIC, 18 )]] )
						pl:SendLua( [[surface.PlaySound("garrysmod/content_downloaded.wav")]] )
					end
				end
			
			pl:ChatPrint("Teams have been swapped!")
			end
		end
		
		-- Props will gain a Bonus Armor points Hunter teams has more than 4 players in it. More player means more armor that they get.
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
		
		hook.Call("PH_OnPreRoundStart", nil, PHX.CVAR.SwapTeam:GetInt())
	end
	
	-- temporary team balance option, we set "TRUE" to make sure player isn't killed during team switch.
	if PHX.CVAR.EnableTeamBalance:GetInt() then
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
	if PHX.CVAR.UseLuckyBall:GetBool() then
		local pos = ent:GetPos()
		if math.random() < 0.08 then -- 8% Chance of drops.
			local dropent = ents.Create("ph_luckyball")
			dropent:SetPos(Vector(pos.x, pos.y, pos.z + 32)) -- to make sure the Lucky Ball didn't fall underground.
			dropent:SetAngles(Angle(0,0,0))
			dropent:SetColor(Color(math.Round(math.random(0,255)),math.Round(math.random(0,255)),math.Round(math.random(0,255)),255))
			dropent:Spawn()
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
	-- Check if PHX.CVAR.WaitForPlayers:GetBool() is true
	-- This is a fast implementation for a waiting system
	-- Make optimisations if needed
	if ( PHX.CVAR.WaitForPlayers:GetBool() ) then
		-- Take away a round number quickly before it adds another when there are not enough players
		-- Set to false
		if ( ( team.NumPlayers( TEAM_HUNTERS ) < PHX.CVAR.MinWaitForPlayers:GetInt() ) || ( team.NumPlayers( TEAM_PROPS ) < PHX.CVAR.MinWaitForPlayers:GetInt() ) ) then
			bAlreadyStarted = false
		end

		-- Set to true
		if ( ( team.NumPlayers( TEAM_HUNTERS ) >= PHX.CVAR.MinWaitForPlayers:GetInt() ) && ( team.NumPlayers( TEAM_PROPS ) >= PHX.CVAR.MinWaitForPlayers:GetInt() ) ) then
			bAlreadyStarted = true
		end
		
		-- Check if the round was already started before so we count it as a fully played round
		if ( !bAlreadyStarted ) then
			SetGlobalInt( "RoundNumber", GetGlobalInt("RoundNumber") - 1 )
		end
	end
	
	hook.Call("PH_OnRoundEnd", nil, num)
	
end

function GM:RoundStart()

	local roundNum = GetGlobalInt( "RoundNumber" );
	local roundDuration = GAMEMODE:GetRoundTime( roundNum )
	
	GAMEMODE:OnRoundStart( roundNum )

	timer.Create( "RoundEndTimer", roundDuration, 0, function() GAMEMODE:RoundTimerEnd() end )
	timer.Create( "CheckRoundEnd", 1, 0, function() GAMEMODE:CheckRoundEnd() end )
	
	SetGlobalFloat( "RoundEndTime", CurTime() + roundDuration );
	
	-- Check if PHX.CVAR.WaitForPlayers:GetBool() is true
	-- This is a fast implementation for a waiting system
	-- Make optimisations if needed
	if ( PHX.CVAR.WaitForPlayers:GetBool() ) then
	
		-- Pause these timers if there are not enough players on the teams in the server
		if ( ( team.NumPlayers( TEAM_HUNTERS ) < PHX.CVAR.MinWaitForPlayers:GetInt() ) || ( team.NumPlayers( TEAM_PROPS ) < PHX.CVAR.MinWaitForPlayers:GetInt() ) ) then
		
			if ( timer.Exists( "RoundEndTimer" ) && timer.Exists( "CheckRoundEnd" ) ) then
			
				timer.Pause( "RoundEndTimer" )
				timer.Pause( "CheckRoundEnd" )
			
				SetGlobalFloat( "RoundEndTime", -1 );
			
				PrintMessage( HUD_PRINTTALK, "There's not enough players to start the game!" )
				-- Reset the team score
				team.SetScore(TEAM_PROPS, 0)
				team.SetScore(TEAM_HUNTERS, 0)
			end
		
		end
	
	end
	
	-- Send this as a global boolean
	SetGlobalBool( "RoundWaitForPlayers", PHX.CVAR.WaitForPlayers:GetBool() )
	
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
			if plhullz < 24 then
				trace.start = pl:EyePos() + Vector(0, 0, plhullz + (24-  plhullz))
				trace.endpos = pl:EyePos() + Vector(0, 0, plhullz + (24 - plhullz)) + pl:EyeAngles():Forward() * 100
			elseif plhullz > 84 then
				trace.start = pl:EyePos() + Vector(0, 0, plhullz - 84)
				trace.endpos = pl:EyePos() + Vector(0, 0, plhullz - 84) + pl:EyeAngles():Forward() * 300
			else
				trace.start = pl:EyePos() + Vector(0, 0, 8)
				trace.endpos = pl:EyePos() + Vector(0, 0, 8) + pl:EyeAngles():Forward() * 100
			end
			trace.filter = ents.FindByClass("ph_prop")
			
			local trace2 = util.TraceLine(trace) 
			if trace2.Entity && trace2.Entity:IsValid() && table.HasValue(PHX.USABLE_PROP_ENTITIES, trace2.Entity:GetClass()) then
				if pl.UseTime <= CurTime() then
					if !pl:IsHoldingEntity() then
						local hmx, hz = trace2.Entity:GetPropSize()
						if PHX.CVAR.CheckSpace:GetBool() && !pl:CheckHull(hmx, hmx, hz) then
							pl:SendLua("chat.AddText(Color(235, 10, 15), \"[PHX]\", Color(220, 220, 220), \" There is no room to change that prop!\")")
						else
							GAMEMODE:PlayerExchangeProp(pl, trace2.Entity)
						end
					end
					pl.UseTime = CurTime() + 1
				end
			end
		end
	end
	
	-- Prop rotation lock key
	if pl && pl:IsValid() && pl:Alive() && pl:Team() == TEAM_PROPS then
		if key == IN_RELOAD then
			if pl:GetPlayerLockedRot() then
				pl:SetNWBool("PlayerLockedRotation", false)
				pl:PrintMessage(HUD_PRINTCENTER, "Prop Rotation: Free")
				net.Start("PHX.rotateState")
					net.WriteInt(0, 2)
				net.Send(pl)
			else
				pl:SetNWBool("PlayerLockedRotation", true)
				pl:PrintMessage(HUD_PRINTCENTER, "Prop Rotation: Locked")
				net.Start("PHX.rotateState")
					net.WriteInt(1, 2)
				net.Send(pl)
			end
		end
	end
end
hook.Add("KeyPress", "PlayerPressedKey", PlayerPressedKey)

hook.Add("PlayerButtonDown", "PlayerButton_ControlTaunts", function(pl, key)
	local info 	 = pl:GetInfoNum("ph_default_taunt_key", 0)
	local ctInfo = pl:GetInfoNum("ph_default_customtaunt_key", 0)
	
	if ((info == BUTTON_CODE_NONE or info == BUTTON_CODE_INVALID) or (ctInfo == BUTTON_CODE_NONE or ctInfo == BUTTON_CODE_INVALID)) then
		pl:ChatPrint("[Prop Hunt] You haven't bound any keys to trigger Taunts. Please Navigate to '[F1] > Prop Hunt Menu > Player' to setup binds for taunts.")
		return
	end
	
	-- if you're excluding custom taunts not to be played on random taunts or use them *only* for specific 'groups', you're evil.
	if pl and pl:IsValid() and pl:Alive() and (key == info or (pl:Team() == TEAM_PROPS and key == MOUSE_RIGHT)) then
		if (PHX.CVAR.CustomTauntMode:GetInt() == 1) && GAMEMODE:InRound() then
			pl:ConCommand("ph_showtaunts")
		elseif ((PHX.CVAR.CustomTauntMode:GetInt() == 0) or (PHX.CVAR.CustomTauntMode:GetInt() == 2)) and
			GAMEMODE:InRound() and pl:Alive() and (pl:Team() == TEAM_HUNTERS || pl:Team() == TEAM_PROPS) and 
			pl.last_taunt_time + PHX.CVAR.NormalTauntDelay:GetInt() <= CurTime() and
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
			
			pl.last_taunt_time = CurTime() + PHX.CVAR.NormalTauntDelay:GetInt()
			pl.last_taunt = rand_taunt
			
			pl:EmitSound(rand_taunt, 100)
			pl:SetNWFloat("LastTauntTime", CurTime())
			
		end
	end
	
	if pl and pl:IsValid() and pl:Alive() and (key == ctInfo) then
		pl:ConCommand("ph_showtaunts")
	end
end)