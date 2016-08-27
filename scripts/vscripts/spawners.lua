if Spawners == nil then
	Spawners = class({})
end

require('SpawnTimers')
require('libraries/spawners')

--------------------------- Gnolls

function Spawners:SpawnGnollsTop()
	return {
		source =  "spawner3",
		waypoint = "lane_top_pathcorner_badguys_4",
		unit = "npc_dota_creature_gnoll_assassin",
		min = 5,
		max = 7
	}
end

function Spawners:SpawnGnollsMid()
	return {
		source =  "spawner1",
		waypoint = "lane_mid_pathcorner_badguys_7",
		unit = "npc_dota_creature_gnoll_assassin",
		min = 5,
		max = 7
	}
end

function Spawners:SpawnGnollsBot()
	return {
		source =  "spawner2",
		waypoint = "lane_bot_pathcorner_badguys_4",
		unit = "npc_dota_creature_gnoll_assassin",
		min = 5,
		max = 7
	}
end

--------------------------- Bazz

function Spawners:SpawnBazzTop()
	return {
		source =  "spawner3",
		waypoint = "lane_top_pathcorner_badguys_4",
		unit = "npc_dota_creature_bazz",
		min = 1,
		max = 3
	}
end

function Spawners:SpawnBazzMid()
	return {
		source =  "spawner1",
		waypoint = "lane_mid_pathcorner_badguys_7",
		unit = "npc_dota_creature_bazz",
		min = 1,
		max = 3
	}
end


function Spawners:SpawnBazzBot()
	return {
		source =  "spawner2",
		waypoint = "lane_bot_pathcorner_badguys_4",
		unit = "npc_dota_creature_bazz",
		min = 1,
		max = 3
	}
end

-------------------------- Beast

function Spawners:SpawnBeast()
	Spawners:SpawnBeastTop()
	Spawners:SpawnBeastMid()
	Spawners:SpawnBeastBot()
end

function Spawners:SpawnBeastTop()
	return {
		source =  "spawner3",
		waypoint = "lane_top_pathcorner_badguys_4",
		unit = "npc_dota_creature_beast"
	}
end

function Spawners:SpawnBeastMid()
	return {
		source =  "spawner1",
		waypoint = "lane_mid_pathcorner_badguys_7",
		unit = "npc_dota_creature_beast"
	}
end

function Spawners:SpawnBeastBot()
	return {
		source =  "spawner2",
		waypoint = "lane_bot_pathcorner_badguys_4",
		unit = "npc_dota_creature_beast"
	}
end

--- Frost Ogres

function Spawners:SpawnFrostOgres()
	Spawners:SpawnFrostOgresAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnFrostOgresAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnFrostOgresAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnFrostOgresAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_ogre", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnOgres()
	Spawners:SpawnOgresAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnOgresAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnOgresAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnOgresAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_ogre_melee", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnMiniSatyrs()
	Spawners:SpawnMiniSatyrsAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnMiniSatyrsAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnMiniSatyrsAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnMiniSatyrsAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(1,2)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_satyr", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnSatyrs()
	Spawners:SpawnSatyrsAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnSatyrsAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnSatyrsAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnSatyrsAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_medium_satyr", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnBigSatyrs()
	Spawners:SpawnBigSatyrsAt("spawner1", "lane_mid_pathcorner_badguys_7")
end

function Spawners:SpawnBigSatyrsAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_big_satyr", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

-------------------------- Zombie Wave

function Spawners:SpawnZombies()
	Spawners:SpawnZombiesAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnZombiesAt("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnZombiesAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnZombiesAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_basic_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnZombies2()
	Spawners:SpawnZombies2At("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnZombies2At("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnZombies2At("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnZombies2At(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_berserk_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnCorpse()
	Spawners:SpawnCorpseAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnCorpseAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnCorpseAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnCorpseAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_corpselord", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnSpooki()
	Spawners:SpawnSpookiAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnSpookiAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnSpookiAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnSpookiAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_spooki", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

--------------------------------------  SPIDERS

function Spawners:SpawnCoolSpiders()
	Spawners:SpawnCoolSpidersAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnCoolSpidersAt("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnCoolSpidersAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnCoolSpidersAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_cool_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnMiniSpiders()
	Spawners:SpawnMiniSpidersAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnMiniSpidersAt("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnMiniSpidersAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnMiniSpidersAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_mini_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnSpiders()
	Spawners:SpawnSpidersAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnSpidersAt("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnSpidersAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnSpidersAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_medium_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnBigSpiders()
	Spawners:SpawnBigSpidersAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnBigSpidersAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnBigSpidersAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnBigSpidersAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(1,2)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_big_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

---- Mech wave

function Spawners:SpawnHulk()
	Spawners:SpawnHulkAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnHulkAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnHulkAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnHulkAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_hulk", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnHulkMedium()
	Spawners:SpawnHulkMediumAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnHulkMediumAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnHulkMediumAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnHulkMediumAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_hulk_medium", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnHulkBig()
	Spawners:SpawnHulkBigAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnHulkBigAt("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnHulkBigAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnHulkBigAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_hulk_big", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnKappa()
	Spawners:SpawnKappaAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnKappaAt("spawner4", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnKappaAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnKappaAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_kappapult", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnBabyKappa()
	Spawners:SpawnBabyKappaAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnBabyKappaAt("spawner4", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnBabyKappaAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnBabyKappaAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_baby_kappapult", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

------ Bears and Slarks

function Spawners:SpawnBears()
	Spawners:SpawnBearsAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnBearsAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnBearsAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnBearsAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_small_spirit_bear", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnSlarks()
	Spawners:SpawnSlarksAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnSlarksAt("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnSlarksAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnSlarksAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_lesser_nightcrawler", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnLargeBears()
	Spawners:SpawnLargeBearsAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnLargeBearsAt("spawner5", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnLargeBearsAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnLargeBearsAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_large_spirit_bear", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

------ Drake and Nyx

function Spawners:SpawnNyx()
	Spawners:SpawnNyxAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnNyxAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnNyxAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnNyxAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_nyx", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnDrake()
	Spawners:SpawnDrakeAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnDrakeAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnDrakeAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnDrakeAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_drake", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnChicken()
	Spawners:SpawnChickenAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnChickenAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnChickenAt("spawner2", "lane_bot_pathcorner_badguys_4")
end
function Spawners:SpawnChickenAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_chicken", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
			OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
			Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnAA()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_ancient_apparition", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGuardMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMinionMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_minion", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCentaurMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,6)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_centaur", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRippers()
	Spawners:SpawnFrostOgresAt("spawner3", "lane_top_pathcorner_badguys_4")
	Spawners:SpawnFrostOgresAt("spawner1", "lane_mid_pathcorner_badguys_7")
	Spawners:SpawnFrostOgresAt("spawner2", "lane_bot_pathcorner_badguys_4")
end

function Spawners:SpawnRippersAt(pointName, waypointName)
	local point = Entities:FindByName(nil, pointName):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, waypointName):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_ripper", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
				OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
				Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTrollMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_troll_healer", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_large", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRockMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_rock_golem", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end
-----------------------------------------------------------------------------------------------	
---------------- START OF TREE AND WOLF PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	---------------- Tree Wave
	
function Spawners:SpawnKingTree()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_king_treant", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnProphet()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_forest_prophet", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTreesMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnThing()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_thing", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnFangMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_fang", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnShroomMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_shroom", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end
	
function Spawners:SpawnTreesTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnShroomTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_Shroom", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnFangTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_fang", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:TestProphet()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_forest_prophet", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTreesBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnShroomBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_shroom", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnFangBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_fang", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnStump()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_stump", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

	---------------- Wolf Wave

function Spawners:SpawnKingWolf()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_king_wolf", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRhinoTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_rhino", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRhinoMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_rhino", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRhinoBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_rhino", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnWolfFangTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_wolf_fang", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnWolfFangMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_wolf_fang", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnWolfFangBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_wolf_fang", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHoundTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hound", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHoundMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hound", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHoundBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hound", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRabid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,6)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_rabid", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnPackLeaderTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_pack_leader", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end
function Spawners:SpawnPackLeaderMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_pack_leader", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end
function Spawners:SpawnPackLeaderBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_pack_leader", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end
function Spawners:SpawnGreatHound()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_great_hound", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

------------------------------------------------------------------------------------------------	
---------------- END OF TREE AND WOLF PHASE SPAWNERS ------------------------------------------------
------------------------------------------------------------------------------------------------

function Spawners:SpawnDemonMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDemonDogMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,8)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_dog", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMiniDemonMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_mini_demon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDragonMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_dragon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnLizardMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_lizard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBird()
	Spawners:SpawnBirdMid()
	Spawners:SpawnBirdTop()
	Spawners:SpawnBirdBot()
end

function Spawners:SpawnBirdMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_bird", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
				OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
				Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnBirdTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_bird", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
				OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
				Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBirdBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_bird", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
				OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
				Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBigBirdMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_bird", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnBigBirdTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_bird", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBigBirdBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_bird", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnStalkerMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_stalker", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnStalkerTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_stalker", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnStalkerBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_stalker", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGargoyleMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_gargoyle", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRoshMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_roshan_mob", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMiniRosh()
	Spawners:SpawnMiniRoshTop()
	Spawners:SpawnMiniRoshMid()
	Spawners:SpawnMiniRoshBot()
end

function Spawners:SpawnMiniRoshMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_mini_roshan", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMiniRoshTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_mini_roshan", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMiniRoshBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_mini_roshan", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGuardTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCentaurTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,6)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_centaur", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_large", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRockTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_rock_golem", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBigGhost()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_ghost", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end
function Spawners:SpawnGhostMeele2()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele2", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostBane()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_bane", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostMeeleSmallMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele_small", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostMeeleSmallTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele_small", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostMeeleSmallBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele_small", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostMeeleMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 5
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostMeeleTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 5
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostMeeleBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 5
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGhostBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTrollTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_troll_healer", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnDemonTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDemonDogTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,8)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_dog", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMiniDemonTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_mini_demon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDragonTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_dragon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnLizardTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_lizard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGargoyleTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_gargoyle", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRoshTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_roshan_mob", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

-- BOT Lane

function Spawners:SpawnRockBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_rock_golem", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_large", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGuardBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMinionBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_minion", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCentaurBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_centaur", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTrollBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_troll_healer", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDemonBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDemonDogBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,8)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_dog", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDragonBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_dragon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnLizardBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 5
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_lizard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMiniDemonBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,7)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_mini_demon", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGargoyleBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_gargoyle", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnRoshBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_roshan_mob", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

-- BOSSES

function Spawners:SpawnRoshan()
	return {
		source =  "spawner4",
		waypoint = "lane_mid_pathcorner_badguys_7",
		unit = "npc_dota_creature_roshan_boss"
	}
end

function Spawners:SpawnOgreBoss()
	return {
		source =  "spawner4",
		waypoint = "lane_mid_pathcorner_badguys_7",
		unit = "npc_dota_creature_ogre_boss"
	}
end

function Spawners:SpawnOgreBossTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_ogre_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnOgreBossBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_ogre_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBigBear()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_bear", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBigDrake()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_drake_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnBigNyx()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_nyx", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnFuckYou()
	return {
		source =  "spawner4",
		waypoint = "lane_mid_pathcorner_badguys_7",
		unit = "npc_dota_creature_fuck_you"
	}
end

function Spawners:SpawnBigSplitter()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_tiny_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnGuardBoss()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCentaurBoss()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_centaur_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

-- Neutral Camps/Map

function Spawners:SpawnFriend()
	Spawner:SpawnFriend({
		point = "spawner7",
		waypoint = "lane_bot_pathcorner_goodguys_2",
		lane = "bot",
		unit = "npc_dota_creature_friend",
		max_spawn = 8
	})
end

function Spawners:SpawnFriend2()
	Spawner:SpawnFriend({
		point = "spawner12",
		waypoint = "lane_top_pathcorner_goodguys_1",
		lane = "top",
		unit = "npc_dota_creature_friend",
		max_spawn = 8
	})
end

function Spawners:SpawnFriend3()
	Spawner:SpawnFriend({
		point = "spawner11",
		waypoint = "lane_mid_pathcorner_goodguys_1",
		lane = "mid",
		unit = "npc_dota_creature_friend",
		max_spawn = 8
	})
end

function Spawners:SpawnDefender1()
	Spawner:SpawnFriend({
		point = "spawner8",
		waypoint = "lane_top_pathcorner_badguys_3",
		lane = "base1",
		unit = "npc_dota_creature_friend_base",
		max_spawn = 1
	})
end

function Spawners:SpawnDefender2()
	Spawner:SpawnFriend({
		point = "spawner9",
		waypoint = "lane_top_pathcorner_badguys_2b",
		lane = "base2",
		unit = "npc_dota_creature_friend_base",
		max_spawn = 1
	})
end

function Spawners:SpawnMoney()
	local point = Entities:FindByName(nil, "spawner6"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_money", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_STOP,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMapBoss()
	local spawner = Entities:FindByName(nil, "spawner10")
	if spawner ~= nil then
		local point = spawner:GetAbsOrigin()
		local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
		local units_to_spawn = 1
		for i=1,units_to_spawn do
			Timers:CreateTimer(function()
				local unit = CreateUnitByName("npc_dota_creature_map_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
				ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
										OrderType = DOTA_UNIT_ORDER_STOP,
										Position = waypoint, Queue = true} )
				DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
			end)
		end
	end
end