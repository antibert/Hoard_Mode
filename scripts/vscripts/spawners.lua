if Spawners == nil then
	Spawners = class({})
end

_G.GameMode.BRSAlreadyStarted=0

require('libraries/timers')
require('libraries/spawners')
require('HoardBRS/init')

local waveZeroDuration = 180
local waveDuration = 270
local wavePause = 30

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

function Spawners:StartSpawners(difficulty, players, mapInfo)
	local waves = spawns.Waves
	for _,wave in pairs(waves) do
		Spawners:LoadWave(wave, tonumber(_), difficulty, players, mapInfo)
	end

	Spawners:LoadMisc(difficulty, mapInfo)
end

function Spawners:LoadWave(wave, waveNumber, difficulty, players, mapInfo)
	DebugPrint('LoadWave'..waveNumber)
	local options = wave.Options
	local chosenWave =  fetchRandomItem(options)
	if chosenWave.boss_unit ~= nil then
		Spawners:SpawnBoss(chosenWave.boss_unit, waveNumber, difficulty, players, mapInfo.bossSpawner, mapInfo.bossDestination)
	end
    
    --Giving a boosting boot to a "Bonus Round Skills for creeps" system.
    if wave.NeverEnd==1 and _G.GameMode.NewPar==nil then 
        _G.GameMode.NewPar=1
        BonusRoundSkills:InitHoardBRS(waveStart(waveNumber))
    end

	for _,unit in pairs(chosenWave.Creatures) do
		if (mapInfo.topLaneSpawner ~= nil and (unit.mid_only == nil or unit.mid_only == "0")) then
			Spawners:SpawnUnits(unit, waveNumber, difficulty, players, mapInfo.topLaneSpawner, mapInfo.topLaneDestination, wave.NeverEnd)
		end
		if (mapInfo.botLaneSpawner ~= nil and (unit.mid_only == nil or unit.mid_only == "0")) then
			Spawners:SpawnUnits(unit, waveNumber, difficulty, players, mapInfo.botLaneSpawner, mapInfo.botLaneDestination, wave.NeverEnd)
		end
		Spawners:SpawnUnits(unit, waveNumber, difficulty, players, mapInfo.midLaneSpawner, mapInfo.midLaneDestination, wave.NeverEnd)
	end
end

function Spawners:SpawnBoss(unit, waveNumber, difficulty, players, source, waypoint)
	if type(source) == 'table' then
		source = fetchRandomItem(source)
	end
	Spawner:SpawnTimer({
		start = waveBoss(waveNumber),
		interval = 3000,
		spawn = {
			source =  source,
			waypoint = waypoint,
			unit = unit,
			difficulty = difficulty,
			players = players
		}
	})
end

function Spawners:SpawnUnits(unit, waveNumber, difficulty, players, source, waypoint, forever)
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
			unit = unit.unit_name,
			difficulty = difficulty,
			players = players
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
		interval = 3000,
		spawn = {
			source =  "spawner10",
			waypoint = "spawner10",
			max = 1,
			order = DOTA_UNIT_ORDER_ATTACK_MOVE,
			unit = "npc_dota_creature_map_boss"
		}
	})
end