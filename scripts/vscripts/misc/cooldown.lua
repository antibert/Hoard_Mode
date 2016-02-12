function ApplyModifierIfCooldownReady(keys)
	-- Variables
	local caster = keys.caster
	local ability = keys.ability
	local cooldown = ability:GetCooldown( ability:GetLevel() )
	local modifierName = keys.modifier
	local duration = keys.duration

	-- Remove cooldown
	if ability:IsCooldownReady() then
		ability:StartCooldown( cooldown )
		ability:ApplyDataDrivenModifier( caster, caster, modifierName, {Duration = duration} )
	end
end