if Spawner == nil then
  print ( '[Spawner] creating Spawner' )
  Spawner = {}
  Spawner.__index = Spawner

  bottomFriends = {}
  for i=1, 30 do
    bottomFriends[i] = nil
  end

  topFriends = {}
  for i=1, 30 do
    topFriends[i] = nil
  end

  midFriends = {}
  for i=1, 30 do
    midFriends[i] = nil
  end
end

require('libraries/timers')

function Spawner:new( o )
  o = o or {}
  setmetatable( o, Spawner )

  return o
end

function Spawner:Spawn(keys)
  local point = Entities:FindByName(nil, keys.source)
  if point == nil then
    print("Spawner could not find source: " .. keys.source)
    return
  end
  point = point:GetAbsOrigin()

  local waypoint = Entities:FindByName(nil, keys.waypoint)
  if waypoint == nil then
    print("Spawner could not find target: " .. keys.waypoint)
    return
  end
  --waypoint = waypoint:GetAbsOrigin()

  if keys.unit == nil then
    print("Spawner missing unit")
    return
  end

  local order = keys.order
  if order == nil then
    order = DOTA_UNIT_ORDER_ATTACK_MOVE
  end
  local max = keys.max
  local min = keys.min
  local difficulty = 0
  if keys.max == nil then
    max = 1
  end
  local units_to_spawn
  if min == nil then
    units_to_spawn = max
  else
    units_to_spawn = RandomInt(min, max)
  end

  if keys.difficulty ~= nil then
    difficulty = keys.difficulty
  end

  local playerCount = 2
  if keys.players ~= nil then
    playerCount = keys.players
  end

  for i=1,units_to_spawn do
    local unit = CreateUnitByName(keys.unit, point, true, nil, nil, DOTA_TEAM_BADGUYS)
    --print(GameRules:GetGameTime() .. " " .. keys.unit)

    if unit == nil then
      print('Could not create a unit: '.. keys.unit)
    else
      unit.Target = keys.waypoint
      if playerCount < 3 then
        unit:SetBaseMaxHealth(unit:GetBaseMaxHealth() * (0.6 + 0.2 * (playerCount - 1)))
        unit:SetBaseDamageMin(unit:GetBaseDamageMin() * (0.8 + 0.1 * (playerCount - 1)))
        unit:SetBaseDamageMax(unit:GetBaseDamageMax() * (0.8 + 0.1 * (playerCount - 1)))
      elseif playerCount > 3 then
        unit:SetBaseMaxHealth(unit:GetBaseMaxHealth() * (1 + 0.1 * (playerCount - 3)))
      end

      -- Creep Hero spawning rules --
      if unit:IsConsideredHero() then
        unit:SetBaseMaxHealth(unit:GetBaseMaxHealth() * (1 + 0.2 * difficulty))

        if difficulty > 1 then
          unit:AddAbility("roshan_spell_block")
          local roshan_spell_block = unit:FindAbilityByName("roshan_spell_block")
          if roshan_spell_block ~= nil then
            roshan_spell_block:SetLevel(1)
          end
        elseif difficulty == 0 then
          unit:SetBaseDamageMin(unit:GetBaseDamageMin() * 0.8)
          unit:SetBaseDamageMax(unit:GetBaseDamageMax() * 0.8)
        end

      -- Regular Creep spawning rules --
      elseif difficulty > 0 then
        local scaling_chance = 9 + 3 * (difficulty - 1)
        if RollPseudoRandom(scaling_chance, self) then
          unit:SetMaximumGoldBounty(unit:GetMaximumGoldBounty() * 2)
          unit:SetMinimumGoldBounty(unit:GetMinimumGoldBounty() * 2)

          local chance = math.random(60)
          if chance <= 10 then
            unit:AddAbility("darkness_aura")
            local darkness_aura = unit:FindAbilityByName("darkness_aura")
            if darkness_aura ~= nil then
              darkness_aura:SetLevel(1)
            end
          elseif chance > 10 and chance <= 20 then
            unit:AddAbility("blight_aura")
            local blight_aura = unit:FindAbilityByName("blight_aura")
            if blight_aura ~= nil then
              blight_aura:SetLevel(1)
            end
          elseif chance > 20 and chance <= 30 then
            unit:AddAbility("frenzy_aura")
            local frenzy_aura = unit:FindAbilityByName("frenzy_aura")
            if frenzy_aura ~= nil then
              frenzy_aura:SetLevel(1)
            end
          elseif chance > 30 and chance <= 40 then
            unit:AddAbility("apathy_aura")
            local apathy_aura = unit:FindAbilityByName("apathy_aura")
            if apathy_aura ~= nil then
              apathy_aura:SetLevel(1)
            end
          elseif chance > 40 and chance <= 50 then
            unit:AddAbility("stupor_aura")
            local stupor_aura = unit:FindAbilityByName("stupor_aura")
            if stupor_aura ~= nil then
              stupor_aura:SetLevel(1)
            end
          elseif chance > 50 and chance <= 60 then
            unit:AddAbility("corruption_aura")
            local corruption_aura = unit:FindAbilityByName("corruption_aura")
            if corruption_aura ~= nil then
              corruption_aura:SetLevel(1)
            end
          end
        end
      end

      unit:SetInitialGoalEntity(waypoint)
    end
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

function Spawner:SpawnFriend(keys)
  local pointEntity = keys.point
  local waypointEntity = keys.waypoint
  local lane = keys.lane
  local unit = keys.unit
  local max_spawn = keys.max_spawn
  --local meleeBarracksEntity = "good_rax_melee_mid"
  --local rangedBarracksEntity = "good_rax_range_mid"
  local meleeLevel = _G.GameMode.BarracksMidMeleeLvl
  local rangedLevel = _G.GameMode.BarracksMidRangedLvl
  local unitArray = midFriends

  if lane == "top" then
    --meleeBarracksEntity = "good_rax_melee_top"
    --rangedBarracksEntity = "good_rax_range_top"
    meleeLevel = _G.GameMode.BarracksTopMeleeLvl
    rangedLevel = _G.GameMode.BarracksTopRangedLvl
    unitArray = topFriends
  elseif lane == "bot" then
    --meleeBarracksEntity = "good_rax_melee_bot"
    --rangedBarracksEntity = "good_rax_range_bot"
    meleeLevel = _G.GameMode.BarracksBotMeleeLvl
    rangedLevel = _G.GameMode.BarracksBotRangedLvl
    unitArray = bottomFriends
  end

  local point = Entities:FindByName(nil, pointEntity):GetAbsOrigin()
  local waypoint = Entities:FindByName(nil, waypointEntity):GetAbsOrigin() 
  local spawned_units = 0
  local extra_spawn = 0

  --[[local melee_barracks = Entities:FindByName(nil, meleeBarracksEntity)
  if melee_barracks ~= nil then
    local building_stats = melee_barracks:FindAbilityByName("building_stats")
    if building_stats ~= nil then
      max_spawn = max_spawn + math.floor(building_stats:GetLevel() / 2)

      if building_stats:GetLevel() > 9 then
        extra_spawn = 2
      elseif building_stats:GetLevel() > 4 then
        extra_spawn = 1
      end
    end
  end--]]

  max_spawn = max_spawn + math.floor(meleeLevel / 2)
  if meleeLevel > 9 then
    extra_spawn = 2
  elseif meleeLevel > 4 then
    extra_spawn = 1
  end

  --[[local ranged_barracks = Entities:FindByName(nil, rangedBarracksEntity)
  local unit_level = 0
  if ranged_barracks ~= nil then
    local ranged_building_stats = ranged_barracks:FindAbilityByName("building_stats")
    if ranged_building_stats ~= nil then
      unit_level = ranged_building_stats:GetLevel()
    end
  end--]]

  local unit_level = 0
  unit_level = rangedLevel

  for j=1, max_spawn do
    if spawned_units > extra_spawn then
      break
    end
    if unitArray[j] ~= nil then
      if unitArray[j]:IsNull() == true then
        unitArray[j] = nil
      end
    end
    if unitArray[j] == nil then
      Timers:CreateTimer(function()
        unitArray[j] = CreateUnitByName(unit, point, true, nil, nil, DOTA_TEAM_GOODGUYS)
        -- for testing purposes
        -- bottomFriends[j]:SetMaxHealth(100)
        if unit_level > 0 then
          unitArray[j]:CreatureLevelUp(unit_level)
        end

        unitArray[j].targetWaypoint = waypointEntity

        ExecuteOrderFromTable({	UnitIndex = unitArray[j]:GetEntityIndex(),
          OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
          Position = waypoint, Queue = true} )
        DebugPrint("Move ",unitArray[j]:GetEntityIndex()," to ", waypoint)
        DebugPrint("Friendly ".. lane .. " creep spawned at index: " .. tostring(j))
      end)
      spawned_units = spawned_units + 1
    end
  end
end