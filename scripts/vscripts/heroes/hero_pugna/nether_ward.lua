--[[
	Author: Noya
	Date: April 5, 2015
	Damages the target based on the mana spent
]]

function NetherWardZap( event )
	local caster = event.caster
	local target = event.unit -- The unit that spent mana
	local ability = event.ability
	local ward = ability.nether_ward -- Keep track of the ward to attach the particle
	local AbilityDamageType = ability:GetAbilityDamageType()

	local mana_spent
	if target.OldMana then
		mana_spent = target.OldMana - target:GetMana()
	end

	if mana_spent and mana_spent > 0 then
		local mana_multiplier = ability:GetLevelSpecialValueFor("mana_multiplier", ability:GetLevel() - 1 )
		local zap_damage = mana_spent * mana_multiplier

		ApplyDamage({ victim = target, attacker = caster, damage = zap_damage, damage_type = AbilityDamageType })
		print("Dealt "..zap_damage.." = "..mana_spent.." * "..mana_multiplier)

		local attackName = "particles/units/heroes/hero_pugna/pugna_ward_attack.vpcf" -- There are some light/medium/heavy unused versions
		local attack = ParticleManager:CreateParticle(attackName, PATTACH_ABSORIGIN_FOLLOW, ward)
		ParticleManager:SetParticleControl(attack, 1, target:GetAbsOrigin())

		target:EmitSound("Hero_Pugna.NetherWard.Target")
		caster:EmitSound("Hero_Pugna.NetherWard.Attack")
	end
end

--[[
	Author: Noya
	Date: April 5, 2015
	"Nether Ward has 4 HP. Heroes can attack it for 1 damage, while non-hero units deal 0.25 damage."
]]

--[[
	Author: Noya
	Date: April 5, 2015
	Get a point at a distance in front of the caster
]]
function GetFrontPoint( event )
	local caster = event.caster
	local fv = caster:GetForwardVector()
	local origin = caster:GetAbsOrigin()
	local distance = event.Distance
	
	local front_position = origin + fv * distance
	local result = {}
	table.insert(result, front_position)

	return result
end

-- Store all the targets mana and initialize the attack counter of the ward
function NetherWardStart( event )
	local target = event.target
	local ability = event.ability
	local attacks_to_destroy = ability:GetLevelSpecialValueFor("attacks_to_destroy", ability:GetLevel() - 1 )
	target.attack_counter = attacks_to_destroy

	-- This is needed to attach the particle attack. Should be a table if we were dealing with possible multiple wards
	ability.nether_ward = target

	print(target:GetEntityIndex(),target.attack_counter)

	local targets = event.target_entities
	for _,hero in pairs(targets) do
		target.OldMana = target:GetMana()
	end
end

-- Continuously keeps track of all the targets mana
function NetherWardMana( event )
	local targets = event.target_entities

	for _,hero in pairs(targets) do
		hero.OldMana = hero:GetMana()
	end
end

--[[Kill wolves on resummon
	Author: Noya
	Date: 20.01.2015.]]

function KillWard( event )
	local caster = event.caster
	local targets = caster.wards or {}
	local UnitLimit = event.UnitLimit
	local NewUnits = {}
	for _,unit in pairs(targets) do
		if unit and IsValidEntity(unit) and unit:IsAlive() then
			UnitLimit = UnitLimit - 1
			if UnitLimit < 1 then
				unit:ForceKill(true)
				table.remove(caster.wards, _)
			else
				table.insert(NewUnits, unit)
			end
		end
	end

	caster.wards = NewUnits
end

-- Set the units looking at the same point of the caster
function SetUnitsMoveForward( event )
	local caster = event.caster
	local target = event.target

	-- Add the target to a table on the caster handle, to find them later
	table.insert(caster.wards, target)
end

function SelfDetonate( keys )
	local caster = keys.caster

	caster:ForceKill(true)
end

function WardExplode(keys)
	local caster = keys.caster
	local sound_explode = keys.sound_explode
	local particle_explode = keys.particle_explode
	local owner = caster:GetOwnerEntity()

	if owner:HasScepter() then
		local pugna = Entities:FindByName(nil, "npc_dota_hero_pugna")
		local ability = pugna:FindAbilityByName("pugna_nether_blast")
		local ability_level = ability:GetLevel() - 1

		if ability_level >= 0 then
			-- Parameters
			local damage = ability:GetAbilityDamage()
			local radius = ability:GetLevelSpecialValueFor("radius", ability_level)
			local caster_loc = caster:GetAbsOrigin()

			-- Play sound
			caster:EmitSound(sound_explode)

			-- Fire particle
			local explosion_pfx = ParticleManager:CreateParticle(particle_explode, PATTACH_ABSORIGIN, caster)
			ParticleManager:SetParticleControl(explosion_pfx, 0, caster_loc)
			ParticleManager:SetParticleControl(explosion_pfx, 1, Vector(radius,radius,radius))

			-- Find nearby enemies
			local near_units = FindUnitsInRadius(caster:GetTeamNumber(), caster_loc, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_CLOSEST, false)

			-- Damage enemies
			for _,enemy in pairs(near_units) do
				ApplyDamage({attacker = caster, victim = enemy, ability = ability, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL})
			end
		end
	end
end