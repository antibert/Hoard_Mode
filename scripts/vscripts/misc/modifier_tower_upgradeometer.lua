function upgradeometer_init( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.attacker
	local modifier_stack = keys.modifier_stack

	caster:SetModifierStackCount(modifier_stack, ability, 1)
end