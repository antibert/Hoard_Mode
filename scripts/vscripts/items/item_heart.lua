--[[ ============================================================================================================
	Author: Rook
	Date: January 28, 2015
	Called when the unit takes damage.  Puts the Heart(s) in the player's inventory on cooldown, with a duration
	dependant on whether the unit is melee or ranged.
	Additional parameters: keys.CooldownMelee
================================================================================================================= ]]
function modifier_item_heart_datadriven_regen_on_take_damage(keys)
	if keys.caster:IsRangedAttacker() then
		keys.ability:StartCooldown(keys.ability:GetCooldown(keys.ability:GetLevel()))
	else  --If the caster is melee.
		keys.ability:StartCooldown(keys.CooldownMelee)
	end
end


--[[ ============================================================================================================
	Author: Rook
	Date: January 28, 2015
	Called regularly while one or more Heart of Tarrasques are in the unit's inventory.  Heals them if the item is
	off cooldown, and displays an icon on the caster's modifier bar.
	Additional parameters: keys.HealthRegenPercentPerSecond and keys.HealInterval
================================================================================================================= ]]
function modifier_item_heart_datadriven_regen_on_interval_think(keys)
	if keys.ability:IsCooldownReady() and keys.caster:IsRealHero() then
		keys.caster:Heal(keys.caster:GetMaxHealth() * (keys.HealthRegenPercentPerSecond / 100) * keys.HealInterval, keys.caster)
	end
end