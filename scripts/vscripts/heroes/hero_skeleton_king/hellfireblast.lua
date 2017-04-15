function HellFireBlast( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local damage = ability:GetAbilityDamage()
	local radius = ability:GetSpecialValueFor("bolt_aoe")
	local stunDuration = ability:GetSpecialValueFor("blast_stun_duration")
	local damage = ability:GetAbilityDamage()

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_SkeletonKing.Hellfire_BlastImpact", caster)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ApplyDamage({victim = unit, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
		ability:ApplyDataDrivenModifier(caster, unit, "modifier_hellfire_blast_stun", {})
		ability:ApplyDataDrivenModifier(caster, unit, "modifier_hellfire_blast_slow", {})
		Timers:CreateTimer(stunDuration, function()
			if not unit or unit:IsNull() then return end
			if not unit:IsAlive() then return end
			ability:ApplyDataDrivenModifier(caster, unit, "modifier_hellfire_blast_dot", {})
		end)
	end
end
