modifier_item_disarm_lua = class({})
function modifier_item_disarm_lua:CheckState()
	local state = {
	[MODIFIER_STATE_DISARMED] = true
	}

	return state
end

function modifier_item_disarm_lua:IsDebuff()
	return true
end

function modifier_item_disarm_lua:GetEffectName()
	return "particles/generic_gameplay/generic_disarm.vpcf"
end

function modifier_item_disarm_lua:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

function modifier_item_disarm_lua:IsHidden() 
	return false
end

function modifier_item_disarm_lua:IsPurgeable() 
	return false
end

