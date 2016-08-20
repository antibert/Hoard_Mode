--[[ Author: Hewdraw ]]

function MagicStickActivate(keys)
	keys.caster:EmitSound("DOTA_Item.MagicStick.Activate")
	
	local amount_to_restore = keys.ability:GetCurrentCharges() * keys.ability:GetLevelSpecialValueFor("restore_per_charge", keys.ability:GetLevel() - 1)
	keys.caster:Heal(amount_to_restore, keys.caster)
	keys.caster:GiveMana(amount_to_restore)
	
	keys.ability:SetCurrentCharges(0)
end

function MagicStickCharge(keys)
	local ability = keys.ability
	local caster = keys.caster
	local oldest_unfilled_stick = nil

	if caster:IsRealHero() and ability ~= nil then
		local max_charges = keys.ability:GetLevelSpecialValueFor("max_charges", keys.ability:GetLevel() - 1)

		for i=0, 5, 1 do
			local current_item = keys.caster:GetItemInSlot(i)
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
		end
	end
end