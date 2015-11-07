-- Generated from template

if CHoard_ModeGameMode == nil then
	CHoard_ModeGameMode = class({})
end

gameInitialized = false

require('Spawners')
require('SpawnersMedium')
require('SpawnersHard')
require('SpawnersUltra')
require('Spawners2p')

function Precache( context )
	PrecacheResource( "particle_folder", "particles/frostivus_gameplay", context )
	PrecacheItemByNameSync("item_bag_of_gold", context )
    PrecacheItemByNameSync("item_king_rapier", context)
    PrecacheItemByNameSync("item_bloodstone_datadriven", context)
    PrecacheItemByNameSync("item_death_stone", context)
    PrecacheItemByNameSync("item_travel_boots_3", context)	
    PrecacheItemByNameSync("item_boots_of_strength", context)	
    PrecacheItemByNameSync("item_boots_of_agility", context)	
    PrecacheItemByNameSync("item_boots_of_intellect", context)
    PrecacheItemByNameSync("item_bfury_datadriven", context)
    PrecacheItemByNameSync("item_lithe_boots", context)		
    PrecacheItemByNameSync("item_horde_ethereal_blade", context)
    PrecacheItemByNameSync("item_horde_ghost", context)
    PrecacheItemByNameSync("item_hoard_dagon", context)
	PrecacheUnitByNameSync("npc_dummy_blank", context)	
	PrecacheUnitByNameSync("npc_dota_creature_ancient_apparition", context)
	PrecacheUnitByNameSync("npc_dota_creature_map_boss", context)
	PrecacheUnitByNameSync("npc_dota_gargoyle", context)
	PrecacheUnitByNameSync("npc_dota_creature_gnoll_assassin", context)
	PrecacheUnitByNameSync("npc_dota_creature_kobold_ripper", context)
	PrecacheUnitByNameSync("npc_dota_creature_kobold_guard", context)
	PrecacheUnitByNameSync("npc_dota_creature_troll_healer", context)
	PrecacheUnitByNameSync("npc_dota_medium_spiders", context)
	PrecacheUnitByNameSync("npc_dota_creature_spiderling", context)
	PrecacheUnitByNameSync("npc_dota_creature_basic_zombie", context)
	PrecacheUnitByNameSync("npc_dota_creature_berserk_zombie", context)
	PrecacheUnitByNameSync("npc_dota_creature_corpselord", context)
	PrecacheUnitByNameSync("npc_dota_creature_roshan_boss", context)
	PrecacheUnitByNameSync("npc_dota_creature_ogre_melee", context)
    PrecacheUnitByNameSync("npc_dota_creature_ogre_boss", context)
	PrecacheUnitByNameSync("npc_dota_creature_satyr", context)
    PrecacheUnitByNameSync("npc_dota_creature_medium_satyr", context)
	PrecacheUnitByNameSync("npc_dota_creature_big_satyr", context)
    PrecacheUnitByNameSync("npc_dota_creature_spooki", context)
	PrecacheUnitByNameSync("npc_dota_creature_drake", context)
	PrecacheUnitByNameSync("npc_dota_creature_chicken", context)
	PrecacheUnitByNameSync("npc_dota_creature_big_nyx", context)
	PrecacheUnitByNameSync("npc_dota_creature_king_treant", context)
	PrecacheUnitByNameSync("npc_dota_creature_forest_prophet", context)
	PrecacheUnitByNameSync("npc_dota_creature_treant", context)
	PrecacheUnitByNameSync("npc_dota_creature_lesser_nightcrawler", context)
	PrecacheUnitByNameSync("npc_dota_creature_large_spirit_bear", context)
	PrecacheUnitByNameSync("npc_dota_creature_small_spirit_bear", context)
	PrecacheUnitByNameSync("npc_dota_creature_small_spirit_bear_easy", context)
	PrecacheUnitByNameSync("npc_dota_creature_big_bear", context)
	PrecacheUnitByNameSync("npc_dota_splitter_c", context)
    PrecacheUnitByNameSync("npc_dota_creature_fuck_you", context)
    PrecacheUnitByNameSync("npc_dota_creature_bazz", context)
    PrecacheUnitByNameSync("npc_dota_creature_ogre", context)
	PrecacheUnitByNameSync("npc_dota_creature_cool_spiders", context)
	PrecacheUnitByNameSync("npc_dota_creature_mini_spiders", context)
	PrecacheUnitByNameSync("npc_dota_creature_big_spiders", context)
	PrecacheUnitByNameSync("npc_dota_creature_kobold_guard_boss", context)
	PrecacheUnitByNameSync("npc_dota_demon", context)
	PrecacheUnitByNameSync("npc_dota_demon_dog", context)
	PrecacheUnitByNameSync("npc_dota_creature_thing", context)
	PrecacheUnitByNameSync("npc_dota_creature_hound", context)
	PrecacheUnitByNameSync("npc_dota_wolf_fang", context)
	PrecacheUnitByNameSync("npc_dota_wolf_fang_easy", context)
	PrecacheUnitByNameSync("npc_dota_creature_rabid", context)
	PrecacheUnitByNameSync("npc_dota_creature_pack_leader", context)
	PrecacheUnitByNameSync("npc_dota_creature_great_hound", context)
	PrecacheUnitByNameSync("npc_dota_creature_king_wolf", context)	
	PrecacheUnitByNameSync("npc_dota_creature_big_ghost", context)	
	PrecacheUnitByNameSync("npc_dota_creature_shroom", context)
    PrecacheUnitByNameSync("npc_dota_creature_stump", context)	
	PrecacheUnitByNameSync("npc_dota_creature_fang", context)
	PrecacheUnitByNameSync("npc_dota_ghost_meele", context)
	PrecacheUnitByNameSync("npc_dota_ghost_meele2", context)
	PrecacheUnitByNameSync("npc_dota_ghost", context)
	PrecacheUnitByNameSync("npc_dota_rhino", context)
	PrecacheUnitByNameSync("npc_dota_hellbear", context)
	PrecacheUnitByNameSync("npc_dota_dragon", context)
	PrecacheUnitByNameSync("npc_dota_stalker", context)
	PrecacheUnitByNameSync("npc_dota_mini_demon", context)
	PrecacheUnitByNameSync("npc_dota_creature_beast", context)
	PrecacheUnitByNameSync("npc_dota_centaur_boss", context)
	PrecacheUnitByNameSync("npc_dota_hero_venomancer_holdout", context)
	PrecacheUnitByNameSync("npc_dota_nyx", context)
	PrecacheUnitByNameSync("npc_dota_roshan_mob", context)
	PrecacheUnitByNameSync("npc_dota_creature_mini_roshan", context)
	PrecacheUnitByNameSync("npc_dota_ghost_bane", context)
	PrecacheUnitByNameSync("npc_dota_creature_big_bird", context)
	
	end
	
-- Create the game mode when we activate
function Activate()
	GameRules.Hoard_Mode = CHoard_ModeGameMode()
	GameRules.Hoard_Mode:InitGameMode()
	GameRules.Hoard_Mode:SetRules()
end

function CHoard_ModeGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )	
end

-- Evaluate the state of the game
function CHoard_ModeGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		if gameInitialized == false then
			CHoard_ModeGameMode:OnGameInProgress()
			gameInitialized = true
		end
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

-- Some basic rules for the game mode

function CHoard_ModeGameMode:SetRules()
	
	GameRules:EnableCustomGameSetupAutoLaunch( true )
    GameRules:SetCustomGameSetupAutoLaunchDelay( 0 )	
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 5 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
	GameRules:SetUseUniversalShopMode( true )
	GameRules:SetHeroSelectionTime( 60.0 )
	GameRules:SetPreGameTime( 23.0 )
	GameRules:SetPostGameTime( 120.0 )
	GameRules:SetTreeRegrowTime( 60.0 )
	GameRules:SetGoldTickTime( 0.6 )
	GameRules:SetGoldPerTick( 1 )
	GameRules:GetGameModeEntity():SetLoseGoldOnDeath( false )
	GameRules:GetGameModeEntity():SetRuneEnabled( 0, true ) --Double Damage
	GameRules:GetGameModeEntity():SetRuneEnabled( 1, true ) -- haste rune
	GameRules:GetGameModeEntity():SetRuneEnabled( 2, true ) -- illu
	GameRules:GetGameModeEntity():SetRuneEnabled( 3, false ) --Invis Rune
	GameRules:GetGameModeEntity():SetRuneEnabled( 4, true ) --Regen
	GameRules:GetGameModeEntity():SetRuneEnabled( 5, true ) --Bounty
	GameRules:GetGameModeEntity():SetFixedRespawnTime(23)
	GameRules:GetGameModeEntity():SetFountainPercentageHealthRegen( 4 )
	GameRules:GetGameModeEntity():SetFountainPercentageManaRegen( 6 )
	GameRules:GetGameModeEntity():SetFountainConstantManaRegen( 1 )	
end

-- This function is called once and only once when the game begins

function CHoard_ModeGameMode:OnGameInProgress()
	print("[HOARDMODE] The game has officially begun")
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