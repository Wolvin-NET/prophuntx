-- WARNING: THIS CODE IS UNFINISHED!!!!

PHX.LANGUAGES = {}

-- Todo: Move convars to sh_init.lua in future to prevent Replication Problem. Garry's Mod has broken FCVAR_REPLICATED flag.

PHX.CVAR.UseForceLang	= CreateConVar("ph_use_lang", "0", {FCVAR_SERVER_CAN_EXECUTE}, "Enable forced-language display. THIS WILL BYPASS USER-SELECTED LANGUAGE!", 0, 1)
PHX.CVAR.ForcedLanguage	= CreateConVar("ph_force_lang", "en_us", {FCVAR_SERVER_CAN_EXECUTE}, "Default language to force.")

PHX.CVAR.DefaultLang	= CreateConVar("ph_default_lang", "en_us", {FCVAR_SERVER_CAN_EXECUTE}, "First-time player joined default language to show.")

PHX.CVAR.Language		= CreateConVar("ph_language", "en_us", {FCVAR_ARCHIVE}, "User language to display.")

local f = file.Find(engine.ActiveGamemode() .. "/gamemode/langs/*.lua", "LUA")
for _,lgfile in SortedPairs(f) do
	PHX.VerboseMsg("[PHX] [LANGUAGE] Adding Language File -> ".. lgfile)
	AddCSLuaFile("langs/" .. lgfile)
	include("langs/" .. lgfile)
end

-- Check
if table.IsEmpty(PHX.LANGUAGES) then
	print("language table: Empty, is there anything wrong?")
else
	print("language table: OK.")
end

-- Normal Translation. This will output error and does not return original text from textToFind.
function PHX:Translate( textToFind, ... )
	if !textToFind then textToFind = "ERROR" end

	local args = {...}
	local lg = self.CVAR.Language:GetString()
	
	-- if this was forced by server, we'll use that instead.
	if PHX.CVAR.UseForceLang:GetBool() then
		lg = PHX.CVAR.UseForceLang:GetString()
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then return "Cannot translate [" .. textToFind .. "], Language " .. lg .. " not found." end

	if args ~= nil and (not table.IsEmpty(args)) then
		if !code[textToFind] then 
			return "Error: Cannot translate, " .. textToFind .. " not found."
		else
			local NiceFormat = string.format(code[textToFind], ...)
			return NiceFormat
		end
	end
	
	if !code[textToFind] or code[textToFind] == nil then
		return "translation not found"
	end
	
	return code[textToFind]
end

-- Fallback Translate: A quick version, used to revert translation to textToFind args if translation wasnt found.
-- This commonly used for VGUI or Fretta's component to avoid Informational Not Found texts.
function PHX:FTranslate( textToFind, ... )
	
	local args = {...}
	local lg = self.CVAR.Language:GetString()
	
	-- if this was forced by server, we'll use that instead.
	if PHX.CVAR.UseForceLang:GetBool() then
		lg = PHX.CVAR.UseForceLang:GetString()
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then
		--fallback
		return textToFind
	end
	
	if args ~= nil and (not table.IsEmpty(args)) then
		if !code[textToFind] then
			--fallback
			return textToFind
		else
			local NiceFormat = string.format(code[textToFind], ...)
			return NiceFormat
		end
	end
	
	if !code[textToFind] or code[textToFind] == nil then
		--fallback
		return textToFind
	end
	
	return code[textToFind]
end

function PHX:GetRandomTranslated( tblKey )

	if type(tblKey) ~= "string" then return "Argument must contain string only!" end
	if !tblKey then return "Cannot find specified table key: "..tblKey end

	local lg = self.CVAR.Language:GetString()
	
	-- if this was forced by server, we'll use that instead.
	if PHX.CVAR.UseForceLang:GetBool() then
		lg = PHX.CVAR.UseForceLang:GetString()
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then return "Cannot find random table [" .. tblKey .. "], Language " .. lg .. " not found." end
	
	--[[
		Example: if there is in your language contains:
		LANG.RANDOM_DEATHNOTICE_MESSAGE = { ... } then it should capture a value from:
		
		PHX.LANGUAGES[<lang code>]["RANDOM_DEATHNOTICE_MESSAGE"]
	]]
	local tbl = code[tblKey]
	if !tbl then return "cannot find "..tblKey.." table." end
	
	if type(tbl) == "table" then
		local result = table.Random( tbl )
		return result
	else
		return "cannot get translation because table argument is not a table type."
	end
end

-- Todo: Other helper functions