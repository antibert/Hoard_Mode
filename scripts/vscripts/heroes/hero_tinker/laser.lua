function LaserStart( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability

	EmitSoundOn("Hero_Tinker.Laser", caster)

	local projTable = {
		Target = target,
		Source = caster,
		Ability = ability,
		EffectName = "particles/units/heroes/hero_tinker/tinker_laser.vpcf",
		bDodgeable = true,
		bProvidesVision = false,
		iMoveSpeed = 1100, 
		vSpawnOrigin = target:GetAbsOrigin()
	}
	ProjectileManager:CreateTrackingProjectile( projTable )

	caster.linkensCheck = target:TriggerSpellAbsorb(ability)
end

function LaserHit( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local duration = ability:GetSpecialValueFor("duration")
	local damage = ability:GetAbilityDamage()

	if caster.linkensCheck then
		return
	end

	EmitSoundOn("Hero_Tinker.LaserImpact", target)

	ApplyDamage({victim = target, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
	ability:ApplyDataDrivenModifier(caster, target, "modifier_tinker_laser_datadriven_blind", {duration = duration})
	ability:ApplyDataDrivenModifier(caster, target, "modifier_tinker_laser_datadriven_tracking", {duration = 0.6})
end

function laser_bounce_start(keys)
	local caster = keys.caster
	caster.total_bounce = 0
end

function laser_bounce( keys )
	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local particleName = keys.particle
	local projectileSpeed = 1100
	local radius = ability:GetCastRange()
	local max_targets = keys.bounces
	local targetTeam = ability:GetAbilityTargetTeam()
	local targetType = ability:GetAbilityTargetType()
	local targetFlag = ability:GetAbilityTargetFlags()
	local projectileDodgable = true
	local projectileProvidesVision = false
	local has_scepter = caster:HasScepter()

	if caster.linkensCheck then
		return
	end

	if has_scepter then
		max_targets = keys.bounces_scepter
	end

	-- pick up x nearest target heroes and create tracking projectile targeting the number of targets
	local units = FindUnitsInRadius(
		caster:GetTeamNumber(), target:GetAbsOrigin(), nil, radius, targetTeam, targetType, targetFlag, FIND_CLOSEST, false
	)

	-- Seek out target
	for k, v in pairs( units ) do
		if caster.total_bounce >= max_targets then
			break
		end
		if caster:CanEntityBeSeenByMyTeam(v) and v:HasModifier(keys.modifier) == false then
			local projTable = {
				Target = v,
				Source = caster,
				Ability = ability,
				EffectName = particleName,
				bDodgeable = projectileDodgable,
				bProvidesVision = projectileProvidesVision,
				iMoveSpeed = projectileSpeed, 
				vSpawnOrigin = target:GetAbsOrigin()
			}
			ProjectileManager:CreateTrackingProjectile( projTable )
			caster.total_bounce = caster.total_bounce + 1
		end
	end
end
