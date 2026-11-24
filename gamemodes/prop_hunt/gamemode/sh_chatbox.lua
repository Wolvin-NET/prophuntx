-- Due to new PHX's HUD rules, you may replace the default HUD with this shipped eChat to prevent HUD position overlap.
-- You might require map restart to re-enable this feature. If you have new own chatbox system, you don't need to enable this feature.

----// eChat //----
-- Author: Exho (obviously), Tomelyr, LuaTenshi
-- Version: 4/12/15

if SERVER then
	AddCSLuaFile()
	return
end

PHX.eChat = {}

local eChat = PHX.eChat
print("[PHX] !!Warning: Custom PH:X Chat (eChat) will be deprecated soon!")

eChat.config = {
	timeStamps = true,
	position = 1,	
	fadeTime = 12,
}

--// Prevents errors if the script runs too early, which it will
if not GAMEMODE then
	hook.Remove("Initialize", "echat_init")
	hook.Add("Initialize", "echat_init", function()
		if PHX:QCVar("ph_use_new_chat") then
			print("[PHX] !!Warning: Custom PH:X Chat (eChat) will be deprecated soon!")
			include(engine.ActiveGamemode() .. "/gamemode/sh_chatbox.lua")
			PHX.eChat.buildBox()
		end
	end)
	return
end

--// Builds the chatbox but doesn't display it
function eChat.buildBox()
	eChat.frame = vgui.Create("DFrame")
	eChat.frame:SetSize( ScrW()*0.375, ScrH()*0.25 )
	eChat.frame:SetTitle("")
	eChat.frame:ShowCloseButton( false )
	eChat.frame:SetDraggable( true )
	eChat.frame:SetSizable( true )
	eChat.frame:SetPos( ScrW()*0.0116, (ScrH() - eChat.frame:GetTall()) - ScrH()*0.177 - PHX:GetCVar( "ph_new_chat_pos_sub" ))
	eChat.frame:SetMinWidth( 300 )
	eChat.frame:SetMinHeight( 100 )
	eChat.frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		
		draw.RoundedBox( 0, 0, 0, w, 25, Color( 80, 80, 80, 100 ) )
	end
	eChat.oldPaint = eChat.frame.Paint
	eChat.frame.Think = function()
		if input.IsKeyDown( KEY_ESCAPE ) then
			eChat.hideBox()
		end
	end
	
	local serverName = vgui.Create("DLabel", eChat.frame)
	serverName:SetText( GetHostName() )
	serverName:SetFont( "eChat_18")
	serverName:SizeToContents()
	serverName:SetPos( 5, 4 )
	
	local settings = vgui.Create("DButton", eChat.frame)
	settings:SetText("Settings")
	settings:SetFont( "eChat_18")
	settings:SetTextColor( Color( 230, 230, 230, 150 ) )
	settings:SetSize( 70, 25 )
	settings:SetPos( eChat.frame:GetWide() - settings:GetWide(), 0 )
	settings.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 200 ) )
	end
	settings.DoClick = function( self )
		eChat.openSettings()
	end
	
	eChat.entry = vgui.Create("DTextEntry", eChat.frame) 
	eChat.entry:SetSize( eChat.frame:GetWide() - 50, 20 )
	eChat.entry:SetTextColor( color_white )
	eChat.entry:SetFont("eChat_18")
	eChat.entry:SetDrawBorder( false )
	eChat.entry:SetDrawBackground( false )
	eChat.entry:SetCursorColor( color_white )
	eChat.entry:SetHighlightColor( Color(52, 152, 219) )
	eChat.entry:SetPos( 45, eChat.frame:GetTall() - eChat.entry:GetTall() - 5 )
	eChat.entry.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 100 ) )
		derma.SkinHook( "Paint", "TextEntry", self, w, h )
	end

	eChat.entry.OnTextChanged = function( self )
		if self and self.GetText then 
			gamemode.Call( "ChatTextChanged", self:GetText() or "" )
		end
	end

	eChat.entry.OnKeyCodeTyped = function( self, code )
		local types = {"", "teamchat", "console"}

		if code == KEY_ESCAPE then

			eChat.hideBox()
			gui.HideGameUI()

		elseif code == KEY_TAB then
			
			eChat.TypeSelector = (eChat.TypeSelector and eChat.TypeSelector + 1) or 1
			
			if eChat.TypeSelector > 3 then eChat.TypeSelector = 1 end
			if eChat.TypeSelector < 1 then eChat.TypeSelector = 3 end
			
			eChat.ChatType = types[eChat.TypeSelector]

			timer.Simple(0.001, function() eChat.entry:RequestFocus() end)

		elseif code == KEY_ENTER then
			-- Replicate the client pressing enter
			
			if string.Trim( self:GetText() ) != "" then
				if eChat.ChatType == types[2] then
					LocalPlayer():ConCommand("say_team \"" .. (self:GetText() or "") .. "\"")
				elseif eChat.ChatType == types[3] then
					LocalPlayer():ConCommand(self:GetText() or "")
				else
					LocalPlayer():ConCommand("say \"" .. self:GetText() .. "\"")
				end
			end

			eChat.TypeSelector = 1
			eChat.hideBox()
		end
	end

	eChat.chatLog = vgui.Create("RichText", eChat.frame) 
	eChat.chatLog:SetSize( eChat.frame:GetWide() - 10, eChat.frame:GetTall() - 60 )
	eChat.chatLog:SetPos( 5, 30 )
	eChat.chatLog.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 100 ) )
	end
	eChat.chatLog.Think = function( self )
		if eChat.lastMessage then
			if CurTime() - eChat.lastMessage > eChat.config.fadeTime then
				self:SetVisible( false )
			else
				self:SetVisible( true )
			end
		end
		self:SetSize( eChat.frame:GetWide() - 10, eChat.frame:GetTall() - eChat.entry:GetTall() - serverName:GetTall() - 20 )
		settings:SetPos( eChat.frame:GetWide() - settings:GetWide(), 0 )
	end
	eChat.chatLog.PerformLayout = function( self )
		self:SetFontInternal("eChat_18")
		self:SetFGColor( color_white )
	end
	eChat.oldPaint2 = eChat.chatLog.Paint
	
	local text = "Say :"

	local say = vgui.Create("DLabel", eChat.frame)
	say:SetText("")
	surface.SetFont( "eChat_18")
	local w, h = surface.GetTextSize( text )
	say:SetSize( w + 5, 20 )
	say:SetPos( 5, eChat.frame:GetTall() - eChat.entry:GetTall() - 5 )
	
	say.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 100 ) )
		draw.DrawText( text, "eChat_18", 2, 1, color_white )
	end

	say.Think = function( self )
		local types = {"", "teamchat", "console"}
		local s = {}

		if eChat.ChatType == types[2] then 
			text = "Say (TEAM) :"	
		elseif eChat.ChatType == types[3] then
			text = "Console :"
		else
			text = "Say :"
			s.pw = 45
			s.sw = eChat.frame:GetWide() - 50
		end

		if s then
			if not s.pw then s.pw = self:GetWide() + 10 end
			if not s.sw then s.sw = eChat.frame:GetWide() - self:GetWide() - 15 end
		end

		local w, h = surface.GetTextSize( text )
		self:SetSize( w + 5, 20 )
		self:SetPos( 5, eChat.frame:GetTall() - eChat.entry:GetTall() - 5 )

		eChat.entry:SetSize( s.sw, 20 )
		eChat.entry:SetPos( s.pw, eChat.frame:GetTall() - eChat.entry:GetTall() - 5 )
	end	
	
	eChat.hideBox()
end

--// Hides the chat box but not the messages
function eChat.hideBox()
	eChat.frame.Paint = function() end
	eChat.chatLog.Paint = function() end
	
	eChat.chatLog:SetVerticalScrollbarEnabled( false )
	eChat.chatLog:GotoTextEnd()
	
	eChat.lastMessage = eChat.lastMessage or CurTime() - eChat.config.fadeTime
	
	-- Hide the chatbox except the log
	local children = eChat.frame:GetChildren()
	for _, pnl in pairs( children ) do
		if pnl == eChat.frame.btnMaxim or pnl == eChat.frame.btnClose or pnl == eChat.frame.btnMinim then continue end
		
		if pnl != eChat.chatLog then
			pnl:SetVisible( false )
		end
	end
	
	-- Give the player control again
	eChat.frame:SetMouseInputEnabled( false )
	eChat.frame:SetKeyboardInputEnabled( false )
	gui.EnableScreenClicker( false )
	
	-- We are done chatting
	gamemode.Call("FinishChat")
	
	-- Clear the text entry
	eChat.entry:SetText( "" )
	gamemode.Call( "ChatTextChanged", "" )
end

--// Shows the chat box
function eChat.showBox()
	-- Draw the chat box again
	eChat.frame.Paint = eChat.oldPaint
	eChat.chatLog.Paint = eChat.oldPaint2
	
	eChat.chatLog:SetVerticalScrollbarEnabled( true )
	eChat.lastMessage = nil
	
	-- Show any hidden children
	local children = eChat.frame:GetChildren()
	for _, pnl in pairs( children ) do
		if pnl == eChat.frame.btnMaxim or pnl == eChat.frame.btnClose or pnl == eChat.frame.btnMinim then continue end
		
		pnl:SetVisible( true )
	end
	
	-- MakePopup calls the input functions so we don't need to call those
	eChat.frame:MakePopup()
	eChat.entry:RequestFocus()
	
	-- Make sure other addons know we are chatting
	gamemode.Call("StartChat")
end

--// Opens the settings panel
function eChat.openSettings()
	eChat.hideBox()
	
	eChat.frameS = vgui.Create("DFrame")
	eChat.frameS:SetSize( 400, 300 )
	eChat.frameS:SetTitle("")
	eChat.frameS:MakePopup()
	eChat.frameS:SetPos( ScrW()/2 - eChat.frameS:GetWide()/2, ScrH()/2 - eChat.frameS:GetTall()/2 )
	eChat.frameS:ShowCloseButton( true )
	eChat.frameS.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		
		draw.RoundedBox( 0, 0, 0, w, 25, Color( 80, 80, 80, 100 ) )
		
		draw.RoundedBox( 0, 0, 25, w, 25, Color( 50, 50, 50, 50 ) )
	end
	
	local serverName = vgui.Create("DLabel", eChat.frameS)
	serverName:SetText( "eChat - Settings" )
	serverName:SetFont( "eChat_18")
	serverName:SizeToContents()
	serverName:SetPos( 5, 4 )
	
	local label1 = vgui.Create("DLabel", eChat.frameS)
	label1:SetText( "Time stamps: " )
	label1:SetFont( "eChat_18")
	label1:SizeToContents()
	label1:SetPos( 10, 40 )
	
	local checkbox1 = vgui.Create("DCheckBox", eChat.frameS ) 
	checkbox1:SetPos(label1:GetWide() + 15, 42)
	checkbox1:SetValue( eChat.config.timeStamps )
	
	local label2 = vgui.Create("DLabel", eChat.frameS)
	label2:SetText( "Fade time: " )
	label2:SetFont( "eChat_18")
	label2:SizeToContents()
	label2:SetPos( 10, 70 )
	
	local textEntry = vgui.Create("DTextEntry", eChat.frameS) 
	textEntry:SetSize( 50, 20 )
	textEntry:SetPos( label2:GetWide() + 15, 70 )
	textEntry:SetText( eChat.config.fadeTime ) 
	textEntry:SetTextColor( color_white )
	textEntry:SetFont("eChat_18")
	textEntry:SetDrawBorder( false )
	textEntry:SetDrawBackground( false )
	textEntry:SetCursorColor( color_white )
	textEntry:SetHighlightColor( Color(52, 152, 219) )
	textEntry.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 100 ) )
		derma.SkinHook( "Paint", "TextEntry", self, w, h )
	end
	
	--[[local checkbox2 = vgui.Create("DCheckBox", eChat.frameS ) 
	checkbox2:SetPos(label2:GetWide() + 15, 72)
	checkbox2:SetValue( eChat.config.seeChatTags )
	
	local label3 = vgui.Create("DLabel", eChat.frameS)
	label3:SetText( "Use chat tags: " )
	label3:SetFont( "eChat_18")
	label3:SizeToContents()
	label3:SetPos( 10, 100 )
	
	local checkbox3 = vgui.Create("DCheckBox", eChat.frameS ) 
	checkbox3:SetPos(label3:GetWide() + 15, 102)
	checkbox3:SetValue( eChat.config.useChatTag )]]
	
	local save = vgui.Create("DButton", eChat.frameS)
	save:SetText("Save")
	save:SetFont( "eChat_18")
	save:SetTextColor( Color( 230, 230, 230, 150 ) )
	save:SetSize( 70, 25 )
	save:SetPos( eChat.frameS:GetWide()/2 - save:GetWide()/2, eChat.frameS:GetTall() - save:GetTall() - 10)
	save.Paint = function( self, w, h )
		if self:IsDown() then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 80, 80, 80, 200 ) )
		else
			draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 200 ) )
		end
	end
	save.DoClick = function( self )
		eChat.frameS:Close()
		
		eChat.config.timeStamps = checkbox1:GetChecked() 
		eChat.config.fadeTime = tonumber(textEntry:GetText()) or eChat.config.fadeTime
	end
end

local oldAddText = chat.AddText

--// Overwrite chat.AddText to detour it into my chatbox
function chat.AddText(...)
	if not eChat.chatLog then
		eChat.buildBox()
	end
	
	local msg = {}
	
	-- Iterate through the strings and colors
	for _, obj in pairs( {...} ) do
		if type(obj) == "table" then
			eChat.chatLog:InsertColorChange( obj.r, obj.g, obj.b, obj.a )
			table.insert( msg, Color(obj.r, obj.g, obj.b, obj.a) )
		elseif type(obj) == "string"  then
			eChat.chatLog:AppendText( obj )
			table.insert( msg, obj )
		elseif obj:IsPlayer() then
			local ply = obj
			
			if eChat.config.timeStamps then
				eChat.chatLog:InsertColorChange( 130, 130, 130, 255 )
				eChat.chatLog:AppendText( "["..os.date("%X").."] ")
			end
			
			if eChat.config.seeChatTags and ply:GetNWBool("eChat_tagEnabled", false) then
				local col = ply:GetNWString("eChat_tagCol", "255 255 255")
				local tbl = string.Explode(" ", col )
				eChat.chatLog:InsertColorChange( tbl[1], tbl[2], tbl[3], 255 )
				eChat.chatLog:AppendText( "["..ply:GetNWString("eChat_tag", "N/A").."] ")
			end
			
			local col = GAMEMODE:GetTeamColor( obj )
			eChat.chatLog:InsertColorChange( col.r, col.g, col.b, 255 )
			eChat.chatLog:AppendText( obj:Nick() )
			table.insert( msg, obj:Nick() )
		end
	end
	eChat.chatLog:AppendText("\n")
	
	eChat.chatLog:SetVisible( true )
	eChat.lastMessage = CurTime()
	eChat.chatLog:InsertColorChange( 255, 255, 255, 255 )
--	oldAddText(unpack(msg))
end

--// Write any server notifications
hook.Remove( "ChatText", "echat_joinleave")
hook.Add( "ChatText", "echat_joinleave", function( index, name, text, type )
	if not eChat.chatLog then
		eChat.buildBox()
	end
	
	if type != "chat" then
		eChat.chatLog:InsertColorChange( 0, 128, 255, 255 )
		eChat.chatLog:AppendText( text.."\n" )
		eChat.chatLog:SetVisible( true )
		eChat.lastMessage = CurTime()
		return true
	end
end)

--// Stops the default chat box from being opened
hook.Remove("PlayerBindPress", "echat_hijackbind")
hook.Add("PlayerBindPress", "echat_hijackbind", function(ply, bind, pressed)
	if string.sub( bind, 1, 11 ) == "messagemode" then
		if bind == "messagemode2" then 
			eChat.ChatType = "teamchat"
		else
			eChat.ChatType = ""
		end
		
		if IsValid( eChat.frame ) then
			eChat.showBox()
		else
			eChat.buildBox()
			eChat.showBox()
		end
		return true
	end
end)

--// Hide the default chat too in case that pops up
hook.Remove("HUDShouldDraw", "echat_hidedefault")
hook.Add("HUDShouldDraw", "echat_hidedefault", function( name )
	if name == "CHudChat" then
		return false
	end
end)

 --// Modify the Chatbox for align.
local oldGetChatBoxPos = chat.GetChatBoxPos
function chat.GetChatBoxPos()
	return eChat.frame:GetPos()
end

function chat.GetChatBoxSize()
	return eChat.frame:GetSize()
end

chat.Open = eChat.showBox
function chat.Close(...) 
	if IsValid( eChat.frame ) then 
		eChat.hideBox(...)
	else
		eChat.buildBox()
		eChat.showBox()
	end
end