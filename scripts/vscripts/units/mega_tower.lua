function PercentDamage( keys )
	local caster = keys.attacker
	local target = keys.target
	local ability = keys.ability
	local hp_percent = keys.hp_percent
	local targetLocation = target:GetAbsOrigin()
	local radius = keys.radius

	if not target:IsMagicImmune() then

		local damage = target:GetHealth() * (hp_percent / 100)

		local unitsToDamage = FindUnitsInRadius(caster:GetTeam(), targetLocation, nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), DOTA_UNIT_TARGET_FLAG_NONE, 0, false)
		for _,v in ipairs(unitsToDamage) do
			damageTable.victim = v
			ApplyDamage(damageTable)
		end

		-- Deal damage
		local damageTable = {
			victim = target,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = ability
		}
		ApplyDamage( damageTable )
	end
end