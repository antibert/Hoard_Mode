visage_soul_assumption_lua = class({})

function visage_soul_assumption_lua:OnSpellStart()
	local target = self:GetCursorTarget()
	if not target then return end

	self.radius = self:GetSpecialValueFor("radius")
	self.damage = self:GetAbilityDamage()
	self.dType = self:GetAbilityDamageType()

	local p = ParticleManager:CreateParticle("particles/units/heroes/hero_visage/visage_soul_assumption_beam.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
	ParticleManager:SetParticleControl(p, 0, self:GetCaster():GetAbsOrigin())

	EmitSoundOn("Hero_Visage.SoulAssumption.Cast", self:GetCaster())

	local info = {
		Target = target,
		Source = self:GetCaster(),
		Ability = self,
		EffectName = "particles/units/heroes/hero_visage/visage_soul_assumption_bolt.vpcf",
		bDodgeable = true,
		iMoveSpeed = self:GetSpecialValueFor("speed"),
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1,
		bProvidesVision = false,
--		iVisionRadius = 0,
--		iVisionTeamNumber = self:GetCaster():GetTeamNumber(),
    }
    ProjectileManager:CreateTrackingProjectile( info )
end

function visage_soul_assumption_lua:OnProjectileHit( hTarget, vLocation )
	if not IsServer() or not hTarget or hTarget:IsNull() then return end
	if hTarget:GetTeam() ~= self:GetCaster():GetTeam() and hTarget:TriggerSpellAbsorb(self) then return end

	local sven = ParticleManager:CreateParticle("particles/units/heroes/hero_sven/sven_storm_bolt_projectile_explosion.vpcf", PATTACH_POINT, hTarget)
	ParticleManager:SetParticleControlEnt(sven, 3, hTarget, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", hTarget:GetAbsOrigin(), false)

	EmitSoundOn("Hero_Visage.SoulAssumption.Target", hTarget)

	local units = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), hTarget:GetAbsOrigin(), nil, self.radius, self:GetAbilityTargetTeam(), self:GetAbilityTargetType(), self:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	for _,unit in pairs(units) do
		ApplyDamage({victim = unit, attacker = self:GetCaster(), ability = self, damage = self.damage, damage_type = self.dType})
	end
end
