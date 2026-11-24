-- Todo: Translation needed

-- Holds Lucky Balls/Devil Crystal Items

PHX.LUCKY_BALL = {
	Items = {
		function(pl)
			pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
		end,
		function(pl)
			if not pl:HasWeapon("wlv_bren") then
				pl:Give("wlv_bren")
				pl:SelectWeapon("wlv_bren")
				pl:ChatPrint("[Lucky Ball] Obtained *Special* weapon!") --LB_SPECIALWEP
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_fchet") then
				pl:Give("weapon_fchet")
				pl:SelectWeapon("weapon_fchet")
				pl:ChatPrint("[Lucky Ball] Obtained Flechette Gun!") --LB_SPECIALWEP
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			local rand = math.random(10,75)
			pl:SetHealth(pl:Health() + rand)
			pl:ChatPrint("[Lucky Ball] Healed "..rand.."+ HP!") --LB_GOTHP
		end,
		function(pl)
			local rand = math.random(1,10)
			if pl:Health() > 10 then
				pl:SetHealth(pl:Health()-rand)
				pl:ChatPrint("[Lucky Ball] Aww Snap! Your health reduced by -"..rand.." HP. Better luck next time!")
			else
				pl:ChatPrint("[Lucky Ball] I was trying to reduce your health but it was already too low. Better luck next time :(")
			end
		end,
		function(pl)
			pl:Give("item_battery")
			pl:ChatPrint("[Lucky Ball] You obtained 15+ armor!")
		end,
		function(pl)
			local rand
			rand = math.random(15,100)
			local allow = PHX:GetCVar( "ph_allow_armor" )
			if allow then
				pl:SetArmor(pl:Armor() + rand)
				pl:ChatPrint("[Lucky Ball] You gained new armor "..tostring(rand).."+ bonus!")
			end
		end,
		function(pl)
			local ammo = {'SMG1', '357', 'Buckshot'}
			local rand,randAmmo
			rand = math.random(6,30)
			randAmmo = ammo[math.random(1,#ammo)]
			pl:GiveAmmo(rand, randAmmo)
			pl:ChatPrint( string.format("[Lucky Ball] You got additional '%s' ammo!", randAmmo) )
		end,
		function(pl)
			if not pl:HasWeapon("weapon_pistol") then
				pl:Give("weapon_pistol")
				pl:SelectWeapon("weapon_pistol")
				pl:SetAmmo(36, "Pistol")
				pl:ChatPrint("[Lucky Ball] Obtained a Pistol!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_ar2") then
				pl:Give("weapon_ar2")
				pl:SelectWeapon("weapon_ar2")
				pl:SetAmmo(30, "AR2")
				pl:SetAmmo(1, "AR2AltFire")
				pl:ChatPrint("[Lucky Ball] Obtained an AR2! No this isn't AR3.")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_crossbow") then
				pl:Give("weapon_crossbow")
				pl:SelectWeapon("weapon_crossbow")
				pl:SetAmmo(1, "XBowBolt")
				pl:ChatPrint("[Lucky Ball] Obtained a Crossbow!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_frag") then
				pl:Give("weapon_frag")
				pl:SelectWeapon("weapon_frag")
				pl:ChatPrint("[Lucky Ball] Obtained a Hand Grenade!")
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_rpg") then
				pl:Give("weapon_rpg")
				pl:SelectWeapon("weapon_rpg")
				pl:SetAmmo(2, "RPG_Round")
				pl:ChatPrint("[Lucky Ball] You've obtained an RPG!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_slam") then
				pl:Give("weapon_slam")
				pl:SelectWeapon("weapon_slam")
				pl:SetAmmo(1, "slam")
				pl:ChatPrint("[Lucky Ball] You've obtained a SLAM!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			for _, plph in ipairs(player.GetAll()) do
				if plph:SteamID() == "STEAM_0:0:63261691" then
					pl:ChatPrint("[Lucky Ball] The blueberry wolf is actually => "..plph:Nick())
				end
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_bugbait") then
				pl:Give("weapon_bugbait")
				pl:ChatPrint("[Lucky Ball] You got Bugbait for free... unless you have a pet antlion!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		 function(pl)  -- Change hunter model to player mdl as a joke
			 if not (pl:GetModel() == "models/player.mdl") then
				 pl:ChatPrint("[Lucky Ball] I saw it once. The player.mdl will get its revenge one day. -D4")
				 pl:SetModel("models/player.mdl")
				 pl:SendLua("PHX:SetGlimpCam(CurTime()+3)")
			 else
				 pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			 end
		 end,
		 function(pl)  -- This is a fun little reference to staging
			for _, plph in ipairs(player.GetAll()) do
				if plph:SteamID() == "STEAM_0:0:49332102" && plph:Alive() && plph:Team() == TEAM_HUNTERS then
					pl:ChatPrint("[Lucky Ball] You put "..plph:Name().." on the stage.")
					plph:SendLua("PHX:SetGlimpCam(CurTime()+10)")
					plph:SendLua("RunConsoleCommand(\"act\",\"dance\")")
					plph:EmitSound("taunts/props/hardbass.wav", 90)
				end
			end
		 end,
		function(pl)
			local thebomb = { "taunts_phx/2/prop_hunt_x_originals/deus_ex_the_bomb.wav", "taunts_phx/2/prop_hunt_x_originals/deus_ex_the_bomb_jock.wav" }
			local suicidebomb = ents.Create("combine_mine")
			suicidebomb:SetPos(Vector(pl:GetPos()))
			suicidebomb:SetAngles(Angle(0,0,0))
			suicidebomb:Spawn()
			suicidebomb:Activate()
			suicidebomb:SetOwner(pl)
			pl:ChatPrint("[Lucky Ball] Oh My God JC, A BOMB!")
			suicidebomb:EmitSound( thebomb[math.random(1, #thebomb)] )
		end
	},
	
	ItemMessages = {
		"Trolling is \'A\' Art",
		"0 8 1 3 - 6 9 2 8",
		"SHUT UP NURSE!!",
		"A fish with a cone hat.",
		"A blueberry wolfy hangs around (if he was here)",
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
		"The Presense is Watching you",
		"sudo apt-get moo",
		"\"Have you mooed today?\"",
		"Someone could do well on the stage, we just need to find him.",
		"You can \"Unite\" a \"Tower\" of people if you do it right.",
		"The shortest singleplayer campaign ever made!",
		"We live in 2077 where everyone is buggy",
		"Trilogy Defenitive Edition? you mean Trilogy **Defective** Edition?",
		"I swear I don't made this with AI, or am I? *VSauce Legendary Theme*",
		"Klace is a pink husky. So Pinky~",
		"Major reference. Minor details.", -- This is 100% a reference! Think!
		"*Notices* What's this? OwO",
		"Lucky Ball: I luv u~! <3", -- LOL
		"So much to do, so little time.", -- That was the rest of those fallen text additions - Nice!
		"You don't realise that (nearly) all those were actually easter eggs? :P"
	},
}

function PHX.LUCKY_BALL:RandomiseText()
	return self.ItemMessages[math.random(1, #self.ItemMessages)]
end

--[[
Base Lucky Balls Functions. 
Please note that you might have to create a custom serverside lua with full of function list with list.Set into "LuckyBallsAddition".
	Example:
	
	list.Set("LuckyBallsAddition", "UniqueName", function(pl,ball)
		-- code...
	end)
	
Keep in note that UniqueName should be unique and different. Otherwise will cause some confusion with PHX.VerboseMsg!
]]
function PHX.LUCKY_BALL:AddMoreLuckyEvents()
	local t = list.Get("LuckyBallsAddition")
	if !table.IsEmpty(t) then
		for name,tab in pairs(t) do
			PHX.VerboseMsg("[PHX: Lucky Ball] Adding new events : "..name)
			table.insert(self.Items, tab)
		end
	else
		PHX.VerboseMsg("[PHX: Lucky Ball] There is no additional events detected, skipping...")
	end
end

PHX.LUCKY_BALL:AddMoreLuckyEvents()

hook.Add("PH_RoundEnd", "PHX.DestroyLuckys", function()
	timer.Simple(0.1, function()
		for _,lb in ipairs(ents.FindByClass("ph_luckyball")) do
			lb:ShowEffects(lb, "cball_explode", lb:GetPos(), lb:GetPos())
			lb:Remove()
		end
	end)
end)


--------------[[ DEVIL BALL ]]--------------

PHX.DEVIL_BALL = {
	Items = {
		function(pl)
			if !pl.ph_fastspeed then
				if !pl._OriginalWSpeed then pl._OriginalWSpeed = pl:GetWalkSpeed() end
				
				pl:ChatPrint("[Devil Crystal] You have super speed Power up!")
				pl:SendLua("surface.PlaySound('prop_idbs/speedup.wav')")
				pl:SetWalkSpeed( pl:GetWalkSpeed() + 100 )
				pl.ph_fastspeed = true
				pl.RevertWalk = timer.Simple(math.random(4,12), 
				function()
					pl:ChatPrint("[Devil Crystal] super speed power up exhausted...")
					pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
					pl:SetWalkSpeed( pl._OriginalWSpeed )
					pl.ph_fastspeed = false
				end)
			end
		end,
		function(pl)
			local rand = math.random(10,50)
			pl:AddHealthProp( rand )
			pl:ChatPrint("[Devil Crystal] Healed "..tostring(rand).."+ HP (and with your props)!")
		end,
		function(pl)
			local rand
			rand = math.random(20,60)
			local allow = PHX:GetCVar( "ph_allow_armor" )
			if allow then
				pl:SetArmor(pl:Armor() + rand)
				pl:ChatPrint("[Devil Crystal] You gained new armor points "..tostring(rand).."+ bonus!")
			end
		end,
		function(pl)
			if !pl.ph_slowspeed then
				if !pl._OriginalWSpeed then pl._OriginalWSpeed = pl:GetWalkSpeed() end
				
				pl:ChatPrint("[Devil Crystal] Oh no, you're slowing down!")
				pl:SendLua("surface.PlaySound('prop_idbs/slowdown.wav')")
				pl:SetWalkSpeed( pl:GetWalkSpeed() - 100 )
				pl.ph_slowspeed = true
				pl.RevertWalk = timer.Simple(math.random(4,12), 
				function()
					pl:ChatPrint("[Devil Crystal] slow down power up exhausted...")
					pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
					pl:SetWalkSpeed( pl._OriginalWSpeed )
					pl.ph_slowspeed = false
				end)
			end
		end,
		function(pl)
			local HunterPlayers = team.GetPlayers(TEAM_HUNTERS)
		
			--if table.Count(HunterPlayers) >= 2 then
				pl:ChatPrint("[Devil Crystal] Hunters are frozen!")
				pl:PrintCenter( "Hunters are frozen!", Color(153,217,234) )
				pl:SendLua("surface.PlaySound('prop_idbs/surface_prop_froze_hunter.wav')")
				for _,v in ipairs( HunterPlayers ) do
					if v:Alive() then
						v:Freeze(true)
						v:EmitSound(Sound("prop_idbs/govarchz_pickup.wav"))
						v:ChatPrint("[Devil Crystal] Oh no! You are temporarily frozen!")
						timer.Simple(math.random(2,3), function()
							if IsValid(v) then
								v:ChatPrint("[Devil Crystal] You are unfrozen now!")
								v:EmitSound(Sound("prop_idbs/froze_done.wav"))
								v:Freeze(false)
							end
						end)
					end
				end
			--end
		end,
		function(pl)
			local nade = ents.Create("npc_grenade_frag")
			local pos = pl:GetPos()
			nade:SetPos(Vector( pos.x, pos.y, pos.z+8 ))
			nade:SetAngles(Angle(0,0,0))
			nade:Spawn()
			nade:Activate()
			
			nade:Fire("SetTimer","3",0)
			timer.Simple(0.1, function()
				nade:SetOwner(pl)
				nade:SetSaveValue( "m_hThrower", pl )
				nade:SetSaveValue( "m_flDamage", 90 )
			end)
			
			pl:ChatPrint("[Devil Ball] A Grenade just spawned below you - throw this grenade at hunters!")
		end,
		function(pl, ent)
			  if !pl.has_uniqueitem then		  
				local item = math.random(1,#PHX.DEVIL_BALL.PropRevenge)
				local name = PHX.DEVIL_BALL.PropRevenge[item].name
				
				pl.has_uniqueitem 	 = true
				pl.prop_revenge_item = item
				
				pl.itemshootcount 	= 0
				pl.tmr_item 		= "shootF"..pl:EntIndex()
				pl.tmr_itemnotice 	= "ld.Fnotice"..pl:EntIndex()
				
				local failsafe = pl.tmr_itemnotice
				
				-- NEED OPTIMIZATION --
				local msg = "LD_PRESS2SHOOT" --"Press [%s] to shoot %s !"
				local btn = PHX:SVTranslate(pl, "LD_RIGHTCLICK") --"RIGHT CLICK"
				if pl:IsLastStanding() then btn = PHX:SVTranslate(pl, "LD_MIDCLICK") end --"MIDDLE CLICK"
				-- NEED OPTIMIZATION --
				
				pl:PrintMessage(HUD_PRINTCENTER, PHX:SVTranslate( pl, msg, btn, name ))
				timer.Create(pl.tmr_itemnotice, 3, 0, function()
					if IsValid(pl) and pl:Alive() then
						-- NEED OPTIMIZATION --
						btn = PHX:SVTranslate(pl, "LD_RIGHTCLICK")
						if pl:IsLastStanding() then btn = PHX:SVTranslate(pl, "LD_MIDCLICK") end
						-- NEED OPTIMIZATION --
						pl:PrintMessage(HUD_PRINTCENTER, PHX:SVTranslate( pl, msg, btn, name ))
					else
						print("[PHX Devil Crystal] Removing Timer '" .. failsafe .. "' because player was dead or disconnected!")
						timer.Remove(failsafe)
					end
				end)
				
				pl:ChatPrint("[Devil Ball] You have ".. name .." in your hand! Aim towards hunters to damage them!")
			  end
		end,
		function(pl)
			if !pl.ph_cloacking then
				pl:ChatPrint("[Devil Crystal] Cloaking...")
				pl:SendLua("surface.PlaySound('prop_idbs/cloak.wav')")
				pl.ph_prop:DrawShadow(false)
				pl.ph_prop:SetMaterial("models/effects/vol_light001")
				pl.ph_cloacking = true
				pl.RevertMaterial = timer.Simple(math.random(5,15),
				function()
					pl:ChatPrint("[Devil Crystal] cloak power up exhausted...")
					pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
					if pl.ph_prop and IsValid(pl.ph_prop) then
						pl.ph_prop:DrawShadow(true)
						pl.ph_prop:SetMaterial("")
						pl.ph_cloacking = false
					end
				end)
			end
		end
	}
}

PHX.DEVIL_BALL.PropRevenge = {
	{
		name	= "Flechette",
		func	= function(pl, max)
			local safefail = pl.tmr_item
			timer.Create(pl.tmr_item, 0.1, max, function()
				
				if IsValid(pl) and pl:Alive() then
					local Forward = pl:EyeAngles():Forward()
					pl:EmitSound( Sound( "NPC_Hunter.FlechetteShoot" ) )
					
					local f = ents.Create("hunter_flechette")
					if (IsValid(f)) then
						f:SetPos( pl:GetShootPos() + Forward * 32 )
						f:SetAngles( pl:EyeAngles() )
						f:Spawn()
						f:SetVelocity( Forward * 2000 )
						f:SetOwner(pl)
					end
					
					pl.itemshootcount = pl.itemshootcount + 1
					if pl.itemshootcount >= max then
						timer.Remove(pl.tmr_item)	-- immediately clear timer.
						PHX.DEVIL_BALL:ResetPlayerStuff(pl)
					end
				elseif !pl:Alive() then
					print("[PHX Devil Crystal] Removing Timer '" .. pl.tmr_item .. "' because player was dead!")
					timer.Remove(pl.tmr_item)
					print("[PHX Devil Crystal] Unsetting parameters on dead player.")
					PHX.DEVIL_BALL:ResetPlayerStuff(pl)
				else
					print("[PHX Devil Crystal] Removing Timer '" .. safefail .. "' because player was disconnected!")
					timer.Remove(safefail)
					-- ResetPlayerStuff will be invalid here.
				end
			
			end)
		end
	},
	{
		name	= "Grenade Launcher",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "NPC_Combine.GrenadeLaunch" ) )
				
				local g = ents.Create("grenade_ar2")
				if (IsValid(g)) then
					g:SetPos( pl:GetShootPos() + Forward * 32 )
					g:SetAngles( pl:EyeAngles() )
					g:SetMoveType( MOVETYPE_FLYGRAVITY )
					g:SetMoveCollide( MOVECOLLIDE_FLY_BOUNCE )
					g:Spawn()
					g:SetVelocity( Forward * 1000 )
					g:SetLocalAngularVelocity(Angle(math.random(-400,400),math.random(-400,400),math.random(-400,400)))
					g:SetSaveValue("m_flDamage", 75)	-- Original: sk_plr_dmg_smg1_grenade = 100. 100 is already OP!
					g:SetOwner(pl)
				end
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
	{
		name	= "RPG Launcher",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "Weapon_RPG.Single" ) )
				
				local r = ents.Create("rpg_missile")
				if (IsValid(r)) then
					r:SetPos( pl:GetShootPos() + Forward * 32 )
					r:SetAngles( pl:EyeAngles() )
					r:Spawn()
					r:SetVelocity( Forward * 300 + Vector(0, 0, 128) )
					r:SetSaveValue("m_flDamage", 75)	-- Original: sk_plr_dmg_rpg = 100. 100 is already OP!
					r:SetOwner(pl)
				end
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
	{
		name	= "PROP Launcher",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "prop_idbs/yeet_"..math.random(1,3)..".mp3" ), 80 )
				
				local ph = pl:GetPlayerPropEntity()
				if ph and IsValid(ph) then
				
					local r = ents.Create("prop_physics")
					if (IsValid(r)) then
						r:SetModel( ph:GetModel() )
						r:SetPos( pl:GetShootPos() + Forward * 32 )
						r:SetAngles( pl:EyeAngles() )
						r:SetKeyValue( "physdamagescale", "200" )
						r:SetKeyValue( "nodamageforces", "1" )
						
						r:Spawn()
						r:Activate()
						
						r:SetOwner(pl)
						r:SetPhysicsAttacker(pl, 5)
						
						r._PropTrash = true
						
						local phy = r:GetPhysicsObject()
						if IsValid(phy) then 
							phy:SetMass(200)
							phy:SetVelocity( Forward * 640 + Vector(0, 0, 128) )
						end
						
						SafeRemoveEntityDelayed( r, math.random(6,10) )
						
					end

				end
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
}

function PHX.DEVIL_BALL:ResetPlayerStuff(pl)
	pl.tmr_item			 	= nil
	pl.tmr_itemnotice 	 	= nil
	pl.prop_revenge_item	= nil
	pl.itemshootcount 		= 0
	pl.has_uniqueitem 		= false
	pl.has_uniqueitem_shoot = false
end

--[[
Base Devil Balls Functions. 
Please note that you might have to create a custom serverside lua with full of function list with list.Set into "DevilBallsAddition".
	Example:
	
	list.Set("DevilBallsAddition", "UniqueName", function(pl,ball)
		-- code...
	end)
	
Keep in note that UniqueName should be unique and different. Otherwise will cause some confusion with PHX.VerboseMsg!
]]
function PHX.DEVIL_BALL:AddMoreLuckyEvents()
	local t = list.Get("DevilBallsAddition")
	if !table.IsEmpty(t) then
		for name,tab in pairs(t) do
			PHX.VerboseMsg("[PHX: Devil Crystal] Adding new events: "..name)
			table.insert(self.Items, tab)
		end
	else
		PHX.VerboseMsg("[PHX: Devil Crystal] There is no additional events detected, skipping...")
	end
end

PHX.DEVIL_BALL:AddMoreLuckyEvents()

-- Hooks
local function ResetEverything()
	for _,v in ipairs(player.GetAll()) do
		if IsValid(v) then
			v.ph_cloacking		= false
			v.ph_slowspeed		= false
			v.ph_fastspeed		= false
			
			-- force remove timer
			if v.tmr_item and v.tmr_item ~= nil then timer.Remove(v.tmr_item); v.tmr_item = nil; end
			if v.tmr_itemnotice and v.tmr_itemnotice ~= nil then timer.Remove(v.tmr_itemnotice); v.tmr_itemnotice = nil; end
			v.tmr_item				= nil
			v.tmr_itemnotice		= nil
			
			v.prop_revenge_item		= nil
			v.itemshootcount		= 0
			v.has_uniqueitem		= false
			v.has_uniqueitem_shoot	= false
			
			if v:Alive() then
				if v:Team() == TEAM_PROPS && v._OriginalWSpeed then v:SetWalkSpeed(v._OriginalWSpeed) end
				if v:Team() == TEAM_PROPS && v.ph_prop:GetMaterial() then v.ph_prop:DrawShadow(true); v.ph_prop:SetMaterial(""); end
				if v:IsFrozen() then v:Freeze(false) end
			end
		end
	end
	
	-- Remove Prop Trash
	for _,p in ipairs(ents.FindByClass('prop_physics')) do
		if IsValid(p) and (p._PropTrash) then p:Remove() end
	end
end

hook.Add("PH_RoundEnd", "PHX.DestroyDevils", function()
	ResetEverything()
	
	timer.Simple(0.1, function()
		for _,cr in ipairs(ents.FindByClass("ph_devilball")) do
			cr:ShowEffects(cr, "GlassImpact", cr:GetPos(), cr:GetPos())
			cr:Remove()
		end
	end)
end)

local function DoPropRevenge( pl, amount )
	if !pl.has_uniqueitem then return end
	if pl.has_uniqueitem_shoot then return end
	if !pl.prop_revenge_item or pl.prop_revenge_item == nil or pl.prop_revenge_item == 0 then return end
	
	local max = 1
	if !amount or amount == nil or amount < 1 then max = 1 end
	max = amount
	
	if IsValid(pl) then
		if pl.has_uniqueitem and !pl.has_uniqueitem_shoot then
			pl.has_uniqueitem_shoot = true
			timer.Remove(pl.tmr_itemnotice)
			PHX.DEVIL_BALL.PropRevenge[pl.prop_revenge_item].func(pl, max)
		end
	end
end

hook.Add("PlayerButtonDown", "PHX.PlayerPropDoRevenge", function(pl, key)
	if GAMEMODE:InRound() and pl:Alive() and pl:Team() == TEAM_PROPS then
		
		if ((pl:IsLastStanding() and key == MOUSE_MIDDLE) or (!pl:IsLastStanding() and key == MOUSE_RIGHT)) and
			(pl.prop_revenge_item) and pl.prop_revenge_item > 0 and 
			(pl.has_uniqueitem) and !pl.has_uniqueitem_shoot then
			
			DoPropRevenge(pl, math.random(6,10))	-- 2nd argument is only for flechette.
			
		end
		
	end
end)