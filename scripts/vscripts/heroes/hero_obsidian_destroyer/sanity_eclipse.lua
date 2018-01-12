--[[Sanity Eclipse
	Author: chrislotix
	Date: 08.01.2015.
	]]


function SanityEclipseDamage( keys )
	
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local od_int = caster:GetIntellect()
	local mana = target:GetMaxMana()
	local dmg_multiplier = ability:GetLevelSpecialValueFor("damage_multiplier", (ability:GetLevel() -1))
	local mana_drain = ability:GetLevelSpecialValueFor("mana_drain", (ability:GetLevel() -1))
	-- local has_scepter = caster:HasScepter()

	-- if has_scepter then
	-- 	dmg_multiplier = ability:GetLevelSpecialValueFor("damage_multiplier_scepter", (ability:GetLevel() -1))
	-- end

	if caster:HasAbility("special_bonus_unique_outworld_devourer_3") then
		local talent = caster:FindAbilityByName("special_bonus_unique_outworld_devourer_3")
		if talent:GetLevel()>0 then
			dmg_multiplier = dmg_multiplier + talent:GetSpecialValueFor("value")
		end
	end

	local damage_table = {}

	damage_table.attacker = caster
	damage_table.damage_type = ability:GetAbilityDamageType()
	damage_table.ability = ability
	damage_table.victim = target

	target:SetMana(mana* mana_drain/100)

	damage_table.damage = od_int * dmg_multiplier
	ApplyDamage(damage_table)
end


	







	


	
