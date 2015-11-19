if SpawnersMedium == nil then
	SpawnersMedium = class({})
	bottomFriends = {}
	for i=1, 12 do
		bottomFriends[i] = nil
	end
end

require('SpawnTimersMedium')

-- MID Lane SpawnersMedium

function SpawnersMedium:SpawnGnollsMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,9)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function SpawnersMedium:SpawnBazzMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bazz", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function SpawnersMedium:SpawnZombies()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(9,10)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_basic_zombie_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnZombiesTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(9,10)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_basic_zombie_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnZombies2()
	local point = Entities:FindByName(nil, "spawner5"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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


function SpawnersMedium:SpawnZombies2Top()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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

function SpawnersMedium:SpawnSpookiMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,9)
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

function SpawnersMedium:SpawnNyx()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,7)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_nyx", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function SpawnersMedium:SpawnNyxTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,7)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_nyx", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function SpawnersMedium:SpawnDrake()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,7)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_drake_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnDrakeTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,7)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_drake_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnChickenTop()
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

function SpawnersMedium:SpawnChickenMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(1,2)
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

function SpawnersMedium:SpawnProphet()
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

function SpawnersMedium:SpawnTreesMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,8)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnThing()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,8)
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

function SpawnersMedium:SpawnFangMid()
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

function SpawnersMedium:SpawnShroomMid()
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

function SpawnersMedium:SpawnCorpseTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 1
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

function SpawnersMedium:SpawnCorpse()
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

function SpawnersMedium:SpawnAA()
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

function SpawnersMedium:SpawnGuardMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(9,11)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnCentaurMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,7)
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

function SpawnersMedium:SpawnTrollMid()
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

function SpawnersMedium:SpawnSplitterMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

-------------------- Wolf Wave

function SpawnersMedium:SpawnKingWolf()
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

function SpawnersMedium:SpawnRhinoTop()
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

function SpawnersMedium:SpawnRhinoMid()
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

function SpawnersMedium:SpawnRhinoBot()
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

function SpawnersMedium:SpawnWolfFangTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,6)
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

function SpawnersMedium:SpawnWolfFangMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_wolf_fang_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnWolfFangBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,6)
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

function SpawnersMedium:SpawnHoundTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
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

function SpawnersMedium:SpawnHoundMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
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

function SpawnersMedium:SpawnHoundBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
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

function SpawnersMedium:SpawnRabid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,9)
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

function SpawnersMedium:SpawnPackLeaderTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
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
function SpawnersMedium:SpawnPackLeaderMid()
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

function SpawnersMedium:SpawnPackLeaderBot()
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

function SpawnersMedium:SpawnGreatHound()
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

function SpawnersMedium:SpawnDemonMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnDemonDogMid()
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

function SpawnersMedium:SpawnMiniDemonMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,8)
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

function SpawnersMedium:SpawnDragonMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 4
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

function SpawnersMedium:SpawnLizardMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
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

function SpawnersMedium:SpawnStalkerMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,9)
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

function SpawnersMedium:SpawnGargoyleMid()
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

function SpawnersMedium:SpawnGargoyleTop()
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

function SpawnersMedium:SpawnGargoyleBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
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

function SpawnersMedium:SpawnBigBirdMid()
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

function SpawnersMedium:SpawnBigBirdTop()
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


function SpawnersMedium:SpawnBigBirdBot()
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

function SpawnersMedium:SpawnRoshMid()
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

-- TOP Lane

function SpawnersMedium:SpawnGnollsTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,6)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function SpawnersMedium:SpawnBazzTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bazz", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function SpawnersMedium:SpawnBeast()
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

function SpawnersMedium:SpawnSpiderlings()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(1,5)
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


function SpawnersMedium:SpawnSpiderlingsMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(1,5)
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

function SpawnersMedium:SpawnCoolSpiders()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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

function SpawnersMedium:SpawnCoolSpidersMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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
function SpawnersMedium:SpawnMiniSpiders()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,5)
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
function SpawnersMedium:SpawnMiniSpidersMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,5)
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

function SpawnersMedium:SpawnSpiders()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
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


function SpawnersMedium:SpawnSpidersMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
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

function SpawnersMedium:SpawnBigSpiders()
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

function SpawnersMedium:SpawnBigSpidersMid()
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


function SpawnersMedium:SpawnSpookiTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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

function SpawnersMedium:SpawnBears()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,4)
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

function SpawnersMedium:SpawnBearsMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
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

function SpawnersMedium:SpawnSlarks()
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

function SpawnersMedium:SpawnSlarksMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,6)
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

function SpawnersMedium:SpawnLargeBears()
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

function SpawnersMedium:SpawnLargeBearsMid()
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

function SpawnersMedium:SpawnTreesTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,8)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnShroomTop()
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

function SpawnersMedium:SpawnFangTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 4
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

function SpawnersMedium:SpawnGuardTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(9,11)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnCentaurTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,7)
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

function SpawnersMedium:SpawnSplitterTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_splitter_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnBigGhost()
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
function SpawnersMedium:SpawnGhostMeele2()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,8)
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

function SpawnersMedium:SpawnGhostBane()
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

function SpawnersMedium:SpawnGhostMeeleSmallMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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

function SpawnersMedium:SpawnGhostMeeleSmallTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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

function SpawnersMedium:SpawnGhostMeeleSmallBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,6)
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

function SpawnersMedium:SpawnGhostMeeleMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,10)
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


function SpawnersMedium:SpawnGhostMeeleTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,10)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnGhostMeeleBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,10)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_ghost_meele_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnGhostTop()
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

function SpawnersMedium:SpawnGhostMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
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

function SpawnersMedium:SpawnGhostBot()
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

function SpawnersMedium:SpawnTrollTop()
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


function SpawnersMedium:SpawnDemonTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnDemonDogTop()
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

function SpawnersMedium:SpawnMiniDemonTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,6)
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

function SpawnersMedium:SpawnDragonTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
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

function SpawnersMedium:SpawnLizardTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
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

function SpawnersMedium:SpawnStalkerTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,9)
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

function SpawnersMedium:SpawnRoshTop()
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

function SpawnersMedium:SpawnMiniSatyrs()
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

function SpawnersMedium:SpawnFrostOgres()
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

function SpawnersMedium:SpawnBird()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
	for i=1,units_to_spawn do
		local unit = CreateUnitByName("npc_dota_creature_bird_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
								OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
								Position = waypoint, Queue = true} )
		print("Move ",unit:GetEntityIndex()," to ", waypoint)
	end
end

function SpawnersMedium:SpawnRippers()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(3,5)
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


function SpawnersMedium:SpawnSatyrs()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,6)
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

function SpawnersMedium:SpawnBigSatyrs()
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

function SpawnersMedium:Prophet()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
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

function SpawnersMedium:SpawnOgre()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(4,5)
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

function SpawnersMedium:SpawnTreesBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,8)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_treant_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnShroomBot()
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

function SpawnersMedium:SpawnFangBot()
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

function SpawnersMedium:SpawnStump()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
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

function SpawnersMedium:SpawnSplitterBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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

function SpawnersMedium:SpawnMediumSplitterTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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

function SpawnersMedium:SpawnRockBot()
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

function SpawnersMedium:SpawnRockMid()
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

function SpawnersMedium:SpawnRockTop()
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

function SpawnersMedium:SpawnHellBear()
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

function SpawnersMedium:SpawnGuardBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(9,11)
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_kobold_guard_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnCentaurBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(5,7)
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

function SpawnersMedium:SpawnTrollBot()
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

function SpawnersMedium:SpawnDemonBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 2
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_demon_easy", point, true, nil, nil, DOTA_TEAM_BADGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnDemonDogBot()
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

function SpawnersMedium:SpawnDragonBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
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

function SpawnersMedium:SpawnLizardBot()
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

function SpawnersMedium:SpawnMiniRoshMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 3
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

function SpawnersMedium:SpawnMiniRoshTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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

function SpawnersMedium:SpawnMiniRoshBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = 3
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

function SpawnersMedium:SpawnMiniDemonBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(2,3)
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

function SpawnersMedium:SpawnStalkerBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(6,9)
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

function SpawnersMedium:SpawnSpookiBot()
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

function SpawnersMedium:SpawnRoshBot()
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

function SpawnersMedium:SpawnMinionBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,9)
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

function SpawnersMedium:SpawnMinionMid()
	local point = Entities:FindByName(nil, "spawner1"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = RandomInt(9,10)
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

function SpawnersMedium:SpawnMinionTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
	local units_to_spawn = RandomInt(7,9)
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

function SpawnersMedium:SpawnGuardBoss()
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

-- BOSSES

function SpawnersMedium:SpawnRoshan()
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

function SpawnersMedium:SpawnOgreBoss()
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

function SpawnersMedium:SpawnOgreBossTop()
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

function SpawnersMedium:SpawnOgreBossBot()
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

function SpawnersMedium:SpawnKingTree()
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

function SpawnersMedium:SpawnBigBear()
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

function SpawnersMedium:SpawnBigDrake()
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

function SpawnersMedium:SpawnBigNyx()
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

function SpawnersMedium:SpawnBigBearTop()
	local point = Entities:FindByName(nil, "spawner3"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_4"):GetAbsOrigin()
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

function SpawnersMedium:SpawnBigBearBot()
	local point = Entities:FindByName(nil, "spawner2"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_badguys_4"):GetAbsOrigin()
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

function SpawnersMedium:SpawnFuckYou()
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

function SpawnersMedium:SpawnBigSplitter()
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

function SpawnersMedium:SpawnCentaurBoss()
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

function SpawnersMedium:SpawnFriend()
	local point = Entities:FindByName(nil, "spawner7"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_goodguys_2"):GetAbsOrigin()
	local units_to_spawn = 1
	local spawned_units = 0
	for j=1, 8 do
		if spawned_units > 0 then
			break
		end
		if bottomFriends[j] ~= nil then
			if bottomFriends[j]:IsNull() == true then
				bottomFriends[j] = nil
			end
		end
		if bottomFriends[j] == nil then
			Timers:CreateTimer(function()
				bottomFriends[j] = CreateUnitByName("npc_dota_creature_friend_easy", point, true, nil, nil, DOTA_TEAM_GOODGUYS)
				-- for testing purposes
				-- bottomFriends[j]:SetMaxHealth(100)
				ExecuteOrderFromTable({	UnitIndex = bottomFriends[j]:GetEntityIndex(),
										OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
										Position = waypoint, Queue = true} )
				print("Move ",bottomFriends[j]:GetEntityIndex()," to ", waypoint)
				print("Friendly bot creep spawned at index: " .. tostring(j))
			end)
			spawned_units = spawned_units + 1
		end
	end
end

function SpawnersMedium:SpawnFriend2()
	local point = Entities:FindByName(nil, "spawner8"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_3"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_friend_base", point, true, nil, nil, DOTA_TEAM_GOODGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnFriend3()
	local point = Entities:FindByName(nil, "spawner9"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_top_pathcorner_badguys_2b"):GetAbsOrigin()
	local units_to_spawn = 1
	for i=1,units_to_spawn do
		Timers:CreateTimer(function()
			local unit = CreateUnitByName("npc_dota_creature_friend_base2", point, true, nil, nil, DOTA_TEAM_GOODGUYS)
			ExecuteOrderFromTable({	UnitIndex = unit:GetEntityIndex(),
									OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
									Position = waypoint, Queue = true} )
			print("Move ",unit:GetEntityIndex()," to ", waypoint)
		end)
	end
end

function SpawnersMedium:SpawnMoney()
	local point = Entities:FindByName(nil, "spawner6"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_mid_pathcorner_badguys_7"):GetAbsOrigin()
	local units_to_spawn = 2
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

function SpawnersMedium:SpawnMapBoss()
	local point = Entities:FindByName(nil, "spawner10"):GetAbsOrigin()
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



