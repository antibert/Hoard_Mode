modifier_viper_strike_lua = class({})
--------------------------------------------------------------------------------

function modifier_viper_strike_lua:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_viper_strike_lua:OnCreated( kv )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
	self.move_speed_slow = self:GetAbility():GetSpecialValueFor( "bonus_movement_speed" )
	self.attack_speed_slow = self:GetAbility():GetSpecialValueFor( "bonus_attack_speed" )
	self.move_speed_slow_recover = self:GetAbility():GetSpecialValueFor( "bonus_movement_speed_small" )
	self.attack_speed_slow_recover = self:GetAbility():GetSpecialValueFor( "bonus_attack_speed_small" )
	self.tick_rate = 1

	if IsServer() then
		self:GetParent():InterruptChannel()
		self:OnIntervalThink()
		self:StartIntervalThink( self.tick_rate )
	end
end

--------------------------------------------------------------------------------

function modifier_viper_strike_lua:OnIntervalThink()
	if IsServer() then
		self.move_speed_slow = self.move_speed_slow - self.move_speed_slow_recover
		self.attack_speed_slow = self.attack_speed_slow - self.attack_speed_slow_recover
		local flDamage = self.damage

		local damage = {
			victim = self:GetParent(),
			attacker = self:GetCaster(),
			damage = flDamage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility()
		}

		ApplyDamage( damage )

	end
end

--------------------------------------------------------------------------------

function modifier_viper_strike_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_viper_strike_lua:GetModifierMoveSpeedBonus_Percentage( params )
	return self.move_speed_slow
end

--------------------------------------------------------------------------------

function modifier_viper_strike_lua:GetModifierAttackSpeedBonus_Constant( params )
	return self.attack_speed_slow
end