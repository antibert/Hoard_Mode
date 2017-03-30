function ShacklesStart( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local duration = ability:GetSpecialValueFor("channel_time")
	local radius = ability:GetSpecialValueFor("radius")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		caster:Stop()
		return
	end

	EmitSoundOn("Hero_ShadowShaman.Shackles.Cast", caster)

	ability:ApplyDataDrivenModifier(caster, caster, "modifier_shackles_sound", {duration = duration})

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ability:ApplyDataDrivenModifier(caster, unit, "modifier_shackles", {duration = duration})
	end
end

function StopSound( keys )
	local caster = keys.caster
	caster:StopSound("Hero_ShadowShaman.Shackles")
end
