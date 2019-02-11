modifier_brs_boosted = class({})

-- This skill was created as a BRS flag, that informs the system, that the wielder has already got a random skill set.
 
function modifier_brs_boosted:IsBuff()
	return true
end

function modifier_brs_boosted:IsPurgable()
    return false
end
 
function modifier_brs_boosted:IsHidden()
    return true
end