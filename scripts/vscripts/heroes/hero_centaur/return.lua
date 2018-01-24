function Return( keys )
	local caster = keys.caster
	local attacker = keys.attacker
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
    local building_reduction_leftover = keys.building_reduction
    
	-- Break applied
	if ability_level < 0 or caster:GetTeamNumber() == attacker:GetTeamNumber() then
		return nil
	end

	local hTalent = caster:FindAbilityByName( "special_bonus_unique_centaur_1" )
	if hTalent and hTalent:GetLevel() > 0 then
		target = caster
	end

	if target ~= caster then
		return nil
	end

	local flat_damage = ability:GetLevelSpecialValueFor("return_damage", ability_level)
	local str_percentage = ability:GetLevelSpecialValueFor("strength_pct", ability_level)

	if caster:HasAbility("special_bonus_unique_centaur_3") then
		local talent = caster:FindAbilityByName("special_bonus_unique_centaur_3")
		if talent:GetLevel()>0 then
			str_percentage = str_percentage + talent:GetSpecialValueFor("value")
		end
	end

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