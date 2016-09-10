--[[Author: YOLOSPAGHETTI
	Date: February 17, 2016
	Applies the damage to the target]]
function ApplyDPS(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	
	local health_percent = ability:GetLevelSpecialValueFor("damage_percent", ability:GetLevel() -1)/100
	local max_damage = ability:GetLevelSpecialValueFor("max_damage", ability:GetLevel() -1)
	local health = target:GetMaxHealth()

	local damage = health * health_percent

	if (damage > max_damage) then
		damage = max_damage
	end
	
	ApplyDamage({victim = target, attacker = caster, damage = damage, damage_type = ability:GetAbilityDamageType()})
end
