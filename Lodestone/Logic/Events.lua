local _, Lodestone = ...
local L = Lodestone.L

local EVENTS = {
  'ADDON_LOADED',
  'ZONE_CHANGED',
  'ZONE_CHANGED_NEW_AREA',
  'ZONE_CHANGED_INDOORS',
  --'USER_WAYPOINT_UPDATED',
  --'WAYPOINT_UPDATE',
  --'NAVIGATION_DESTINATION_REACHED',
  'PLAYER_ENTERING_WORLD',
}

local EVENT_CONFIG = {
  {
    'ADDON_LOADED',
    func = {
      function() return Lodestone.Init() end,
    }
  },
  {
    'ZONE_CHANGED',
    'ZONE_CHANGED_NEW_AREA',
    'ZONE_CHANGED_INDOORS',
    'PLAYER_ENTERING_WORLD',
    func = {
      function() return Lodestone.UpdateHeaderText() end,
      function() return Lodestone.UpdateSky() end
    }
  }
}

local EVENT_FUNCTIONS = {}

for _, config in pairs(EVENT_CONFIG) do
  for _, item in pairs(config) do
    if type(item) == 'string' then
      EVENT_FUNCTIONS[item] = {}
      for _, func in pairs(config.func) do
        table.insert(EVENT_FUNCTIONS[item], func)
      end
    end
  end
end

for _, event in pairs(EVENTS) do
  Lodestone.Main:RegisterEvent(event)
end

Lodestone.Main:SetScript('OnEvent', function(_, event, name)
  if event == 'ADDON_LOADED' and name ~= Lodestone.name then return end

  local funcs = EVENT_FUNCTIONS[event]
  if funcs then
    for _, func in ipairs(funcs) do func() end
  end
end)

function Lodestone.Init()
  Lodestone.ensureDB()
  if Lodestone.Settings and Lodestone.Settings.update then
    Lodestone.Settings.update()
  end
  Lodestone.Notify(string.format('%s v%s %s', Lodestone.name, Lodestone.version, L.LOADED))
  if Lodestone.Hello ~= '' then Lodestone.Notify(Lodestone.Hello) end
  if Lodestone.Collection.refreshWaypointList then
    Lodestone.Collection.refreshWaypointList()
  end
  if Lodestone.DB and Lodestone.lastProfile and Lodestone.lastProfile.windowOpen then
    Lodestone.Open()
  else
    Lodestone.Main:Hide()
  end
  if Lodestone.devMode then
    Lodestone.DevPrint(Lodestone.name .. ' dev mode loaded.')
    Lodestone.Open()
  end
end