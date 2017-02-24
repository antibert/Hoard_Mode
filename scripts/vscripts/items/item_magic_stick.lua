--[[ Author: Hewdraw ]]

function MagicStickActivate(keys)
	local caster = keys.caster
	local ability = keys.ability
	caster:EmitSound("DOTA_Item.MagicStick.Activate")
	
	local amount_to_restore = ability:GetCurrentCharges() * ability:GetLevelSpecialValueFor("restore_per_charge", ability:GetLevel() - 1)
	caster:Heal(amount_to_restore, caster)
	caster:GiveMana(amount_to_restore)
	
	ability:SetCurrentCharges(0)
	caster.oldCharges = 0
end

function MagicStickCharge(keys)
	local caster = keys.caster
	local ability = keys.ability
	local oldest_unfilled_stick = nil

	if caster:IsRealHero() and ability ~= nil then
		local max_charges = ability:GetLevelSpecialValueFor("max_charges", ability:GetLevel() - 1)

		for i=0, 5, 1 do
			local current_item = caster:GetItemInSlot(i)
			if current_item ~= nil and current_item:GetName() == "item_hoard_magic_wand" and current_item:GetCurrentCharges() < max_charges then
				if oldest_unfilled_stick == nil or current_item:GetEntityIndex() < oldest_unfilled_stick:GetEntityIndex() then
					oldest_unfilled_stick = current_item
				end
			end
			if current_item ~= nil and current_item:GetName() == "item_hoard_magic_stick" and current_item:GetCurrentCharges() < max_charges then
				if oldest_unfilled_stick == nil or current_item:GetEntityIndex() < oldest_unfilled_stick:GetEntityIndex() then
					oldest_unfilled_stick = current_item
				end
			end
		end

		--Increment the Magic Wand's current charges by 1.
		if oldest_unfilled_stick ~= nil then
			oldest_unfilled_stick:SetCurrentCharges(oldest_unfilled_stick:GetCurrentCharges() + 1)

			if oldest_unfilled_stick:GetName() == "item_hoard_magic_stick" then
				caster.oldCharges = oldest_unfilled_stick:GetCurrentCharges()
			end
		end
	end
end

-- if caster drops stick and has no more sticks, clear stored info
-- if caster has more sticks, update info to match oldest stick
function UpdateStickInfo( keys )
	local caster = keys.caster
	local oldestStick

	if caster ~= nil then
		for i=0, 5, 1 do
			local item = caster:GetItemInSlot(i)
			if item ~= nil and item:GetName() == "item_hoard_magic_stick" and item:GetCurrentCharges() > 0 then
				-- find oldest stick
				if oldestStick == nil or item:GetEntityIndex() < oldestStick:GetEntityIndex() then
					oldestStick = item
				end

				-- update charges to match oldest stick
				caster.oldCharges = oldestStick:GetCurrentCharges()
			else
				caster.oldCharges = nil
			end
		end
	end
end

-- set charges to match oldest stick
function CarryOverStacks( keys )
	local caster = keys.caster
	local wand = keys.ability
	if caster ~= nil and wand ~= nil then
		local oldCharges = caster.oldCharges

		if wand.firstEquip == nil then
			wand.firstEquip = true
		end

		-- set charges if this is the first time current wand has been equipped
		if caster:IsRealHero() then
			if wand.firstEquip and oldCharges ~= nil then
				wand:SetCurrentCharges(oldCharges)
				wand.firstEquip = false
			end
		end
	end
end
