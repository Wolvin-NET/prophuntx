-- WARNING: THIS CODE IS UNFINISHED!!!!

PHX.LANGUAGES = {}

PHX.CVAR.UseForceLang	= CreateConVar("ph_use_lang", "0", {FCVAR_SERVER_CAN_EXECUTE}, "Enable forced-language display. THIS WILL BYPASS USER-SELECTED LANGUAGE!")
PHX.CVAR.ForcedLanguage	= CreateConVar("ph_force_lang", "en_us", {FCVAR_SERVER_CAN_EXECUTE}, "Default language to force.")

PHX.CVAR.DefaultLang	= CreateConVar("ph_default_lang", "en_us", {FCVAR_SERVER_CAN_EXECUTE}, "Default user language when joining.")

-- this is client-sided.
PHX.CVAR.Language		= CreateConVar("ph_language", "en_us", {FCVAR_USERINFO, FCVAR_ARCHIVE}, "User language to display.")

-- todo: include("") stuff to /lang/<lang.lua>

-- original: function PHX:Translate( textToFind, bIsFormatted, ... )
function PHX:Translate( textToFind, ... )
	local args = {...}

	if args ~= nil and (not table.IsEmpty(args)) then
		local NiceFormat = string.format(self.LANGUAGES[PHX.CVAR.Language][textToFind], ...)
		return NiceFormat
	end
	
	return self.LANGUAGES[PHX.CVAR.Language][textToFind]
end

function PHX:GetRandomTranslated( tbl )

	if table.IsEmpty(tbl) then return "Error: table not found" end
	
	local result = table.Random( tbl )
	return result
end

-- Todo: Other helper functions