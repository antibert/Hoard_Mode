function OpenWounds( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local duration = ability:GetSpecialValueFor("duration")
	local radius = ability:GetSpecialValueFor("radius")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_LifeStealer.OpenWounds.Cast", target)
	EmitSoundOn("Hero_LifeStealer.OpenWounds", target)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ability:ApplyDataDrivenModifier(caster, unit, "modifier_open_wounds", {duration = duration})
		ability:ApplyDataDrivenModifier(caster, unit, "modifier_wounds_damage_datadriven", {duration = duration})
	end
end