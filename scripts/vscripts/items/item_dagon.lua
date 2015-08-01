--[[ Author: Hewdraw ]]

function DagonSpellStart( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local dagon_level = ability:GetLevel()
	local damage = ability:GetLevelSpecialValueFor("damage", dagon_level - 1)
	local radius = ability:GetLevelSpecialValueFor("radius", dagon_level - 1)

	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
	
	for _,unit in pairs(units) do
		local dagon_particle = ParticleManager:CreateParticle("particles/items_fx/dagon.vpcf",  PATTACH_ABSORIGIN_FOLLOW, caster)
		ParticleManager:SetParticleControlEnt(dagon_particle, 1, unit, PATTACH_POINT_FOLLOW, "attach_hitloc", unit:GetAbsOrigin(), false)
		local particle_effect_intensity = 300 + (100 * dagon_level)  --Control Point 2 in Dagon's particle effect takes a number between 400 and 800, depending on its level.
		ParticleManager:SetParticleControl(dagon_particle, 2, Vector(particle_effect_intensity))

		ApplyDamage({victim = unit, attacker = caster, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL,})
	end
	
	keys.caster:EmitSound("DOTA_Item.Dagon.Activate")
	keys.target:EmitSound("DOTA_Item.Dagon5.Target")
end