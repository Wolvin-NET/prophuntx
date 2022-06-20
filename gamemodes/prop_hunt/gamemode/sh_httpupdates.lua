PHX.Messagedata = {}

local function UPDATE_DO_FETCH_BACKUP()
	
	print( "[!PH:X Update] Retrying with backup update... " )
	
	http.Fetch(
		GAMEMODE.UPDATEURLBACKUP,
		function(body,len,_,code)
			if code < 400 and (body ~= "" and tonumber(len) > 0) then
				PHX:NotifyUpdate( body )
				return
			end
			
			print( "[!PH:X Update] Error retreiving backup update info. Reason: Data is Empty or Unknown Error. (HTTP Code: "..tostring(code)..", Size: ".. len )
		end,
		function(err)
			print("[!PH:X Update] Error retreiving backup update info. Reason: " .. err)
		end
	)
	
end

local function UPDATE_DO_FETCH()

	http.Fetch(
		GAMEMODE.UPDATEURL,
		function(body,len,_,code)
			if tonumber(code) < 400 and (body ~= "" and tonumber(len) > 0) then
				PHX:NotifyUpdate( body )
				return
			end
			
			print( "[!PH:X Update] Error retreiving update info. Reason: Data is Empty or Unknown Error. (HTTP Code: "..tostring(code)..", Size: ".. len )
			UPDATE_DO_FETCH_BACKUP()
		end,
		function(err)
			print("[!PH:X Update] Error retreiving update info. Reason: " .. err)
			UPDATE_DO_FETCH_BACKUP()
		end
	)

end

function PHX:PrintUpdateConsole()
	MsgC( color_white, "[ Prop Hunt X - Update Info ]\n" )
	
	if (!self.Messagedata) then
		MsgC(Color(230,20,20), "[!!] Error: Update message data is empty")
		return
	end
	
	if (!self.Messagedata.version or !self.Messagedata.revision or !self.Messagedata.url) then
		MsgC(Color(230,20,20), "[!!] Error Retreiving updates info - some update elements are missing.")
		return
	end
	
	MsgC(Color(181,230, 30), "[+] Current Version : "..self.Messagedata.version.."\n")
	MsgC(Color(175,245, 15), "[+] Current Revision: "..self.Messagedata.revision.."\n")
	MsgC(Color(247,211, 13), "[!] See ChangeLog   : "..self.Messagedata.url.."\n")
	MsgC(Color(220,220,220), "[*] Full Description update: \n" .. self.Messagedata.info .. "\n")
end

function PHX:NotifyUpdate(result)
	
	if (!result or result == "") then
		print("[!PH:X Update] Warning: Data contains nothing!")
		return false,false,false
	end
	
	self.VerboseMsg("[*PH: X Update] Incoming update result data, parsing infos...")
	local data = util.JSONToTable(result)
	
	if !data or data == nil then
		print("[!PH:X Update] Error: Unable to parse update info, aborting!")
		return false,false,false
	end
	
	local ver = data.version
	local rev = data.revision
	local url = data.url
	local log = data.notice

	PHX.Messagedata = {
		version 	= ver,
		revision 	= rev,
		url			= url,
		info		= log
	}
	
	-- write to /data instead. CLIENT SIDE ONLY.
	if CLIENT then
		file.Write(PHX.ConfigPath .. "/phx_update_info.txt", result)
	end
	
	local text
	local color = Color(0,160,230)
	local isNew = false
	if GAMEMODE._VERSION ~= ver then
		text = "[!PH: X Update] New version of "..ver.." is available."
		isNew = true
	elseif GAMEMODE.REVISION ~= rev then
		text = "[!PH: X Update] New Revision of "..rev.." is available."
		isNew = true
	elseif GAMEMODE._VERSION == ver && GAMEMODE.REVISION == rev then
		text = "[*PH: X Update] Your gamemode is up to date."
		color = Color(0,200,40)
	end
	
	MsgC(color, text .. "\n")
	
	if isNew then
		self:PrintUpdateConsole()
	end
end

function PHX:CheckUpdate()
	PHX.VerboseMsg("[PHX] - Checking Update Notification... Please Wait!")
	UPDATE_DO_FETCH()
end

concommand.Add("ph_check_update", function() PHX:CheckUpdate() end , nil, "Force Check Update Prop Hunt: X.")

local cooldown	= 86400
hook.Add("Initialize", "PHX.CheckUpdateInit", function()

timer.Simple(3, function()
	local nextUpdate = cookie.GetNumber("phxNextUpdateInfo",0)
	local time		 = os.time()
	
	if time < nextUpdate then
		print("[PHX] Skipping update check. Will recheck on "..os.date("%Y/%m/%d - %H:%M:%S", nextUpdate))
	else	
		print("[PHX] Checking Update...")
		PHX:CheckUpdate()
		cookie.Set("phxNextUpdateInfo", time + cooldown)
		print("[PHX] Update has been checked. Your next update notice will be displayed on "..os.date("%Y/%m/%d - %H:%M:%S", cookie.GetNumber("phxNextUpdateInfo",0)) )
	end
end)
	
end)

if CLIENT then
	local w = {}
	
	function PHX:notifyUser()
		local data = {}
	
		if (file.Exists(PHX.ConfigPath .. "/phx_update_info.txt", "DATA")) then
			local json = file.Read(PHX.ConfigPath .. "/phx_update_info.txt", "DATA")
			data = util.JSONToTable(json)
		else
			PHX:MsgBox("UPDATE_NOTIFY_MSG_NOTFOUND", "UPDATE_NOTIFY_MSG_TITLE", "MISC_OK")
			return
		end
	
		w.frame = vgui.Create("DFrame")
		w.frame:SetTitle( PHX:FTranslate("UPDATE_NOTIFY_WINDOW_TITLE") )
		w.frame:SetSize(640, ScrH() * 0.75)
		w.frame:Center()
		
		w.richtext = vgui.Create("RichText", w.frame)
		w.richtext:Dock(FILL)
		w.richtext:DockMargin(4,8,4,8)
		w.richtext:InsertColorChange(255,205, 50,255)
		w.richtext:AppendText(data.notice)
		function w.richtext:PerformLayout()
			self:SetFontInternal("PHX.TopBarFont")
		end
		w.richtext:InsertColorChange(220,220,220,255)
		w.richtext:AppendText( PHX:FTranslate( "UPDATE_RTBOX_APPEND", GAMEMODE._VERSION, GAMEMODE.REVISION ) )
		
		w.button = vgui.Create("DButton", w.frame)
		w.button:Dock(BOTTOM)
		w.button:DockMargin(4,8,4,8)
		w.button:SetSize(0,48)
		w.button:SetText( PHX:FTranslate( "UPDATE_BTN_SEEFULL" ) )
		function w.button:DoClick()
			gui.OpenURL(data.url)
		end
		
		w.frame:MakePopup()
	end
	
end