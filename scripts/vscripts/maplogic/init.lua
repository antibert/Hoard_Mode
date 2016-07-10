require('maplogic/lib/maplogic')

ListenToGameEvent('game_rules_state_change', function(keys)
	local state = GameRules:State_Get()

	if state >= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS and not mapLogic.DONE_INIT then
		mapLogic:Init({
			DIFFICULTY = _G.GameMode.DIFFICULTY
		})
	end
end, nil)