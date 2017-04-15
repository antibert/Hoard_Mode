function Malefice( keys )
    local caster = keys.caster
    local ability = keys.ability
    local target = keys.target
    local radius = ability:GetSpecialValueFor("radius")

    if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
        return
    end

    local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
    for _,unit in pairs(units) do
        ability:ApplyDataDrivenModifier(caster, target, "modifier_malefice_datadriven", {})
    end
end