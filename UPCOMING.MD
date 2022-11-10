## Upcoming Changes:

### Additions:
- Implement Level System
- Implement Taunt URL
- Implement Prop Map Editor
- Implement Weapon Holster support for Last Prop Standing
- Add Map Backup for Classic PH/E support on Workshop
- ✅ Add `env_embers` Controller

### Changes:
- ConVars Optimization: Reduce usage of 'GetGlobal*' functions and use one Net Message instance instead
- Lucky & Devil ball optimization
- Change "Team Selection" Appearance
- Total Map Conversion to PH:X : Underwataaa Extended, Marketbattle V2, Restaurant 2022, Industry
- Other Plugins Optimizations
- Bug: Map "Prop Decoy" Entity will have weird collission if spawned and `SetSolid(SOLID_BBOX)` isn't get called.

### Scrap/Possibly Added
- Working on HUD UI Scaling, if possible.
- Update Collission for **Pitch Rotation** by using AABB collission detection (Either use `Entity:GetSurroundingBounds` OR `Entity:GetRotatedAABB`)

### Other Notes:
⏱ Development will continue after Mid December (by the latest)
See more info at https://ko-fi.com/post/Upcoming-project-update-status-and-other-notices-I3I4G8LIY