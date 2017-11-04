function Flux( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local radius = ability:GetSpecialValueFor("radius")
	local duration = ability:GetSpecialValueFor("duration")

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	local talent = caster:FindAbilityByName("special_bonus_unique_arc_warden_2")
	if talent then
		if talent:GetLevel() > 0 then
			duration = duration + talent:GetSpecialValueFor("value")
		end
	end

	EmitSoundOn("Hero_ArcWarden.Flux.Target", target)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		unit:AddNewModifier(caster, ability, "modifier_arc_warden_flux", {duration = duration})
	end
end