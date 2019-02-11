modifier_movespeed_cap_spirit_breaker = class({})

function modifier_movespeed_cap_spirit_breaker:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_MAX,
        MODIFIER_PROPERTY_MOVESPEED_LIMIT,
    }

    return funcs
end

function modifier_movespeed_cap_spirit_breaker:GetModifierMoveSpeed_Max( params )
    return 1300
end

function modifier_movespeed_cap_spirit_breaker:GetModifierMoveSpeed_Limit( params )
    return 1300
end

function modifier_movespeed_cap_spirit_breaker:IsHidden()
    return true
end

function modifier_movespeed_cap_spirit_breaker:IsPurgable()
    return false
end

function modifier_movespeed_cap_spirit_breaker:GetAttributes()
    return MODIFIER_ATTRIBUTE_PERMANENT
end