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
	
	-- Check if it's not already been hit
	if not caster.carapaced_units[ attacker:entindex() ] and not attacker:IsMagicImmune() then
		local targetHealth = math.max(0, attacker:GetHealth() -damageTaken)
		attacker:SetHealth( targetHealth )
		keys.ability:ApplyDataDrivenModifier( caster, attacker, "modifier_spiked_carapaced_stun_datadriven", { } )
		caster:SetHealth( caster:GetHealth() + damageTaken )
		caster.carapaced_units[ attacker:entindex() ] = attacker
	end
end
