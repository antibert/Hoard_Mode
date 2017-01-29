modifier_brs_boosted = class({})
 
function modifier_brs_boosted:IsBuff()
	return true
end

function modifier_brs_boosted:IsPurgable()
    return false
end
 
function modifier_brs_boosted:IsHidden()
    return true
end