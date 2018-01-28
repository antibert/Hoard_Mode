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
        MODIFIER_EVENT_ON_ATTACK
    }
    return decFuns
end

function modifier_item_willful_resonance_passive:GetModifierBonusStats_Strength()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_willful_resonance_passive:GetModifierBonusStats_Agility()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_willful_resonance_passive:GetModifierBonusStats_Intellect()
    return self:GetAbility():GetSpecialValueFor("bonus_all_stats") end

function modifier_item_willful_resonance_passive:OnAttack(keys)
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
        if (not target:IsHero() and not target:IsCreep()) or target:GetTeam() == parent:GetTeam() then
            return end

        if not parent:HasModifier("modifier_item_willful_resonance_cooldown") and parent:IsRealHero() then
            parent:AddNewModifier(parent, ability, "modifier_item_willful_resonance_cooldown", {duration = ability:GetSpecialValueFor("internal_cooldown")})

            local projectileTable = {
                Ability = ability,
                Source = parent,
                bDeleteOnHit = false,
                bHasFrontalCone = false,
                bReplaceExisting = false,
                bProvidesVision = true,
                iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
                iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
                iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
            }

            local radiusRanged = ability:GetSpecialValueFor("radius_ranged")
            local radiusMelee = ability:GetSpecialValueFor("radius_melee")

            if parent:IsRangedAttacker() then
                projectileTable.EffectName = "particles/units/heroes/hero_magnataur/magnataur_shockwave.vpcf"
                local distance = (parent:GetAbsOrigin() - target:GetAbsOrigin()):Length()
                local min_distance = ability:GetSpecialValueFor("distance_ranged")
                if distance < min_distance then distance = min_distance end
                projectileTable.vSpawnOrigin = parent:GetAbsOrigin() + (target:GetAbsOrigin() - parent:GetAbsOrigin()):Normalized() * 50
                projectileTable.fDistance = distance
                projectileTable.fStartRadius = radiusRanged
                projectileTable.fEndRadius = radiusRanged
                projectileTable.iVisionRadius = radiusRanged

            else
                projectileTable.EffectName = "particles/econ/items/magnataur/shock_of_the_anvil/magnataur_shockanvil.vpcf"
                projectileTable.vSpawnOrigin = parent:GetAbsOrigin() + (target:GetAbsOrigin() - parent:GetAbsOrigin()):Normalized() * 100
                projectileTable.fDistance = ability:GetSpecialValueFor("distance_melee")
                projectileTable.fStartRadius = radiusMelee
                projectileTable.fEndRadius = radiusMelee * 1.5
                projectileTable.iVisionRadius = radiusMelee
            end

            -- Set the direction and speed
            local speed = 2000
            projectileTable.vVelocity = (target:GetAbsOrigin() - parent:GetAbsOrigin()):Normalized() * speed

            -- Launch the projectile
            ProjectileManager:CreateLinearProjectile( projectileTable )
        end
    end
end

function item_willful_resonance:OnProjectileHit( target, location )
    if IsServer() then
        caster = self:GetCaster()
        if target == caster then
            return false
        end

        if target ~= nil then
            if target:GetTeamNumber() ~= caster:GetTeamNumber() then
                local multiplier = self:GetSpecialValueFor("melee_dmg_multiplier")
                if caster:IsRangedAttacker() then
                    multiplier = self:GetSpecialValueFor("ranged_dmg_multiplier")
                end
                local damage = 0.5 * (caster:GetBaseDamageMin() + caster:GetBaseDamageMax()) * multiplier

                local damageTable = {
                        victim = target,
                        attacker = caster,
                        damage = damage,
                        damage_type = DAMAGE_TYPE_MAGICAL,     
                        ability = this
                    }

                ApplyDamage( damageTable )
            end
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
