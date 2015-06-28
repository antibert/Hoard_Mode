-- Generated from template

if CHoard_ModeGameMode == nil then
	CHoard_ModeGameMode = class({})
end

gameInitialized = false

-- This library allow for easily delayed/timed actions
require('libraries/timers')

function Precache( context )
	PrecacheUnitByNameSync("npc_dota_creature_gnoll_assassin", context)
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

-- This function is called once and only once when the game completely begins
function CHoard_ModeGameMode:OnGameInProgress()
	print("[HOARDMODE] The game has officially begun")

	Timers:CreateTimer(0, function()
		CHoard_ModeGameMode:SpawnGnolls()
		return 30.0 -- Rerun this timer every 30 game-time seconds 
    end)
end

-- Some basic changes for the game mode

function CHoard_ModeGameMode:SetRules()

	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 5 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
	GameRules:SetUseUniversalShopMode( true )
	GameRules:SetHeroSelectionTime( 30.0 )
	GameRules:SetPreGameTime( 10.0 )
	GameRules:SetPostGameTime( 60.0 )
	GameRules:SetTreeRegrowTime( 60.0 )
	GameRules:SetGoldTickTime( 60.0 )
	GameRules:SetGoldPerTick( 100 )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesOverride( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesVisible( false )
end

function CHoard_ModeGameMode:SpawnGnolls()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_1"):GetAbsOrigin()
	local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
	local units_to_spawn = 10
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point+RandomVector(RandomInt(100,200)), true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end