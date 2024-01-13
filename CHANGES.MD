## PRE-RELEASE

## Revision 14.01.2024 (January 2024 Hotfix #2)-PRE-RELEASE
Minor patch for issues caused by `ph_print_verbose` that sometimes not exists in client realm due to Gamemode's loading order and other enhancement, causing error when opening Prop Hunt Settings menu
- Removed option `Verbose Print` in Prop Hunt Settings Menu;
- Renamed `ph_print_verbose` to `phx_verbose` to prevent errors when player first time installing PH:X with previously PH: Enhanced was installed. **Realms are now separated (CLIENT and SERVER) and client must manually enter `phx_verbose 1` in their console.**
- Make Verbose Message with Realm Colour, more Informational, Leveled and renamed `[PHX]` prefix with their call origin (example: Taunt Scanner will be `[TauntScanner]`)
- Removed Verbose Message on Bonus Weapon (`wlv_bren`) when detecting weapon base
- Removed test debug print messages
- Edited Contributor Names (Turkish Translator & Recent Donator from 2023)
- Updated FGD and removed `ph_fake_prop` entry
- Added `ph_model_bans`, manually adds model bans from the map. Key ranging from `model1` to `model16`
- Added `ph_decoy_spawner`, use this rather using `ph_fake_prop`!
- Fixed Typo year revision on Update Description
- Lucky Ball & Devil Crystals Improvement: Moved every item & instances into `gamemodes/sv_items.lua` and keep Entities Scripts clean
- Added Devil Crystal Items: **PROP Launcher**
- Added Hunter Weapon: **Flechette Gun** (Obtained via Lucky Ball)
- Fixed when Updating Banned Prop Models where client can get empty ban data
- Updated Integrity Checker

### Untested
x: Test `phx_verbose` on SRCDS as `SERVER` and `CLIENT`
x: Flechette Killicon