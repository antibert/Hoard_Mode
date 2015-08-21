if SpawnTimersHard == nil then
	SpawnTimersHard = class({})
end

require('libraries/timers')

function SpawnersHard:StartSpawners()
    -- First Gnoll spawn example
	-- Start spawning gnolls every 30 seconds.
	Timers:CreateTimer("gnolls", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			SpawnersHard:SpawnGnollsTop()
			SpawnersHard:SpawnGnollsMid()
			return 30.0
		end
	})
	-- Stop spawning gnolls after 3.5 minutes.
	Timers:CreateTimer(180, function()
		SpawnersHard:StopSpawner("gnolls")
	end)
	
-- BOSSES
	
	Timers:CreateTimer(480, function()
		SpawnersHard:SpawnRoshan()
		return 1680.0
    end)
    Timers:CreateTimer(690, function()
		SpawnersHard:SpawnBigBear()
		return 1520.0
    end)
    Timers:CreateTimer(840, function()
		SpawnersHard:SpawnOgreBoss()
		return 1400.0
    end)
    Timers:CreateTimer(1110, function()
		SpawnersHard:SpawnKingTree()
		return 1400.0
    end)
    Timers:CreateTimer(1290, function()
		SpawnersHard:SpawnBigSplitter()
		return 1400.0
    end)
    Timers:CreateTimer(1570, function()
		SpawnersHard:SpawnCentaurBoss()
		return 1400.0
    end)
    Timers:CreateTimer(2060, function()
		SpawnersHard:SpawnFuckYou()
		return 1400.0
    end)
 
-- MID LANE/All Lanes
		
	Timers:CreateTimer("bazz", {
		useGameTime = true,
		endTime = 60,
		callback = function()
			SpawnersHard:SpawnBazzTop()
			SpawnersHard:SpawnBazzMid()
			return 23.0
		end
	})
	Timers:CreateTimer(180, function()
		SpawnersHard:StopSpawner("bazz")
	end)
	Timers:CreateTimer("zombie", {
		useGameTime = true,
		endTime = 180,
		callback = function()
			SpawnersHard:SpawnZombies()
			return 20.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersHard:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie3", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersHard:SpawnZombies()
			return 13.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("zombie3")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 250,
		callback = function()
			SpawnersHard:SpawnZombies2()
			return 30.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersHard:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("corpse", {
		useGameTime = true,
		endTime = 360,
		callback = function()
			SpawnersHard:SpawnCorpse()
			return 40.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersHard:StopSpawner("corpse")
	end)
	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersHard:SpawnSpookiTop()
			SpawnersHard:SpawnSpookiMid()
			return 13.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersHard:StopSpawner("spooki1")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = 420,
		callback = function()
			SpawnersHard:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(540, function()
		SpawnersHard:StopSpawner("nyx")
	end)
	Timers:CreateTimer("nyx2", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			SpawnersHard:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersHard:StopSpawner("nyx2")
	end)
	Timers:CreateTimer("drake", {
		useGameTime = true,
		endTime = 540,
		callback = function()
			SpawnersHard:SpawnDrake()
			return 23.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersHard:StopSpawner("drake")
	end)
    Timers:CreateTimer("spooki", {
		useGameTime = true,
		endTime = 1700,
		callback = function()
			SpawnersHard:SpawnSpooki()
			return 13.0
		end
	})
	Timers:CreateTimer(2160, function()
		SpawnersHard:StopSpawner("spooki")
	end)
	Timers:CreateTimer("prophet", {
		useGameTime = true,
		endTime = 1050,
		callback = function()
			SpawnersHard:SpawnProphet()
			return 48.0
		end 
	})
	Timers:CreateTimer(1200, function()
		SpawnersHard:StopSpawner("prophet")
	end)
	Timers:CreateTimer("tree", {
		useGameTime = true,
		endTime = 1030,
		callback = function()
			SpawnersHard:SpawnTreesTop()
			SpawnersHard:SpawnTreesMid()
			SpawnersHard:SpawnTreesBot()
			return 12.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersHard:StopSpawner("tree")
	end)
	Timers:CreateTimer("shroom", {
		useGameTime = true,
		endTime = 1065,
		callback = function()
			SpawnersHard:SpawnShroomTop()
			SpawnersHard:SpawnShroomMid()
			SpawnersHard:SpawnShroomBot()
			return 45.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersHard:StopSpawner("shroom")
	end)
	Timers:CreateTimer("shroom2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersHard:SpawnShroomTop()
			SpawnersHard:SpawnShroomMid()
			SpawnersHard:SpawnShroomBot()
			return 43.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("shroom2")
	end)
	Timers:CreateTimer("ogreboss", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersHard:SpawnOgreBoss()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("ogreboss")
	end)
	Timers:CreateTimer("fang", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			SpawnersHard:SpawnFangTop()
			SpawnersHard:SpawnFangMid()
			SpawnersHard:SpawnFangBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersHard:StopSpawner("fang")
	end)    
	Timers:CreateTimer("thing", {
		useGameTime = true,
		endTime = 1035,
		callback = function()
			SpawnersHard:SpawnThing()
			return 35.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersHard:StopSpawner("thing")
	end)
	Timers:CreateTimer("stump", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			SpawnersHard:SpawnStump()
			return 3000.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersHard:StopSpawner("stump")
	end)
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = 1260,
		callback = function()
			SpawnersHard:SpawnSplitterTop()
			SpawnersHard:SpawnSplitterMid()
			SpawnersHard:SpawnSplitterBot()
			return 30.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersHard:StopSpawner("splitter")
	end)
	Timers:CreateTimer("splitter2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersHard:SpawnSplitterTop()
			SpawnersHard:SpawnSplitterBot()
			return 30.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("splitter2")
	end)
	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = 1275,
		callback = function()
			SpawnersHard:SpawnRhinoTop()
			SpawnersHard:SpawnRhinoMid()
			SpawnersHard:SpawnRhinoBot()
			return 46.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersHard:StopSpawner("rhino")
	end)
	Timers:CreateTimer("hellbear", {
		useGameTime = true,
		endTime = 1300,
		callback = function()
			SpawnersHard:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersHard:StopSpawner("hellbear")
	end)
	Timers:CreateTimer("hellbear2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersHard:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("hellbear2")
	end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersHard:SpawnGhostMeele()
			return 27.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersHard:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			SpawnersHard:SpawnGhost()
			return 10.0
		end
	})
	Timers:CreateTimer(1380, function()
		SpawnersHard:StopSpawner("ghost")
	end)
	Timers:CreateTimer("guard", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			SpawnersHard:SpawnGuardTop()
			SpawnersHard:SpawnGuardMid()
			SpawnersHard:SpawnGuardBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersHard:StopSpawner("guard")
	end)
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = 1560,
		callback = function()
			SpawnersHard:SpawnCentaurTop()
			SpawnersHard:SpawnCentaurMid()
			SpawnersHard:SpawnCentaurBot()
			return 37.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersHard:StopSpawner("centaur")
	end)
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
		SpawnersHard:SpawnTrollTop()
		SpawnersHard:SpawnTrollMid()
		SpawnersHard:SpawnTrollBot()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		SpawnersHard:StopSpawner("troll")
	end)
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = 2260,
		callback = function()
		SpawnersHard:SpawnTrollTop()
		SpawnersHard:SpawnTrollMid()
		SpawnersHard:SpawnTrollBot()
			return 28.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("troll2")
	end)
	Timers:CreateTimer("demon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			SpawnersHard:SpawnDemonTop()
			SpawnersHard:SpawnDemonMid()
			SpawnersHard:SpawnDemonBot()
			return 46.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersHard:StopSpawner("demon")
	end)
	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersHard:SpawnDemonBot()
			return 55.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("demon2")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = 3500,
		callback = function()
			SpawnersHard:SpawnDemonDogTop()
			SpawnersHard:SpawnDemonDogMid()
			SpawnersHard:SpawnDemonDogBot()
			return 35.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			SpawnersHard:SpawnMiniDemonTop()
			SpawnersHard:SpawnMiniDemonMid()
			SpawnersHard:SpawnMiniDemonBot()
			return 20.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersHard:StopSpawner("minidemon")
	end)
	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = 1860,
		callback = function()
			SpawnersHard:SpawnDragonTop()
			SpawnersHard:SpawnDragonMid()
			SpawnersHard:SpawnDragonBot()
			return 40.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersHard:StopSpawner("dragon")
	end)
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			SpawnersHard:SpawnDragonTop()
			SpawnersHard:SpawnDragonMid()
			SpawnersHard:SpawnDragonBot()
			return 50.0
		end
	})
	Timers:CreateTimer(6000, function()
		SpawnersHard:StopSpawner("dragon2")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = 1840,
		callback = function()
			SpawnersHard:SpawnStalkerTop()
			SpawnersHard:SpawnStalkerMid()
			SpawnersHard:SpawnStalkerBot()
			return 30.0
		end
	})
	Timers:CreateTimer(2000, function()
		SpawnersHard:StopSpawner("stalker")
	end)
	Timers:CreateTimer("roshan", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			SpawnersHard:SpawnRoshTop()
			SpawnersHard:SpawnRoshMid()
			SpawnersHard:SpawnRoshBot()
			return 50.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersHard:StopSpawner("roshan")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			SpawnersHard:SpawnLizardTop()
			SpawnersHard:SpawnLizardMid()
			SpawnersHard:SpawnLizardBot()
			return 45.0
		end
	})
	Timers:CreateTimer(2250, function()
		SpawnersHard:StopSpawner("lizard")
	end)
	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			SpawnersHard:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		SpawnersHard:StopSpawner("AA")
	end)
	
-- TOP LANE
	
Timers:CreateTimer("beast", {
		useGameTime = true,
		endTime = 140,
		callback = function()
			SpawnersHard:SpawnBeast()
			return 60.0
		end
	})
	Timers:CreateTimer(210, function()
		SpawnersHard:StopSpawner("beast")
	end)

Timers:CreateTimer("spiderling", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersHard:SpawnSpiderlings()
			return 35.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersHard:StopSpawner("spiderling")
	end)
Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersHard:SpawnCoolSpiders()
			return 38.0
		end
	})
	Timers:CreateTimer(330, function()
		SpawnersHard:StopSpawner("cool")
	end)
Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersHard:SpawnSpiders()
			return 18.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersHard:StopSpawner("spiders")
	end)
Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			SpawnersHard:SpawnMiniSpiders()
			return 23.0
		end
	})
	Timers:CreateTimer(330, function()
		SpawnersHard:StopSpawner("mini")
	end)
Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 330,
		callback = function()
			SpawnersHard:SpawnBigSpiders()
			return 55.0
		end
	})
	Timers:CreateTimer(570, function()
		SpawnersHard:StopSpawner("big")
	end)
Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			SpawnersHard:SpawnBears()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersHard:StopSpawner("bears")
	end)
Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 720,
		callback = function()
			SpawnersHard:SpawnLargeBears()
			return 27.0
		end
	})
	Timers:CreateTimer(840, function()
		SpawnersHard:StopSpawner("largebears")
	end)  

    
-- BOT LANE

   Timers:CreateTimer("frostogres", {
		useGameTime = true,
		endTime = 17,
		callback = function()
			SpawnersHard:SpawnFrostOgres()
			return 53.0
		end
	})
	Timers:CreateTimer(450, function()
		SpawnersHard:StopSpawner("frostogres")
	end)  
   Timers:CreateTimer("bird", {
		useGameTime = true,
		endTime = 240,
		callback = function()
			SpawnersHard:SpawnBird()
			return 32.0
		end
	})
	Timers:CreateTimer(600, function()
		SpawnersHard:StopSpawner("bird")
	end)  
   Timers:CreateTimer("ogres", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			SpawnersHard:SpawnOgre()
			return 45.0
		end
	})
	Timers:CreateTimer(960, function()
		SpawnersHard:StopSpawner("ogres")
	end)  
	Timers:CreateTimer("minisatyrs", {
		useGameTime = true,
		endTime = 270,
		callback = function()
			SpawnersHard:SpawnMiniSatyrs()
			return 29.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersHard:StopSpawner("minisatyrs")
	end) 
	Timers:CreateTimer("rippers", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersHard:SpawnRippers()
			return 17.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersHard:StopSpawner("rippers")
	end) 
	Timers:CreateTimer("satyrs", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			SpawnersHard:SpawnSatyrs()
			return 33.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersHard:StopSpawner("satyrs")
	end) 
	Timers:CreateTimer("bigsatyrs", {
		useGameTime = true,
		endTime = 780,
		callback = function()
			SpawnersHard:SpawnBigSatyrs()
			return 41.0
		end
	})
	Timers:CreateTimer(930, function()
		SpawnersHard:StopSpawner("bigsatyrs")
	end) 


-- Neutral Camps/Map Spawns

    Timers:CreateTimer(17, function()
		SpawnersHard:SpawnFriend()
		return 35.0
    end)
    Timers:CreateTimer(18, function()
		SpawnersHard:SpawnFriend()
		return 35.0
    end)
    Timers:CreateTimer(19, function()
		SpawnersHard:SpawnFriend()
		return 35.0
    end)	
	Timers:CreateTimer(300, function()
		SpawnersHard:SpawnFriend2()
		return 3600.0
    end)
	Timers:CreateTimer(300, function()
		SpawnersHard:SpawnFriend3()
		return 3600.0
    end)
	
	Timers:CreateTimer("money", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			SpawnersHard:SpawnMoney()
			return 150.0
		end
	})
	Timers:CreateTimer(1200, function()
		SpawnersHard:StopSpawner("money")
	end) 
	
	
	
	end



-- Function to stop spawners

function SpawnersHard:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end