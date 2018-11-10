--[[ ============================================================================================================
	Author: Rook
	Date: January 26, 2015

	Modified by: SiEgE
================================================================================================================= ]]
function modifier_item_ultimate_scepter_2_on_created(keys)
	if not keys.caster:HasModifier("modifier_item_ultimate_scepter_consumed") then
		keys.caster:AddNewModifier(keys.caster, nil, "modifier_item_ultimate_scepter_consumed", {duration = -1})
	else 
		-- If the host had a "consumed" modifier before we even had a chance to apply our own modifier - he have an alchemist's aghs.
		if keys.caster.hadScepterUpgrade == nil
	       and (keys.caster.hadUltimateScepters == nil 
		   or keys.caster.hadUltimateScepters == 0) then

	        -- Apply the alchemist's aghanim mod tag
			keys.caster.hadScepterUpgrade = 1
			return
		elseif keys.caster.hadScepterUpgrade == 1 then
			return
		end
	end

	-- Increment the scepter amount tag
	if keys.caster.hadUltimateScepters == nil or keys.caster.hadUltimateScepters == 0 then
		keys.caster.hadUltimateScepters = 1
	else
		keys.caster.hadUltimateScepters = keys.caster.hadUltimateScepters + 1
	end
end

function modifier_item_ultimate_scepter_2_on_destroy(keys)
	if keys.caster.hadScepterUpgrade ~= nil then
		return
	end

	local num_scepters_in_inventory = 0

	for i=0, 5, 1 do  --Search for Aghanim's Scepters in the player's inventory.
		local current_item = keys.caster:GetItemInSlot(i)

		if current_item ~= nil then
			local item_name = current_item:GetName()
			
			if item_name == "item_ultimate_scepter_2" then
				num_scepters_in_inventory = num_scepters_in_inventory + 1
			end
		end
	end

	keys.caster.hadUltimateScepters = keys.caster.hadUltimateScepters - 1

	--Remove the stock Aghanim's Scepter modifier if the player no longer has a scepter in their inventory.
	if (num_scepters_in_inventory == 0 
		or (keys.caster.hadUltimateScepters == 0)) 
	    and keys.caster:HasModifier("modifier_item_ultimate_scepter_consumed") then
		keys.caster:RemoveModifierByName("modifier_item_ultimate_scepter_consumed")
	end
end