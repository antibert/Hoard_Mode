function AssassinateCast( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local modifier_shrapnel = keys.modifier_shrapnel
	local modifier_target = keys.modifier_target
	local modifier_caster = keys.modifier_caster
	local modifier_cast_check = keys.modifier_cast_check

	-- Parameters
	local regular_range = ability:GetLevelSpecialValueFor("regular_range", ability_level)
	local cast_distance = ( target:GetAbsOrigin() - caster:GetAbsOrigin() ):Length2D()

	-- Check if the target can be assassinated, if not, stop casting and move closer
	if cast_distance > regular_range and not target:HasModifier(modifier_shrapnel) then

		-- Start moving
		caster:MoveToPosition(target:GetAbsOrigin())
		Timers:CreateTimer(0.1, function()

			-- Update distance between caster and target
			cast_distance = ( target:GetAbsOrigin() - caster:GetAbsOrigin() ):Length2D()

			-- If it's not a legal cast situation and no other order was given, keep moving
			if cast_distance > regular_range and not target:HasModifier(modifier_shrapnel) and not caster.stop_assassinate_cast then
				return 0.1

			-- If another order was given, stop tracking the cast distance
			elseif caster.stop_assassinate_cast then
				caster:RemoveModifierByName(modifier_cast_check)
				caster.stop_assassinate_cast = nil

			-- If all conditions are met, cast Assassinate again
			else
				caster:CastAbilityOnTarget(target, ability, caster:GetPlayerID())
			end
		end)
		return nil
	end

	-- Play the pre-cast sound
	caster:EmitSound("Ability.AssassinateLoad")

	-- Mark the target with the crosshair
	ability:ApplyDataDrivenModifier(caster, target, modifier_target, {})

	-- Apply the caster modifiers
	ability:ApplyDataDrivenModifier(caster, caster, modifier_caster, {})
	caster:RemoveModifierByName(modifier_cast_check)

	-- Memorize the target
	caster.assassinate_target = target
end

function AssassinateCastCheck( keys )
	local caster = keys.caster
	caster.stop_assassinate_cast = true
end

function AssassinateStop( keys )
	local caster = keys.caster
	local target_modifier = keys.target_modifier
	caster.assassinate_target:RemoveModifierByName(target_modifier)
	caster.assassinate_target = nil
end

function AssassinateParticleStart( keys )
	local caster = keys.caster
	local target = keys.target
	local particle_debuff = keys.particle_debuff
	
	-- Create the crosshair particle
	target.assassinate_crosshair_pfx = ParticleManager:CreateParticleForTeam(particle_debuff, PATTACH_OVERHEAD_FOLLOW, target, caster:GetTeam())
	ParticleManager:SetParticleControl(target.assassinate_crosshair_pfx, 0, target:GetAbsOrigin())
end

function AssassinateParticleEnd( keys )
	local target = keys.target
	
	-- Destroy the crosshair particle
	ParticleManager:DestroyParticle(target.assassinate_crosshair_pfx, true)
	ParticleManager:ReleaseParticleIndex(target.assassinate_crosshair_pfx)
	target.assassinate_crosshair_pfx = nil
end

function Assassinate( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1

	-- Parameters
	local bullet_duration = ability:GetLevelSpecialValueFor("projectile_travel_time", ability_level)
	local spill_range = ability:GetLevelSpecialValueFor("spill_range", ability_level)
	local bullet_radius = ability:GetLevelSpecialValueFor("aoe_size", ability_level)
	local bullet_direction = ( target:GetAbsOrigin() - caster:GetAbsOrigin() ):Normalized()
	bullet_direction = Vector(bullet_direction.x, bullet_direction.y, 0)
	local bullet_distance = ( target:GetAbsOrigin() - caster:GetAbsOrigin() ):Length2D() + spill_range
	local bullet_speed = bullet_distance / bullet_duration

	-- Create the real, invisible projectile
	local assassinate_projectile = {
		Ability				= ability,
		EffectName			= "",
		vSpawnOrigin		= caster:GetAbsOrigin(),
		fDistance			= bullet_distance,
		fStartRadius		= bullet_radius,
		fEndRadius			= bullet_radius,
		Source				= caster,
		bHasFrontalCone		= false,
		bReplaceExisting	= false,
		iUnitTargetTeam		= DOTA_UNIT_TARGET_TEAM_ENEMY,
		iUnitTargetFlags	= DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		iUnitTargetType		= DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
	--	fExpireTime			= ,
		bDeleteOnHit		= false,
		vVelocity			= bullet_direction * bullet_speed,
		bProvidesVision		= false,
	--	iVisionRadius		= ,
	--	iVisionTeamNumber	= caster:GetTeamNumber(),
	}

	ProjectileManager:CreateLinearProjectile(assassinate_projectile)

	-- Create the fake, visible projectile
	assassinate_projectile = {
		Target = target,
		Source = caster,
		Ability = nil,	
		EffectName = "particles/units/heroes/hero_sniper/sniper_assassinate.vpcf",
		vSpawnOrigin = caster:GetAbsOrigin(),
		bHasFrontalCone = false,
		bReplaceExisting = false,
		iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
		iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		bDeleteOnHit = true,
		iMoveSpeed = bullet_speed,
		bProvidesVision = false,
		bDodgeable = true,
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
	}

	ProjectileManager:CreateTrackingProjectile(assassinate_projectile)
end

function AssassinateHit( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local scepter = HasScepter(caster)
	local modifier_slow = keys.modifier_slow

	-- Parameters
	local damage = ability:GetLevelSpecialValueFor("damage", ability_level)

	-- Play sound
	target:EmitSound("Hero_Sniper.AssassinateDamage")

	-- If the target possesses a ready Linken's Sphere, do nothing
	if target:GetTeam() ~= caster:GetTeam() then
		if target:TriggerSpellAbsorb(ability) then
			return nil
		end
	end
	
	-- Scepter damage and debuff
	if scepter then

		-- Scepter parameters
		damage = ability:GetLevelSpecialValueFor("damage_scepter", ability_level)
		local knockback_speed = ability:GetLevelSpecialValueFor("knockback_speed_scepter", ability_level)
		local knockback_distance = ability:GetLevelSpecialValueFor("knockback_dist_scepter", ability_level)
		local caster_pos = caster:GetAbsOrigin()
        
	end

	-- Apply damage
	ApplyDamage({attacker = caster, victim = target, ability = ability, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL})

	-- Grant short-lived vision
	ability:CreateVisibilityNode(target:GetAbsOrigin(), 500, 1.0)

	-- Ministun
	target:AddNewModifier(caster, ability, "modifier_stunned", {duration = 0.03})

	-- Fire particle
	local hit_fx = ParticleManager:CreateParticle("particles/econ/items/gyrocopter/hero_gyrocopter_gyrotechnics/gyro_guided_missile_death.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
	ParticleManager:SetParticleControl(hit_fx, 0, target:GetAbsOrigin() )
end



function ProcHeadshot(keys)
    local caster = keys.caster
    local ability_index_1 = caster:GetAbilityByIndex(1)

    if ability_index_1 ~= nil then 
        if ability_index_1:GetAbilityName() == "sniper_headshot" then
            
            ability_index_1:CastAbility()
            
        end
    end
end