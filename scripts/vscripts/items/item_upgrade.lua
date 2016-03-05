--[[ Author: Hewdraw ]]

function item_upgrade_tower( keys )
	local caster = keys.caster
	local target = keys.target
	local item = keys.ability
	local heal_target = true
	local heal = keys.heal_amount

	if target:IsTower() then
		local tower_stats = target:FindAbilityByName("tower_stats")
		if tower_stats ~= nil then
			local level = tower_stats:GetLevel()
			if level < 10 then
				level = level + 1
				tower_stats:SetLevel(level)
				heal_target = false

				local ability = target:FindAbilityByName("tower_overpower")
				if ability ~= nil then
					ability:SetLevel(math.min(4, math.floor(level / 2)))
				end

				local tower_splash = target:FindAbilityByName("tower_splash")
				if tower_splash ~= nil then
					tower_splash:SetLevel(math.min(4, math.floor((level - 1) / 2)))
                    if tower_splash:GetAutoCastState() == false then
                        tower_splash:ToggleAutoCast()
                    end
				end

			end
		end
	else
		local building_stats = target:FindAbilityByName("building_stats")
		if building_stats ~= nil then
			local level = building_stats:GetLevel()
			if level < 10 then
				level = level + 1
				building_stats:SetLevel(level)
				heal_target = false
			end
		end
	end

	if heal_target then
		target:Heal(heal, caster)
	else
		target:Heal(heal * 0.2, caster)
	end
end