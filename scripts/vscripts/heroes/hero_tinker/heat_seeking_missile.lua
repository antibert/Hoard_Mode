function heat_seeking_missile_seek_targets( keys )
	-- Variables
	local caster = keys.caster
	local ability = keys.ability
	local particleName = "particles/units/heroes/hero_tinker/tinker_missile.vpcf"
	local modifierDudName = "modifier_heat_seeking_missile_dud"
	local projectileSpeed = 900
	local radius = ability:GetLevelSpecialValueFor( "radius", ability:GetLevel() - 1 )
	local max_targets = ability:GetLevelSpecialValueFor( "targets", ability:GetLevel() - 1 )
	local targetTeam = ability:GetAbilityTargetTeam()
	local targetType = ability:GetAbilityTargetType()
	local targetFlag = ability:GetAbilityTargetFlags()
	local projectileDodgable = false
	local projectileProvidesVision = false
	local has_scepter = caster:HasScepter()

	if has_scepter then
		max_targets = ability:GetLevelSpecialValueFor("targets_scepter", ability:GetLevel() - 1)
	end

	-- pick up x nearest target heroes and create tracking projectile targeting the number of targets
	local units = FindUnitsInRadius(
		caster:GetTeamNumber(), caster:GetAbsOrigin(), nil, radius, targetTeam, targetType, targetFlag, FIND_CLOSEST, false
	)
	
	-- Seek out target
	local count = 0
	for k, v in pairs( units ) do
		if count >= max_targets then
			break
		end
		if caster:CanEntityBeSeenByMyTeam(v) then
			local projTable = {
				Target = v,
				Source = caster,
				Ability = ability,
				EffectName = particleName,
				bDodgeable = projectileDodgable,
				bProvidesVision = projectileProvidesVision,
				iMoveSpeed = projectileSpeed, 
				vSpawnOrigin = caster:GetAbsOrigin()
			}
			ProjectileManager:CreateTrackingProjectile( projTable )
			count = count + 1
		end
	end
	
	-- If no unit is found, fire dud
	if count == 0 then
		ability:ApplyDataDrivenModifier( caster, caster, modifierDudName, {} )
	end
end