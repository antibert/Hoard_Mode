--[[abilities that use lazy linkens checks
should probably just trash this

CheckLinkensStop{
	cold feet,
}

CheckLinkens{
	
}

CheckLinkensApplyModifier{
	kotl overload,
}

--this one was just for poison touch xd
CheckLinkensSpecial{
	poison touch,
}]]

--[[keys: UseMana, UseCooldown]]
function CheckLinkensStop( keys )
	local UseMana = keys.UseMana == ("true" or "1")
	local UseCooldown = keys.UseCooldown == ("true" or "1")
	if keys.target:GetTeam() ~= keys.caster:GetTeam() and keys.target:TriggerSpellAbsorb(keys.ability) then
		keys.caster:Stop()
		keys.ability:UseResources(UseMana, false, UseCooldown)
	end
end

--[[keys: UseMana, UseCooldown]]
function CheckLinkens( keys )
	local UseMana = keys.UseMana == ("true" or "1")
	local UseCooldown = keys.UseCooldown == ("true" or "1")
	if keys.target:GetTeam() ~= keys.caster:GetTeam() and keys.target:TriggerSpellAbsorb(keys.ability) then
		keys.ability:UseResources(UseMana, false, UseCooldown)
	end
end

--[[will apply a modifier if spell is not blocked
keys: UseMana, UseCooldown, modifier, duration]]
function CheckLinkensApplyModifier( keys )
	local UseMana = keys.UseMana == ("true" or "1")
	local UseCooldown = keys.UseCooldown == ("true" or "1")
	if keys.target:GetTeam() ~= keys.caster:GetTeam() and keys.target:TriggerSpellAbsorb(keys.ability) then
		keys.caster:Stop()
		keys.ability:UseResources(UseMana, false, UseCooldown)
		return
	end
	local duration
	if not keys.duration then
		duration = {}
	else
		duration = {duration = keys.duration}
	end
	keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, keys.modifier, duration)
end

--[[will remove specified modifiers if spell is blocked
keys: UseMana;bool, UseCooldown;bool, RemoveModfier;bool, Modifier;string, Modifier2;string, Delay;float, DelayedModifier;string]]
function CheckLinkensSpecial( keys )
	local UseMana = keys.UseMana == ("true" or "1")
	local UseCooldown = keys.UseCooldown == ("true" or "1")
	if keys.target:GetTeam() ~= keys.caster:GetTeam() and keys.target:TriggerSpellAbsorb(keys.ability) then
		keys.ability:UseResources(UseMana, false, UseCooldown)
		if keys.RemoveModifier then
			if keys.Modifier then
				keys.target:RemoveModifierByName(keys.Modifier)
			end
			if keys.Modifier2 then
				keys.target:RemoveModifierByName(keys.Modifier2)
			end
			if keys.Delay then
				Timers:CreateTimer(keys.Delay, function()
					if keys.DelayedModifier then
						keys.target:RemoveModifierByName(keys.DelayedModifier)
					end
				end)
			end
		end
	end
end