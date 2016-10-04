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
		start = waveBoss(1),
		interval = 3000,
		spawn = Spawners2p:SpawnRoshan()
	})

	Spawner:SpawnTimer({
		start = waveBoss(2)-90,
		interval = 3000,
		spawn = Spawners2p:SpawnBigBear()
	})

	Spawner:SpawnTimer({
		start = waveBoss(2),
		interval = 3000,
		spawn = Spawners2p:SpawnOgreBoss()
	})

	Spawner:SpawnTimer({
		start = waveBoss(3),
		interval = 3000,
		spawn = Spawners2p:SpawnKingTree()
	})

	Spawner:SpawnTimer({
		start = waveBoss(4),
		interval = 3000,
		spawn = Spawners2p:SpawnBigSplitter()
	})

	Spawner:SpawnTimer({
		start = waveBoss(5),
		interval = 3000,
		spawn = Spawners2p:SpawnCentaurBoss()
	})

	Spawner:SpawnTimer({
		start = waveBoss(7),
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
		start = 120,
		finish = 180,
		spawn = Spawners2p:SpawnBeast()
	})

    Spawner:SpawnTimer({
	    start = waveStart(2),
	    finish = waveEnd(2),
	    interval = 53,
	    spawn = Spawners2p:SpawnFrostOgres()
    })

	Spawner:SpawnTimer({
		start = waveStart(1),
		finish = waveEnd(1),
		interval = 23,
		spawn = Spawners2p:SpawnZombies()
	})

	Spawner:SpawnTimer({
		start = waveStart(1)+150,
		finish = waveEnd(1),
		interval = 40,
		spawn = Spawners2p:SpawnCorpse()
	})

	Spawner:SpawnTimer({
		start = waveStart(1)+40,
		finish = waveEnd(1),
		interval = 30,
		spawn = Spawners2p:SpawnSpiders()
	})

	Spawner:SpawnTimer({
		start = waveStart(1)+150,
		interval = 40,
		finish = waveEnd(1),
		spawn = Spawners2p:SpawnBigSpiders()
	})

	Spawner:SpawnTimer({
		start = waveStart(1),
		finish = waveEnd(1),
		interval = 23,
		spawn = Spawners2p:SpawnCoolSpiders()
	})

	Spawner:SpawnTimer({
		start = waveStart(1),
		finish = waveEnd(1),
		interval = 17,
		spawn = Spawners2p:SpawnMiniSpiders()
	})

	Spawner:SpawnTimer({
		start = waveStart(1),
		interval = 17,
		finish = waveEnd(1),
		spawn = Spawners2p:SpawnSpookiMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(2),
		finish = waveEnd(2),
		interval = 30,
		spawn = Spawners2p:SpawnNyx()
	})

	Spawner:SpawnTimer({
		start = waveStart(2)+30,
		finish = waveEnd(2),
		interval = 45,
		spawn = Spawners2p:SpawnOgre()
	})

	Spawner:SpawnTimer({
		start = waveStart(2),
		finish = waveEnd(2),
		interval = 40,
		spawn = Spawners2p:SpawnMiniSatyrs()
	})

	Spawner:SpawnTimer({
		start = waveStart(2),
		finish = waveEnd(2),
		interval = 33,
		spawn = Spawners2p:SpawnSatyrs()
	})

	Spawner:SpawnTimer({
		start = waveStart(4),
		finish = waveEnd(4),
		interval = 23,
		spawn = Spawners2p:SpawnGhostMeele()
	})

	Spawner:SpawnTimer({
		start = waveStart(4),
		finish = waveEnd(4),
		interval = 14,
		spawn = Spawners2p:SpawnGhost()
	})

	Spawner:SpawnTimer({
		start = waveStart(2),
		finish = waveEnd(2),
		interval = 27,
		spawn = Spawners2p:SpawnBears()
	})

	Spawner:SpawnTimer({
		start = waveStart(2),
		finish = waveEnd(2),
		interval = 27,
		spawn = Spawners2p:SpawnLargeBears()
	})

	Spawner:SpawnTimer({
		start = waveStart(2)+40,
		finish = waveEnd(2),
		interval = 27,
		spawn = Spawners2p:SpawnDrake()
	})

	Spawner:SpawnTimer({
		start = waveStart(3)+20,
		finish = waveEnd(3),
		interval = 60,
		spawn = Spawners2p:SpawnProphet()
	})

	Spawner:SpawnTimer({
		start = waveStart(3),
		finish = waveEnd(3),
		interval = 20,
		spawn = Spawners2p:SpawnTreesMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(3)+35,
		finish = waveEnd(3),
		interval = 45,
		spawn = Spawners2p:SpawnShroomMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(3),
		finish = waveEnd(3),
		interval = 37,
		spawn = Spawners2p:SpawnFangMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(3),
		finish = waveEnd(3),
		interval = 35,
		spawn = Spawners2p:SpawnThing()
	})

	Spawner:SpawnTimer({
		start = waveStart(3)+100,
		spawn = Spawners2p:SpawnStump()
	})

	Spawner:SpawnTimer({
		start = waveStart(4),
		finish = waveEnd(4),
		interval = 34,
		spawn = Spawners2p:SpawnSplitterMid()
	})

    Spawner:SpawnTimer({
	    start = waveStart(4)+45,
	    finish = waveEnd(4),
	    interval = 60,
	    spawn = Spawners2p:SpawnRockMid()
    })

	Spawner:SpawnTimer({
		start = waveStart(3)+60,
		finish = waveEnd(3),
		interval = 90,
		spawn = Spawners2p:SpawnRhinoMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(5),
		finish = waveEnd(5),
		interval = 27,
		spawn = Spawners2p:SpawnGuardMid()
	})

    Spawner:SpawnTimer({
	    start = waveStart(5),
	    finish = waveEnd(5),
	    interval = 27,
	    spawn = Spawners2p:SpawnRippers()
    })

	Spawner:SpawnTimer({
		start = waveStart(5),
		finish = waveEnd(5),
		interval = 33,
		spawn = Spawners2p:SpawnCentaurMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(5)+5,
		finish = waveEnd(5),
		interval = 27,
		spawn = Spawners2p:SpawnTrollMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(6),
		finish = waveEnd(6),
		interval = 38,
		spawn = Spawners2p:SpawnDemonMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(6),
		finish = waveEnd(6),
		interval = 30,
		spawn = Spawners2p:SpawnDemonDogMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(6),
		finish = waveEnd(6),
		interval = 25,
		spawn = Spawners2p:SpawnMiniDemonMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(6),
		finish = waveEnd(6),
		interval = 33,
		spawn = Spawners2p:SpawnDragonMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(6),
		finish = waveEnd(6),
		interval = 27,
		spawn = Spawners2p:SpawnStalkerMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(7),
		finish = waveEnd(7),
		interval = 50,
		spawn = Spawners2p:SpawnRoshMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(7),
		finish = waveEnd(7),
		interval = 45,
		spawn = Spawners2p:SpawnLizardMid()
	})

	Spawner:SpawnTimer({
		start = waveStart(7),
		finish = waveEnd(7),
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