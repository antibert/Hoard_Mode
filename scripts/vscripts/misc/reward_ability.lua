function GrantBuff(keys)
	DebugPrint("Adding " .. keys.ability_to_grant .. " to " .. keys.unit_to_target)
	local building = Entities:FindByName(nil, keys.unit_to_target)
	if building ~= nil then
		local ability = building:FindAbilityByName(keys.ability_to_grant)
		ShowMessage("The strength of your Ancient has increased!")
		if ability == nil then
			building:AddAbility(keys.ability_to_grant)
			building.SetLevel(1)
		else
			ability:SetLevel(ability:GetLevel() + 1)
		end
	end
end