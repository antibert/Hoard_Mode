--[[Author: YOLOSPAGHETTI
	Date: February 5, 2016
	Puts Riki behind the target, if the target is an enemy, applies the bonus damage, 
	and queues up an attack order on the target]]
function BlinkStrike( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local sound = keys.sound
	local particle = keys.particle
	local ability_level = ability:GetLevel() - 1

	if target:GetTeam() ~= caster:GetTeam() and target:TriggerSpellAbsorb(ability) then
		return
	end

	EmitSoundOn("Hero_Riki.Blink_Strike", caster)

	-- Ability variables
	local bonus_damage = ability:GetLevelSpecialValueFor("bonus_damage", ability_level)
	local radius = ability:GetLevelSpecialValueFor("radius", ability_level)
	local victim_angle = target:GetAnglesAsVector()
	local victim_forward_vector = target:GetForwardVector()
	
	-- Angle and positioning variables
	local victim_angle_rad = victim_angle.y*math.pi/180
	local victim_position = target:GetAbsOrigin()
	local attacker_new = Vector(victim_position.x - 100 * math.cos(victim_angle_rad), victim_position.y - 100 * math.sin(victim_angle_rad), 0)
	
	
	-- Sets Riki behind the victim and facing it
	caster:SetAbsOrigin(attacker_new)
	FindClearSpaceForUnit(caster, attacker_new, true)
	caster:SetForwardVector(victim_forward_vector)

	local target_type = ability:GetAbilityTargetType()
	local target_team = DOTA_UNIT_TARGET_TEAM_ENEMY
	local target_flags = ability:GetAbilityTargetFlags()
	local targets = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, target_team, target_type, target_flags, 0, false)

	for _,target in pairs(targets) do
		ProcBackstab(caster, target, sound, particle, bonus_damage)
	end

	-- Order the caster to attack the target
	-- Necessary on jumps to allies as well (does not actually attack), otherwise Riki will turn back to his initial angle
	local order =
	{
		UnitIndex = caster:entindex(),
		OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
		TargetIndex = target:entindex(),
		AbilityIndex = ability,
		Queue = true
	}

	ExecuteOrderFromTable(order)
end

--[[Author: YOLOSPAGHETTI
	Date: February 4, 2016
	Riki backstabs the target]]
function ProcBackstab(caster, target, sound, particle, bonus_damage)
	local cloak_and_dagger = caster:FindAbilityByName("riki_permanent_invisibility")
	local ability_level = cloak_and_dagger:GetLevel() - 1

	if ability_level > -1 then
		local agility_damage_multiplier = cloak_and_dagger:GetLevelSpecialValueFor("damage_multiplier", ability_level) / 100

		-- Play the sound on the victim.
		EmitSoundOn(sound, target)
		-- Create the back particle effect.
		local particle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, target)
		-- Set Control Point 1 for the backstab particle; this controls where it's positioned in the world. In this case, it should be positioned on the victim.
		ParticleManager:SetParticleControlEnt(particle, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
		-- Apply extra backstab damage based on Riki's agility
		ApplyDamage({victim = target, attacker = caster, damage = caster:GetAgility() * agility_damage_multiplier + bonus_damage, damage_type = cloak_and_dagger:GetAbilityDamageType()})
	elseif bonus_damage > 0 then
		-- Apply extra backstab damage based on Riki's agility
		ApplyDamage({victim = target, attacker = caster, damage = bonus_damage, damage_type = cloak_and_dagger:GetAbilityDamageType()})
	end
end