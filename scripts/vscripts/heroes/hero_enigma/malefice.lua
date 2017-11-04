function Malefice( keys )
    local caster = keys.caster
    local ability = keys.ability
    local target = keys.target
    local radius = ability:GetSpecialValueFor("radius")

    if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
        return
    end

    local duration = ability:GetSpecialValueFor("duration")
    if caster:HasAbility("special_bonus_unique_enigma_2") then
        local talent = caster:FindAbilityByName("special_bonus_unique_enigma_2")
        if talent:GetLevel()>0 then
            duration = duration + talent:GetSpecialValueFor("value")
        end
    end

    local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
    for _,unit in pairs(units) do
        ability:ApplyDataDrivenModifier(caster, unit, "modifier_malefice_datadriven", { duration = duration })
    end
end
