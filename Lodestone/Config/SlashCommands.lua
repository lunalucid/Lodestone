local _, Lodestone = ...
local SlashCmdList = _G.SlashCmdList
local L = Lodestone.L

local setting = Lodestone.lastProfile.settings.slashCommands
local baseName = Lodestone.nameStripped
local firstLetter = string.sub(baseName, 1, 1)

_G['SLASH_APP_LONG1'] = '/' .. baseName
_G['SLASH_APP_SHORT1'] = '/' .. firstLetter:upper()
_G['SLASH_SAVE_CURRENT_WAYPOINT_LONG1'] = '/savehere'
_G['SLASH_SAVE_CURRENT_WAYPOINT_SHORT1'] = '/sh'
_G['SLASH_NEW_WAYPOINT1'] = '/new'

local function toggleUISlash(settingVar)
  if settingVar then
    Lodestone.ToggleUI()
  end
end

local function saveCurrentWaypoint(settingVar)
  if settingVar then
    Lodestone.SaveCurrentWaypoint(Lodestone.Header.defaultWaypointName(), Lodestone.Header.defaultWaypointDescription())
  end
end


SlashCmdList['APP_LONG'] = function() toggleUISlash(setting.SLASH_APP_LONG) end
SlashCmdList['APP_SHORT'] = function() toggleUISlash(setting.SLASH_APP_SHORT) end
SlashCmdList['SAVE_CURRENT_WAYPOINT_LONG'] = function() saveCurrentWaypoint(setting.SAVE_CURRENT_WAYPOINT) end
SlashCmdList['SAVE_CURRENT_WAYPOINT_SHORT'] = function() saveCurrentWaypoint(setting.SAVE_CURRENT_WAYPOINT) end

local function parseMsgToWaypoint(msg)
  local mapId = msg:match('#%d*') or nil
  if mapId then
    mapId = mapId:gsub('#', '')
    msg = msg:gsub(mapId, ''):gsub('#', '')
  end
  local x, y = msg:match('(%d+%.?%d*)[,%s](%d+%.?%d*)')
  if not x or not y then
    Lodestone.Notify(string.format('%s. %s', L.COULD_NOT_PARSE_COORDS, string.format(L.SLASH_TT3, _G['SLASH_NEW_WAYPOINT1'])))
    return
  end
  x, y = tonumber(x) / 100, tonumber(y) / 100
  msg = msg:gsub(x, ''):gsub(y, '')

  local name = msg:match('%s+(.-)%s*%-') or msg:match('%s+(.+)$')
  msg = msg:gsub(name, '')
  local description = msg:match('%-d%s+(.+)$')
  if name then name = name:gsub('(%d+%.?%d*)[,%s](%d+%.?%d*)', ''):gsub('%s', '', 1); if name == '' then name = nil end end
  if description then description = description:gsub('%s+$', '') end

  Lodestone.SaveWaypoint(tonumber(mapId), x, y, name, description)
end

SlashCmdList['NEW_WAYPOINT'] = function(msg)
  --[[local slashSep = string.format('[^%s]+', _G['SLASH_NEW_WAYPOINT1'])
  if msg:gmatch(slashSep) then
    for item in msg:gmatch(slashSep) do
      local cleaned = item:gsub(slashSep, '')
      --parseMsgToWaypoint(cleaned)
    end
  else]]
    for item in msg:gmatch('[^,]+') do
      parseMsgToWaypoint(item)
    end
  --end
end