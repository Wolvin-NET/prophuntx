PHX.Messagedata = nil

local function UPDATE_DO_FETCH()
	local state = false

	http.Fetch(
		GAMEMODE.UPDATEURL,
		function(body,len,head,code)
			if tonumber(code) >= 300 then
				state = false
			elseif (not body) or (body == "") then
				state = false
			else
				PHX:NotifyUpdate(false, body)
				state = true
			end
		end,
		function(err)
			print("[!PH: X Update] Error retreiving update. Reason: " .. err)
		end
	)

	return state;
end

local function NotifyMessage(result)
		print( "~[ Prop Hunt X - Updates Info ]~" )
	
		local version,rev,changelog = result

		if ((not version) or (not rev) or (not changelog)) then
			MsgC(Color(230,20,20), "[!!] Error Retreiving updates info")
			return
		end
		
		MsgC(Color(181,230,30),"[+] Current Version : "..version.."\n")
		MsgC(Color(175,245,15),"[+] Current Revision: "..rev.."\n")
		MsgC(Color(247,211,13),"[!] See ChangeLog   : "..changelog.."\n\n")
end

function PHX:NotifyUpdate(bool, result)
	
	if (!result || result == "") then
		print("[!PH: X Update] Unknown Error while receiving an update.")
		return false,false,false
	end
	
	PHX.VerboseMsg("[*PH: X Update] Incoming update result data, parsing infos...")
	local data = util.JSONToTable(result)
	
	local ver = data.version
	local rev = data.revision
	local log = data.notice

	self.Messagedata = log
	
	local text
	if tonumber(GAMEMODE._VERSION) > ver then
		text = "[!PH: X Update] New version of "..ver.." is available. To update, please procceed to this link: \n --> https://prophunt.wolvindra.net/?go=download \n --> Changelog: "..log
		MsgC(Color(0,160,230), text.."\n")
	elseif string.lower(GAMEMODE.REVISION) != rev then
		text = "[!PH: X Update] New Revision of "..rev.." is available. To update, please procceed with this revision, visit this link: \n --> https://prophunt.wolvindra.net/?go=download&rev="..rev.." \n --> Changelog: "..log
		MsgC(Color(0,160,230), text.."\n")
	elseif tonumber(GAMEMODE._VERSION) == ver && string.lower(GAMEMODE.REVISION) == rev then
		text = "[*PH: X Update] Your gamemode is up to date. (Version "..ver.." - Revision "..string.upper(rev)..")"
		MsgC(Color(0,200,40), text.."\n")
	end
	
	if bool then
		return ver,rev,log
	end
end

local function CheckUpdate()
	PHX.VerboseMsg("[PH: X] - Checking Update Notification... Please Wait!")
	local r = UPDATE_DO_FETCH()
	if (r) then
		PHX.VerboseMsg("[PH: X] Update check success.")
	else
		PHX.VerboseMsg("[PH: X] Update check failed.")
	end
end

concommand.Add("ph_check_update", CheckUpdate , nil, "Force Check Update Prop Hunt: X.")

local cooldown	= 86400
hook.Add("Initialize", "PHX.CheckUpdateInit", function()

	local nextUpdate = cookie.GetNumber("nextUpdate",0)
	local time		 = os.time()
	
	if time < nextUpdate then
		print("[PH: X] - Update has been checked. Will Re-check the update on "..os.date("%Y/%m/%d - %H:%M:%S", nextUpdate))
	else	
		print("[PH: X] - Checking Update...")
		UPDATE_DO_FETCH()
		print("[PH: X] - Retreiving Update Info...")
		cookie.Set("nextUpdate", time + cooldown)
		
		timer.Simple(5, function()
			PHX:CheckUpdate(false)
			print("[PH: X] - Update has been checked. Your next update notice will be displayed on "..os.date("%Y/%m/%d - %H:%M:%S",nextUpdate))
		end)
	end
	
end)