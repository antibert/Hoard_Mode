function StiflingDagger( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local radius = ability:GetSpecialValueFor("radius")
	local damage = ability:GetSpecialValueFor("base_damage")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	ability:ApplyDataDrivenModifier(caster, caster, "modifier_stifling_dagger_attack_datadriven", {})

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ApplyDamage({victim = unit, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
		ability:ApplyDataDrivenModifier(caster, unit, "modifier_stifling_dagger_slow_datadriven", {})
	end

	caster:PerformAttack(target, true, true, true, false, false, false, true)
end