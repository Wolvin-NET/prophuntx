## A new major updates to Prop Hunt: X has been released.
For now, the Prop Hunt X will change it's version to "X2Z".

## Revision 24.06.2022
---
- Updated Polish Language (by: Pawelxxdd)
- Updated Contributors

## Revision 23.06.2022
---
- Fixes for Last Prop Standing: Blaster weapon
- Fixed Fake Taunt will stop playing if a prop does not exists in the map
- Added 'phx_' map prefix for mapvote settings and main menu map selection
- Changed `mv_mapprefix` to `mv_map_prefix` to update new map's prefix pattern.

## Revision 20.06.2022
---
- Language & String Addition to core files: `vgui_scoreboard.lua, cl_splashscreen.lua, cl_selectscreen.lua, cl_credits.lua` and `sh_httpupdates.lua`
- Updated Language: English, Indonesia, Russian, Spanish (Late)
- Increased Damage for "Grenade Launcher" and "RPG Missile Launcher" for Prop's devil crystal from 50 to 75 Damage Points.
- Fixed "Grenade Frag" Drop for Prop's devil crystal that can now kills hunters when not thrown.
- Added & Changed the way of Derma_Message & Derma_Query into `PHX:MsgBox()` and `PHX:MsgBox_Query` - A quick way to translate using Translations (Internally uses `PHX:QTrans()`)
- Added new Config Directory: `prop_hunt/gamemode/config/external` - You can now place some custom configuration/codes file rather than using autorun folder.  
This will scanned automatically by the gamemode. (Realm: Shared)

## Revision 19.06.2022
---
### Full Changes:

**Features Addition**
- Added new feature: Last Prop Standing
- Added new feature: Prop Decoy
- Added new feature: Fake Taunts

**Changes**
- Prop Decoy: Added HUD for Decoy Placement Indicator
- Added: "Give Grenades on X seconds before Round Ends"
- Added More Features in Lucky Balls
- Improved: Taunts Menu with Pitch Taunt Options
- Taunt Pitch Options: Custom Taunt, Random Taunt, Fake Taunts
- Fixed Bug where Taunts timer are now no longer disoriented with random taunts' timer.  
Now they're independent. Except if you're playing a Custom taunt, the Random taunt will be delayed as well.
- Fixed Major issues on Prop Menu where there is attempt to use non-existing custom models. This commonly caused in case you forget to enable Game Server content.
- Fixed Bug when Props isn't removed when using Pointshop 2. (Missing `inflictor` argument)
- Changed hunters behaviour of obtaining their default weapon on spawn:  
  For now, Hunter will be given after unblind time is over. For Pointshop 1 users using Permanent Weapons, at least Give 3 seconds delay to obtain their permanent weapons to prevent
  strange behaviour where weapons get fired right before blind time has begun.
- Fixed (Workaround) where Listen Server hoster don't receive their Prop Lists in Prop Menu.
- Moved Weapon Background HUD codes that makes it appears only if hunters have any active weapon equipped.
- Improved: "Boundaries/Room Check" to be more accurate. This also will set "1" as default.
- Changed: Changed "`ph_check_props_boundaries`" to "`ph_check_for_rooms`"
- Improved: Fixed & Tweaked Language system (Detailed below)
- **Many Other Fixes and Tweaks.**

### Developer:
- ConVars are now **permanently moved** to `sh_convars.lua`. This includes ConVars in `cl_init.lua` too.
- Optimized CalcView and TraceLine codes packed into single function:  
`GM.ViewCam:CamColEnabled( Vector origin, Angle endpos, table TraceData, string StartPosKey, string EndPosKey, int DistMin, int distNormal, int distMax, int EntityHullZ )`  
`GM.ViewCam:CamColDisabled( (same as above) )`  
`GM.ViewCam:CommonCamCollEnabledView( Vector origin, Angle endpos, int EntityHullZ )` - Use this to get the common Prop's View setting rather than writing down the TraceData over and over.
- Taunt Timer: Added `GetNWInt -> "CTaunts.LastTauntTime"` for custom taunt timeleft.  
We're no longer using Local Clientside Custom Last Taunt Time.
- Fixed (Hack) `DTextEntry` to accept Hex Color string `(#FF0000)`
- Tweaked `PHX:FTranslate()` will now fallback to English translation if Specified Language ID on other language was not found. If the ID also cannot be found in English's Language ID, it will revert to original Language ID text.
- Added `PHX:TranslateName( number idTeam, player Player )` Exclusively used to translate team name.
- Added `PHX:QTrans( any Data )` Quickly translate string using PHX:FTranslate(), only supports string and table (for varargs).
- Fretta Teams are now Translated using `PHX:TranslateName()`. This also replaces on ScoreBoard, Team HUD, and so on.
- (Client Side): Added Language debug test console command:  
`phx_test_translate <text id to translate> <additional param>`  
`phx_test_random_translate <text id to translate> <additional param>`
- Added `util.IsHexColor( str )` - Mainly used for `DTextEntry`
- `pVguiType` Panel Labels will now use String instead of `PHX:Ftranslate` and their default value can now be one of following types: Number, ConVar (string), or `"DEF_VALUE"`. Commonly Used for Plugins.
- Reorganized Hooks Loading Order
- Plugins can now Translate-able
- Improved `PHX:CenterPrint()` - Now it's behave exactly the same as `PrintMessage` but Nicer.
- Fixed Taunt window for Randomized Fake Taunt Pitch settings and changed **Preview** behaviour of `surface.PlaySound` into `LocalPlayer():EmitSound()` instead. This is completely client-sided.
- Added `GLua-SoundDuration` Library by yobson1 ( https://github.com/yobson1/glua-soundduration ) for LPS Background Music.
- Small Improvement of changed the way on how Plugins should be loaded.
- Added `IS_PHX` - A constant to check whether if PHX is installed or not.
- ConVar Types `CTYPE_BOOL, CTYPE_NUMBER, CTYPE_FLOAT, CTYPE_STRING` are now become PHX's global constant.
- ConVar Flag `CVAR_SERVER_ONLY, CVAR_SERVER_ONLY_NO_NOTIFY` are now become PHX's global constant.
- Fixed `SetClientConVar() @-> sh_convar.lua` with `data` table type.

### New Hooks (Realm)
- `PH_OnFakeProp_Killed` (Decoy) (SV) - Args: (empty)
- `PH_BlindTimeOver` (SV) - Args: (empty)
- `PH_RoundEndResult` - Args: ( `int ResultTeamID, string ResultText` )

### Meta Functions
- Fixed `Entity:GetPropSize()`
- Added `Player:SetHealthProp( int )`, `Player:AddHealthProp( int )`
- Added `Player:GetTauntRandMapPropCount()` - Fake Taunt Counter
- Added `Player:HasFakePropEntity()` - Wether the player has Decoy entity or not
- Added `Player:SetFakePropEntity( bool )` - Set if player should have Decoy in their inventory. They only have 1 Decoy.
- Added `Player:PlaceDecoyProp()` - Force player to place decoy. Make sure to set the `SetFakePropEntity(true)` and within Maximum Range of 300 units.
- Added `Player:SendSurfaceSound( str )` - Send sound and play it client sided.
- LPS: Added `Player:IsLastStanding()`
- LPS: Added `Player:GetLPSWeaponEntity()`
- LPS: Added `Player:HasLPSWeapon()`
- LPS: Added `Player:GetLPSWeaponState()`
- LPS: Added `Player:GetLPSWeaponName()`
- LPS: Added `Player:GetLPSAmmo()`
- LPS (Unused): `Player:SetLPSWeaponReloadType( bool )` - used to determine if reload type is custom or not.
- LPS (Unused): `Player:GetLPSWeaponReloadType( bool )` - used to determine if reload type is custom or not.