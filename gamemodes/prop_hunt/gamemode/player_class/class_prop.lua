-- Create new class
local CLASS = {}


-- Some settings for the class
CLASS.DisplayName			= "Prop"
CLASS.WalkSpeed 			= 250
CLASS.CrouchedWalkSpeed 	= 0.2
CLASS.RunSpeed				= 275
CLASS.DuckSpeed				= 0.2
CLASS.DrawTeamRing			= false

-- Prevent 'mod_studio: MOVETYPE_FOLLOW with No Models error.'
CLASS.DrawViewModel			= false


-- Called by spawn and sets loadout
function CLASS:Loadout(pl)
	-- Props don't get anything
end


-- Called when player spawns with this class
function CLASS:OnSpawn(pl)
	pl:SetColor(Color(0,0,0,0))
	pl:SetCustomCollisionCheck(true)
	pl:SetupHands()
	pl:SetAvoidPlayers(true)
	pl:CrosshairEnable()
	
	-- Initial Setup during Prop choosing a props. Jump-Duck may still required somehow.
	pl:SetViewOffset(Vector(0,0,64))
	pl:SetViewOffsetDucked(Vector(0,0,28))
	
	-- Prevent 'mod_studio: MOVETYPE_FOLLOW with No Models error.'
	pl:DrawViewModel( false )
	
	pl.ph_prop = ents.Create("ph_prop")
	pl.ph_prop:SetPos(pl:GetPos())
	pl.ph_prop:SetAngles(pl:GetAngles())	
	pl.ph_prop:Spawn()
	
	if PHX:GetCVar( "ph_use_custom_plmodel_for_prop" ) then
		pl.m_shortHunterModel = player_manager.TranslatePlayerModel( pl:GetInfo("cl_playermodel") )
		
		if table.HasValue( PHX.PROP_PLMODEL_BANS, string.lower( pl.m_shortHunterModel ) ) then
			pl.ph_prop:SetModel("models/player/kleiner.mdl")
			pl:PHXChatInfo("WARNING", "PROP_PLAYERMDL_BANNED")
		elseif table.HasValue( PHX.PROP_PLMODEL_BANS, string.lower( pl:GetInfo("cl_playermodel") ) ) then
			pl.ph_prop:SetModel("models/player/kleiner.mdl")
			pl:PHXChatInfo("WARNING", "PROP_PLAYERMDL_BANNED")
		else
			pl.ph_prop:SetModel( pl.m_shortHunterModel )
		end
	end
	
	pl.ph_prop:SetSolid(SOLID_BBOX)
	pl.ph_prop:SetOwner(pl)
	pl:SetNWEntity("PlayerPropEntity", pl.ph_prop)
	
	-- Delay start the AutoTaunt stuff and Control Tutorial
	timer.Simple(1, function()
		if IsValid(pl) then
			net.Start("AutoTauntSpawn")
			net.Send(pl)
			
			net.Start("PH_ShowTutor")
			net.Send(pl)
		end
	end)
	
	pl.ph_prop.max_health = 100
end


-- Hands
function CLASS:GetHandsModel()
	return
end


-- Called when a player dies with this class
function CLASS:OnDeath(pl, attacker, dmginfo)
	pl:RemoveProp()
	-- reset the Prop Rotating State.
	net.Start("PHX.rotateState")
	net.WriteInt(0, 2)
	net.Send(pl)
	
	pl:SetViewOffset(Vector(0,0,64))
	pl:SetViewOffsetDucked(Vector(0,0,28))
end


-- Register
player_class.Register("Prop", CLASS)