
--[[Dota's Boot Priority
1-Travel2 
2-Travel	
3-Guardian
4-Power
5-Arcane
6-Phase
7-Tranq
8-Brown
---------
Every time meepo prime performs any action related to his inventory his clone's boots update
this function runs after that and replaces the boots with the highest priority item found in primes inventory]]

-- weird bug where if you perform an action related to Primes inventory it wont actually update clones boots
function UpdateMeepoBoots()
	-- 1 is highest priority
  local bootPrio = {
    ["item_travel_boots_3"] = 1,
    ["item_travel_boots_2"] = 2,
    ["item_travel_boots"]   = 3,
    ["item_guardian_greaves"] = 4,
	  ["item_boots_of_strength"] = 5,
	  ["item_boots_of_agility"] = 6,
	  ["item_boots_of_intellect"] = 7,
	  ["item_boots_of_power"] = 8,
    ["item_power_treads"]   = 9,
    ["item_arcane_boots"]   = 10,
    ["item_phase_boots"]    = 11,
    ["item_tranquil_boots"] = 12,
    ["item_boots"]          = 13,
  }
	local primeItems = {}
	local currentBoot = nil
	local currentPrio = TableCount(bootPrio)

	local heroes = HeroList:GetAllHeroes()
	for _,hero in pairs(heroes) do
		if hero:HasModifier("modifier_meepo_divided_we_stand") then
			-- this should always happen first, meepo prime is a lower # in the herolist than his clones
			if hero.firstMeepo then
				-- record meepo prime's items
				for i=0,DOTA_ITEM_MAX-1 do
					local item = hero:GetItemInSlot(i)
					if item then
						table.insert(primeItems, i, item)
					end
				end
				-- determine which boot they should get
				for _,item in pairs(primeItems) do
					if item then
						for name,prio in pairs(bootPrio) do
							if item:GetName() == name then
								if currentPrio > prio then
									currentBoot = item
									currentPrio = prio
								end
							end
						end
					end
				end
			else
				-- give the clone prime's boot if they don't already have it
				if TableCount(primeItems) > 0 and currentBoot then
					local item
					for i=0,DOTA_ITEM_MAX-1 do
						if hero:GetItemInSlot(i) then
							item = hero:GetItemInSlot(i)
							-- clone already has item
							if item:GetName() == currentBoot:GetName() then
								--print("returning")
								return true
							else
							-- clone has wrong item
								--print("destroy")
								item:Destroy()
								item = nil
							end
						end
					end
					if not item then
						--print('new item')
						-- create new boot
						local newboot = hero:AddItem(CreateItem(currentBoot:GetName(), hero, hero))
						-- move the new boot to the same slot as meepo prime
						hero:SwapItems(PlayerResource:GetSelectedHeroEntity(hero:GetPlayerID()):GetSlot(currentBoot), hero:GetSlot(newboot))
					end
					--print("item already exists")
				end
			end
		end
	end
end

--Required Functions
function TableCount(t)
  local count = 0
  if type(t) == "table" then
    for k,v in pairs(t) do
      count = count+1
    end
  end
  return count
end

function CDOTA_BaseNPC:GetSlot(item)
  for i = 0,DOTA_ITEM_MAX-1 do
    local itemInSlot = self:GetItemInSlot(i)
    if item == itemInSlot then
      return i
    end
  end
  return nil
end
