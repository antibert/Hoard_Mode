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
    Timers:CreateTimer(700, function()
		SpawnersMedium:SpawnBigBear()
		return 3000.0
    end)
    Timers:CreateTimer(860, function()
		SpawnersMedium:SpawnOgreBoss()
		return 3000.0
    end)
    Timers:CreateTimer(1600, function()
		SpawnersMedium:SpawnCentaurBoss()
		return 3000.0
    end)
    Timers:CreateTimer(2040, function()
		SpawnersMedium:SpawnFuckYou()
		return 3000.0
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

-- SECOND WAVE: Zombies/bears

	Timers:CreateTimer("zombie", {
		useGameTime = true,
		endTime = 180,
		callback = function()
			SpawnersMedium:SpawnZombies()
			return 20.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie3", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnZombies()
			return 13.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("zombie3")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 250,
		callback = function()
			SpawnersMedium:SpawnZombies2()
			return 30.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("corpse", {
		useGameTime = true,
		endTime = 360,
		callback = function()
			SpawnersMedium:SpawnCorpse()
			return 40.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersMedium:StopSpawner("corpse")
	end)
	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersMedium:SpawnSpookiTop()
			SpawnersMedium:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("spooki1")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = 420,
		callback = function()
			SpawnersMedium:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(540, function()
		SpawnersMedium:StopSpawner("nyx")
	end)
	Timers:CreateTimer("nyx2", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			SpawnersMedium:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersMedium:StopSpawner("nyx2")
	end)
	Timers:CreateTimer("drake", {
		useGameTime = true,
		endTime = 540,
		callback = function()
			SpawnersMedium:SpawnDrake()
			return 23.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("drake")
	end)
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
	Timers:CreateTimer("shroom2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnShroomTop()
			Spawners:SpawnShroomMid()
			Spawners:SpawnShroomBot()
			return 43.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("shroom2")
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
			return 35.0
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
			return 23.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("splitter")
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
			return 27.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("ghostmeele")
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
		
	end
------------------------------------------------------------------------------------------------	
---------------- END OF GOLEM AND GHOST PHASE SPAWNERS -----------------------------------------
------------------------------------------------------------------------------------------------
	Timers:CreateTimer("splitter2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnSplitterTop()
			SpawnersMedium:SpawnSplitterBot()
			return 30.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("splitter2")
	end)
	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = 1275,
		callback = function()
			SpawnersMedium:SpawnRhinoTop()
			SpawnersMedium:SpawnRhinoMid()
			SpawnersMedium:SpawnRhinoBot()
			return 46.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("rhino")
	end)
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
	Timers:CreateTimer("hellbear2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("hellbear2")
	end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersMedium:SpawnGhostMeele()
			return 27.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersMedium:SpawnGhost()
			return 10.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersMedium:StopSpawner("ghost")
	end)
	Timers:CreateTimer("guard", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			SpawnersMedium:SpawnGuardTop()
			SpawnersMedium:SpawnGuardMid()
			SpawnersMedium:SpawnGuardBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("guard")
	end)
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = 1560,
		callback = function()
			SpawnersMedium:SpawnCentaurTop()
			SpawnersMedium:SpawnCentaurMid()
			SpawnersMedium:SpawnCentaurBot()
			return 37.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("centaur")
	end)
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
		SpawnersMedium:SpawnTrollTop()
		SpawnersMedium:SpawnTrollMid()
		SpawnersMedium:SpawnTrollBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersMedium:StopSpawner("troll")
	end)
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = 2260,
		callback = function()
		SpawnersMedium:SpawnTrollTop()
		SpawnersMedium:SpawnTrollMid()
		SpawnersMedium:SpawnTrollBot()
			return 28.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("troll2")
	end)
	Timers:CreateTimer("demon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			SpawnersMedium:SpawnDemonTop()
			SpawnersMedium:SpawnDemonMid()
			SpawnersMedium:SpawnDemonBot()
			return 46.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("demon")
	end)
	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnDemonBot()
			return 55.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("demon2")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = 3500,
		callback = function()
			SpawnersMedium:SpawnDemonDogTop()
			SpawnersMedium:SpawnDemonDogMid()
			SpawnersMedium:SpawnDemonDogBot()
			return 35.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = 1800,
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
	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = 1860,
		callback = function()
			SpawnersMedium:SpawnDragonTop()
			SpawnersMedium:SpawnDragonMid()
			SpawnersMedium:SpawnDragonBot()
			return 40.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersMedium:StopSpawner("dragon")
	end)
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersMedium:SpawnDragonTop()
			SpawnersMedium:SpawnDragonMid()
			SpawnersMedium:SpawnDragonBot()
			return 50.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersMedium:StopSpawner("dragon2")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = 1840,
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
	Timers:CreateTimer("roshan", {
		useGameTime = true,
		endTime = 2115,
		callback = function()
			SpawnersMedium:SpawnRoshTop()
			SpawnersMedium:SpawnRoshMid()
			SpawnersMedium:SpawnRoshBot()
			return 50.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersMedium:StopSpawner("roshan")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			SpawnersMedium:SpawnLizardTop()
			SpawnersMedium:SpawnLizardMid()
			SpawnersMedium:SpawnLizardBot()
			return 45.0
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

Timers:CreateTimer("spiderling", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersMedium:SpawnSpiderlings()
			return 35.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersMedium:StopSpawner("spiderling")
	end)
Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersMedium:SpawnCoolSpiders()
			return 38.0
		end
	})
	Timers:CreateTimer(330, function()
		SpawnersMedium:StopSpawner("cool")
	end)
Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersMedium:SpawnSpiders()
			return 18.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersMedium:StopSpawner("spiders")
	end)
Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersMedium:SpawnMiniSpiders()
			return 23.0
		end
	})
	Timers:CreateTimer(330, function()
		SpawnersMedium:StopSpawner("mini")
	end)
Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 330,
		callback = function()
			SpawnersMedium:SpawnBigSpiders()
			return 55.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersMedium:StopSpawner("big")
	end)
Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			SpawnersMedium:SpawnBears()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("bears")
	end)
Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 720,
		callback = function()
			SpawnersMedium:SpawnLargeBears()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersMedium:StopSpawner("largebears")
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
	
	
	
	end



-- Function to stop spawners

function SpawnersMedium:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end