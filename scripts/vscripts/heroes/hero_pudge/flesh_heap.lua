--[[ ============================================================================================================
	Author: Rook
	Date: January 28, 2015
	Called whenever one of Slark's autoattack lands.  If it hit an enemy hero, it steals attribute points from them
	and leaves a counter on their modifier HUD.
	Additional parameters: keys.StatLoss
================================================================================================================= ]]
function modifier_flesh_heap_increment(event)
	local caster = event.caster
	local target = event.target -- unit? The killed thing
	local modifier = event.modifier
	local ability = event.ability

	local max_stacks = ability:GetLevelSpecialValueFor( "flesh_heap_max_stacks", ability:GetLevel() - 1 )

	-- Check if the hero already has the modifier
	local current_stack = 0
	if caster:HasModifier(modifier) then
		current_stack = caster:GetModifierStackCount( modifier, ability )
	else
		DebugPrint("adding modifier"..modifier)
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
	end

	-- Set the stack up to max_souls
	if (current_stack + 1) <= max_stacks then
		caster:SetModifierStackCount( modifier, ability, current_stack + 1 )
	else
		caster:SetModifierStackCount( modifier, ability, max_stacks )
	end
end

function modifier_flesh_heap_increment_check(event)
	local target = event.target
	local target_modifier = event.target

	if not target:HasModifier(target_modifier) then
		modifier_flesh_heap_increment(event)
	end
end