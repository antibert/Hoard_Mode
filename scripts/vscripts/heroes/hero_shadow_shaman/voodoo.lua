LinkLuaModifier("modifier_voodoo_lua", "heroes/hero_shadow_shaman/modifiers/modifier_voodoo_lua.lua", LUA_MODIFIER_MOTION_NONE)

--[[Author: Pizzalol
	Date: 27.09.2015.
	Checks if the target is an illusion, if true then it kills it
	otherwise it applies the hex modifier to the target]]
function voodoo_start( keys )
	local caster = keys.caster
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local target = keys.target
	local duration = ability:GetLevelSpecialValueFor("duration", ability_level)
	local radius = ability:GetSpecialValueFor("radius")

	if target:IsIllusion() then
		target:ForceKill(true)
		EmitSoundOn("Hero_ShadowShaman.Hex.Target", target)
	else
		if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
			return
		end
		EmitSoundOn("Hero_ShadowShaman.Hex.Target", target)
		local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
		for _,unit in pairs(units) do
			unit:AddNewModifier(caster, ability, "modifier_shadow_shaman_voodoo", {duration = duration})
			local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_shadowshaman/shadowshaman_voodoo.vpcf", PATTACH_ABSORIGIN_FOLLOW, unit)
		end	
	end
end
