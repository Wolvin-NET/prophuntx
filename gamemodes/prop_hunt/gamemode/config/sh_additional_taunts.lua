-- In here you can add two team taunts without seperating them.
local taunts = {}

TEAM_HUNTERS = TEAM_HUNTERS or 1
TEAM_PROPS	= TEAM_PROPS or 2

-- Begin Table: Hunters
taunts[TEAM_HUNTERS] = {
	["Guuuh!"]						=	"vo/k_lab/ba_guh.wav",
	["If you See Dr. Breen"]		= 	"vo/streetwar/rubble/ba_tellbreen.wav",
	["test"] 						=	"vo/k_lab/ba_geh.wav",
	-- Add more Hunters Taunt here...
}
-- Begin Table: Props
taunts[TEAM_PROPS] = {
	["Windows XP Shutdown"]			=	"taunts/ph_enhanced/ext_xp_off.wav",
	["Windows XP Startup"]			=	"taunts/ph_enhanced/ext_xp_start.wav"
	-- Add more Props Taunt here...
}

local test={
	[TEAM_HUNTERS] = { 
		["test"] = "vo/k_lab/ba_gah.wav",
	},
	[TEAM_PROPS] = { 
		["test2"] = "vo/k_lab/ba_guh.wav",
	}
}

list.Set("PHX.CustomTaunts", "PHX Custom Taunt Examples", taunts)
list.Set("PHX.CustomTaunts", "Taunt Test", test)