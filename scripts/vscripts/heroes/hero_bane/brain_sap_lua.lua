brain_sap_lua = class({})

function brain_sap_lua:GetAOERadius()
	return self:GetSpecialValueFor( "radius" )
end

function brain_sap_lua:GetBehavior()
	local behav = DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_AOE
	return behav
end

function brain_sap_lua:CastFilterResultTarget( hTarget )
	if IsServer() then
		return UnitFilter(hTarget, self:GetAbilityTargetTeam(), self:GetAbilityTargetType(), self:GetCaster():HasScepter() and DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES or self:GetAbilityTargetFlags(), self:GetCaster():GetTeam())
	end
	return UF_SUCCESS
end

function brain_sap_lua:OnSpellStart()
	local target = self:GetCursorTarget()
	if target:TriggerSpellAbsorb(self) then return end

	local caster = self:GetCaster()
	local radius = self:GetSpecialValueFor("radius")
	local damage = self:GetSpecialValueFor("damage")
	local heal = self:GetSpecialValueFor("heal")
	if caster:HasAbility("special_bonus_unique_bane_2") then
		local talent = caster:FindAbilityByName("special_bonus_unique_bane_2")
		if talent:GetLevel()>0 then
			heal = heal + talent:GetSpecialValueFor("value")
			damage = damage + talent:GetSpecialValueFor("value")
		end
	end

	EmitSoundOn("Hero_Bane.BrainSap", caster)
	EmitSoundOn("Hero_Bane.BrainSap.Target", target)

	local flags = caster:HasScepter() and DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES or self:GetAbilityTargetFlags()
	local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, self:GetAbilityTargetTeam(), self:GetAbilityTargetType(), flags, FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_bane/bane_sap.vpcf", PATTACH_CUSTOMORIGIN_FOLLOW, unit)
		ParticleManager:SetParticleControlEnt(pfx, 0, caster, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), true)
		ParticleManager:SetParticleControlEnt(pfx, 1, unit, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", unit:GetAbsOrigin(), true)
		ParticleManager:ReleaseParticleIndex(pfx)

		ApplyDamage({victim = unit, attacker = caster, ability = self, damage = damage, damage_type = self:GetAbilityDamageType()})
	end

	caster:Heal(heal, caster)
end

function brain_sap_lua:GetCooldown( iLevel )
	if self:GetCaster():HasScepter() then
		return self:GetSpecialValueFor("scepter_cooldown")
	end
	return self.BaseClass.GetCooldown(self, iLevel)
end
