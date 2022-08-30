--[=[

You are free to use, modify, contribute, or distribute the Prop Hunt: X ("SOFTWARE") as long as it stated exclusively for Garry's Mod.
Any changes or modification you have made publicly on Steam Workshop must include this license and a link back to this page in your credits page.
You are, however, not permitted to use for:
- Commercial Purposes, including selling the source code.
- Using, copying, alter (porting) the source code OUTSIDE of "Garry's Mod" Game WITHOUT Permission.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

]=]

if engine.ActiveGamemode() ~= "prop_hunt" then return end

local Errors = 0
local ErrorList = {}

local path = "phx_addons_conflict.json"

-- These are default stock that aren't always updated. We'll use from Networked instead.
local KnownConflictWSID = '["135509255","2048645528","201618882","1758906555","2584620576","972021336","308180580","143190159","2285962745","1854155320","2285024773","636109972","285682576","181154071","331268927","1584779212","229182186","272425836","468149739","192647111","434894248","184863918","2703558338","182739498","1841725776","456180380","714783820","2536335473","299500627","302390067","2602080081","2831915190","2387719925","227444957","180470977","207938283","2056433415","532522819","258850133","1437695913","142065231"]'
local CachedWSID = nil

local function ManageData( bShouldSave, data )

	if (!file.Exists( path, "DATA" )) then file.Write( path, KnownConflictWSID ) end

	if (bShouldSave) then
		if (data) and data ~= nil or data ~= "" then
			file.Write( path, data )
			if !file.Exists( path, "DATA" ) or file.Size( path, "DATA" ) < 1 then
				print("[PH:X Integrity Check] It appears data was failed to save! Reverting to Known Conflicted Addon IDs!")
				return KnownConflictWSID
			end
		else
			print("[PH:X Integrity Check] Requested 'data' is empty! Reverting to Known Conflicted Addon IDs!")
			return KnownConflictWSID
		end
		
		return data
	end
	
	local f = file.Read( path, "DATA" )
	
	if (!f) or f == nil then
		print("[PH:X Integrity Check] Local cached Conflicted Addon IDs was not found. Reverting to Known Conflicted Addon IDs!")
		return KnownConflictWSID
	end
	
	return f
	
end

local function PHX___openWarningDialog( bFoundError, tResult )

	if (!bFoundError) and Errors < 1 then
		return
	end
	
	local form = {}
	form.window = vgui.Create("DFrame")
	form.window:SetTitle("PH:X Warning: Conflict Found!")
	form.window:SetSize(800,420)
	form.window:SetDraggable(false)
	form.window:Center()
	
	form.scroll = form.window:Add("DScrollPanel")
	form.scroll:Dock(FILL)
	form.scroll:DockMargin(4,4,4,4)
	form.scroll:InvalidateParent( true )
	
	form.PanelHeader= form.scroll:Add("DPanel")
	form.PanelHeader:Dock(TOP)
	form.PanelHeader:SetHeight(40)
	form.PanelHeader:DockMargin(8,2,8,8)
	form.PanelHeader:SetBackgroundColor(Color(200,20,20,225))
	
	form.Header = form.PanelHeader:Add("DLabel")
	form.Header:Dock(FILL)
	form.Header:DockMargin(12,0,8,4)
	form.Header:SetText("Prop Hunt: X was stopped working due to Errors/conflicts were found!")
	form.Header:SetFont("HudHintTextLarge")
	form.Header:SetTextColor(color_white)
	form.Header:SetWrap(true)
	
	local Err = ""
	if Errors > 0 then
	
		Err = string.format("PH:X Integrity Check Warning: PH:X is not installed properly! %d Errors Found!", Errors)
		MsgC(Color(255,120,120), Err.."\n")
		
		form.label= form.scroll:Add("DLabel")
		form.label:Dock(TOP)
		form.label:SetHeight(40)
		form.label:DockMargin(8,2,8,4)
		form.label:SetText(Err)
		form.label:SetFont("HudHintTextLarge")
		form.label:SetTextColor(Color(255,255,0))
		form.label:SetWrap(true)
		
		for i,v in ipairs(ErrorList) do
			form["panelErr"..i]= form.scroll:Add("DPanel")
			form["panelErr"..i]:Dock(TOP)
			form["panelErr"..i]:SetHeight(32)
			form["panelErr"..i]:DockMargin(12,4,8,8)
			form["panelErr"..i]:SetBackgroundColor(Color(20,20,20,200))
			
			form["labelErr"..i]= form["panelErr"..i]:Add("DLabel")
			form["labelErr"..i]:Dock(FILL)
			form["labelErr"..i]:SetContentAlignment(4)
			form["labelErr"..i]:DockMargin(4,0,4,2)
			form["labelErr"..i]:SetText("Error Found: "..v)
			form["labelErr"..i]:SetFont("HudHintTextLarge")
			form["labelErr"..i]:SetTextColor(Color(240,40,72))
			form["labelErr"..i]:SetWrap(true)
		end
		
	end
	
	if (bFoundError) then
	
		form.PanelAddon= form.scroll:Add("DPanel")
		form.PanelAddon:Dock(TOP)
		form.PanelAddon:SetHeight(40)
		form.PanelAddon:DockMargin(8,8,8,4)
		form.PanelAddon:SetBackgroundColor(Color(200,20,20,200))
	
		form.labelAddon= form.PanelAddon:Add("DLabel")
		form.labelAddon:Dock(FILL)
		form.labelAddon:DockMargin(12,0,8,4)
		form.labelAddon:SetText("Found Addon Conflicts: (Must be DISABLED/UNINSTALLED & RESTART GAME!)")
		form.labelAddon:SetFont("Trebuchet24")
		form.labelAddon:SetTextColor(Color(255,255,0))
		form.labelAddon:SetWrap(true)
	
		for k,v in pairs(tResult) do
		
			local wsid = k
			local name = v.title
			local link = v.link
			
			local isloaded = steamworks.ShouldMountAddon( tonumber(wsid) )
			
			form["panelAddErr_"..k]= form.scroll:Add("DPanel")
			form["panelAddErr_"..k]:Dock(TOP)
			form["panelAddErr_"..k]:SetHeight(56)
			form["panelAddErr_"..k]:DockMargin(12,4,8,8)
			form["panelAddErr_"..k]:SetBackgroundColor(Color(20,20,20,200))
		
			form["labelAddErr_"..k]= form["panelAddErr_"..k]:Add("DLabel")
			form["labelAddErr_"..k]:Dock(FILL)
			form["labelAddErr_"..k]:SetContentAlignment(4)
			form["labelAddErr_"..k]:DockMargin(8,2,4,2)
			form["labelAddErr_"..k]:SetText( string.format( "Workshop ID [%s]: '%s' (%s)", wsid, name, (isloaded and "Enabled" or "Disabled") ) )
			form["labelAddErr_"..k]:SetFont("HudHintTextLarge")
			form["labelAddErr_"..k]:SetTextColor(Color(240,40,72))
			form["labelAddErr_"..k]:SetWrap(true)
			
			form["url_"..k] = form["panelAddErr_"..k]:Add("DLabelURL")
			form["url_"..k]:Dock(BOTTOM)
			form["url_"..k]:DockMargin(8,0,8,8)
			form["url_"..k]:SetHeight(12)
			form["url_"..k]:SetColor(Color(255,255,0))
			form["url_"..k]:SetText( "Click Here to Unsubscribe '"..name.."' Addon!" )
			form["url_"..k]:SetURL( link )
			
		end
	
	end
	
	form.window:MakePopup()

end

local function GetSubscribbedAddons()
	local t = {}
	for _,add in pairs( engine.GetAddons() ) do
		--if ( (add.downloaded) or (add.mounted) ) then
		if (add.mounted) then
			t[tostring(add.wsid)] = { 
				title 	= add.title,
				wsid	= tostring(add.wsid),
				link 	= "https://steamcommunity.com/sharedfiles/filedetails/?id=" .. tostring(add.wsid)
			}
		end
	end
	
	return t
end

local function GetConflictingAddons( data )
	local t = {}
	if data and data ~= nil then
		local r = util.JSONToTable( data )
		if (r) and r ~= nil then
			t = r
		end
	end
	
	local addons 	= GetSubscribbedAddons()
	local found 	= false
	local result 	= {}
	if istable(addons) and (not table.IsEmpty(addons)) then
		-- let's do a check
		for _,id in pairs( t ) do
			if (addons[id]) or addons[id] ~= nil then
				-- Found!
				local id 	= addons[id].wsid
				local name 	= addons[id].title
				local link 	= addons[id].link
				
				result[id]	= { title=name, wsid=id, link=link }
				
				found = true --!
			end
		end
		
	end
	
	local xErr = 0
	if Errors > 0 then
	
		local col = Color(255,120,120)
		MsgC( col, "[PH:X Integrity Check] Error! PH:X (may be) stopped working: There was "..Errors.." Errors found!\n" )
		
		for id,err in ipairs(ErrorList) do
			MsgC( col, id..": "..err.."\n" )
		end
		
		xErr = xErr + 1
	
	else
	
		print("[PH:X Integrity Check] No errors found.")
	
	end
	
	if (found) then
	
		local col = Color(255,120,120)
		local warn = {
			"============================[ !!! PH:X ERROR !!! ]============================",
			"!! Multiple Addons Conflicts Detected! PH:X May Cease to function!",
			"!! Please Review these addons by disabling or removing the addon\nAnd Restart the Game to take effect!",
		}
		
		for id,add in SortedPairs( result ) do
			table.insert(warn, string.format("!! - Addon Name: '%s' [ Workshop ID: %s, Link: %s ]", add.title, add.wsid, add.link))
		end
		
		for _,v in pairs(warn) do
			MsgC( col , v .."\n" )
		end
		
		MsgC( col, "============================[ !!! PH:X ERROR !!! ]============================\n" )
		
		xErr = xErr + 1
		
	else
		
		print("[PH:X Integrity Check] There was no Addons Conflict found.")
		
	end
	
	if CLIENT then
		if xErr > 0 then PHX___openWarningDialog( found, result ) end
	end
end

local cooldown = 86400*2 --2 days.
local function FETCH_CONFLICT_WSID()

	local nextUpdate = cookie.GetNumber( "phxIntegrityCheck", 0 )
	local time		 = os.time()
	
	if time < nextUpdate then
		print("[PH:X Integrity Check] Using from Local Cache...")
		GetConflictingAddons( CachedWSID )
	else	
		print("[PH:X Integrity Check] Checking Addon Conflict Database...")
		
		http.Fetch(
			"https://raw.githubusercontent.com/Wolvin-NET/prophuntx/master/AddonsConflicts.json",
			function(body,len,_,code)
				if tonumber(code) < 400 and (body ~= "" and tonumber(len) > 0) then
					print( "[PH:X Integrity Check] Retreiving Database Info and Saving to Local Cache." )
					CachedWSID = ManageData( true, body )
					GetConflictingAddons( CachedWSID )
					return
				end
				
				print( "[PH:X Integrity Check] Couldn't retreive AddonsConflicts file from PH:X Git Repository. Reason: Data is Empty or Unknown Error (HTTP Code: "..tostring(code)..", Size: ".. len ..")" )
				print( "[PH:X Integrity Check] Using Last Known Conflicted Addon IDs Instead..." )
				GetConflictingAddons( CachedWSID )
			end,
			function(err)
				print( "[PH:X Integrity Check] Couldn't retreive AddonsConflicts file info. Reason: " .. err )
				
				print( "[PH:X Integrity Check] Using Last Known Conflicted Addon IDs Instead..." )
				GetConflictingAddons( CachedWSID )
			end
		)
		
		cookie.Set( "phxIntegrityCheck", time + cooldown )
		print("[PH:X Integrity Check] Database Synced. Will use a Local cache instead and will do a recheck on "..os.date("%Y/%m/%d - %H:%M:%S", cookie.GetNumber( "phxIntegrityCheck", 0 )) )
	end

end

hook.Add("InitPostEntity", "PHX.CheckIntegrity", function()
	-- Check Important Variables
	
	if engine.ActiveGamemode() ~= "prop_hunt" then return end
	
	local CachedWSID = ManageData( false )
	
	timer.Simple(1, function()
		-- so this mostly happens if we're on Listen Server with 2 similar addons loaded (mostly from Workshop)
		if (not IS_PHX) then
			Errors = Errors + 1
			table.insert(ErrorList, "PH:X IS NOT Installed!")
		end
		
		if (not PHX) or PHX == nil or (not istable(PHX)) then
			Errors = Errors + 1
			table.insert(ErrorList, "PH:X Core Variable don't exist!")
		end
		
		if (not GAMEMODE.IS_PROPER_PHX_INSTALLED) then
			Errors = Errors + 1
			table.insert(ErrorList, "PH:X Is NOT Properly Installed: Possibly multiple gamemodes are installed!")
		end
		
		if (not file.Exists( engine.ActiveGamemode() .. "/gamemode/enhancedplus/sh_enhancedplus.lua", "LUA" )) then
			Errors = Errors + 1
			table.insert(ErrorList, "An Essential PH:X Core File was not found!")
		end
		
		FETCH_CONFLICT_WSID()
	end)
end)