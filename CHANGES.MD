## PRE-RELEASE

## Revision ??.??.2024 February Beta
This build is a patch from `game.CleanUpMap()` changes () and built some experimental
- Experimental: Prop ViewOffset Changes with Mousewheel Zoom (NOTE: Currently broken for other things such as Prop Halo, Selection, Weapon Accuracy, etc)
- Changed `game.CleanUpMap()` behaviour to avoid gamemode & addon/plugins scripts from breaking
- Changed `PH_OnPreRoundStart` hook behaviour - DO NOT USE THIS TO DETECT ENTITIES, USE `PostMapCleanup` HOOK INSTEAD!
- Fixed Hunter Blindtime not triggered after `game.CleanUpMap()` changes
- Fixed Prop being `NULL` after `game.CleanUpMap()` changes
- Todo: Change prop health behaviour by using `:SetHealth()` instead using from `.health` key
- Todo: Change Team Selection
- `HUDShouldDraw`->`CHudWeaponSelection` = `false` for Player Props. We don't use weapon as much except LPS weapon.
- Todo: REMOVE ALL `GetGlobal*`, `FCVAR_REPLICATED` ConVars should be worked for now, _at least_.
- Update to Map Props OBB Modifier Behaviour: updated Prop Room/Space Checking due to new OBB changes (see `/gamemodes/config/maps/ph_hotel.lua`)
- Optimized `GM:ExchangeProp`, noticed slight performance improvement
- More not mentioned

### Untested
- LPS Dummy Weapon selection with `HUDShouldDraw`->`CHudWeaponSelection` = `false`
- Test Prop's ViewOffset
- **Many things** needs to be tested