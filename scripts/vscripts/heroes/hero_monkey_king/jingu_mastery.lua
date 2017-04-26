function ApplyJinguDebuff( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target

	if caster:HasModifier("modifier_jingu_mastery_buff") or target:IsBuilding() or caster:PassivesDisabled() or not caster:IsRealHero() then
		return
	end

	-- refresh counter
	local jingu = target:FindModifierByNameAndCaster("modifier_jingu_mastery_debuff", caster)
	if jingu then
		jingu:ForceRefresh()
	else
	-- apply counter
		jingu = ability:ApplyDataDrivenModifier(caster, target, "modifier_jingu_mastery_debuff", {duration = ability:GetSpecialValueFor("counter_duration")})
	end
	jingu:IncrementStackCount()
	-- jingu particles
	if not target.jingu then
		target.jingu = ParticleManager:CreateParticle("particles/units/heroes/hero_monkey_king/monkey_king_quad_tap_stack.vpcf", PATTACH_OVERHEAD_FOLLOW, target)
		ParticleManager:SetParticleControl(target.jingu, 0, target:GetAbsOrigin())
	end
	ParticleManager:SetParticleControl(target.jingu, 1, Vector(0,jingu:GetStackCount(),0))

	-- check if buff should be applied
	if jingu:GetStackCount() >= ability:GetSpecialValueFor("required_hits") then

		EmitSoundOn("Hero_MonkeyKing.IronCudgel", caster)

		local buff = ability:ApplyDataDrivenModifier(caster, caster, "modifier_jingu_mastery_buff", {})
		buff:SetStackCount(ability:GetSpecialValueFor("charges"))
		jingu:Destroy()
	end
end

function JinguHit( keys )
--	print("jingu")
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local damage = keys.attack_damage

	-- lifesteal, damage is pre mitigation so we calculate damage post mitigation
	if not target:IsBuilding() then
		local armor = target:GetPhysicalArmorValue()
    	local damageReduction = ((0.02 * armor) / (1 + 0.02 * armor))
    	local lifesteal =  (damage - damage * damageReduction) * ability:GetSpecialValueFor("lifesteal")*0.01
		caster:Heal(lifesteal, caster)
	end

	local jingu = caster:FindModifierByNameAndCaster("modifier_jingu_mastery_buff", caster)
	if jingu then
		if not caster.BoundlessCast then
			jingu:DecrementStackCount()
		end
		if jingu:GetStackCount() <= 0 then
			jingu:Destroy()
		end
	end
end

function JinguOverheadDestroy(keys)
	local target = keys.target
	
	ParticleManager:DestroyParticle(target.jingu, false)
	ParticleManager:ReleaseParticleIndex(target.jingu)
	target.jingu = nil
end


function BoundlessDecrement( keys )
	local ability = keys.event_ability
	local caster = keys.caster
	if not ability:GetName() == "monkey_king_boundless_strike" then
		return
	end
--	print("boundless")
	-- "boundless strike will consume one charge of jingu regardless of if it hits any units"
	local jingu = caster:FindModifierByNameAndCaster("modifier_jingu_mastery_buff", caster)
	if jingu then
		jingu:DecrementStackCount()
	end

	--this script runs JUST before the hit script, we use this to tell the hit script to not decrement the stacks
	caster.BoundlessCast = true
--	print("bc", caster.BoundlessCast)
	Timers:CreateTimer(0.06, function()
		caster.BoundlessCast = nil
--		print("bc", caster.BoundlessCast)
	end)
end