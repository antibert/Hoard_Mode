function Return( keys )
	local caster = keys.caster
	local attacker = keys.attacker
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
    local building_reduction_leftover = 100-keys.building_reduction
    
	-- Break applied
	if ability_level < 0 then
		return nil
	end

	local str_percentage = ability:GetLevelSpecialValueFor("strength_pct", ability_level)
    local flat_damage = ability:GetLevelSpecialValueFor("return_damage", ability_level)

	local caster_str = caster:GetStrength()
	local damage = flat_damage+((caster_str/100)*str_percentage)

    if not attacker:IsBuilding() then
        ApplyDamage({victim = attacker, attacker = caster, damage = damage, damage_type = DAMAGE_TYPE_PHYSICAL })
    else
        ApplyDamage({victim = attacker, attacker = caster, damage = (damage/100)*building_reduction_leftover, damage_type = DAMAGE_TYPE_PHYSICAL })
    end

    local return_pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_return.vpcf", PATTACH_ABSORIGIN, caster)
    ParticleManager:SetParticleControlEnt(return_pfx, 0, caster, PATTACH_POINT_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(return_pfx, 1, attacker, PATTACH_POINT_FOLLOW, "attach_hitloc", attacker:GetAbsOrigin(), true)
end	