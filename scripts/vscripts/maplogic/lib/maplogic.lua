--
-- Created by IntelliJ IDEA.
-- User: Diellan
-- Date: 3/12/2016
-- Time: 3:55 PM
-- To change this template use File | Settings | File Templates.
--
local mapInfo = LoadKeyValues('scripts/vscripts/maplogic/settings.kv')
local MAP_LOGIC_DIFFICULTY_EASY = 0
local MAP_LOGIC_DIFFICULTY_MEDIUM = 0
local MAP_LOGIC_DIFFICULTY_HARD = 1
local MAP_LOGIC_DIFFICULTY_ULTRA = 2

-- Constants used for pretty formatting, as well as strings
local printPrefix = 'Map Logic: '
local errorInitCalledTwice = 'Please ensure you only make a single call to mapLogic:init, only the first call actually works.'

local messageStarting = 'Map Logic module is trying to init...'

-- Create the map logic class
if not mapLogic then
	mapLogic = class({})
end

-- Function that will setup stat collection
function mapLogic:Init()
	-- Only allow init to be run once
	if self.DONE_INIT then
		print(printPrefix .. errorInitCalledTwice)
		return
	end

	self.DONE_INIT = true
	self.DIFFICULTY = MAP_LOGIC_DIFFICULTY_MEDIUM
	self.HAS_TOP = true
	self.HAS_MID = true
	self.HAS_BOT = true

	-- Print the intro message
	print(printPrefix .. messageStarting)

	self.MAP = GetMapName()
	self:SetDifficultyValues()
	self:SetFriendlyBuildings()
	self:SetEnemyBuildings()

	self:SetSpawns()
end

-- Function that will set various settings based on difficulty
function mapLogic:SetDifficultyValues()
	if self.MAP == 'Horde_5p_easy' then
		self.DIFFICULTY = MAP_LOGIC_DIFFICULTY_EASY
	elseif self.MAP == 'Horde_4p_medium' then
		self.DIFFICULTY = MAP_LOGIC_DIFFICULTY_MEDIUM
	elseif self.MAP == 'Horde_4p_hard' then
		self.DIFFICULTY = MAP_LOGIC_DIFFICULTY_HARD
	elseif self.MAP == 'Horde_4p_ultra' then
		self.DIFFICULTY = MAP_LOGIC_DIFFICULTY_ULTRA
	elseif self.MAP == 'Horde_2p_easy' then
		self.DIFFICULTY = MAP_LOGIC_DIFFICULTY_MEDIUM
		self.HAS_BOT = false
		self.HAS_TOP = false
	else
		self.DIFFICULTY = MAP_LOGIC_DIFFICULTY_EASY
	end
end

-- Function that will grant the abilities to the friendly towers
function mapLogic:SetFriendlyBuildings()
	-- Find all friendly buildings on the map
	local buildings = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, Vector(0,0,0), nil, 20000, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_INVULNERABLE, FIND_ANY_ORDER, false)

	-- Iterate through each one
	for _, building in pairs(buildings) do

		-- Parameters
		local building_name = building:GetName()
		DebugPrint(building_name)

		-- Identify the building type
		if string.find(building_name, "tower") then
			building:AddAbility("tower_overpower")
			local tower_overpower = building:FindAbilityByName("tower_overpower")
			tower_overpower:SetLevel(0)

			building:AddAbility("tower_stats")
			local tower_stats = building:FindAbilityByName("tower_stats")
			tower_stats:SetLevel(0)

			building:AddAbility("tower_splash")
			local tower_splash = building:FindAbilityByName("tower_splash")
			tower_splash:SetLevel(0)

			building:AddAbility("reward_global_offense_penalty")
			local ancient_ability = building:FindAbilityByName("reward_global_offense_penalty")
			ancient_ability:SetLevel(1)

		elseif string.find(building_name, "rax_melee") then
			building:AddAbility("reward_global_armor_penalty")
			local ancient_ability = building:FindAbilityByName("reward_global_armor_penalty")
			ancient_ability:SetLevel(1)
			--      building:AddAbility("building_stats")
			--      local building_stats = building:FindAbilityByName("building_stats")
			--      building_stats:SetLevel(0)
			--
		elseif string.find(building_name, "rax_range") then
			building:AddAbility("reward_global_armor_penalty")
			local ancient_ability = building:FindAbilityByName("reward_global_armor_penalty")
			ancient_ability:SetLevel(1)
			--      building:AddAbility("building_stats")
			--      local building_stats = building:FindAbilityByName("building_stats")
			--      building_stats:SetLevel(0)

		elseif string.find(building_name, "fort") then
			DebugPrint("Adding abilities to ancient")
			-- Add passive buff
			building:AddAbility("global_armor_buff")
			local ancient_ability = building:FindAbilityByName("global_armor_buff")
			ancient_ability:SetLevel(0)

			-- Add passive buff
			building:AddAbility("global_offense_buff")
			local ancient_ability = building:FindAbilityByName("global_offense_buff")
			ancient_ability:SetLevel(0)

		elseif string.find(building_name, "fountain") then
			-- Do nothing (fountain was already modified previously)
		else

		end

	end
end

-- Function that will grant the abilities to the enemy towers
function mapLogic:SetEnemyBuildings()
	-- Find all enemy buildings on the map
	local buildings = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, Vector(0,0,0), nil, 20000, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_INVULNERABLE, FIND_ANY_ORDER, false)

	-- Iterate through each one
	for _, building in pairs(buildings) do

		-- Parameters
		local building_name = building:GetName()
		DebugPrint(building_name)

		-- Identify the building type
		if string.find(building_name, "tower") then
			DebugPrint("Adding abilities to enemy tower")
			-- Add passive buff
			building:AddAbility("reward_global_offense_buff")
			local ancient_ability = building:FindAbilityByName("reward_global_offense_buff")
			ancient_ability:SetLevel(1)

		elseif string.find(building_name, "rax_melee") then
			DebugPrint("Adding abilities to enemy melee rax")
			-- Add passive buff
			building:AddAbility("reward_global_armor_buff")
			local ancient_ability = building:FindAbilityByName("reward_global_armor_buff")
			ancient_ability:SetLevel(1)

		elseif string.find(building_name, "rax_range") then
			DebugPrint("Adding abilities to enemy ranged rax")
			-- Add passive buff
			building:AddAbility("reward_global_armor_buff")
			local reward_global_armor_buff = building:FindAbilityByName("reward_global_armor_buff")
			reward_global_armor_buff:SetLevel(1)

		elseif string.find(building_name, "fort") then
			-- Add passive buff
			building:AddAbility("global_armor_buff")
			local global_armor_buff = building:FindAbilityByName("global_armor_buff")
			global_armor_buff:SetLevel(self.DIFFICULTY)

			-- Add passive buff
			building:AddAbility("global_offense_buff")
			local global_offense_buff = building:FindAbilityByName("global_offense_buff")
			global_offense_buff:SetLevel(self.DIFFICULTY)

			-- Add passive buff
			building:AddAbility("global_difficulty_buff")
			local global_difficulty_buff = building:FindAbilityByName("global_difficulty_buff")
			global_difficulty_buff:SetLevel(self.DIFFICULTY)

		elseif string.find(building_name, "fountain") then
			-- Do nothing (fountain was already modified previously)
		else

		end

	end
end

require('Spawners')
require('Spawners2p')

-- function that sets the timers for all the wave spawns
function mapLogic:SetSpawns()
	ShowMessage('Map name when called upon in the test client:' .. GetMapName())
	if GetMapName() == 'Horde_2p_easy' then
		Spawners2p:StartSpawners()
		print(" Loading Two Player Map Spawners")
	else
		Spawners:StartSpawners()
		print(" Loading default map spawners")
	end
end