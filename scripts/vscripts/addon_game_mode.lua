-- Generated from template

if CHoard_ModeGameMode == nil then
	CHoard_ModeGameMode = class({})
end

gameInitialized = false

require('spawners')

function Precache( context )
	PrecacheUnitByNameSync("npc_dota_creature_gnoll_assassin", context)
	PrecacheUnitByNameSync("npc_dota_creature_kobold_ripper", context)
	PrecacheUnitByNameSync("npc_dota_creature_spiderling", context)
	PrecacheUnitByNameSync("npc_dota_creature_basic_zombie", context)
	PrecacheUnitByNameSync("npc_dota_creature_berserk_zombie", context)
	PrecacheUnitByNameSync("npc_dota_creature_roshan_boss", context)
    PrecacheUnitByNameSync("npc_dota_creature_ogre_boss", context)
    PrecacheUnitByNameSync("npc_dota_creature_medium_satyr", context)
	
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

	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 5 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
	GameRules:SetUseUniversalShopMode( true )
	GameRules:SetHeroSelectionTime( 30.0 )
	GameRules:SetPreGameTime( 15.0 )
	GameRules:SetPostGameTime( 60.0 )
	GameRules:SetTreeRegrowTime( 60.0 )
	GameRules:SetGoldTickTime( 0.6 )
	GameRules:SetGoldPerTick( 1 )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesOverride( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesVisible( false )
end

-- This function is called once and only once when the game begins

function CHoard_ModeGameMode:OnGameInProgress()
	print("[HOARDMODE] The game has officially begun")
	Spawners.StartSpawners()
end