if SpawnTimers2p == nil then
	SpawnTimers2p = class({})
end

require('libraries/timers')

function Spawners2p:StartSpawners()
    -- First Gnoll spawn example
	-- Start spawning gnolls every 30 seconds.
	Timers:CreateTimer("gnolls", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			Spawners2p:SpawnGnollsMid()
			return 30.0
		end
	})
	-- Stop spawning gnolls after 3.5 minutes.
	Timers:CreateTimer(230, function()
		Spawners2p:StopSpawner("gnolls")
	end)
	
-- BOSSES
	
	Timers:CreateTimer(400, function()
		Spawners2p:SpawnRoshan()
		return 1680.0
    end)
    Timers:CreateTimer(600, function()
		Spawners2p:SpawnBigBear()
		return 1520.0
    end)
    Timers:CreateTimer(800, function()
		Spawners2p:SpawnOgreBoss()
		return 1400.0
    end)
    Timers:CreateTimer(1200, function()
		Spawners2p:SpawnKingTree()
		return 1400.0
    end)
    Timers:CreateTimer(1350, function()
		Spawners2p:SpawnBigSplitter()
		return 1400.0
    end)
    Timers:CreateTimer(1600, function()
		Spawners2p:SpawnCentaurBoss()
		return 1400.0
    end)
    Timers:CreateTimer(2060, function()
		Spawners2p:SpawnFuckYou()
		return 1400.0
    end)
 
-- MID LANE/All Lanes
		
	Timers:CreateTimer("bazz", {
		useGameTime = true,
		endTime = 60,
		callback = function()
			Spawners2p:SpawnBazzMid()
			return 23.0
		end
	})
	Timers:CreateTimer(180, function()
		Spawners2p:StopSpawner("bazz")
	end)	
    Timers:CreateTimer("beast", {
		useGameTime = true,
		endTime = 100,
		callback = function()
			Spawners2p:SpawnBeast()
			return 70.0
		end
	})
	Timers:CreateTimer(320, function()
		Spawners2p:StopSpawner("beast")
	end)
   Timers:CreateTimer("frostogres", {
		useGameTime = true,
		endTime = 17,
		callback = function()
			Spawners2p:SpawnFrostOgres()
			return 60.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners2p:StopSpawner("frostogres")
	end)  
	Timers:CreateTimer("zombie", {
		useGameTime = true,
		endTime = 230,
		callback = function()
			Spawners2p:SpawnZombies()
			return 23.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners2p:StopSpawner("zombie")
	end)
	Timers:CreateTimer("zombie3", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners2p:SpawnZombies()
			return 13.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("zombie3")
	end)
	Timers:CreateTimer("zombie2", {
		useGameTime = true,
		endTime = 300,
		callback = function()
			Spawners2p:SpawnZombies2()
			return 36.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners2p:StopSpawner("zombie2")
	end)
	Timers:CreateTimer("corpse", {
		useGameTime = true,
		endTime = 360,
		callback = function()
			Spawners2p:SpawnCorpse()
			return 60.0
		end
	})
	Timers:CreateTimer(450, function()
		Spawners2p:StopSpawner("corpse")
	end)
    Timers:CreateTimer("spiders", {
		useGameTime = true,
		endTime = 290,
		callback = function()
			Spawners2p:SpawnSpiders()
			return 23.0
		end
	})
	Timers:CreateTimer(590, function()
		Spawners2p:StopSpawner("spiders")
	end)
    Timers:CreateTimer("big", {
		useGameTime = true,
		endTime = 300,
		callback = function()
			Spawners2p:SpawnBigSpiders()
			return 60.0
		end
	})
	Timers:CreateTimer(300, function()
		Spawners2p:StopSpawner("big")
	end)
    Timers:CreateTimer("cool", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			Spawners2p:SpawnCoolSpiders()
			return 38.0
		end
	})
	Timers:CreateTimer(330, function()
		Spawners2p:StopSpawner("cool")
	end)
    Timers:CreateTimer("mini", {
		useGameTime = true,
		endTime = 210,
		callback = function()
			Spawners2p:SpawnMiniSpiders()
			return 23.0
		end
	})
	Timers:CreateTimer(330, function()
		Spawners2p:StopSpawner("mini")
	end)
	Timers:CreateTimer("spooki1", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			Spawners2p:SpawnSpookiMid()
			Spawners2p:SpawnSpookiBot()
			return 17.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("spooki1")
	end)
	Timers:CreateTimer("nyx", {
		useGameTime = true,
		endTime = 400,
		callback = function()
			Spawners2p:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(540, function()
		Spawners2p:StopSpawner("nyx")
	end)
   Timers:CreateTimer("ogres", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			Spawners2p:SpawnOgre()
			return 45.0
		end
	})
	Timers:CreateTimer(960, function()
		Spawners2p:StopSpawner("ogres")
	end)  
	Timers:CreateTimer("minisatyrs", {
		useGameTime = true,
		endTime = 200,
		callback = function()
			Spawners2p:SpawnMiniSatyrs()
			return 29.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners2p:StopSpawner("minisatyrs")
	end) 
	Timers:CreateTimer("rippers", {
		useGameTime = true,
		endTime = 480,
		callback = function()
			Spawners2p:SpawnRippers()
			return 17.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners2p:StopSpawner("rippers")
	end) 
	Timers:CreateTimer("satyrs", {
		useGameTime = true,
		endTime = 500,
		callback = function()
			Spawners2p:SpawnSatyrs()
			return 33.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners2p:StopSpawner("satyrs")
	end) 
	Timers:CreateTimer("bigsatyrs", {
		useGameTime = true,
		endTime = 780,
		callback = function()
			Spawners2p:SpawnBigSatyrs()
			return 41.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners2p:StopSpawner("bigsatyrs")
	end) 
	Timers:CreateTimer("hellbear", {
		useGameTime = true,
		endTime = 780,
		callback = function()
			Spawners2p:SpawnHellBear()
			return 1000.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("hellbear")
	end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners2p:SpawnGhostMeele()
			return 27.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners2p:SpawnGhost()
			return 10.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("ghost")
	end)
	Timers:CreateTimer("minisatyrs", {
		useGameTime = true,
		endTime = 900,
		callback = function()
			Spawners2p:SpawnMiniSatyrs()
			return 30.0
		end
	})
	Timers:CreateTimer(120, function()
		Spawners2p:StopSpawner("minisatyrs")
	end) 
Timers:CreateTimer("bears", {
		useGameTime = true,
		endTime = 600,
		callback = function()
			Spawners2p:SpawnBears()
			return 30.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners2p:StopSpawner("bears")
	end)
Timers:CreateTimer("largebears", {
		useGameTime = true,
		endTime = 720,
		callback = function()
			Spawners2p:SpawnLargeBears()
			return 30.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners2p:StopSpawner("largebears")
	end)  
	Timers:CreateTimer("nyx2", {
		useGameTime = true,
		endTime = 840,
		callback = function()
			Spawners2p:SpawnNyx()
			return 30.0
		end
	})
	Timers:CreateTimer(930, function()
		Spawners2p:StopSpawner("nyx2")
	end)
	Timers:CreateTimer("drake", {
		useGameTime = true,
		endTime = 540,
		callback = function()
			Spawners2p:SpawnDrake()
			return 23.0
		end
	})
	Timers:CreateTimer(840, function()
		Spawners2p:StopSpawner("drake")
	end)
    Timers:CreateTimer("spooki", {
		useGameTime = true,
		endTime = 1700,
		callback = function()
			Spawners2p:SpawnSpooki()
			return 13.0
		end
	})
	Timers:CreateTimer(2160, function()
		Spawners2p:StopSpawner("spooki")
	end)
	Timers:CreateTimer("prophet", {
		useGameTime = true,
		endTime = 1050,
		callback = function()
			Spawners2p:SpawnProphet()
			return 48.0
		end 
	})
	Timers:CreateTimer(1200, function()
		Spawners2p:StopSpawner("prophet")
	end)
	Timers:CreateTimer("tree", {
		useGameTime = true,
		endTime = 1030,
		callback = function()
			Spawners2p:SpawnTreesMid()
			return 12.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners2p:StopSpawner("tree")
	end)
	Timers:CreateTimer("shroom", {
		useGameTime = true,
		endTime = 1065,
		callback = function()
			Spawners2p:SpawnShroomMid()
			return 45.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners2p:StopSpawner("shroom")
	end)
	Timers:CreateTimer("shroom2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners2p:SpawnShroomMid()
			return 43.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("shroom2")
	end)
	Timers:CreateTimer("ogreboss", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners2p:SpawnOgreBoss()
			return 120.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("ogreboss")
	end)
	Timers:CreateTimer("fang", {
		useGameTime = true,
		endTime = 1100,
		callback = function()
			Spawners2p:SpawnFangMid()
			return 25.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners2p:StopSpawner("fang")
	end)    
	Timers:CreateTimer("thing", {
		useGameTime = true,
		endTime = 1035,
		callback = function()
			Spawners2p:SpawnThing()
			return 35.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners2p:StopSpawner("thing")
	end)
	Timers:CreateTimer("stump", {
		useGameTime = true,
		endTime = 1020,
		callback = function()
			Spawners2p:SpawnStump()
			return 3000.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners2p:StopSpawner("stump")
	end)
	Timers:CreateTimer("splitter", {
		useGameTime = true,
		endTime = 1260,
		callback = function()
			Spawners2p:SpawnSplitterMid()
			return 30.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("splitter")
	end)
	Timers:CreateTimer("rhino", {
		useGameTime = true,
		endTime = 1275,
		callback = function()
			Spawners2p:SpawnRhinoMid()
			return 46.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("rhino")
	end)
	Timers:CreateTimer("hellbear", {
		useGameTime = true,
		endTime = 1300,
		callback = function()
			Spawners2p:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("hellbear")
	end)
	Timers:CreateTimer("hellbear2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners2p:SpawnHellBear()
			return 70.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("hellbear2")
	end)
	Timers:CreateTimer("ghostmeele", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners2p:SpawnGhostMeele()
			return 27.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("ghostmeele")
	end)
	Timers:CreateTimer("ghost", {
		useGameTime = true,
		endTime = 1270,
		callback = function()
			Spawners2p:SpawnGhost()
			return 10.0
		end
	})
	Timers:CreateTimer(1380, function()
		Spawners2p:StopSpawner("ghost")
	end)
	Timers:CreateTimer("guard", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
			Spawners2p:SpawnGuardMid()
			return 23.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners2p:StopSpawner("guard")
	end)
	Timers:CreateTimer("centaur", {
		useGameTime = true,
		endTime = 1560,
		callback = function()
			Spawners2p:SpawnCentaurMid()
			return 37.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners2p:StopSpawner("centaur")
	end)
	Timers:CreateTimer("troll", {
		useGameTime = true,
		endTime = 1440,
		callback = function()
		Spawners2p:SpawnTrollMid()
			return 25.0
		end
	})
	Timers:CreateTimer(1680, function()
		Spawners2p:StopSpawner("troll")
	end)
	Timers:CreateTimer("troll2", {
		useGameTime = true,
		endTime = 2260,
		callback = function()
		Spawners2p:SpawnTrollMid()
			return 28.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("troll2")
	end)
	Timers:CreateTimer("demon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			Spawners2p:SpawnDemonMid()
			return 40.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners2p:StopSpawner("demon")
	end)
	Timers:CreateTimer("demon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners2p:SpawnDemonMid()
			return 50.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("demon2")
	end)
	Timers:CreateTimer("demondog", {
		useGameTime = true,
		endTime = 3500,
		callback = function()
			Spawners2p:SpawnDemonDogMid()
			return 35.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("demondog")
	end)
	Timers:CreateTimer("minidemon", {
		useGameTime = true,
		endTime = 1800,
		callback = function()
			Spawners2p:SpawnMiniDemonMid()
			return 20.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners2p:StopSpawner("minidemon")
	end)
	Timers:CreateTimer("dragon", {
		useGameTime = true,
		endTime = 1860,
		callback = function()
			Spawners2p:SpawnDragonMid()
			return 40.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners2p:StopSpawner("dragon")
	end)
	Timers:CreateTimer("dragon2", {
		useGameTime = true,
		endTime = 2280,
		callback = function()
			Spawners2p:SpawnDragonMid()
			return 50.0
		end
	})
	Timers:CreateTimer(6000, function()
		Spawners2p:StopSpawner("dragon2")
	end)
	Timers:CreateTimer("stalker", {
		useGameTime = true,
		endTime = 1840,
		callback = function()
			Spawners2p:SpawnStalkerMid()
			return 30.0
		end
	})
	Timers:CreateTimer(2000, function()
		Spawners2p:StopSpawner("stalker")
	end)
	Timers:CreateTimer("roshan", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			Spawners2p:SpawnRoshMid()
			return 40.0
		end
	})
	Timers:CreateTimer(2250, function()
		Spawners2p:StopSpawner("roshan")
	end)
	Timers:CreateTimer("lizard", {
		useGameTime = true,
		endTime = 2100,
		callback = function()
			Spawners2p:SpawnLizardMid()
			return 45.0
		end
	})
	Timers:CreateTimer(2250, function()
		Spawners2p:StopSpawner("lizard")
	end)
	Timers:CreateTimer("AA", {
		useGameTime = true,
		endTime = 2160,
		callback = function()
			Spawners2p:SpawnAA()
			return 150.0
		end
	})
	Timers:CreateTimer(2170, function()
		Spawners2p:StopSpawner("AA")
	end)


-- Neutral Camps/Map Spawns

    Timers:CreateTimer(17, function()
		Spawners2p:SpawnFriend()
		return 60.0
    end)	
    Timers:CreateTimer(18, function()
		Spawners2p:SpawnFriend()
		return 60.0
    end)
	Timers:CreateTimer("money", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			Spawners2p:SpawnMoney()
			return 150.0
		end
	})
	Timers:CreateTimer(1200, function()
		Spawners2p:StopSpawner("money")
	end) 
	
	
	
	end



-- Function to stop Spawners2p

function Spawners2p:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end