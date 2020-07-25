local balls = {}
-- no.

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

balls.model = {
	"models/dav0r/hoverball.mdl",
	"models/maxofs2d/hover_basic.mdl",
	"models/maxofs2d/hover_classic.mdl",
	"models/maxofs2d/hover_rings.mdl"
}

balls.bombswitch = 0

function ENT:Initialize()
	self.Entity:SetModel(table.Random(balls.model))
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetUseType(SIMPLE_USE)
	
	self.Uses = 0
	
	local phys = self.Entity:GetPhysicsObject() 
	
	if IsValid(phys) then  		
		phys:Wake()
		phys:SetMass(24) --since barrel
	end

	self.health = 100
end

balls.sounds = {
	"prop_idbs/bc_pickup.wav",
	"prop_idbs/np_pickup.wav",
	"prop_idbs/venta_pickup.wav",
	"prop_idbs/biva_pickup.wav"
}

balls.randomtext = {
	"Trolling is \'A\' Art",
	"0 8 1 3 - 6 9 2 8",
	"SHUT UP NURSE!!",
	"A fish with a cone hat.",
	"A blueberry wolfy hangs around. (if he was here)",
	"He keep laughing whenever he saw a moving prop/hunter or found an excelent hiding spot.",
	"\'He once used this gamemode, then never again. Or Perhaps someone broke it, lmao.\'",
	"The blueberry wolfy tried to swim in lava while mining a diamond.",
	"Uncharted: The Game within The Game.",
	"Look, ma! I said look! I'm on top of the world... again!",
	"He always, stays patiently over 400 years to make a changes.",
	"John Freeman whose Gordon Freeman\'s Brother!",
	"John Freeman looked underground and found WEPONS!",
	"When you go to space, there is a hiding crystal inside a \'box\'.",
	"It\'s so fancy! Even people in \'that\' house didn\'t notice that there are 5 buttons and some dorito!",
	"WHERE\'S THE BLACKSMITH!?",
	"What a shame.",
	"I never asked for this.",
	"Knowing these lucky balls will give you something good fills you with determination.",
	"PILLS HERE!",
	"The Power of Fluffy Boy shines within you!",
	"Actually, this guy is \'wacky\'. He live in the castle and... he has a \'Spade-Liked\' head.",
	"You go to the Field where you can find your Dreams and Hopes~",
	"There are two games which has similar characters that can cause CHAOS.",
	"She like eating chalks, A LOT.",
	":3",
	"You know, that time when GMod was used to be made for good animation video, YTPs, fads, etc...",
	"Here's some text to occupy you.",
	"Have you seen the NannerMan?",
	"Although there are alot of missing textures, Just remember: \'Mitchell\' is useless guy and it\'s game too.", -- Pfftt, ok I'm done with HDTF.
	"I once saw a man with green septic eyes.",
	"I once saw a man with a pink mustache.",
	"There was Obsidian and it had a Conflict.",
	"We all just need a bit of Synergy in our lives.",
	"The Presense is Watching you", -- todo is this correct for Terraria Eye of Chtulu Boss?
	"sudo apt-get moo",
	"\"Have you mooed today?\"",
	"Someone could do well on the stage, we just need to find him.",
	"You can \"Unite\" a \"Tower\" of people if you do it right.",
	"Klace is a pink husky. So Pinky~",
	"Major reference. Minor details.", -- This is 100% a reference! Think!
	"*Notices* What's this? OwO",
	"Lucky Ball: I luv u~! <3", -- LOL
	"So much to do, so little time.", -- That was the rest of those fallen text additions - Nice!
	"You don't realise that (nearly) all those were actually easter eggs? :P"
}

--[[
Base Lucky Balls Functions. 
Please note that you might have to create a custom serverside lua with full of function list with list.Set into "LuckyBallsAddition".
	Example:
	
	list.Set("LuckyBallsAddition", "UniqueName", function(pl,ball)
		-- code...
	end)
	
Keep in note that UniqueName should be unique and different. Otherwise will cause some confusion with PHX.VerboseMsg!
]]
balls.funclists = {
	function(pl)
		pl:ChatPrint(table.Random(balls.randomtext))
	end,
	function(pl)
		if not pl:HasWeapon("wlv_bren") then
			pl:Give("wlv_bren")
			pl:SelectWeapon("wlv_bren")
			pl:ChatPrint("[Lucky Ball] You got a *special* weapon!")
		else
			pl:ChatPrint(table.Random(balls.randomtext))
		end
	end,
	function(pl)
		local rand = math.random(10,75)
		pl:SetHealth(pl:Health() + rand)
		pl:ChatPrint("[Lucky Ball] You got free +"..rand.." HP!")
	end,
	function(pl)
		local rand = math.random(1,20)
		pl:SetHealth(pl:Health() - rand)
		pl:ChatPrint("[Lucky Ball] Aww Snap! Your health reduced by -"..rand.." HP, better luck next time!")
	end,
	function(pl)
		pl:Give("item_battery")
		pl:ChatPrint("[Lucky Ball] You obtained a free battery suit!")
	end,
	function(pl)
		local rand
		rand = math.random(15,100)
		pl:SetArmor(pl:Armor() + rand)
		pl:ChatPrint("[Lucky Ball] You gained armor points bonus : "..tostring(rand).."!")
	end,
	function(pl)
		local ammo = {'Pistol', 'SMG1', '357', 'Buckshot'}
		local rand
		rand = math.random(8,45)
		pl:GiveAmmo(rand, table.Random(ammo))
		pl:ChatPrint("[Lucky Ball] You got a random ammo!")
	end,
	function(pl)
		if not pl:HasWeapon("weapon_rpg") then
			pl:Give("weapon_rpg")
			pl:SelectWeapon("weapon_rpg")
			pl:SetAmmo(2, "RPG_Round")
			pl:ChatPrint("[Lucky Ball] You got a free RPG!")
		else
			pl:ChatPrint(table.Random(balls.randomtext))
		end
	end,
	function(pl)
		if not pl:HasWeapon("weapon_frag") then
			pl:Give("weapon_frag")
			pl:SelectWeapon("weapon_frag")
			pl:ChatPrint("[Lucky Ball] You got a Frag Grenade for free!")
		end
	end,
	function(pl)
		for _, plph in pairs(player.GetAll()) do
			if plph:SteamID() == "STEAM_0:0:63261691" then
				pl:ChatPrint("[Lucky Ball] The blueberry wolf is actually => "..plph:Nick())
			end
		end
	end,
	function(pl)
		if not pl:HasWeapon("weapon_bugbait") then
			pl:Give("weapon_bugbait")
			pl:ChatPrint("[Lucky Ball] You got Bugbait for free... which does nothing. (unless you have a pet antlion).")
		else
			pl:ChatPrint(table.Random(balls.randomtext))
		end
	end,
	 function(pl)  -- Change hunter model to player mdl as a joke
		 if not (pl:GetModel() == "models/player.mdl") then
			 pl:ChatPrint("[Lucky Ball] I saw it once. The player.mdl will get its revenge one day. -D4")
			 pl:SetModel("models/player.mdl")
			 pl:SendLua("CL_GLIMPCAM = CurTime() + 3")
		 else
			 pl:ChatPrint(table.Random(balls.randomtext))
		 end
	 end,
	 function(pl)  -- This is a fun little reference to staging
		for _, plph in pairs(player.GetAll()) do
			if plph:SteamID() == "STEAM_0:0:49332102" && plph:Alive() && plph:Team() == TEAM_HUNTERS then
				pl:ChatPrint("[Lucky Ball] You put "..plph:Name().." on the stage.")
				plph:SendLua("CL_GLIMPCAM = CurTime() + 10")
				plph:SendLua("RunConsoleCommand(\"act\", \"dance\")")
				plph:EmitSound("taunts/props/hardbass.wav", 100)
			end
		end
	 end,
	function(pl)
		local suicidebomb = ents.Create("combine_mine")
		suicidebomb:SetPos(Vector(pl:GetPos()))
		suicidebomb:SetAngles(Angle(0,0,0))
		suicidebomb:Spawn()
		suicidebomb:Activate()
		suicidebomb:SetOwner(pl)
		pl:ChatPrint("[Lucky Ball] You got a SUICIDE BOMB!")
		
		if balls.bombswitch == 0 then
			pl:EmitSound("taunts/ph_enhanced/dx_thebomb2.wav")
			balls.bombswitch = 1
		elseif balls.bombswitch == 1 then
			pl:EmitSound("taunts/ph_enhanced/dx_thebomb.wav")
			balls.bombswitch = 0
		end
	end
}
-- Don't Edit below unless you know what you're doing.

function balls:AddMoreLuckyEvents()
	local t = list.Get("LuckyBallsAddition")
	if !table.IsEmpty(t) then
		for name,tab in pairs(t) do
			PHX.VerboseMsg("[PHX: Lucky Ball] Adding new events : "..name)
			table.insert(balls.funclists, tab)
		end
	else
		PHX.VerboseMsg("[PHX: Lucky Ball] There is no additional events detected, skipping...")
	end
end

balls:AddMoreLuckyEvents()

function balls:The_LuckyDrop(pl)
	-- For hunter only.
	if pl:Team() == TEAM_HUNTERS && pl:Alive() then
		balls.getfunction = table.Random(balls.funclists)
		balls.getfunction(pl)
		
		hook.Call("PH_OnLuckyBallPickup", nil, pl)
	end
end

function ENT:Use(activator)
	if GAMEMODE:InRound() && activator:IsPlayer() && activator:Alive() && activator:Team() == TEAM_HUNTERS then
		if self.Uses == 0 then
			balls:The_LuckyDrop(activator)
			
			self.Entity:EmitSound(Sound(table.Random(balls.sounds)))
			self.Uses = 1
			self.Entity:Remove()
		else
			self.Entity:Remove()
		end
	end
end
