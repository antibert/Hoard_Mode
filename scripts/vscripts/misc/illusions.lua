function GrantModifierToRealHero(keys)
	-- Variables
	local caster = keys.caster
	local ability = keys.ability
	local modifierName = keys.modifier

	-- Remove cooldown
	if caster:IsRealHero() then
		ability:ApplyDataDrivenModifier( caster, caster, modifierName, {} )
	end
end