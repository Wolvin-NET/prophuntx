-- Add New Key Hint to the "Controls Hint" Notification on player spawn.
-- See cl_init.lua @ 735

list.Set("PHX.ControlHintList",  KEY_F4, 			 { team = TEAM_HUNTERS or 1, type = "number",  text = "Open PointShop or TRANSLATION_ID_HERE" }) --Number
list.Set("PHX.ControlHintList", "ph_my_default_key", { team = TEAM_PROPS or 2, type = "convar",  text = "It's Do Something or TRANSLATION_ID_HERE" }) --ConVar
list.Set("PHX.ControlHintList", "R3 Button Joystick", { team = TEAM_PROPS or 2, type = "default", text = "Rotate or TRANSLATION_ID_HERE" }) --Default