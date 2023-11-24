## Upcoming Changes:

### Total Conversion update to a new Version (Codename: Reborn)
This mostly aims for optimization as well as new features that soon will be migrated entirely to `prop_hunt` base main code. Fretta however may still in use (partially)

### Additions & Changes:
- Implement Level System
- Implement Taunt URL
- ~~Implement Weapon Holster support for Last Prop Standing~~
- ~~Add Map Backup for Classic PH/E support on Workshop~~
- Add `env_embers` controller
- Prop Menu will now part of the gamemode instead of plugins
- Add Translation on Server Realm (require `player` arguments)
- MapVote will now entirely seperated from `MapVote` global variable
- Fixes for Hunter's Spawn function
- Remove the bloated use of 'GetGlobal*' functions instead use the optimize Net code instead (75% Done)
- Remove `PHX` Globals completely and use from `GAMEMODE` table instead (40% Done)
- Lucky & Devil ball optimization
- Ability for props to select Items when obtaining Devil Crystal
- Change "Team Selection" and "Help UI" Appearance
- Update to map scripts
- Other Plugins Optimizations
- Bug: Map "Prop Decoy" Entity will have weird collission if spawned and `SetSolid(SOLID_BBOX)` isn't get called.
- More Tweaks

### Scrap/Possibly Added
- Implement Prop Map Editor
- Working on HUD UI Scaling, if possible.
- Update Collission for **Pitch Rotation** by using AABB collission detection (Either use `Entity:GetSurroundingBounds` OR `Entity:GetRotatedAABB`)