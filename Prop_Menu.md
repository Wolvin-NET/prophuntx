# Quick Guide of Prop Hunt X Menu

## Accessing Prop Hunt: Menu

1. Press [F1] button on your keyboard
2. Click "[Prop Hunt Menu]" button
3. The Prop Hunt Settings & Menu appeared.

![How to Access Prop Hunt Menu](/assets/how_to_open.jpg)

## The "Prop Hunt X Settings & Menu"

There are few menus in **Prop Hunt X Settings & Menu** window:

[ Donation Menu ]   
This menu contains information about donation.

[ Help & Guide ]   
Contains tutorial on how to play Prop Hunt: X2Z

[ Player Muting ]   
Controls player voice mute by toggling them.

[ Player Settings ]   
General player settings, contains: HUD settings, Key Binding, Languages, etc.

[ Model Browser ]   
Player Custom Skin browser. Note: you must set "Enable custom models for Hunters" under Admin Settings

[ Admin Settings ]   
General Admin settings for Prop Hunt: X. This is where all server related settings that can be configured.

[ MapVote ]   
MapVote system configuration

[ About PH:X ]   
Shows information about Prop Hunt X Versions, Contributors, etc.

[ Addons/Plugins ]   
Addons or Plugins that loaded to Prop Hunt: X. There are Server and Client sided settings for each plugins to configure.

### 1. Help & Guide

![Help & Guide Section](/assets/1_help_menu.jpg)

Help window was intended to show the player a tutorial on how to play Prop Hunt X2Z and introduces it's features. It also provides
an additional button for showing Server's ULX Motd and Rules.

### 2. Player Settings

![Help & Guide Section](/assets/2_player_settings.jpg)

#### Language and Key Bindings

- **Language**  
Here you can select your prefered language to use. Default is English.  
Some server will force their language to their prefered language, therefore this option may not be available.
- **Key Binding**  
Here you can assign and change the Prop Hunt X2Z Default keybindings to your liking.

#### Player Options
Here you can control your gameplay experience such as changing the HUD behaviour, colours, etc.

- Toggle Halo effect when choosing a prop  
Toggle Glowing effect when aiming to a prop. Helpful to focus which props that you want to replicate.
- Show Team players names' above their heads instead (and appear through wall too)  
Self Explanationary.
- Play End round sound cue  
Play Winning, Lose, or any End Round Event music or sounds.
- Option for Auto closing for Taunt window when double-clicking them  
Use "Double-Click and Close" feature when playing a taunt in Custom Taunt Menu.
- Draw a line on hunters so we can see their aim in spectator mode.  
Self Explanationary.
- Enable 'Lucky ball' or 'Devil Crystal' icon to be displayed once they are spawned  
This will draw an indicator icon when both items are spawned in game. To indicate that this item can be obtained by pressing E on them.  
- Right Click for taunt. This will disable Right-clicking on custom menu!  
Use "Right Click" (Mouse 2) button for Taunting on Prop Teams. However, this will disable a feature where you can Right-Click on Taunt List in Custom Taunt menu. This will also impact with any ability/items that owned from Devil Crystals that requires "Right Click" function.
- Use New PH: Enhanced HUD  
Use New Customized HUD instead of Old Half-Life 2 HUD. Any indicators such as Custom Taunt Timer, Decoy indicator, and others will not be displayed if you use default Half-Life 2 HUDs.
- Show/Hide Decoy placement helper? This will show a white dot with a text near on your crosshair.  
Toggle visibility for Decoy Placement helper that appear near on your crosshair.
- Show/Hide Decoy marker?  
This behaviour is exactly similar like "Lucky Ball/Devil Crystal", but this is for Decoy.
- Show Tutorial Pop-up (Only shows twice on each Prop team spawns)  
A Quick Guide for Prop Teams to show help for keybinds and features.
- Enable Custom Crosshair  
An alternative/less "Laggy" way instead of using Halo effect when choosing Props. Functionality is almost similar like halo effects.
- Show total alive team players bar on the top left (At least 4 Players will be shown)  
Toggle visibility to show how many team players alive remainings in active round.

### 3. Server Admin & Game Mode Settings

![Help & Guide Section](/assets/3_admin_settings.jpg)

#### Force Language Overrides

**Forced Language**  
Override client's & game language to use specific server language that appear on screen.  
This will disable a language selection on players and instead they'll use a language whatever the server will use.

**Default Player Language when first time joining to the server.**  
This will set to "English" as default for any new player joins to the server. This is not permanent and player can still choose any prefered language, unless Forced Serverside Language is set.

#### Gameplay Settings

**Player Skins & Model Settings**  
- Enable custom models for Hunters
Allow custom player skins & models to use. This will enable "Model Browser" and lists available player models that can be used by anyone.  
- Enable custom models for Props - Make sure to enable for Hunter too.
Self Explanationary, but for props. Custom models for hunter must be enable to make "Model Browser" menu to be appear.

#### Taunts Settings

- Custom & Normal Taunt Delays  
Set whether how long does custom taunt (C) and normal (F3) taunt to be played with given amount of time, in seconds.
- Enable Auto Taunt Features (Proper Timer will be fixed on next round)  
Enable Automatic Taunting system by using F3 taunt. The timer will be fixed when new round is set.
- Auto Taunt Delays  
Set whether how long does auto taunt to be played with given amount of time, in seconds. This should be longer than the other two taunt modes.
- **(Require Map Restart)** Enable Taunt Scanner?  
Enable Taunt Scanning system by scanning any custom taunts folders, if available. By default, this will scan `sound/taunts_phx/` directory.
- Taunt Modes  
Select which taunt modes would you like to use. Mode `[0]` will use classic taunt system by only using `F3` button. `[1]` will use a custom taunt menu that can be accessed through `C` button. `[2]` will use both `F3` and `C` taunt system.

#### Fake Taunt & Pitch Settings  

- Enable Taunt Pitch  
Enable Taunt Pitch for Random, Custom, or Fake Taunts.
- Maximum/Minimum acceptable range to use for Taunt Pitch.  
A minimum/maximum range (in percentage) to use for Taunt Pitch. Minimum range should be 1-99, Maximum should be 100-255.
- Allow fake taunts to be played on random props in the map.  
Allow Fake Taunts to be played and can be only accessed through Custom Taunt `C` menu.
- Maximum usage for fake taunts to be used  
Limit usage on how many times that fake taunts should be played. -1 means unlimited usage.

#### Decoy Settings

- Enable Decoy Reward?  
Enable Decoy Feature and Rewards alive prop by giving a decoy. Decoy will be given Once and it always available on every round. Once the Decoy is used, you need to obtain again by surviving until round ends. Then you'll rewarded a decoy again. Note that Decoys will be rewarded after Round 2 and onwards.
- How much health does the decoy should have. Default is 10.  
Self Explanationary. Decoy should be set between 5 to 20.

#### General Settings

- Enable chat notification for player join and leave?  
Self Explanationary. Set this unchecked if you prefer to use with your own Custom Chat addon.
- Toggle Silent prop team footsteps  
Toggle Mute for Prop's footsteps. This will silence their movement and can't be heard by anyone.
- Should grenades will be given near round end?  
Give SMG Grenades (for Hunters) when Round is about to end soon. If yes, Set how long in seconds for the grenade that should be given.
- Time in seconds to give grenades before Round Ends.  
This is typically set between 10 to 30 seconds before the round ends. For example: If round lenght is 5 seconds, the grenades will be given at 4:45 if you set "15 Seconds" before the round ends.
- Display 'Prop Rotation' notification on every Prop Spawns  
Display a notice if Prop Rotation is enabled or not.
- Enable Prop Camera collision to the wall  
Self Explanationary. Unset this if you prefer "Classic" Prop Hunt camera style that goes through the wall. Enable _Wallhacking_ for Props.
- Enable Freeze Cam features for team props  
Enable Freeze Camera TF2/CSGO-Like style.
- Enable Freeze Cam features for team hunters  
Enable Freeze Camera but for Hunters. Only occurs if you get killed by Last Prop Standing/Normal Occurance by Prop Players.
- Enable Prop collide on each other prop players  
Toggle Collision on each other prop players. Disabling this means Enable the collision and may cause some unwanted stuck with other player props.
- Swap team every round (Keep this remain checked)  
Disabling means team will stay on their own forever.
- Hunter Health Penalty  
Penalty if Hunter shoots on a Non-Player Prop.
- Hunter Kill Bonus  
Bonus Health Point if Hunter shoots on a Player Prop.
- Hunter SMG Grenades  
SMG Grenade Counts to be given to hunter. Setting to 0 means disable completely and also _"SMG Grenade Near Round End"_ too.
- **(Require Map Restart)** Total Game Time  
Total Game Lenght Time. By Default is 30 Minutes.
- Hunter blindlock time  
Time in seconds for Hunter's blindfold time. Default is 30 Seconds.
- **(Require Map Restart)** Game round time  
Time in seconds for Active Round time. Default is 300 seconds (5 minutes)
- **(Require Map Restart)** Total game Rounds per Map  
Total Active Rounds. Default is 10.
- Allow Lucky Balls Features to be spawned on breakable props  
Allow spawning of Lucky Balls. Chances are 8% to be spawned.
- Allow Devil Balls Features to be spawned when hunter dies  
Allow spawning of Devil Balls. Always spawned when a hunter dies.
- **(Require Map Restart)** Wait for Players to begin the gameplay  
Self Explanationary. *Warning:* This feature are still buggy if you set this on active round. Disabling this will ignore the wait system and continue as normal like in Classic Prop Hunt.
- **(Require Map Restart)** Mininum Players to Wait before the game starts (default: 1 or 2)  
Self Explanationary.

#### Developer Sections

- Enable Boundaries Check?  
Enable "Check for Rooms" before replicating an object. This helps to prevent you getting stuck with any objects/walls nearby.
- Use new model for Bren MK II bonus weapon (Require Map Restart)  
Self Explanationary. This weapon is only obtainable through Lucky Ball.
- Developer: Be Verbose  
PH:X will print every information and events verbosely through the console, as well as client's console.
- Enable Player team names to appear on their screen  
Toggle Visibility of Player Team Names to appear on player HUD screen.
- Use single Freezecam sound instead of sound list  
Unchecked means will use multiple sounds from a Freeze Cam's Configuration on `sh_config.lua`. Use `ph_fc_cue_path` text box to determine Freezecam sound path. Default is `misc/freeze_cam.wav` See `sh_config.lua @195 (PHX.FreezeCamSounds)` to add more freezecam sounds.
- Use Legacy Model List  
Determine on How Model Browser will *list* the models. `[0]` = All Playermodels (by using `player_manager.AddValidModel()`) or `[1]` = Use Legacy List from `list.Get('PlayerOptionsModel')`. You might have to create a custom List if you're using List `(1)` to make them appears on *Model Browser* menu.
- Additional Jump Power multiplier for Props  
Set a Multiplier How High for Props to jump. Default is `1.4`. This is caused due to Player's Hull difference that causes the jump height become decreased for small props.
- Developer: Enable Customized Prop Entities Model Hull/Boundaries (OBB) Modifier from config data  
Enable a overrides for Entities' OBB Hulls/Boundaries (Mins/Max). This helps to fix any taller or wider props to use a fixed Player-sized Hulls for example.
- Developer: Reload OBB Modifier data every round restarts  
This will Reload OBB modifier data on every round starts. Only recommended while used for Testing.

#### Usable Prop Entity Types

- Type of Entities to use for Prop to Replicate  
Types can be: 1: Physics Only, 2: Physics & Dynamics, 3: Almost Anything inc. Ragdolls, 4: Custom Entities. This will use a configuration from `sh_config.lua @31 (PHX.CVARUseAbleEnts)`
- Notify Props about entities that cannot be replicated by pressing E.  
Only works if `ph_usable_prop_type` is set to `3` or `4`. This will shows a message: *"Press [E] to interact, [Click] to replicate object"* on their center screen.

#### PH:X Experimental Settings
- Add HL: Alyx Combine model support  
Add support for using Half-Life Alyx Combine model support. This is ONLY available if you're subscribed with the following addons:  
https://steamcommunity.com/sharedfiles/filedetails/?id=2109019567  
https://steamcommunity.com/sharedfiles/filedetails/?id=2068446620  
https://steamcommunity.com/sharedfiles/filedetails/?id=2064138107  
https://steamcommunity.com/sharedfiles/filedetails/?id=2059548654  
https://steamcommunity.com/sharedfiles/filedetails/?id=2035168341  
This is COMPLETELY optional.
- Use new Chat Box (eChat)  
This is temporary replacement. If you have any custom chat box addons already, leave this remain unchecked.
- New Chat Box Position: Substract Height (Y) Position by N pixels.  
Substract Height/Y Position by given amount of N pixels. Default is 50 or 72 pixels.
- Allow Respawn on Blind Time  
Allow Anyone to Respawn on Blind Time. This is intended for anyone especially who get killed by Gravity on Round Start.
- Allow Respawn on Blind Time with specific Team Only  
Allow Only on specific team to be respawned. `[0]` = Everyone, `[1]` = Hunters, `[2]` = Props.
- Percentage of Blind Time which allows to respawn  
Amount in Percentage when someone is allowed to respawn during the blind time. Default is 0.75 (Meaning that 75% * 30 Seconds Blind Time = 22.5 Seconds to be allowed to spawn, for example.)
- Allow Respawn on Blind Time when Assigning to Spectator Team  
Allow Respawn when someone switch team from Spectator to Specific Team.
- Allow Respawn on Blind Time when Assigning to Different Team  
Allow Respawn on Blind Time when Assigning *Directly from team to another*. **This is not recommended to turn this on unless you know what you're doing.**
- Force players to even out teams upon joining  
Force players to join on any full team.
- Automatically even out teams at the start of a round (Team Balance)  
Even out teams when round start and balance them.
- Use Team Switch limitter  
Force a limit on how many team changes for a player can use. This helps to prevent props player to assign to hunter teams repeatedly. Set to `-1` to disable this feature.
- Allow pick up of small props?  
Allow any specific teams to pick up objects. `[0]` = Dont Allow, `[1]` Hunters Only, `[2]` Props Only, `[3]` Allow Everyone.

### 4. MapVote Settings

![Help & Guide Section](/assets/5_mapvotes.jpg)

Here you can configure the Integrated MapVote system.

**MapVote Settings**
  
- Allow Current map to be Voted  
Allow current map to be voted or not.
- Enable map Cooldown  
Cooldowns (Hide) the map in X map changes until the map reapear on the list again.
- Use map listing from ULX Mapvote?  
Use a map listing from ULX or not. If not, a default prefixed-list from maps/*.bsp will be used instead.
- Number of Maps to be shown in MapVote.  
Self Explanationary.
- Time in Seconds for default mapvote when voting.  
Vote Time before the map is voted for change. Default is 28 seconds.
- Map changes needed for a map to reappear  
How many X times for a cooldown maps reapear to the list.
- How many players required to use RTV (Rock the Vote)  
Self Explanationary. Default is 3.

You can use `mv_start` and `mv_stop` to Trigger and Stop MapVote system.  
Or use `ulx map_vote` or `ulx unmap_vote` if you use ULX Admin Mod.

### 5. Player Skins & Model Browser

![Help & Guide Section](/assets/4_model_settings.jpg)

This section allows you to set your custom player models provided from the server and you can choose anything from here.

**Notes:**
- To Enable the Player Model Browser, An Admin must set the "Enable custom models for Hunters" from Admin Settings to enable this feature. Otherwise it will be disabled.
- Server may have it disabled and therefore you may unable to use custom skins. This probably intended for anyone who wants to use a skin from Pointshop instead.
- If you are setting up for props as well, make sure the "Enable custom models for Props" is enabled.

### 6. About PH:X

![Help & Guide Section](/assets/6_about_info.jpg)

This menu shows several information about the gamemode that installed on the server, along with the contributors and other informations.

It is important to note that you have to pay attention with the version of PH:X you are using. PH:X might often receive alot of updates and therefore you should
check the updates periodically.

## 7. Player Mutes

![Help & Guide Section](/assets/8_player_mutes.jpg)

You can toggle mute player's voice in this section. Simply just click on the speaker icon to toggle mute or unmute.  

## 8. Plugins

![Help & Guide Section](/assets/7_plugins.jpg)

### 1. Prop Menu (Prop Chooser) Plugin

#### Editor

- **[Open Editor] Button**  
Open Prop Menu Additional Model Editor which allows you to add custom models to the Prop Menu.

#### Common Settings

- Enable "Prop Menu" feature  
Toggle Prop Menu feature to be available or not.  
- (Require Map Restart) Allow custom props to be added in to the Prop Menu list?
Allow any custom additional props to be added to the Prop Menu list. This can be added through Prop Editor or Edited manually through `data/phx_data/prop_chooser_custom/models.txt`  
- (Require Map Restart) Do not include banned props into Prop Menu list?
Excludes any prohibited & banned props and don't add them to prop menu list. Disabling this means it will only shows "Red" Icon indicator on prop menu meaning that you can't use them.  
- Maximum usage limit for player to use. -1 means unlimited.
Self Explanationary.  
- (Require Map Restart) Limit amount of prop addition to Prop Menu list
Enable Limit of Amount Prop Addition to be added to Prop Menu list.  
- Maximum amount of props that will be added to Prop Menu list.
Self Explanationary, Note: This will be randomly added on each map changes. Default is 100.

#### Technical Settings
  
- Should Prop Menu can be accessed by Console (0) or ULX (1)?
Which method that Prop menu should be accessed. Any Key Binding for Opening Prop Menu that Bounds to it will respect to this setting.  
- Delay in seconds before player to use another Prop in Prop Menu
Delays the usage before a player use another prop in Prop Menu to prevent spam.  
- Kick any user attempt to access Invalid Model
Kick a user if they're trying to access/use Non Existing/Invalid models. If player keep retrying at Maximum Threshold, will be kicked.  
- Check for space for a room before player use another prop to prevent Stuck.
Similar functionality for "Check for Room" feature. Always keep this checked to prevent any unwanted stuck.  
- (Require Map Restart) Check Entity BBox Limit before adding to Prop Menu list
This function will checks to any Entity's Bounding Box Mins/Maxs (BBox) Limit before adding to Prop Menu list. This will help to reduce the hull height size for a prop.  
- BBox CollisionBound Maximum Height/Width limit. Mins will be auto-calculated.
Self Explanationary. Only props that does not exceed the Maximum Height/Width BBox Limits will be added to Prop Menu list.

#### Server Optional Settings
  
- Should Prop Menu can only be accessed by certain groups e.g. Donator?
Should Prop Menu can be accessed by certain groups like Donator, Respected, and other custom Members levels?  
- Notify player on how to use Prop Menu on every round start
Notify with a small chat message to remind the players on how to use Prop Menu on every round start.

**-- Client Settings --**

Nothing.

### 2. Last Prop Standing Plugin

Here you can configure the Last Prop Standing Plugins.

**General Settings**
  
- Enable Last Prop Standing (LPS)  
Enable the LPS feature.
- Weapon to give ('random' or 'name').  
Weapon that should be given for Last Prop Standing player. See "Available Weapons List" button to see available weapons to use. Use "random" so that they will be given a random weapon instead.
- Minimum number of prop player on Team before LPS can be triggered.  
Required minimum players before LPS can be triggered. **Must be >= 2 players in Prop Team**. Default is 2.
- Enable Music when LPS occurs  
Enable Music event for LPS. Require Round Restart to take effect (Only if you're disabling it when LPS occurs)

**Appearances**  

- Show Last Prop Standing's Weapon?  
Toggle Visibility for Last Prop's Weapon. Setting this unchecked means their weapon is invisible, but the tracer and muzzleflash are still appears.
- Draw a halo effect around the last prop?  
Draw a glowing effect for the Last Prop.
- Draw the halo effect through walls?  
Draw a glowing effect **and** also visible through walls.
- Colour for Last Prop Standing's Halo effect ('rainbow' or hex code)  
Colour for glowing effect. Can be 'rainbow' or a hex colour code. Example: `#FF0000` (Red)
- Draw a trail behind Last Prop player?  
Draw a trailing line on the Last Prop.
- Colour for the Last Prop's trail (hex code)  
Colour for the trailing line. Hex colour code only. Example: `#FFFF00` (Yellow)
- Trail colour texture for Last Prop's player  
The Trailin Line texture to be used. Texture must be present in the game.

**Weapon Settings**

Weapons can be configurable to yourself with your liking. I would recommend to leave it with default settings
unless if you'd like to change the Blaster Damage Settings.

**-- Client Settings --**
- Play Background Music when LPS Event begin. (Only applies on next music)  
Toggle Play Background music when LPS event started. This only applies after the next music queue is played.
- Show/Hide Halo, even server sets it.  
Whether server sets the halo effect, Toggle visibility of glowing effect for the Last Prop standing. Use this if you need to avoid FPS lag when this is enabled.

## 9. Donate Section

![Help & Guide Section](/assets/0_donation_menu.jpg)

This section shows the Donation Link options for Prop Hunt: X Development.