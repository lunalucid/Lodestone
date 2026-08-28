local _, Lodestone = ...
Lodestone.Navigation = Lodestone.Navigation or {}
local Navigation = Lodestone.Navigation
local L = Lodestone.L

local PROVIDER_TOMTOM = 'tomtom'
local PROVIDER_NATIVE = 'native'

Navigation.lastTomTomUid = nil
Navigation.activeProvider = nil
Navigation.activeTarget = nil

local COORD_EPSILON = 0.0001

local function getNavigationSettings()
  local profile = Lodestone.DB and Lodestone.lastProfile
  return profile and profile.settings.navigation
end

function Navigation.isTomTomAvailable()
  return C_AddOns.IsAddOnLoaded('TomTom')
    and _G.TomTom
    and type(_G.TomTom.AddWaypoint) == 'function'
end

local function ensureTomTomLoaded()
  if Navigation.isTomTomAvailable() then
    return true
  end
  if not Navigation.getPreferTomTom() then
    return false
  end
  local ok, enabled = pcall(_G.GetAddOnInfo, 'TomTom')
  if not ok or not enabled then
    return false
  end
  if C_AddOns.LoadAddOn('TomTom') and Navigation.isTomTomAvailable() then
    return true
  end
  return false
end

function Navigation.getPreferTomTom()
  local settings = getNavigationSettings()
  if settings and settings.preferTomTom == false then
    return false
  end
  return true
end

function Navigation.resolveProvider()
  if Navigation.getPreferTomTom() and ensureTomTomLoaded() then
    return PROVIDER_TOMTOM
  end
  return PROVIDER_NATIVE
end

local function coordsMatch(mapId, x, y, otherMapId, otherX, otherY)
  return mapId == otherMapId
    and math.abs(x - otherX) < COORD_EPSILON
    and math.abs(y - otherY) < COORD_EPSILON
end

local function rememberTarget(provider, mapId, x, y, title)
  Navigation.activeProvider = provider
  Navigation.activeTarget = {
    mapId = mapId,
    x = x,
    y = y,
    title = title,
  }
end

local function clearTomTomWaypoint()
  local uid = Navigation.lastTomTomUid
  Navigation.lastTomTomUid = nil
  if uid and Navigation.isTomTomAvailable() and _G.TomTom.RemoveWaypoint then
    _G.TomTom:RemoveWaypoint(uid)
  end
end

local function clearNativeWaypoint()
  if C_Map.HasUserWaypoint() then
    C_Map.ClearUserWaypoint()
  end
  if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
    C_SuperTrack.SetSuperTrackedUserWaypoint(false)
  end
end

function Lodestone.ClearWaypoint(notify)
  notify = notify or false
  clearTomTomWaypoint()
  clearNativeWaypoint()
  Navigation.activeProvider = nil
  Navigation.activeTarget = nil
  if notify then
    Lodestone.Notify(string.format('%s %s', L.WAYPOINT, ACTION_SPELL_AURA_REMOVED))
  end
end

local function trySetNativeWaypoint(mapId, x, y)
  if mapId and C_Map.CanSetUserWaypointOnMap(mapId) then
    local mapPoint = UiMapPoint.CreateFromCoordinates(mapId, x, y)
    C_Map.SetUserWaypoint(mapPoint)
    if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
      C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    end
    return mapId, x, y
  end

  local ok, continentId, worldPos = pcall(C_Map.GetWorldPosFromMapPos, mapId, CreateVector2D(x, y))
  local continentMapId = tonumber(continentId)
  if ok and continentMapId and worldPos and C_Map.CanSetUserWaypointOnMap(continentMapId) then
    local okPos, resolvedMapId, mapPos = pcall(C_Map.GetMapPosFromWorldPos, continentMapId, worldPos, continentMapId)
    if okPos and resolvedMapId and mapPos then
      local mapPoint = UiMapPoint.CreateFromCoordinates(resolvedMapId, mapPos.x, mapPos.y)
      C_Map.SetUserWaypoint(mapPoint)
      if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
      end
      return resolvedMapId, mapPos.x, mapPos.y
    end
  end
end

local function notifySetWaypoint(x, y, provider)
  local formattedWaypoint = Lodestone.Util.formatWaypointCoords({ x = x, y = y })
  Lodestone.Notify(string.format(L.WAYPOINT_SET_TO, formattedWaypoint))
end

function Lodestone.NotifyCannotSetWaypoint(mapId, x, y)
  local info = mapId and C_Map.GetMapInfo(mapId)
  if x or y > 1 then
    Lodestone.Notify(string.format(L.INVALID_COORDS, Lodestone.Util.formatWaypointCoords({x = x, y = y})))
  else
    Lodestone.Notify(string.format(L.CANNOT_SET_WAYPOINT, tostring(mapId), info and info.name or UNKNOWN))
  end
end

function Navigation.setNativeWaypoint(mapId, x, y, title)
  Lodestone.ClearWaypoint()

  local resolvedMapId, resolvedX, resolvedY = trySetNativeWaypoint(mapId, x, y)
  if not resolvedMapId then
    Lodestone.NotifyCannotSetWaypoint(mapId, x, y)
    return false
  end

  rememberTarget(PROVIDER_NATIVE, mapId, x, y, title)
  notifySetWaypoint(resolvedX, resolvedY, PROVIDER_NATIVE)
  return true
end

function Navigation.setTomTomWaypoint(mapId, x, y, title)
  Lodestone.ClearWaypoint()

  local uid = _G.TomTom:AddWaypoint(mapId, x, y, {
    title = title or L.WAYPOINT,
    source = Lodestone.name,
    from = Lodestone.name,
    persistent = false,
    crazy = true,
    silent = true,
  })

  if not uid then
    return Navigation.setNativeWaypoint(mapId, x, y, title)
  end

  if C_Map and C_Map.SetUserWaypoint then
    C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(mapId, x, y))
    if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
      C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    end
  end

  Navigation.lastTomTomUid = uid
  rememberTarget(PROVIDER_TOMTOM, mapId, x, y, title)
  notifySetWaypoint(x, y, PROVIDER_TOMTOM)
  return true
end

function Navigation.isWaypointActive(mapId, x, y)
  local target = Navigation.activeTarget
  if not target or not coordsMatch(mapId, x, y, target.mapId, target.x, target.y) then
    if C_Map.HasUserWaypoint() then
      local current = C_Map.GetUserWaypoint()
      if current and current.position then
        local currentX, currentY = current.position.x, current.position.y
        if current.position.GetXY then
          currentX, currentY = current.position:GetXY()
        end
        return coordsMatch(current.uiMapID, currentX, currentY, mapId, x, y)
      end
    end
    return false
  end

  if Navigation.activeProvider == PROVIDER_TOMTOM then
    return Navigation.lastTomTomUid
      and Navigation.isTomTomAvailable()
      and _G.TomTom.IsValidWaypoint
      and _G.TomTom:IsValidWaypoint(Navigation.lastTomTomUid)
  end

  return C_Map.HasUserWaypoint()
end

function Navigation.hasActiveWaypoint()
  if Navigation.activeTarget then
    if Navigation.activeProvider == PROVIDER_TOMTOM then
      return Navigation.lastTomTomUid
        and Navigation.isTomTomAvailable()
        and _G.TomTom.IsValidWaypoint
        and _G.TomTom:IsValidWaypoint(Navigation.lastTomTomUid)
    end
    return C_Map.HasUserWaypoint()
  end
  return C_Map.HasUserWaypoint()
end

function Navigation.setWaypoint(mapId, x, y, title)
  if not mapId or not C_Map.CanSetUserWaypointOnMap(mapId) then
    Lodestone.Notify(L.CANNOT_SET_WAYPOINT)
    return false
  end
  if Navigation.resolveProvider() == PROVIDER_TOMTOM then
    return Navigation.setTomTomWaypoint(mapId, x, y, title)
  end
  return Navigation.setNativeWaypoint(mapId, x, y, title)
end
