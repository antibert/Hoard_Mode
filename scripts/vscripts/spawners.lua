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
			Spawners:SpawnGnolls()
			return 30.0
		end
	})
	-- Stop spawning gnolls after 3 minutes.
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
    Timers:CreateTimer(600, function()
		Spawners:SpawnKingTree()
		return 2000.0
    end)
    Timers:CreateTimer(600, function()
		Spawners:SpawnBigBear()
		return 2000.0
    end)
    Timers:CreateTimer(600, function()
		Spawners:SpawnFuckYou()
		return 2000.0
    end)
	
-- MID LANE/All Lanes

	Timers:CreateTimer(180, function()
		Spawners:SpawnZombies()
		return 20.0 
    end)
	Timers:CreateTimer(250, function()
		Spawners:SpawnZombies2()
		return 30.0  
    end)
	Timers:CreateTimer(480, function()
		Spawners:SpawnSpooki()
		return 20.0  
    end)
	Timers:CreateTimer("prophet", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			Spawners:SpawnProphet()
			return 30.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners:StopSpawner("prophet")
	end)
	
	Timers:CreateTimer("tree", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			Spawners:SpawnTree()
			return 20.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("tree")
	end)
    
	Timers:CreateTimer(1200, function()
		Spawners:SpawnCorpse()
		return 40.0 
    end)	
	Timers:CreateTimer(1380, function()
		Spawners:SpawnGuard()
		return 30.0 
    end)
	Timers:CreateTimer(1800, function()
		Spawners:SpawnTroll()
		return 20.0 
    end)
	
-- TOP LANE

    Timers:CreateTimer(0, function()
		Spawners:SpawnSpiderlings()
		return 18.0 
    end)
	Timers:CreateTimer(240, function()
		Spawners:SpawnSpiders()
		return 39.0 
    end)
	Timers:CreateTimer(480, function()
		Spawners:SpawnBears()
		return 27.0 
    end)
	Timers:CreateTimer(720, function()
		Spawners:SpawnLargeBears()
		return 45.0 
    end)
-- BOT LANE

    Timers:CreateTimer(180, function()
		Spawners:SpawnMiniSatyrs()
		return 20.0 
    end)
	Timers:CreateTimer(300, function()
		Spawners:SpawnRippers()
		return 17.0 
    end)
    Timers:CreateTimer(420, function()
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
    Timers:CreateTimer(1200, function()
		Spawners:SpawnSplitter()
		return 20.0 
    end)
end

-- MID Lane Spawners 

function Spawners:SpawnGnolls()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
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

function Spawners:SpawnTree()
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

function Spawners:Corpse()
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

function Spawners:Guard()
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

function Spawners:Troll()
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

-- TOP Lane

function Spawners:SpawnGnolls()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnSpiderlings()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 7
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

function Spawners:Prophet()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
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

function Spawners:SpawnTree()
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

function Spawners:Guard()
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

function Spawners:Troll()
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

function Spawners:SpawnGnolls()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 7
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnMiniSatyrs()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_mini_satyr", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
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

function Spawners:BigSatyrs()
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

function Spawners:SpawnTree()
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

function Spawners:SpawnSplitter()
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

function Spawners:Guard()
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

function Spawners:Troll()
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