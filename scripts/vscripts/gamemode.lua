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

require('heroes/hero_meepo/update_meepo_boots')
require('itemfunctions')
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

  if hero:GetUnitName() == "npc_dota_hero_pudge" then
    local pudge = hero:FindAbilityByName("pudge_flesh_heap_datadriven")
    pudge:SetLevel(1)
  end

  if hero:GetUnitName() == "npc_dota_hero_queenofpain" then
    local qop = hero:FindAbilityByName("special_bonus_unique_queen_of_pain")
    qop:SetLevel(1)
  end

  if hero:GetUnitName() == "npc_dota_hero_silencer" then
    local int_steal = hero:FindAbilityByName("silencer_int_steal_datadriven")
    int_steal:SetLevel(1)
  end

  -- marks first spawned meepo as meepo prime
  if not self.firstMeepo and hero:GetUnitName() == "npc_dota_hero_meepo" then
    self.firstMeepo = hero
    hero.firstMeepo = true
  end

  -- This line for example will set the starting gold of every hero to 50000 unreliable gold
  -- hero:SetGold(50000, false)
  -- hero:AddExperience(50000, DOTA_ModifyXP_Unspecified, false, true)

  -- These lines will create an item and add it to the player, effectively ensuring they start with the item
  -- local item = CreateItem("item_example_item", hero, hero)
  -- hero:AddItem(item)

  --[[ --These lines if uncommented will replace the W ability of any hero that loads into the game
    --with the "example_ability" ability

  local abil = hero:GetAbilityByIndex(1)
  hero:RemoveAbility(abil:GetAbilityName())
  hero:AddAbility("example_ability")]]
end

--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function GameMode:OnGameInProgress()
  DebugPrint("[BAREBONES] The game has officially begun")

  --[[
  ShowMessage('Map name when called upon in the test client:' .. GetMapName())
  ]]

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

  GameRules:GetGameModeEntity():SetExecuteOrderFilter(Dynamic_Wrap(GameMode, "OrderFilter"), self)

  -- Commands can be registered for debugging purposes or as functions that can be called by the custom Scaleform UI
  Convars:RegisterCommand( "command_example", Dynamic_Wrap(GameMode, 'ExampleConsoleCommand'), "A console command example", FCVAR_CHEAT )

  DebugPrint('[BAREBONES] Done loading Barebones gamemode!\n\n')
end

function GameMode:OrderFilter( filterTable )
  local units = filterTable["units"]
  local orderType = filterTable["order_type"]

  if orderType == DOTA_UNIT_ORDER_DISASSEMBLE_ITEM then
    for _,unitIndex in pairs(units) do
      local unit = EntIndexToHScript(unitIndex)
      if unit:HasModifier("modifier_darkseer_wallofreplica_illusion") then
        return false
      end
    end
  end

  for _,unitIndex in pairs(units) do
    local unit = EntIndexToHScript(unitIndex)
    if unit:GetUnitName() == "npc_dota_hero_meepo" then
      UpdateMeepoBoots(orderType)
    end
  end

  --Return true by default to keep all other orders unchanged
  return true
end


-- This is an example console command
function GameMode:ExampleConsoleCommand()
	DebugPrint( '******* Example Console Command ***************' )
  local cmdPlayer = Convars:GetCommandClient()
  if cmdPlayer then
    local playerID = cmdPlayer:GetPlayerID()
    if playerID ~= nil and playerID ~= -1 then
      -- Do something here for the player who called this command
      PlayerResource:ReplaceHeroWith(playerID, "npc_dota_hero_viper", 1000, 1000)
    end
  end

	DebugPrint( '*********************************************' )
end

function GetVersion()
  return GAME_VERSION
end
