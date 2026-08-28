local _, Lodestone = ...
Lodestone.Util = Lodestone.Util or {}

function Lodestone.Util.trim(s)
   return s:match('^%s*(.-)%s*$')
end

function Lodestone.Util.formatWaypointCoords(waypoint)
  return string.format('%.2f, %.2f', (waypoint.x or 0) * 100, (waypoint.y or 0) * 100)
end

function Lodestone.Util.parseWaypointCoords(str)
  if type(str) ~= 'string' then return nil end
  local x, y = str:match('^%s*(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)%s*$')
  x, y = tonumber(x), tonumber(y)
  if not x or not y then return nil end
  return x / 100, y / 100
end

function Lodestone.Util.hexToRGB(hex)
    hex = hex:gsub('#', '')
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    return r, g, b
end

function Lodestone.Util.normalizeText(text)
  if not text or text == '' then
    return ''
  end
  local norm = text:lower()
  norm = norm:gsub('^%d+%a+%s*', '')
  norm = norm:gsub(' zone light$', '')
  return norm:gsub('[^%w]', '')
end

function Lodestone.Util.findContainingKey(t, needle)
  if not t then return nil end
  for key, entry in pairs(t) do
    local normKey = Lodestone.Util.normalizeText(key)
    if needle:find(normKey, 1, true) then
      return entry
    end
  end
  return nil
end

function Lodestone.Util.applyFontObject(fontString, fontObjectName, fontHeight)
  if not fontString or not fontObjectName then
    return
  end
  local fontObject = _G[fontObjectName]
  if not fontObject then
    return
  end

  local objectType = fontString.GetObjectType and fontString:GetObjectType()
  if objectType == 'EditBox' and fontObject.GetFont and fontString.SetFont then
    local file, size, flags = fontObject:GetFont()
    if file then
      fontString:SetFont(file, fontHeight or size, flags)
    end
  else
    fontString:SetFontObject(fontObjectName)
    if fontHeight and fontString.SetFontHeight then
      fontString:SetFontHeight(fontHeight)
    end
  end

  if fontObject.GetTextColor then
    fontString:SetTextColor(fontObject:GetTextColor())
  end
end

function Lodestone.Util.getWaypointTitleFontColor()
  local fontObjectName = Lodestone.lastProfile.settings.collection.titleFont
  local fontObject = fontObjectName and _G[fontObjectName]
  if fontObject and fontObject.GetTextColor then
    return fontObject:GetTextColor()
  end
  return 1, 1, 1
end

function Lodestone.Util.hookFontObjectColor(frame, fontString, getFontObjectName, getFontHeight)
  local function resolveFontHeight()
    if type(getFontHeight) == 'function' then
      return getFontHeight()
    end
    if type(getFontHeight) == 'number' then
      return getFontHeight
    end
    return nil
  end

  local function sync()
    local fontObjectName = getFontObjectName()
    if not fontObjectName then
      return
    end
    Lodestone.Util.applyFontObject(fontString, fontObjectName, resolveFontHeight())
  end

  sync()
  for _, script in ipairs({ 'OnEnter', 'OnLeave', 'OnMouseDown', 'OnMouseUp', 'OnShow' }) do
    frame:HookScript(script, sync)
  end
end

function Lodestone.Util.randomWaypointName()
  local waypoints = Lodestone.lastProfile.waypoints
  if waypoints then
    local keys = {}
    for k, _ in pairs(waypoints) do
      table.insert(keys, k)
    end
    if keys and #keys > 0 then
      local r = math.random(1, #keys)
      return waypoints[keys[r]].name
    else
      return GetSubZoneText()
    end
  else
    return GetSubZoneText()
  end
end

local function consolidateConfig(entry, config, subItemPrefix)
  local output = {}
  local iterate = config or entry
  for k, v in pairs(iterate) do
    local item = type(entry) == 'string' and entry or entry[k]
    if config[k] ~= '' and type(v) == 'string' then
      output[k] = subItemPrefix and string.format(config[k] .. '%s', subItemPrefix, item) or string.format(config[k], item)
    else
      output[k] = item
    end
  end
  return output
end

function Lodestone.Util.consolidateTables(entries, tbl, config)
  for k, v in pairs(entries) do
    if type(k) == 'number' then
      local entry = config and consolidateConfig(v, config) or v
      table.insert(tbl, entry)

    elseif type(k) == 'string' then
      for _, subItem in pairs(v) do
        local entry = config and consolidateConfig(subItem, config, k) or subItem
        table.insert(tbl, entry)
      end
    end
  end
end