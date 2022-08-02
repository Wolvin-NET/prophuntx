## Development State of 3/08/2022

### Warning: This is nightly build development branch may INCOMPLETE or UNSTABLE. Use at your own risk! 
### This branch may contains alot of commit changes. Be sure to stay up to date & checkout regularly.

If you are normal user, DO NOT use this version. Use `master` branch instead!

---

# Prop Hunt X

### Versioning
Version: X2Z, Revision: ??/06/2022 (dd/mm/yyyy)

### Purpose:
- Backup
- Live Testing

### Donate
Please help support the project by donating:  
https://ko-fi.com/wolvindra  
https://www.buymeacoffee.com/wolvindra  

### Change Logs:
#### 3/08/2022 (LPS Major Update)
- LPS Weapons are now Client-Predicted. Meaning that you can still fire your weapon without Server's delay due to latency.
- Major Improvements for LPS Plugins
- Fixed Error on Hunter's Spectator Laser Sight
- Tweaked `cl_init.lua`
- Removed Effect `phx_laserbeam`
- Added Dummy Weapon Entity: "weapon_lps": This dummy script helps to prevent any issues with Predictions especially for `Player:EmitSound()` issues.
- Added LPS Weapon: **Laser** - currently it has no sound as it's still finding a workaround to get the sound played properly without being duplicated.
- ~~LPS Weapon ConVars~~ not yet

#### 30/07/2022
- Fixed Bug Muzzle Flash effect Position acting weird because of Hull Differences
- Fixed Error in `sh_config.lua` that trying to remove a prohibitted prop in client side realm
- Fixed Prop Rotation and will no longer use `GM:Move` hook, instead all everything coded into `ph_prop` entity.
- Added "Pitch" Rotation
- Prop's rotation can no longer stayed "Locked" if you changed into a new prop. This behaviour is to prevent "Pitch rotation" rotating in strange angle/position.
- Deprecated: prop_ragdoll Usable prop types will be dropped or limitted due to Pitch Rotation coding issues. This is due to Engine's Physics limit.
- LPS: Added New Weapons
- LPS: Added Round Random Trigger/Selective Round
- LPS: Fixed Weapon Position to be centered, Added `"FixPos"`, same as `FixAngles` but for positions
- Added Player Color Functions for both team Hunters and Props
- Added Option to show/hide Splash Screen upon joining

### What to Add/Change:
- [Add] Implementation of Dynamic Team & Unstuck from PH:E+
- [Change] Lucky & Devil ball optimization
- [Change] Change "Team Selection" Appearance