function GrantModifierToRealHero(keys)
	-- Variables
	local caster = keys.caster
	local ability = keys.ability
	local modifierName = keys.modifier

	-- Remove cooldown
	if caster ~= nil and ability ~= nil and modifierName ~= nil and caster:IsRealHero() then
		ability:ApplyDataDrivenModifier( caster, caster, modifierName, {} )
	end
end