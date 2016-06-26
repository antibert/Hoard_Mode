--[[
	author: diellan
	email: diellan@gmail.com
	Date: 09.03.2016.

	Based on jacklarnes, Noya and BMD
]]

--[[Save relevant information for future use and create the first bounce projectile]]
function shuriken_toss_start_create_dummy( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1

	-- Create the dummy unit which keeps track of bounces
	local dummy = CreateUnitByName( "npc_dummy_blank", target:GetAbsOrigin(), false, caster, caster, caster:GetTeamNumber() )
	dummy:AddAbility("bounty_hunter_shuriken_toss_dummy_datadriven")
	local dummy_ability =  dummy:FindAbilityByName("bounty_hunter_shuriken_toss_dummy_datadriven")
	dummy_ability:ApplyDataDrivenModifier( caster, dummy, "modifier_shuriken_toss_dummy_unit", {} )

	-- Ability variables
	dummy_ability.damage = ability:GetLevelSpecialValueFor("bonus_damage", ability_level)
	dummy_ability.bounceTable = {}
	dummy_ability.bounceCount = 0
	dummy_ability.maxBounces = ability:GetLevelSpecialValueFor("bounces", ability_level)
	dummy_ability.bounceRange = ability:GetLevelSpecialValueFor("bounce_aoe", ability_level)
	dummy_ability.dmgMultiplier = ability:GetLevelSpecialValueFor("damage_reduction_percent", ability_level) / 100
	dummy_ability.original_ability = ability

	dummy_ability.particle_name = "particles/units/heroes/hero_bounty_hunter/bounty_hunter_suriken_toss.vpcf"
	dummy_ability.projectile_speed = ability:GetLevelSpecialValueFor("speed", ability_level)
	dummy_ability.projectileFrom = target
	dummy_ability.projectileTo = nil

	-- Find the closest target that fits the search criteria
	local iTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	local iType = DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO
	local iFlag = DOTA_UNIT_TARGET_FLAG_NONE
	local bounce_targets = FindUnitsInRadius(caster:GetTeamNumber(), dummy:GetAbsOrigin(), nil, dummy_ability.bounceRange, iTeam, iType, iFlag, FIND_CLOSEST, false)

	dummy_ability.bounceTable[target] = ((dummy_ability.bounceTable[target] or 0) + 1)

	-- It has to be a target different from the current one
	for _,v in pairs(bounce_targets) do
		if v ~= target and v:CanEntityBeSeenByMyTeam(caster) then
			dummy_ability.projectileTo = v
			break
		end
	end

	-- If we didnt find a new target then kill the dummy and end the function
	if dummy_ability.projectileTo == nil then
		killDummy(dummy, dummy)
	else
	-- Otherwise continue with creating a bounce projectile
		dummy_ability.bounceCount = dummy_ability.bounceCount + 1
		local info = {
        Target = dummy_ability.projectileTo,
        Source = dummy_ability.projectileFrom,
        EffectName = dummy_ability.particle_name,
        Ability = dummy_ability,
        bDodgeable = false,
        bProvidesVision = false,
        iMoveSpeed = dummy_ability.projectile_speed,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
    	}
    	ProjectileManager:CreateTrackingProjectile( info )

		dummy_ability.bounceTable[dummy_ability.projectileTo] = ((dummy_ability.bounceTable[dummy_ability.projectileTo] or 0) + 1)
    end
end

--[[Author: Pizzalol
	Date: 29.09.2015.
	Creates bounce projectiles to the nearest target if there is any]]
function shuriken_toss_bounce( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target

	-- Initialize the damage table
	local damage_table = {}
	damage_table.attacker = caster:GetOwner()
	damage_table.victim = target
	damage_table.ability = ability.original_ability
	damage_table.damage_type = DAMAGE_TYPE_MAGICAL
	damage_table.damage = ability.damage * (1 - ability.dmgMultiplier)

	ApplyDamage(damage_table)
	-- Save the new damage for future bounces
	ability.damage = damage_table.damage

	-- If we exceeded the bounce limit then remove the dummy and stop the function
	if ability.bounceCount >= ability.maxBounces then
		killDummy(caster,caster)
		return
	end

	-- Reset target data and find new targets
	ability.projectileFrom = ability.projectileTo
	ability.projectileTo = nil

	local iTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	local iType = DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO
	local iFlag = DOTA_UNIT_TARGET_FLAG_NONE
	local bounce_targets = FindUnitsInRadius(caster:GetTeamNumber(), target:GetAbsOrigin(), nil, ability.bounceRange, iTeam, iType, iFlag, FIND_CLOSEST, false)

	-- Find a new target that is not the current one
	for _,v in pairs(bounce_targets) do
		if v ~= target and ability.bounceTable[v] == nil and v:CanEntityBeSeenByMyTeam(damage_table.attacker) then
			ability.projectileTo = v
			break
		end
	end

	-- If we didnt find a new target then kill the dummy
	if ability.projectileTo == nil then
		killDummy(caster, caster)
	else
	-- Otherwise increase the bounce count and create a new bounce projectile
		ability.bounceCount = ability.bounceCount + 1
		local info = {
        Target = ability.projectileTo,
        Source = ability.projectileFrom,
        EffectName = ability.particle_name,
        Ability = ability,
        bDodgeable = false,
        bProvidesVision = false,
        iMoveSpeed = ability.projectile_speed,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
    	}
    	ProjectileManager:CreateTrackingProjectile( info )

		ability.bounceTable[ability.projectileTo] = ((ability.bounceTable[ability.projectileTo] or 0) + 1)
    end
end

function killDummy(caster, target)
	if caster:GetClassname() == "npc_dota_base_additive" then
		caster:RemoveSelf()
	elseif target:GetClassname() == "npc_dota_base_additive" then
		target:RemoveSelf()
	end
end