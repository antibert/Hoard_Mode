require( "libraries/popups")

--[[Arcane Orb
	Author: chrislotix
	Date: 05.01.2015.]]

function ArcaneOrb( keys )
	local ability = keys.ability
	local caster = keys.caster
	local mana = caster:GetMana()
	local target = keys.target
	local targetLocation = target:GetAbsOrigin()
	local radius = ability:GetSpecialValueFor("scepter_radius")
	local splash = ability:GetSpecialValueFor("scepter_splash_pct") / 100
	local summon_damage = ability:GetLevelSpecialValueFor("illusion_damage", (ability:GetLevel() -1))
	local extra_damage = ability:GetLevelSpecialValueFor("mana_pool_damage_pct", (ability:GetLevel() -1)) / 100
	local essence_aura = "obsidian_destroyer_essence_aura"
	local essence_aura_sound = "Hero_ObsidianDestroyer.EssenceAura"
	local essence_aura_particle = "particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_essence_effect.vpcf"
	local has_scepter = caster:HasScepter()

	local damage_table = {}

	damage_table.attacker = caster
	damage_table.damage_type = ability:GetAbilityDamageType()
	damage_table.ability = ability
	damage_table.victim = target


	if target:IsHero() and not target:IsRealHero() or target:IsSummoned() then
		damage_table.damage = mana * extra_damage + summon_damage
	else
		damage_table.damage = mana * extra_damage
	end 

	ApplyDamage(damage_table)

	PopupSpellDamage(target, math.floor(damage_table.damage))

	--[[if has_scepter then]]
		local unitsToDamage = {unpack(FindUnitsInRadius(caster:GetTeam(), targetLocation, nil, radius, ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), DOTA_UNIT_TARGET_FLAG_NONE, 1, false), 2)}
		damage_table.damage = damage_table.damage * splash

		for _,v in ipairs(unitsToDamage) do
			damage_table.victim = v
			ApplyDamage(damage_table)
		end
	--[[end]]

	local essence_aura_ability = caster:FindAbilityByName(essence_aura)
	if essence_aura_ability ~= nil then
		local restore_amount = essence_aura_ability:GetLevelSpecialValueFor("restore_amount", (ability:GetLevel() -1))
		local target_chance = essence_aura_ability:GetLevelSpecialValueFor("restore_chance", (ability:GetLevel() -1))
		local chance = math.random(100)
		if chance < target_chance then
			local max_mana = caster:GetMaxMana() * restore_amount / 100
			local new_mana = caster:GetMana() + max_mana
			if new_mana > caster:GetMaxMana() then
				caster:SetMana(caster:GetMaxMana())
			else
				caster:SetMana(new_mana)
			end

			StartSoundEvent( essence_aura_sound, caster )
			ParticleManager:CreateParticle(essence_aura_particle, PATTACH_ABSORIGIN_FOLLOW, caster)
		end
	end
end

--[[Author: YOLOSPAGHETTI
	Date: 02.02.2016
	Adds stacks to the aesthetic modifiers]]
function AddStacks(keys)
	local ability = keys.ability
	local caster = keys.caster
	local target = keys.target
	local int_steal_modifier = "modifier_arcane_orb_status"
	local int_steal_modifier_target = "modifier_arcane_orb_status_target"
	local int_steal = ability:GetLevelSpecialValueFor("int_gain", (ability:GetLevel() -1))
	local duration = ability:GetLevelSpecialValueFor("steal_duration", (ability:GetLevel() -1))
	
	if(caster:HasModifier(int_steal_modifier)) then
		local stacks = caster:GetModifierStackCount( int_steal_modifier, ability )
		
		-- Adds stacks to the aesthetic modifiers
		ability:ApplyDataDrivenModifier(caster, caster, int_steal_modifier, {Duration = duration})
		caster:SetModifierStackCount( int_steal_modifier, ability, stacks + int_steal )
		ability:ApplyDataDrivenModifier(caster, target, int_steal_modifier_target, {Duration = duration})
		target:SetModifierStackCount( int_steal_modifier_target, ability, stacks + int_steal )
	else
		-- Applies aesthetic stack modifiers to the caster and target
		ability:ApplyDataDrivenModifier(caster, caster, int_steal_modifier, {Duration = duration})
		caster:SetModifierStackCount( int_steal_modifier, ability, int_steal )
		ability:ApplyDataDrivenModifier(caster, target, int_steal_modifier_target, {Duration = duration})
		target:SetModifierStackCount( int_steal_modifier_target, ability, int_steal )
	end
end

--[[Author: YOLOSPAGHETTI
	Date: 02.02.2016
	Removes stacks from the aesthetic modifiers]]
function RemoveStacksTarget(keys)
	local int_steal_modifier_target = "modifier_arcane_orb_status_target"
	local ability = keys.ability
	local int_steal = ability:GetLevelSpecialValueFor("int_gain", (ability:GetLevel() -1))

	if keys.target:HasModifier(int_steal_modifier_target) then
		local previous_stack_count = keys.target:GetModifierStackCount(int_steal_modifier_target, keys.caster)
		if previous_stack_count > int_steal then
			keys.target:SetModifierStackCount(int_steal_modifier_target, keys.caster, previous_stack_count - int_steal)
		else
			keys.target:RemoveModifierByNameAndCaster(int_steal_modifier_target, keys.caster)
		end
	end
end

--[[Author: YOLOSPAGHETTI
	Date: 02.02.2016
	Removes stacks from the aesthetic modifiers]]
function RemoveStacksSelf(keys)
	local int_steal_modifier_target = "modifier_arcane_orb_status"
	local ability = keys.ability
	local int_steal = ability:GetLevelSpecialValueFor("int_gain", (ability:GetLevel() -1))

	if keys.caster:HasModifier(int_steal_modifier_target) then
		local previous_stack_count = keys.caster:GetModifierStackCount(int_steal_modifier_target, keys.caster)
		if previous_stack_count > int_steal then
			keys.caster:SetModifierStackCount(int_steal_modifier_target, keys.caster, previous_stack_count - int_steal)
		else
			keys.caster:RemoveModifierByNameAndCaster(int_steal_modifier_target, keys.caster)
		end
	end
end