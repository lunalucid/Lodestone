# Lodestone

**This project is currently a work in progress. The current version is considered a minimum viable product.**

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
The required [UiMapID](https://wowpedia.fandom.com/wiki/UiMapID) argument ensures the coordinates are mapped to the right zone.

## Features
* **Waypoint Collection/Diary:** Save and maintain a personal database of waypoints to track or share at any time, as well as customize each waypoint entry visually and add notes/memos if desired.
* **Works with TomTom** Activate waypoints via TomTom automatically if you have it installed already. You can disable this feature in the official game menu options screen or the Lodestone options tab.
* **Full Localization:** Localization added for every official World of Warcraft game language.

---

## Developer API Reference

Other addons can interact with Lodestone globally via the `LodestoneAPI` table.

*waypoint table reference:*
```lua
waypoint: {
  name: string,
  description: string,
  mapId: number,
  x: number,
  y: number,
  overrideBg: boolean,
  selectedTexture?: number
  nameColor?: {
    r = number,
    g = number,
    b = number
  }
}

-- e.g.:
local waypoint = {
  name = "The Dark Portal",
  description = "A portal... that is dark?",
  mapId = 100,
  x = 0.8914,
  y = 0.5021,
  overrideBg = true,
  selectedTexture = 192923,
  nameColor = {
    r = 0.6000000238418579,
    g = 0.4431372880935669,
    b = 0.9725490808486938
  }
}
```
### API
| Function | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| `LodestoneAPI.GetWaypoints()` | None | `table` | Returns database of saved waypoints |
| `LodestoneAPI.GetWaypointById(id)` | `id` (number) | `table` or `nil` | Retrieves a specific waypoint |
| `LodestoneAPI.ActivateWaypoint(id)` | `id` (number) | `table` or `nil` | Activates/navigates to a specified waypoint |
| `LodestoneAPI.ClearWaypoint()` | None | None | Clears active waypoint |
| `LodestoneAPI.SaveWaypoint(mapId, x, y, name?, description?)` | `mapId` (number), `x` (number), `y` (number), `name` (string) (optional), `description` (string) (optional) | `number` (id) | Saves a new waypoint to the collection |
| `LodestoneAPI.SaveCurrentWaypoint(name?, description?)` | `name` (string) (optional), `description` (string) (optional) | `number` (id) | Saves current position to the collection |
| `LodestoneAPI.DeleteWaypoint(id)` | `id` (number) | None | Deletes specified waypoint from collection |
| `LodestoneAPI.UpdateWaypoint(id, name?, description?, mapId?, coords?, nameColor?)` | `id` (number), `name` (string) (optional), `description` (string) (optional), `mapId` (number) (optional), `coords` (string | table) (optional), `nameColor` (table) (optional) | `number` (id) | Saves a new waypoint to the collection |
| `LodestoneAPI.GetPlayerPosition()` | None | `table` (mapId, x, y) | Returns current mapId, x, y |
| `LodestoneAPI.ChatWaypoint(id)` |  `id` (number) | `boolean` | Sends a waypoint hyperlink to the chatbox |
| `LodestoneAPI.Open()` | None | None | Opens Lodestone UI |
| `LodestoneAPI.Close()` | None | None | Closes Lodestone UI |


#### Usage Examples
```lua
-- Update Waypoint
local waypoint = LodestoneAPI.GetWaypointById(27)
local now = GetGameTime()

if waypoint then
  LodestoneAPI.UpdateWaypoint(
    waypoint.id,
    string.format('%s (updated)', waypoint.name),
    string.format('%s\n-Discovered rare anomaly at %s', waypoint.description, now),
    nil,
    nil,
    {
      r = 1,
      g = 0,
      b = 0.18039216
    }
    )
end
```

```lua
-- New Waypoint
local waypoint = {
  name = "The Dark Portal",
  description = "A portal... that is dark?",
  mapId = 100,
  x = 0.8914,
  y = 0.5021,
  overrideBg = true,
  selectedTexture = 192923,
  nameColor = {
    r = 0.6000000238418579,
    g = 0.4431372880935669,
    b = 0.9725490808486938
  }
}

local newWaypointId = LodestoneAPI.SaveWaypoint(
  100,
  0.8914,
  0.5021,
  'The Dark Portal',
  'A portal... that is dark?'
)

```
