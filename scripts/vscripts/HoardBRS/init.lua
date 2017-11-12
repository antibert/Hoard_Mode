--[[Hoard mode Bonus Round Skills for creeps]]
LinkLuaModifier("modifier_brs_boosted", "HoardBRS/modifiers/modifier_brs_boosted.lua", LUA_MODIFIER_MOTION_NONE)

local skillSet = LoadKeyValues('scripts/vscripts/HoardBRS/abilityList.kv')

if GameMode == nil then
    _G.GameMode = class({})
end

-- Precaution
if BonusRoundSkills == nil then
	_G.BonusRoundSkills = class({})
end

_G.GameMode.HoardBRS_Ultra=0
_G.GameMode.HoardBRS_UltraLevels=0
_G.GameMode.HoardBRS_Skills=0
_G.GameMode.HoardBRS_Levels=0
_G.GameMode.HoardBRS_StartTime=0

--[[Initializing HordeBRS]]
function BonusRoundSkills:InitHoardBRS(baseTime)
    _G.GameMode.HoardBRS_StartTime=baseTime
    
    Timers:CreateTimer(baseTime, function()
        local currTime = Time() - _G.GameMode.HoardBRS_StartTime
        local currMinutesStr=tostring(math.floor(currTime/60))
            
        if skillTimeSet.Time[currMinutesStr] ~= nil then
            _G.GameMode.HoardBRS_Ultra=skillTimeSet.Time[currMinutesStr].Ultra
         _G.GameMode.HoardBRS_UltraLevels=skillTimeSet.Time[currMinutesStr].UltraLevels
            _G.GameMode.HoardBRS_Skills=skillTimeSet.Time[currMinutesStr].Skills
            _G.GameMode.HoardBRS_Levels=skillTimeSet.Time[currMinutesStr].Levels
        end
    return 14.0
    end)
end

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

--[[Ability appliance calculation function. Considers time and ability amount]]
function applyAbilityPack(target, amount, levels, ...)
    --local tempArray={}
    --local tempArrayIter=0
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

            if h_Ability ~= nil then
                local tmpLevels=levels
                if (maxLevel<tmpLevels) then
                    tmpLevels=maxLevel
                end
                h_Ability:SetLevel(tmpLevels)
                if Toggleable==1 then
                    h_Ability:ToggleAbility()
                    h_Ability:ToggleAutoCast()
                end
            end
        end
        found=2
    end
end

--[[Apply abilities from the KV file]]
function BonusRoundSkills:ApplyAbilities(target, skillarray)    
    
    --Gather the skill appliance data from the global vars, that is refreshed by timer
    local Ultra=_G.GameMode.HoardBRS_Ultra
    local UltraLevels=_G.GameMode.HoardBRS_UltraLevels
    local Skills=_G.GameMode.HoardBRS_Skills
    local Levels=_G.GameMode.HoardBRS_Levels   
        
    --[[Apply skills, based on the target, skillslot amount, skill level and category key in the abilityList.kv]]
    applyAbilityPack(target, Ultra, UltraLevels, "UltraSkills")
    applyAbilityPack(target, Skills, Levels, "nhuSkills", "heroSkills")
end

--[[Map's trigger_dota onTrigger action is translated to here]]
function trigger_Upgrade(trigger)
    local unit = trigger.activator
    
    if unit:HasModifier("modifier_brs_boosted") then
    return
    else
        unit:AddNewModifier(unit, nil, "modifier_brs_boosted", {duration=-1})
        BonusRoundSkills:ApplyAbilities(unit, skillSet)
    end
end