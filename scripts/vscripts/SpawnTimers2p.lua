if SpawnTimers2p == nil then
	SpawnTimers2p = class({})
end

require('libraries/timers')
require('libraries/spawners')

function Spawners2p:StartSpawners(difficulty)
    -- First Gnoll spawn example
	-- Start spawning gnolls every 30 seconds.
	Spawner:SpawnTimer({
		start = 0,
		finish = 230,
		interval = 30,
		spawn = Spawners2p:SpawnGnollsMid()
	})
	
-- BOSSES
	Spawner:SpawnTimer({
		start = 400,
		interval = 1680,
		spawn = Spawners2p:SpawnRoshan()
	})

	Spawner:SpawnTimer({
		start = 600,
		interval = 1520,
		spawn = Spawners2p:SpawnBigBear()
	})

	Spawner:SpawnTimer({
		start = 800,
		interval = 1400,
		spawn = Spawners2p:SpawnOgreBoss()
	})

	Spawner:SpawnTimer({
		start = 1200,
		interval = 1400,
		spawn = Spawners2p:SpawnKingTree()
	})

	Spawner:SpawnTimer({
		start = 1350,
		interval = 1400,
		spawn = Spawners2p:SpawnBigSplitter()
	})

	Spawner:SpawnTimer({
		start = 1600,
		interval = 1400,
		spawn = Spawners2p:SpawnCentaurBoss()
	})

	Spawner:SpawnTimer({
		start = 2060,
		interval = 1400,
		spawn = Spawners2p:SpawnFuckYou()
	})
 
-- MID LANE/All Lanes
	Spawner:SpawnTimer({
		start = 60,
		finish = 180,
		interval = 23,
		spawn = Spawners2p:SpawnBazzMid()
	})

	Spawner:SpawnTimer({
		start = 130,
		interval = 3000,
		spawn = Spawners2p:SpawnBeast()
	})

    Spawner:SpawnTimer({
	    start = 17,
	    finish = 450,
	    interval = 60,
	    spawn = Spawners2p:SpawnFrostOgres()
    })

	Spawner:SpawnTimer({
		start = 17,
		finish = 450,
		interval = 60,
		spawn = Spawners2p:SpawnZombies()
	})

	Spawner:SpawnTimer({
		start = 230,
		finish = 450,
		interval = 23,
		spawn = Spawners2p:SpawnZombies()
	})

	Spawner:SpawnTimer({
		start = 300,
		finish = 450,
		interval = 36,
		spawn = Spawners2p:SpawnZombies()
	})

	Spawner:SpawnTimer({
		start = 2280,
		interval = 13,
		spawn = Spawners2p:SpawnZombies()
	})

	Spawner:SpawnTimer({
		start = 360,
		finish = 450,
		interval = 60,
		spawn = Spawners2p:SpawnCorpse()
	})

	Spawner:SpawnTimer({
		start = 290,
		finish = 590,
		interval = 23,
		spawn = Spawners2p:SpawnSpiders()
	})

	Spawner:SpawnTimer({
		start = 300,
		spawn = Spawners2p:SpawnBigSpiders()
	})

	Spawner:SpawnTimer({
		start = 210,
		finish = 330,
		interval = 38,
		spawn = Spawners2p:SpawnCoolSpiders()
	})

	Spawner:SpawnTimer({
		start = 210,
		finish = 330,
		interval = 23,
		spawn = Spawners2p:SpawnMiniSpiders()
	})

	Spawner:SpawnTimer({
		start = 480,
		interval = 17,
		spawn = Spawners2p:SpawnSpookiMid()
	})

	Spawner:SpawnTimer({
		start = 480,
		interval = 17,
		spawn = Spawners2p:SpawnSpookiBot()
	})

	Spawner:SpawnTimer({
		start = 400,
		finish = 540,
		interval = 30,
		spawn = Spawners2p:SpawnNyx()
	})

	Spawner:SpawnTimer({
		start = 600,
		finish = 930,
		interval = 45,
		spawn = Spawners2p:SpawnOgre()
	})

	Spawner:SpawnTimer({
		start = 500,
		finish = 930,
		interval = 29,
		spawn = Spawners2p:SpawnMiniSatyrs()
	})



	Spawner:SpawnTimer({
		start = 500,
		finish = 930,
		interval = 33,
		spawn = Spawners2p:SpawnSatyrs()
	})

	Spawner:SpawnTimer({
		start = 780,
		finish = 930,
		interval = 41,
		spawn = Spawners2p:SpawnBigSatyrs()
	})

	Spawner:SpawnTimer({
		start = 1270,
		finish = 1380,
		interval = 27,
		spawn = Spawners2p:SpawnGhostMeele()
	})

	Spawner:SpawnTimer({
		start = 1270,
		finish = 1380,
		interval = 10,
		spawn = Spawners2p:SpawnGhost()
	})

	Spawner:SpawnTimer({
		start = 900,
		finish = 1380,
		interval = 30,
		spawn = Spawners2p:SpawnMiniSatyrs()
	})

	Spawner:SpawnTimer({
		start = 600,
		finish = 840,
		interval = 30,
		spawn = Spawners2p:SpawnBears()
	})

	Spawner:SpawnTimer({
		start = 720,
		finish = 840,
		interval = 30,
		spawn = Spawners2p:SpawnLargeBears()
	})

	Spawner:SpawnTimer({
		start = 840,
		finish = 930,
		interval = 30,
		spawn = Spawners2p:SpawnNyx()
	})

	Spawner:SpawnTimer({
		start = 540,
		finish = 840,
		interval = 23,
		spawn = Spawners2p:SpawnDrake()
	})

	Spawner:SpawnTimer({
		start = 1700,
		finish = 2160,
		interval = 13,
		spawn = Spawners2p:SpawnSpookiMid()
	})

	Spawner:SpawnTimer({
		start = 1050,
		finish = 1200,
		interval = 48,
		spawn = Spawners2p:SpawnProphet()
	})

	Spawner:SpawnTimer({
		start = 1030,
		finish = 1200,
		interval = 12,
		spawn = Spawners2p:SpawnTreesMid()
	})

	Spawner:SpawnTimer({
		start = 1065,
		finish = 1200,
		interval = 45,
		spawn = Spawners2p:SpawnShroomMid()
	})

	Spawner:SpawnTimer({
		start = 2280,
		interval = 43,
		spawn = Spawners2p:SpawnShroomMid()
	})

	Spawner:SpawnTimer({
		start = 2280,
		interval = 120,
		spawn = Spawners2p:SpawnOgreBoss()
	})

	Spawner:SpawnTimer({
		start = 1100,
		finish = 1200,
		interval = 25,
		spawn = Spawners2p:SpawnFangMid()
	})

	Spawner:SpawnTimer({
		start = 1100,
		finish = 1200,
		interval = 25,
		spawn = Spawners2p:SpawnFangMid()
	})

	Spawner:SpawnTimer({
		start = 1035,
		finish = 1200,
		interval = 35,
		spawn = Spawners2p:SpawnThing()
	})

	Spawner:SpawnTimer({
		start = 1020,
		spawn = Spawners2p:SpawnStump()
	})

	Spawner:SpawnTimer({
		start = 1260,
		finish = 1380,
		interval = 30,
		spawn = Spawners2p:SpawnSplitterMid()
	})

	Spawner:SpawnTimer({
		start = 1275,
		finish = 1380,
		interval = 46,
		spawn = Spawners2p:SpawnRhinoMid()
	})

	Spawner:SpawnTimer({
		start = 1270,
		finish = 1380,
		interval = 27,
		spawn = Spawners2p:SpawnGhostMeele()
	})

	Spawner:SpawnTimer({
		start = 1270,
		finish = 1380,
		interval = 10,
		spawn = Spawners2p:SpawnGhost()
	})

	Spawner:SpawnTimer({
		start = 1440,
		finish = 1680,
		interval = 23,
		spawn = Spawners2p:SpawnGuardMid()
	})

    Spawner:SpawnTimer({
	    start = 1440,
	    finish = 1680,
	    interval = 23,
	    spawn = Spawners2p:SpawnRippers()
    })

	Spawner:SpawnTimer({
		start = 1560,
		finish = 1680,
		interval = 37,
		spawn = Spawners2p:SpawnCentaurMid()
	})

	Spawner:SpawnTimer({
		start = 1440,
		finish = 1680,
		interval = 25,
		spawn = Spawners2p:SpawnTrollMid()
	})

	Spawner:SpawnTimer({
		start = 2260,
		interval = 28,
		spawn = Spawners2p:SpawnTrollMid()
	})

	Spawner:SpawnTimer({
		start = 1800,
		finish = 2000,
		interval = 40,
		spawn = Spawners2p:SpawnDemonMid()
	})

	Spawner:SpawnTimer({
		start = 2280,
		interval = 50,
		spawn = Spawners2p:SpawnDemonMid()
	})

	Spawner:SpawnTimer({
		start = 3500,
		interval = 35,
		spawn = Spawners2p:SpawnDemonDogMid()
	})

	Spawner:SpawnTimer({
		start = 1800,
		finish = 2000,
		interval = 20,
		spawn = Spawners2p:SpawnMiniDemonMid()
	})

	Spawner:SpawnTimer({
		start = 1860,
		finish = 2000,
		interval = 50,
		spawn = Spawners2p:SpawnDragonMid()
	})

	Spawner:SpawnTimer({
		start = 2280,
		interval = 50,
		spawn = Spawners2p:SpawnDragonMid()
	})

	Spawner:SpawnTimer({
		start = 1840,
		finish = 2000,
		interval = 30,
		spawn = Spawners2p:SpawnStalkerMid()
	})

	Spawner:SpawnTimer({
		start = 2100,
		finish = 2250,
		interval = 40,
		spawn = Spawners2p:SpawnRoshMid()
	})

	Spawner:SpawnTimer({
		start = 2100,
		finish = 2250,
		interval = 45,
		spawn = Spawners2p:SpawnLizardMid()
	})

	Spawner:SpawnTimer({
		start = 2160,
		spawn = Spawners2p:SpawnAA()
	})


-- Neutral Camps/Map Spawns
	Spawner:SpawnTimer({
		start = 0,
		interval = 30,
		spawn = Spawners2p.SpawnFriend
	})

	Spawner:SpawnTimer({
		start = 1,
		interval = 30,
		spawn = Spawners2p.SpawnFriend
	})

	Spawner:SpawnTimer({
		start = 0,
		finish = 1200,
		interval = 150,
		spawn = Spawners2p:SpawnMoney()
	})
end