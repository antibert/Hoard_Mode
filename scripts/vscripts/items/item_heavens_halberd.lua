LinkLuaModifier("modifier_item_disarm_lua", "items/modifiers/modifier_item_disarm_lua.lua", LUA_MODIFIER_MOTION_NONE)

--[[ ============================================================================================================
	Author: Rook
	Date: February 4, 2015
	Called when the unit lands an attack on a target and the chance to Lesser Maim is successful.  Applies the
	modifier so long as the target is not a structure.
================================================================================================================= ]]
function modifier_item_heavens_halberd_datadriven_on_attack_landed_random_on_success(keys)
    local target = keys.target
	local caster = keys.caster
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
    
    local slow_duration = ability:GetLevelSpecialValueFor("maim_duration", ability_level)
    
	if target.GetInvulnCount == nil then  --If the target is not a structure.
		target:EmitSound("DOTA_Item.Maim")
        if caster:IsRangedAttacker() then
            keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.target, "modifier_item_heavens_halberd_datadriven_lesser_maim_ranged", {duration = slow_duration})
        else
            keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.target, "modifier_item_heavens_halberd_datadriven_lesser_maim_melee", {duration = slow_duration})
        end
		
	end
end

--[[ ============================================================================================================
	Author: Rook
	Date: February 4, 2015
	Called when Heaven's Halberd is cast on an enemy unit.  Applies a disarm with a duration dependant on whether the
	target is melee or ranged.
	Additional parameters: keys.DisarmDurationRanged and keys.DisarmDurationMelee
================================================================================================================= ]]
function item_heavens_halberd_datadriven_on_spell_start(keys)
    local target = keys.target
	local caster = keys.caster
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
    local duration_melee = ability:GetLevelSpecialValueFor("disarm_melee", ability_level)
    local duration_range = ability:GetLevelSpecialValueFor("disarm_range", ability_level)
    local radius = ability:GetLevelSpecialValueFor("radius", ability_level)
	
    local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
    
    for _,unit in pairs(units) do
        if unit:IsAlive() then            
            if unit:IsRangedAttacker() then
                unit:AddNewModifier(caster, ability, "modifier_item_disarm_lua", {duration = duration_range})
                
                local particle = ParticleManager:CreateParticle("particles/items2_fx/heavens_halberd.vpcf",  PATTACH_ABSORIGIN_FOLLOW, unit)
                Timers:CreateTimer(duration_range, function()
                ParticleManager:DestroyParticle(particle, false)
                end)
            else
                unit:AddNewModifier(caster, ability, "modifier_item_disarm_lua", {duration = duration_melee})
                
                local particle = ParticleManager:CreateParticle("particles/items2_fx/heavens_halberd.vpcf",  PATTACH_ABSORIGIN_FOLLOW, unit)
                Timers:CreateTimer(duration_melee, function()
                ParticleManager:DestroyParticle(particle, false)
                end)
            end
	    end
	end
    
	caster:EmitSound("DOTA_Item.HeavensHalberd.Activate")
end