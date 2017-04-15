function StormBolt( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local radius = ability:GetSpecialValueFor("radius")
	local damage = ability:GetAbilityDamage()

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_Sven.StormBoltImpact", target)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ApplyDamage({victim = unit, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
		ability:ApplyDataDrivenModifier(caster, target, "modifier_storm_bolt_datadriven", {})
	end
end