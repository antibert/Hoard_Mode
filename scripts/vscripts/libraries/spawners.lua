if Spawner == nil then
  print ( '[Spawner] creating Spawner' )
  Spawner = {}
  Spawner.__index = Spawner
end

require('libraries/timers')

function Spawner:new( o )
  o = o or {}
  setmetatable( o, Spawner )
  return o
end

function Spawner:Spawn(keys)
  local point = Entities:FindByName(nil, keys.source):GetAbsOrigin()
  local waypoint = Entities:FindByName(nil, keys.waypoint):GetAbsOrigin()
  local order = keys.order
  if order == nil then
    order = DOTA_UNIT_ORDER_ATTACK_MOVE
  end
  local max = keys.max
  local min = keys.min
  if keys.max == nil then
    max = 1
  end
  local units_to_spawn
  if min == nil then
    units_to_spawn = max
  else
    units_to_spawn = RandomInt(min, max)
  end

  for i=1,units_to_spawn do
    local unit = CreateUnitByName(keys.unit, point, true, nil, nil, DOTA_TEAM_BADGUYS)
    ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
      OrderType = order,
      Position = waypoint, Queue = true} )
    print("Move ",unit:GetEntityIndex()," to ", waypoint)
  end
end

function Spawner:SpawnTimer(keys)
  local start = keys.start

  if start == nil then
    start = 0
  end

  local finish = keys.finish
  local interval = keys.interval

  local spawn = keys.spawn

  Timers:CreateTimer(start, function()
    if type(spawn) == "function" then
      spawn()
    else
      Spawner:Spawn(spawn)
    end
    local nextCall = interval
    if finish ~= nil and GameRules:GetGameTime() > finish then
        nextCall = nil
    end
    return nextCall
  end)
end