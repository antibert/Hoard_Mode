
--[[ ============================================================================================================
	Author: Rook
	Date: February 4, 2015
	Called when the unit lands an attack on a target.  Applies the modifier so long as the target is not a structure.
	Additional parameters: keys.ColdDurationMelee and keys.ColdDurationRanged
================================================================================================================= ]]
function modifier_item_skadi_datadriven_impactFX(keys)
    local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
    
	local radius = ability:GetLevelSpecialValueFor("cold_radius", ability_level)
    
    target.impactFX = ParticleManager:CreateParticle("particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_frost_explosion.vpcf", PATTACH_POINT_FOLLOW, target)
    ParticleManager:SetParticleControl(target.impactFX, 0, Vector(radius, 2, radius*2))
    
    ParticleManager:SetParticleControlEnt(target.impactFX, 3, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
	
	ParticleManager:ReleaseParticleIndex(target.impactFX)
end

function modifier_item_skadi_datadriven_on_orb_impact(keys)
	if keys.target.GetInvulnCount == nil then
		if keys.caster:IsRangedAttacker() then
			keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_skadi_datadriven_cold_attack", {duration = keys.ColdDurationRanged})
		else  --The caster is melee.
			keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, "modifier_item_skadi_datadriven_cold_attack", {duration = keys.ColdDurationMelee})
		end
	end
end