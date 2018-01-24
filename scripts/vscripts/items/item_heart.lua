--[[ ============================================================================================================
	Author: Rook
	Date: January 28, 2015
	Called when the unit takes damage.  Puts the Heart(s) in the player's inventory on cooldown, with a duration
	dependant on whether the unit is melee or ranged.
	Additional parameters: keys.CooldownMelee keys.DisableModifier
================================================================================================================= ]]
function modifier_item_heart_datadriven_regen_on_take_damage(keys)
	local cooldown = keys.CooldownMelee
	local modifier = keys.MeleeDisableModifier
	if keys.caster:IsRangedAttacker() then
		modifier = keys.RangedDisableModifier
		cooldown = keys.ability:GetCooldown(keys.ability:GetLevel())
	end

	keys.ability:StartCooldown(cooldown)
	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, modifier, {duration = cooldown})
end
