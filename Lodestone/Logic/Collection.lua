local _, Lodestone = ...
local L = Lodestone.L
Lodestone.Collection = Lodestone.Collection or {}

local function defaultWaypointDescription()
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

function Lodestone.SaveWaypoint(mapId, x, y, name, description, nameColor)
  local m = mapId or C_Map.GetBestMapForUnit('player')
  local db = Lodestone.lastProfile
  local id = db.nextWaypointId
  db.nextWaypointId = id + 1
  db.waypoints[id] = {
    mapId = m,
    x = x,
    y = y,
    name = name or L.WAYPOINT,
    description = description or '',
  }
  if nameColor then
    db.waypoints[id].nameColor = nameColor
  end
  Lodestone.NotifySavedWaypoint(name, x, y)
  Lodestone.Collection.refreshWaypointList()
  return id
end

function Lodestone.SaveCurrentWaypoint(name, description)
  name = name or L.WAYPOINT
  description = description or defaultWaypointDescription() or ''
  local mapId, x, y = Lodestone.GetPlayerPosition()
  if not mapId then
    Lodestone.Notify(L.COULD_NOT_DETERMINE_POSITION)
    return
  end
  local id = Lodestone.SaveWaypoint(mapId, x, y, name, description)
  Lodestone.Collection.refreshWaypointList()
  return id
end

function Lodestone.UpdateWaypoint(id, options)

  local waypoint = Lodestone.lastProfile.waypoints[id]
  if not waypoint then
    Lodestone.Notify(L.NO_SAVED_WAYPOINT)
    return
  end

  if options.nameColorSet == nil and options.nameColor then options.nameColorSet = true end
  if options.pinColorSet == nil and options.pinColor then options.pinColorSet = true end

  for k, v in pairs(options) do
    if k == 'coords' then
      if type(v) == 'string' then
        local newX, newY = Lodestone.Util.parseWaypointCoords(v)
        waypoint.x, waypoint.y = newX or waypoint.x, newY or waypoint.y
      end
    else
      if options[k] then
        waypoint[k] = v or waypoint[k] or Lodestone.DEFAULT_WAYPOINT[k]
      end
    end
  end

  Lodestone.ReloadMapPins()
  return waypoint
end

function Lodestone.DeleteWaypoint(id)
  Lodestone.lastProfile.waypoints[id] = nil
end

function Lodestone.DeleteAllWaypoints()
  Lodestone.lastProfile.waypoints = {}
end

function Lodestone.GetWaypointById(id)
  return Lodestone.lastProfile.waypoints[id]
end

function Lodestone.GetWaypoints()
  return Lodestone.lastProfile.waypoints
end

function Lodestone.Collection.SetSpotFrameTexCoords(bg, atlas, targetSize, sourceSize)
    targetSize = targetSize or {width = 299, height = 407}
    sourceSize = sourceSize or {width = 512, height = 512}

    local left, right, top, bottom
    local pixelWidth, pixelHeight

    local insetAdjustment = Lodestone.CONFIG.WAYPOINT_COLLECTION.SPOT_FRAME_INSET / 1000

    if atlas then
        local atlasInfo = C_Texture.GetAtlasInfo(atlas)
        if atlasInfo then
            left = atlasInfo.leftTexCoord
            right = atlasInfo.rightTexCoord
            top = atlasInfo.topTexCoord
            bottom = atlasInfo.bottomTexCoord
            pixelWidth = atlasInfo.width
            pixelHeight = atlasInfo.height
        end
    end

    if not left then
        local nonAtlasAdjustmentX = 1 / sourceSize.width
        local nonAtlasAdjustmentY = 1 / sourceSize.height

        left = 0
        right = (targetSize.width / sourceSize.width) + nonAtlasAdjustmentX
        top = 0
        bottom = (targetSize.height / sourceSize.height) + nonAtlasAdjustmentY
        pixelWidth = targetSize.width
        pixelHeight = targetSize.height
    end

    local bgWidth = bg:GetWidth()
    local bgHeight = bg:GetHeight()
    if bgWidth == 0 then bgWidth = 1 end 

    local frameAspect = bgHeight / bgWidth
    local croppedPixelHeight = pixelWidth * frameAspect

    local uvHeightSpan = bottom - top
    local heightPercentageToKeep = croppedPixelHeight / pixelHeight
    local newTop = bottom - (heightPercentageToKeep * uvHeightSpan)

    bg:SetTexCoord(
        left,
        right + insetAdjustment,
        newTop,
        bottom + insetAdjustment
    )
end