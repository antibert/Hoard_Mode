--[[Author: Pizzalol
	Date: 19.12.2014.
	This is run whenever an attack is started to determine which modifier gets applied]]
function Nethertoxin( keys )
	local caster = keys.caster
	local target = keys.target

	local nethertoxin = caster:FindAbilityByName("viper_nethertoxin")
	if nethertoxin ~= nil then
		local nethertoxin_level = nethertoxin:GetLevel() - 1
		if nethertoxin_level >= 0 then
			local HPPercentage = math.floor((1 - target:GetHealth()/target:GetMaxHealth()) * 5) -- Calculate the target HP percentage
			-- local damage = nethertoxin:GetLevelSpecialValueFor("bonus_damage", nethertoxin_level)
			local damage = nethertoxin_level * keys.multiplier
			damage = damage * math.pow(2, HPPercentage)
			if damage > 0 then
				ApplyDamage({victim = target, attacker = caster, damage = damage, damage_type = DAMAGE_TYPE_PHYSICAL})
			end
		end
	end
end