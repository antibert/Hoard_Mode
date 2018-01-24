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
	if self:GetParent():IsRealHero() then
		self.range_penalty = 0

		self.think = 0.2
		self:StartIntervalThink( self.think )
	end
end

function modifier_cursed_rapier_toggle:OnIntervalThink()
	if self:GetParent():GetAttackRange() ~= self:GetAbility():GetSpecialValueFor("max_attack_range") then
		self.range_penalty = self.range_penalty + self:GetAbility():GetSpecialValueFor("max_attack_range") - self:GetParent():GetAttackRange()
	end

	if IsServer() then
		local damage_table = {}

	    damage_table.attacker = self:GetParent()
	    damage_table.victim = self:GetParent()
	    damage_table.damage_type = DAMAGE_TYPE_PURE
	    damage_table.damage = (self:GetParent():GetHealth() * self:GetAbility():GetSpecialValueFor("health_pct_drain") * self.think * 0.01)

    	ApplyDamage(damage_table)
	end
end

function modifier_cursed_rapier_toggle:DeclareFunctions()
    local decFuns =
    {
		MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_DISABLE_HEALING
    }
    return decFuns
end

function modifier_cursed_rapier_toggle:GetModifierAttackRangeBonus()
	return self.range_penalty
end

function modifier_cursed_rapier_toggle:GetModifierPreAttack_BonusDamage()
	return self:GetAbility():GetSpecialValueFor("bonus_damage_toggle")
end

function modifier_cursed_rapier_toggle:GetDisableHealing()
	return 1
end