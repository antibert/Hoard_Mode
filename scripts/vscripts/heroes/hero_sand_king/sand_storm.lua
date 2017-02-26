--[[
	Author: kritth
	Date: 1.1.2015
	Remove the loop sound upon destroying the modifier
]]
function sandStorm_Init(keys)
    local caster = keys.caster
    local caster_loc = caster:GetAbsOrigin()
	local ability = keys.ability
    local radius = keys.radius
    local duration = keys.duration
    
    StartAnimation(caster, {duration = duration, activity = ACT_DOTA_OVERRIDE_ABILITY_2, rate = 1.0})
    
    caster.sandstormFX = ParticleManager:CreateParticle("particles/units/heroes/hero_sandking/sandking_sandstorm.vpcf", PATTACH_ABSORIGIN, caster)
	ParticleManager:SetParticleControl(caster.sandstormFX, 0, caster_loc)
	ParticleManager:SetParticleControl(caster.sandstormFX, 1, Vector(radius, radius, 0))
    
    caster:EmitSound("Ability.SandKing_SandStorm.start")
    caster:AddNewModifier(caster, ability, "modifier_sand_storm_debuff_damage_datadriven", {duration = duration})
    caster:EmitSound("Ability.SandKing_SandStorm.loop")
end

function sandStorm_Stop(keys)
    local caster = keys.caster
    local sound_name = "Ability.SandKing_SandStorm.loop"
	StopSoundEvent( sound_name, keys.caster )
    ParticleManager:DestroyParticle(caster.sandstormFX, false)
	ParticleManager:ReleaseParticleIndex(caster.sandstormFX)
    
    caster:RemoveModifierByName("modifier_sand_storm_debuff_damage_datadriven")
    
    EndAnimation(caster)
end

function sandStorm_Damage( keys )
	local caster = keys.caster
	local ability = keys.ability
    local damage = keys.damage
    local radius = keys.radius
	local caster_loc = caster:GetAbsOrigin()

	local hTalent = caster:FindAbilityByName( keys.bonus_damage )
	if hTalent and hTalent:GetLevel() > 0 then
		damage = damage + hTalent:GetSpecialValueFor("value")
	end

	local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster_loc, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
    
    for _,enemy in pairs(enemies) do
		ApplyDamage({attacker = caster, victim = enemy, ability = ability, damage = damage/2, damage_type = DAMAGE_TYPE_MAGICAL})
	end
end