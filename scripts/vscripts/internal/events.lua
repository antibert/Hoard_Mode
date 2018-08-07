
skillTimeSet = LoadKeyValues('scripts/vscripts/HoardBRS/timeList.kv')

-- The overall game state has changed
function GameMode:_OnGameRulesStateChange(keys)
  local newState = GameRules:State_Get()
  if newState == DOTA_GAMERULES_STATE_WAIT_FOR_PLAYERS_TO_LOAD then
    self.bSeenWaitForPlayers = true
  elseif newState == DOTA_GAMERULES_STATE_INIT then
    --Timers:RemoveTimer("alljointimer")
  elseif newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
    GameMode:PostLoadPrecache()
    GameMode:OnAllPlayersLoaded()
        
    --In case noone pressed vote buttons, prepare data
    if _G.GameMode.DIFFICULTY==nil then
       GameMode:ProcessVotes()     
    end
        
    _G.GameMode.difficulty_name = "Easy"
    if _G.GameMode.DIFFICULTY == 3 or string.find(string.lower(GetMapName()), "ultra") then
      _G.GameMode.difficulty_name = "Ultra" 
    elseif _G.GameMode.DIFFICULTY == 2 then
      _G.GameMode.difficulty_name = "Hard"
    elseif _G.GameMode.DIFFICULTY == 1 then
      _G.GameMode.difficulty_name = "Medium"
    end
            
    --Announce the selected difficulty
    --Say(nil, "Map difficulty: " .. _G.GameMode.difficulty_name, true)

    if USE_CUSTOM_TEAM_COLORS_FOR_PLAYERS then
      for i=0,9 do
        if PlayerResource:IsValidPlayer(i) then
          local color = TEAM_COLORS[PlayerResource:GetTeam(i)]
          PlayerResource:SetCustomPlayerColor(i, color[1], color[2], color[3])
        end
      end
    end
  elseif newState == DOTA_GAMERULES_STATE_STRATEGY_TIME then
    GameMode:ForceAssignHeroes()
  elseif newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
    GameMode:OnGameInProgress()
  end
end

function GameMode:ForceAssignHeroes()
	for nPlayerID = 0, ( DOTA_MAX_TEAM_PLAYERS - 1 ) do
        local hPlayer = PlayerResource:GetPlayer( nPlayerID )
        if hPlayer and not PlayerResource:HasSelectedHero( nPlayerID ) then
            hPlayer:MakeRandomHeroSelection()
        end
	end
end

function GameMode:ProcessVotes()
	local mode 	= GameMode
	local votes = mode.VoteTable

	--[[
	-- Random tables for test purposes
	local testTable = {game_length = {}, combat_system = {}}
	local votes_a = {15, 20, 25, 30}
	local votes_b = {1, 2}
	for i = 0,9 do
		testTable.game_length[i] 	= votes_a[math.random(table.getn(votes_a))]
		testTable.combat_system[i] 	= votes_b[math.random(table.getn(votes_b))]
	end
	votes = testTable
	]]

	mode.game_length = 0
	mode.combat_system = ""

	for category, pidVoteTable in pairs(votes) do

		-- Tally the votes into a new table
		local voteCounts = {}
		local totalValue = 0
		for pid, vote in pairs(pidVoteTable) do
			if not voteCounts[vote] then voteCounts[vote] = 0 end
			totalValue = totalValue + vote
			voteCounts[vote] = voteCounts[vote] + 1
		end

		--print(" ----- " .. category .. " ----- ")
		--PrintTable(voteCounts)

		-- Find the key that has the highest value (key=vote value, value=number of votes)
		local highest_vote = 0
		local highest_key = ""
		for k, v in pairs(voteCounts) do
			if v > highest_vote then
				highest_key = k
				highest_vote = v
			end
		end

		-- Check for a tie by counting how many values have the highest number of votes
		local tieTable = {}
		for k, v in pairs(voteCounts) do
			if v == highest_vote then
				table.insert(tieTable, k)
			end
		end

		-- Resolve a tie by selecting a random value from those with the highest votes
		if table.getn(tieTable) > 1 then
			--print("TIE!")
			highest_key = tieTable[math.random(table.getn(tieTable))]
		end

		--local averageValue = totalValue / table.getn(voteCounts)

		-- Act on the winning vote
		if category == "difficulty" then
			--highest_key = math.floor(averageValue + 0.5)
			mode.DIFFICULTY = highest_key
			--GameRules:SetPreGameTime( 60 * highest_key )
			--mode.game_length = highest_key
		end

		print(category .. ": " .. highest_key)
        
        local event_data =
        {
            difficulty = tostring(highest_key),
        }
        CustomGameEventManager:Send_ServerToAllClients( "info_difficulty", event_data )
	end
end

-- An NPC has spawned somewhere in game.  This includes heroes
function GameMode:_OnNPCSpawned(keys)
  local npc = EntIndexToHScript(keys.entindex)

  if npc:IsRealHero() and npc.bFirstSpawned == nil then
    npc.bFirstSpawned = true
    GameMode:OnHeroInGame(npc)
  end
end

-- An entity died
function GameMode:_OnEntityKilled( keys )
  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

  if killedUnit:IsRealHero() then 
    DebugPrint("KILLED, KILLER: " .. killedUnit:GetName() .. " -- " .. killerEntity:GetName())
    if END_GAME_ON_KILLS and GetTeamHeroKills(killerEntity:GetTeam()) >= KILLS_TO_END_GAME_FOR_TEAM then
      GameRules:SetSafeToLeave( true )
      GameRules:SetGameWinner( killerEntity:GetTeam() )
    end

    --PlayerResource:GetTeamKills
    if SHOW_KILLS_ON_TOPBAR then
      GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_BADGUYS, GetTeamHeroKills(DOTA_TEAM_BADGUYS) )
      GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_GOODGUYS, GetTeamHeroKills(DOTA_TEAM_GOODGUYS) )
    end
  end
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function GameMode:_OnConnectFull(keys)
  GameMode:_CaptureGameMode()

  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  local userID = keys.userid

  self.vUserIds = self.vUserIds or {}
  self.vUserIds[userID] = ply
end