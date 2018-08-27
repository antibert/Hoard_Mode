function antisniper_attacked( keys )
	-- Variables
	local caster = keys.caster
	local attacker = keys.attacker
  local ability = keys.ability
  local modifier = keys.modifier
	local current_range = caster.GetBaseAttackRange(caster)
  local attacker_range = attacker.GetAttackRange(attacker)
  
  local current_stack = 1
	if caster:HasModifier(modifier) then
		current_stack = caster:GetModifierStackCount( modifier, ability )
	else
		ability:ApplyDataDrivenModifier(caster, caster, modifier, {})
	end
  
  if ( (current_stack + current_range) >= attacker_range) then
    return
  end
  
  local new_stacks = (attacker_range - current_range) + 10

  caster:SetModifierStackCount( modifier, ability, new_stacks )
end