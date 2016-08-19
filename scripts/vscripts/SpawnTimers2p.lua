if SpawnTimers2p == nil then
	SpawnTimers2p = class({})
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

function Spawners2p:StartSpawners(difficulty)
    -- First Gnoll spawn example
	-- Start spawning gnolls every 30 seconds.
	Spawner:SpawnTimer({
		start = 0,
		finish = 180,
		interval = 30,
		spawn = Spawners2p:SpawnGnollsMid()
	})
	
-- BOSSES
	Spawner:SpawnTimer({
		start = 400,
		interval = 3000,
		spawn = Spawners2p:SpawnRoshan()
	})

	Spawner:SpawnTimer({
		start = 700,
		interval = 3000,
		spawn = Spawners2p:SpawnBigBear()
	})

	Spawner:SpawnTimer({
		start = 800,
		interval = 3000,
		spawn = Spawners2p:SpawnOgreBoss()
	})

	Spawner:SpawnTimer({
		start = 1130,
		interval = 3000,
		spawn = Spawners2p:SpawnKingTree()
	})

	Spawner:SpawnTimer({
		start = 1310,
		interval = 3000,
		spawn = Spawners2p:SpawnBigSplitter()
	})

	Spawner:SpawnTimer({
		start = 1600,
		interval = 3000,
		spawn = Spawners2p:SpawnCentaurBoss()
	})

	Spawner:SpawnTimer({
		start = 2000,
		interval = 3000,
		spawn = Spawners2p:SpawnFuckYou()
	})
 
-- MID LANE/All Lanes
	Spawner:SpawnTimer({
		start = 30,
		finish = 180,
		interval = 30,
		spawn = Spawners2p:SpawnBazzMid()
	})

	Spawner:SpawnTimer({
		start = 140,
		finish = 180,
		interval = 60,
		spawn = Spawners2p:SpawnBeast()
	})

    Spawner:SpawnTimer({
	    start = 540,
	    finish = 860,
	    interval = 53,
	    spawn = Spawners2p:SpawnFrostOgres()
    })

	Spawner:SpawnTimer({
		start = 180,
		finish = 510,
		interval = 23,
		spawn = Spawners2p:SpawnZombies()
	})

	Spawner:SpawnTimer({
		start = 2280,
		interval = 13,
		spawn = Spawners2p:SpawnZombies()
	})

	Spawner:SpawnTimer({
		start = 360,
		finish = 510,
		interval = 40,
		spawn = Spawners2p:SpawnCorpse()
	})

	Spawner:SpawnTimer({
		start = 250,
		finish = 510,
		interval = 30,
		spawn = Spawners2p:SpawnSpiders()
	})

	Spawner:SpawnTimer({
		start = 360,
		interval = 40,
		finish = 510,
		spawn = Spawners2p:SpawnBigSpiders()
	})

	Spawner:SpawnTimer({
		start = 180,
		finish = 510,
		interval = 23,
		spawn = Spawners2p:SpawnCoolSpiders()
	})

	Spawner:SpawnTimer({
		start = 210,
		finish = 510,
		interval = 17,
		spawn = Spawners2p:SpawnMiniSpiders()
	})

	Spawner:SpawnTimer({
		start = 210,
		interval = 17,
		finish = 510,
		spawn = Spawners2p:SpawnSpookiMid()
	})

	Spawner:SpawnTimer({
		start = 530,
		finish = 860,
		interval = 30,
		spawn = Spawners2p:SpawnNyx()
	})

	Spawner:SpawnTimer({
		start = 530,
		finish = 860,
		interval = 45,
		spawn = Spawners2p:SpawnOgre()
	})

	Spawner:SpawnTimer({
		start = 500,
		finish = 860,
		interval = 40,
		spawn = Spawners2p:SpawnMiniSatyrs()
	})



	Spawner:SpawnTimer({
		start = 500,
		finish = 860,
		interval = 33,
		spawn = Spawners2p:SpawnSatyrs()
	})

	Spawner:SpawnTimer({
		start = 1270,
		finish = 1560,
		interval = 23,
		spawn = Spawners2p:SpawnGhostMeele()
	})

	Spawner:SpawnTimer({
		start = 1270,
		finish = 1560,
		interval = 14,
		spawn = Spawners2p:SpawnGhost()
	})

	Spawner:SpawnTimer({
		start = 540,
		finish = 860,
		interval = 27,
		spawn = Spawners2p:SpawnBears()
	})

	Spawner:SpawnTimer({
		start = 660,
		finish = 860,
		interval = 27,
		spawn = Spawners2p:SpawnLargeBears()
	})

	Spawner:SpawnTimer({
		start = 540,
		finish = 860,
		interval = 23,
		spawn = Spawners2p:SpawnDrake()
	})

	Spawner:SpawnTimer({
		start = 930,
		finish = 1210,
		interval = 60,
		spawn = Spawners2p:SpawnProphet()
	})

	Spawner:SpawnTimer({
		start = 910,
		finish = 1210,
		interval = 20,
		spawn = Spawners2p:SpawnTreesMid()
	})

	Spawner:SpawnTimer({
		start = 945,
		finish = 1210,
		interval = 45,
		spawn = Spawners2p:SpawnShroomMid()
	})

	Spawner:SpawnTimer({
		start = 980,
		finish = 1210,
		interval = 25,
		spawn = Spawners2p:SpawnFangMid()
	})

	Spawner:SpawnTimer({
		start = 915,
		finish = 1210,
		interval = 35,
		spawn = Spawners2p:SpawnThing()
	})

	Spawner:SpawnTimer({
		start = 1020,
		spawn = Spawners2p:SpawnStump()
	})

	Spawner:SpawnTimer({
		start = 1260,
		finish = 1560,
		interval = 34,
		spawn = Spawners2p:SpawnSplitterMid()
	})

	Spawner:SpawnTimer({
		start = 980,
		finish = 1210,
		interval = 90,
		spawn = Spawners2p:SpawnRhinoMid()
	})

	Spawner:SpawnTimer({
		start = 1440,
		finish = 1910,
		interval = 27,
		spawn = Spawners2p:SpawnGuardMid()
	})

    Spawner:SpawnTimer({
	    start = 1440,
	    finish = 1910,
	    interval = 27,
	    spawn = Spawners2p:SpawnRippers()
    })

	Spawner:SpawnTimer({
		start = 1440,
		finish = 1910,
		interval = 33,
		spawn = Spawners2p:SpawnCentaurMid()
	})

	Spawner:SpawnTimer({
		start = 1445,
		finish = 1910,
		interval = 27,
		spawn = Spawners2p:SpawnTrollMid()
	})

	Spawner:SpawnTimer({
		start = 1730,
		finish = 2260,
		interval = 38,
		spawn = Spawners2p:SpawnDemonMid()
	})

	Spawner:SpawnTimer({
		start = 1730,
		finish = 2260,
		interval = 30,
		spawn = Spawners2p:SpawnDemonDogMid()
	})

	Spawner:SpawnTimer({
		start = 1730,
		finish = 2260,
		interval = 25,
		spawn = Spawners2p:SpawnMiniDemonMid()
	})

	Spawner:SpawnTimer({
		start = 1730,
		finish = 2260,
		interval = 33,
		spawn = Spawners2p:SpawnDragonMid()
	})

	Spawner:SpawnTimer({
		start = 1740,
		finish = 2260,
		interval = 27,
		spawn = Spawners2p:SpawnStalkerMid()
	})

	Spawner:SpawnTimer({
		start = 2100,
		finish = 2610,
		interval = 50,
		spawn = Spawners2p:SpawnRoshMid()
	})

	Spawner:SpawnTimer({
		start = 2130,
		finish = 2610,
		interval = 45,
		spawn = Spawners2p:SpawnLizardMid()
	})

	Spawner:SpawnTimer({
		start = 2100,
		finish = 2610,
		interval = 140,
		spawn = Spawners2p:SpawnAA()
	})


    ---------------------------------------------------------------------------------------------
    ---------------- START OF FINAL PHASE SPAWNERS --------------------------------
    -----------------------------------------------------------------------------------------------

    Spawner:SpawnTimer({
	    start = waveStart(8),
	    interval = 150,
	    spawn = Spawners2p:SpawnOgreBoss()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8)+20,
	    interval = 100,
	    spawn = Spawners2p:SpawnBigBear()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8)+60,
	    interval = 130,
	    spawn = Spawners2p:SpawnBigSplitter()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8)+100,
	    interval = 27,
	    spawn = Spawners2p:SpawnGhost()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8)+120,
	    interval = 80,
	    spawn = Spawners2p:SpawnDragonMid()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8),
	    interval = 75,
	    spawn = Spawners2p:SpawnDemonMid()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8),
	    interval = 43,
	    spawn = Spawners2p:SpawnShroomMid()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8),
	    interval = 30,
	    spawn = Spawners2p:SpawnCorpse()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8),
	    interval = 55,
	    spawn = Spawners2p:SpawnTrollMid()
    })
    Spawner:SpawnTimer({
	    start = waveStart(8),
	    interval = 120,
	    spawn = Spawners2p:SpawnSplitterMid()
    })

    ---------------------------------------------------------------------------------------------
    ---------------- END OF FINAL PHASE SPAWNERS --------------------------------
    -----------------------------------------------------------------------------------------------


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