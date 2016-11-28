--[[Author: Pizzalol
	Date: 04.03.2015.
	Creates additional attack projectiles for units within the specified radius around the caster]]
function SplitShotLaunch( keys )
    local caster = keys.caster
    local caster_location = caster:GetAbsOrigin()
    local ability = keys.ability
    local cooldown = ability:GetCooldown(ability:GetLevel())

    if caster:IsRangedAttacker() and caster:IsRealHero() and ability:IsCooldownReady() then
        ability:StartCooldown(cooldown)

        -- Targeting variables
        local target_type = ability:GetAbilityTargetType()
        local target_team = ability:GetAbilityTargetTeam()
        local target_flags = ability:GetAbilityTargetFlags()
        local attack_target = caster:GetAttackTarget()

        -- Ability variables
        local radius = keys.range
        local max_targets = keys.arrow_count
        local projectile_speed = keys.projectile_speed
        local split_shot_projectile = keys.split_shot_projectile

        local split_shot_targets = FindUnitsInRadius(caster:GetTeam(), caster_location, nil, radius, target_team, target_type, target_flags, FIND_CLOSEST, false)

        -- Create projectiles for units that are not the casters current attack target
        for _,v in pairs(split_shot_targets) do
            if v ~= attack_target and v:CanEntityBeSeenByMyTeam(caster) then
                local projectile_info =
                {
                    EffectName = split_shot_projectile,
                    Ability = ability,
                    vSpawnOrigin = caster_location,
                    Target = v,
                    Source = caster,
                    bHasFrontalCone = false,
                    iMoveSpeed = projectile_speed,
                    bReplaceExisting = false,
                    bProvidesVision = false
                }
                ProjectileManager:CreateTrackingProjectile(projectile_info)
                max_targets = max_targets - 1
            end
            -- If we reached the maximum amount of targets then break the loop
            if max_targets == 0 then break end
        end
    end
end

-- Apply the auto attack damage to the hit unit
function SplitShotDamage( keys )
    local caster = keys.caster
    local target = keys.target
    local ability = keys.ability
    local arrow_damage = keys.arrow_damage
    local damage_table = {}

    damage_table.attacker = caster
    damage_table.victim = target
    damage_table.damage_type = ability:GetAbilityDamageType()
    damage_table.damage = caster:GetAverageTrueAttackDamage(target) * arrow_damage / 100

    ApplyDamage(damage_table)
end