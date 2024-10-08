## A new major updates to Prop Hunt: X has been released.
Note: **Prop Hunt X2Z will SOON change it's versioning from "X2Z" to "25XZ" with unique formatted revision versioning.**  
Example: `VERSION = "25XZ" REVISION = "XZ25.0105A"` where: `XZ25`: X2Z/YY, `0105`: DD/MM, `A`: Quick revisions if occured within same day.

## Revision 01.10.2024 (GitHub Release)
- Update Turkish Language and `Contributors.txt`
- Temporary Fix for Item & Decoy Spawner to respect `ph_enable_decoy_reward` and `ph_enable_team_itemspawner (Serverside Only)` ConVars.
- Fixes for certain official PHX maps that forcing Items to spawn
- At the latest by Revision 03.10.2024: Workshop update

## Revision 31.07.2024
- Quick Minor fix where players cannot use door or any entities where it supposed to. (This was caused by `ph_allow_pickup_object` that was set to 0 or <team number>)
- Removed .sw.vtx and .xbox.vtx for models (as it is not needed on Gmod Today Source Engine standard.)

### 'Proper' Prop Collission
- A propposed feature for proper prop collision will be added in future update. Currently testing any possible way to get this reliable or efficient. See https://github.com/Wolvin-NET/prophuntx/issues/13#issuecomment-2260784230

## Revision 17.07.2024
- Re-enabled back a function where you can use accurate prop's hull rather than rounding them.
- Added ConVar "ph_tmp_accurate_hull" (Enabled by Default) for Accurate Hull - Turn this off if you have a problem such as getting stuck too often
- Changed restriction that you cannot change into a Prop if Prop's max hull X and Y is less than 0.5 units (before: 1.0 units)

### Known Issues
- If you're trying to use a very thin or tiniest prop (by disabling the restriction in the code) you'll likely have some collission problem from Player's Hull with other objects.  
So far, I found that Valve Games are nearly never made a very thin/tiniest prop so this should be safe for 0.5 units restriction. (this probably due to VPhysics Collision rule that the must be 0.5 units thick.)

## Revision 22.05.2024
- Renamed `fretta` base gamemode to `base_phx` to avoid conflicts with other gamemodes.  
If you really wanted to include PHX's fretta base into your multi-fretta-gamemode, simply rename the base_phx and base_phx.txt, and `DeriveGamemode('base_phx')` => `DeriveGamemode('fretta')`@`prop_hunt/gamemode/sh_init.lua`. However, I highly recommend to avoid this to prevent any undesired effects. Use at your own risk!
- Integrity Check: Added checks if `fretta*` bases are present and warn users if they have multiple/alternate Prop Hunt versions are installed. Please [consult to this wiki](https://gmodgameservers.com/wiki/prophuntx/#0_QuickFix/Clients_Error_when_Joining+Clients_Error_when_Joining) or [here](https://github.com/Wolvin-NET/prophuntx/wiki#incompatible-addons) on how to disable other Prop Hunt in order to use Prop Hunt X.
- Integrity Check: Added ConVar `phx_integrity_check_fretta` to ignore checking if `fretta` gamemode folder is present. This is **highly not recommended** as this will cause several problem. Use at your own risk!
- Taunt: Added function to Include/Exclude stock PH:X Taunts provided from the gamemode, meaning you can remove 'Prop Hunt X Originals' and 'Prop Hunt X Classics' category. This will also disable stock Taunt scanner that scanned from `sound/taunt_phx` directory so you have to update your custom taunt folder if it was installed in there! **Also this requires map restart** after toggling this function.
- Taunt Include/Exclude: At least requires any Custom Taunts (LUA or using from Taunt Scanner with different path other than `sound/taunt_phx`)
- Taunt Include/Exclude: When Excluding taunts without any custom taunts installed, the gamemode will use a fallback sound.
- Taunt: Added function to Stop/Overlapping taunt sounds after playing a new Taunts.
- Taunt: Added Taunt Sound Level: Starting from 75dB to 100dB (default is 100dB)
- Added CVar: `ph_include_default_taunt` (1/0, def: 1)
- Added CVar: `ph_taunt_soundlevel` (1=75dB, 2=80dB, 3=85dB, 4=90dB, 5=95dB, 6=100dB, def: 6)
- Added CVar: `ph_overlap_taunt` (1/0, def: 0 = stop)
- Fixed some errors when using search in Taunt window when `Favorite Taunts` category is selected. A warning message will printed the text entry instead.
- Other tweaks for taunt behaviours
- Fixed typo on Ko-Fi Donation Link
- Added Donation Message on first time play

## Revision 19.01.2024
- Fixed Error when using Classic HUD with AutoTaunt enabled (`cl_autotaunt.lua->AutoTauntPaint()`)
- Fixed Error when Trying to Closing Taunt Window too early while Right Click Context Menu is still remain open
- Fixed Error when attempting to create Muzzle Effect for Last Prop Standing "Blaster Gun" Outside from PVS
- Added prevention when prop tries to use Trash Prop (Residual props that was made from PROP Launcher)

## Revision 18.01.2024 (January 2024 Minor Fixes #3)
This update mainly fixes for "Respawn Team-to-Team/Spectator-to-Team on Hunter's Blind Time" as well as other ConVar changes related to Team Balance (`ph_enable_teambalance`) option. **Do note** that you must use Original Classic Team Balance `(ph_team_balance_classic ->renamed-> from ph_originalteambalance)` method if you want to use 1:1 Teams when Team Balance is enabled, or it will use default method to "Team Shuffle/Rotation" (Half Hunter vs Full Props).

Disabling `ph_enable_teambalance` will completely disable team balance and run just like oldest version of Classic Prop Hunt with no Team Balancing.

[Please Read on 'Team Options' wiki](https://github.com/Wolvin-NET/prophuntx/wiki/Team-Options-&-BlindFold-Respawn) for detail about Team Options & Respawn on BlindTime phase.

- [Team Switching on BlindTime] Fixed (for the last time) Weird Behaviour during Team-To-Team / Spectator-to-Team Respawn on BlindTime phase. Now Switching Team-to-Team during blind time while disallowing it will no longer spawn on other team (if this hasn't fixed players will take advantage for being props all time).
- (Request) Renamed `ph_originalteambalance` to `ph_team_balance_classic` and reset their default value to `1`. To Enable Team Shuffle/Rotation, you need to use `ph_team_balance_classic 0` AND `ph_enable_teambalance 1` to use Team Suffle/Rotation (Half Hunters vs Full Props) - See EnhancedPlus Menu for more info.
- Workaround: Fix `ph_force_join_balanced_team` when `ph_enable_teambalance` is `0`, This needs to be updated in future (Currently it's semi working, but still do not use `ph_force_join_balanced_team` when Team Shuffle/Rotation is on otherwise you'll get locked out)
- Removed another small leftover debug messages
- Added Verbose Message when Team Balance has occured (Must use `ph_team_balance_classic == 1`)
- Added Serverside Language Translate:
    - `PHX:SVTranslate( player Ply, string strID, varargs )`: Translate with given ID and varargs. Require `Ply` to retreive `ph_cl_language` ConVar.
    - `PHX:RTranslate( player Ply, string strID )`: Get Random Translated Text with given ID and varargs. Require `Ply` to retreive `ph_cl_language` ConVar.
    - `PHX:BTranslate( function Func, string strID, varargs )`: Translate with given ID and vargs and Broadcast on everyplayer. The language is based on each Player's Language Setting. A function callback is needed to print something on every player that get broadcasted. See example below
        - `function` callbacks:
            - `player Ply` A player entity
            - `txt` The translated result

#### Example of Serverside Language Translate
```lua
    if CLIENT then return end -- obviously, only serverside realm.
	local ply = Entity(1)
	
	-- Print a Single Translated Line
	local Translate = PHX:SVTranslate( ply, "HUD_TEAMWIN", "Someone" )
	ply:ChatPrint( Translate ) -- This will prints ("Someone win!") with their language settings.

	-- Get a Random Translated Line
	local Random = PHX:RTranslate( ply, "SUICIDEMSG" )
	ply:ChatPrint( Random ) --this will prints random Suicide String Messages

	-- Broadcast a single Translated line
	PHX:BTranslate( function( ply, txt ) 
		ply:ChatPrint( txt ) --this will prints the translated message
	end, "CHAT_SWAPBALANCE", "GumbalBoy", "Salad" )
```

#### Team Switching on BlindTime Explanation
It's Important to [Read on 'Team Options' wiki](https://github.com/Wolvin-NET/prophuntx/wiki/Team-Options-&-BlindFold-Respawn#2-team-switchingrespawn-player-on-blindtime-phase) to learn more detail about this features.

## Revision 17.01.2024 (January 2024 Major Update & HotFix #2)
A Major patch mainly for fixes for issues caused by `ph_print_verbose` that sometimes do not exists in client realm, added new weapon, Weapon Manager & Ammo Editor (as Plugin/Addon) and others.
- NEW Plugin (Addon): Prop Hunt: X2Z Weapon Loadout/Ammo Editor (BETA as of 17.01.2024): https://steamcommunity.com/sharedfiles/filedetails/?id=3141486825
- Removed `Verbose Print` option in Prop Hunt Settings Menu, instead client and server have to manually type `phx_verbose 1/0` just like setting `developer 1/0`
- Renamed `ph_print_verbose` to `phx_verbose` to prevent errors when player first time installing PH:X2Z from any previous version of PH: X/Enhanced.
- Renamed `ph_enable_unstuck` to `ph_use_unstuck` and reset to their default values to 0. This mean allowing any server admins to use Unstuck from Addon version instead of built-in (Currently it's pretty buggy)
- Make Verbose Message with Realm Colour, more Informational, Leveled and renamed `[PHX]` prefix with their call origin (example: Taunt Scanner will be `[TauntScanner]`)
- Removed Verbose Message on Bonus Weapon (`wlv_bren`) when detecting weapon base
- Removed test debug print messages
- Edited Contributor Names (Turkish Translator & Recent Donator from 2023)
- Updated FGD and removed `ph_fake_prop` entry
- Added Example VMF and BSP for FGD Demonstration
- FGD: Added `ph_model_bans`, manually adds model bans from the map. Key ranging from `model1` to `model16`
- FGD: Added `ph_decoy_spawner`, use this rather than using `ph_fake_prop`!
- Fixed Typo year revision on Update Description
- Lucky Ball & Devil Crystals Improvement: Moved every item & instances into `gamemodes/sv_items.lua` and keep Entities Scripts clean
- Added Devil Crystal Items: **PROP Launcher**
- Added Hunter Weapon: **Flechette Gun** (Obtained via Lucky Ball)
- Include: Added Half-Life 2: Episode 2's "Flechette" contents, no longer requiring game content to be mounted
- Added Flechette's Kill Icon (only when PH:X2Z mode is loaded)
- Fixed when Updating Banned Prop Models where client can get empty data
- Corrected few weapon HUDs & Killicons
- Added few Language IDs: `KEY_MIDCLICK, (Devil Crystal) LD_MIDCLICK, LD_RIGHTCLICK, LD_PRESS2SHOOT`
- Shorten local variable `LANG -> L` for each Language files to preserve disk space (just like TTT)
- Updated `PH_OnPreRoundStart` hook argument: `number RoundNumber, bool "ph_swap_teams_every_round"`
- Added new function `PHX:SetBlindStatus(bBool)`, `bool = PHX:IsBlindStatus()`, Alias for `"PHX.BlindStatus"` GetGlobals
- Fixed & Improved: Very Strange Behaviour when Allowing Team-to-Team/Spectator-to-Team Respawn during Blind Time
- Hunters: Weapons should normally spawn whenever Team Balance has occured* (see Known Issues)
- Updated Integrity Checker

### Known Issues
- Changing `ph_hunter_blindlock_time` greater than the current value will cause the BlindFold HUD to be appear. **It's better to change this value before the round has started, or better yet use from your `listenserver.cfg` or `server.cfg` file!**
- [Issue #35](https://github.com/Wolvin-NET/prophuntx/issues/35#issuecomment-1894901565) Hunter Weapons may not spawn at certain condition/Team Balance has occured, this has been fixed although you might avoid respawning/switching team too fast.
- [Issue #36](https://github.com/Wolvin-NET/prophuntx/issues/36) : Linux Client 64-bit only (with CEF patch): `ph_prop` Scripted Entity `SetupDataTables` **will not** get called causing prop become static. This may caused internally by the game and still looking forward for workaround.


## Revision 09.01.2024 (January 2024 Hotfix)
These patch are mainly fixes due to December 2023/January 2024 Garry's Mod update.
- HotFix: Fixed Lua Error when suicide occurs on all team due to December 2023/January 2024 patch. This affects to `GAMEMODE:AddDeathNotice` rule changes
- HotFix: Fixed Hunters when respawning too early during blind time will have them longer blindfold time. This is now cut shorter and will be soon released once blindfold time is over
- Fixed typos GetGlobalBool's `BlindStatus -> PHX.BlindStatus`
- Minor Improvements and Changed `MapVote` Global variable into `local MapVote = PHX.MV` table, so that you can use original fretta-like MapVote addon. To make it work you must use `ph_custom_mv_func "MapVote.Start()"` in order to work (or use any Map Votes addon you like)
- Changed ULX Category for Prop Menu & MapVote commands and removed `gamemodes/ulx/modules/sh` directory
- Renamed ConVar `lps_start_random` to `lps_start_random_round` with default value to `0` (Request)
- Changed default value `ph_custom_mv_func` from `MapVote.PHXStart()` to `PHX.StartMapVote()`
- Fixed Prop AutoTaunt HUD would overlap with Hunter's Weapon HUD upon respawn after switching team
- Minor Improvements for Hunter's Weapon Loadout
- Added NEW HOOK: `PH_OnHunterLoadOut` (Arg: `player Ply`): Adds or Overrides Hunter's Weapon Loadout after blindfold is over. Using `return true` will remove default weapon loadout (crowbar, 357 and shotgun). **CAUTION: using `return true` in an addon _Will Also_ overrides other addons too that uses this hook!**
- Added Turkish Language (Submission by: Talha Berkay A. aka Matt, Nova Diablox, Fat Fox Talha)
- Added `/config/maps/ph_lttp_kakariko_b2.lua`: Remove invalid sprite entities to prevent console from spamming
- Removed `cl_targetid.lua` and merged into `cl_init.lua` instead
- Removed uneccessary global variables (e.g. `x` variable inside HUD hook, it should meant to `local x`)
- Deprecated: PHX's eChat will soon replaced/removed on future update. A warning message will appear if you use PHX's eChat feature.

#### Known Issues
- Linux 64-bit only (with CEF patch): Player's Prop Entity (`ph_prop`) `SetupDataTables` **will not** get called and causes prop to stay in place. This may caused internally by the game and still looking forward for workaround.
- ~~December 2023/January 2024 update: Strange weapon tracer behaviour. This would affect to Last Prop Standing weapons with their custom Tracers. This is currently being discussed at [Garry's Mod issue tracker #5684](https://github.com/Facepunch/garrysmod-issues/issues/5684)~~ Fixed!

## Revision 30.01.2023
- HotFix: Fixed Error for calling `PHInLastPropStanding` hook where is `Player` argument returns `nil`. This is **REQUIRED** if you use "AK47 LPS Weapon" addon.
- HotFix: Fixed Error when trying to run `ph_force_end_round` on Dedicated Server console.

## Revision 07.01.2023
This is a quick feature update for Last Prop Standing (**LPS**) and other fixes. A core gamemode hasn't patched yet (this patch was highly requested and therefore you should update your gamemode!)
- LPS will now allow you to Holster Weapon. To toggle holster (hide) LPS weapon, simply just right click on it.
- Holstering Weapon **WILL** also hides Glowing and Trail Effects.
- Added Text HUD to inform player when LPS is active: CLICK for Shoot, MOUSE2 for Holster
- Added LPS Weapon State 'HOLSTERED' to inform the weapon is being holstered. This networked value can be accessed via `Player:GetLPSWeaponState() == LPS_WEAPON_HOLSTER` OR `(boolean) Player:IsLPSHolstered()`
- Added sounds when holstering LPS weapons
- Devil Ball Fix: Fixed RPG, Grenade, and Flachette Launcher Bound Keys when a Player is in Last Prop Standing. A default RIGHT CLICK key will be changed temporarily to MIDDLE CLICK key when LPS is active.
- Updated Underwater Weapons to be more reliable (SMG, AR2, and Shotgun Water for use to any Underwater Maps) 
- Added Weapon Select & Kill Icons for Underwater Weapons (Applies to: SMG, AR2, and Shotgun Water)
- Added `env_embers_controller` helper function for Mappers. Allows you to Turn On/Off this entity.

## Revision 14.09.2022
- Updated French Language (by: GalaxioFr)
- Added ConVar `phx_enable_checker` to enable/disable Addon Conflict Detection (PH:X Integrity Checker). **You need to set this manually by editing your `server.cfg` file!**
- Added Map FGD file: `fgd/prophuntx.fgd` for Hammer Editor
- New Improved entity: `ph_teamitem_spawner` - Spawn Lucky Ball or Devil Crystal in Hammer.
- Prop Decoy (`ph_fake_prop`) entity are now spawnable in Hammer... for fun.
- Fixed missing 'The Bomb!' sound in Lucky Ball events
- Changed & Renamed `MapVote.Start()` into `MapVote.PHXStart()` (Inc. `MapVote.PHXStop()`) to prevent the mapvote being overwritten by other addon.
- All MapVote events (inc. End Round, RTV, ULX MapVote Calls) will now triggered by using `PHX.StartMapVote()`, which will be automatically managed if you're using external addon (a custom ConVar still needed to trigger this, see **MapVote Changes** section below) No need to edit the core file anymore.
- Changed MapVote's Recent Maps File Path from `"mapvotes/recentmaps.txt"` to `"phx_data/mapvote_recentmaps.txt"` in order to prevent being overrided by other Fretta-like MapVote addons.
- Stopping MapVotes will now close the [F1] > [Prop Hunt Menu] Window, if you're calling it from there.
- Fixed MapVote Cooldown. You still need to disable map cooldown if you have only fewer maps (< 10 maps). Set `mv_cooldown 0` to disable this feature.

### MapVote Changes

**These Speciallized MapVotes ConVars & Settings may not be available on [F1] > [Prop Hunt Menu] > [Admin Settings] due to Security Reason.**  
You needs to edit them through your `server.cfg` file!

- Added ConVar: `ph_enable_mapvote` Enable or Disable internal PH:X MapVote system. This will call `PH_OverrideMapVote` hooks if you want to call the Map Votes event to be triggered with your MapVote addon.
- Improved ConVar: `ph_use_custom_mapvote` Use custom external Map votes system (e.g. Addon MapVote). **This will override the built-in PH:X MapVote, even though it's enabled or disabled**
- Added ConVar: `ph_use_custom_mapvote_cmd` Use custom external Map votes by calling from Console Command. **This will override built-in PH:X MapVote (even though it's enabled or disabled) AND 'ph_use_custom_mapvote' ConVar.**
- Improved ConVar: `ph_custom_mv_func` If 'ph_use_custom_mapvote' is set, Use a function to call non-built-in Map Vote system (Example: `AwesomeMapVote:StartVoting()`). Only Works if the Function is on Global Scope. This is Case Sensitive and do not work for Local Functions!
- Added ConVar: `ph_custom_mv_concmd` If 'ph_use_custom_mapvote_cmd' is set, use this to call mapvote by using from their console command. **Overrides `ph_use_custom_mapvote` and `ph_custom_mv_func`**. If it has arguments supply them too (Example: `start_mapvote 15` (*15* means in seconds)).
- Added New Hook: `PH_OverrideMapVote` This will be called only if PH:X MapVote is disabled.

Using `PH_OverrideMapVote` hook to override PH:X MapVote:
```lua
hook.Add("PH_OverrideMapVote", "PH Override MapVote by Addon", function()
	-- Note: You need to set both `ph_use_custom_mapvote` and `ph_use_custom_mapvote_cmd` to 0 to prevent MapVote duplication call. 
	-- Simply just set `ph_enable_mapvote 0` and this hook will be called!

	-- For Example: if we have "Awesome MapVote Addon" installed and there is a function called 'AwesomeMapVote:Start()', then we'll use that.
	AwesomeMapVote:Start()
	-- This way, we'll use AwesomeMapVote's instead of PH:X's MapVote.
end)
```

## Revision 27.08.2022
- Fixed Team Rotation related bug that being unable to join. You need to disable `ph_force_join_balanced_teams` to `0` to join to any Suffled Team/Rotation mode otherwise you won't be able to join to any team.
- Changed `ph_forcejoinbalancedteam` to `ph_force_join_balanced_teams` ConVar to reset this behaviour.
- Added Callbacks to `ph_originalteambalance` to disable `ph_force_join_balanced_teams` when Team Shuffle/Rotation mode is enabled. You have to Re-enable this once the Team Shuffle/Rotation is Turned-off.
- Fixed Enhanced Plus Panels doesn't update immediately after a ConVar changes
- Fixed "LocalPlayer()" becoming NULL when trying to get a "Game Control" notification upon Joining
- Fixed Taunt Menu being disabled after being respawned from Hunter Blind phase
- Removed Debug Message in Serverside LPS Code
- Fixed Map Config file for `ph_kliener_v2` to use a default color instead (No Player color will be allowed if 'kleiner' model is present).
- Added `Entity:SetEntColorEnabled( boolean )`, `Entity:GetEntColorEnabled()` for Prop Entity to force enable or disable of Player Colour function.

**Minor Changes: **
- Fixed Taunt Category being non existence (becoming nil) after switching teams. This will reset to Default Category instead
- Fixed Error for Blaster Muzzle Flash Effect that trying to Display the Effect outside of Player's PVS
- Fixed FCVAR Flags Typo for Unstuck and Team Options on Enhanced Plus settings
- Crosshair, Indicator Icons, Markers, and Glowing Effect will no longer renders to HUD if Proper Round has Ended.
- Prop can no longer replicate to object if Proper Round has Ended. (A Prevention for Very Rare Bug upon team switching occurs)
- Updated "Indonesian" Translation and updated Language Untranslated Text to prevent Errors text from displaying
- Rule & License Update
- Update to Integrity Checker (Addon Conflict Detection)
- Fix on `sh_enhancedprophunt.lua` Error after `Original team balance` has changed.
- Fixed PHX's Hunter Player Spawn entity name in `sh_init.lua`
- Fixed rare bug for Freeze Cam (ClientSide) where trying to use Attacker Entity: `NULL`
- Added new Map Config `ph_motel_blacke_v3`: Added More Player Spawn and fixed stuck issue

## Revision 25.08.2022
- **Fixed where some PH:X Admin-only Console Commands can be *still* accessed without Admin Checks (e.g. OBB Reload, Taunt Reload, etc). This issue existed since PH:E v15~v16 and PH:X before August Update.** However, this issues has been fixed **on August Revision Update (25.08.2022)**.
- `GM:ShowTeam()` and `GM:ShowSplash()` are now moved to Prop Hunt Gamemode Base (Originally from Fretta's base).
- Several non-vanilla Fretta code (which was previously modified in PH:E/X) are now moved to Prop Hunt code base.
- Added Option to disable Splash Screen (https://github.com/Wolvin-NET/prophuntx/issues/23)
- Added Option to Allow use of Restricted Models (banned models). However this does not include from Prohibitted Models. Prohibitted Models are always deleted after round restarts.
- Fixed Error from `sh_config.lua` that trying to removes prohibitted prop in client side realm
- Prop Rotation are no longer using from `GM:Move` hook, instead all everything coded into `ph_prop` scripted entity.
- Added `Pitch` Rotation (`ph_exp_pitch_rot`) - Currently it's experimental and not guaranteed this will be stable on master release.
- Prop Rotation can no longer stayed "Locked" if you changed into a new prop: This behaviour is to prevent Rare position bug on Normal Rotation & Pitch Rotation that rotates in strange angle/position.
- **Deprecated**: `prop_ragdoll` Usable prop types will be dropped or limitted due to Pitch Rotation coding issues. This is due to Engine's Physics limit.
- LPS: Fixed Bug Muzzle Flash effect position acting weird because of Hull Differences
- LPS: Fixed Bug Muzzle Flash Attachment and Fixed their models to correct the attachment's angle. Moved Materials `Blaster` (Guard Gun)
- LPS: Added new LPS Weapons Models.
- LPS: Added New Weapons (`shotgun`, `airboatgun`, `rocket`, `laser` )
- LPS: Tweaked "custom" weapon type to be more reliable.
- LPS: Fixed Weapon Position to be centered
- LPS: Added `"FixPos"` in LPS Struct, this is same as `FixAngles` but for positions
- LPS: Added ConVars for 4 New Weapons.
- LPS Weapons are now Predicted. Meaning that you can still fire your weapon without Server's delay due to latency.
- LPS: Added Trigger Condition whether it should be Randomized, or Retriggered after X numbers of Rounds (e.g: 2, 6, 10, etc...)
- Major Improvements for LPS Plugins
- Fixed Error & Enhanced Hunter's Spectator Line Sight
- Removed `phx_laserbeam` scripted effect. It's Obsolete.
- Added Dummy Weapon Entity: *`weapon_lps`*: This dummy script helps to prevent any issues with Predictions especially for `Player:EmitSound()` issues.
- Restored `Player Color` feature which is now working for both team Hunters and Props.
- More Tweaks & Enhancement in `cl_init.lua`
- Added **Cancel MapVote** when MapVote UI appears. **Only available for Admins**.
- Added New Global State: `BlindStatus` (boolean)
- Added new console command: `ph_force_end_round` : Force End the current active round.
- Fixed Class for Hunter: Weapon should not be duplicated if Force End Round is triggered
- Fixed and Tweaked more things for Hunter Class
- Fixed and Tweaked more things for Prop Class
- [QoL] Enhanced Taunt Menu: Scroll Position, Category Selection, etc (Contribution: Darktooth)
- [QoL] Enhanced Prop Menu: Scroll Position (Contribution: Darktooth)
- [QoL] Added Taunt Favorites Features (Contribution: Darktooth)
- [QoL] Added Menu Bar for Taunt Menu exclusively used for Saving/Reloading Taunt Favorites
- [Taunts] Merged Serverside Auto Taunt and Custom Taunt into single instance
- [Taunts] Added `PHX:PlayTaunt( player, bRandom/"Path", bIsClientPitchEnabled, intPitchLevel, bIsRandomEnabled, strLastTauntTimeID )`
- [Taunts] Fixed Taunt Scanner, Taunt Addition/Manager, Taunt Cache that will no longer include any duplicated taunts that causes "File not Exists" on serverside.
- [Taunts] Fixed Taunt Refresh/Reload. Still, use this at your own risk during LUA Refresh.
- [Taunts] Taunt can be added to Existing Category, but duplications will not be added.
- [Taunts] Several taunts category are now moved and seperated: Classic Taunts will be listed as "PH:X Classic" and new PH:X taunts are now moved to "Default Taunt Scanner" directory.
- [Taunts] Custom Taunt will now have Extra "Taunt Name" Checks beside only their path. These 2 requirement is now mandatory.
- [Taunts] Added `ply:SetLastTauntTime( strID, int )` and `ply:GetLastTauntTime( strID, bUseNet )`
- Loaded Plugins are now verbosely printed on each state realm.
- Moved `ph_hotel` and `ph_kliener` map configs under `/config/maps/` folder.
- **Removed** template file for `sh_additional_taunts.lua` - this file should be created externally.
- Fixed Prop Camera Collission Trace by using HullTrace instead of TraceLine.
- Added Hunter Thirdperson mode: Can be Clientsided, or Desired from Server side setting.
- Hunter will have an additional crosshair: This is intentional for switching into third person mode to use actual 3D Spatial Aiming.
- Changed Brightness & Height for Prop's Dynamic Light (Flashlight) by adding 8 units tall.
- Fixed Language, Prop menu and Plugin Listing that can be reloaded after Lua Refresh. Still though, you need a proper map restart to avoid weird errors or behaviours.
- Updated "Control Hints" Notification to be more informative. You might need to set `ph_show_tutor_control` to 1.
- [Require ULX] Added `util.IsStaff( player )` and `ply:PHXIsStaff()`. `util.IsStaff` is used only for serverside (useful to check if `ply` is dedicated).
- [Require ULX] Changed table structure for `PHX.SVAdmins` and `PHX.IgnoreMutedUserGroup`, you can now change them under "Group & Access Settings"
- [Require ULX] Added New Menu: "Group & Access Settings" for 'Admin Settings' and "Mute-able Groups".
- Added New Menu: Enhanced Plus Settings
- Added & Enhanced Unstuck from Enhanced Plus (Contribution by: Antoine)
- Added & Enhanced Team Rotation Option and few other features from Enhanced Plus (Contribution by: Antoine)
- [pVgui] Fixed Several pVgui Menu Types and making them to be more neater. 
- [pVgui] Added New pVgui Type: `combobox`
- [pVgui] Rearranged Slider and now added with labels 
- [pVgui] Some panels will now have their labels to show their text labels.
- Fixed **Player Model Browser** menu will now refresh immediately after a ConVar `ph_use_custom_plmodel` has changed.
- Fixed & Tweaked Gammeode `init.lua` file.
- **Removed**: Duck Hull is no longer required. However, you can still crouch on first spawn as Kleiner model, but after props replication it will now respect to their height, which means you need a smaller object to get fit in to the vents.
- Since duck hull is no longer needed, Added New ConVar `ph_prop_must_stand` (0/1) to toggle allow replication when crouching, jumping, or while in air.
- Added ConVar for Prop Viewoffset Height (Z) Multiplier: `ph_prop_viewoffset_mult` - Increase or Decrease the Prop's Eye View. This however doesn't effect on first time spawn. Only affected after you replicate to any objects.
- Changed & Tweaked CalcView for Collission-Enabled Camera for Props & Hunters.
- Added Static Notification to Inform spectator to Assign a team to play. To disable this notification, use `ph_spect_inform_join_team` and set to `0`.
- Added Hook: `PH_AddColumnScoreboard` (Client): Add New Column to the scoreboard. Arguments are: `ScoreBoard (Reference Panel), ScoreBoardCustomFunc ( Callbacks )`, callbacks parameters: `Name, intFixedWidth, Func, UpdateRate, TeamID, HeaderAlign, ValueAlign, Font`
- Added & PH:X Integrity & Addon Conflict Checker to avoid multiple-gamemode-installed conflicts. User found installing multiple gamemodes/incompatible addons will brings to a notification window.
- Gamemode is no longer support Single-Player Mode Due to Prediction code that don't exist in single player making it is useless to be played in Singleplayer.  
If you really are wanted to use for testing (e.g. Testing Map) use this on your console instead: `sv_lan 1; maxplayers <num>; gamemode prop_hunt; map <map>`, use sv_lan 1 to avoid other players to join to your server, or in Offline/`-multirun` Mode.
- Many more fixes that may be unmentioned. (See Commit Changes for Details)

**What to Add:**
- [In Future] Add Level System
- [In Future] Add Map Prop Edit (Add/Remove props)
- [In Future] Add Taunt URL
- [In Future] Add Flachette for LPS
- [In Future] Lucky & Devil ball optimization
- [In Future] Change Team Selection Appearance

## Revision 25.06.2022
- Changed default ConVar for `ph_custom_taunt_mode` from `0` to `2`.
- Added "Very First Tutorial" for Introducing New X2Z Features. They'll only show once upon joining by prompting the user first.  
  Additionally, this will automatically set `ph_cl_show_first_tutorial` to `0` after the user read the tutorial window.
- Added Last Prop Standing's Weapon to be Visible or Not. Added ConVar `lps_show_weapon` to be set `1` as default.
- Updated Contributors

## Revision 24.06.2022
- Updated Polish Language (by: Pawelxxdd)
- Updated Contributors

## Revision 23.06.2022
- Fixes for Last Prop Standing: Blaster weapon
- Fixed Fake Taunt will stop playing if a prop does not exists in the map
- Added 'phx_' map prefix for mapvote settings and main menu map selection
- Changed `mv_mapprefix` to `mv_map_prefix` to update new map's prefix pattern.

## Revision 20.06.2022
- Language & String Addition to core files: `vgui_scoreboard.lua, cl_splashscreen.lua, cl_selectscreen.lua, cl_credits.lua` and `sh_httpupdates.lua`
- Updated Language: English, Indonesia, Russian, Spanish (Late)
- Increased Damage for "Grenade Launcher" and "RPG Missile Launcher" for Prop's devil crystal from 50 to 75 Damage Points.
- Fixed "Grenade Frag" Drop for Prop's devil crystal that can now kills hunters when not thrown.
- Added & Changed the way of Derma_Message & Derma_Query into `PHX:MsgBox()` and `PHX:MsgBox_Query` - A quick way to translate using Translations (Internally uses `PHX:QTrans()`)
- Added new Config Directory: `prop_hunt/gamemode/config/external` - You can now place some custom configuration/codes file rather than using autorun folder.  
This will scanned automatically by the gamemode. (Realm: Shared)

## Revision 19.06.2022
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