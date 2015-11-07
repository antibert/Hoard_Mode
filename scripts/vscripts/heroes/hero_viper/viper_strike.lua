function viper_viper_strike_lua:GetCooldown( nLevel )
	if self:GetCaster():HasScepter() then
		return self:GetSpecialValueFor( "cooldown_scepter" )
	end
 
	return self.BaseClass.GetCooldown( self, nLevel )
end

