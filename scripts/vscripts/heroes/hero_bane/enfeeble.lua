function StealDamage( keys )
	local caster = keys.caster
	local ability = keys.ability

	if caster:HasAbility("special_bonus_unique_bane_4") then
		local talent = caster:FindAbilityByName("special_bonus_unique_bane_4")
		if talent:GetLevel()>0 then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_enfeeble_buff_datadriven", {})
		end
	end
end