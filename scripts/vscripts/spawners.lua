if Spawners == nil then
	Spawners = class({})
end

require('libraries/timers')
require('libraries/spawners')

local waveZeroDuration = 180
local waveDuration = 250
local wavePause = 50

-- Settings
local spawns = LoadKeyValues('scripts/vscripts/spawns.kv')

function waveStart(waveNumber)
	local time = 0
	if waveNumber > 0 then
		time = waveZeroDuration + wavePause + (waveDuration + wavePause) * (waveNumber - 1)
	end
	DebugPrint('waveStart '..waveNumber..' '..time)
	return time
end

function waveEnd(waveNumber)
	local time = waveZeroDuration
	if waveNumber > 0 then
		time = waveStart(waveNumber) + waveDuration
	end
	DebugPrint('waveEnd '..waveNumber..' '..time)
	return time
end

function waveBoss(waveNumber)
	local time = waveEnd(waveNumber) - 60
	DebugPrint('waveBoss '..waveNumber..' '..time)
	return time
end

function fetchRandomItem(table)
	local keyset={}
	local n=0

	for k,v in pairs(table) do
		n=n+1
		keyset[n]=k
	end

	return table[keyset[math.random(#keyset)]]
end

function Spawners:StartSpawners(difficulty, mapInfo)
	local waves = spawns.Waves
	for _,wave in pairs(waves) do
		Spawners:LoadWave(wave, tonumber(_), difficulty, mapInfo)
	end

	Spawners:LoadMisc(difficulty, mapInfo)
end

function Spawners:LoadWave(wave, waveNumber, difficulty, mapInfo)
	DebugPrint('LoadWave'..waveNumber)
	local options = wave.Options
	local chosenWave =  fetchRandomItem(options)
	if chosenWave.boss_unit ~= nil then
		Spawners:SpawnBoss(chosenWave.boss_unit, waveNumber, difficulty, mapInfo.bossSpawner, mapInfo.bossDestination)
	end

	for _,unit in pairs(chosenWave.Creatures) do
		if (mapInfo.topLaneSpawner ~= nil and (unit.mid_only == nil or unit.mid_only == "0")) then
			Spawners:SpawnUnits(unit, waveNumber, difficulty, mapInfo.topLaneSpawner, mapInfo.topLaneDestination, wave.NeverEnd)
		end
		if (mapInfo.botLaneSpawner ~= nil and (unit.mid_only == nil or unit.mid_only == "0")) then
			Spawners:SpawnUnits(unit, waveNumber, difficulty, mapInfo.botLaneSpawner, mapInfo.botLaneDestination, wave.NeverEnd)
		end
		Spawners:SpawnUnits(unit, waveNumber, difficulty, mapInfo.midLaneSpawner, mapInfo.midLaneDestination, wave.NeverEnd)
	end
end

function Spawners:SpawnBoss(unit, waveNumber, difficulty, source, waypoint)
	if type(source) == 'table' then
		source = fetchRandomItem(source)
	end
	Spawner:SpawnTimer({
		start = waveBoss(waveNumber),
		interval = 3000,
		spawn = {
			source =  source,
			waypoint = waypoint,
			unit = unit
		}
	})
end

function Spawners:SpawnUnits(unit, waveNumber, difficulty, source, waypoint, forever)
	if type(source) == 'table' then
		source = fetchRandomItem(source)
	end
	local finish = waveEnd(waveNumber)
	if forever ~= nil and forever == 1 then
		finish = nil
	end
	Spawner:SpawnTimer({
		start = waveStart(waveNumber)+unit.delay,
		finish = finish,
		interval = unit.interval,
		spawn = {
			source =  source,
			waypoint = waypoint,
			max = unit.max_size,
			min = unit.min_size,
			unit = unit.unit_name
		}
	})
end

function Spawners:SpawnFriends(mapInfo, offset)
	-- Neutral Camps/Map Spawns
	Spawner:SpawnTimer({
		start = offset,
		interval = 30,
		spawn = function()
			if (mapInfo.botLaneFriendlyDestination ~= nil) then
				Spawner:SpawnFriend({
					point = mapInfo.botLaneFriendlySpawner,
					waypoint = mapInfo.botLaneFriendlyDestination,
					lane = "bot",
					unit = "npc_dota_creature_friend",
					max_spawn = 8
				})
			end
			if (mapInfo.topLaneFriendlyDestination ~= nil) then
				Spawner:SpawnFriend({
					point = mapInfo.topLaneFriendlySpawner,
					waypoint = mapInfo.topLaneFriendlyDestination,
					lane = "top",
					unit = "npc_dota_creature_friend",
					max_spawn = 8
				})
			end
			if (mapInfo.midLaneSpawner ~= nil) then
				Spawner:SpawnFriend({
					point = mapInfo.midLaneFriendlySpawner,
					waypoint = mapInfo.midLaneFriendlyDestination,
					lane = "mid",
					unit = "npc_dota_creature_friend",
					max_spawn = 8
				})
			end
		end
	})
end

function Spawners:LoadMisc(difficulty, mapInfo)
	--------------------------------------------------------------------------
	---------------- Neutral Camps/Map Spawns --------------------------------
	--------------------------------------------------------------------------

	Spawners:SpawnFriends(mapInfo, 0)
	Spawners:SpawnFriends(mapInfo, 1)
	Spawners:SpawnFriends(mapInfo, 2)

	Spawner:SpawnTimer({
		start = 0,
		interval = 30,
		spawn = function()
			Spawner:SpawnFriend({
				point = "spawner8",
				waypoint = "lane_top_pathcorner_badguys_3",
				lane = "base1",
				unit = "npc_dota_creature_friend_base",
				max_spawn = 1
			})

			Spawner:SpawnFriend({
				point = "spawner8",
				waypoint = "lane_top_pathcorner_badguys_2b",
				lane = "base2",
				unit = "npc_dota_creature_friend_base",
				max_spawn = 1
			})
		end
	})

	if difficulty < 2 then
		Timers:CreateTimer(0, function()
			Spawners:SpawnMapBoss()
			return 3000.0
		end)
	end

	-- spawn money units
	Spawner:SpawnTimer({
		start = 0,
		interval = 150,
		finish = waveEnd(3),
		spawn = {
			source =  "spawner6",
			waypoint = "lane_mid_pathcorner_badguys_7",
			max = 3,
			order = DOTA_UNIT_ORDER_STOP,
			unit = "npc_dota_creature_money"
		}
	})
end

-- Function to stop spawners

function Spawners:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
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