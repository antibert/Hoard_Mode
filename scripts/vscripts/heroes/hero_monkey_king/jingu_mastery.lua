function ApplyJinguDebuff( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target

	if caster.dontApply or caster:HasModifier("modifier_jingu_mastery_buff") or target:IsBuilding() or caster:PassivesDisabled() or not caster:IsRealHero() then
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
	if not target.jinguPfx then
		target.jinguPfx = ParticleManager:CreateParticle("particles/units/heroes/hero_monkey_king/monkey_king_quad_tap_stack.vpcf", PATTACH_OVERHEAD_FOLLOW, target)
		ParticleManager:SetParticleControl(target.jinguPfx, 0, target:GetAbsOrigin())
	end
	ParticleManager:SetParticleControl(target.jinguPfx, 1, Vector(0,jingu:GetStackCount(),0))

	-- check if buff should be applied
	if jingu:GetStackCount() >= ability:GetSpecialValueFor("required_hits") then
		--shiny explosion particles on caster
		local explo = ParticleManager:CreateParticle("particles/units/heroes/hero_monkey_king/monkey_king_quad_tap_start.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
		ParticleManager:SetParticleControl(explo, 0, caster:GetAbsOrigin())
		ParticleManager:ReleaseParticleIndex(explo)

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

	--this lifesteal probably doesnt account for % based reductions like dispersion
	if not target:IsBuilding() then
		-- damage is pre mitigation so we calculate damage post mitigation for lifesteal
		local armor = target:GetPhysicalArmorValue()
		local damageReduction = ((0.02 * armor) / (1 + 0.02 * armor))
		local lifesteal =  (damage - damage * damageReduction) * ability:GetSpecialValueFor("lifesteal")*0.01

		-- lifesteal pfx and heal
		local lifePfx = ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_OVERHEAD_FOLLOW, caster)
	--	ParticleManager:SetParticleControl(lifePfx, 0, caster:GetAbsOrigin())
		ParticleManager:ReleaseParticleIndex(lifePfx)
		caster:Heal(lifesteal, caster)

		-- jingu hit pfx
		local hitPfx = ParticleManager:CreateParticle("particles/units/heroes/hero_monkey_king/monkey_king_quad_tap_hit.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
		ParticleManager:SetParticleControl(hitPfx, 1, target:GetAbsOrigin())
		ParticleManager:ReleaseParticleIndex(hitPfx)
	end

	-- if attack did not originate from boundless, decrease stacks
	if not caster.BoundlessCast then
		local jingu = caster:FindModifierByNameAndCaster("modifier_jingu_mastery_buff", caster)
		if jingu then
			jingu:DecrementStackCount()
			if jingu:GetStackCount() <= 0 then
				jingu:Destroy()

				--this prevents jingu debuff being applied on the same attack that removes jingu buff
				caster.dontApply = true
				Timers:CreateTimer(0.03, function() caster.dontApply = false end)
			end
		end
	end	
end

function JinguOverheadDestroy(keys)
	local target = keys.target
	
	ParticleManager:DestroyParticle(target.jinguPfx, false)
	ParticleManager:ReleaseParticleIndex(target.jinguPfx)
	target.jinguPfx = nil
end

-- "boundless strike will consume one charge of jingu regardless of if it hits any units"
function BoundlessDecrement( keys )
	local ability = keys.event_ability
	local caster = keys.caster

	if ability:GetName() ~= "monkey_king_boundless_strike" then
		return
	end
	
	--this script runs JUST before the hit script, we use this to tell the hit script to not decrement the stacks
	caster.BoundlessCast = true
	Timers:CreateTimer(0.03, function()
		caster.BoundlessCast = nil

		--remove jingu buff after boundless strike hits units
		local jingu = caster:FindModifierByNameAndCaster("modifier_jingu_mastery_buff", caster)
		if jingu then
			jingu:DecrementStackCount()
			if jingu:GetStackCount() <= 0 then
				jingu:Destroy()

				--this prevents jingu debuff being applied on the same attack that removes jingu buff
				caster.dontApply = true
				Timers:CreateTimer(0.03, function() caster.dontApply = false end)
			end
		end
	end)
end
