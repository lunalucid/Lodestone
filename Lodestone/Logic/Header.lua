local _, Lodestone = ...
local L = Lodestone.L
Lodestone.Header = Lodestone.Header or {}

function Lodestone.Header.defaultWaypointName()
  local subZone = GetSubZoneText()
  local zone = GetZoneText()
  if subZone ~= '' then
    return subZone
  else
    return zone
  end
end

function Lodestone.Header.defaultCoords()
  local mapId, x, y = Lodestone.GetPlayerPosition()
  if not mapId then
    return
  end

  local waypoint = { x = x, y = y }
  return Lodestone.Util.formatWaypointCoords(waypoint)
end

function Lodestone.Header.defaultWaypointDescription()
  local subZone = GetSubZoneText()
  local zone = GetZoneText()
  local mapId = C_Map.GetBestMapForUnit('player')
  local mapInfo = mapId and C_Map.GetMapInfo(mapId)
  local parentMapId = mapInfo and mapInfo.parentMapID
  local parentMapInfo = parentMapId and C_Map.GetMapInfo(parentMapId)
  local parentMapName = parentMapInfo and parentMapInfo.name

  local parts = {}
  if subZone and subZone ~= '' then table.insert(parts, subZone) end
  if zone and zone ~= '' then table.insert(parts, zone) end
  if parentMapName and parentMapName ~= '' then table.insert(parts, parentMapName) end

  return string.format(L.WAYPOINT_IN, table.concat(parts, ', '))
end