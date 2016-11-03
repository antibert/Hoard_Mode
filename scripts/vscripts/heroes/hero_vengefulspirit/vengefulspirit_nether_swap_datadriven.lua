vengefulspirit_nether_swap_datadriven = class({})
function vengefulspirit_nether_swap_datadriven:GetCooldown( nLevel )
	if self:GetCaster():HasScepter() then
		return self:GetSpecialValueFor( "nether_swap_cooldown_scepter" )
	end

	return self.BaseClass.GetCooldown( self, nLevel )
end

function vengefulspirit_nether_swap_datadriven:OnSpellStart()
	local hCaster = self:GetCaster()
	local hTarget = self:GetCursorTarget()
	local tree_radius = self:GetSpecialValueFor("tree_radius")

	if hCaster == nil or hTarget == nil or hTarget:TriggerSpellAbsorb( this ) then
		return
	end

	local vPos1 = hCaster:GetOrigin()
	local vPos2 = hTarget:GetOrigin()

	GridNav:DestroyTreesAroundPoint( vPos1, tree_radius, false )
	GridNav:DestroyTreesAroundPoint( vPos2, tree_radius, false )

	hCaster:SetOrigin( vPos2 )
	hTarget:SetOrigin( vPos1 )

	FindClearSpaceForUnit( hCaster, vPos2, true )
	FindClearSpaceForUnit( hTarget, vPos1, true )

	hTarget:Interrupt()

	local nCasterFX = ParticleManager:CreateParticle( "particles/units/heroes/hero_vengeful/vengeful_nether_swap.vpcf", PATTACH_ABSORIGIN_FOLLOW, hCaster )
	ParticleManager:SetParticleControlEnt( nCasterFX, 1, hTarget, PATTACH_ABSORIGIN_FOLLOW, nil, hTarget:GetOrigin(), false )
	ParticleManager:ReleaseParticleIndex( nCasterFX )

	local nTargetFX = ParticleManager:CreateParticle( "particles/units/heroes/hero_vengeful/vengeful_nether_swap_target.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget )
	ParticleManager:SetParticleControlEnt( nTargetFX, 1, hCaster, PATTACH_ABSORIGIN_FOLLOW, nil, hCaster:GetOrigin(), false )
	ParticleManager:ReleaseParticleIndex( nTargetFX )

	EmitSoundOn( "Hero_VengefulSpirit.NetherSwap", hCaster )
	EmitSoundOn( "Hero_VengefulSpirit.NetherSwap", hTarget )

	hCaster:StartGesture( ACT_DOTA_CHANNEL_END_ABILITY_4 )

	if not hTarget:IsConsideredHero() and hTarget:GetTeamNumber() ~= hCaster:GetTeamNumber() then
		hTarget:Kill(self, hCaster)
	end
end