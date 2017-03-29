function CripplingFear( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target

	local modifier_day = keys.modifier_day
	local modifier_night = keys.modifier_night
	local radius = ability:GetSpecialValueFor("radius")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_Nightstalker.Trickling_Fear", target)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		if GameRules:IsDaytime() then
			ability:ApplyDataDrivenModifier(caster, unit, modifier_day, {})
		else
			ability:ApplyDataDrivenModifier(caster, unit, modifier_night, {})
		end

	end
end