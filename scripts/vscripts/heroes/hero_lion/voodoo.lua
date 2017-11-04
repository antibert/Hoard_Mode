function Voodoo( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius = ability:GetSpecialValueFor("radius")
	local duration = ability:GetSpecialValueFor("duration")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	if caster:HasAbility("special_bonus_unique_lion_4") then
		local talent = caster:FindAbilityByName("special_bonus_unique_lion_4")
		if talent:GetLevel()>0 then
			radius = radius + talent:GetSpecialValueFor("value")
		end
	end

	EmitSoundOn("Hero_Lion.Voodoo", target)
	EmitSoundOn("Hero_Lion.Hex.Target", target)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		unit:AddNewModifier(caster, ability, "modifier_lion_voodoo", {duration = duration})
		local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_lion/lion_spell_voodoo.vpcf", PATTACH_ABSORIGIN_FOLLOW, unit)
	end
end