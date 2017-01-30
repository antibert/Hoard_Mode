--[[Hoard mode Bonus Round Skills for creeps]]
LinkLuaModifier("modifier_brs_boosted", "HoardBRS/modifiers/modifier_brs_boosted.lua", LUA_MODIFIER_MOTION_NONE)

local skillSet = LoadKeyValues('scripts/vscripts/HoardBRS/abilityList.kv')
local skillTimeSet = LoadKeyValues('scripts/vscripts/HoardBRS/timeList.kv')

--[[Get random key string from a selected table]]
function fetchAbilityParameters(table)
	local keyset={}
	local n=0
    local maxLevel=0
    local Toggleable=0

	for k,v in pairs(table) do
		n=n+1
		keyset[n]=k
	end
    
    local rand=math.random(#keyset)
    --Precaution
    if rand==0 then
        rand=1
    end
    
    maxLevel=table[keyset[rand]].Levels
    Toggleable=table[keyset[rand]].Toggleable
    
	return keyset[rand], maxLevel, Toggleable
end

--[[Get random key string from two tables. Tables are traited like a one big array]]
function fetchAbilityParametersTwoArr(table, table2)
	local keyset={}
	local n=0
    local firstArray=0
    local maxLevel=0
    local Toggleable=0
    

	for k,v in pairs(table) do
		n=n+1
		keyset[n]=k
	end
    firstArray=n
    
    for k,v in pairs(table2) do
		n=n+1
		keyset[n]=k
	end
    
    local rand=math.random(#keyset)
    --Precaution
    if rand==0 then
        rand=1
    end
    
    if rand<=firstArray then
        maxLevel=table[keyset[rand]].Levels
        Toggleable=table[keyset[rand]].Toggleable
    else
        maxLevel=table2[keyset[n-firstArray]].Levels
        Toggleable=table2[keyset[n-firstArray]].Toggleable
    end
    
	return keyset[rand], maxLevel, Toggleable
end

--[[Get time data from the selected table]]
function fetchAbilityTimeParameters(table)
	local keyset={}
	local n=0
    local Ultra=0
    local UltraLevels=0
    local Skills=0
    local Levels=0
    
	for k,v in pairs(table) do
		n=n+1
		keyset[n]=k
	end
    
    local rand=math.random(#keyset)
    print("Timestamp №:",keyset[rand])
    
    Ultra=table[keyset[rand]].Ultra
    UltraLevels=table[keyset[rand]].UltraLevels
    Skills=table[keyset[rand]].Skills
    Levels=table[keyset[rand]].Levels
    
	return keyset[rand], Ultra, UltraLevels, Skills, Levels
end

--[[Ability appliance calculation function. Considers time and ability amount]]
function calculateAbilityPack(target, amount, levels, ...)
    local tempArray={}
    local tempArrayIter=0
    local found=2
    
    local argString1={}
    local argString2={}
    
    argString1, argString2=...
    
    local newAbility={}
    local maxLevel=0
    local Toggleable=0
    
    for i=amount, 1,-1 do
        if (argString2~=nil) then
            newAbility, maxLevel, Toggleable=fetchAbilityParametersTwoArr(skillSet[argString1], skillSet[argString2])
            --I've used the secret Ninja technique, called "syntactical fuck you", due to which, a
            --function with multiple returns can fill up multiple variables in a single stroke.
        else
            newAbility, maxLevel, Toggleable=fetchAbilityParameters(skillSet[argString1])
        end
        
        for k,v in pairs(tempArray) do
            if k==newAbility then
                found=1
            break
            end
        end
        for i=20,0,-1 do -- Magical number 20 represents maximal ability amount unit ever may have.
            local ability_index = target:GetAbilityByIndex(i)
            if ability_index ~= nil then
                if ability_index:GetAbilityName() == newAbility then
                    found=1
                    break
                end
            end
        end
        if found==2 then
            target:AddAbility(newAbility)
            local h_Ability = target:FindAbilityByName(newAbility)
            local tmpLevels=levels
            if (maxLevel<tmpLevels) then
                tmpLevels=maxLevel
            end
			h_Ability:SetLevel(tmpLevels)
            if Toggleable==1 then
                h_Ability:ToggleAbility()
                h_Ability:ToggleAutoCast()
            end
            tempArray[tempArrayIter]=newAbility
            tempArrayIter=tempArrayIter+1
        end
        found=2
    end
end

-- Precaution
if BonusRoundSkills == nil then
	_G.BonusRoundSkills = class({})
end

--[[Apply abilities from the KV file]]
function BonusRoundSkills:ApplyAbilities(target, skillarray, timearray)
    local skillTime = skillTimeSet.Time
    local currTime={}
        
    local Ultra=0
    local UltraLevels=0
    local Skills=0
    local Levels=0
    
    --for ability,options in pairs(skillTypes) do    
    
    fetchAbilityTimeParameters(skillTime)
    Skills=1
    Levels=1
    
    local timeTxt = string.gsub(string.gsub(GetSystemTime(), ':', ''), '0','')
    math.randomseed(tonumber(timeTxt)+math.random(50))
    calculateAbilityPack(target, Ultra, UltraLevels, "UltraSkills")
    --calculateAbilityPack(target, Skills, Levels, "nhuSkills", "heroSkills")
    calculateAbilityPack(target, Skills, Levels, "heroSkills")
            
    --newAbility, maxLevel, Toggleable=fetchAbilityParametersTwoArr(skillSet.nhuSkills, skillSet.heroSkills)   
    --end
end

function trigger_Upgrade(trigger)
    local unit = trigger.activator
    
    if unit:HasModifier("modifier_brs_boosted") then
    return
    else
        unit:AddNewModifier(unit, nil, "modifier_brs_boosted", {duration=-1})
        BonusRoundSkills:ApplyAbilities(unit, skillSet, skillTimeSet)
    end
end


--[[
function trigger_Upgrade(trigger)
    local unit = trigger.activator
    local playerID = unit:GetPlayerOwnerID()
    if playerID and PlayerResource:HasSelectedHero( playerID ) then
        local hero = PlayerResource:GetSelectedHeroEntity(playerID)
        local found=2
        for i=20,1,-1 do
            local ability_index = hero:GetAbilityByIndex(i)
            if ability_index ~= nil then
                print("next ability is:",ability_index:GetAbilityName())
                if ability_index:GetAbilityName() == "sniper_headshot" then
                    found=1
                    break
                end
            end
        end
        if found==2 then
            hero:AddAbility("sniper_headshot")
        end
    end
end
]]


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

			-- Add abilities
			building:AddAbility("reward_global_offense_buff")
			local ancient_ability = building:FindAbilityByName("reward_global_offense_buff")

			building:AddAbility("tower_aura")
			local tower_aura = building:FindAbilityByName("tower_aura")

			building:AddAbility("tower_splash")
			local tower_splash = building:FindAbilityByName("tower_splash")

			if string.find(building_name, "tower1") then
				ancient_ability:SetLevel(1)
				tower_aura:SetLevel(1)
				tower_splash:SetLevel(1)
			elseif string.find(building_name, "tower2") then
				ancient_ability:SetLevel(1)
				tower_aura:SetLevel(2)
				tower_splash:SetLevel(2)
			elseif string.find(building_name, "tower3") then
				ancient_ability:SetLevel(1)
				tower_aura:SetLevel(3)
				tower_splash:SetLevel(3)
			elseif string.find(building_name, "tower4") then
				ancient_ability:SetLevel(1)
				tower_aura:SetLevel(4)
				tower_splash:SetLevel(4)
			end

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

-- function that sets the timers for all the wave spawns
function mapLogic:SetSpawns()
	ShowMessage('Map name when called upon in the test client:' .. GetMapName())
	local mapData = mapInfo[string.lower(GetMapName())]
	if mapData == nil then
		mapData = mapInfo.Default
	end
	Spawners:StartSpawners(self.DIFFICULTY, self.PLAYERS, mapData)
end