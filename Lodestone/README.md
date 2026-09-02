# Lodestone

**This project is currently a work in progress. The current version is considered a minimum viable product.**

[![Report Issues](https://img.shields.io/badge/github-Report%20Issues-e799ff?logo=github)](https://github.com/lunalucid/Lodestone/issues)

Lodestone is an interface that allows you to save and edit coordinates with names and descriptions to set as waypoints later or share with others. Works with or without TomTom.

### Slash Commands
| Commands | Usage | What it does |
| --- | --- | --- |
| /Lodestone, /L | | Toggle UI |
| /savehere, /sh | | Save current position |
| /new | **/new #UiMapID x y name -d description**| Save a location manually |

You can view or enable/disable these slash commands in Game Menu (pops up when you press ESC) -> Options -> AddOns -> Lodestone -> Slash Commands

**Example /new usage:**
```
/new #100 89.0 50.0 The Dark Portal
```
**Stacked:**
```
/new #114 33 59 Unborn Val'Kyr Spawn 1 -d Borean Tundra, #114 47 6 Unborn Val'Kyr Spawn 2 -d Borean Tundra, #114 81 48 Unborn Val'Kyr Spawn 3 -d Borean Tundra
```
[UiMapID List](https://wowpedia.fandom.com/wiki/UiMapID)

## Features
* **Waypoint Collection/Diary:** Save and maintain a personal database of waypoints to track or share at any time, as well as customize each waypoint entry visually and add notes/memos if desired.
* **Works with TomTom** Activate waypoints via TomTom automatically if you have it installed already. You can disable this feature in the official game menu options screen or the Lodestone options tab.
* **Full Localization:** Localization added for every official World of Warcraft game language.