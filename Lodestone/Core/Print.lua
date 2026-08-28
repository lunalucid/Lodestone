local _, Lodestone = ...
local L = Lodestone.L

local printPrefix = Lodestone.COLOR.MAIN:WrapTextInColorCode(string.format('[%s]', Lodestone.name))

function Lodestone.Error(text)
  local errorMessage = RED_FONT_COLOR:WrapTextInColorCode('(ERROR) ' .. text)
  print(printPrefix, errorMessage)
  _G.geterrorhandler()(errorMessage)
end

function Lodestone.DevPrint(text)
  if Lodestone.devMode then
    local prefix = Lodestone.COLOR.DEV:WrapTextInColorCode(string.format('[%s]', Lodestone.name))
    local message = Lodestone.COLOR.DEV_MESSAGE:WrapTextInColorCode('(DEV) ' .. text)
    print(prefix, message)
  end
end

function Lodestone.DevDump(tbl, prefix)
  prefix = prefix or 'Dev Dump:'
  if Lodestone.devMode then
    Lodestone.DevPrint(prefix)
    local keys = {}
    for k in pairs(tbl) do
      table.insert(keys, k)
    end
    
    table.sort(keys, function(a, b)
      if type(a) ~= type(b) then
        return tostring(a) < tostring(b)
      end
      return a < b
    end)

    for _, k in ipairs(keys) do
      local v = tbl[k]
      print(string.format("%s = %s", tostring(k), tostring((v))))
    end
  end
end

function Lodestone.Notify(text, color)
  color = color or Lodestone.COLOR.NOTIFICATION
  local message = color:WrapTextInColorCode(text)
  return print(printPrefix, message)
end

function Lodestone.NotifySavedWaypoint(name, x, y)
  local waypoint = { x = x, y = y}
  local formattedWaypoint = Lodestone.Util.formatWaypointCoords(waypoint)
  local prefix = string.format('%s: %s (%s)', L.WAYPOINT, name or L.WAYPOINT, formattedWaypoint)
  local suffix = string.lower(_G.HOUSING_BLUEPRINT_EXPORT_NAME_SAVED_FMT)
  Lodestone.Notify(string.format(suffix, prefix))
end