if Spawners2p == nil then
	Spawners2p = class({})
	bottomFriends = {}
	for i=1, 30 do
		bottomFriends[i] = nil
	end
end

require('SpawnTimers2p')

-- bOSEES

function Spawners2p:SpawnRoshan()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        unit = "npc_dota_creature_roshan_boss_easy"
    }
end

function Spawners2p:SpawnOgreBoss()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        unit = "npc_dota_creature_ogre_boss_easy"
    }
end

function Spawners2p:SpawnKingTree()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        unit = "npc_dota_creature_king_treant"
    }
end

function Spawners2p:SpawnBigBear()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        unit = "npc_dota_creature_big_bear_easy"
    }
end

function Spawners2p:SpawnFuckYou()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        unit = "npc_dota_creature_fuck_you"
    }
end

function Spawners2p:SpawnBigSplitter()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        unit = "npc_dota_creature_big_splitter"
    }
end

function Spawners2p:SpawnCentaurBoss()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        unit = "npc_dota_centaur_boss"
    }
end

-- MID Lane 

function Spawners2p:SpawnGnollsMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 6,
        min = 4,
        unit = "npc_dota_creature_gnoll_assassin"
    }
end

function Spawners2p:SpawnFrostOgres()
    return {
        source =  "spawner2",
        waypoint = "lane_bot_pathcorner_badguys_4",
        max = 2,
        unit = "npc_dota_creature_ogre"
    }
end

function Spawners2p:SpawnBazzMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 8,
        min = 6,
        unit = "npc_dota_creature_bazz_hard"
    }
end

function Spawners2p:SpawnBeast()
    return {
        source =  "spawner4",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_creature_beast"
    }
end

function Spawners2p:SpawnZombies()
    return {
        source =  "spawner5",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 10,
        min = 7,
        unit = "npc_dota_creature_basic_zombie"
    }
end

function Spawners2p:SpawnZombies2()
    return {
        source =  "spawner5",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 6,
        min = 4,
        unit = "npc_dota_creature_berserk_zombie"
    }
end

function Spawners2p:SpawnSpookiMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 2,
        min = 1,
        unit = "npc_dota_creature_spooki"
    }
end

function Spawners2p:SpawnSpookiBot()
    return {
        source =  "spawner2",
        waypoint = "lane_bot_pathcorner_badguys_4",
        max = 4,
        min = 1,
        unit = "npc_dota_creature_spooki"
    }
end

function Spawners2p:SpawnNyx()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_nyx"
    }
end

function Spawners2p:SpawnSpiders()
    return {
        source =  "spawner2",
        waypoint = "lane_top_pathcorner_badguys_4",
        max = 7,
        min = 4,
        unit = "npc_dota_medium_spiders"
    }
end
function Spawners2p:SpawnBigSpiders()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_4",
        max = 2,
        unit = "npc_dota_big_spiders"
    }
end

function Spawners2p:SpawnCoolSpiders()
    return {
        source =  "spawner2",
        waypoint = "lane_top_pathcorner_badguys_4",
        max = 1,
        unit = "npc_dota_creature_cool_spiders"
    }
end

function Spawners2p:SpawnMiniSpiders()
    return {
        source =  "spawner5",
        waypoint = "lane_top_pathcorner_badguys_4",
        max = 2,
        min = 1,
        unit = "npc_dota_creature_mini_spiders"
    }
end

function Spawners2p:SpawnBears()
    return {
        source =  "spawner2",
        waypoint = "lane_top_pathcorner_badguys_4",
        max = 3,
        min = 2,
        unit = "npc_dota_creature_small_spirit_bear"
    }
end

function Spawners2p:SpawnLargeBears()
    return {
        source =  "spawner2",
        waypoint = "lane_top_pathcorner_badguys_4",
        max = 2,
        unit = "npc_dota_creature_large_spirit_bear"
    }
end

function Spawners2p:SpawnMiniSatyrs()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_4",
        max = 2,
        unit = "npc_dota_creature_satyr"
    }
end

function Spawners2p:SpawnDrake()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 4,
        min = 3,
        unit = "npc_dota_creature_drake"
    }
end

function Spawners2p:SpawnRippers()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_4",
        max = 4,
        min = 3,
        unit = "npc_dota_creature_lesser_nightcrawler"
    }
end


function Spawners2p:SpawnSatyrs()
    return {
        source =  "spawner1",
        waypoint = "lane_bot_pathcorner_badguys_4",
        max = 4,
        min = 3,
        unit = "npc_dota_creature_medium_satyr"
    }
end

function Spawners2p:SpawnBigSatyrs()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_4",
        max = 4,
        unit = "npc_dota_creature_big_satyr"
    }
end

function Spawners2p:SpawnOgre()
    return {
        source =  "spawner5",
        waypoint = "lane_bot_pathcorner_badguys_4",
        max = 8,
        min = 7,
        unit = "npc_dota_creature_ogre_melee"
    }
end

function Spawners2p:SpawnHellBear()
    return {
        source =  "spawner5",
        waypoint = "lane_mid_pathcorner_badguys_4",
        max = 1,
        unit = "npc_dota_hellbear"
    }
end

function Spawners2p:SpawnProphet()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_creature_forest_prophet"
    }
end

function Spawners2p:SpawnTreesMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 8,
        min = 6,
        unit = "npc_dota_creature_treant"
    }
end

function Spawners2p:SpawnThing()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 9,
        min = 6,
        unit = "npc_dota_creature_thing"
    }
end

function Spawners2p:SpawnFangMid()
    return {
        source =  "spawner5",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 9,
        min = 6,
        unit = "npc_dota_creature_fang"
    }
end

function Spawners2p:SpawnStump()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        min = 1,
        unit = "npc_dota_creature_stump"
    }
end

function Spawners2p:SpawnShroomMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 5,
        unit = "npc_dota_creature_shroom"
    }
end

function Spawners2p:SpawnCorpse()
    return {
        source =  "spawner5",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_creature_corpselord"
    }
end

function Spawners2p:SpawnAA()
    return {
        source =  "spawner5",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_creature_gnoll_assassin"
    }
end

function Spawners2p:SpawnGuardMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 11,
        min = 9,
        unit = "npc_dota_creature_kobold_guard"
    }
end

function Spawners2p:SpawnGhostMeele()
    return {
        source =  "spawner2",
        waypoint = "lane_top_pathcorner_badguys_4",
        max = 6,
        min = 3,
        unit = "npc_dota_creature_minion"
    }
end

function Spawners2p:SpawnGhost()
    return {
        source =  "spawner2",
        waypoint = "lane_top_pathcorner_badguys_4",
        max = 1,
        unit = "npc_dota_ghost"
    }
end

function Spawners2p:SpawnCentaurMid()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 6,
        min = 4,
        unit = "npc_dota_centaur"
    }
end

function Spawners2p:SpawnTrollMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_creature_troll_healer"
    }
end

function Spawners2p:SpawnSplitterMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 5,
        min = 4,
        unit = "npc_dota_splitter_c"
    }
end

function Spawners2p:SpawnRhinoMid()
    return {
        source =  "spawner1",
        waypoint = "lane_bot_pathcorner_badguys_4",
        max = 1,
        min = 6,
        unit = "npc_dota_creature_gnoll_assassin"
    }
end

function Spawners2p:SpawnRhinoBot()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_rhino"
    }
end

function Spawners2p:SpawnDemonMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 5,
        min = 4,
        unit = "npc_dota_demon"
    }
end

function Spawners2p:SpawnDemonDogMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_demon_dog"
    }
end

function Spawners2p:SpawnMiniDemonMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 8,
        min = 5,
        unit = "npc_dota_mini_demon"
    }
end

function Spawners2p:SpawnDragonMid()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 3,
        min = 2,
        unit = "npc_dota_dragon"
    }
end

function Spawners2p:SpawnLizardMid()
    return {
        source =  "spawner2",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 3,
        min = 2,
        unit = "npc_dota_lizard"
    }
end

function Spawners2p:SpawnStalkerMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 6,
        min = 4,
        unit = "npc_dota_stalker"
    }
end

function Spawners2p:SpawnRoshMid()
    return {
        source =  "spawner1",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 1,
        unit = "npc_dota_roshan_mob"
    }
end


-- Neutral Camps/Map

function Spawners2p:SpawnFriend()
	local point = Entities:FindByName(nil, "spawner7"):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, "lane_bot_pathcorner_goodguys_2"):GetAbsOrigin()
	local spawned_units = 0
    local max_spawn = 12
    local extra_spawn = 0

    local melee_barracks = Entities:FindByName(nil, "good_rax_melee_mid")
    if melee_barracks ~= nil then
        local building_stats = melee_barracks:FindAbilityByName("building_stats")
        if building_stats ~= nil then
            max_spawn = max_spawn + Math.floor(building_stats:GetLevel() / 2)

            if building_stats:GetLevel() > 9 then
                extra_spawn = 2
            elseif building_stats:GetLevel() > 4 then
                extra_spawn = 1
            end
        end
    end

    local ranged_barracks = Entities:FindByName(nil, "good_rax_range_mid")
    local unit_level = 0
    if ranged_barracks ~= nil then
        local ranged_building_stats = ranged_barracks:FindAbilityByName("building_stats")
        if ranged_building_stats ~= nil then
            unit_level = ranged_building_stats:GetLevel()
        end
    end

	for j=1, max_spawn do
		if spawned_units > extra_spawn then
			break
		end
		if bottomFriends[j] ~= nil then
			if bottomFriends[j]:IsNull() == true then
				bottomFriends[j] = nil
			end
		end
		if bottomFriends[j] == nil then
			Timers:CreateTimer(function()
				bottomFriends[j] = CreateUnitByName("npc_dota_creature_friend_easy", point, true, nil, nil, DOTA_TEAM_GOODGUYS)
				-- for testing purposes
				-- bottomFriends[j]:SetMaxHealth(100)
                if unit_level > 0 then
                    bottomFriends[j]:CreatureLevelUp(unit_level)
                end

				ExecuteOrderFromTable({	UnitIndex = bottomFriends[j]:GetEntityIndex(),
										OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
										Position = waypoint, Queue = true} )
				print("Move ",bottomFriends[j]:GetEntityIndex()," to ", waypoint)
				print("Friendly bot creep spawned at index: " .. tostring(j))
			end)
			spawned_units = spawned_units + 1
		end
	end
end

function Spawners2p:SpawnMoney()
    return {
        source =  "spawner6",
        waypoint = "lane_mid_pathcorner_badguys_7",
        max = 3,
        order = DOTA_UNIT_ORDER_STOP,
        unit = "npc_dota_creature_money"
    }
end