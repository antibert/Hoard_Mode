if Spawners == nil then
	Spawners = class({})
end

require('libraries/timers')

function Spawners:StartSpawners()
    -- First Gnoll spawn example
	-- Start spawning gnolls every 30 seconds.
	Timers:CreateTimer("gnolls", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			Spawners:SpawnGnollsTop()
			Spawners:SpawnGnollsMid()
			return 30.0
		end
	})
	-- Stop spawning gnolls after 3.5 minutes.
	Timers:CreateTimer(180, function()
		Spawners:StopSpawner("gnolls")
	end)
	
-- BOSSES
	
	Timers:CreateTimer(300, function()
		Spawners:SpawnRoshan()
		return 2000.0
    end)
    Timers:CreateTimer(600, function()
		Spawners:SpawnOgreBoss()
		return 2000.0
    end)
    Timers:CreateTimer(1020, function()
		Spawners:SpawnKingTree()
		return 2000.0
    end)
    Timers:CreateTimer(1620, function()
		Spawners:SpawnBigBear()
		return 2000.0
    end)
    Timers:CreateTimer(2400, function()
		Spawners:SpawnFuckYou()
		return 2000.0
    end)
 
-- MID LANE/All Lanes
		
	Timers:CreateTimer("bazz", {
		useGameTime = true,
		endTime = 60,
		callback = function()
			Spawners:SpawnBazzTop()
			Spawners:SpawnBazzMid()
			return 23.0
		end
	})
	Timers:CreateTimer(180, function()
		Spawners:StopSpawner("bazz")
	end)
	Timers:CreateTimer("zombie", {
		useGameTime = true,
		endTime = 180,
		callback = function()
			Spawners:SpawnZombies()
			return 20.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 250,
		callback = function()
			Spawners:SpawnZombies2()
			return 30.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			Spawners:SpawnSpooki()
			return 13.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners:StopSpawner("spooki1")
	end)
    Timers:CreateTimer("spooki", {
		useGameTime = true,
		endTime = 1300,
		callback = function()
			Spawners:SpawnSpooki()
			return 13.0
		end
	})
	Timers:CreateTimer(1800, function()
		Spawners:StopSpawner("spooki")
	end)
	Timers:CreateTimer("prophet", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			Spawners:SpawnProphet()
			return 48.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("prophet")
	end)
	
	Timers:CreateTimer("tree", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			Spawners:SpawnTreesTop()
			Spawners:SpawnTreesMid()
			Spawners:SpawnTreesBot()
			return 15.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("tree")
	end)
    
	Timers:CreateTimer(1200, function()
		Spawners:SpawnCorpse()
		return 40.0 
    end)	
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = 1200,
		callback = function()
			Spawners:SpawnSplitterTop()
			Spawners:SpawnSplitterMid()
			Spawners:SpawnSplitterBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1500, function()
		Spawners:StopSpawner("splitter")
	end)
	Timers:CreateTimer(1380, function()
		Spawners:SpawnGuardTop()
		Spawners:SpawnGuardMid()
		Spawners:SpawnGuardBot()
		return 30.0 
    end)
	Timers:CreateTimer(1800, function()
		Spawners:SpawnTrollTop()
		Spawners:SpawnTrollMid()
		Spawners:SpawnTrollBot()
		return 20.0 
    end)
	
-- TOP LANE

Timers:CreateTimer("spiderling", {
		useGameTime = true,
		endTime = 240,
		callback = function()
			Spawners:SpawnSpiderlings()
			return 18.0
		end
	})
	Timers:CreateTimer(570, function()
		Spawners:StopSpawner("spiderling")
	end)
Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			Spawners:SpawnCoolSpiders()
			return 30.0
		end
	})
	Timers:CreateTimer(330, function()
		Spawners:StopSpawner("cool")
	end)
Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 240,
		callback = function()
			Spawners:SpawnSpiders()
			return 18.0
		end
	})
	Timers:CreateTimer(570, function()
		Spawners:StopSpawner("spiders")
	end)
	
Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = 180,
		callback = function()
			Spawners:SpawnMiniSpiders()
			return 21.0
		end
	})
	Timers:CreateTimer(570, function()
		Spawners:StopSpawner("mini")
	end)
Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 330,
		callback = function()
			Spawners:SpawnBigSpiders()
			return 34.0
		end
	})
	Timers:CreateTimer(570, function()
		Spawners:StopSpawner("big")
	end)
Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			Spawners:SpawnBears()
			return 27.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners:StopSpawner("bears")
	end)
Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 780,
		callback = function()
			Spawners:SpawnLargeBears()
			return 27.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners:StopSpawner("largebears")
	end)  
    
-- BOT LANE
   
   Timers:CreateTimer(17, function()
		Spawners:SpawnFrostOgres()
		return 53.0 
    end)
    Timers:CreateTimer(270, function()
		Spawners:SpawnMiniSatyrs()
		return 20.0 
    end)
	Timers:CreateTimer(360, function()
		Spawners:SpawnRippers()
		return 17.0 
    end)
    Timers:CreateTimer(480, function()
		Spawners:SpawnSatyrs()
		return 33.0 
    end)
    Timers:CreateTimer(780, function()
		Spawners:SpawnBigSatyrs()
		return 41.0 
    end)
	Timers:CreateTimer(900, function()
		Spawners:SpawnOgre()
		return 30.0 
    end)
end


-- MID Lane Spawners 

function Spawners:SpawnGnollsMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 8
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnBazzMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bazz", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnZombies()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 9
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_basic_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnZombies2()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 5
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_berserk_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSpooki()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 13
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_spooki", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnProphet()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_forest_prophet", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTreesMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 8
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCorpse()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_corpselord", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGuardMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 17
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 10
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_c", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

-- TOP Lane

function Spawners:SpawnGnollsTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 5
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnBazzTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bazz", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnSpiderlings()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 12
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_spiderling", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCoolSpiders()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 12
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_cool_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnMiniSpiders()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 6
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_mini_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSpiders()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 8
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_medium_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSpiders()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_big_spiders", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBears()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_small_spirit_bear", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnLargeBears()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_large_spirit_bear", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTreesTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 8
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGuardTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 17
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 10
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_c", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end



-- BOT Lane

function Spawners:SpawnMiniSatyrs()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_satyr", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnFrostOgres()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_ogre", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnRippers()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_ripper", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnSatyrs()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_medium_satyr", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBigSatyrs()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_satyr", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:Prophet()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_forest_prophet", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:Ogre()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_ogre_melee", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnTreesBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 8
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 10
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_c", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnGuardBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 17
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end



-- BOSSES

function Spawners:SpawnRoshan()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_roshan_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnOgreBoss()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_ogre_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnFuckYou()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_fuck_you", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


-- Function to stop spawners

function Spawners:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end