-- need to test particles
function BrainSap( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local dmgHeal = ability:GetAbilityDamage()
	local radius = ability:GetSpecialValueFor("radius")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_Bane.BrainSap.Target", target)
	EmitSoundOn("Hero_Bane.BrainSap", caster)
	
	local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_bane/bane_sap.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
	ParticleManager:SetParticleControlEnt(particle, 1, caster, PATTACH_POINT_FOLLOW, nil, caster:GetAbsOrigin(), true)
	ParticleManager:SetParticleControlEnt(particle, 2, target, PATTACH_POINT_FOLLOW, nil, target:GetAbsOrigin(), true)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ApplyDamage({victim = unit, attacker = caster, ability = ability, damage = dmgHeal, damage_type = ability:GetAbilityDamageType()})
	end
	caster:Heal(dmgHeal, caster)
end