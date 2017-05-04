function ShadowStrike( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local slowStacks = ability:GetSpecialValueFor("slow_stacks")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	ability:ApplyDataDrivenModifier(caster, target, "modifier_shadow_strike_debuff_datadriven", {})
	ability:ApplyDataDrivenModifier(caster, target, "modifier_shadow_strike_thinker_datadriven", {})

	local i = 0
	while i < slowStacks do
		i=i+1
		ability:ApplyDataDrivenModifier(caster, target, "modifier_shadow_strike_slow_datadriven", {})
	end
end
