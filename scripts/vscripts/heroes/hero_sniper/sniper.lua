--[[ Author: Hewdraw ]]

function AssinateProjectile( keys )
	local caster = keys.caster
	local ability = keys.ability
	local projectile = keys.projectile

	caster:SetRangedProjectileName(projectile)
end

function AssassinateThink( keys )
	print("test")
	local caster = keys.caster
	local ability = keys.ability
	local modifier = "modifier_horde_sniper_assassinate_range_dummy"
	caster:RemoveModifierByName(modifier)
	local range = ability:GetLevelSpecialValueFor("range", ability:GetLevel() - 1)
	local caster_range = range - caster:GetAttackRange()
	ability:ApplyDataDrivenModifier(caster, caster, modifier, {})

	local stack_count = caster:GetModifierStackCount(modifier, ability)

	caster:SetModifierStackCount(modifier, caster, caster_range)
end

function AssassinateHit( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local mana_cost = ability:GetLevelSpecialValueFor("mana_cost", ability:GetLevel() - 1)

	if caster:GetMana() < mana_cost then
		ability:ToggleAbility()
	else
		local radius = ability:GetLevelSpecialValueFor("radius", ability:GetLevel() - 1)

		local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_DAMAGE_FLAG_NONE, FIND_ANY_ORDER, false)

		for _,unit in pairs(units) do
			if unit ~= target then
				caster:PerformAttack(unit, true, false, true, false)
			end
		end

		caster:SpendMana(mana_cost, caster)
	end
end