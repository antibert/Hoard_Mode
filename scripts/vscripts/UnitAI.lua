function BehaviorOrbit:Think(dt)
        local currentPos = thisEntity:GetOrigin()
        currentPos.z = 0
 
        if ( self.order.Position - currentPos ):Length() < 500 then
                self:GetNextPosition()
        end
        if self.order.OrderType ~= DOTA_UNIT_ORDER_ATTACK_MOVE then
       
                self.order =
                {
                        OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
                        UnitIndex = thisEntity:entindex(),
                        Position = hAncient:GetOrigin()
                }
       
        end
end