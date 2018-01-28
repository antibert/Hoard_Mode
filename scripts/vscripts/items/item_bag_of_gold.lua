--[[ Author: Hewdraw ]]

function ConsumeBag(keys)
	local amount_to_give = keys.ability:GetCurrentCharges()
	local caster = keys.caster
	local player = PlayerResource:GetPlayer( caster:GetPlayerID() )

	local symbol = 0 -- "+" presymbol
	local color = Vector(255, 200, 33) -- Gold
	local lifetime = 2
	local digits = string.len(amount_to_give) + 1
	local particleName = "particles/units/heroes/hero_alchemist/alchemist_lasthit_msg_gold.vpcf"
	local particle = ParticleManager:CreateParticleForPlayer( particleName, PATTACH_ABSORIGIN, caster, player )
	ParticleManager:SetParticleControl(particle, 1, Vector(symbol, amount_to_give, symbol))
	ParticleManager:SetParticleControl(particle, 2, Vector(lifetime, digits, 0))
	ParticleManager:SetParticleControl(particle, 3, color)

	for playerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
		if PlayerResource:IsValidPlayerID(playerID) then
			PlayerResource:ModifyGold(playerID, amount_to_give, true, DOTA_ModifyGold_SharedGold)
			EmitSoundOnClient( "General.Coins", PlayerResource:GetPlayer(playerID))
		end
	end

	keys.ability:SetCurrentCharges(0)
	itemFunctions:RemoveBag(keys.ability)
end