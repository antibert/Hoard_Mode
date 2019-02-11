LinkLuaModifier( "modifier_movespeed_cap_spirit_breaker", "libraries/modifiers/modifier_movespeed_cap_spirit_breaker.lua" ,LUA_MODIFIER_MOTION_NONE )

function RemoveMovespeed_spirit_breaker(keys)
	local caster = keys.caster
	if caster:HasModifier("modifier_movespeed_cap_spirit_breaker") == false then
		caster:AddNewModifier(caster, nil, "modifier_movespeed_cap_spirit_breaker", {})
	end
end

function AddEmpoweringHasteBuff(keys)
	local caster = keys.caster
	
	-- Removes the 522 move speed cap
	if caster:HasModifier("modifier_movespeed_cap_spirit_breaker") == false then
		caster:AddNewModifier(caster, nil, "modifier_movespeed_cap_spirit_breaker", {})
	end
end