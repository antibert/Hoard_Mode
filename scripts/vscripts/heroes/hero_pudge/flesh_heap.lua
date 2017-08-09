--[[ ============================================================================================================
	Author: Rook
	Date: January 28, 2015
	Called whenever one of Slark's autoattack lands.  If it hit an enemy hero, it steals attribute points from them
	and leaves a counter on their modifier HUD.
	Additional parameters: keys.StatLoss
================================================================================================================= ]]
function modifier_flesh_heap_increment(event)
	local caster = event.caster
	local modifier = event.modifier
	local ability = event.ability

	local max_stacks = ability:GetLevelSpecialValueFor( "max_stacks", ability:GetLevel() - 1 )

	-- Check if the hero already has the modifier
	local current_stack = 0
	if caster:HasModifier(modifier) then
		current_stack = caster:GetModifierStackCount( modifier, ability )
	else
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
	end

	-- Set the stack up to max_stacks
	if (current_stack + 1) <= max_stacks then
		caster:SetModifierStackCount( modifier, ability, current_stack + 1 )
	else
		caster:SetModifierStackCount( modifier, ability, max_stacks )
	end
	caster:CalculateStatBonus()
end

function modifier_flesh_heap_increment_check(event)
	local target = event.unit
	local target_modifier = event.target_modifier

	if not target:HasModifier(target_modifier) then
		modifier_flesh_heap_increment(event)
	end
end

function modifier_flesh_heap_refresh(event)
	local caster = event.caster
	local modifier = event.modifier
	local ability = event.ability

	-- Check if the hero already has the modifier
	local current_stack = 0
	if caster:HasModifier(modifier) then
		current_stack = caster:GetModifierStackCount( modifier, ability )
		caster:RemoveModifierByName(modifier)
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
		caster:SetModifierStackCount( modifier, ability, current_stack + 1 )
	end
end