viper_strike_lua = class({})
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

	return self.BaseClass.GetCastRange( self, nLevel )
end

function viper_strike_lua:GetManaCost( nLevel )
	if self:GetCaster():HasScepter() then
		return self:GetSpecialValueFor( "mana_cost_scepter" )
	end

	return self.BaseClass.GetManaCost( self, nLevel )
end