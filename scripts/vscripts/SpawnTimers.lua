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

function Spawners:StartSpawners()	
	
-- BOSSES
	
	Timers:CreateTimer(500, function()
		Spawners:SpawnRoshan()
		return 3000.0
    end)
    Timers:CreateTimer(860, function()
		Spawners:SpawnOgreBoss()
		return 3000.0
    end)
    Timers:CreateTimer(2000, function()
		Spawners:SpawnFuckYou()
		return 550.0
    end)
 
-- First Wave

	Timers:CreateTimer("gnolls", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			Spawners:SpawnGnollsTop()
			Spawners:SpawnGnollsMid()
			Spawners:SpawnGnollsBot()
			return 30.0
		end
	})
	Timers:CreateTimer(180, function()
		Spawners:StopSpawner("gnolls")
	end)	
	
	Timers:CreateTimer("bazz", {
		useGameTime = true,
		endTime = 60,
		callback = function()
			Spawners:SpawnBazzTop()
			Spawners:SpawnBazzMid()
			Spawners:SpawnBazzBot()
			return 23.0
		end
	})
	Timers:CreateTimer(180, function()
		Spawners:StopSpawner("bazz")
	end)
	
	Timers:CreateTimer("beast", {
		useGameTime = true,
		endTime = 140,
		callback = function()
			Spawners:SpawnBeast()
			return 60.0
		end
	})
	Timers:CreateTimer(210, function()
		Spawners:StopSpawner("beast")
	end)
	
-------- Will Always spawn:	

	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 420,
		callback = function()
			Spawners:SpawnSpookiTop()
			Spawners:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("spooki1")
	end)	
	
	Timers:CreateTimer("hellbear", {
		useGameTime = true,
		endTime = 1300,
		callback = function()
			Spawners:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("hellbear")
	end)
    Timers:CreateTimer("spooki", {
		useGameTime = true,
		endTime = 1980,
		callback = function()
			Spawners:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(2100, function()
		Spawners:StopSpawner("spooki")
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
			Spawners:SpawnZombiesTop()
			Spawners:SpawnZombies()
			return 23.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 250,
		callback = function()
			Spawners:SpawnZombies2()
			Spawners:SpawnZombies2Top()
			return 30.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("corpse", {
		useGameTime = true,
		endTime = 360,
		callback = function()
			Spawners:SpawnCorpseTop()
			Spawners:SpawnCorpse()
			return 40.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("corpse")
	end)

	elseif rand == 2 then
	
-------------------- Spider Wave
	
Timers:CreateTimer("spiderling", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			Spawners:SpawnSpiderlingsTop()
			Spawners:SpawnSpiderlingsMid()
			return 35.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("spiderling")
	end)
Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			Spawners:SpawnCoolSpidersTop()
			Spawners:SpawnCoolSpidersMid()
			return 38.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("cool")
	end)
Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			Spawners:SpawnSpidersTop()
			Spawners:SpawnSpidersMid()
			return 23.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("spiders")
	end)
Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			Spawners:SpawnMiniSpidersTop()
			Spawners:SpawnMiniSpidersMid()
			return 23.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("mini")
	end)
Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 330,
		callback = function()
			Spawners:SpawnBigSpidersTop()
			Spawners:SpawnBigSpidersMid()
			return 55.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("big")
	end)
	
	elseif rand == 3 then
	
------------------------------- Mech Wave

	Timers:CreateTimer("hulk", {
		useGameTime = true,
		endTime = 180,
		callback = function()
			Spawners:SpawnHulkTop()
			Spawners:SpawnHulk()
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
			Spawners:SpawnHulkMediumTop()
			Spawners:SpawnHulkMedium()
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
			Spawners:SpawnHulkBigTop()
			Spawners:SpawnHulkBig()
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
			Spawners:SpawnKappaTop()
			Spawners:SpawnKappa()
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
			Spawners:SpawnBabyKappaTop()
			Spawners:SpawnBabyKappa()
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
			Spawners:SpawnDrake()
			Spawners:SpawnDrakeTop()
			return 23.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("drake")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = 500,
		callback = function()
			Spawners:SpawnNyx()
			Spawners:SpawnNyxTop()
			return 30.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("nyx")
	end)
	Timers:CreateTimer("nyx2", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			Spawners:SpawnNyx()
			return 60.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("nyx2")
	end)
	Timers:CreateTimer("chicken", {
		useGameTime = true,
		endTime = 450,
		callback = function()
			Spawners:SpawnChickenTop()
			Spawners:SpawnChickenMid()
			return 100.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("chicken")
	end)
    Timers:CreateTimer(700, function()
		Spawners:SpawnBigNyx()
		return 3000.0
    end)	
	
	
	else
	
------------- Bear Wave
	
	Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = 540,
		callback = function()
			Spawners:SpawnBears()
			Spawners:SpawnBearsMid()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("bears")
	end)
	Timers:CreateTimer("slarks", {
		useGameTime = true,
		endTime = 500,
		callback = function()
			Spawners:SpawnSlarks()
			Spawners:SpawnSlarksMid()
			return 30.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("slarks")
	end)
	Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 660,
		callback = function()
			Spawners:SpawnLargeBears()
			Spawners:SpawnLargeBearsMid()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("largebears")
	end)  	
    Timers:CreateTimer(700, function()
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
		endTime = 1050,
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
		endTime = 1030,
		callback = function()
			Spawners:SpawnTreesTop()
			Spawners:SpawnTreesMid()
			Spawners:SpawnTreesBot()
			return 12.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("tree")
	end)
	Timers:CreateTimer("shroom", {
		useGameTime = true,
		endTime = 1065,
		callback = function()
			Spawners:SpawnShroomTop()
			Spawners:SpawnShroomMid()
			Spawners:SpawnShroomBot()
			return 45.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("shroom")
	end)
	Timers:CreateTimer("fang", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			Spawners:SpawnFangTop()
			Spawners:SpawnFangMid()
			Spawners:SpawnFangBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("fang")
	end)    
	Timers:CreateTimer("thing", {
		useGameTime = true,
		endTime = 1035,
		callback = function()
			Spawners:SpawnThing()
			return 35.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("thing")
	end)
	Timers:CreateTimer("stump", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			Spawners:SpawnStump()
			return 3000.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("stump")
	end)
    Timers:CreateTimer(1130, function()
		Spawners:SpawnKingTree()
		return 3000.0
    end)
	
	---------------- Wolf Wave
	
	else

	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			Spawners:SpawnRhinoTop()
			Spawners:SpawnRhinoMid()
			Spawners:SpawnRhinoBot()
			return 90.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("rhino")
	end)
	Timers:CreateTimer("wolffang", {
		useGameTime = true,
		endTime = 1030,
		callback = function()
			Spawners:SpawnWolfFangTop()
			Spawners:SpawnWolfFangMid()
			Spawners:SpawnWolfFangBot()
			return 37.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("wolffang")
	end)
	Timers:CreateTimer("greathound", {
		useGameTime = true,
		endTime = 1050,
		callback = function()
			Spawners:SpawnGreatHound()
			return 60.0
		end 
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("greathound")
	end)
	Timers:CreateTimer("packleader", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			Spawners:SpawnPackLeaderMid()
			Spawners:SpawnPackLeaderBot()
			Spawners:SpawnPackLeaderTop()
			return 60.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("packleader")
	end)
	Timers:CreateTimer("hound", {
		useGameTime = true,
		endTime = 1090,
		callback = function()
			Spawners:SpawnHoundTop()
			Spawners:SpawnHoundMid()
			Spawners:SpawnHoundBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("hound")
	end)    
	Timers:CreateTimer("rabid", {
		useGameTime = true,
		endTime = 1035,
		callback = function()
			Spawners:SpawnRabid()
			return 30.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("rabid")
	end)
    Timers:CreateTimer(1130, function()
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
    Timers:CreateTimer(1310, function()
		Spawners:SpawnBigSplitter()
		return 3000.0
    end)	
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = 1260,
		callback = function()
			Spawners:SpawnSplitterTop()
			Spawners:SpawnSplitterMid()
			Spawners:SpawnSplitterBot()
			return 34.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("splitter")
	end)

	Timers:CreateTimer("rock", {
		useGameTime = true,
		endTime = 1240,
		callback = function()
			Spawners:SpawnRockTop()
			Spawners:SpawnRockMid()
			Spawners:SpawnRockBot()
			return 120.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("rock")
	end)

  ---------------- Ghost Wave	
	
	else
	
    Timers:CreateTimer(1320, function()
		Spawners:SpawnBigGhost()
		return 3000.0
    end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners:SpawnGhostMeeleTop()
		    Spawners:SpawnGhostMeeleMid()
		    Spawners:SpawnGhostMeeleBot()
			return 23.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghostmeelesmall", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners:SpawnGhostMeeleSmallTop()
		    Spawners:SpawnGhostMeeleSmallMid()
		    Spawners:SpawnGhostMeeleSmallBot()
			return 17.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("ghostmeelesmall")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners:SpawnGhostTop()
			Spawners:SpawnGhostMid()
			Spawners:SpawnGhostBot()
			return 14.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("ghost")
	end)
	Timers:CreateTimer("ghost2", {
		useGameTime = true,
		endTime = 1315,
		callback = function()
			Spawners:SpawnGhostMeele2()
			return 40.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("ghost2")
	end)
	Timers:CreateTimer("bane", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners:SpawnGhostBane()
			return 60.0
		end
	})
	Timers:CreateTimer(1380, function()
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
		endTime = 1440,
		callback = function()
			Spawners:SpawnGuardTop()
			Spawners:SpawnGuardMid()
			Spawners:SpawnGuardBot()
			return 23.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("guard")
	end)
	
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = 1445,
		callback = function()
		Spawners:SpawnTrollTop()
		Spawners:SpawnTrollMid()
		Spawners:SpawnTrollBot()
			return 23.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("troll")
	end)
  
   Timers:CreateTimer(1600, function()
		Spawners:SpawnGuardBoss()
		return 3000.0
    end)
	
	else 
	
-------   Centaur Wave
	
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			Spawners:SpawnCentaurTop()
			Spawners:SpawnCentaurMid()
			Spawners:SpawnCentaurBot()
			return 30.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("centaur")
	end)
	Timers:CreateTimer("minion", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			Spawners:SpawnMinionTop()
			Spawners:SpawnMinionMid()
			Spawners:SpawnMinionBot()
			return 36.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("minion")
	end)
	Timers:CreateTimer("bigdrake", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			Spawners:SpawnBigDrake()
			return 46.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("bigdrake")
	end)

	
    Timers:CreateTimer(1600, function()
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
		endTime = 1730,
		callback = function()
			Spawners:SpawnDemonTop()
			Spawners:SpawnDemonMid()
			Spawners:SpawnDemonBot()
			return 46.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("demon")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = 2000,
		callback = function()
			Spawners:SpawnDemonDogTop()
			Spawners:SpawnDemonDogMid()
			Spawners:SpawnDemonDogBot()
			return 69.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = 1730,
		callback = function()
			Spawners:SpawnMiniDemonTop()
			Spawners:SpawnMiniDemonMid()
			Spawners:SpawnMiniDemonBot()
			return 27.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("minidemon")
	end)
	Timers:CreateTimer("AA2", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			Spawners:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		Spawners:StopSpawner("AA2")
	end)
	

	
------- Dragon Wave

	else

	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = 1730,
		callback = function()
			Spawners:SpawnDragonTop()
			Spawners:SpawnDragonMid()
			Spawners:SpawnDragonBot()
			return 33.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("dragon")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = 1740,
		callback = function()
			Spawners:SpawnStalkerTop()
			Spawners:SpawnStalkerMid()
			Spawners:SpawnStalkerBot()
			return 30.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("stalker")
	end)
	Timers:CreateTimer("bigbird", {
		useGameTime = true,
		endTime = 1740,
		callback = function()
			Spawners:SpawnBigBirdTop()
			Spawners:SpawnBigBirdMid()
			Spawners:SpawnBigBirdBot()
			return 100.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("bigbird")
	end)	
	Timers:CreateTimer("gargoyle", {
		useGameTime = true,
		endTime = 1730,
		callback = function()
			Spawners:SpawnGargoyleTop()
			Spawners:SpawnGargoyleMid()
			Spawners:SpawnGargoyleBot()
			return 4.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("gargoyle")
	end)

	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			Spawners:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		Spawners:StopSpawner("AA")
	end)
	
	end
---------------------------------------------------------------------------------------------	
---------------- END OF DEMON AND DRAGON PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	Timers:CreateTimer("roshan2", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			Spawners:SpawnRoshTop()
			Spawners:SpawnRoshMid()
			Spawners:SpawnRoshBot()
			return 50.0
		end
	})
	Timers:CreateTimer(2250, function()
		Spawners:StopSpawner("roshan2")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = 2130,
		callback = function()
			Spawners:SpawnLizardTop()
			Spawners:SpawnLizardMid()
			Spawners:SpawnLizardBot()
			return 45.0
		end
	})
	Timers:CreateTimer(2250, function()
		Spawners:StopSpawner("lizard")
	end)
	Timers:CreateTimer("miniroshan", {
		useGameTime = true,
		endTime = 2115,
		callback = function()
			Spawners:SpawnMiniRoshTop()
			Spawners:SpawnMiniRoshMid()
			Spawners:SpawnMiniRoshBot()
			return 43.0
		end
	})
	Timers:CreateTimer(2250, function()
		Spawners:StopSpawner("miniroshan")
	end)

---------------------------------------------------------------------------------------------	
---------------- START OF FINAL PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

	Timers:CreateTimer("ogrebossfinal", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnOgreBossBot()
			Spawners:SpawnOgreBossTop()
			return 150.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("ogrebossfinal")
	end)
	Timers:CreateTimer("bearbossfinal", {
		useGameTime = true,
		endTime = 2300,
		callback = function()
			Spawners:SpawnBigBear()
			return 100.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("bearbossfinal")
	end)
	Timers:CreateTimer("kingwolffinal", {
		useGameTime = true,
		endTime = 2330,
		callback = function()
			Spawners:SpawnKingWolf()
			return 70.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("kingwolffinal")
	end)
	Timers:CreateTimer("bigsplitter", {
		useGameTime = true,
		endTime = 2340,
		callback = function()
			Spawners:SpawnBigSplitter()
			return 130.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("bigsplitter")
	end)
	Timers:CreateTimer("ghostfinal", {
		useGameTime = true,
		endTime = 2410,
		callback = function()
			Spawners:SpawnBigGhost()
			return 80.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("ghostfinal")
	end)	
	Timers:CreateTimer("ghost3", {
		useGameTime = true,
		endTime = 2400,
		callback = function()
			Spawners:SpawnGhostTop()
			Spawners:SpawnGhostBot()
			return 27.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("ghost3")
	end)
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnDragonTop()
			Spawners:SpawnDragonBot()
			return 80.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("dragon2")
	end)

	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnDemonTop()
			return 75.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("demon2")
	end)
	Timers:CreateTimer("wolffang2", {
		useGameTime = true,
		endTime = 2320,
		callback = function()
			Spawners:SpawnWolfFangTop()
			Spawners:SpawnWolfFangBot()
			return 100.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("wolffang2")
	end)
	
	Timers:CreateTimer("shroom2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnShroomTop()
			Spawners:SpawnShroomBot()
			return 43.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("shroom2")
	end)
	Timers:CreateTimer("zombie3", {
		useGameTime = true,
		endTime = 2270,
		callback = function()
			Spawners:SpawnCorpseTop()
			return 30.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("zombie3")
	end)			
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = 2260,
		callback = function()
		Spawners:SpawnTrollTop()
		Spawners:SpawnTrollBot()
			return 55.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("troll2")
	end)
	Timers:CreateTimer("hellbear2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnHellBear()
			return 100.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("hellbear2")
	end)
	Timers:CreateTimer("splitter2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnMediumSplitterTop()
			Spawners:SpawnSplitterBot()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("splitter2")
	end)
	Timers:CreateTimer("chickenfinal", {
		useGameTime = true,
		endTime = 2690,
		callback = function()
			Spawners:SpawnChickenTop()
			Spawners:SpawnChickenMid()
			return 90.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("chickenfinal")
	end)
	Timers:CreateTimer("kappafinal", {
		useGameTime = true,
		endTime = 2690,
		callback = function()
			Spawners:SpawnKappaTop()
			Spawners:SpawnKappa()
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
			Spawners:SpawnBigSatyrs()
			return 35.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("bigsatyrsfinal")
	end) 

---------------------------------------------------------------------------------------------	
---------------- END OF FINAL PHASE SPAWNERS --------------------------------
-----------------------------------------------------------------------------------------------	

-- BOT LANE

   Timers:CreateTimer("frostogres", {
		useGameTime = true,
		endTime = 17,
		callback = function()
			Spawners:SpawnFrostOgres()
			return 53.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("frostogres")
	end)  
   Timers:CreateTimer("bird", {
		useGameTime = true,
		endTime = 35,
		callback = function()
			Spawners:SpawnBird()
			return 32.0
		end
	})
	Timers:CreateTimer(400, function()
		Spawners:StopSpawner("bird")
	end)  
   Timers:CreateTimer("ogres", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			Spawners:SpawnOgre()
			return 45.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners:StopSpawner("ogres")
	end)  
	Timers:CreateTimer("minisatyrs", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			Spawners:SpawnMiniSatyrs()
			return 40.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("minisatyrs")
	end) 
	Timers:CreateTimer("rippers", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			Spawners:SpawnRippers()
			return 17.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("rippers")
	end) 
	Timers:CreateTimer("satyrs", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			Spawners:SpawnSatyrs()
			return 33.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("satyrs")
	end) 
	Timers:CreateTimer("bigsatyrs", {
		useGameTime = true,
		endTime = 780,
		callback = function()
			Spawners:SpawnBigSatyrs()
			return 41.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("bigsatyrs")
	end) 


-- Neutral Camps/Map Spawns

    Timers:CreateTimer(17, function()
		Spawners:SpawnFriend()
		return 30.0
    end)
    Timers:CreateTimer(18, function()
		Spawners:SpawnFriend()
		return 30.0
    end)	
    Timers:CreateTimer(19, function()
		Spawners:SpawnFriend()
		return 30.0
    end)		
	Timers:CreateTimer(0, function()
		Spawners:SpawnFriend2()
		return 3600.0
    end)
	Timers:CreateTimer(0, function()
		Spawners:SpawnFriend3()
		return 3600.0
    end)

	Timers:CreateTimer(0, function()
		Spawners:SpawnMapBoss()
		return 3000.0
    end)
	
	Timers:CreateTimer("money", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			Spawners:SpawnMoney()
			return 150.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners:StopSpawner("money")
	end) 
	
	
	
	end



-- Function to stop spawners

function Spawners:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end