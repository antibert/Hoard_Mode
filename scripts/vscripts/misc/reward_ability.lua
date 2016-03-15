function GrantBuff(keys)
	DebugPrint("Adding " .. keys.ability_to_grant .. " to " .. keys.unit_to_target)
	local building = Entities:FindByName(nil, keys.unit_to_target)
	if building ~= nil then
		local ability = building:FindAbilityByName(keys.ability_to_grant)
		if ability == nil then
			DebugPrint("Adding " .. keys.ability_to_grant .. " not found, adding")
			building:AddAbility(keys.ability_to_grant)
			building.SetLevel(1)
		else
			DebugPrint("Adding " .. keys.ability_to_grant .. " found at level " .. ability:GetLevel())
			ability:SetLevel(ability:GetLevel() + 1)
		end
	else
		DebugPrint("Could not find entity")
	end
end