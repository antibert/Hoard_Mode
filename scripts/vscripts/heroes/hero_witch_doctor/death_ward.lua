--[[Author: YOLOSPAGHETTI
	Date: March 15, 2016
	Creates the death ward]]
function CreateWard(keys)
	local caster = keys.caster
	local ability = keys.ability
	local position = ability:GetCursorPosition()
	
	-- Creates the death ward (There is no way to control the default ward, so this is a custom one)
	caster.death_ward = CreateUnitByName("witch_doctor_death_ward_datadriven", position, true, caster, nil, caster:GetTeam())
	caster.death_ward:SetControllableByPlayer(caster:GetPlayerID(), true)
	caster.death_ward:SetOwner(caster)
	
	-- Applies the modifier (gives it damage, removes health bar, and makes it invulnerable)
	ability:ApplyDataDrivenModifier( caster, caster.death_ward, "modifier_death_ward_datadriven", {} )
end

--[[Author: YOLOSPAGHETTI
	Date: March 15, 2016
	Removes the death ward entity from the game and stops its sound]]
function DestroyWard(keys)
	local caster = keys.caster
	
	UTIL_Remove(caster.death_ward)
	StopSoundEvent(keys.sound, caster)
end

function death_ward_start_create_dummy( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1

	-- Create the dummy unit which keeps track of bounces
	local dummy = CreateUnitByName( "npc_dummy_blank", target:GetAbsOrigin(), false, caster, caster, caster:GetTeamNumber() )
	dummy:AddAbility("witch_doctor_death_ward_dummy_datadriven")
	local dummy_ability =  dummy:FindAbilityByName("witch_doctor_death_ward_dummy_datadriven")
	dummy_ability:ApplyDataDrivenModifier( caster, dummy, "modifier_death_ward_dummy_unit", {} )

	-- Ability variables
	dummy_ability.damage = ability:GetLevelSpecialValueFor("damage", ability_level)
	dummy_ability.bounceTable = {}
	dummy_ability.bounceCount = 0
	dummy_ability.maxBounces = ability:GetLevelSpecialValueFor("bounces", ability_level)
	dummy_ability.bounceRange = ability:GetLevelSpecialValueFor("bounce_radius", ability_level)
	dummy_ability.dmgMultiplier = ability:GetLevelSpecialValueFor("damage_reduction_percent", ability_level) / 100
	dummy_ability.original_ability = ability

	if caster:HasScepter() then
		dummy_ability.maxBounces = ability:GetLevelSpecialValueFor("bounces_scepter", ability_level)
	end

	if caster:HasAbility("special_bonus_unique_witch_doctor_1") then
		local talent = caster:FindAbilityByName("special_bonus_unique_witch_doctor_1")
		if talent:GetLevel()>0 then
			dummy_ability.bounceRange = dummy_ability.bounceRange + talent:GetSpecialValueFor("value")
		end
	end

	if caster:HasAbility("special_bonus_unique_witch_doctor_5") then
		local talent = caster:FindAbilityByName("special_bonus_unique_witch_doctor_5")
		if talent:GetLevel()>0 then
			dummy_ability.damage = dummy_ability.damage + talent:GetSpecialValueFor("value")
		end
	end

	dummy_ability.particle_name = "particles/units/heroes/hero_witchdoctor/witchdoctor_ward_attack.vpcf"
	dummy_ability.projectile_speed = 1000
	dummy_ability.projectileFrom = target
	dummy_ability.projectileTo = nil

	-- Find the closest target that fits the search criteria
	local iTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
	local iType = DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO
	local iFlag = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
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
function death_ward_bounce( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target

	-- Initialize the damage table
	local damage_table = {}
	damage_table.attacker = caster:GetOwner()
	damage_table.victim = target
	damage_table.ability = ability.original_ability
	damage_table.damage_type = DAMAGE_TYPE_PHYSICAL
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
	local iFlag = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
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