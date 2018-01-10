--[[	Adapted from: Dota IMBA, AtroCty
	]]
-------------------------------------------
--			AETHER LENS
-------------------------------------------
LinkLuaModifier("modifier_aether_lens_passive", "items/item_aether_lens.lua", LUA_MODIFIER_MOTION_NONE)
-------------------------------------------

item_aether_lens_2 = item_aether_lens_2 or class({})
-------------------------------------------
function item_aether_lens_2:GetIntrinsicModifierName()
    return "modifier_aether_lens_passive"
end

function item_aether_lens_2:GetAbilityTextureName()
   return "item_aether_lens_2"
end

item_aether_lens_3 = item_aether_lens_3 or class({})
-------------------------------------------
function item_aether_lens_3:GetIntrinsicModifierName()
    return "modifier_aether_lens_passive"
end

function item_aether_lens_3:GetAbilityTextureName()
   return "item_aether_lens_3"
end

item_aether_lens_4 = item_aether_lens_4 or class({})
-------------------------------------------
function item_aether_lens_4:GetIntrinsicModifierName()
    return "modifier_aether_lens_passive"
end

function item_aether_lens_4:GetAbilityTextureName()
   return "item_aether_lens_4"
end

item_aether_lens_5 = item_aether_lens_5 or class({})
-------------------------------------------
function item_aether_lens_5:GetIntrinsicModifierName()
    return "modifier_aether_lens_passive"
end

function item_aether_lens_5:GetAbilityTextureName()
   return "item_aether_lens_5"
end

-------------------------------------------
modifier_aether_lens_passive = modifier_aether_lens_passive or class({})
function modifier_aether_lens_passive:IsDebuff() return false end
function modifier_aether_lens_passive:IsHidden() return true end
function modifier_aether_lens_passive:IsPermanent() return true end
function modifier_aether_lens_passive:IsPurgable() return false end
function modifier_aether_lens_passive:IsPurgeException() return false end
function modifier_aether_lens_passive:IsStunDebuff() return false end
function modifier_aether_lens_passive:RemoveOnDeath() return false end
function modifier_aether_lens_passive:GetAttributes() return MODIFIER_ATTRIBUTE_NONE end

function modifier_aether_lens_passive:OnCreated()
	local item = self:GetAbility()
	self.parent = self:GetParent()
	if self.parent:IsHero() and item then
		self.bonus_mana = item:GetSpecialValueFor("bonus_mana")
		self.bonus_mana_regen = item:GetSpecialValueFor("bonus_mana_regen")
		self.cast_range_bonus = item:GetSpecialValueFor("cast_range_bonus")
		self.spell_power = item:GetSpecialValueFor("spell_power")
	end
end

function modifier_aether_lens_passive:DeclareFunctions()
    local decFuns =
    {
		MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING,
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
		MODIFIER_PROPERTY_MANA_BONUS,
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT
    }
    return decFuns
end

function modifier_aether_lens_passive:GetModifierSpellAmplify_Percentage()
	return self.spell_power
end

function modifier_aether_lens_passive:GetModifierConstantManaRegen()
	return self.bonus_mana_regen
end

function modifier_aether_lens_passive:GetModifierManaBonus()
	return self.bonus_mana
end

function modifier_aether_lens_passive:GetModifierCastRangeBonusStacking()
	return self.cast_range_bonus
end