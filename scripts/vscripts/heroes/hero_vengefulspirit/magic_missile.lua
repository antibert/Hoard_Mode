function MagicMissile( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local damage = ability:GetAbilityDamage()
	local duration = ability:GetSpecialValueFor("magic_missile_stun")
	
	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_VengefulSpirit.MagicMissileImpact", target)
	target:AddNewModifier(caster, ability, "modifier_stunned", {duration = duration})
	ApplyDamage({victim = target, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
end
