--[[
Map Boss AI
]]
require( "ai_core" )

behaviorSystem = {} -- create the global so we can assign to it

function Spawn( entityKeyValues )
	thisEntity:SetContextThink( "AIThink", AIThink, 0.25 )
	behaviorSystem = AICore:CreateBehaviorSystem( { BehaviorAttackAncient } )--, BehaviorRun }-- } )
end

function AIThink()
	if thisEntity:IsNull() or not thisEntity:IsAlive() then
		return nil -- deactivate this think function
	end
	return behaviorSystem:Think()
end

BehaviorAttackAncient = {}

function BehaviorAttackAncient:Evaluate()
	local desire = 0
	
	local nonAAFriendCount = 0
	local allFriends = FindUnitsInRadius( DOTA_TEAM_BADGUYS, thisEntity:GetOrigin(), nil, -1, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0, false )
	for _,friend in pairs(allFriends) do
		if not friend:IsNull() and friend:IsAlive() and friend:GetUnitName() ~= "npc_dota_creature_ancient_apparition" then
			nonAAFriendCount = nonAAFriendCount + 1
		end
	end

	if nonAAFriendCount < 3 then
		desire = 3
	end

	return desire
end

function BehaviorAttackAncient:Begin()
	self.endTime = GameRules:GetGameTime() + 5
	local hAncient = Entities:FindByName( nil, thisEntity.Target )
	self.order =
	{
		OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
		UnitIndex = thisEntity:entindex(),
		Position = hAncient:GetOrigin()
	}
end

BehaviorAttackAncient.Continue = BehaviorAttackAncient.Begin

function BehaviorAttackAncient:Think(dt)
end