-- Solo map Spawn Timers

if SpawnTimersSolo == nil then
	SpawnTimersSolo = class({})
end

require('libraries/timers')

function Spawners:StartSpawners()
	Timers:CreateTimer("gnolls", {
		useGameTime = true,
		endTime = 0,
		callback = function()
			Spawners:SpawnGnollsMid()
			return 30.0
		end
	})
	Timers:CreateTimer(180, function()
		Spawners:StopSpawner("gnolls")
	end)
end

function Spawners:StopSpawner(spawner)
	Timers:RemoveTimer(spawner)
end