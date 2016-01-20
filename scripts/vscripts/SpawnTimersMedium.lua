if SpawnerTimersMedium == nil then
	SpawnerTimersMedium = class({})
end

require('libraries/timers')

function SpawnersMedium:StartSpawners()

-- BOSSES
	
	Timers:CreateTimer(500, function()
		SpawnersMedium:SpawnRoshan()
		return 3000.0
    end)
    Timers:CreateTimer(860, function()
		SpawnersMedium:SpawnOgreBoss()
		return 3000.0
    end)
    Timers:CreateTimer(2000, function()
		SpawnersMedium:SpawnFuckYou()
		return 530.0
    end)
 
-- FIRST WAVE: Gnolls and Birds. 

	Timers:CreateTimer("gnolls", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			SpawnersMedium:SpawnGnollsTop()
			SpawnersMedium:SpawnGnollsMid()
			return 30.0
		end
	})
	Timers:CreateTimer(180, function()
		SpawnersMedium:StopSpawner("gnolls")
	end)		
	Timers:CreateTimer("bazz", {
		useGameTime = true,
		endTime = 60,
		callback = function()
			SpawnersMedium:SpawnBazzTop()
			SpawnersMedium:SpawnBazzMid()
			return 23.0
		end
	})
	Timers:CreateTimer(180, function()
		SpawnersMedium:StopSpawner("bazz")
	end)

-----------------------------------------------------------------------------------------------	
---------------- START OF ZOMBIE, SPIDER AND MECH PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	-- RANDOM SPAWNER BLOCK 50/50 CHANCE TO TRIGGER EITHER
	local rand = RandomInt(1,3)
	if rand == 1 then
	
--------------------- Zombie Wave
	
	Timers:CreateTimer("zombie", {
		useGameTime = true,
		endTime = 180,
		callback = function()
			SpawnersMedium:SpawnZombiesTop()
			SpawnersMedium:SpawnZombies()
			return 20.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 250,
		callback = function()
			SpawnersMedium:SpawnZombies2()
			SpawnersMedium:SpawnZombies2Bot()
			return 30.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("corpse", {
		useGameTime = true,
		endTime = 340,
		callback = function()
			SpawnersMedium:SpawnCorpseTop()
			SpawnersMedium:SpawnCorpse()
			return 40.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("corpse")
	end)

	elseif rand == 2 then
	
-------------------- Spider Wave
	
	Timers:CreateTimer("spiderling", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersMedium:SpawnSpiderlings()
			SpawnersMedium:SpawnSpiderlingsMid()
			return 35.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("spiderling")
	end)
	Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersMedium:SpawnCoolSpiders()
			SpawnersMedium:SpawnCoolSpidersMid()
			return 38.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("cool")
	end)
	Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersMedium:SpawnSpiders()
			SpawnersMedium:SpawnSpidersMid()
			return 18.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("spiders")
	end)
	Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersMedium:SpawnMiniSpiders()
			SpawnersMedium:SpawnMiniSpidersMid()
			return 23.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("mini")
	end)
	Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 330,
		callback = function()
			SpawnersMedium:SpawnBigSpiders()
			SpawnersMedium:SpawnBigSpidersMid()
			return 55.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("big")
	end)
	
	elseif rand == 3 then
	
------------------------------- Mech Wave

	Timers:CreateTimer("hulk", {
		useGameTime = true,
		endTime = 180,
		callback = function()
			SpawnersMedium:SpawnHulkTop()
			SpawnersMedium:SpawnHulk()
			return 30.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("hulk")
	end)
	Timers:CreateTimer("hulkmedium", {
		useGameTime = true,
		endTime = 200,
		callback = function()
			SpawnersMedium:SpawnHulkMediumTop()
			SpawnersMedium:SpawnHulkMedium()
			return 30.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("hulkmedium")
	end)
	
	Timers:CreateTimer("hulkbig", {
		useGameTime = true,
		endTime = 275,
		callback = function()
			SpawnersMedium:SpawnHulkBigTop()
			SpawnersMedium:SpawnHulkBig()
			return 50.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("hulkbig")
	end)
	
	Timers:CreateTimer("kappa", {
		useGameTime = true,
		endTime = 310,
		callback = function()
			SpawnersMedium:SpawnKappaTop()
			SpawnersMedium:SpawnKappa()
			return 200.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("kappa")
	end)
	
	Timers:CreateTimer("babykappa", {
		useGameTime = true,
		endTime = 200,
		callback = function()
			SpawnersMedium:SpawnBabyKappaTop()
			SpawnersMedium:SpawnBabyKappa()
			return 40.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("babykappa")
	end)	
	
	
	end
	
	-----------------------------------------------------------------------------------------------	
---------------- END OF ZOMBIE AND SPIDER PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 420,
		callback = function()
			SpawnersMedium:SpawnSpookiTop()
			SpawnersMedium:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("spooki1")
	end)
	
-----------------------------------------------------------------------------------------------	
---------------- START OF BEAR/HARPY PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	
	

	local rand = RandomInt(1,2)
	if rand == 1 then	

---------- Harpy Wave:	
	
	Timers:CreateTimer("drake", {
		useGameTime = true,
		endTime = 540,
		callback = function()
			SpawnersMedium:SpawnDrake()
			SpawnersMedium:SpawnDrakeTop()
			return 26.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("drake")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = 420,
		callback = function()
			SpawnersMedium:SpawnNyx()
			SpawnersMedium:SpawnNyxTop()
			return 30.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("nyx")
	end)
	Timers:CreateTimer("nyx2", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			SpawnersMedium:SpawnNyx()
			return 60.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("nyx2")
	end)
	Timers:CreateTimer("chicken", {
		useGameTime = true,
		endTime = 450,
		callback = function()
			SpawnersMedium:SpawnChickenTop()
			SpawnersMedium:SpawnChickenMid()
			return 30.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("chicken")
	end)	
    Timers:CreateTimer(700, function()
		SpawnersMedium:SpawnBigNyx()
		return 3000.0
    end)	
	
	
	else
	
------------- Bear Wave
	
Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = 520,
		callback = function()
			SpawnersMedium:SpawnBears()
			SpawnersMedium:SpawnBearsMid()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("bears")
	end)
Timers:CreateTimer("slarks", {
		useGameTime = true,
		endTime = 450,
		callback = function()
			SpawnersMedium:SpawnSlarks()
			SpawnersMedium:SpawnSlarksMid()
			return 30.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("slarks")
	end)
Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 660,
		callback = function()
			SpawnersMedium:SpawnLargeBears()
			SpawnersMedium:SpawnLargeBearsMid()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("largebears")
	end)  	
    Timers:CreateTimer(700, function()
		SpawnersMedium:SpawnBigBear()
		return 3000.0
    end)
	
	end	
	
-----------------------------------------------------------------------------------------------	
---------------- END OF BEAR/HARPY PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

    Timers:CreateTimer("spooki", {
		useGameTime = true,
		endTime = 1980,
		callback = function()
			SpawnersMedium:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(2160, function()
		SpawnersMedium:StopSpawner("spooki")
	end)
-----------------------------------------------------------------------------------------------	
---------------- START OF TREE AND WOLF PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	-- RANDOM SPAWNER BLOCK 50/50 CHANCE TO TRIGGER EITHER
	local rand = RandomInt(1,2)
	if rand == 1 then
	
	---------------- Tree Wave

	Timers:CreateTimer("prophet", {
		useGameTime = true,
		endTime = 1050,
		callback = function()
			SpawnersMedium:SpawnProphet()
			return 48.0
		end 
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("prophet")
	end)
	Timers:CreateTimer("tree", {
		useGameTime = true,
		endTime = 1030,
		callback = function()
			SpawnersMedium:SpawnTreesTop()
			SpawnersMedium:SpawnTreesMid()
			SpawnersMedium:SpawnTreesBot()
			return 12.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("tree")
	end)
	Timers:CreateTimer("shroom", {
		useGameTime = true,
		endTime = 1065,
		callback = function()
			SpawnersMedium:SpawnShroomTop()
			SpawnersMedium:SpawnShroomMid()
			SpawnersMedium:SpawnShroomBot()
			return 45.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("shroom")
	end)
	Timers:CreateTimer("fang", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			SpawnersMedium:SpawnFangTop()
			SpawnersMedium:SpawnFangMid()
			SpawnersMedium:SpawnFangBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("fang")
	end)    
	Timers:CreateTimer("thing", {
		useGameTime = true,
		endTime = 1035,
		callback = function()
			SpawnersMedium:SpawnThing()
			return 35.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("thing")
	end)
	Timers:CreateTimer("stump", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			SpawnersMedium:SpawnStump()
			return 3000.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("stump")
	end)
    Timers:CreateTimer(1130, function()
		SpawnersMedium:SpawnKingTree()
		return 3000.0
    end)
	
	---------------- Wolf Wave
	
	else
	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			SpawnersMedium:SpawnRhinoTop()
			SpawnersMedium:SpawnRhinoMid()
			SpawnersMedium:SpawnRhinoBot()
			return 90.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("rhino")
	end)
	Timers:CreateTimer("wolffang", {
		useGameTime = true,
		endTime = 1030,
		callback = function()
			SpawnersMedium:SpawnWolfFangTop()
			SpawnersMedium:SpawnWolfFangMid()
			SpawnersMedium:SpawnWolfFangBot()
			return 35.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("wolffang")
	end)
	Timers:CreateTimer("greathound", {
		useGameTime = true,
		endTime = 1050,
		callback = function()
			SpawnersMedium:SpawnGreatHound()
			return 60.0
		end 
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("greathound")
	end)
	Timers:CreateTimer("packleader", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			SpawnersMedium:SpawnPackLeaderMid()
			SpawnersMedium:SpawnPackLeaderBot()
			SpawnersMedium:SpawnPackLeaderTop()
			return 60.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("packleader")
	end)
	Timers:CreateTimer("hound", {
		useGameTime = true,
		endTime = 1090,
		callback = function()
			SpawnersMedium:SpawnHoundTop()
			SpawnersMedium:SpawnHoundMid()
			SpawnersMedium:SpawnHoundBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("hound")
	end)    
	Timers:CreateTimer("rabid", {
		useGameTime = true,
		endTime = 1035,
		callback = function()
			SpawnersMedium:SpawnRabid()
			return 30.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("rabid")
	end)
    Timers:CreateTimer(1130, function()
		SpawnersMedium:SpawnKingWolf()
		return 3000.0
    end)
	end
------------------------------------------------------------------------------------------------	
---------------- END OF TREE AND WOLF PHASE SPAWNERS ------------------------------------------------
------------------------------------------------------------------------------------------------
	Timers:CreateTimer("ogreboss", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnOgreBoss()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("ogreboss")
	end)
------------------------------------------------------------------------------------------------
---------------- START OF GOLEM AND GHOST PHASE SPAWNERS ---------------------------------------
------------------------------------------------------------------------------------------------
	local rand = RandomInt(1,2)
	if rand == 1 then

	---------------- Golem Wave
    Timers:CreateTimer(1320, function()
		SpawnersMedium:SpawnBigSplitter()
		return 3000.0
    end)	
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = 1260,
		callback = function()
			SpawnersMedium:SpawnSplitterTop()
			SpawnersMedium:SpawnSplitterMid()
			SpawnersMedium:SpawnSplitterBot()
			return 23.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("splitter")
	end)
	Timers:CreateTimer("rock", {
		useGameTime = true,
		endTime = 1240,
		callback = function()
			SpawnersMedium:SpawnRockTop()
			SpawnersMedium:SpawnRockMid()
			SpawnersMedium:SpawnRockBot()
			return 120.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("rock")
	end)

  ---------------- Ghost Wave	
	
	else
	
    Timers:CreateTimer(1320, function()
		SpawnersMedium:SpawnBigGhost()
		return 3000.0
    end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersMedium:SpawnGhostMeeleTop()
		    SpawnersMedium:SpawnGhostMeeleMid()
		    SpawnersMedium:SpawnGhostMeeleBot()
			return 23.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghostmeelesmall", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersMedium:SpawnGhostMeeleSmallTop()
		    SpawnersMedium:SpawnGhostMeeleSmallMid()
		    SpawnersMedium:SpawnGhostMeeleSmallBot()
			return 17.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("ghostmeelesmall")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersMedium:SpawnGhostTop()
			SpawnersMedium:SpawnGhostMid()
			SpawnersMedium:SpawnGhostBot()
			return 14.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("ghost")
	end)
	Timers:CreateTimer("ghost2", {
		useGameTime = true,
		endTime = 1315,
		callback = function()
			SpawnersMedium:SpawnGhostMeele2()
			return 40.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("ghost2")
	end)
	Timers:CreateTimer("bane", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersMedium:SpawnGhostBane()
			return 50.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("bane")
	end)
		
	end
------------------------------------------------------------------------------------------------	
---------------- END OF GOLEM AND GHOST PHASE SPAWNERS -----------------------------------------
------------------------------------------------------------------------------------------------

	Timers:CreateTimer("hellbear", {
		useGameTime = true,
		endTime = 1300,
		callback = function()
			SpawnersMedium:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("hellbear")
	end)
	
-----------------------------------------------------------------------------------------------	
---------------- START OF GUARD AND CENTAUR PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	local rand = RandomInt(1,2)
	if rand == 1 then

-------- Guard Wave

	Timers:CreateTimer("guard", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			SpawnersMedium:SpawnGuardTop()
			SpawnersMedium:SpawnGuardMid()
			SpawnersMedium:SpawnGuardBot()
			return 23.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("guard")
	end)
	
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
		SpawnersMedium:SpawnTrollTop()
		SpawnersMedium:SpawnTrollMid()
		SpawnersMedium:SpawnTrollBot()
			return 23.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("troll")
	end)
  
   Timers:CreateTimer(1600, function()
		SpawnersMedium:SpawnGuardBoss()
		return 3000.0
    end)
	
	else 
	
-------   Centaur Wave
	
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			SpawnersMedium:SpawnCentaurTop()
			SpawnersMedium:SpawnCentaurMid()
			SpawnersMedium:SpawnCentaurBot()
			return 30.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("centaur")
	end)
	Timers:CreateTimer("minion", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			SpawnersMedium:SpawnMinionTop()
			SpawnersMedium:SpawnMinionMid()
			SpawnersMedium:SpawnMinionBot()
			return 34.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("minion")
	end)
	Timers:CreateTimer("bigdrake", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			SpawnersMedium:SpawnBigDrake()
			return 40.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("bigdrake")
	end)
	
    Timers:CreateTimer(1600, function()
		SpawnersMedium:SpawnCentaurBoss()
		return 3000.0
    end)
	
	end
	
---------------------------------------------------------------------------------------------	
---------------- END OF GUARD AND CENTAUR PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	


---------------------------------------------------------------------------------------------	
---------------- START OF DEMON AND DRAGON PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------		

	local rand = RandomInt (1,2)
	if rand == 1 then


------ Demon Wave

	Timers:CreateTimer("demon", {
		useGameTime = true,
		endTime = 1730,
		callback = function()
			SpawnersMedium:SpawnDemonTop()
			SpawnersMedium:SpawnDemonMid()
			SpawnersMedium:SpawnDemonBot()
			return 40.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("demon")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = 3000,
		callback = function()
			SpawnersMedium:SpawnDemonDogTop()
			SpawnersMedium:SpawnDemonDogMid()
			SpawnersMedium:SpawnDemonDogBot()
			return 69.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = 1730,
		callback = function()
			SpawnersMedium:SpawnMiniDemonTop()
			SpawnersMedium:SpawnMiniDemonMid()
			SpawnersMedium:SpawnMiniDemonBot()
			return 20.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("minidemon")
	end)
	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			SpawnersMedium:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		SpawnersMedium:StopSpawner("AA")
	end)
	

	
------- Dragon Wave

	else

	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = 1730,
		callback = function()
			SpawnersMedium:SpawnDragonTop()
			SpawnersMedium:SpawnDragonMid()
			SpawnersMedium:SpawnDragonBot()
			return 33.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("dragon")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = 1740,
		callback = function()
			SpawnersMedium:SpawnStalkerTop()
			SpawnersMedium:SpawnStalkerMid()
			SpawnersMedium:SpawnStalkerBot()
			return 30.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("stalker")
	end)
	Timers:CreateTimer("bigbird", {
		useGameTime = true,
		endTime = 1740,
		callback = function()
			SpawnersMedium:SpawnBigBirdTop()
			SpawnersMedium:SpawnBigBirdMid()
			SpawnersMedium:SpawnBigBirdBot()
			return 100.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("bigbird")
	end)
	Timers:CreateTimer("gargoyle", {
		useGameTime = true,
		endTime = 1730,
		callback = function()
			SpawnersMedium:SpawnGargoyleTop()
			SpawnersMedium:SpawnGargoyleMid()
			SpawnersMedium:SpawnGargoyleBot()
			return 4.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("gargoyle")
	end)
	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			SpawnersMedium:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		SpawnersMedium:StopSpawner("AA")
	end)
	
	end
---------------------------------------------------------------------------------------------	
---------------- END OF DEMON AND DRAGON PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	
---------------------------------------------------------------------------------------------	
---------------- START OF FINAL PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	Timers:CreateTimer("ogrebossfinal", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnOgreBossBot()
			SpawnersMedium:SpawnOgreBossTop()
			return 125.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("ogrebossfinal")
	end)
	Timers:CreateTimer("bearbossfinal", {
		useGameTime = true,
		endTime = 2300,
		callback = function()
			SpawnersMedium:SpawnBigBear()
			return 90.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("bearbossfinal")
	end)
	Timers:CreateTimer("kingwolffinal", {
		useGameTime = true,
		endTime = 2330,
		callback = function()
			SpawnersMedium:SpawnKingWolf()
			return 70.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("kingwolffinal")
	end)
	Timers:CreateTimer("bigsplitter", {
		useGameTime = true,
		endTime = 2340,
		callback = function()
			SpawnersMedium:SpawnBigSplitter()
			return 130.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("bigsplitter")
	end)
	Timers:CreateTimer("ghostfinal", {
		useGameTime = true,
		endTime = 2410,
		callback = function()
			SpawnersMedium:SpawnBigGhost()
			return 80.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("ghostfinal")
	end)	
	Timers:CreateTimer("ghost3", {
		useGameTime = true,
		endTime = 2410,
		callback = function()
			SpawnersMedium:SpawnGhostTop()
			SpawnersMedium:SpawnGhostBot()
			return 27.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("ghost3")
	end)
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnDragonTop()
			SpawnersMedium:SpawnDragonMid()
			SpawnersMedium:SpawnDragonBot()
			return 80.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("dragon2")
	end)
	Timers:CreateTimer("chicken2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnChickenTop()
			SpawnersMedium:SpawnChickenMid()
			return 140.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("chicken2")
	end)
	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnDemonTop()
			return 75.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("demon2")
	end)
	Timers:CreateTimer("wolffang2", {
		useGameTime = true,
		endTime = 2320,
		callback = function()
			SpawnersMedium:SpawnWolfFangTop()
			SpawnersMedium:SpawnWolfFangMid()
			SpawnersMedium:SpawnWolfFangBot()
			return 100.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("wolffang2")
	end)
	
	Timers:CreateTimer("shroom2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnShroomTop()
			SpawnersMedium:SpawnShroomBot()
			return 43.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("shroom2")
	end)
	Timers:CreateTimer("zombie4", {
		useGameTime = true,
		endTime = 2270,
		callback = function()
			SpawnersMedium:SpawnCorpseTop()
			return 33.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("zombie4")
	end)			
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = 2260,
		callback = function()
		SpawnersMedium:SpawnTrollTop()
		SpawnersMedium:SpawnTrollMid()
		SpawnersMedium:SpawnTrollBot()
			return 55.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("troll2")
	end)
	
	Timers:CreateTimer("hellbear2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnHellBear()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("hellbear2")
	end)
	Timers:CreateTimer("splitter2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnMediumSplitterTop()
			SpawnersMedium:SpawnSplitterBot()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("splitter2")
	end)
	Timers:CreateTimer("kappafinal", {
		useGameTime = true,
		endTime = 2690,
		callback = function()
			SpawnersMedium:SpawnKappaTop()
			SpawnersMedium:SpawnKappa()
			return 100.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("kappafinal")
	end)
	Timers:CreateTimer("bigsatyrsfinal", {
		useGameTime = true,
		endTime = 2710,
		callback = function()
			SpawnersMedium:SpawnBigSatyrs()
			return 35.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("bigsatyrsfinal")
	end) 

---------------------------------------------------------------------------------------------	
---------------- END OF FINAL PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	Timers:CreateTimer("roshan2", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			SpawnersMedium:SpawnRoshTop()
			SpawnersMedium:SpawnRoshMid()
			SpawnersMedium:SpawnRoshBot()
			return 45.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersMedium:StopSpawner("roshan2")
	end)
	Timers:CreateTimer("miniroshan", {
		useGameTime = true,
		endTime = 2115,
		callback = function()
			SpawnersMedium:SpawnMiniRoshTop()
			SpawnersMedium:SpawnMiniRoshMid()
			SpawnersMedium:SpawnMiniRoshBot()
			return 43.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersMedium:StopSpawner("miniroshan")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = 2130,
		callback = function()
			SpawnersMedium:SpawnLizardTop()
			SpawnersMedium:SpawnLizardMid()
			SpawnersMedium:SpawnLizardBot()
			return 30.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersMedium:StopSpawner("lizard")
	end)
	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			SpawnersMedium:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		SpawnersMedium:StopSpawner("AA")
	end)
	
-- TOP LANE
	
Timers:CreateTimer("beast", {
		useGameTime = true,
		endTime = 140,
		callback = function()
			SpawnersMedium:SpawnBeast()
			return 60.0
		end
	})
	Timers:CreateTimer(210, function()
		SpawnersMedium:StopSpawner("beast")
	end) 

    
-- BOT LANE

   Timers:CreateTimer("frostogres", {
		useGameTime = true,
		endTime = 17,
		callback = function()
			SpawnersMedium:SpawnFrostOgres()
			return 53.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("frostogres")
	end)  
   Timers:CreateTimer("bird", {
		useGameTime = true,
		endTime = 35,
		callback = function()
			SpawnersMedium:SpawnBird()
			return 32.0
		end
	})
	Timers:CreateTimer(400, function()
		SpawnersMedium:StopSpawner("bird")
	end)   
   Timers:CreateTimer("ogres", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			SpawnersMedium:SpawnOgre()
			return 45.0
		end
	})
	Timers:CreateTimer(960, function()
		SpawnersMedium:StopSpawner("ogres")
	end)  
	Timers:CreateTimer("minisatyrs", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersMedium:SpawnMiniSatyrs()
			return 40.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("minisatyrs")
	end) 
	Timers:CreateTimer("rippers", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersMedium:SpawnRippers()
			return 17.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("rippers")
	end) 
	Timers:CreateTimer("satyrs", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersMedium:SpawnSatyrs()
			return 33.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("satyrs")
	end) 
	Timers:CreateTimer("bigsatyrs", {
		useGameTime = true,
		endTime = 780,
		callback = function()
			SpawnersMedium:SpawnBigSatyrs()
			return 41.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("bigsatyrs")
	end) 


-- Neutral Camps/Map Spawns

    Timers:CreateTimer(17, function()
		SpawnersMedium:SpawnFriend()
		return 30.0
    end)
    Timers:CreateTimer(18, function()
		SpawnersMedium:SpawnFriend()
		return 30.0
    end)	
    Timers:CreateTimer(19, function()
		SpawnersMedium:SpawnFriend()
		return 30.0
    end)		
	Timers:CreateTimer(0, function()
		SpawnersMedium:SpawnFriend2()
		return 3600.0
    end)
	Timers:CreateTimer(0, function()
		SpawnersMedium:SpawnFriend3()
		return 3600.0
    end)
	
	Timers:CreateTimer("money", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			SpawnersMedium:SpawnMoney()
			return 150.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersMedium:StopSpawner("money")
	end) 
	Timers:CreateTimer(0, function()
		SpawnersMedium:SpawnMapBoss()
		return 2000.0
    end)
	
	end



-- Function to stop spawners

function SpawnersMedium:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end