-------------------------------------------
LinkLuaModifier("modifier_item_resonant_shard_passive", "items/item_resonant_shard.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_resonant_shard_cooldown", "items/item_resonant_shard.lua", LUA_MODIFIER_MOTION_NONE)
-------------------------------------------

item_resonant_shard = item_resonant_shard or class({})
-------------------------------------------
function item_resonant_shard:GetIntrinsicModifierName()
    return "modifier_item_resonant_shard_passive"
end

-- function item_resonant_shard:GetAbilityTextureName()
--    return "item_resonant_shard"
-- end

-------------------------------------------
modifier_item_resonant_shard_passive = modifier_item_resonant_shard_passive or class({})
function modifier_item_resonant_shard_passive:IsDebuff() return false end
function modifier_item_resonant_shard_passive:IsHidden() return true end
function modifier_item_resonant_shard_passive:IsPermanent() return true end
function modifier_item_resonant_shard_passive:IsPurgable() return false end
function modifier_item_resonant_shard_passive:IsPurgeException() return false end
function modifier_item_resonant_shard_passive:IsStunDebuff() return false end
function modifier_item_resonant_shard_passive:RemoveOnDeath() return false end
function modifier_item_resonant_shard_passive:AllowIllusionDuplicate() return false end
function modifier_item_resonant_shard_passive:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_item_resonant_shard_passive:DeclareFunctions()
    local decFuns =
    {
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_MAGICAL,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
    return decFuns
end

function modifier_item_resonant_shard_passive:GetModifierBonusStats_Strength()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_resonant_shard_passive:GetModifierBonusStats_Agility()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_resonant_shard_passive:GetModifierBonusStats_Intellect()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_resonant_shard_passive:GetModifierProcAttack_BonusDamage_Magical()
    if self:GetParent():IsIllusion() then return end
    return self:GetAbility():GetSpecialValueFor("bonus_magical_damage") end

function modifier_item_resonant_shard_passive:OnAttackLanded(keys)
    if IsServer() then
        local parent = self:GetParent()
        local ability = self:GetAbility()
        local chance = ability:GetSpecialValueFor("trigger_chance_pct")

        if math.random(100) <= chance then
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

            if (not parent:HasModifier("modifier_item_resonant_shard_cooldown")) and parent:IsRealHero() then
                parent:AddNewModifier(parent, ability, "modifier_item_resonant_shard_cooldown", {duration = ability:GetSpecialValueFor("internal_cooldown")})

                local damage_table = {}
                local radius = 200
                local multiplier = 1.0
                -- local particle_name = nil -- if defining separate particles for melee and ranged attackers

                if parent:IsRangedAttacker() then
                    radius = ability:GetSpecialValueFor("radius_ranged")
                    multiplier = ability:GetSpecialValueFor("ranged_dmg_multiplier")
                else
                    radius = ability:GetSpecialValueFor("radius_melee")
                    multiplier = ability:GetSpecialValueFor("melee_dmg_multiplier")
                end

                local particle_name = "particles/units/heroes/hero_brewmaster/brewmaster_storm_attack_explosion.vpcf"
                local particle_willful_fx = ParticleManager:CreateParticle(particle_name, PATTACH_POINT_FOLLOW, target)
                ParticleManager:SetParticleControl(particle_willful_fx, 0, Vector(radius, 2, radius*2))
                ParticleManager:SetParticleControlEnt(particle_willful_fx, 3, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
                ParticleManager:ReleaseParticleIndex(particle_willful_fx)

                damage_table.attacker = parent
                damage_table.damage_type = DAMAGE_TYPE_MAGICAL
                damage_table.ability = ability
                damage_table.damage = keys.damage * multiplier

                local unitsToDamage = {unpack(FindUnitsInRadius(parent:GetTeam(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, 1, false), 2)}

                for _,v in ipairs(unitsToDamage) do
                    damage_table.victim = v
                    ApplyDamage(damage_table)
                end
            end
        end
    end
end

modifier_item_resonant_shard_cooldown = modifier_item_resonant_shard_cooldown or class({})
function modifier_item_resonant_shard_cooldown:IsHidden() return false end
function modifier_item_resonant_shard_cooldown:IsDebuff() return false end
function modifier_item_resonant_shard_cooldown:IsPurgable() return false end
function modifier_item_resonant_shard_cooldown:IsPermanent() return true end

function modifier_item_resonant_shard_cooldown:GetTexture()
    return "item_resonant_shard"
end
