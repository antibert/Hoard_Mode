-- This is the primary barebones gamemode script and should be used to assist in initializing your game mode


-- Set this to true if you want to see a complete debug output of all events/processes done by barebones
-- You can also change the cvar 'barebones_spew' at any time to 1 or 0 for output/no output
BAREBONES_DEBUG_SPEW = false

if GameMode == nil then
    DebugPrint( '[BAREBONES] creating barebones game mode' )
    _G.GameMode = class({})
end

-- This library allow for easily delayed/timed actions
require('libraries/timers')
-- This library can be used for advancted physics/motion/collision of units.  See PhysicsReadme.txt for more information.
require('libraries/physics')
-- This library can be used for advanced 3D projectile systems.
require('libraries/projectiles')
-- This library can be used for sending panorama notifications to the UIs of players/teams/everyone
require('libraries/notifications')
-- This library can be used for starting customized animations on units from lua
require('libraries/animations')
-- This library can be used for performing "Frankenstein" attachments on units
require('libraries/attachments')


-- These internal libraries set up barebones's events and processes.  Feel free to inspect them/change them if you need to.
require('internal/gamemode')
require('internal/events')

-- settings.lua is where you can specify many different properties for your game mode and is one of the core barebones files.
require('settings')
-- events.lua is where you can specify the actions to be taken when any event occurs and is one of the core barebones files.
require('events')

--[[
  This function should be used to set up Async precache calls at the beginning of the gameplay.

  In this function, place all of your PrecacheItemByNameAsync and PrecacheUnitByNameAsync.  These calls will be made
  after all players have loaded in, but before they have selected their heroes. PrecacheItemByNameAsync can also
  be used to precache dynamically-added datadriven abilities instead of items.  PrecacheUnitByNameAsync will 
  precache the precache{} block statement of the unit and all precache{} block statements for every Ability# 
  defined on the unit.

  This function should only be called once.  If you want to/need to precache more items/abilities/units at a later
  time, you can call the functions individually (for example if you want to precache units in a new wave of
  holdout).

  This function should generally only be used if the Precache() function in addon_game_mode.lua is not working.
]]
function GameMode:PostLoadPrecache()
  DebugPrint("[BAREBONES] Performing Post-Load precache")    
  --PrecacheItemByNameAsync("item_example_item", function(...) end)
  --PrecacheItemByNameAsync("example_ability", function(...) end)

  --PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
  --PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
end

--[[
  This function is called once and only once as soon as the first player (almost certain to be the server in local lobbies) loads in.
  It can be used to initialize state that isn't initializeable in InitGameMode() but needs to be done before everyone loads in.
]]
function GameMode:OnFirstPlayerLoaded()
  DebugPrint("[BAREBONES] First Player has loaded")
end

--[[
  This function is called once and only once after all players have loaded into the game, right as the hero selection time begins.
  It can be used to initialize non-hero player state or adjust the hero selection (i.e. force random etc)
]]
function GameMode:OnAllPlayersLoaded()
  DebugPrint("[BAREBONES] All Players have loaded into the game")

  -------------------------------------------------------------------------------------------------
  -- Add abilities to towers
  -------------------------------------------------------------------------------------------------

  -- Find all friendly buildings on the map
  local buildings = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, Vector(0,0,0), nil, 20000, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_INVULNERABLE, FIND_ANY_ORDER, false)

  -- Iterate through each one
  for _, building in pairs(buildings) do

    -- Parameters
    local building_name = building:GetName()
    DebugPrint(building_name)

    -- Identify the building type
    if string.find(building_name, "tower") then
      building:AddAbility("tower_overpower")
      local tower_overpower = building:FindAbilityByName("tower_overpower")
      tower_overpower:SetLevel(0)

      building:AddAbility("tower_stats")
      local tower_stats = building:FindAbilityByName("tower_stats")
      tower_stats:SetLevel(0)

      building:AddAbility("tower_splash")
      local tower_splash = building:FindAbilityByName("tower_splash")
      tower_splash:SetLevel(0)

    elseif string.find(building_name, "rax_melee") then
      building:AddAbility("building_stats")
      local building_stats = building:FindAbilityByName("building_stats")
      building_stats:SetLevel(0)

    elseif string.find(building_name, "rax_range") then
      building:AddAbility("building_stats")
      local building_stats = building:FindAbilityByName("building_stats")
      building_stats:SetLevel(0)

    elseif string.find(building_name, "fort") then
      DebugPrint("Adding abilities to ancient")
      -- Add passive buff
      building:AddAbility("global_armor_buff")
      local ancient_ability = building:FindAbilityByName("global_armor_buff")
      ancient_ability:SetLevel(1)

      -- Add passive buff
      building:AddAbility("global_offense_buff")
      local ancient_ability = building:FindAbilityByName("global_offense_buff")
      ancient_ability:SetLevel(1)

    elseif string.find(building_name, "fountain") then
      -- Do nothing (fountain was already modified previously)
    else

    end

  end

  -- Find all enemy buildings on the map
  local buildings = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, Vector(0,0,0), nil, 20000, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_INVULNERABLE, FIND_ANY_ORDER, false)

  -- Iterate through each one
  for _, building in pairs(buildings) do

    -- Parameters
    local building_name = building:GetName()
    DebugPrint(building_name)

    -- Identify the building type
    if string.find(building_name, "tower") then
      DebugPrint("Adding abilities to enemy tower")
      -- Add passive buff
      building:AddAbility("reward_global_offense_buff")
      local ancient_ability = building:FindAbilityByName("reward_global_offense_buff")
      ancient_ability:SetLevel(1)

    elseif string.find(building_name, "rax_melee") then
      DebugPrint("Adding abilities to enemy melee rax")
      -- Add passive buff
      building:AddAbility("reward_global_armor_buff")
      local ancient_ability = building:FindAbilityByName("reward_global_armor_buff")
      ancient_ability:SetLevel(1)

    elseif string.find(building_name, "rax_range") then
      DebugPrint("Adding abilities to enemy ranged rax")
      -- Add passive buff
      building:AddAbility("reward_global_armor_buff")
      local ancient_ability = building:FindAbilityByName("reward_global_armor_buff")
      ancient_ability:SetLevel(1)

    elseif string.find(building_name, "fort") then

    elseif string.find(building_name, "fountain") then
      -- Do nothing (fountain was already modified previously)
    else

    end

  end
end

--[[
  This function is called once and only once for every player when they spawn into the game for the first time.  It is also called
  if the player's hero is replaced with a new hero for any reason.  This function is useful for initializing heroes, such as adding
  levels, changing the starting gold, removing/adding abilities, adding physics, etc.

  The hero parameter is the hero entity that just spawned in
]]
function GameMode:OnHeroInGame(hero)
  DebugPrint("[BAREBONES] Hero spawned in game for first time -- " .. hero:GetUnitName())



  if hero:GetUnitName() == "npc_dota_hero_ogre_magi" then
    local multicast = hero:FindAbilityByName("ogre_magi_multicast")
    multicast:SetLevel(1)
  end

  -- This line for example will set the starting gold of every hero to 50000 unreliable gold
  hero:SetGold(50000, false)

  -- These lines will create an item and add it to the player, effectively ensuring they start with the item
  -- local item = CreateItem("item_example_item", hero, hero)
  -- hero:AddItem(item)

  --[[ --These lines if uncommented will replace the W ability of any hero that loads into the game
    --with the "example_ability" ability

  local abil = hero:GetAbilityByIndex(1)
  hero:RemoveAbility(abil:GetAbilityName())
  hero:AddAbility("example_ability")]]
end

require('Spawners')
require('SpawnersMedium')
require('SpawnersHard')
require('SpawnersUltra')
require('Spawners2p')

--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function GameMode:OnGameInProgress()
  DebugPrint("[BAREBONES] The game has officially begun")

  ShowMessage('Map name when called upon in the test client:' .. GetMapName())
  if GetMapName() == 'Horde_5p_easy' then
    Spawners:StartSpawners()
    print(" Loading Easy Map Spawners")
  elseif GetMapName() == 'Horde_4p_medium' then
    SpawnersMedium:StartSpawners()
    print(" Loading Medium Map Spawners")
  elseif GetMapName() == 'Horde_4p_hard' then
    SpawnersHard:StartSpawners()
    print(" Loading Hard Map Spawners")
  elseif GetMapName() == 'Horde_4p_ultra' then
    SpawnersUltra:StartSpawners()
    print(" Loading Ultra Map Spawners")
  elseif GetMapName() == 'Horde_2p_easy' then
    Spawners2p:StartSpawners()
    print(" Loading Two Player Map Spawners")
  end

end



-- This function initializes the game mode and is called before anyone loads into the game
-- It can be used to pre-initialize any values/tables that will be needed later
function GameMode:InitGameMode()
  GameMode = self
  DebugPrint('[BAREBONES] Starting to load Barebones gamemode...')

  -- Call the internal function to set up the rules/behaviors specified in constants.lua
  -- This also sets up event hooks for all event handlers in events.lua
  -- Check out internals/gamemode to see/modify the exact code
  GameMode:_InitGameMode()

  -- Commands can be registered for debugging purposes or as functions that can be called by the custom Scaleform UI
  Convars:RegisterCommand( "command_example", Dynamic_Wrap(GameMode, 'ExampleConsoleCommand'), "A console command example", FCVAR_CHEAT )

  DebugPrint('[BAREBONES] Done loading Barebones gamemode!\n\n')
end

-- This is an example console command
function GameMode:ExampleConsoleCommand()
  print( '******* Example Console Command ***************' )
  local cmdPlayer = Convars:GetCommandClient()
  if cmdPlayer then
    local playerID = cmdPlayer:GetPlayerID()
    if playerID ~= nil and playerID ~= -1 then
      -- Do something here for the player who called this command
      PlayerResource:ReplaceHeroWith(playerID, "npc_dota_hero_viper", 1000, 1000)
    end
  end

  print( '*********************************************' )
end