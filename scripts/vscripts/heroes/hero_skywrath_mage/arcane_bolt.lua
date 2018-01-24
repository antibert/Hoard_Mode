--[[
	CHANGELIST:
	09.01.2015 - Standized variables
]]

--[[
	Author: kritth
	Date: 09.01.2015
	Calculating the damage for arcane bolt
]]
function ArcaneBolt( keys )
	-- Variables
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius = ability:GetLevelSpecialValueFor( "bolt_vision", ability:GetLevel() - 1 )
	local duration = ability:GetLevelSpecialValueFor( "vision_duration", ability:GetLevel() - 1 )
	local base_damage = ability:GetLevelSpecialValueFor( "bolt_damage", ability:GetLevel() - 1 )
	local multiplier = ability:GetLevelSpecialValueFor( "int_multiplier", ability:GetLevel() - 1 )
	local intelligence = keys.caster:GetIntellect()
	local damageType = ability:GetAbilityDamageType() -- DAMAGE_TYPE_MAGICAL
	local has_scepter = caster:HasScepter()

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_SkywrathMage.ArcaneBolt.Impact", target)

	if has_scepter then
		local searchRadius = ability:GetSpecialValueFor("scepter_radius")
		local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, searchRadius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
		for _,unit in pairs(units) do
			-- Deal damage
			local damageTable = {
				victim = unit,
				attacker = caster,
				damage = base_damage + intelligence * multiplier,
				damage_type = damageType,
				ability = ability
			}
			ApplyDamage( damageTable )
			
			-- Provide visibility
			ability:CreateVisibilityNode( unit:GetAbsOrigin(), radius, duration )
		end
	else
		local damageTable = {
				victim = target,
				attacker = caster,
				damage = base_damage + intelligence * multiplier,
				damage_type = damageType,
				ability = ability
			}
		ApplyDamage( damageTable )
	end
end
