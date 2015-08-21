if SpawnTimersUltra == nil then
	SpawnTimersUltra = class({})
end

require('libraries/timers')

function SpawnersUltra:StartSpawners()
    -- First Gnoll spawn example
	-- Start spawning gnolls every 30 seconds.
	Timers:CreateTimer("gnolls", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			SpawnersUltra:SpawnGnollsTop()
			SpawnersUltra:SpawnGnollsMid()
			return 30.0
		end
	})
	-- Stop spawning gnolls after 3.5 minutes.
	Timers:CreateTimer(180, function()
		SpawnersUltra:StopSpawner("gnolls")
	end)
	
-- BOSSES
	
	Timers:CreateTimer(380, function()
		SpawnersUltra:SpawnRoshan()
		return 1680.0
    end)
    Timers:CreateTimer(590, function()
		SpawnersUltra:SpawnBigBear()
		return 1520.0
    end)
    Timers:CreateTimer(740, function()
		SpawnersUltra:SpawnOgreBoss()
		return 1400.0
    end)
    Timers:CreateTimer(1010, function()
		SpawnersUltra:SpawnKingTree()
		return 1400.0
    end)
    Timers:CreateTimer(1190, function()
		SpawnersUltra:SpawnBigSplitter()
		return 1400.0
    end)
    Timers:CreateTimer(1470, function()
		SpawnersUltra:SpawnCentaurBoss()
		return 1400.0
    end)
    Timers:CreateTimer(1960, function()
		SpawnersUltra:SpawnFuckYou()
		return 1400.0
    end)
 
-- MID LANE/All Lanes
		
	Timers:CreateTimer("bazz", {
		useGameTime = true,
		endTime = 30,
		callback = function()
			SpawnersUltra:SpawnBazzTop()
			SpawnersUltra:SpawnBazzMid()
			return 23.0
		end
	})
	Timers:CreateTimer(180, function()
		SpawnersUltra:StopSpawner("bazz")
	end)
	Timers:CreateTimer("zombie", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			SpawnersUltra:SpawnZombies()
			return 23.0
		end
	})
	Timers:CreateTimer(430, function()
		SpawnersUltra:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie3", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersUltra:SpawnZombies()
			return 13.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("zombie3")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 60,
		callback = function()
			SpawnersUltra:SpawnZombies2()
			return 30.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersUltra:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("corpse", {
		useGameTime = true,
		endTime = 360,
		callback = function()
			SpawnersUltra:SpawnCorpse()
			return 23.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersUltra:StopSpawner("corpse")
	end)
	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 400,
		callback = function()
			SpawnersUltra:SpawnSpookiTop()
			SpawnersUltra:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersUltra:StopSpawner("spooki1")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = 420,
		callback = function()
			SpawnersUltra:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(540, function()
		SpawnersUltra:StopSpawner("nyx")
	end)
	Timers:CreateTimer("nyx2", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			SpawnersUltra:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersUltra:StopSpawner("nyx2")
	end)
	Timers:CreateTimer("drake", {
		useGameTime = true,
		endTime = 540,
		callback = function()
			SpawnersUltra:SpawnDrake()
			return 23.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersUltra:StopSpawner("drake")
	end)
    Timers:CreateTimer("spooki", {
		useGameTime = true,
		endTime = 1700,
		callback = function()
			SpawnersUltra:SpawnSpooki()
			return 13.0
		end
	})
	Timers:CreateTimer(2160, function()
		SpawnersUltra:StopSpawner("spooki")
	end)
	Timers:CreateTimer("prophet", {
		useGameTime = true,
		endTime = 1050,
		callback = function()
			SpawnersUltra:SpawnProphet()
			return 48.0
		end 
	})
	Timers:CreateTimer(1200, function()
		SpawnersUltra:StopSpawner("prophet")
	end)
	Timers:CreateTimer("tree", {
		useGameTime = true,
		endTime = 950,
		callback = function()
			SpawnersUltra:SpawnTreesTop()
			SpawnersUltra:SpawnTreesMid()
			SpawnersUltra:SpawnTreesBot()
			return 12.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersUltra:StopSpawner("tree")
	end)
	Timers:CreateTimer("shroom", {
		useGameTime = true,
		endTime = 965,
		callback = function()
			SpawnersUltra:SpawnShroomTop()
			SpawnersUltra:SpawnShroomMid()
			SpawnersUltra:SpawnShroomBot()
			return 45.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersUltra:StopSpawner("shroom")
	end)
	Timers:CreateTimer("shroom2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersUltra:SpawnShroomTop()
			SpawnersUltra:SpawnShroomMid()
			SpawnersUltra:SpawnShroomBot()
			return 43.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("shroom2")
	end)
	Timers:CreateTimer("ogreboss", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersUltra:SpawnOgreBoss()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("ogreboss")
	end)
	Timers:CreateTimer("fang", {
		useGameTime = true,
		endTime = 1000,
		callback = function()
			SpawnersUltra:SpawnFangTop()
			SpawnersUltra:SpawnFangMid()
			SpawnersUltra:SpawnFangBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersUltra:StopSpawner("fang")
	end)    
	Timers:CreateTimer("thing", {
		useGameTime = true,
		endTime = 1035,
		callback = function()
			SpawnersUltra:SpawnThing()
			return 35.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersUltra:StopSpawner("thing")
	end)
	Timers:CreateTimer("stump", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			SpawnersUltra:SpawnStump()
			return 3000.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersUltra:StopSpawner("stump")
	end)
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = 1260,
		callback = function()
			SpawnersUltra:SpawnSplitterTop()
			SpawnersUltra:SpawnSplitterMid()
			SpawnersUltra:SpawnSplitterBot()
			return 30.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersUltra:StopSpawner("splitter")
	end)
	Timers:CreateTimer("splitter2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersUltra:SpawnSplitterTop()
			SpawnersUltra:SpawnSplitterBot()
			return 30.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("splitter2")
	end)
	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = 1275,
		callback = function()
			SpawnersUltra:SpawnRhinoTop()
			SpawnersUltra:SpawnRhinoMid()
			SpawnersUltra:SpawnRhinoBot()
			return 46.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersUltra:StopSpawner("rhino")
	end)
	Timers:CreateTimer("hellbear", {
		useGameTime = true,
		endTime = 1300,
		callback = function()
			SpawnersUltra:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersUltra:StopSpawner("hellbear")
	end)
	Timers:CreateTimer("hellbear2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersUltra:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("hellbear2")
	end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersUltra:SpawnGhostMeele()
			return 27.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersUltra:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersUltra:SpawnGhost()
			return 10.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersUltra:StopSpawner("ghost")
	end)
	Timers:CreateTimer("guard", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			SpawnersUltra:SpawnGuardTop()
			SpawnersUltra:SpawnGuardMid()
			SpawnersUltra:SpawnGuardBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersUltra:StopSpawner("guard")
	end)
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = 1560,
		callback = function()
			SpawnersUltra:SpawnCentaurTop()
			SpawnersUltra:SpawnCentaurMid()
			SpawnersUltra:SpawnCentaurBot()
			return 37.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersUltra:StopSpawner("centaur")
	end)
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
		SpawnersUltra:SpawnTrollTop()
		SpawnersUltra:SpawnTrollMid()
		SpawnersUltra:SpawnTrollBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersUltra:StopSpawner("troll")
	end)
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = 2260,
		callback = function()
		SpawnersUltra:SpawnTrollTop()
		SpawnersUltra:SpawnTrollMid()
		SpawnersUltra:SpawnTrollBot()
			return 28.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("troll2")
	end)
	Timers:CreateTimer("demon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			SpawnersUltra:SpawnDemonTop()
			SpawnersUltra:SpawnDemonMid()
			SpawnersUltra:SpawnDemonBot()
			return 46.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersUltra:StopSpawner("demon")
	end)
	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersUltra:SpawnDemonBot()
			return 55.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("demon2")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = 3500,
		callback = function()
			SpawnersUltra:SpawnDemonDogTop()
			SpawnersUltra:SpawnDemonDogMid()
			SpawnersUltra:SpawnDemonDogBot()
			return 35.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			SpawnersUltra:SpawnMiniDemonTop()
			SpawnersUltra:SpawnMiniDemonMid()
			SpawnersUltra:SpawnMiniDemonBot()
			return 20.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersUltra:StopSpawner("minidemon")
	end)
	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = 1860,
		callback = function()
			SpawnersUltra:SpawnDragonTop()
			SpawnersUltra:SpawnDragonMid()
			SpawnersUltra:SpawnDragonBot()
			return 40.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersUltra:StopSpawner("dragon")
	end)
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersUltra:SpawnDragonTop()
			SpawnersUltra:SpawnDragonMid()
			SpawnersUltra:SpawnDragonBot()
			return 50.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersUltra:StopSpawner("dragon2")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = 1840,
		callback = function()
			SpawnersUltra:SpawnStalkerTop()
			SpawnersUltra:SpawnStalkerMid()
			SpawnersUltra:SpawnStalkerBot()
			return 30.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersUltra:StopSpawner("stalker")
	end)
	Timers:CreateTimer("roshan", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			SpawnersUltra:SpawnRoshTop()
			SpawnersUltra:SpawnRoshMid()
			SpawnersUltra:SpawnRoshBot()
			return 50.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersUltra:StopSpawner("roshan")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			SpawnersUltra:SpawnLizardTop()
			SpawnersUltra:SpawnLizardMid()
			SpawnersUltra:SpawnLizardBot()
			return 45.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersUltra:StopSpawner("lizard")
	end)
	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			SpawnersUltra:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		SpawnersUltra:StopSpawner("AA")
	end)
	
-- TOP LANE
	
Timers:CreateTimer("beast", {
		useGameTime = true,
		endTime = 140,
		callback = function()
			SpawnersUltra:SpawnBeast()
			return 60.0
		end
	})
	Timers:CreateTimer(210, function()
		SpawnersUltra:StopSpawner("beast")
	end)

Timers:CreateTimer("spiderling", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersUltra:SpawnSpiderlings()
			return 35.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersUltra:StopSpawner("spiderling")
	end)
Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersUltra:SpawnCoolSpiders()
			return 38.0
		end
	})
	Timers:CreateTimer(330, function()
		SpawnersUltra:StopSpawner("cool")
	end)
Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersUltra:SpawnSpiders()
			return 18.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersUltra:StopSpawner("spiders")
	end)
Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersUltra:SpawnMiniSpiders()
			return 23.0
		end
	})
	Timers:CreateTimer(330, function()
		SpawnersUltra:StopSpawner("mini")
	end)
Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 330,
		callback = function()
			SpawnersUltra:SpawnBigSpiders()
			return 55.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersUltra:StopSpawner("big")
	end)
Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			SpawnersUltra:SpawnBears()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersUltra:StopSpawner("bears")
	end)
Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 720,
		callback = function()
			SpawnersUltra:SpawnLargeBears()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersUltra:StopSpawner("largebears")
	end)  

    
-- BOT LANE

   Timers:CreateTimer("frostogres", {
		useGameTime = true,
		endTime = 17,
		callback = function()
			SpawnersUltra:SpawnFrostOgres()
			return 53.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersUltra:StopSpawner("frostogres")
	end)  
   Timers:CreateTimer("bird", {
		useGameTime = true,
		endTime = 240,
		callback = function()
			SpawnersUltra:SpawnBird()
			return 32.0
		end
	})
	Timers:CreateTimer(600, function()
		SpawnersUltra:StopSpawner("bird")
	end)  
   Timers:CreateTimer("ogres", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			SpawnersUltra:SpawnOgre()
			return 45.0
		end
	})
	Timers:CreateTimer(960, function()
		SpawnersUltra:StopSpawner("ogres")
	end)  
	Timers:CreateTimer("minisatyrs", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersUltra:SpawnMiniSatyrs()
			return 29.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersUltra:StopSpawner("minisatyrs")
	end) 
	Timers:CreateTimer("rippers", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersUltra:SpawnRippers()
			return 17.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersUltra:StopSpawner("rippers")
	end) 
	Timers:CreateTimer("satyrs", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersUltra:SpawnSatyrs()
			return 33.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersUltra:StopSpawner("satyrs")
	end) 
	Timers:CreateTimer("bigsatyrs", {
		useGameTime = true,
		endTime = 780,
		callback = function()
			SpawnersUltra:SpawnBigSatyrs()
			return 41.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersUltra:StopSpawner("bigsatyrs")
	end) 


-- Neutral Camps/Map Spawns

    Timers:CreateTimer(17, function()
		SpawnersUltra:SpawnFriend()
		return 40.0
    end)
    Timers:CreateTimer(18, function()
		SpawnersUltra:SpawnFriend()
		return 40.0
    end)	
    Timers:CreateTimer(19, function()
		SpawnersUltra:SpawnFriend()
		return 40.0
    end)		
	Timers:CreateTimer(0, function()
		SpawnersUltra:SpawnFriend2()
		return 3600.0
    end)
	Timers:CreateTimer(0, function()
		SpawnersUltra:SpawnFriend3()
		return 3600.0
    end)
	
	Timers:CreateTimer("money", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			SpawnersUltra:SpawnMoney()
			return 150.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersUltra:StopSpawner("money")
	end) 
	
	
	
	end



-- Function to stop spawners

function SpawnersUltra:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end