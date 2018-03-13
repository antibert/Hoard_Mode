-------------------------------------------

LinkLuaModifier("modifier_cursed_rapier_toggle", "items/modifiers/modifier_cursed_rapier.lua", LUA_MODIFIER_MOTION_NONE)

-------------------------------------------

modifier_cursed_rapier_toggle = modifier_cursed_rapier_toggle or class({})
function modifier_cursed_rapier_toggle:IsDebuff() return false end
function modifier_cursed_rapier_toggle:IsHidden() return false end
function modifier_cursed_rapier_toggle:IsPermanent() return true end
function modifier_cursed_rapier_toggle:IsPurgable() return false end
function modifier_cursed_rapier_toggle:IsPurgeException() return false end
function modifier_cursed_rapier_toggle:IsStunDebuff() return false end
function modifier_cursed_rapier_toggle:RemoveOnDeath() return true end
function modifier_cursed_rapier_toggle:GetAttributes() return MODIFIER_ATTRIBUTE_NONE end

function modifier_cursed_rapier_toggle:OnCreated()
	if IsServer() then
		self.parent = self:GetParent()

		if self.parent:IsRealHero() then

			self.range_penalty = 0
			if CustomNetTables:GetTableValue("player_table", "server_range_penalty"..tostring(self.parent:GetPlayerOwnerID())) then
				if CustomNetTables:GetTableValue("player_table", "server_range_penalty"..tostring(self.parent:GetPlayerOwnerID())).server_range_penalty then
					CustomNetTables:SetTableValue( "player_table", "server_range_penalty"..tostring(self.parent:GetPlayerOwnerID()), { server_range_penalty = self.range_penalty})
				end
			end

			self.accumulated_damage = 0
			if CustomNetTables:GetTableValue("player_table", "server_accumulated_damage"..tostring(self.parent:GetPlayerOwnerID())) then
				if CustomNetTables:GetTableValue("player_table", "server_accumulated_damage"..tostring(self.parent:GetPlayerOwnerID())).server_accumulated_damage then
					CustomNetTables:SetTableValue( "player_table", "server_accumulated_damage"..tostring(self.parent:GetPlayerOwnerID()), { server_accumulated_damage = self.accumulated_damage})
				end
			end

			self.think = 0.2
			self:StartIntervalThink( self.think )
		else
			self:Destroy()
		end
	end
end

function modifier_cursed_rapier_toggle:OnIntervalThink()
	if IsServer() then
		if self.parent:GetAttackRange() ~= self:GetAbility():GetSpecialValueFor("max_attack_range") then
			self.range_penalty = self.range_penalty + self:GetAbility():GetSpecialValueFor("max_attack_range") - self.parent:GetAttackRange()
		end

		local damage_table = {}

	    damage_table.attacker = self.parent
	    damage_table.victim = self.parent
	    damage_table.damage_type = DAMAGE_TYPE_PURE

	    local self_damage = (self.parent:GetMaxHealth() * self:GetAbility():GetSpecialValueFor("health_pct_drain") * self.think * 0.01)
	    damage_table.damage = self_damage
	    self.accumulated_damage = self.accumulated_damage + self_damage

    	ApplyDamage(damage_table)

    	CustomNetTables:SetTableValue( "player_table", "server_range_penalty"..tostring(self.parent:GetPlayerOwnerID()), { server_range_penalty = self.range_penalty})
    	CustomNetTables:SetTableValue( "player_table", "server_accumulated_damage"..tostring(self.parent:GetPlayerOwnerID()), { server_accumulated_damage = self.accumulated_damage})
	end
end

function modifier_cursed_rapier_toggle:DeclareFunctions()
    local decFuns =
    {
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_DISABLE_HEALING,
		MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PHYSICAL,
		MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_MAGICAL
    }
    return decFuns
end

function modifier_cursed_rapier_toggle:GetModifierAttackRangeBonus()
	local parent = self:GetParent()
	if parent:IsRealHero() then
		if CustomNetTables:GetTableValue("player_table", "server_range_penalty"..tostring(parent:GetPlayerOwnerID())) then
			if CustomNetTables:GetTableValue("player_table", "server_range_penalty"..tostring(parent:GetPlayerOwnerID())).server_range_penalty then
				local range_penalty = CustomNetTables:GetTableValue("player_table", "server_range_penalty"..tostring(parent:GetPlayerOwnerID())).server_range_penalty	
				return range_penalty
			end
		end
	end
	return nil
end

function modifier_cursed_rapier_toggle:GetModifierPreAttack_BonusDamage()
	local parent = self:GetParent()
	if parent:IsRealHero() then
		if CustomNetTables:GetTableValue("player_table", "server_accumulated_damage"..tostring(parent:GetPlayerOwnerID())) then
			if CustomNetTables:GetTableValue("player_table", "server_accumulated_damage"..tostring(parent:GetPlayerOwnerID())).server_accumulated_damage then
				local accumulated_damage = self:GetAbility():GetSpecialValueFor("bonus_damage_toggle") + 0.2 * CustomNetTables:GetTableValue("player_table", "server_accumulated_damage"..tostring(parent:GetPlayerOwnerID())).server_accumulated_damage	
				return accumulated_damage
			end
		end
	end
	return nil
end

function modifier_cursed_rapier_toggle:GetDisableHealing()
	if self:GetParent():IsRealHero() then return 1 end
end

function modifier_cursed_rapier_toggle:GetAbsoluteNoDamagePhysical()
	if self:GetParent():IsRealHero() then return 1 end
end

function modifier_cursed_rapier_toggle:GetAbsoluteNoDamageMagical()
	if self:GetParent():IsRealHero() then return 1 end
end