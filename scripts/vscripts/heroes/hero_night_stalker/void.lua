function Void( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local modifier = keys.modifier

	local duration_day = ability:GetSpecialValueFor("duration_day")
	local duration_night = ability:GetSpecialValueFor("duration_night")
	local damage = ability:GetAbilityDamage()
	local radius = ability:GetSpecialValueFor("radius")
	local stunDuration = ability:GetSpecialValueFor("mini_stun")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_Nightstalker.Void", target)
	
	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		print(modifier)
		if GameRules:IsDaytime() then
			ability:ApplyDataDrivenModifier(caster, unit, modifier, {duration = duration_day})
		else
			ability:ApplyDataDrivenModifier(caster, unit, modifier, {duration = duration_night})
			unit:AddNewModifier(caster, ability, "modifier_stunned", {duration = stunDuration})
		end
		ApplyDamage({victim = unit, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
	end
end