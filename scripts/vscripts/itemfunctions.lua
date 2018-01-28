if itemFunctions == nil then
	print ( '[ItemFunctions] creating itemFunctions' )
	itemFunctions = {} -- Creates an array to let us beable to index itemFunctions when creating new functions
	itemFunctions.__index = itemFunctions
end

function itemFunctions:new() -- Creates the new class
	print ( '[ItemFunctions] itemFunctions:new' )
	o = o or {}
	setmetatable( o, itemFunctions )
	return o
end

function itemFunctions:start() -- Runs whenever the itemFunctions.lua is ran
	print('[ItemFunctions] itemFunctions started!')

	--start a thinker for gold bags.
	--emulates the same behavior as the "AutoUse" function of items, without interrupting channels or invisiblity. should also be able to pick them up while magic immune.
	self.goldBags = self.goldBags or {}
	self.goldBagThinker = self.goldBagThinker or SpawnEntityFromTableSynchronous("info_target", {targetname="goldBagThinker"})
	self.goldBagThinker:SetThink("GoldBagHandler", self)
end

function DropItemOnDeath(keys) -- keys is the information sent by the ability
	print( '[ItemFunctions] DropItemOnDeath Called' )
	local killedUnit = EntIndexToHScript( keys.caster_entindex ) -- EntIndexToHScript takes the keys.caster_entindex, which is the number assigned to the entity that ran the function from the ability, and finds the actual entity from it.
	local itemName = tostring(keys.ability:GetAbilityName()) -- In order to drop only the item that ran the ability, the name needs to be grabbed. keys.ability gets the actual ability and then GetAbilityName() gets the configname of that ability such as juggernaut_blade_dance.
	if killedUnit:IsHero() or killedUnit:HasInventory() then -- In order to make sure that the unit that died actually has items, it checks if it is either a hero or if it has an inventory.
		for itemSlot = 0, 5, 1 do --a For loop is needed to loop through each slot and check if it is the item that it needs to drop
			if killedUnit ~= nil then --checks to make sure the killed unit is not nonexistent.
				local Item = killedUnit:GetItemInSlot( itemSlot ) -- uses a variable which gets the actual item in the slot specified starting at 0, 1st slot, and ending at 5,the 6th slot.
				if Item ~= nil and Item:GetName() == itemName then -- makes sure that the item exists and making sure it is the correct item
					local newItem = CreateItem(itemName, nil, nil) -- creates a new variable which recreates the item we want to drop and then sets it to have no owner
					CreateItemOnPositionSync(killedUnit:GetOrigin(), newItem) -- takes the newItem variable and creates the physical item at the killed unit's location
					killedUnit:RemoveItem(Item) -- finally, the item is removed from the original units inventory.
				end
			end
		end
	end
end

function ToggleLuaModifier(keys)
	local locCaster = EntIndexToHScript( keys.caster_entindex ) -- EntIndexToHScript takes the keys.caster_entindex, which is the number assigned to the entity that ran the function from the ability, and finds the actual entity from it.
	local locAbility = keys.ability
	local cleanUp = false

	if keys.cleanUp ~= nil and keys.cleanUp == true then
		local cleanUp = keys.cleanUp
	end

	local modifier = keys.modifier
	local modifierPath = keys.modifierPath

	LinkLuaModifier(modifier, modifierPath, LUA_MODIFIER_MOTION_NONE)

	if IsServer() then
		if locCaster:HasModifier(modifier) then
			locCaster:RemoveModifierByName(modifier)
		elseif not cleanUp then
			locCaster:AddNewModifier(locCaster, locAbility, modifier, {})
		end
	end
end

function itemFunctions:GoldBagHandler()
	local searchRadius = 150 --melee range

	if self.goldBags then
		--iterate through our recorded gold bag drops
		for k,v in pairs(self.goldBags) do

			--make sure the bag still exists in C++
			local bag = v
			if not bag or bag:IsNull() then
				bag = EntIndexToHScript(k)
			end
			if bag and not bag:IsNull() then

				--search for nearby heroes to pick up this bag
				for l,m in pairs(FindUnitsInRadius(DOTA_TEAM_GOODGUYS, bag:GetContainer():GetAbsOrigin(), nil, searchRadius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)) do

					local amount_to_give = bag:GetCurrentCharges()
					local player = PlayerResource:GetPlayer( m:GetPlayerID() )
					local symbol = 0 -- "+" presymbol
					local color = Vector(255, 200, 33) -- Gold
					local lifetime = 2
					local digits = string.len(amount_to_give) + 1
					local particleName = "particles/units/heroes/hero_alchemist/alchemist_lasthit_msg_gold.vpcf"
					local particle = ParticleManager:CreateParticleForPlayer(particleName, PATTACH_ABSORIGIN, m, player)
					ParticleManager:SetParticleControl(particle, 1, Vector(symbol, amount_to_give, symbol))
					ParticleManager:SetParticleControl(particle, 2, Vector(lifetime, digits, 0))
					ParticleManager:SetParticleControl(particle, 3, color)

					for playerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
						if PlayerResource:IsValidPlayerID(playerID) then
							PlayerResource:ModifyGold(playerID, amount_to_give, true, DOTA_ModifyGold_SharedGold)
							EmitSoundOnClient("General.Coins", PlayerResource:GetPlayer(playerID))
						end
					end

					--this bag has been picked up, delete it from C++
					bag:SetCurrentCharges(0)
					self:RemoveBag(bag)

					--aesthetic delay between each bag pick up, replace this with 'break' if not wanted. (all bags will be activated at the same time) 
					return 0.085
					--break
				end
			else
				self.goldBags[k] = nil
			end
		end
	end

	--think interval
	return 0.2
end

--keys.max_distance | the max distance we should search for a bag
--keys.max_duration | the max travel time for LaunchLoot. --this probably isnt needed, its just a precautionary measure.
function AddBags(keys)
	--wait until all the bags have hit the ground.
	Timers:CreateTimer(keys.max_duration or 0, function()
		if itemFunctions.goldBags then
			for k,v in pairs(Entities:FindAllInSphere(keys.caster:GetAbsOrigin(), keys.max_distance)) do
				--is this an item?
				local item = v.GetContainedItem and v:GetContainedItem()
				if item then
					--is this a gold bag thats not already recorded?
					if not itemFunctions.goldBags[item:entindex()] and item:GetName() == "item_bag_of_gold_datadriven" then
						itemFunctions.goldBags[item:entindex()] = item
					end
				end
			end
		end
	end)
end

function itemFunctions:RemoveBag(item)
	if item then
		if self.goldBags then
			self.goldBags[item:entindex()] = nil
		end
		if item.GetContainer and item:GetContainer() then
			item:GetContainer():RemoveSelf()
		end
		item:RemoveSelf()
	end
end

--ensure this function is called at runtime.
itemFunctions:start()