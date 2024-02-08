## Upcoming Changes:

### Total Conversion update to a new Version (Codename: X2Z Update 2.0)
This mostly aims for optimization as well as new features that soon will be migrated entirely to `prop_hunt` base main code. Fretta however may still in use (partially)

### Additions & Changes:
- ~~Implement Weapon Holster support for Last Prop Standing~~
- ~~Add Map Backup for Classic PH/E support on Workshop~~
- ~~Add `env_embers` controller~~
- ~~Add Translation on Server Realm (require `player` arguments)~~
- ~~MapVote will now entirely seperated from `MapVote` global variable~~
- ~~Lucky & Devil ball optimization~~
- Prop Menu will now part of the gamemode instead of plugins
- ~~Fixes for Hunter's Spawn function~~
- ~~Remove the bloated use of 'GetGlobal*' functions instead use the optimize Net code instead~~ -NOTE: Use Better Alternative, avoid using network strings at all costs
- Remove `PHX` Globals completely and use from `GAMEMODE` table instead -NOTE: `FCVAR_REPLICATED` seems to be working now?
- Change "Team Selection" and "Help UI" Appearance
- ~~Update to map scripts~~
- Other Plugins Optimizations
- ~~Bug: Map "Prop Decoy" Entity will have weird collission if spawned and `SetSolid(SOLID_BBOX)` isn't get called.~~ USE `ph_decoy_spawner` Entity instead!
- More Tweaks

### Scrap/Possibly Added
- Implement Level System
- Implement Taunt URL
- Ability for props to select Items when obtaining Devil Crystal
- Implement Prop Map Editor
- Working on HUD UI Scaling, if possible.
- Update Collission for **Pitch Rotation** by using AABB collission detection (Either use `Entity:GetSurroundingBounds` OR `Entity:GetRotatedAABB`)