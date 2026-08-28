local _, Lodestone = ...
local L = Lodestone.L

local transitionTime = 0.1

function Lodestone.Open()
  local main = Lodestone.Main
  main:SetAlpha(0)
  main:Show()
  UIFrameFadeIn(main, transitionTime, 0, 1)
  if Lodestone.DB and Lodestone.lastProfile then
    Lodestone.lastProfile.windowOpen = true
  end
  if Lodestone.Header.refreshAutoWaypointFields then
    Lodestone.Header.refreshAutoWaypointFields()
  end
  if Lodestone.UpdateSky then
    Lodestone.UpdateSky()
  end
end

function Lodestone.Close()
  local main = Lodestone.Main
  UIFrameFadeOut(main, transitionTime, main:GetAlpha(), 0)
  C_Timer.After(transitionTime, function() main:Hide() main:SetAlpha(1) end)
  if Lodestone.DB and Lodestone.lastProfile then
    Lodestone.lastProfile.windowOpen = false
  end
end

function Lodestone.ToggleUI()
  local main = Lodestone.Main
  if main:IsShown() then
    Lodestone.Close()
  else
    Lodestone.Open()
  end
end

function Lodestone.GetPlayerPosition()
  local mapId = C_Map.GetBestMapForUnit('player')
  if mapId then
    local pos = C_Map.GetPlayerMapPosition(mapId, 'player')
    if pos then
      local x, y = pos:GetXY()
      return mapId, x, y
    end
  end
end

function Lodestone.ChatWaypoint(id)
  local waypoint = id and Lodestone.GetWaypointById(id)
  if not waypoint or not C_Map or not C_Map.GetUserWaypointHyperlink then
    Lodestone.Notify(L.NO_WAYPOINT_TO_CHAT)
    return false
  end

  if not Lodestone.ActivateWaypoint(id) then
    Lodestone.Notify(L.NO_WAYPOINT_TO_CHAT)
    return false
  end

  local hyperlink = C_Map.GetUserWaypointHyperlink()
  if not hyperlink then
    Lodestone.Notify(L.NO_WAYPOINT_TO_CHAT)
    return false
  end

  if ChatEdit_InsertLink and ChatEdit_InsertLink(hyperlink) then
    return true
  end

  local editBox = ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow()
  if not editBox and ChatEdit_ChooseBoxForSend then
    editBox = ChatEdit_ChooseBoxForSend()
  end
  if editBox then
    if ChatEdit_ActivateChat then
      ChatEdit_ActivateChat(editBox)
    end
    editBox:Insert(hyperlink)
    return true
  end

  Lodestone.Notify(L.NO_WAYPOINT_TO_CHAT)
  return false
end

function Lodestone.ActivateWaypoint(id)
  local waypoint = Lodestone.GetWaypointById(id)
  if not waypoint then
    Lodestone.Notify(L.NO_SAVED_WAYPOINT)
    return
  end
  if waypoint.mapId and C_Map.CanSetUserWaypointOnMap(waypoint.mapId) and waypoint.x < 1 and waypoint.y < 1 then
    return Lodestone.Navigation.setWaypoint(waypoint.mapId, waypoint.x, waypoint.y, waypoint.name)
  else
    Lodestone.NotifyCannotSetWaypoint(waypoint.mapId, waypoint.x, waypoint.y)
  end
end

---@class TooltipLine
---@field text string Added line text
---@field r? number Red value 0-1
---@field g? number Green value 0-1
---@field b? number Blue value 0-1
---@field wrapText? boolean Wrap text

---@class TooltipTexture
---@field file FileDataID|string
---@field info? TooltipTextureInfo

---@alias TooltipFontStrings [ FontString, FontString ] Left and right font strings

---@class TooltipOptions
---@field text string Tooltip text
---@field r? number 0-1
---@field g? number 0-1
---@field b? number 0-1
---@field alpha? number 0-1
---@field wrapText? boolean Wrap text
---@field lines? string[]|TooltipLine[]
---@field textures? string[]|TooltipTexture[]
---@field fontStrings? TooltipFontStrings[]

---@param element Frame Element on hover
---@param tooltip string|TooltipOptions Tooltip text or options
function Lodestone:SetTooltip(element, tooltip)
  local d = Lodestone.CONFIG.DEFAULT_TOOLTIP
  ---@diagnostic disable-next-line
  element.LodestoneTooltipData = tooltip

  element:SetScript('OnEnter', function(self)
    local data = self.LodestoneTooltipData
    GameTooltip:SetOwner(self, 'ANCHOR_TOP')

    if type(data) == 'string' then
      GameTooltip:SetText(data or d.text, d.r, d.g, d.b, d.alpha, d.wrapText)
    else
      GameTooltip:SetText(data.text or d.text, data.r or d.r, data.g or d.g, data.b or d.b, data.alpha or d.alpha, data.wrapText or d.wrapText)
      if data.lines then
        for _, line in ipairs(data.lines) do
          if type(line) == 'string' then
            GameTooltip:AddLine(line)
          else
            GameTooltip:AddLine(line.text or d.line.text, line.r or d.line.r, line.g or d.line.g, line.b or d.line.b, line.wrapText or d.line.wrapText)
          end
        end
      end

      if data.textures then
        for _, texture in ipairs(data.textures) do
          if type(texture) == 'string' then
            -- Note: AddTexture takes both a texture and an info object
            ---@diagnostic disable-next-line
            GameTooltip:AddTexture(texture, d.texture.info)
          else
            ---@diagnostic disable-next-line
            GameTooltip:AddTexture(texture.file, texture.info or d.texture.info)
          end
        end
      end
      if data.fontStrings then
        for _, fontString in ipairs(data.fontStrings) do
          GameTooltip:AddFontStrings(fontString)
        end
      end
    end
    GameTooltip:Show()
  end)

  element:SetScript('OnLeave', function(self)
    GameTooltip:Hide()
  end)
end

_G.LodestoneAPI = {
  GetWaypoints = function() return Lodestone.GetWaypoints() end,
  GetWaypointById = function(id) return Lodestone.GetWaypointById(id) end,
  ActivateWaypoint = function(id) return Lodestone.ActivateWaypoint(id) end,
  ClearWaypoint = function() return Lodestone.ClearWaypoint(true) end,
  SaveWaypoint = function(mapId, x, y, name, description) return Lodestone.SaveWaypoint(mapId, x, y, name, description) end,
  SaveCurrentWaypoint = function(name, description) return Lodestone.SaveCurrentWaypoint(name, description) end,
  DeleteWaypoint = function(id) return Lodestone.DeleteWaypoint(id) end,
  UpdateWaypoint = function(id, name, description, mapId, coords, nameColor) return Lodestone.UpdateWaypoint(id, name, description, mapId, coords, nameColor) end,
  GetPlayerPosition = function() return Lodestone.GetPlayerPosition() end,
  Open = function() return Lodestone.Open() end,
  Close = function() return Lodestone.Close() end,
  ChatWaypoint = function(id) return Lodestone.ChatWaypoint(id) end,
}