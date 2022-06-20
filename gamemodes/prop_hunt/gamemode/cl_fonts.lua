-- cl_init.lua
surface.CreateFont( "HunterBlindLockFont", {
	font	= "Arial",
	size	= 14,
	weight	= 1200,
	antialias = true,
	underline = false
})

surface.CreateFont("TrebuchetBig", {
	font = "Impact",
	size = 40
})

-- cl_menu.lua
surface.CreateFont("PHX.MenuCategoryLabel", 
{
	font = "Roboto",
	size = 26,
	weight = 500,
	antialias = true,
	shadow = true
})

-- cl_hud.lua
surface.CreateFont("PHX.HealthFont", 
{
	font = "Roboto",
	size = 56,
	weight = 650,
	antialias = true,
	shadow = true
})

surface.CreateFont("PHX.AmmoFont", 
{
	font = "Roboto",
	size = 16,
	weight = 500,
	antialias = true,
	shadow = true
})

surface.CreateFont("PHX.ArmorFont", 
{
	font = "Roboto",
	size = 32,
	weight = 500,
	antialias = true,
	shadow = true
})

surface.CreateFont("PHX.TopBarFont", 
{
	font = "Roboto",
	size = 20,
	weight = 500,
	antialias = true,
	shadow = true
})
surface.CreateFont("PHX.TopBarFontTeam", 
{
	font = "Roboto",
	size = 60,
	weight = 650,
	antialias = true,
	shadow = true
})

-- cl_fb_core.lua - the Prop Menu File browser.
surface.CreateFont("RobotoInfo", {
	font	= "Roboto",
	size	= 24,
	weight	= 750
})
surface.CreateFont("RobotoWarn", {
	font	= "Roboto",
	size	= 16,
	weight	= 750
})

-- cl_chat.lua
surface.CreateFont("PHX_NicePrintCenter", {
	font	= "Roboto",
	size	= 32,
	weight	= 750,
	shadow	= true
})

-- cl_credits.lua
surface.CreateFont("PHX.TitleFont", 
	{
		font = "Roboto",
		size = 40,
		weight = 700,
		antialias = true,
		shadow = true
	})

-- cl_tauntwindow.lua
surface.CreateFont("PHX.TauntFont", 
{
	font = "Roboto",
	size = 19,
	weight = 500,
	antialias = true,
	shadow = false
})

-- Map Votes fonts
surface.CreateFont("RAM_VoteFont", {
    font = "Trebuchet MS",
    size = 19,
    weight = 700,
    antialias = true,
    shadow = true
})

surface.CreateFont("RAM_VoteFontCountdown", {
    font = "Tahoma",
    size = 32,
    weight = 700,
    antialias = true,
    shadow = true
})

surface.CreateFont("RAM_VoteSysButton", 
{    font = "Marlett",
    size = 13,
    weight = 0,
    symbol = true,
})

-- Chat Fonts
surface.CreateFont( "eChat_18", {
	font = "Roboto Lt",
	size = 18,
	weight = 500,
	antialias = true,
	shadow = true,
	extended = true,
} )

surface.CreateFont( "eChat_16", {
	font = "Roboto Lt",
	size = 16,
	weight = 500,
	antialias = true,
	shadow = true,
	extended = true,
} )