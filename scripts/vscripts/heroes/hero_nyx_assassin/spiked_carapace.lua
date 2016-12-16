--[[
	Author: kritth
	Date: 10.01.2015.
	Init the table
]]
function spiked_carapace_init( keys )
	keys.caster.carapaced_units = {}
	local targets = keys.target_entities
	local caster = keys.caster

	local is_burrowed = caster:HasModifier("modifier_nyx_assassin_burrow")

	if is_burrowed then
		for _,target in pairs(targets) do
			keys.ability:ApplyDataDrivenModifier( caster, target, "modifier_spiked_carapaced_stun_datadriven", { } )
		end
	end
end

--[[
	Author: kritth
	Date: 10.01.2015.
	Reflect damage
]]
function spiked_carapace_reflect( keys )
	-- Variables
	local caster = keys.caster
	local attacker = keys.attacker
	local damageTaken = keys.DamageTaken
	local multiplier = 1
	local multiplier_ability = caster:FindAbilityByName(keys.Multiplier)

	if multiplier_ability ~= nil and multiplier_ability:GetLevel() > 0 then
		multiplier = 3
	end
	
	-- Check if it's not already been hit
	if not caster.carapaced_units[ attacker:entindex() ] and not attacker:IsMagicImmune() then
		local damage_table = {}
		damage_table.attacker = caster
		damage_table.victim = attacker
		damage_table.ability = keys.ability
		damage_table.damage_type = DAMAGE_TYPE_PURE
		damage_table.damage = damageTaken * multiplier
		damage_table.damage_flags = DOTA_DAMAGE_FLAG_REFLECTION

		ApplyDamage(damage_table)
		keys.ability:ApplyDataDrivenModifier( caster, attacker, "modifier_spiked_carapaced_stun_datadriven", { } )
		caster:SetHealth( caster:GetHealth() + damageTaken )
		caster.carapaced_units[ attacker:entindex() ] = attacker
	end
end
