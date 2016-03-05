--[[Author: Pizzalol
	Date: 06.01.2015.
	Deals damage depending on missing hp
	If the target dies then it increases the respawn time]]
function ReapersScythe( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local target_missing_hp = target:GetMaxHealth() - target:GetHealth()
	local damage_per_health = ability:GetLevelSpecialValueFor("damage_per_health", (ability:GetLevel() - 1))
	local damage_per_health_scepter = ability:GetLevelSpecialValueFor("damage_per_health_scepter", (ability:GetLevel() - 1))
	local respawn_time = ability:GetLevelSpecialValueFor("respawn_constant", (ability:GetLevel() - 1))
	local max_damage = ability:GetLevelSpecialValueFor("max_damage", (ability:GetLevel() - 1))
	local max_damage_scepter = ability:GetLevelSpecialValueFor("max_damage_scepter", (ability:GetLevel() - 1))
	local has_scepter = caster:HasScepter()

	if has_scepter then
		damage_per_health = damage_per_health_scepter
		max_damage = max_damage_scepter
	end

	local damage_table = {}

	damage_table.attacker = caster
	damage_table.victim = target
	damage_table.ability = ability
	damage_table.damage_type = ability:GetAbilityDamageType()
	damage_table.damage = math.min(target_missing_hp * damage_per_health, max_damage)

	ApplyDamage(damage_table)

	-- Checking if target is alive to decide if it needs to increase respawn time
	if not target:IsAlive() and target:IsHero() then
		target:SetTimeUntilRespawn(target:GetRespawnTime() + respawn_time)
	end
end