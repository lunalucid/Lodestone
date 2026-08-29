local _, Lodestone = ...

local dbName = Lodestone.nameStripped:gsub('[^%w]', '') .. 'DB'
local playerName = UnitName('player') or 'unknown'
local playerRealm = GetRealmName():gsub(' ', '') or 'unknown'
local playerProfile = string.format('%s-%s', playerName, playerRealm)

local DB_INIT = {
  player = {},
  profile = {
    ['Default'] = {}
  }
}

local PLAYER_DEFAULTS = {
  lastProfile = 'Default'
}

local PROFILE_DEFAULTS = {
  minimap = {
    hide = false,
  },
  windowOpen = false,
  waypoints = {},
  nextWaypointId = 1,
  settings = {
    slashCommands = {
      SLASH_APP_LONG = true,
      SLASH_APP_SHORT = true,
      SLASH_SAVE_CURRENT_WAYPOINT_LONG = true,
      SLASH_SAVE_CURRENT_WAYPOINT_SHORT = true,
      SLASH_NEW_WAYPOINT = true,
    },
    navigation = {
      preferTomTom = true,
    },
    collection = {
      titleFont = 'ItemTextFontNormal',
      titleFontHeight = 18,
    },
    pins = {
      persistentMapPins = true,
      defaultMapPinSize = 24,
      defaultMapPinLevel = 1
    }
  }
}

local function applyDefaults(source, target)
  for key, value in pairs(source) do
    if type(value) == 'table' then
      if type(target[key]) ~= 'table' then
        target[key] = {}
      end
      applyDefaults(value, target[key])
    elseif target[key] == nil then
      target[key] = value
    end
  end
end

function Lodestone.ensureDB()
  if not _G[dbName] then
    _G[dbName] = DB_INIT
  end

  if not _G[dbName]['player'][playerProfile] then
    _G[dbName]['player'][playerProfile] = {}
  end

  applyDefaults(PLAYER_DEFAULTS, _G[dbName]['player'][playerProfile])
  applyDefaults(PROFILE_DEFAULTS, _G[dbName]['profile']['Default'])

  Lodestone.DB = _G[dbName]
  Lodestone.playerProfile = playerProfile
  Lodestone.lastProfileName = _G[dbName]['player'][playerProfile]['lastProfile']
  Lodestone.lastProfile = _G[dbName]['profile'][Lodestone.lastProfileName]
  
  return Lodestone.DB
end

Lodestone.ensureDB()