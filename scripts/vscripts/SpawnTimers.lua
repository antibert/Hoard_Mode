	-- EXAMPLE
	--[[
	Timers:CreateTimer("RandomSpawnExample", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			local rand = RandomInt(1,10)
			if rand > 5 then
				Spawners:SpawnMob1()
				return 10
			else
				Spawners:SpawnMob2()
				return 10
			end
		end
	})
	]]

if SpawnTimers == nil then
	SpawnTimers = class({})
end

require('libraries/timers')
require('libraries/spawners')

local waveZeroDuration = 180
local waveDuration = 250
local wavePause = 50

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

function Spawners:StartSpawners(difficulty)
	
-- BOSSES
	Spawner:SpawnTimer({
		start = waveBoss(1),
		interval = 3000,
		spawn = Spawners:SpawnRoshan()
	})

	Spawner:SpawnTimer({
		start = waveBoss(2),
		interval = 3000,
		spawn = Spawners:SpawnOgreBoss()
	})

	Spawner:SpawnTimer({
		start = waveStart(7),
		interval = 550,
		spawn = Spawners:SpawnFuckYou()
	})
 
-- First Wave
	Spawner:SpawnTimer({
		start = 0,
		finish = waveZeroDuration,
		interval = 30,
		spawn = Spawners:SpawnGnollsTop()
	})

	Spawner:SpawnTimer({
		start = 0,
		finish = waveZeroDuration,
		interval = 30,
		spawn = Spawners:SpawnGnollsMid()
	})

	Spawner:SpawnTimer({
		start = 0,
		finish = waveZeroDuration,
		interval = 30,
		spawn = Spawners:SpawnGnollsBot()
	})

	Spawner:SpawnTimer({
		start = 30,
		finish = waveZeroDuration,
		interval = 30,
		spawn = Spawners:SpawnBazzTop()
	})

	Spawner:SpawnTimer({
		start = 30,
		finish = waveZeroDuration,
		interval = 30,
		spawn = Spawners:SpawnBazzMid()
	})

	Spawner:SpawnTimer({
		start = 30,
		finish = waveZeroDuration,
		interval = 30,
		spawn = Spawners:SpawnBazzBot()
	})

	local rand = RandomInt(1, 3)
	if rand == 1 then
		Spawner:SpawnTimer({
			start = waveBoss(0),
			interval = 3000,
			spawn = Spawners:SpawnBeastTop()
		})

	elseif rand == 2 then
		Spawner:SpawnTimer({
			start = waveBoss(0),
			interval = 3000,
			spawn = Spawners:SpawnBeastMid()
		})

	else
		Spawner:SpawnTimer({
			start = waveBoss(0),
			interval = 3000,
			spawn = Spawners:SpawnBeastBot()
		})

	end

-----------------------------------------------------------------------------------------------	
---------------- START OF ZOMBIE, SPIDER AND MECH PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	-- RANDOM SPAWNER BLOCK 50/50 CHANCE TO TRIGGER EITHER
	local rand = RandomInt(1,3)
	if rand == 1 then
	
--------------------- Zombie Wave
	
	Timers:CreateTimer("zombie", {
		useGameTime = true,
		endTime = waveStart(1),
		callback = function()
			Spawners:SpawnZombies()
			return 23.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = waveStart(1)+40,
		callback = function()
			Spawners:SpawnZombies2()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("corpse", {
		useGameTime = true,
		endTime = waveStart(1)+150,
		callback = function()
			Spawners:SpawnCorpse()
			return 40.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("corpse")
	end)
	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = waveStart(1),
		callback = function()
			Spawners:SpawnSpooki()
			return 17.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("spooki1")
	end)

	elseif rand == 2 then
	
-------------------- Spider Wave
Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = waveStart(1),
		callback = function()
			Spawners:SpawnCoolSpiders()
			return 23.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("cool")
	end)
Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = waveStart(1)+40,
		callback = function()
			Spawners:SpawnSpiders()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("spiders")
	end)
Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = waveStart(1),
		callback = function()
			Spawners:SpawnMiniSpiders()
			return 17.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("mini")
	end)

	Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = waveStart(1)+150,
		callback = function()
			Spawners:SpawnBigSpiders()
			return 40.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("big")
	end)
	
	elseif rand == 3 then
	
------------------------------- Mech Wave

	Timers:CreateTimer("hulk", {
		useGameTime = true,
		endTime = waveStart(1),
		callback = function()
			Spawners:SpawnHulk()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("hulk")
	end)
	Timers:CreateTimer("hulkmedium", {
		useGameTime = true,
		endTime = waveStart(1)+30,
		callback = function()
			Spawners:SpawnHulkMedium()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("hulkmedium")
	end)
	
	Timers:CreateTimer("hulkbig", {
		useGameTime = true,
		endTime = waveStart(1)+150,
		callback = function()
			Spawners:SpawnHulkBig()
			return 50.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("hulkbig")
	end)
	
	Timers:CreateTimer("kappa", {
		useGameTime = true,
		endTime = waveStart(1)+150,
		callback = function()
			Spawners:SpawnKappa()
			return 200.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("kappa")
	end)
	
	Timers:CreateTimer("babykappa", {
		useGameTime = true,
		endTime = waveStart(1),
		callback = function()
			Spawners:SpawnBabyKappa()
			return 40.0
		end
	})
	Timers:CreateTimer(waveEnd(1), function()
		Spawners:StopSpawner("babykappa")
	end)
	
	end
	
-----------------------------------------------------------------------------------------------	
---------------- END OF ZOMBIE, SPIDER AND MECH PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	
	
	
-----------------------------------------------------------------------------------------------	
---------------- START OF BEAR/HARPY/SATYR PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	
	

	local rand = RandomInt(1,3)
	if rand == 1 then	

---------- Harpy Wave:	
	
	Timers:CreateTimer("drake", {
		useGameTime = true,
		endTime = waveStart(2)+40,
		callback = function()
			Spawners:SpawnDrake()
			return 23.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("drake")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = waveStart(2),
		callback = function()
			Spawners:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("nyx")
	end)
	Timers:CreateTimer("chicken", {
		useGameTime = true,
		endTime = waveStart(2),
		callback = function()
			Spawners:SpawnChicken()
			return 100.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("chicken")
	end)
    Timers:CreateTimer(waveBoss(2)-100, function()
		Spawners:SpawnBigNyx()
		return 3000.0
    end)	

	elseif rand == 2 then

------------- Ogre and Satyr Wave

	Timers:CreateTimer("frostogres", {
		useGameTime = true,
		endTime = waveStart(2),
		callback = function()
			Spawners:SpawnFrostOgres()
			return 53.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("frostogres")
	end)

	Timers:CreateTimer("ogres", {
		useGameTime = true,
		endTime = waveStart(2)+30,
		callback = function()
			Spawners:SpawnOgres()
			return 45.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("ogres")
	end)
	Timers:CreateTimer("minisatyrs", {
		useGameTime = true,
		endTime = waveStart(2),
		callback = function()
			Spawners:SpawnMiniSatyrs()
			return 40.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("minisatyrs")
	end)

	Timers:CreateTimer("satyrs", {
		useGameTime = true,
		endTime = waveStart(2),
		callback = function()
			Spawners:SpawnSatyrs()
			return 33.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("satyrs")
	end)
	Timers:CreateTimer("bigsatyrs", {
		useGameTime = true,
		endTime = waveBoss(2)-100,
		callback = function()
			Spawners:SpawnBigSatyrs()
			return 3000
		end
	})

	else
	
------------- Bear Wave
	
	Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = waveStart(2)+40,
		callback = function()
			Spawners:SpawnBears()
			return 27.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("bears")
	end)
	Timers:CreateTimer("slarks", {
		useGameTime = true,
		endTime = waveStart(2),
		callback = function()
			Spawners:SpawnSlarks()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("slarks")
	end)
	Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = waveStart(2)+160,
		callback = function()
			Spawners:SpawnLargeBears()
			return 27.0
		end
	})
	Timers:CreateTimer(waveEnd(2), function()
		Spawners:StopSpawner("largebears")
	end)  	
    Timers:CreateTimer(waveBoss(2) - 100, function()
		Spawners:SpawnBigBear()
		return 3000.0
    end)
	
	end	
	
-----------------------------------------------------------------------------------------------	
---------------- END OF BEAR/HARPY PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------		
	
-----------------------------------------------------------------------------------------------	
---------------- START OF TREE AND WOLF PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	-- RANDOM SPAWNER BLOCK 50/50 CHANCE TO TRIGGER EITHER
	local rand = RandomInt(1,2)
	if rand == 1 then
	
	---------------- Tree Wave

	Timers:CreateTimer("prophet", {
		useGameTime = true,
		endTime = waveStart(3)+20,
		callback = function()
			Spawners:SpawnProphet()
			return 60.0
		end 
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("prophet")
	end)
	Timers:CreateTimer("tree", {
		useGameTime = true,
		endTime = waveStart(3),
		callback = function()
			Spawners:SpawnTreesTop()
			Spawners:SpawnTreesMid()
			Spawners:SpawnTreesBot()
			return 20.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("tree")
	end)
	Timers:CreateTimer("shroom", {
		useGameTime = true,
		endTime = waveStart(3)+35,
		callback = function()
			Spawners:SpawnShroomTop()
			Spawners:SpawnShroomMid()
			Spawners:SpawnShroomBot()
			return 45.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("shroom")
	end)
	Timers:CreateTimer("fang", {
		useGameTime = true,
		endTime = waveStart(3)+70,
		callback = function()
			Spawners:SpawnFangTop()
			Spawners:SpawnFangMid()
			Spawners:SpawnFangBot()
			return 25.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("fang")
	end)    
	Timers:CreateTimer("thing", {
		useGameTime = true,
		endTime = waveStart(3),
		callback = function()
			Spawners:SpawnThing()
			return 35.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("thing")
	end)
	Timers:CreateTimer("stump", {
		useGameTime = true,
		endTime = waveStart(3)+100,
		callback = function()
			Spawners:SpawnStump()
			return 3000.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("stump")
	end)
    Timers:CreateTimer(waveBoss(3), function()
		Spawners:SpawnKingTree()
		return 3000.0
    end)
	
	---------------- Wolf Wave
	
	else

	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = waveStart(3)+60,
		callback = function()
			Spawners:SpawnRhinoTop()
			Spawners:SpawnRhinoMid()
			Spawners:SpawnRhinoBot()
			return 90.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("rhino")
	end)
	Timers:CreateTimer("wolffang", {
		useGameTime = true,
		endTime = waveStart(3),
		callback = function()
			Spawners:SpawnWolfFangTop()
			Spawners:SpawnWolfFangMid()
			Spawners:SpawnWolfFangBot()
			return 37.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("wolffang")
	end)
	Timers:CreateTimer("greathound", {
		useGameTime = true,
		endTime = waveStart(3)+30,
		callback = function()
			Spawners:SpawnGreatHound()
			return 60.0
		end 
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("greathound")
	end)
	Timers:CreateTimer("packleader", {
		useGameTime = true,
		endTime = waveStart(3)+60,
		callback = function()
			Spawners:SpawnPackLeaderMid()
			Spawners:SpawnPackLeaderBot()
			Spawners:SpawnPackLeaderTop()
			return 60.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("packleader")
	end)
	Timers:CreateTimer("hound", {
		useGameTime = true,
		endTime = waveStart(3)+45,
		callback = function()
			Spawners:SpawnHoundTop()
			Spawners:SpawnHoundMid()
			Spawners:SpawnHoundBot()
			return 25.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("hound")
	end)    
	Timers:CreateTimer("rabid", {
		useGameTime = true,
		endTime = waveStart(3),
		callback = function()
			Spawners:SpawnRabid()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("rabid")
	end)
    Timers:CreateTimer(waveBoss(3), function()
		Spawners:SpawnKingWolf()
		return 3000.0
    end)
	
	end
------------------------------------------------------------------------------------------------	
---------------- END OF TREE AND WOLF PHASE SPAWNERS ------------------------------------------------
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
---------------- START OF GOLEM AND GHOST PHASE SPAWNERS ---------------------------------------
------------------------------------------------------------------------------------------------
	local rand = RandomInt(1,2)
	if rand == 1 then

	---------------- Golem Wave
    Timers:CreateTimer(waveBoss(4), function()
		Spawners:SpawnBigSplitter()
		return 3000.0
    end)	
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = waveStart(4),
		callback = function()
			Spawners:SpawnSplitterTop()
			Spawners:SpawnSplitterMid()
			Spawners:SpawnSplitterBot()
			return 34.0
		end
	})
	Timers:CreateTimer(waveEnd(4), function()
		Spawners:StopSpawner("splitter")
	end)

	Timers:CreateTimer("rock", {
		useGameTime = true,
		endTime = waveStart(4),
		callback = function()
			Spawners:SpawnRockTop()
			Spawners:SpawnRockMid()
			Spawners:SpawnRockBot()
			return 120.0
		end
	})
	Timers:CreateTimer(waveEnd(4), function()
		Spawners:StopSpawner("rock")
	end)

  ---------------- Ghost Wave	
	
	else
	
    Timers:CreateTimer(waveBoss(4), function()
		Spawners:SpawnBigGhost()
		return 3000.0
    end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = waveStart(4),
		callback = function()
			Spawners:SpawnGhostMeeleTop()
		    Spawners:SpawnGhostMeeleMid()
		    Spawners:SpawnGhostMeeleBot()
			return 23.0
		end
	})
	Timers:CreateTimer(waveEnd(4), function()
		Spawners:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghostmeelesmall", {
		useGameTime = true,
		endTime = waveStart(4),
		callback = function()
			Spawners:SpawnGhostMeeleSmallTop()
		    Spawners:SpawnGhostMeeleSmallMid()
		    Spawners:SpawnGhostMeeleSmallBot()
			return 17.0
		end
	})
	Timers:CreateTimer(waveEnd(4), function()
		Spawners:StopSpawner("ghostmeelesmall")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = waveStart(4),
		callback = function()
			Spawners:SpawnGhostTop()
			Spawners:SpawnGhostMid()
			Spawners:SpawnGhostBot()
			return 14.0
		end
	})
	Timers:CreateTimer(waveEnd(4), function()
		Spawners:StopSpawner("ghost")
	end)
	Timers:CreateTimer("ghost2", {
		useGameTime = true,
		endTime = waveStart(4)+45,
		callback = function()
			Spawners:SpawnGhostMeele2()
			return 40.0
		end
	})
	Timers:CreateTimer(waveEnd(4), function()
		Spawners:StopSpawner("ghost2")
	end)
	Timers:CreateTimer("bane", {
		useGameTime = true,
		endTime = waveStart(4)+45,
		callback = function()
			Spawners:SpawnGhostBane()
			return 60.0
		end
	})
	Timers:CreateTimer(waveEnd(4), function()
		Spawners:StopSpawner("bane")
	end)
		
	end
------------------------------------------------------------------------------------------------	
---------------- END OF GOLEM AND GHOST PHASE SPAWNERS -----------------------------------------
------------------------------------------------------------------------------------------------
	
	
-----------------------------------------------------------------------------------------------	
---------------- START OF GUARD AND CENTAUR PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	local rand = RandomInt(1,2)
	if rand == 1 then

-------- Guard Wave

	Timers:CreateTimer("guard", {
		useGameTime = true,
		endTime = waveStart(5),
		callback = function()
			Spawners:SpawnGuardTop()
			Spawners:SpawnGuardMid()
			Spawners:SpawnGuardBot()
			return 27.0
		end
	})
	Timers:CreateTimer(waveEnd(5), function()
		Spawners:StopSpawner("guard")
	end)
	
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = waveStart(5)+5,
		callback = function()
		Spawners:SpawnTrollTop()
		Spawners:SpawnTrollMid()
		Spawners:SpawnTrollBot()
			return 27.0
		end
	})
	Timers:CreateTimer(waveEnd(5), function()
		Spawners:StopSpawner("troll")
	end)
  
   Timers:CreateTimer(waveBoss(5), function()
		Spawners:SpawnGuardBoss()
		return 3000.0
    end)

	Timers:CreateTimer("rippers", {
		useGameTime = true,
		endTime = waveStart(5),
		callback = function()
			Spawners:SpawnRippers()
			return 27.0
		end
	})
	Timers:CreateTimer(waveEnd(5), function()
		Spawners:StopSpawner("rippers")
	end)
	
	else 
	
-------   Centaur Wave
	
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = waveStart(5),
		callback = function()
			Spawners:SpawnCentaurTop()
			Spawners:SpawnCentaurMid()
			Spawners:SpawnCentaurBot()
			return 33.0
		end
	})
	Timers:CreateTimer(waveEnd(5), function()
		Spawners:StopSpawner("centaur")
	end)
	Timers:CreateTimer("minion", {
		useGameTime = true,
		endTime = waveStart(5),
		callback = function()
			Spawners:SpawnMinionTop()
			Spawners:SpawnMinionMid()
			Spawners:SpawnMinionBot()
			return 36.0
		end
	})
	Timers:CreateTimer(waveEnd(5), function()
		Spawners:StopSpawner("minion")
	end)
	Timers:CreateTimer("bigdrake", {
		useGameTime = true,
		endTime = waveStart(5)+20,
		callback = function()
			Spawners:SpawnBigDrake()
			return 46.0
		end
	})
	Timers:CreateTimer(waveEnd(5), function()
		Spawners:StopSpawner("bigdrake")
	end)

	
    Timers:CreateTimer(waveBoss(5), function()
		Spawners:SpawnCentaurBoss()
		return 3000.0
    end)
	
	end
	
---------------------------------------------------------------------------------------------	
---------------- END OF GUARD AND CENTAUR PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	
	
	---------------------------------------------------------------------------------------------	
---------------- START OF DEMON AND DRAGON PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------		

	local rand = RandomInt(1,2)
	if rand == 1 then


------ Demon Wave

	Timers:CreateTimer("demon", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnDemonTop()
			Spawners:SpawnDemonMid()
			Spawners:SpawnDemonBot()
			return 38.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("demon")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnDemonDogTop()
			Spawners:SpawnDemonDogMid()
			Spawners:SpawnDemonDogBot()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnMiniDemonTop()
			Spawners:SpawnMiniDemonMid()
			Spawners:SpawnMiniDemonBot()
			return 25.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("minidemon")
	end)
	
------- Dragon Wave

	else

	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnDragonTop()
			Spawners:SpawnDragonMid()
			Spawners:SpawnDragonBot()
			return 33.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("dragon")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnStalkerTop()
			Spawners:SpawnStalkerMid()
			Spawners:SpawnStalkerBot()
			return 27.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("stalker")
	end)
	Timers:CreateTimer("bird", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnBird()
			return 32.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("bird")
	end)
	Timers:CreateTimer("bigbird", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnBigBirdTop()
			Spawners:SpawnBigBirdMid()
			Spawners:SpawnBigBirdBot()
			return 100.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("bigbird")
	end)	
	Timers:CreateTimer("gargoyle", {
		useGameTime = true,
		endTime = waveStart(6),
		callback = function()
			Spawners:SpawnGargoyleTop()
			Spawners:SpawnGargoyleMid()
			Spawners:SpawnGargoyleBot()
			return 30.0
		end
	})
	Timers:CreateTimer(waveEnd(6), function()
		Spawners:StopSpawner("gargoyle")
	end)
	
	end
---------------------------------------------------------------------------------------------	
---------------- END OF DEMON AND DRAGON PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------

	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = waveStart(7),
		callback = function()
			Spawners:SpawnAA()
			return 140.0
		end
	})
	Timers:CreateTimer(waveEnd(7), function()
		Spawners:StopSpawner("AA")
	end)

	Timers:CreateTimer("roshan2", {
		useGameTime = true,
		endTime = waveStart(7),
		callback = function()
			Spawners:SpawnRoshTop()
			Spawners:SpawnRoshMid()
			Spawners:SpawnRoshBot()
			return 50.0
		end
	})
	Timers:CreateTimer(waveEnd(7), function()
		Spawners:StopSpawner("roshan2")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = waveStart(7),
		callback = function()
			Spawners:SpawnLizardTop()
			Spawners:SpawnLizardMid()
			Spawners:SpawnLizardBot()
			return 45.0
		end
	})
	Timers:CreateTimer(waveEnd(7), function()
		Spawners:StopSpawner("lizard")
	end)
	Timers:CreateTimer("miniroshan", {
		useGameTime = true,
		endTime = waveStart(7)+15,
		callback = function()
			Spawners:SpawnMiniRosh()
			return 43.0
		end
	})
	Timers:CreateTimer(waveEnd(7), function()
		Spawners:StopSpawner("miniroshan")
	end)

---------------------------------------------------------------------------------------------	
---------------- START OF FINAL PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	Timers:CreateTimer("ogrebossfinal", {
		useGameTime = true,
		endTime = waveStart(8),
		callback = function()
			Spawners:SpawnOgreBossBot()
			Spawners:SpawnOgreBossTop()
			return 150.0
		end
	})
	Timers:CreateTimer("bearbossfinal", {
		useGameTime = true,
		endTime = waveStart(8)+20,
		callback = function()
			Spawners:SpawnBigBear()
			return 100.0
		end
	})
	Timers:CreateTimer("kingwolffinal", {
		useGameTime = true,
		endTime = waveStart(8)+40,
		callback = function()
			Spawners:SpawnKingWolf()
			return 70.0
		end
	})
	Timers:CreateTimer("bigsplitter", {
		useGameTime = true,
		endTime = waveStart(8)+60,
		callback = function()
			Spawners:SpawnBigSplitter()
			return 130.0
		end
	})
	Timers:CreateTimer("ghostfinal", {
		useGameTime = true,
		endTime = waveStart(8)+80,
		callback = function()
			Spawners:SpawnBigGhost()
			return 80.0
		end
	})
	Timers:CreateTimer("ghost3", {
		useGameTime = true,
		endTime = waveStart(8)+100,
		callback = function()
			Spawners:SpawnGhostTop()
			Spawners:SpawnGhostBot()
			return 27.0
		end
	})
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = waveStart(8)+120,
		callback = function()
			Spawners:SpawnDragonTop()
			Spawners:SpawnDragonBot()
			return 80.0
		end
	})

	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = waveStart(8),
		callback = function()
			Spawners:SpawnDemonTop()
			return 75.0
		end
	})
	Timers:CreateTimer("wolffang2", {
		useGameTime = true,
		endTime = waveStart(8)+40,
		callback = function()
			Spawners:SpawnWolfFangTop()
			Spawners:SpawnWolfFangBot()
			return 100.0
		end
	})
	
	Timers:CreateTimer("shroom2", {
		useGameTime = true,
		endTime = waveStart(8),
		callback = function()
			Spawners:SpawnShroomTop()
			Spawners:SpawnShroomBot()
			return 43.0
		end
	})
	Timers:CreateTimer("zombie3", {
		useGameTime = true,
		endTime = waveStart(8),
		callback = function()
			Spawners:SpawnCorpseTop()
			return 30.0
		end
	})
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = waveStart(8),
		callback = function()
		Spawners:SpawnTrollTop()
		Spawners:SpawnTrollBot()
			return 55.0
		end
	})
	Timers:CreateTimer("splitter2", {
		useGameTime = true,
		endTime = waveStart(8),
		callback = function()
			Spawners:SpawnSplitterTop()
			Spawners:SpawnSplitterMid()
			Spawners:SpawnSplitterBot()
			return 120.0
		end
	})
	Timers:CreateTimer("chickenfinal", {
		useGameTime = true,
		endTime = waveStart(8)+190,
		callback = function()
			Spawners:SpawnChickenTop()
			Spawners:SpawnChickenMid()
			return 90.0
		end
	})
	Timers:CreateTimer("kappafinal", {
		useGameTime = true,
		endTime = waveStart(8)+190,
		callback = function()
			Spawners:SpawnKappaTop()
			Spawners:SpawnKappa()
			return 100.0
		end
	})
	Timers:CreateTimer("bigsatyrsfinal", {
		useGameTime = true,
		endTime = waveStart(8)+240,
		callback = function()
			Spawners:SpawnBigSatyrs()
			return 35.0
		end
	})

	Timers:CreateTimer("miniroshan", {
		useGameTime = true,
		endTime = waveStart(8)+300,
		callback = function()
			Spawners:SpawnMiniRosh()
			return 43.0
		end
	})

---------------------------------------------------------------------------------------------	
---------------- END OF FINAL PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	


--------------------------------------------------------------------------
---------------- Neutral Camps/Map Spawns --------------------------------
--------------------------------------------------------------------------

    Timers:CreateTimer(0, function()
		Spawners:SpawnFriend()
		Spawners:SpawnFriend2()
		Spawners:SpawnFriend3()
		return 30.0
    end)
    Timers:CreateTimer(1, function()
		Spawners:SpawnFriend()
		Spawners:SpawnFriend2()
		Spawners:SpawnFriend3()
		return 30.0
    end)	
    Timers:CreateTimer(2, function()
		Spawners:SpawnFriend()
		Spawners:SpawnFriend2()
		Spawners:SpawnFriend3()
		return 30.0
    end)

	Timers:CreateTimer(0, function()
		Spawners:SpawnDefender1()
		return 30.0
    end)
	Timers:CreateTimer(0, function()
		Spawners:SpawnDefender2()
		return 30.0
    end)

	if difficulty < 2 then
		Timers:CreateTimer(0, function()
			Spawners:SpawnMapBoss()
			return 3000.0
	    end)
	end
	
	Timers:CreateTimer("money", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			Spawners:SpawnMoney()
			return 150.0
		end
	})
	Timers:CreateTimer(waveEnd(3), function()
		Spawners:StopSpawner("money")
	end) 
	
	
	
	end



-- Function to stop spawners

function Spawners:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end