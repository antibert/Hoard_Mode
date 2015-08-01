--[[ Author: Hewdraw ]]

function EtherealBladeHit( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability

	local duration = 0
	local damage = 0
	local radius = ability:GetLevelSpecialValueFor("radius", ability:GetLevel() - 1)

	if target:GetTeam() == caster:GetTeam() then
		duration = ability:GetLevelSpecialValueFor("duration_ally", ability:GetLevel() - 1)
	else
		duration = ability:GetLevelSpecialValueFor("duration", ability:GetLevel() - 1)

		local base_damage = ability:GetLevelSpecialValueFor("blast_damage_base", ability:GetLevel() - 1)
		local agility_modifier = ability:GetLevelSpecialValueFor("blast_agility_modifier", ability:GetLevel() - 1)
		damage = base_damage + agility_modifier * caster:GetAgility()
	end

	local units = FindUnitsInRadius(target:GetTeam(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

	for _,unit in pairs(units) do
		ability:ApplyDataDrivenModifier(caster, unit, "modifier_item_ethereal_blade_active", {duration = duration})

		if target:GetTeam() ~= caster:GetTeam() then
			ApplyDamage({victim = unit, attacker = caster, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL,})
			ability:ApplyDataDrivenModifier(caster, unit, "modifier_item_ethereal_blade_slow", {duration = duration})
		end
	end
end