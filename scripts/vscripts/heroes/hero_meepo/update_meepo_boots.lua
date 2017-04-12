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
Every time meepo prime performs any action related to items his clone's boots update
this function runs after that and replaces the clones boots with the highest priority item found in prime's inventory]]
function UpdateMeepoBoots(orderType)
  -- if ordertype is not related to items then do nothing
  if not orderType == DOTA_UNIT_ORDER_DROP_ITEM
  or not orderType == DOTA_UNIT_ORDER_GIVE_ITEM
  or not orderType == DOTA_UNIT_ORDER_PICKUP_ITEM
  or not orderType == DOTA_UNIT_ORDER_PURCHASE_ITEM
  or not orderType == DOTA_UNIT_ORDER_SELL_ITEM
  or not orderType == DOTA_UNIT_ORDER_DISASSEMBLE_ITEM
  or not orderType == DOTA_UNIT_ORDER_MOVE_ITEM
  or not orderType == DOTA_UNIT_ORDER_EJECT_ITEM_FROM_STASH then
    return true
  end

  --[[ 1 is highest priority
  the contents of this table decide what items meepo clones can use]]
  local bootPrio = {
    ["item_travel_boots_2"] = 1,
    ["item_travel_boots"]   = 2,
    ["item_guardian_greaves"] = 3,
    ["item_power_treads"]   = 4,
    ["item_arcane_boots"]   = 5,
    ["item_phase_boots"]    = 6,
    ["item_tranquil_boots"] = 7,
    ["item_boots"]          = 8,
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
        -- give the clone prime's boots if they dont already have them
        if currentBoot then 
          local itemFound = nil
          if TableCount(primeItems) > 0 then
            for i=0,DOTA_ITEM_MAX-1 do
              local item = hero:GetItemInSlot(i)
              if item then
                if item:GetName() == currentBoot:GetName() then return true end
                itemFound = item
              end
            end
            if itemFound then
              -- remove clone's current boots
              itemFound:Destroy()
              -- grab the slot of boots in meepo prime's inventory
              local slot = PlayerResource:GetSelectedHeroEntity(hero:GetPlayerID()):GetSlot(currentBoot)
              -- create new boots
              local newboots = hero:AddItem(CreateItem(currentBoot:GetName(), hero, hero))
              -- move the new boots to the same slot as meepo prime
              hero:SwapItems(slot, hero:GetSlot(newboots))
            end
          end
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