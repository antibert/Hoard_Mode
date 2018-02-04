function GrantSacredTridentProc( keys )
	local caster = keys.caster
	local ability = keys.ability

	if (caster:IsRealHero() or (caster:IsConsideredHero() and not caster:IsIllusion())) and caster:HasInventory() then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_sacred_trident_proc_hero", {})
	elseif caster:IsIllusion() then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_sacred_trident_proc_illusion", {})
	end
end