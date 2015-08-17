-- Generated from template

if CHoard_ModeGameMode == nil then
	CHoard_ModeGameMode = class({})
end

gameInitialized = false

require('spawners')

function Precache( context )
	PrecacheResource( "particle_folder", "particles/frostivus_gameplay", context )
    PrecacheItemByNameSync("item_king_rapier", context)
	PrecacheUnitByNameSync("npc_dummy_blank", context)	
	PrecacheUnitByNameSync("npc_dota_creature_ancient_apparition", context)
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
	PrecacheUnitByNameSync("npc_dota_creature_king_treant", context)
	PrecacheUnitByNameSync("npc_dota_creature_forest_prophet", context)
	PrecacheUnitByNameSync("npc_dota_creature_treant", context)
	PrecacheUnitByNameSync("npc_dota_creature_large_spirit_bear", context)
	PrecacheUnitByNameSync("npc_dota_creature_small_spirit_bear", context)
	PrecacheUnitByNameSync("npc_dota_creature_big_bear", context)
	PrecacheUnitByNameSync("npc_dota_splitter_c", context)
    PrecacheUnitByNameSync("npc_dota_creature_fuck_you", context)
    PrecacheUnitByNameSync("npc_dota_creature_bazz", context)
    PrecacheUnitByNameSync("npc_dota_creature_ogre", context)
	PrecacheUnitByNameSync("npc_dota_creature_cool_spiders", context)
	PrecacheUnitByNameSync("npc_dota_creature_mini_spiders", context)
	PrecacheUnitByNameSync("npc_dota_creature_big_spiders", context)
	PrecacheUnitByNameSync("npc_dota_demon", context)
	PrecacheUnitByNameSync("npc_dota_demon_dog", context)
	PrecacheUnitByNameSync("npc_dota_creature_thing", context)
	PrecacheUnitByNameSync("npc_dota_creature_shroom", context)
    PrecacheUnitByNameSync("npc_dota_creature_stump", context)	
	PrecacheUnitByNameSync("npc_dota_creature_fang", context)
	PrecacheUnitByNameSync("npc_dota_ghost_meele", context)
	PrecacheUnitByNameSync("npc_dota_ghost", context)
	PrecacheUnitByNameSync("npc_dota_rhino", context)
	PrecacheUnitByNameSync("npc_dota_hellbear", context)
	PrecacheUnitByNameSync("npc_dota_dragon", context)
	PrecacheUnitByNameSync("npc_dota_stalker", context)
	PrecacheUnitByNameSync("npc_dota_mini_demon", context)
	PrecacheUnitByNameSync("npc_dota_creature_beast", context)
	PrecacheUnitByNameSync("npc_dota_centaur_boss", context)
    PrecacheUnitByNameSync("npc_dota_centaur", context)
	PrecacheUnitByNameSync("npc_dota_hero_venomancer_holdout", context)
	PrecacheUnitByNameSync("npc_dota_nyx", context)
	PrecacheUnitByNameSync("npc_dota_roshan_mob", context)
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
	PlayerResource:SetCustomTeamAssignment( 0, DOTA_TEAM_GOODGUYS )
    GameRules:SetCustomGameSetupTimeout( 0 )
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
	
	self.m_VictoryMessages = {}
	self.m_VictoryMessages[DOTA_TEAM_BADGUYS]  = "#VictoryMessage_BadGuys"
	self.m_VictoryMessages[DOTA_TEAM_GOODGUYS]  = "#VictoryMessage_GoodGuys"

	
	
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 5 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
	GameRules:SetUseUniversalShopMode( true )
	GameRules:SetHeroSelectionTime( 34.0 )
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
	GameRules:GetGameModeEntity():SetCameraDistanceOverride( 1300 )	
end

-- This function is called once and only once when the game begins

function CHoard_ModeGameMode:OnGameInProgress()
	print("[HOARDMODE] The game has officially begun")
	Spawners:StartSpawners()
end