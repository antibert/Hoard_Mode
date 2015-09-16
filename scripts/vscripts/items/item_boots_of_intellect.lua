function item_boots_of_intellect_start(keys)
	keys.caster:EmitSound("DOTA_Item.ArcaneBoots.Activate")	
	keys.caster:GiveMana(keys.ManaRestore)
end