if SpawnTimers == nil then
	SpawnTimers = class({})
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
	
	Timers:CreateTimer(500, function()
		Spawners:SpawnRoshan()
		return 3000.0
    end)
    Timers:CreateTimer(700, function()
		Spawners:SpawnBigBear()
		return 3000.0
    end)
    Timers:CreateTimer(860, function()
		Spawners:SpawnOgreBoss()
		return 3000.0
    end)
    Timers:CreateTimer(1130, function()
		Spawners:SpawnKingTree()
		return 3000.0
    end)
    Timers:CreateTimer(1320, function()
		Spawners:SpawnBigSplitter()
		return 3000.0
    end)
    Timers:CreateTimer(1600, function()
		Spawners:SpawnCentaurBoss()
		return 3000.0
    end)
    Timers:CreateTimer(2060, function()
		Spawners:SpawnFuckYou()
		return 3000.0
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
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie3", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnZombies()
			return 13.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("zombie3")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 250,
		callback = function()
			Spawners:SpawnZombies2()
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
			Spawners:SpawnCorpse()
			return 40.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners:StopSpawner("corpse")
	end)
	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			Spawners:SpawnSpookiTop()
			Spawners:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("spooki1")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = 420,
		callback = function()
			Spawners:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(540, function()
		Spawners:StopSpawner("nyx")
	end)
	Timers:CreateTimer("nyx2", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			Spawners:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners:StopSpawner("nyx2")
	end)
	Timers:CreateTimer("drake", {
		useGameTime = true,
		endTime = 540,
		callback = function()
			Spawners:SpawnDrake()
			return 23.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("drake")
	end)
    Timers:CreateTimer("spooki", {
		useGameTime = true,
		endTime = 1980,
		callback = function()
			Spawners:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(2160, function()
		Spawners:StopSpawner("spooki")
	end)
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
	Timers:CreateTimer("ogreboss", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnOgreBoss()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("ogreboss")
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
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = 1260,
		callback = function()
			Spawners:SpawnSplitterTop()
			Spawners:SpawnSplitterMid()
			Spawners:SpawnSplitterBot()
			return 30.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("splitter")
	end)
	Timers:CreateTimer("splitter2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnSplitterTop()
			Spawners:SpawnSplitterBot()
			return 30.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("splitter2")
	end)
	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = 1275,
		callback = function()
			Spawners:SpawnRhinoTop()
			Spawners:SpawnRhinoMid()
			Spawners:SpawnRhinoBot()
			return 46.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("rhino")
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
	Timers:CreateTimer("hellbear2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("hellbear2")
	end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners:SpawnGhostMeele()
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
			Spawners:SpawnGhost()
			return 10.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners:StopSpawner("ghost")
	end)
	Timers:CreateTimer("guard", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			Spawners:SpawnGuardTop()
			Spawners:SpawnGuardMid()
			Spawners:SpawnGuardBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("guard")
	end)
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = 1560,
		callback = function()
			Spawners:SpawnCentaurTop()
			Spawners:SpawnCentaurMid()
			Spawners:SpawnCentaurBot()
			return 37.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("centaur")
	end)
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
		Spawners:SpawnTrollTop()
		Spawners:SpawnTrollMid()
		Spawners:SpawnTrollBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners:StopSpawner("troll")
	end)
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = 2260,
		callback = function()
		Spawners:SpawnTrollTop()
		Spawners:SpawnTrollMid()
		Spawners:SpawnTrollBot()
			return 28.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("troll2")
	end)
	Timers:CreateTimer("demon", {
		useGameTime = true,
		endTime = 1800,
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
	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnDemonBot()
			return 55.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("demon2")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = 3500,
		callback = function()
			Spawners:SpawnDemonDogTop()
			Spawners:SpawnDemonDogMid()
			Spawners:SpawnDemonDogBot()
			return 35.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			Spawners:SpawnMiniDemonTop()
			Spawners:SpawnMiniDemonMid()
			Spawners:SpawnMiniDemonBot()
			return 20.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("minidemon")
	end)
	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = 1860,
		callback = function()
			Spawners:SpawnDragonTop()
			Spawners:SpawnDragonMid()
			Spawners:SpawnDragonBot()
			return 40.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners:StopSpawner("dragon")
	end)
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners:SpawnDragonTop()
			Spawners:SpawnDragonMid()
			Spawners:SpawnDragonBot()
			return 50.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners:StopSpawner("dragon2")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = 1840,
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
	Timers:CreateTimer("roshan", {
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
		Spawners:StopSpawner("roshan")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = 2100,
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
	
-- TOP LANE
	
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

Timers:CreateTimer("spiderling", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			Spawners:SpawnSpiderlings()
			return 35.0
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
			return 38.0
		end
	})
	Timers:CreateTimer(330, function()
		Spawners:StopSpawner("cool")
	end)
Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 270,
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
		endTime = 210,
		callback = function()
			Spawners:SpawnMiniSpiders()
			return 23.0
		end
	})
	Timers:CreateTimer(330, function()
		Spawners:StopSpawner("mini")
	end)
Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 330,
		callback = function()
			Spawners:SpawnBigSpiders()
			return 55.0
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
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("bears")
	end)
Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 720,
		callback = function()
			Spawners:SpawnLargeBears()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners:StopSpawner("largebears")
	end)  

    
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
		endTime = 240,
		callback = function()
			Spawners:SpawnBird()
			return 32.0
		end
	})
	Timers:CreateTimer(600, function()
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