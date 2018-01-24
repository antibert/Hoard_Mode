-------------------------------------------
LinkLuaModifier("modifier_sacred_trident_passive", "items/item_sacred_trident.lua", LUA_MODIFIER_MOTION_NONE)
-------------------------------------------

item_sacred_trident = item_sacred_trident or class({})
-------------------------------------------
function item_sacred_trident:GetIntrinsicModifierName()
    return "modifier_sacred_trident_passive"
end

function item_sacred_trident:GetAbilityTextureName()
   return "item_sacred_trident"
end

-------------------------------------------
modifier_sacred_trident_passive = modifier_sacred_trident_passive or class({})
function modifier_sacred_trident_passive:IsDebuff() return false end
function modifier_sacred_trident_passive:IsHidden() return true end
function modifier_sacred_trident_passive:IsPermanent() return true end
function modifier_sacred_trident_passive:IsPurgable() return false end
function modifier_sacred_trident_passive:IsPurgeException() return false end
function modifier_sacred_trident_passive:IsStunDebuff() return false end
function modifier_sacred_trident_passive:RemoveOnDeath() return false end
function modifier_sacred_trident_passive:AllowIllusionDuplicate() return true end
function modifier_sacred_trident_passive:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_sacred_trident_passive:OnCreated()
	local item = self:GetAbility()
	self.parent = self:GetParent()
	if self.parent:IsHero() and not self.parent:IsIllusion() and item then
		self.bonus_damage = item:GetSpecialValueFor("bonus_damage")
		self.bonus_attack_speed = item:GetSpecialValueFor("bonus_attack_speed")
		self.pure_damage_proc = item:GetSpecialValueFor("pure_damage_proc")
	elseif self.parent:IsIllusion() and item then
		self.pure_damage_proc = item:GetSpecialValueFor("pure_damage_proc_illusion")
	end
end

function modifier_sacred_trident_passive:DeclareFunctions()
    local decFuns =
    {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PURE
    }
    return decFuns
end

function modifier_sacred_trident_passive:CheckState()
	local state = {
	[MODIFIER_STATE_CANNOT_MISS] = true,
	}

	return state
end

function modifier_sacred_trident_passive:GetModifierPreAttack_BonusDamage()
	return self.bonus_damage
end

function modifier_sacred_trident_passive:GetModifierAttackSpeedBonus_Constant()
	return self.bonus_attack_speed
end

function modifier_sacred_trident_passive:GetModifierProcAttack_BonusDamage_Pure()
	return self.pure_damage_proc
end