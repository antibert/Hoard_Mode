function SpawnSpiderlings( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local damage = ability:GetSpecialValueFor("damage")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_Broodmother.SpawnSpiderlingsImpact", target)

	ability:ApplyDataDrivenModifier(caster, target, "modifier_spawn_spiderlings_datadriven", {})
	ApplyDamage({victim = target, attacker = caster, ability = ability, damage = damage, damage_type = ability:GetAbilityDamageType()})
end