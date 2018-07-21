-------------------------------------------
LinkLuaModifier("modifier_item_willful_resonance_passive", "items/item_willful_resonance.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_willful_resonance_cooldown", "items/item_willful_resonance.lua", LUA_MODIFIER_MOTION_NONE)
-------------------------------------------

item_willful_resonance = item_willful_resonance or class({})
-------------------------------------------
function item_willful_resonance:GetIntrinsicModifierName()
    return "modifier_item_willful_resonance_passive"
end

-- function item_willful_resonance:GetAbilityTextureName()
--    return "item_willful_resonance"
-- end

-------------------------------------------
modifier_item_willful_resonance_passive = modifier_item_willful_resonance_passive or class({})
function modifier_item_willful_resonance_passive:IsDebuff() return false end
function modifier_item_willful_resonance_passive:IsHidden() return true end
function modifier_item_willful_resonance_passive:IsPermanent() return true end
function modifier_item_willful_resonance_passive:IsPurgable() return false end
function modifier_item_willful_resonance_passive:IsPurgeException() return false end
function modifier_item_willful_resonance_passive:IsStunDebuff() return false end
function modifier_item_willful_resonance_passive:RemoveOnDeath() return false end
function modifier_item_willful_resonance_passive:AllowIllusionDuplicate() return false end
function modifier_item_willful_resonance_passive:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_item_willful_resonance_passive:DeclareFunctions()
    local decFuns =
    {
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
    return decFuns
end

function modifier_item_willful_resonance_passive:GetModifierBonusStats_Strength()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_willful_resonance_passive:GetModifierBonusStats_Agility()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_willful_resonance_passive:GetModifierBonusStats_Intellect()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_willful_resonance_passive:OnAttackLanded(keys)
    if IsServer() then
        local parent = self:GetParent()
        local ability = self:GetAbility()

        -- If this attack was not performed by the modifier's owner, do nothing
        if parent ~= keys.attacker then
            return end

        -- If this is an illusion, do nothing
        if parent:IsIllusion() then
            return end

        -- If the target is not valid, do nothing either
        local target = keys.target
        if ((not target:IsHero()) and (not target:IsCreep())) or (target:GetTeam() == parent:GetTeam()) then
            return end

        if (not parent:HasModifier("modifier_item_willful_resonance_cooldown")) and parent:IsRealHero() then
            parent:AddNewModifier(parent, ability, "modifier_item_willful_resonance_cooldown", {duration = ability:GetSpecialValueFor("internal_cooldown")})

            local damage_table = {}
            local radius = 200
            local multiplier = ability:GetSpecialValueFor("bonus_magical_damage_multiplier")

            damage_table.attacker = parent
            damage_table.victim = target
            damage_table.damage_type = DAMAGE_TYPE_MAGICAL
            damage_table.ability = ability
            damage_table.damage = keys.damage * multiplier

            ApplyDamage(damage_table)

            if parent:IsRangedAttacker() then
                radius = ability:GetSpecialValueFor("radius_ranged")
                multiplier = ability:GetSpecialValueFor("ranged_dmg_multiplier")
            else
                radius = ability:GetSpecialValueFor("radius_melee")
                multiplier = ability:GetSpecialValueFor("melee_dmg_multiplier")
            end

            damage_table.damage = keys.damage * multiplier

            local unitsToDamage = {unpack(FindUnitsInRadius(parent:GetTeam(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, 1, false), 2)}

            for _,v in ipairs(unitsToDamage) do
                damage_table.victim = v
                ApplyDamage(damage_table)
            end

            local particle_name = "particles/units/heroes/hero_brewmaster/brewmaster_storm_attack_explosion.vpcf"
            local particle_willful_fx = ParticleManager:CreateParticle(particle_name, PATTACH_POINT_FOLLOW, target)
            ParticleManager:SetParticleControl(particle_willful_fx, 0, Vector(radius, 2, radius*2))
            ParticleManager:SetParticleControlEnt(particle_willful_fx, 3, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
            ParticleManager:ReleaseParticleIndex(particle_willful_fx)
        end
    end
end

modifier_item_willful_resonance_cooldown = modifier_item_willful_resonance_cooldown or class({})
function modifier_item_willful_resonance_cooldown:IsHidden() return false end
function modifier_item_willful_resonance_cooldown:IsDebuff() return false end
function modifier_item_willful_resonance_cooldown:IsPurgable() return false end
function modifier_item_willful_resonance_cooldown:IsPermanent() return true end

function modifier_item_willful_resonance_cooldown:GetTexture()
    return "item_willful_resonance"
end
