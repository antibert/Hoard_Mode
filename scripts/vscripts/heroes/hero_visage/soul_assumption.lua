function SoulAssumption( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target

	local damage = ability:GetAbilityDamage()
	local radius = ability:GetSpecialValueFor("radius")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end
	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ApplyDamage({victim = unit, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
		--local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_visage/visage_soul_assumption_beam.vpcf", follow_origin, caster)
	end
end