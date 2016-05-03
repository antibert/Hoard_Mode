--[[Mana drain and damage part of Mana Break
	Author: Pizzalol
	Date: 11.07.2015.]]
function ManaBreak( keys )
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability
	local manaBurn = ability:GetLevelSpecialValueFor("mana_per_hit", (ability:GetLevel() - 1))
	local manaDamage = ability:GetLevelSpecialValueFor("damage_per_burn", (ability:GetLevel() - 1))
	local baseDamage = ability:GetLevelSpecialValueFor("damage_no_mana", (ability:GetLevel() - 1))
	local targetLocation = target:GetAbsOrigin()
	local radius = ability:GetSpecialValueFor("radius")

	local damageTable = {}
	damageTable.attacker = caster
	damageTable.victim = target
	damageTable.damage_type = ability:GetAbilityDamageType()
	damageTable.ability = ability

	-- If the target is not magic immune then reduce the mana and deal damage
	if not target:IsMagicImmune() then
		if(target:GetMana() > 0) then
			damageTable.damage = manaBurn * manaDamage
		else
			damageTable.damage = manaBurn * manaDamage * baseDamage
		end
		target:ReduceMana(manaBurn)

		-- Finds all the enemies in a radius around the target and then deals damage to each of them
		local unitsToDamage = FindUnitsInRadius(caster:GetTeam(), targetLocation, nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), DOTA_UNIT_TARGET_FLAG_NONE, 0, false)

		for _,v in ipairs(unitsToDamage) do
			damageTable.victim = v
			ApplyDamage(damageTable)
		end
	end
end