local taunts = {}

-- Keep this variable always available, to make sure it's valid one.
TEAM_HUNTERS 	= TEAM_HUNTERS or 1
TEAM_PROPS		= TEAM_PROPS or 2

-- Begin Table: Hunters
taunts[TEAM_HUNTERS] = {
	["Guuuh!"]						=	"vo/k_lab/ba_guh.wav",
	["If you See Dr. Breen"]		= 	"vo/streetwar/rubble/ba_tellbreen.wav",
	-- Add more Hunters Taunt here...
}
-- Begin Table: Props
taunts[TEAM_PROPS] = {
	["Windows XP Shutdown"]			=	"taunts/ph_enhanced/ext_xp_off.wav",
	["Windows XP Startup"]			=	"taunts/ph_enhanced/ext_xp_start.wav",
	-- Add more Props Taunt here...
}

list.Set("PHX.CustomTaunts", "PHX Custom Taunt Examples", taunts)