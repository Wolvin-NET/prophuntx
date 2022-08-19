PHX.DEFAULT_CATEGORY = "PHX Original"

-- Permanently banned models.
local phx_PermaBannedModels = {
    -- Props that can cause server crash. Please DO NOT REMOVE as this is for your own safety sake!
    "models/props/ph_gas_stationrc7/piepan.mdl",
    
    -- General Tiny / Exploitable Props.
    "models/props/cs_assault/money.mdl",
    "models/props/cs_assault/dollar.mdl",
    "models/props/cs_office/snowman_arm.mdl",
    "models/props/cs_office/computer_mouse.mdl",
    "models/props/cs_office/projector_remote.mdl",
    "models/foodnhouseholditems/egg.mdl",
    "models/props/cs_militia/reload_bullet_tray.mdl",
    "models/sims/lightwall2.mdl"
}

-- Decoy Default Distance
PHX.DecoyDistance   = 250

-- Time (in seconds) for spectator check (Default: 0.1)
PHX.SPECTATOR_CHECK_ADD = 0.1

-- [ Usable Entities ]
-- Do Not Use / Modify from THIS TABLE!
--====================================================================================--
-- RULES: MUST HAVE VPHSYICS, MUST HAVE PROPER BOUNDING BOX.
-- NO VPHYSICS = IGNORED
--====================================================================================--
PHX.CVARUseAbleEnts = {
	-- Due to Performance issue, table must contains: [classname] = true. We'll starting to avoid table.HasValue for now.
	[1]	= { 
		-- DO NOT ADD OR CHANGE ANYTHING HERE, USE [4] BELOW!
		["prop_physics"]				= true,
		["prop_physics_multiplayer"]	= true,
		["prop_physics_override"]		= true
		-- DO NOT ADD OR CHANGE ANYTHING HERE, USE [4] BELOW!
	},
	[2]	= {
		-- DO NOT ADD OR CHANGE ANYTHING HERE, USE [4] BELOW!
		["prop_physics"]				= true,
		["prop_physics_multiplayer"]	= true,
		["prop_physics_override"]		= true,
		["prop_dynamic"] 				= true,
		["prop_dynamic_override"] 		= true
		-- DO NOT ADD OR CHANGE ANYTHING HERE, USE [4] BELOW!
	},
	[3] = {
		-- DO NOT ADD OR CHANGE ANYTHING HERE, USE [4] BELOW!
		["prop_physics"]				= true,
		["prop_physics_multiplayer"]	= true,
		["prop_physics_override"]		= true,
		["prop_dynamic"] 				= true,
		["prop_dynamic_override"] 		= true,
		["prop_ragdoll"]				= true, -- Warning: prop_ragdoll will be deprecated: Causing bug with Pitch Prop Rotation.
		["ph_luckyball"]				= true,
		["item_healthkit"] 				= true,
		["item_battery"] 				= true,
		["item_item_crate"] 			= true,
		["item_ammo_crate"] 			= true,
		["prop_door_rotating"]			= true,
		["prop_vehicle_jeep"]			= true,
		["prop_vehicle_drivable"]		= true,
		["prop_vehicle_apc"]			= true,
		["prop_vehicle_airboat"]		= true,
		["prop_thumper"]				= true, -- thumper is too big i guess. 
		["combine_mine"]				= true
		-- DO NOT ADD OR CHANGE ANYTHING HERE, USE [4] BELOW!
		
		-- I'm not going to add any weapons or other item entities so it's up to you to add by using PHX.USABLE_PROP_CUSTOM_ENTS below.
		-- These are recommended list and please do a copy paste to table below to modify. NOT inside this table!!!
	},
	[4] = {
		-- Enter any custom entities here. Avoid adding dangerous entities which may cause your server/game to CRASH! 
		-- See: https://gmodgameservers.com/wiki/prophuntx/#0_QuickFix/Dangerous_Entities+Dangerous_Entities
		--====================================================================================--
		-- RULES: MUST HAVE VPHSYICS, MUST HAVE PROPER COLLISION BOUNDS/BOUNDING BOX (BBOX).
		-- NO VPHYSICS = IGNORED
		--====================================================================================--
		["prop_physics"]				= true,
		["prop_physics_multiplayer"] 	= true,
		["prop_physics_override"] 		= true
	}
}

-- Initialise
PHX.USABLE_PROP_ENTITIES = PHX.USABLE_PROP_ENTITIES or PHX.CVARUseAbleEnts[1]

function PHX:IsUsablePropEntity( entClass )
	if entClass and entClass ~= nil then
		if self.USABLE_PROP_ENTITIES[entClass] then
			return true
		end
	end
	return false
end

-- Called only from cvars.AddChangeCallback. Do Not use outside from cvar's callback function!
function PHX:SetUsableEntity( number )
	if !number and !isnumber(number) then return end

	if number >= 1 and number <= 4 then
		self.USABLE_PROP_ENTITIES = self.CVARUseAbleEnts[number]
	else
		ErrorNoHalt("Error: SetUsableEntity number argument is out of range! (min = 1, max = 4)")
	end
end

function PHX:GetUsableEntities()
	return self.USABLE_PROP_ENTITIES
end

-- dirty hacks: Client and Server must update Usable Prop Entities settings every round restart!
-- Also Addition: Prohibitted Props
-- Prohibitted models which can cause server/client crash or other issues.
-- This will automatically gets deleted after round restart!

-- Please DO NOT REMOVE OR MODIFY THIS TABLE as this is for your own safety sake!
PHX.PROHIBITTED_MDLS = {
    -- Can cause server crash when being used with Prop Menu. Occurs on ph_gas_station* maps.
	["models/props_collectables/piepan.mdl"]	    = true,
    ["models/props/ph_gas_stationrc7/piepan.mdl"]   = true,
    
    -- This props are tiny that can be exploited almost in any objects!
	["models/foodnhouseholditems/egg.mdl"]		= true,
    -- Not crashing problem, but upon rotation, the prop will get inside into a wall.
	["models/sims/lightwall2.mdl"]				= true
}

-- This is default English as Fallback. DO NOT TRANSLATE HERE, USE YOUR TRANSLATED LANGUAGE FILE INSTEAD!
PHX.DefaultHelp = [[A Prop Hunt: X Project.

A project to make Prop Hunt X modern and customisable.

More info can be found at:
https://gmodgameservers.com/prophuntx

To See more info, help and guide, Press [F1] key and then click [Prop Hunt Menu] button.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Have Fun!]]

PHX.IgnoreMutedUserGroup = {
	-- Use from Group Edit in F1 Menu.
	-- Do not modify. Use External script to add group.
	["superadmin"] 	= true,
	["admin"] 		= true
}
PHX.SVAdmins = {
    -- Use from Group Edit in F1 Menu.
    -- Do not modify. Use External script to add group.
	["superadmin"] = true
}
-- Bootstrap 4 colour base. This only works on clientside :(
PHX.info = {
	["PRIMARY"] = { Color(200,200,200), "INFO"		},
	["NOTICE"]	= { Color(40 ,150,255), "NOTICE"	},
	["ERROR"]	= { Color(250, 86, 46), "ALERT"		},
	["WARNING"] = { Color(252,221,  3), "WARNING"	},
	["GOOD"]	= { Color(34 ,177, 76), "INFO"		}
}
-- End of Stock Config

function PHX:AddAdminGroup( strGroup )
	if !strGroup or strGroup == nil or !isstring(strGroup) or strGroup == "" then return end
	
	if self.SVAdmins[strGroup] then
        print("Failed. UserGroup was exists.")
		PHX.VerboseMsg("[PHX] The usergroup you entered '" .. strGroup .. "' was exist. Ignoring...")
	else
		self.SVAdmins[strGroup] = true
	end
end

function PHX:RemoveAdminGroup( strGroup )
    if !strGroup or strGroup == nil or !isstring(strGroup) or strGroup == "" then return end
    
    self.SVAdmins[strGroup] = nil
end

function PHX:AddWhitelistMuted( strGroup )
	if !strGroup or strGroup == nil or !isstring(strGroup) or strGroup == "" then return end
	
	if self.IgnoreMutedUserGroup[strGroup] then
		PHX.VerboseMsg("[PHX] The whitelisted mute usergroup you entered '" .. strGroup .. "' was exist. Ignoring...")
	else
		self.IgnoreMutedUserGroup[strGroup] = true
	end
end

function PHX:RemoveWhitelistMuted( strGroup )
	if !strGroup or strGroup == nil or !isstring(strGroup) or strGroup == "" then return end
	
	self.IgnoreMutedUserGroup[strGroup] = nil
end

-- Banned Props models. Stock, use external lua script to add and use Initialize hook to start adding items.
PHX.BANNED_PROP_MODELS = {}

-- Taunts are now moved here
PHX.TAUNTS = {}
PHX.TAUNTS[PHX.DEFAULT_CATEGORY] = {}

-- Custom Player Model bans for props
PHX.PROP_PLMODEL_BANS = {
	"models/player.mdl"
}

-- the Freeze Cam Sounds
PHX.FreezeCamSounds = {
	"misc/freeze_cam.wav",
	"misc/freeze_cam_sad1.wav"
}

PHX.WINNINGSOUNDS = {	
	-- Legends: [1] = Team Hunters, [2] = Team Props.
	[1] = { "misc/ph_hunterwin.mp3", 	"misc/ph_hunterwin_new1.mp3" },
	[2]	= { "misc/ph_propwin.mp3", 	 	"misc/ph_propwin_new1.mp3"	 },
	[3]	= { "misc/ph_rounddraw_1.mp3", 	"misc/ph_rounddraw_2.mp3", "misc/ph_rounddraw_3.mp3" }
}

if SERVER then
	function PHX:PlayWinningSound( teamid )
		teamid = math.Clamp(teamid, 1, 3)
	
		if !teamid or teamid == nil or 
			teamid == 0 or teamid == 1001 then
			teamid = 3 -- make '3' as a default sound.
		end
		
		local t = PHX.WINNINGSOUNDS[teamid]
		local rand = t[math.random(1,#t)]
		
		if rand and rand ~= nil and isstring( rand ) then
		net.Start("PH_TeamWinning_Snd")
			net.WriteString(rand)
		net.Broadcast()
			
		else
			ErrorNoHalt("[PHX Win Sound] Cannot play win sound because it's appear to be invalid!")
		end
	end
end

--[[ // DO NOT MODIFY! These are stock taunts. Please add yourself by using taunt scanner! \\ ]]--
PHX.TAUNTS[PHX.DEFAULT_CATEGORY][TEAM_HUNTERS] = {
	["Come to Papa"]				=	"taunts/hunters/come_to_papa.wav",
	["I am your Father"]			=	"taunts/hunters/father.wav",
	["Need Fire Assistance!"]		=	"taunts/hunters/fireassis.wav",
	["(GlaDOS) President"]			=	"taunts/hunters/glados-president.wav",
	["I am Hit!"]					=	"taunts/hunters/hitassist.wav",
	["How Rude"]					=	"taunts/hunters/how_rude.wav",
	["I will Find You"]				=	"taunts/hunters/ill_find_you.wav",
	["Radio Laugh"]					=	"taunts/hunters/laugh.wav",
	["Now What?"]					=	"taunts/hunters/now_what.wav",
	["You dont have the Soul"]		=	"taunts/hunters/you_dont_have_the_soul.wav",
	["You dont know the Power"]		=	"taunts/hunters/you_dont_know_the_power.wav",
	["You are underestimating"]		=	"taunts/hunters/you_underestimate_the_power.wav",
	["Threat Neutralized"]			=	"taunts/hunters/threat_neutralized.wav",
	["DX: My Vision is Augmented"]	=	"taunts/ph_enhanced/dx_augmented.wav",
	["DX: Im gonna Whoop your Ass"]	=	"taunts/ph_enhanced/dx_imgonnawoopyourass.wav",
	["DX: Dont worry we are cops"]	=	"taunts/ph_enhanced/dx_dontworrywurcops.wav",
	["DX: Heheh"]					=	"taunts/ph_enhanced/dx_hehe.wav",
	["Stop, You killing me"]		=	"vo/npc/male01/vanswer13.wav",
	["Enough of Mumbo Jumbo"]		=	"vo/npc/male01/vanswer01.wav",
	["HACKS"]						=	"vo/npc/male01/thehacks01.wav",
	["Over Here"]					=	"vo/npc/male01/overhere01.wav",
	["Over There"]					=	"vo/npc/male01/overthere01.wav",
	["Over There!!"]				=	"vo/npc/male01/overthere02.wav",
	["Guuuh!"]						=	"vo/k_lab/ba_guh.wav",
	["F You!"]						= 	"vo/streetwar/rubble/ba_tellbreen.wav"
}

--[[ // DO NOT MODIFY! use from taunts/props_taunts.lua or hunters_taunts.lua instead! \\ ]]--
PHX.TAUNTS[PHX.DEFAULT_CATEGORY][TEAM_PROPS] = {
	["Run for your Life!"]					=	"vo/npc/male01/runforyourlife02.wav",
	["Not the Bees"]						=	"taunts/props/bees_fix.wav",
	["BillyMays - Are you on the Balls"]	=	"taunts/props/billymays_areyouontheballs.wav",
	["BillyMays - Get on the Balls"]		=	"taunts/props/billymays_getontheballs.wav",
	["BillyMays - I Guarantee It"]			=	"taunts/props/billymays_iguaranteeit.wav",
	["BillyMays - Its so Easy"]				=	"taunts/props/billymays_itsoeasy.wav",
	["BillyMays - Laundry made Easy"]		=	"taunts/props/billymays_laundrymadeeasy.wav",
	["BillyMays - New OxyClean"]			=	"taunts/props/billymays_newoxyclean.wav",
	["BillyMays - No more Detergent"]		=	"taunts/props/billymays_nomoredetergent.wav",
	["BillyMays - Only $9.99"]				=	"taunts/props/billymays_only9_99.wav",
	["BillyMays - OxyClean"]				=	"taunts/props/billymays_oxyclean.wav",
	["BillyMays - So Get on the Balls!"]	=	"taunts/props/billymays_sogetontheballs.wav",
	["Boom, Headshot!"]						=	"taunts/props/boom_hs.wav",
	["Car Horn"]							=	"taunts/props/car_horn.wav",
	["Chicken Hammer"]						=	"taunts/props/chicken_hammer.wav",
	["DOH"]									=	"taunts/props/doh.wav",
	["Force Eliminated"]					=	"taunts/props/forces_eliminated.wav",
	["Go Away or I Shall"]					=	"taunts/props/go_away_or_i_shall.wav",
	["Random HardBass"]						=	"taunts/props/hardbass.wav",
	["Tri Poloski"]							=	"taunts/props/tri_poloski1.wav",
	["Tri Poloski Beats"]					=	"taunts/props/tri_poloski2.wav",
	["Nein Nein Nein"]						=	"taunts/props/nein.wav",
	["Ill be back"]							=	"taunts/props/ill_be_back.wav",
	["I am Corn Holio"]						=	"taunts/props/i_am_cornholio.wav",
	["LEROY JENKINS"]						=	"taunts/props/leroy_jenkins.wav",
	["Oh yeah he will pay"]					=	"taunts/props/oh_yea_he_will_pay.wav",
	["Muffin Man"]							=	"taunts/props/ok_i_will_tell_you.wav",
	["Its over 9000"]						=	"taunts/props/over9000.wav",
	["PINGAS"]								=	"taunts/props/pingas.wav",
	["Please Come Again"]					=	"taunts/props/pls_come_again.wav",
	["Pokemon"]								=	"taunts/props/pokemon.wav",
	["Very Retarded Laugh"]					=	"taunts/props/retarted_laugh.wav",
	["Shams Wow"]							=	"taunts/props/sham_wow.wav",
	["This is SPARTA"]						=	"taunts/props/sparta.wav",
	["WATATATATA"]							=	"taunts/props/watatata.wav",
	["What is wrong with you"]				=	"taunts/props/wrong.wav",
	["WROOOONG"]							=	"taunts/props/wroooong.wav",
	["wololo"]								=	"taunts/props/wololo.wav",
	["WooHoo"]								=	"taunts/props/woohoo.wav",
	["DX: Easy Bruh"]						=	"taunts/ph_enhanced/dx_easy_bruh.wav",
	["DX: Hehe"]							=	"taunts/ph_enhanced/dx_heh.wav",
	["DX: I dont Move Out"]					=	"taunts/ph_enhanced/dx_idonotmoveout.wav",
	["DX: You Killed my Friend"]			=	"taunts/ph_enhanced/dx_iloominarty.wav",
	["DX: Leave me alone"]					=	"taunts/ph_enhanced/dx_leaveme.wav",
	["DX: LOOK AT ME"]						=	"taunts/ph_enhanced/dx_lookatme.wav",
	["DX: AAAAAAARGGHHHHHH"]				=	"taunts/ph_enhanced/dx_molepeople.wav",
	["DX: A BOMB"]							=	"taunts/ph_enhanced/dx_thebomb.wav",
	["DX: THE BOMB JC"]						=	"taunts/ph_enhanced/dx_thebomb2.wav",
	["DX: What a Shame"]					=	"taunts/ph_enhanced/dx_whatashame.wav",
	["DX: Whoa #1"]							=	"taunts/ph_enhanced/dx_whoawhoawhoa_1.wav",
	["DX: Whoa #2"]							=	"taunts/ph_enhanced/dx_whoawhoawhoa_2.wav",
	["SPAGHET"]								=	"taunts/ph_enhanced/ext_spaghet.wav",
	["SPAGHET (Full)"]						=	"taunts/ph_enhanced/ext_touch_ma_spaghet.wav",
	["Knuckles: Do u know the wei"]			=	"taunts/ph_enhanced/ext_do_you_kno_de_wei.wav",
	["Knuckles: kno the wei"]				=	"taunts/ph_enhanced/ext_uhaveebolatoknodewei.wav",
	["Angry German Kid"]					=	"taunts/ph_enhanced/ext_angry_german_kid.wav",
	["CrackMod: I hate you"]				=	"taunts/ph_enhanced/ext_crackmod_ihateyou.wav",
	["CrackMod: I watch your rear"]			=	"taunts/ph_enhanced/ext_crackmod_watchyourrear.wav",
	["CrackMod: You damn Ugly"]				=	"taunts/ph_enhanced/ext_crackmod_youareugly.wav",
	["Random Dance Music"]					=	"taunts/ph_enhanced/ext_dance_music.wav",
	["MLG: GET NO SCOPE"]					=	"taunts/ph_enhanced/ext_get_no_scope.wav",
	["MLG: GET THE CAMERA"]					=	"taunts/ph_enhanced/ext_getcamera.wav",
	["MLG: OH ITS TRIPLE"]					=	"taunts/ph_enhanced/ext_mlg_triple.wav",
	["Bicycle Bell"]						=	"taunts/ph_enhanced/ext_bicycle_bell.wav",
	["Ding"]								=	"taunts/ph_enhanced/ext_cling.wav",
	["AND III ALWAYS LOVE YOU"]				=	"taunts/ph_enhanced/ext_and_iiiiiiiiiiiiiiiiiiii.wav",
	["The Rude of Storming Sand"]			=	"taunts/ph_enhanced/ext_darude.wav",
	["deaugh"]								=	"taunts/ph_enhanced/ext_deaugh.wav",
	["CDI: Die"]							=	"taunts/ph_enhanced/ext_die.wav",
	["CDI: Oah"]							=	"taunts/ph_enhanced/ext_oah.wav",
	["KF: Heres some cash goys"]			=	"taunts/ph_enhanced/ext_dosh1.wav",
	["KF: Loadsam money"]					=	"taunts/ph_enhanced/ext_dosh2.wav",
	["KF: Who needed money"]				=	"taunts/ph_enhanced/ext_dosh3.wav",
	["KF: Money money money"]				=	"taunts/ph_enhanced/ext_dosh4.wav",
	["KF: Dosh grab it while you can"]		=	"taunts/ph_enhanced/ext_dosh5.wav",
	["Dun dun duuuun"]						=	"taunts/ph_enhanced/ext_dundundun.wav",
	["derpy fart"]							=	"taunts/ph_enhanced/ext_fart1.wav",
	["nice fart"]							=	"taunts/ph_enhanced/ext_fart2.wav",
	["auffwauffderp"]						=	"taunts/ph_enhanced/ext_fdsa.wav",
	["Game Over"]							=	"taunts/ph_enhanced/ext_gameover.wav",
	["Game Over mario"]						=	"taunts/ph_enhanced/ext_gameover_mario.wav",
	["Stalker: Get out of Here"]			=	"taunts/ph_enhanced/ext_getoutofhere_stalker.wav",
	["GET TO THE CHOPPA"]					=	"taunts/ph_enhanced/ext_get_to_the_choppa.wav",
	["Idiots #1"]							=	"taunts/ph_enhanced/ext_idiots_1.wav",
	["Idiots #2"]							=	"taunts/ph_enhanced/ext_idiots_2.wav",
	["This is Illegal"]						=	"taunts/ph_enhanced/ext_illegal.wav",
	["X for JASONNN"]						=	"taunts/ph_enhanced/ext_jason1.wav",
	["X for JASON!"]						=	"taunts/ph_enhanced/ext_jason2.wav",
	["X for JASON"]							=	"taunts/ph_enhanced/ext_jason3.wav",
	["Jim Carrey REMIX"]					=	"taunts/ph_enhanced/ext_jim_carrey.wav",
	["AND HIS NAME IS JOHN CENA"]			=	"taunts/ph_enhanced/ext_johncena.wav",
	["AND HIS NAME IS JOHN CENA Remix"]		=	"taunts/ph_enhanced/ext_johncena_remix.wav",
	["no way"]								=	"taunts/ph_enhanced/ext_nowai.wav",
	["Remove Freeman"]						=	"taunts/ph_enhanced/ext_remove_kebab.wav",
	["SHUT UP"]								=	"taunts/ph_enhanced/ext_shutuuuuuuup.wav",
	["JC2: No no no"]						=	"taunts/ph_enhanced/jc2_nonono.wav",
	["JC2: no way"]							=	"taunts/ph_enhanced/jc2_nowai.wav",
	["JC2: You Son of a Bee"]				=	"taunts/ph_enhanced/jc2_usonova_bee.wav",
	["Shia Labeouf: JUST DO IT"]			=	"taunts/ph_enhanced/just_doit1.wav",
	["Shia Labeouf: DO IT"]					=	"taunts/ph_enhanced/just_doit2.wav",
	["Hula Dance"]							=	"taunts/ph_enhanced/ext_huladance.wav",
	["X Files"]								=	"taunts/ph_enhanced/ext_illuminaty.wav",
	["Lovely hehe"]							=	"taunts/ph_enhanced/ext_lovely_hehe_mp4.wav",
	["Yeah Boy"]							=	"taunts/ph_enhanced/ext_yeahboy_mp4.wav",
	["MY LEG"]								=	"taunts/ph_enhanced/ext_my_leg.wav",
	["JOHN FREEMANS WEPON"]					=	"taunts/ph_enhanced/ext_wepon.wav",
	["OOOOOOOOH"]							=	"taunts/ph_enhanced/ext_woo.wav",
	["Minecraft Uuf"]						=	"taunts/ph_enhanced/ext_oof_minecraft.wav",
	["Roblox Oof"]							=	"taunts/ph_enhanced/ext_oof_roblox.wav",
	["Cloaker"]								=	"taunts/ph_enhanced/ext_pd2_cloaker.wav",
	["WOOOOH"]								=	"taunts/ph_enhanced/ext_pyrocynical_woo.wav"
}

-- These are used for verification and random taunt only. Do not mess this up.
PHX.CachedTaunts = {}
PHX.CachedTaunts[TEAM_HUNTERS]	= {}
PHX.CachedTaunts[TEAM_PROPS]	= {}

if SERVER then
	function AddResources(t)
		if !t then return end
		
		for name,path in pairs(t) do
			PHX.VerboseMsg("[PH Taunts] Adding resource for download: " .. name)
			resource.AddFile("sound/" .. path)
		end
	end
	
	function PHX:GetRandomTaunt( idTeam )
		if table.IsEmpty(self.CachedTaunts[idTeam]) then
			print("[PH Taunts] !!ERROR: Cache Taunt Table is Empty! Is there something messing up the cache??")
			return "vo/k_lab/kl_fiddlesticks.wav"
		else
			local rand = table.Random(self.CachedTaunts[idTeam])
			return rand
		end
	end
end

function PHX:CheckCache( tbl, cat )
	
	if !cat or cat == nil then cat = "Unknown" end
	
	for i=TEAM_HUNTERS,TEAM_PROPS do
		if tbl[i] and tbl[i] ~= nil then
			for name,path in pairs(tbl[i]) do
				if (self.CachedTaunts[i][name] ~= nil) then
					self.VerboseMsg("[PH Taunts: "..team.GetName(i).." Cache Warning] Taunt name ["..name.."] from category '".. cat .. "' was exists in the cache. Removing entry to prevent duplication...")
					tbl[i][name] = nil
				elseif table.HasValue( self.CachedTaunts[i], path ) then
					self.VerboseMsg("[PH Taunts:"..team.GetName(i).." Cache Warning] Taunt name ["..name.."]["..path.."] from category '"..cat.."' was exists in the cache. Removing entry to prevent duplication...")
					tbl[i][name] = nil
				end
			end
		end
	end
	
end

function PHX:AddToCache( idTeam, tbl )

	for name,path in pairs( tbl ) do
		self.VerboseMsg( "[PH Taunts] ["..team.GetName( idTeam ):upper().." Cache] Adding taunt [" .. name .. "] to the cache." )
		self.CachedTaunts[idTeam][name] = path
	end
	
end

function PHX:ManageTaunt( category, tauntData )
	
	-- check cache first.
	self.VerboseMsg("[PH Taunts] Checking for duplicated/conflicting taunts: "..category.."...")
	self:CheckCache( tauntData, category )
	
	local emptied=0
	
	if !istable(tauntData[TEAM_HUNTERS]) then
		emptied=emptied+1
	elseif istable(tauntData[TEAM_HUNTERS]) and table.IsEmpty(tauntData[TEAM_HUNTERS]) then
		emptied=emptied+1
	end
	
	if !istable(tauntData[TEAM_PROPS]) then
		emptied=emptied+1
	elseif istable(tauntData[TEAM_PROPS]) and table.IsEmpty(tauntData[TEAM_PROPS]) then
		emptied=emptied+1
	end
	
	if emptied==2 then
		print("[PH Taunts] Warning: It seems that all taunts from "..category.." was emptied from Cache Checker! Skipping to next taunt if any.")
		return
	end
	
	self.VerboseMsg("[PH Taunts] Done. Starting Managing Taunts ...")

	if self.TAUNTS[category] ~= nil then
		-- if category exist, add them.
		self.VerboseMsg("[PH Taunts] Category " .. category .. " was exists in taunt table. Adding Taunts...")
		
		for i=TEAM_HUNTERS,TEAM_PROPS do
			if tauntData[i] and tauntData[i] ~= nil then
				for name,path in pairs(tauntData[i]) do
					-- Double Check, if somehow found any duplicates
					if (!self.TAUNTS[category][i][name] and !self.CachedTaunts[i][name]) and
					(!table.HasValue( self.TAUNTS[category][i], path ) and !table.HasValue( self.CachedTaunts[i], path )) then
						self.VerboseMsg(string.format("[PH Taunts] Adding taunt %s (Cat: %s, path: %s) to their Taunt Table and Cache.", name,category,path))
						self.TAUNTS[category][i][name] 	= path
						self.CachedTaunts[i][name] 		= path
					else
						self.VerboseMsg(string.format("[PH Taunts] Skipping taunt %s (Cat: %s, path: %s) because it exist in Taunt Table & Cache.", name,category,path))
					end
				end
			end
		end
		
		self.VerboseMsg("[PH Taunts] Taunts Category " .. category .. " has been successfully added!")
		
		return
	end
	
	self.VerboseMsg("[PH Taunts] Adding new taunt & category: " .. category .. "!")
	
	self.TAUNTS[category]	= tauntData
	
	local PROPS_TAUNT 		= {}
	local HUNTERS_TAUNT 	= {}
	
	self.VerboseMsg("[PH Taunts] Precaching taunts from category: " .. category .. "..." )
	
	if tauntData[TEAM_PROPS] and tauntData[TEAM_PROPS] ~= nil and istable(tauntData[TEAM_PROPS]) and !table.IsEmpty( tauntData[TEAM_PROPS] ) then
		PROPS_TAUNT = tauntData[TEAM_PROPS]
		self:AddToCache( TEAM_PROPS, PROPS_TAUNT )
		if SERVER then
			self.VerboseMsg("[PH Taunts] Adding Prop taunts resources if any." )
			AddResources( PROPS_TAUNT )
		end
	end
	
	if tauntData[TEAM_HUNTERS] and tauntData[TEAM_HUNTERS] ~= nil and istable(tauntData[TEAM_HUNTERS]) and !table.IsEmpty( tauntData[TEAM_HUNTERS] ) then
		HUNTERS_TAUNT = tauntData[TEAM_HUNTERS]
		self:AddToCache( TEAM_HUNTERS, HUNTERS_TAUNT )
		if SERVER then
			self.VerboseMsg("[PH Taunts] Adding Hunter taunts resources if any." )
			AddResources( HUNTERS_TAUNT )
		end
	end
end

-- Taunts Addition & Removal
function PHX:AddCustomTaunt( idTeam, category, tblTaunt )
	self:CheckCache( tblTaunt, category )

	if (idTeam ~= TEAM_PROPS or idTeam ~= TEAM_HUNTERS) and (!tblTaunt or tblTaunt == nil) and (!istable(tblTaunt)) then
		print( "[PH] Error: Cannot add taunt category from team: "..team.GetName(idTeam).."!" )
		return
	end
	
	if self.TAUNT[category] ~= nil then
		self.TAUNTS[category][idTeam] = tblTaunt
		self:AddToCache(idTeam, tblTaunt)
		AddResources( tblTaunt )
	else
		print( "[PH] Error: Cannot add taunt category "..category.." because category is exists! Try with different name." )
	end
	
end

function PHX:AddSingleTaunt(idTeam, category, name, path)
	if (idTeam ~= TEAM_PROPS or idTeam ~= TEAM_HUNTERS) and (!name and !path) and (type(name) ~= "string" and type(path) ~= "string") then
		print( "[PH] Error: All required arguments must be a string, required and thus cannot be empty!" )
		return
	end
	
	if self.TAUNTS[category] == nil then
		self.TAUNTS[category] = {}	-- create empty category table instead.
	end
	
	-- Singular proccess.
	if self.TAUNTS[category][idTeam][name] ~= nil and self.CachedTaunts[idTeam][name] ~= nil and
		!table.HasValue(self.TAUNTS[category][idTeam][name], path) and !table.HasValue( self.CachedTaunts[idTeam][name], path ) then
		
		self.TAUNTS[category][idTeam][name]	= path
		self.CachedTaunts[idTeam][name] 	= path
		if SERVER then
			resource.AddFile("sound/"..path)
		end
	end
end

function PHX:RemoveTauntByPath( idTeam, category, strTaunt )
	if (!idTeam or !category) then
		print("[PH Taunts] Error: Team ID or Category is Invalid!")
	end

	if table.HasValue(self.TAUNT[category][idTeam], strTaunt) then 
		table.RemoveByValue(self.TAUNT[category][idTeam], strTaunt)
		table.RemoveByValue(self.CachedTaunts[idTeam], strTaunt)
		return true
	else
		print("[PH Taunts] Taunt: ".. strTaunt .. " didn't exists on category " .. category)
	end
	
	return false
end

-- Get List of Taunt, returned by Table.
function PHX:GetAllTeamTaunt( teamid, category )
	if (not category) then
		self.VerboseMsg("[PH Taunts] Warning: category isn't defined. Reverting back to Default Category!")
		category = self.DEFAULT_CATEGORY
	end

	if (not self.TAUNTS[category]) or (self.TAUNTS[category] == nil) then
		print("[PH Taunts] The specified ".. team.GetName(teamid) .." taunt table from "..category.." contains nothing or not found.")
		return false
	end
	
	-- do a copy instead accessing them.
	local taunt = table.Copy(self.TAUNTS[category][teamid])
	return taunt
end

-- Use with your own risk.
function PHX:RefreshTauntList()
	local t = table.Copy(self.TAUNTS)
	local getCategories = table.GetKeys(self.TAUNTS)
	
	print( "[PHX Taunt] Refreshing..." )
	
	-- Empty Table
	self.TAUNTS = {}
	
	-- Resort them.
	for _,Category in pairs( getCategories ) do
		if t[Category][TEAM_PROPS]   ~= nil then table.sort( t[Category][TEAM_PROPS] ) 	 end
		if t[Category][TEAM_HUNTERS] ~= nil then table.sort( t[Category][TEAM_HUNTERS] ) end
	end
	
	self.TAUNTS = t
end

-- if there was no  taunts loaded, uncomment these. For most cases, this should never happened.
--[[
	hook.Add("InitPostEntity", "PHX.RefreshTauntList", function()
		PHX:RefreshTauntList() 
	end)
]]

concommand.Add("ph_refresh_taunt_list", function( ply ) 
	if ( util.IsStaff( ply ) ) then PHX:RefreshTauntList() end
end, nil, "(Deprecated: Use with your own risk) Refresh Taunt List and Sort them.")

-- Add the custom player model bans for props AND prop banned models
local config_path = PHX.ConfigPath
if SERVER then
	if ( !file.Exists( config_path, "DATA" ) ) then
		PHX.VerboseMsg("[PHX] Warning: ./data/".. config_path .." does not exist. Creating New One...")
		file.CreateDir( config_path )
	end
	
	local function AddBadPLModels()

		local dir = config_path .. "/prop_plymodel_bans"
		
		-- Create base config area
		if ( !file.Exists( dir, "DATA" ) ) then
			file.CreateDir( dir )
		end

		-- Create actual config
		if ( !file.Exists( dir.."/bans.txt", "DATA" ) or file.Size( dir.."/bans.txt", "DATA" ) <= 0 ) then
			file.Write( dir.."/bans.txt", util.TableToJSON({"models/player.mdl", "custom_playermodel_name"}, true) )
		end
		
		if ( file.Exists( dir.."/bans.txt", "DATA" ) ) then
		
			local PROP_PLMODEL_BANS_READ = util.JSONToTable( file.Read( dir.."/bans.txt", "DATA" ) )
			
			-- empty the table instead
			PHX.PROP_PLMODEL_BANS = {}
			
			for _, v in pairs(PROP_PLMODEL_BANS_READ) do
				PHX.VerboseMsg("[PHX PlayerModels] Adding custom prop player model ban --> "..string.lower(v))
				table.insert(PHX.PROP_PLMODEL_BANS, string.lower(v))
			end
		else
			
			PHX.VerboseMsg("[PHX] Cannot read "..dir.."/bans.txt: Error - did not exist. Did you just delete it or what?")
			
		end

	end
	
	local function AddBannedPropModels()
		local dir = config_path .. "/prop_model_bans"
		
		-- this is a stock template. DO NOT MODIFY.
		local template = {
            "models/player.mdl",
            "models/chefhat.mdl"
		}
		
		if ( !file.Exists(dir, "DATA") ) then
			file.CreateDir(dir)
		end
		
		if ( !file.Exists(dir.."/model_bans.txt","DATA") or file.Size( dir.."/model_bans.txt", "DATA" ) <= 0 ) then
			file.Write( dir.."/model_bans.txt", util.TableToJSON( template, true ))
		end
		
		if ( file.Exists ( dir.."/model_bans.txt","DATA" ) ) then
			local PROP_MODEL_BANS_READ = util.JSONToTable(file.Read(dir.."/model_bans.txt"))
            
			--PHX.BANNED_PROP_MODELS = {}
			for _,v in pairs(PROP_MODEL_BANS_READ) do
				PHX.VerboseMsg("[PHX Model Bans] Adding entry of restricted model to be used -> "..string.lower(v))
                
                if table.HasValue(PHX.BANNED_PROP_MODELS, v) then
                    PHX.VerboseMsg("[PHX Model Bans] Models " .. v .. " is already exists in the prop model banlist. Ignoring...!")
                else
                    table.insert(PHX.BANNED_PROP_MODELS, string.lower(v))
                end
			end
		else
			PHX.VerboseMsg("[PHX] Cannot read "..dir.."/model_bans.txt: Error - did not exist. Did you just delete it or what?")
		end
	end
    
    -- First, Add Permanent Ban
    for _,v in pairs( phx_PermaBannedModels ) do
        table.insert( PHX.BANNED_PROP_MODELS, v )
    end
        
    -- Add Extra Banned Models
    AddBadPLModels()
    AddBannedPropModels()
	
	-- Add ConCommands.
	concommand.Add("ph_refresh_plmodel_ban", function(ply)
		if ( util.IsStaff( ply ) ) then AddBadPLModels() end
	end, nil, "Refresh Server Playermodel Ban Lists (Auto-update on round restart) and read from prop_plymodel_bans/bans.txt")
	
	concommand.Add("ph_refresh_propmodel_ban", function(ply)
		if ( util.IsStaff( ply ) ) then AddBannedPropModels() end
	end, nil, "Refresh Server Prop Models Ban Lists (Auto-update on round restart) and read from prop_model_bans/model_bans.txt")
end

local function UpdatePropBansInfo( PHXKey, tbl )
	local compress,len = util.PHXQuickCompress( tbl )
	
	net.Start( "PHX.UpdatePropbanInfo" )
		net.WriteString( PHXKey )
		net.WriteUInt( len, 16 )
		net.WriteData( compress, len )
	net.Broadcast()
end

hook.Add("PostCleanupMap", "PHX.UpdateUsablePropEnt", function()
	-- Update Prop Entities Type
	PHX.USABLE_PROP_ENTITIES = PHX.CVARUseAbleEnts[ PHX:GetCVar( "ph_usable_prop_type" ) ]
	
	if SERVER then
    
        -- Prohibit specific prop from spawning
        for _,ent in pairs(ents.GetAll()) do
            timer.Simple(0.1, function()
                if IsValid(ent) and PHX.PROHIBITTED_MDLS[ ent:GetModel() ] then
                    PHX.VerboseMsg("[PHX] Removing " .. ent:GetModel() .. " to prevent server crash or gameplay-breaking exploits.")
                    ent:Remove()
                end
            end)
        end
        
        -- Always update the prop bans info.
		UpdatePropBansInfo( "BANNED_PROP_MODELS", PHX.BANNED_PROP_MODELS )
		UpdatePropBansInfo( "PROP_PLMODEL_BANS", PHX.PROP_PLMODEL_BANS )
	end
end)

local function InitializeConfig()

	PHX.VerboseMsg("[PH Taunts] Initializing Taunts...")
	
	PHX.VerboseMsg("[PH Taunts] Precaching stock taunts..." )
	PHX:AddToCache( TEAM_PROPS, 	PHX.TAUNTS[PHX.DEFAULT_CATEGORY][TEAM_PROPS] )
	PHX:AddToCache( TEAM_HUNTERS, 	PHX.TAUNTS[PHX.DEFAULT_CATEGORY][TEAM_HUNTERS] )
	
	PHX.VerboseMsg("[PHX Taunts] Adding External Custom Taunts, if any...")
	for category,tauntData in SortedPairs( list.Get("PHX.CustomTaunts") ) do 
		
		PHX.VerboseMsg("[PH Taunts] Working on Adding external taunt: Category: [" .. category .. "]...")
		PHX:ManageTaunt( category, tauntData )
		
	end
	
	PHX.VerboseMsg( "[PH Taunts] Total Cache size: Props - " .. tostring(table.Count(PHX.CachedTaunts[TEAM_PROPS])) .. ", Hunter: " .. tostring(table.Count(PHX.CachedTaunts[TEAM_HUNTERS])) .."\n[PH Taunts] Done. Have Fun!" )
    
    -- Initialize Usable Prop Entities
    PHX.USABLE_PROP_ENTITIES = PHX.CVARUseAbleEnts[ PHX:QCVar( "ph_usable_prop_type" ) ]
	
end
hook.Add("Initialize", "PHX.InitializeTaunts", InitializeConfig)
-- use this if taunts are not properly added.
-- hook.Add("InitPostEntity", "PHX.InitializeTaunts", InitializeTaunts)

-- AAAAAAARGGHHHHHH
if CLIENT then
	function PHX:AAAAAAARGGHHHHHH()
		print("oh no, it\'s the AAAAAAARGGHHHHHH AAAHHHHHHHHHHHHHHHH!")
		surface.PlaySound(PHX.TAUNTS[PROP_TAUNTS]["DX: AAAAAAARGGHHHHHH"])
	end
	concommand.Add("aaaaaaargghhhhhh", function() 
		PHX:AAAAAAARGGHHHHHH()
	end, nil, "The classic AAAAAAARGGHHHHHH from Deus Ex.", 0x10)
end