LinkLuaModifier("modifier_item_voodoo_lua", "items/modifiers/modifier_item_voodoo_lua.lua", LUA_MODIFIER_MOTION_NONE)

function voodoo_item_start( keys )
	local caster = keys.caster
	local ability = keys.ability
  local target = keys.target
	local ability_level = ability:GetLevel() - 1
  local radius = ability:GetLevelSpecialValueFor("radius", ability_level)
	local duration = ability:GetLevelSpecialValueFor("duration", ability_level)
	
  local units = FindUnitsInRadius(caster:GetTeam(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
  
	for _,unit in pairs(units) do
        if unit:IsIllusion() then
		  unit:ForceKill(true)
	    else
          unit:AddNewModifier(caster, ability, "modifier_item_voodoo_lua", {duration = duration})
	    end
	end
    
	keys.target:EmitSound("DOTA_Item.Sheepstick.Activate")	
end