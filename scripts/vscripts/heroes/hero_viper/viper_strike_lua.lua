viper_strike_lua = class({})
LinkLuaModifier( "modifier_viper_strike_lua", "heroes/hero_viper/modifier_viper_strike_lua.lua" ,LUA_MODIFIER_MOTION_NONE )

function viper_strike_lua:GetCooldown( nLevel )
	if self:GetCaster():HasScepter() then
		return self:GetSpecialValueFor( "cooldown_scepter" )
	end

	return self.BaseClass.GetCooldown( self, nLevel )
end
function viper_strike_lua:GetCastRange( vLocation, hTarget )
	if self:GetCaster():HasScepter() then
		return self:GetSpecialValueFor( "cast_range_scepter" )
	end

	return self:GetSpecialValueFor( "cast_range" )
end

function viper_strike_lua:GetManaCost( nLevel )
	if self:GetCaster():HasScepter() then
		return self:GetSpecialValueFor( "mana_cost_scepter" )
	end

	return self.BaseClass.GetManaCost( self, nLevel )
end

function viper_strike_lua:GetAOERadius( nLevel )
	return self:GetSpecialValueFor( "radius" )
end

function viper_strike_lua:OnSpellStart()
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()

	if caster == nil or target == nil or target:TriggerSpellAbsorb( this ) then
		return
	end

	local targetTeam = self:GetAbilityTargetTeam()
	local targetType = self:GetAbilityTargetType()
	local targetFlag = self:GetAbilityTargetFlags()
	local radius = self:GetCastRange()

	EmitSoundOn( "Hero_Viper.viperStrike", caster )

	local projectileSpeed = self:GetSpecialValueFor("projectile_speed")
	local units = FindUnitsInRadius(
		caster:GetTeamNumber(), target:GetAbsOrigin(), nil, radius, targetTeam, targetType, targetFlag, FIND_CLOSEST, false
	)

	-- Seek out target
	for k, v in pairs( units ) do
		local projTable = {
			Target = v,
			Source = caster,
			Ability = self,
			EffectName = "particles/units/heroes/hero_viper/viper_viper_strike.vpcf",
			bDodgeable = true,
			bProvidesVision = false,
			iMoveSpeed = projectileSpeed,
			vSpawnOrigin = caster:GetAbsOrigin()
		}
		ProjectileManager:CreateTrackingProjectile( projTable )
	end
end

function viper_strike_lua:OnProjectileHit( hTarget, vLocation )
	if hTarget == self:GetCaster() then
		return false
	end

	local caster = self:GetCaster()
	local ability = self
	local duration = self:GetSpecialValueFor("duration")
	if hTarget ~= nil then
		EmitSoundOn( "Hero_Viper.viperStrikeTarget", hTarget )
		hTarget:AddNewModifier(caster, ability, "modifier_viper_strike_lua", {duration = duration})
	end
end
