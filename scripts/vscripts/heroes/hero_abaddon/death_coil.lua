function DeathCoil( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local damage = ability:GetSpecialValueFor("target_damage")
	local heal = ability:GetSpecialValueFor("heal_amount")
	local radius = ability:GetSpecialValueFor("radius")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end
	
	EmitSoundOn("Hero_Abaddon.DeathCoil.Target", target)
	
	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		if unit ~= caster then
			if unit:GetTeam() == target:GetTeam() then
				if unit:GetTeam() == caster:GetTeam() then
					unit:Heal(heal, caster)
				else	
					ApplyDamage({victim = unit, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
				end
			end
		end
	end
end
