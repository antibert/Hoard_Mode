if Spawners == nil then
	Spawners = class({})
end

require('SpawnTimers')
require('libraries/spawners')

-- MID Lane Spawners

function Spawners:SpawnGnollsMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,7)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnGnollsBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,7)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnBazzMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bazz", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end


function Spawners:SpawnBazzBot()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bazz", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

-------------------------- Zombie Wave

function Spawners:SpawnZombiesTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_basic_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnZombies()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_basic_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnZombies2Top()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_berserk_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnZombies2()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_berserk_zombie", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCorpse()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_corpselord", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnCorpseTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_corpselord", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHulk()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hulk", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHulkMedium()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hulk_medium", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHulkMediumTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hulk_medium", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHulkTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hulk", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHulkBigTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hulk_big", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHulkBig()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_hulk_big", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			DebugPrint("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnKappaTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kappapult", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnKappa()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kappapult", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBabyKappaTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_baby_kappapult", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnBabyKappa()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_baby_kappapult", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnSpookiMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
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

function Spawners:SpawnNyx()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_nyx", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end


function Spawners:SpawnNyxTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_nyx", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnDrake()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_drake", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDrakeTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_drake", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnChickenTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_chicken", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnChickenMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_chicken", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnWolfFangTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_wolf_fang", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnPackLeaderTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 0
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_pack_leader", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end
function Spawners:SpawnPackLeaderBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 0
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_pack_leader", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDemonDogMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_dog", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnStalkerTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_stalker", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnStalkerBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_stalker", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

-- TOP Lane

function Spawners:SpawnGnollsTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,7)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
	end
end

function Spawners:SpawnBazzTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bazz", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnBeast()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_beast", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

--------------------------------------  SPIDERS

function Spawners:SpawnSpiderlingsTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
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

function Spawners:SpawnSpiderlingsMid()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
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

function Spawners:SpawnCoolSpidersTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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

function Spawners:SpawnCoolSpidersMid()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 4
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

function Spawners:SpawnMiniSpidersTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
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

function Spawners:SpawnMiniSpidersMid()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
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

function Spawners:SpawnSpidersTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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

function Spawners:SpawnSpidersMid()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
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

function Spawners:SpawnBigSpidersTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
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

function Spawners:SpawnBigSpidersMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
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

function Spawners:SpawnSpookiTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
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

function Spawners:SpawnBears()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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

function Spawners:SpawnBearsMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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


function Spawners:SpawnSlarks()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_lesser_nightcrawler", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSlarksMid()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 4
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_lesser_nightcrawler", point, true, nil, nil, DOTA_TEAM_BADGUYS)
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
	local units_to_spawn = 1
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

function Spawners:SpawnLargeBearsMid()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDemonDogTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_dog", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_ogre", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnBird()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bird", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function Spawners:SpawnRippers()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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
	local units_to_spawn = 4
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
	local units_to_spawn = 2
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


function Spawners:SpawnOgre()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSplitterBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_medium", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end


function Spawners:SpawnMediumSplitterTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_medium", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnHellBear()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_hellbear", point, true, nil, nil, DOTA_TEAM_BADGUYS)
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
	local units_to_spawn = 7
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnDemonDogBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_dog", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function Spawners:SpawnSpookiBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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

function Spawners:SpawnBigSplitter()
	local point = Entities:FindByName(nil, "spawner4"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_big_splitter", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
		point = "spawner8",
		waypoint = "lane_top_pathcorner_badguys_3",
		lane = "top",
		unit = "npc_dota_creature_friend_base",
		max_spawn = 1
	})
end

function Spawners:SpawnFriend3()
	Spawner:SpawnFriend({
		point = "spawner9",
		waypoint = "lane_top_pathcorner_badguys_2b",
		lane = "mid",
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
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
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
				print("Move ",unit:GetEntityIndex()," to ", waypoint)
			end)
		end
	end
end



