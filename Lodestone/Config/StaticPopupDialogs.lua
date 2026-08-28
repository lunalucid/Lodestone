local _, Lodestone = ...
local L = Lodestone.L

StaticPopupDialogs['LODESTONE_DELETE_WAYPOINT'] = {
  text = CONFIRM_COMPACT_UNIT_FRAME_PROFILE_DELETION,
  button1 = DELETE,
  button2 = CANCEL,
  OnAccept = function(_, data)
    Lodestone.DeleteWaypoint(data.id)
    if Lodestone.Collection.refreshWaypointList then
      Lodestone.Collection.refreshWaypointList()
    end
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,
}

StaticPopupDialogs['LODESTONE_DELETE_ALL'] = {
  text = L.CONFIRM_DELETE_ALL,
  button1 = L.DELETE_ALL,
  button2 = CANCEL,
  OnAccept = function()
    Lodestone.DeleteAllWaypoints()
    if Lodestone.Collection.refreshWaypointList then
      Lodestone.Collection.refreshWaypointList()
    end
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,
}