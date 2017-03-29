--[[
	Author: kritth
	Date: 10.01.2015.
	Burn mana and damage enemies with the same amount
]]
function mana_burn_function( keys )
	-- Variables
	local caster = keys.caster
	local target = keys.target
	local current_mana = target:GetMana()
	local ability = keys.ability
	local manaBurn = ability:GetLevelSpecialValueFor("mana_per_hit", (ability:GetLevel() - 1))
	local manaDamage = ability:GetLevelSpecialValueFor("damage_per_burn", (ability:GetLevel() - 1))
	local number_particle_name = "particles/units/heroes/hero_nyx_assassin/nyx_assassin_mana_burn_msg.vpcf"
	local burn_particle_name = "particles/units/heroes/hero_nyx_assassin/nyx_assassin_mana_burn.vpcf"
	local damageType = ability:GetAbilityDamageType()
	local targetLocation = target:GetAbsOrigin()
	local radius = ability:GetSpecialValueFor("radius")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	-- do percent of total mana if target does not have int
	local current_int = 0
	if target:IsHero() then
		current_int = target:GetIntellect()
	end

	if current_int == 0 then
		current_int = target:GetMaxMana() / 13
	end

	-- Calculation
	local mana_to_burn = math.min( current_mana, manaBurn )
	local life_time = 2.0

	-- Fail check
	if target:IsMagicImmune() then
		mana_to_burn = 0
	end

	local digits = string.len( math.floor( mana_to_burn ) ) + 1

	local damageTable = {}
	damageTable.attacker = caster
	damageTable.victim = target
	damageTable.damage_type = ability:GetAbilityDamageType()
	damageTable.ability = ability
	damageTable.damage = manaBurn * manaDamage

	-- If the target is not magic immune then reduce the mana and deal damage
	if mana_to_burn > 0 then
		-- Apply effect of ability
		target:ReduceMana(manaBurn)

		-- Finds all the enemies in a radius around the target and then deals damage to each of them
		local unitsToDamage = FindUnitsInRadius(caster:GetTeam(), targetLocation, nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), DOTA_UNIT_TARGET_FLAG_NONE, 0, false)

		for _,v in ipairs(unitsToDamage) do
			damageTable.victim = v
			ApplyDamage(damageTable)
		end
	end
	
	-- Show VFX
	local numberIndex = ParticleManager:CreateParticle( number_particle_name, PATTACH_OVERHEAD_FOLLOW, target )
	ParticleManager:SetParticleControl( numberIndex, 1, Vector( 1, mana_to_burn, 0 ) )
    ParticleManager:SetParticleControl( numberIndex, 2, Vector( life_time, digits, 0 ) )
	local burnIndex = ParticleManager:CreateParticle( burn_particle_name, PATTACH_ABSORIGIN, target )
	
	-- Create timer to properly destroy particles
	Timers:CreateTimer( life_time, function()
			ParticleManager:DestroyParticle( numberIndex, false )
			ParticleManager:DestroyParticle( burnIndex, false)
			return nil
		end
	)
end
