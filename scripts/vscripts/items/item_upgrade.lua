--[[ Author: Hewdraw ]]

function upgrade_tower( keys, level )
	local caster = keys.caster
	local target = keys.target

	local tower_stats = target:FindAbilityByName("tower_stats")

	if tower_stats ~= nil then
		--local level = tower_stats:GetLevel()
		--level = level + 1
		tower_stats:SetLevel(level)

		local ability = target:FindAbilityByName("tower_aura")
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

function upgrade_barracks( keys, level )
	local caster = keys.caster
	local target = keys.target

	local building_stats = target:FindAbilityByName("building_stats")
	if building_stats ~= nil then
		--local level = building_stats:GetLevel()
		--building_stats:SetLevel(level + 1)
		building_stats:SetLevel(level)
	end
end

-- MAIN UPGRADE FUNCTION --
function item_upgrade_tower( keys )
	local caster = keys.caster
	local target = keys.target
	local item = keys.ability
	local heal = keys.heal_amount_pct

	if caster:IsRealHero() and not caster:HasModifier("modifier_arc_warden_tempest_double") then
		if target:IsBuilding() then
			local wasUpgraded = false
			local wasHealed = false

			if target:FindAbilityByName("tower_stats") ~= nil or target:FindAbilityByName("building_stats") ~= nil then
				-- Upgradeometer is an ability with a stack counter that controls the upgrade levels for the buildings
				local tower_upgradeometer = target:FindAbilityByName("tower_upgradeometer")
				local totalStacks = nil

			    if tower_upgradeometer == nil then
			        local newAbility = target:AddAbility("tower_upgradeometer")
			        newAbility:SetLevel(tonumber(1))
			        totalStacks = 1
			        wasUpgraded = true
			    else
			  	    totalStacks = target:GetModifierStackCount("modifier_tower_upgradeometer", target)
			        if totalStacks < 10 then
			        	totalStacks = totalStacks + 1
				        target:SetModifierStackCount("modifier_tower_upgradeometer", target, totalStacks)
				        wasUpgraded = true
			        end
			    end

			    if wasUpgraded == true then
			    	if target:IsTower() then
			    		upgrade_tower(keys, totalStacks)
			    	else
						upgrade_barracks(keys, totalStacks)
					end
				end
			end

			local maxHP = target:GetMaxHealth()
			if maxHP ~= target:GetHealth() then
				target:Heal( (maxHP / 100) * heal, caster)
				wasHealed = true
			end

			if wasUpgraded == true or wasHealed == true then
				item:SpendCharge()
				return true
			end
		end
		return false
	end
end