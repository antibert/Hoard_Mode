--[[
	CHANGELIST:
	09.01.2015 - Standized variables
]]

--[[
	Author: kritth
	Date: 09.01.2015
	Calculating the damage for arcane bolt
]]
function arcane_bolt_hit( keys )
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
	
	-- Deal damage
	local damageTable = {
		victim = target,
		attacker = caster,
		damage = base_damage + intelligence * multiplier,
		damage_type = damageType,
		ability = ability
	}
	ApplyDamage( damageTable )
	
	-- Provide visibility
	ability:CreateVisibilityNode( target:GetAbsOrigin(), radius, duration )
end
