lazyWarlockLoad.metadata:updateRevisionFromKeyword("$Revision: 742 $")

-- The functions and data inside this block will not be defined unless the user is a Warlock.

function lazyWarlockLoad.LoadParseWarlock()
	
	-- Warlock actions
	-----------------
	-- The lazyWarlock.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	lazyWarlock.actions.amplifyCurse          = lazyWarlock.Action:New("amplifyCurse",           "Spell_Shadow_Contagion", nil, false)
	lazyWarlock.actions.banish                = lazyWarlock.Action:New("banish",                 "Spell_Shadow_Cripple")
	lazyWarlock.actions.conflagrate           = lazyWarlock.Action:New("conflagrate",            "Spell_Fire_Fireball")
	lazyWarlock.actions.corruption            = lazyWarlock.Action:New("corruption",             "Spell_Shadow_AbominationExplosion")
	
	lazyWarlock.actions.createFire            = lazyWarlock.Action:New("createFire",             "INV_Ammo_FireTar", nil, nil, true)
	lazyWarlock.actions.createGreaterFire     = lazyWarlock.Action:New("createGreaterFire",      "INV_Ammo_FireTar", nil, nil, true)
	lazyWarlock.actions.createLesserFire      = lazyWarlock.Action:New("createLesserFire",       "INV_Ammo_FireTar", nil, nil, true)
	lazyWarlock.actions.createMajorFire       = lazyWarlock.Action:New("createMajorFire",        "INV_Ammo_FireTar", nil, nil, true)
	
	lazyWarlock.actions.createGreaterHealth   = lazyWarlock.Action:New("createGreaterHealth",    "INV_Stone_04", nil, nil, true)
	lazyWarlock.actions.createHealth          = lazyWarlock.Action:New("createHealth",           "INV_Stone_04", nil, nil, true)
	lazyWarlock.actions.createLesserHealth    = lazyWarlock.Action:New("createLesserHealth",     "INV_Stone_04", nil, nil, true)
	lazyWarlock.actions.createMajorHealth     = lazyWarlock.Action:New("createMajorHealth",      "INV_Stone_04", nil, nil, true)
	lazyWarlock.actions.createMinorHealth     = lazyWarlock.Action:New("createMinorHealth",      "INV_Stone_04", nil, nil, true)
	
	lazyWarlock.actions.createGreaterSoul     = lazyWarlock.Action:New("createGreaterSoul",      "Spell_Shadow_SoulGem", nil, nil, true)
	lazyWarlock.actions.createLesserSoul      = lazyWarlock.Action:New("createLesserSoul",       "Spell_Shadow_SoulGem", nil, nil, true)
	lazyWarlock.actions.createMajorSoul       = lazyWarlock.Action:New("createMajorSoul",        "Spell_Shadow_SoulGem", nil, nil, true)
	lazyWarlock.actions.createMinorSoul       = lazyWarlock.Action:New("createMinorSoul",        "Spell_Shadow_SoulGem", nil, nil, true)
	lazyWarlock.actions.createSoul            = lazyWarlock.Action:New("createSoul",             "Spell_Shadow_SoulGem", nil, nil, true)
	
	lazyWarlock.actions.createGreaterSpell    = lazyWarlock.Action:New("createGreaterSpell",     "INV_Misc_Gem_Sapphire_01", nil, nil, true)
	lazyWarlock.actions.createMajorSpell      = lazyWarlock.Action:New("createMajorSpell",       "INV_Misc_Gem_Sapphire_01", nil, nil, true)
	lazyWarlock.actions.createSpell           = lazyWarlock.Action:New("createSpell",            "INV_Misc_Gem_Sapphire_01", nil, nil, true)
	
	lazyWarlock.actions.curseAgony            = lazyWarlock.Action:New("curseAgony",             "Spell_Shadow_CurseOfSargeras")
	lazyWarlock.actions.curseDoom             = lazyWarlock.Action:New("curseDoom",              "Spell_Shadow_AuraOfDarkness", nil, nil, true)
	lazyWarlock.actions.curseElements         = lazyWarlock.Action:New("curseElements",          "Spell_Shadow_ChillTouch")
	lazyWarlock.actions.curseExhaustion       = lazyWarlock.Action:New("curseExhaustion",        "Spell_Shadow_GrimWard")
	lazyWarlock.actions.curseReckless         = lazyWarlock.Action:New("curseReckless",          "Spell_Shadow_UnholyStrength", nil, nil, true)
	lazyWarlock.actions.curseShadow           = lazyWarlock.Action:New("curseShadow",            "Spell_Shadow_CurseOfAchimonde")
	lazyWarlock.actions.curseTongues          = lazyWarlock.Action:New("curseTongues",           "Spell_Shadow_CurseOfTounges")
	lazyWarlock.actions.curseWeakness         = lazyWarlock.Action:New("curseWeakness",          "Spell_Shadow_CurseOfMannoroth")
	lazyWarlock.actions.darkPact              = lazyWarlock.Action:New("darkPact",               "Spell_Shadow_DarkRitual")
	lazyWarlock.actions.deathCoil             = lazyWarlock.Action:New("deathCoil",              "Spell_Shadow_DeathCoil")
	lazyWarlock.actions.demonArmor            = lazyWarlock.Action:New("demonArmor",             "Spell_Shadow_RagingScream",nil, nil, true)
	lazyWarlock.actions.demonicSacrifice      = lazyWarlock.Action:New("demonicSacrifice",       "Spell_Shadow_PsychicScream")
	lazyWarlock.actions.demonSkin             = lazyWarlock.Action:New("demonSkin",              "Spell_Shadow_RagingScream", nil, nil, true)
	lazyWarlock.actions.detectGreaterInvis    = lazyWarlock.Action:New("detectGreaterInvis",     "Spell_Shadow_DetectInvisibility", nil, nil, true)
	lazyWarlock.actions.detectInvis           = lazyWarlock.Action:New("detectInvis",            "Spell_Shadow_DetectInvisibility", nil, nil, true)
	lazyWarlock.actions.detectLesserInvis     = lazyWarlock.Action:New("detectLesserInvis",      "Spell_Shadow_DetectLesserInvisibility")
	lazyWarlock.actions.drainLife             = lazyWarlock.Action:New("drainLife",              "Spell_Shadow_LifeDrain02")
	lazyWarlock.actions.drainMana             = lazyWarlock.Action:New("drainMana",              "Spell_Shadow_SiphonMana")
	lazyWarlock.actions.drainSoul             = lazyWarlock.Action:New("drainSoul",              "Spell_Shadow_Haunting")
	lazyWarlock.actions.enslave               = lazyWarlock.Action:New("enslave",                "Spell_Shadow_EnslaveDemon")
	lazyWarlock.actions.fear                  = lazyWarlock.Action:New("fear",                   "Spell_Shadow_Possession")
	lazyWarlock.actions.felDomination         = lazyWarlock.Action:New("felDomination",          "Spell_Nature_RemoveCurse", nil, false)
	lazyWarlock.actions.funnel                = lazyWarlock.Action:New("funnel",                 "Spell_Shadow_LifeDrain", nil, nil, true)  -- yes, this is the correct texture
	lazyWarlock.actions.hellfire              = lazyWarlock.Action:New("hellfire",               "Spell_Fire_Incinerate")
	lazyWarlock.actions.howl                  = lazyWarlock.Action:New("howl",                   "Spell_Shadow_DeathScream")
	lazyWarlock.actions.immolate              = lazyWarlock.Action:New("immolate",               "Spell_Fire_Immolation")
	lazyWarlock.actions.inferno       		  = lazyWarlock.Action:New("inferno",         		 "Spell_Shadow_SummonInfernal")
	lazyWarlock.actions.lifeTap               = lazyWarlock.Action:New("lifeTap",                "Spell_Shadow_BurningSpirit")
	lazyWarlock.actions.pain                  = lazyWarlock.Action:New("pain",                   "Spell_Fire_SoulBurn")
	lazyWarlock.actions.rainFire              = lazyWarlock.Action:New("rainFire",               "Spell_Shadow_RainOfFire")
	lazyWarlock.actions.senseDemons           = lazyWarlock.Action:New("senseDemons",            "Spell_Shadow_Metamorphosis")
	lazyWarlock.actions.shadowBolt            = lazyWarlock.Action:New("shadowBolt",             "Spell_Shadow_ShadowBolt")
	lazyWarlock.actions.shadowburn            = lazyWarlock.Action:New("shadowburn",             "Spell_Shadow_ScourgeBuild")
	lazyWarlock.actions.shadowWard            = lazyWarlock.Action:New("shadowWard",             "Spell_Shadow_AntiShadow", nil, nil, true)
	lazyWarlock.actions.siphon                = lazyWarlock.Action:New("siphon",                 "Spell_Shadow_Requiem")
	lazyWarlock.actions.soulFire              = lazyWarlock.Action:New("soulFire",               "Spell_Fire_Fireball02")
	lazyWarlock.actions.soulLink              = lazyWarlock.Action:New("soulLink",               "Spell_Shadow_GatherShadows", nil, nil, true)
	lazyWarlock.actions.summonDread           = lazyWarlock.Action:New("summonDread",            "Ability_Mount_Dreadsteed")
	lazyWarlock.actions.summonImp             = lazyWarlock.Action:New("summonImp",              "Spell_Shadow_SummonImp")
	lazyWarlock.actions.summonFel             = lazyWarlock.Action:New("summonFel",              "Spell_Shadow_SummonFelHunter")
	lazyWarlock.actions.summonSteed           = lazyWarlock.Action:New("summonSteed",            "Spell_Nature_Swiftness")
	lazyWarlock.actions.summonSuc             = lazyWarlock.Action:New("summonSuc",              "Spell_Shadow_SummonSuccubus")
	lazyWarlock.actions.summonVW              = lazyWarlock.Action:New("summonVW",               "Spell_Shadow_SummonVoidWalker")
	
	-- Pet actions
	lazyWarlock.actions.bloodPact             = lazyWarlock.PetAction:New("bloodPact",           "Spell_Shadow_BloodBoil")
	lazyWarlock.actions.firebolt              = lazyWarlock.PetAction:New("firebolt",            "Spell_Fire_FireBolt")
	lazyWarlock.actions.phaseShift            = lazyWarlock.PetAction:New("phaseShift",          "Spell_Shadow_ImpPhaseShift")
	lazyWarlock.actions.fireShield            = lazyWarlock.PetAction:New("fireShield",          "Spell_Fire_FireArmor")
	
	lazyWarlock.actions.consumeShadows        = lazyWarlock.PetAction:New("consumeShadows",      "Spell_Shadow_AntiShadow", nil, nil, true)
	lazyWarlock.actions.sacrifice             = lazyWarlock.PetAction:New("sacrifice",           "Spell_Shadow_SacrificialShield", nil, false)
	lazyWarlock.actions.suffering             = lazyWarlock.PetAction:New("suffering",           "Spell_Shadow_BlackPlague")
	lazyWarlock.actions.torment               = lazyWarlock.PetAction:New("torment",             "Spell_Shadow_GatherShadows", nil, nil, true)
	
	lazyWarlock.actions.seduction             = lazyWarlock.PetAction:New("seduction",           "Spell_Shadow_MindSteal")
	lazyWarlock.actions.lesserInvisibility    = lazyWarlock.PetAction:New("lesserInvisibility",  "Spell_Magic_LesserInvisibilty")
	lazyWarlock.actions.lashPain              = lazyWarlock.PetAction:New("lashPain",            "Spell_Shadow_Curse")
	lazyWarlock.actions.soothingKiss          = lazyWarlock.PetAction:New("soothingKiss",        "Spell_Shadow_SoothingKiss")
	
	lazyWarlock.actions.taintedBlood          = lazyWarlock.PetAction:New("taintedBlood",        "Spell_Shadow_LifeDrain", nil, nil, true)
	lazyWarlock.actions.spellLock             = lazyWarlock.PetAction:New("spellLock",           "Spell_Shadow_MindRot")
	lazyWarlock.actions.devourMagic           = lazyWarlock.PetAction:New("devourMagic",         "Spell_Nature_Purge", nil, nil, true)
	lazyWarlock.actions.paranoia              = lazyWarlock.PetAction:New("paranoia",            "Spell_Shadow_AuraOfDarkness", nil, nil, true)
	
	
	
	-- Special Warlock actions
	-------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyWarlock.comboActions.<actionName> or lazyWarlock.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	function lazyWarlock.bitParsers.immolate(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.immolate.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.immolate)
		table.insert(masks, lazyWarlock.negWrapper(lazyWarlock.masks.IsImmune(lazyWarlock.actions.immolate.name), true))
		table.insert(masks, lazyWarlock.negWrapper(lazyWarlock.masks.IsImmolateActive, true))
		return true
	end
	
	function lazyWarlock.bitParsers.bloodPact(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.bloodPact.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.bloodPact)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("imp"))
		return true
	end
	
	function lazyWarlock.bitParsers.firebolt(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.firebolt.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.firebolt)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("imp"))
		return true
	end
	
	function lazyWarlock.bitParsers.phaseShift(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.phaseShift.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.phaseShift)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("imp"))
		return true
	end
	
	function lazyWarlock.bitParsers.fireShield(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.fireShield.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.fireShield)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("imp"))
		return true
	end
	
	function lazyWarlock.bitParsers.consumeShadows(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.consumeShadows.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.consumeShadows)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("voidwalker"))
		table.insert(masks,   lazyWarlock.negWrapper(lazyWarlock.masks.PlayerInCombat, true))
		table.insert(masks,   lazyWarlock.negWrapper(lazyWarlock.masks.UnitInCombat("pet"), true))
		return true
	end
	
	function lazyWarlock.bitParsers.sacrifice(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.sacrifice.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.sacrifice)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("voidwalker"))
		return true
	end
	
	function lazyWarlock.bitParsers.suffering(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.suffering.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.suffering)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("voidwalker"))
		return true
	end
	
	function lazyWarlock.bitParsers.torment(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.torment.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.torment)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("voidwalker"))
		return true
	end
	
	function lazyWarlock.bitParsers.seduction(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.seduction.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.seduction)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("succubus"))
		return true
	end
	
	function lazyWarlock.bitParsers.lesserInvisibility(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.lesserInvisibility.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.lesserInvisibility)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("succubus"))
		return true
	end
	
	function lazyWarlock.bitParsers.lashPain(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.lashPain.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.lashPain)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("succubus"))
		return true
	end
	
	function lazyWarlock.bitParsers.soothingKiss(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.soothingKiss.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.soothingKiss)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("succubus"))
		return true
	end
	
	
	function lazyWarlock.bitParsers.taintedBlood(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.taintedBlood.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.taintedBlood)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("felhunter"))
		return true
	end
	
	function lazyWarlock.bitParsers.spellLock(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.spellLock.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.spellLock)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("felhunter"))
		return true
	end
	
	function lazyWarlock.bitParsers.devourMagic(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.devourMagic.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.devourMagic)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("felhunter"))
		return true
	end
	
	function lazyWarlock.bitParsers.paranoia(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.paranoia.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.paranoia)
		table.insert(masks,   lazyWarlock.masks.HasPet)
		table.insert(masks,   lazyWarlock.masks.UnitAlive("pet"))
		table.insert(masks,   lazyWarlock.masks.PetFamily("felhunter"))
		return true
	end
	
	function lazyWarlock.bitParsers.banish(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.banish.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.banish)
		table.insert(masks, lazyWarlock.masks.IsBanishable)
		return true
	end
	
	function lazyWarlock.bitParsers.drainSoul(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.drainSoul.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.drainSoul)
		table.insert(masks, lazyWarlock.masks.IsShardable) -- true if we can get a shard from the target
		return true
	end
	
	function lazyWarlock.bitParsers.enslave(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.enslave.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.enslave)
		table.insert(masks, lazyWarlock.masks.TargetType("Demon"))
		return true
	end
	
	function lazyWarlock.bitParsers.conflagrate(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, lazyWarlock.actions.conflagrate.codePattern)) then
			return false
		end
		table.insert(actions, lazyWarlock.actions.conflagrate)
		table.insert(masks, lazyWarlock.masks.IsImmolateActive)
		return true
	end
	
	function lazyWarlock.bitParsers.ifLastConflagrateChance(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, "^if(Not)?LastConflagrateChance$")) then
			return false
		end
		local negate = lazyWarlock.negate1()
		table.insert(masks, lazyWarlock.negWrapper(lazyWarlock.masks.IsLastConflagrateChance, negate))
		return true
	end
	
	function lazyWarlock.bitParsers.ifHaveHealthstone(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, "^if(Not)?HaveHealthstone$")) then
			return false
		end
		local negate = lazyWarlock.negate1()
		table.insert(masks, lazyWarlock.negWrapper(lazyWarlock.masks.HaveHealthstone, negate))
		return true
	end
	
	function lazyWarlock.bitParsers.ifHaveSoulstone(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, "^if(Not)?HaveSoulstone$")) then
			return false
		end
		local negate = lazyWarlock.negate1()
		table.insert(masks, lazyWarlock.negWrapper(lazyWarlock.masks.HaveSoulstone, negate))
		return true
	end
	
	function lazyWarlock.bitParsers.ifHaveFirestone(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, "^if(Not)?HaveFirestone$")) then
			return false
		end
		local negate = lazyWarlock.negate1()
		table.insert(masks, lazyWarlock.negWrapper(lazyWarlock.masks.HaveFirestone, negate))
		return true
	end
	
	function lazyWarlock.bitParsers.ifShards(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, "^if([<=>]?)(%d+)Shards$") and not lazyWarlock.rebit(bit, "^([<=>]?)(%d+)Shards$")) then
			return false
		end
		local gtLtEq = lazyWarlock.match1
		local val = tonumber(lazyWarlock.match2)
		table.insert(masks, lazyWarlock.masks.Shards(val, gtLtEq))
		return true
	end
	
	function lazyWarlock.bitParsers.ifTargetShardable(bit, actions, masks)
		if (not lazyWarlock.rebit(bit, "^if(Not)?Shardable$")) then
			return false
		end
		local negate = lazyWarlock.negate1()
		table.insert(masks, lazyWarlock.negWrapper(lazyWarlock.masks.IsShardable, negate))
		return true
	end
	
	-- Simple Warlock specific masks
	-------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyWarlock.masks.<functionName> instead of
	-- lazyWarlock.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	function lazyWarlock.masks.IsShardable(sayNothing)
		if (    lazyScript.masks.TargetTrivial() or
			not UnitIsTappedByPlayer("target") or
			not UnitCanAttack("player", "target") or
		UnitIsDead("target")) then
		return false
		end
		return true
	end
	
	function lazyWarlock.masks.HaveHealthstone(sayNothing)
		return lazyWarlock.haveHealthstone
	end
	
	function lazyWarlock.masks.HaveSoulstone(sayNothing)
		return lazyWarlock.haveSoulstone
	end
	
	function lazyWarlock.masks.HaveFirestone(sayNothing)
		return lazyWarlock.haveFirestone
	end
	
	function lazyWarlock.masks.IsBanishable(sayNothing)
		if (lazyWarlock.masks.TargetType("Demon") or lazyWarlock.masks.TargetType("Elemental")) then
			return true
		end
		return false
	end
	
	function lazyWarlock.masks.IsImmolateActive(sayNothing)
		local buffObj = lazyWarlock.buffTable.immolate
		return lazyWarlock.masks.HasBuffOrDebuff("target", "debuff", buffObj.texture, buffObj.localeName, nil, sayNothing)
	end
	
	-- Complex Warlock masks
	-----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyWarlock.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	function lazyWarlock.masks.IsLastConflagrateChance(sayNothing)
		if (not lazyWarlock.masks.IsImmolateActive()) then
			return false
		end
		
		-- Immolate lasts for 15 seconds. Conflagrate if almost done, including time for user to react in case they aren't
		-- spamming the lazy key
		
		if (GetTime() > lazyWarlock.actions.immolate.everyTimer + 12) then
			return true
			else
			local _, _, maxRank = lazyWarlock.actions.conflagrate:FindSpellRanks()
			if (not maxRank) then
				return false
			end
			
			local dmg = lazyWarlock.conflagrateDamage[maxRank]
			
			if dmg == nil then
				if not sayNothing then
					lazyScript.p(WARLOCK_RANK..maxRank..WARLOCK_CONFLAG_NOT_SUPPORT)
				end
				return false
			end
			
			local ieAdjust = { 1.02, 1.04, 1.06, 1.08, 1.10 }
			local tpts = lazyWarlock.masks.FindTalentPoints("Spell_Fire_SelfDestruct")   -- Emberstorm
			if (tpts > 0) then
				dmg = dmg * ieAdjust[tpts]
			end
			
			if (BonusScanner and BonusScanner.active) then
				-- Calculate bonus damage. Instant spells are treated as 1.5sec cast time when
				-- calculating how much damage bonus they receive. BonusScanner:GetBonus() returns 0
				-- if the bonus is not present.
				local bonus = (BonusScanner:GetBonus('DMG') + BonusScanner:GetBonus('FIREDMG')) * (1.5 / 3.5);
				dmg = dmg + bonus
			end
			
			if not sayNothing then
				lazyScript.d(WARLOCK_CONFLAG_DAMAGE..dmg)
			end
			
			local hp = lazyWarlock.masks.GetUnitHealth("target", false, false, sayNothing)
			
			if not hp then
				return false
			end
			
			if (hp <= dmg) then
				return true
			end
		end
		
		return false
	end
	
	function lazyWarlock.masks.Shards(shards, gtLtEq)
		shards = tonumber(shards)
		return function()
			if (not gtLtEq or gtLtEq == "") then
				return (lazyWarlock.curShards >= shards)
			end
			if (gtLtEq == ">") then
				return (lazyWarlock.curShards > shards)
				elseif (gtLtEq == "=") then
				return (lazyWarlock.curShards == shards)
				else
				return (lazyWarlock.curShards < shards)
			end
		end
	end
	
	
	-- Warlock utility functions
	---------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	function lazyWarlock.CheckStones()
		-- find out how many shards the user has in their inventory, but only check once every second (this event is fired
		-- multiple times on login and when an item in the bag is moved).
		if (UnitName("player") ~= "Unknown Being" and UnitName("player") ~= "Unknown Entity" and UnitHealth("player") > 2) then
			lazyWarlock.curShards = 0
			lazyWarlock.haveHealthstone = false
			lazyWarlock.haveSoulstone   = false
			lazyWarlock.haveFirestone   = false
			
			-- Get the localized string once, rather then for every item
			
			local txtHealthstone = lazyWarlock.getLocaleString("HEALTHSTONE")
			local txtSoulstone   = lazyWarlock.getLocaleString("SOULSTONE")
			local txtFirestone   = lazyWarlock.getLocaleString("FIRESTONE")
			
			for bag = 4, 0, -1 do
				local size = GetContainerNumSlots(bag);
				if (size > 0) then
					
					-- for each slot in the bag
					for slot=1, size, 1 do
						
						-- get info about the item in this slot
						local texture, itemCount = GetContainerItemInfo(bag, slot);
						if (itemCount) then
							local itemLink = GetContainerItemLink (bag, slot)
							if (itemLink) then
								local itemId
								_, _, itemId = string.find(itemLink, "|Hitem:(%d+):")
								if (itemId == "6265") then
									lazyWarlock.curShards = lazyWarlock.curShards + 1
									-- can't use item id's for the rest because they have different levels
									elseif (string.find(itemLink, txtHealthstone)) then
									lazyWarlock.haveHealthstone = true
									elseif (string.find(itemLink, txtSoulstone)) then
									lazyWarlock.haveSoulstone = true
									elseif (string.find(itemLink, txtFirestone)) then
									lazyWarlock.haveFirestone = true
								end
							end
						end
					end
				end
			end
			
			if lazyWarlock.haveFirestone == false then
				local link = GetInventoryItemLink("player", GetInventorySlotInfo("SecondaryHandSlot"))
				if (link) then
					local id, name = lazyScript.IdAndNameFromLink(link)
					--lazyScript.p(WARLOCK_OFFHAND_CONTAINS..lazyScript.safeString(id).." "..lazyScript.safeString(name))
					if (name) then
						if (string.find(string.lower(name), string.lower(txtFirestone))) then
							lazyWarlock.haveFirestone = true
						end
					end
				end
			end
		end
	end
	
	-- Custom AutoAttack
	--------------------
	-- Include any modifications to the autoAttack function. If this omitted, lazyWarlock
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	
	-- Custom command line arguments
	--------------------------------
	
	
	-- Custom minimap entries
	-------------------------
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	
	lazyWarlock.defaultForms = {}
	
	lazyWarlock.defaultForms.conflagrate = {
		"dismount-ifMounted",
		"stop-ifChannelling",
		"stop-ifCasting",
		"createSoul-ifNotHaveSoulstone",
		"createGreaterHealth-ifNotHaveHealthstone",
		"demonArmor-ifNotHasBuff=demonArmor,demonSkin",
		"summonSuc-ifNotHasPet-ifNotInCombat",
		"assistPet-ifNotHaveTarget-ifPetInCombat",
		"stop-ifNotTargetAlive",
		"petAttack-ifTargetHostile-ifNotPetInCombat-ifPetAlive",
		"immolate-ifTargetHostile-ifNotTargetHasDebuff=immolate-ifTarget>20%hp",
		"-- adjust hp for the damage of your drainSoul level",
		"drainSoul-ifTarget<295hp-if<16Shards-ifTargetHostile",
		"conflagrate-ifLastConflagrateChance",
		"pain-ifTargetHostile",
	}
	lazyWarlock.defaultForms.affliction = {
		"dismount-ifMounted",
		"stop-ifChannelling",
		"stop-ifCasting",
		"createSoul-ifNotHaveSoulstone",
		"createGreaterHealth-ifNotHaveHealthstone",
		"demonArmor-ifNotHasBuff=demonArmor,demonSkin",
		"summonSuc-ifNotHasPet",
		"assistPet-ifNotHaveTarget-ifPetInCombat",
		"darkPact-ifNotPetInCombat-ifNotInCombat-ifPlayer<90%mana-ifPet>50%mana",
		"lifeTap-ifNotPetInCombat-ifNotInCombat-ifPlayer<70%mana-ifPlayer>70%hp",
		"stop-ifNotTargetHostile-ifNotTargetAlive",
		"petAttack-ifTargetHostile-ifNotPetInCombat",
		"-- adjust hp for the damage of your drainSoul level",
		"siphon-ifTargetElite-ifNotTargetHasDebuff=siphon-ifTarget>40%hp",
		"curseTongues-ifTargetIsCasting-ifNotTargetHasDebuff=curseTongues",
		"shadowWard-ifTargetIsCasting=SHADOW-ifNotHasBuff=shadowWard",
		"amplifyCurse-curseAgony-ifNotTargetIs=Cursed-ifTarget>30%hp",
		"curseAgony-ifNotHistory<1=curseAgony-ifNotTargetIs=Cursed-ifTarget>30%hp",
		"corruption-ifNotTargetHasDebuff=corruption-ifTarget>30%hp",
		"immolate-ifNotTargetHasDebuff=immolate-ifTargetElite",
		"drainSoul-ifTarget<295hp-if<16Shards",
		"shadowBolt-ifHasBuff=shadowTrance",
		"funnel-ifPet<30%hp-ifPlayer>50%hp-ifNotTargetOfTarget",
		"lifeTap-ifPlayer>80%hp-ifPlayer<70%mana-ifNotTargetOfTarget-ifTarget>60%hp",
		"deathCoil-ifPlayer<30%hp-ifTargetOfTarget",
		"fear-ifPlayer<15%hp-ifTargetOfTarget",
		"drainLife-ifPlayer<80%hp-ifNotTargetOfTarget-ifNotTargetImmune-ifTarget>15%hp",
		"drainLife-ifPlayer<40%hp-ifNotTargetImmune-ifTarget>15%hp",
		"drainMana-ifTarget>500mana-ifPlayer<70%mana-ifTarget>30%hp",
		"wand-ifTarget<20%hp",
		"wand-ifPlayer<100mana",
		"pain-ifTargetOfTarget-ifTarget>19%hp-ifTargetInMediumRange",
		"shadowBolt-ifNotTargetOfTarget",
		"shadowBolt-ifNotTargetInMediumRange",
	}
	lazyWarlock.defaultForms.demonology = {
		"dismount-ifMounted",
		"stop-ifChannelling",
		"stop-ifCasting",
		"createSoul-ifNotHaveSoulstone",
		"createGreaterHealth-ifNotHaveHealthstone",
		"demonArmor-ifNotHasBuff=demonArmor,demonSkin",
		"soulLink-ifPetAlive-ifNotHasBuff=soulLink",
		"felDomination-summonSuc-ifNotHasPet-ifNotInCombat",
		"summonSuc-ifNotHasPet-ifNotInCombat",
		"assistPet-ifNotHaveTarget-ifPetInCombat",
		"lifeTap-ifNotPetInCombat-ifNotInCombat-ifPlayer<70%mana-ifPlayer>70%hp",
		"stop-ifNotTargetHostile",
		"demonicSacrifice-ifInCombat-ifPet<15%hp-ifPetAlive",
		"petAttack-ifTargetHostile-ifNotPetInCombat-ifPetAlive",
		"drainSoul-ifTarget<295hp-if<16Shards",
		"curseTongues-ifTargetIsCasting-ifNotTargetHasDebuff=curseTongues",
		"corruption-ifNotTargetHasDebuff=corruption-ifTarget>20%hp",
		"curseAgony-ifNotHistory<1=curseAgony-ifNotTargetIs=Cursed",
		"immolate-ifNotTargetHasDebuff=immolate-ifTargetElite",
		"drainMana-ifTarget>500mana-ifPlayer<80%mana-ifPlayer>60%hp",
		"drainLife-ifPlayer<80%hp-ifNotTargetOfTarget",
		"funnel-ifPet<50%hp-ifPlayer>75%hp-ifNotTargetOfTarget",
		"lifeTap-ifPlayer>90%hp-ifPlayer<90%mana-ifNotTargetOfTarget",
		"deathCoil-ifPlayer<30%hp-ifTargetOfTarget",
		"fear-ifPlayer<15%hp-ifTargetOfTarget",
		"wand-ifTarget<15%hp",
		"wand-ifPlayer<5%mana",
		"pain-ifTargetOfTarget-ifTarget>14%hp",
		"shadowBolt-ifNotTargetOfTarget",
	}
	lazyWarlock.defaultForms.lowbie = {
		"stopCasting-drainSoul-ifTarget<50hp-if<6Shards-ifNotChannelling-ifNotHistory=1=drainSoul",
		"stop-ifChannelling",
		"stop-ifCasting",
		"drainSoul-ifTarget<50hp-if<6Shards",
		"##Out of combat stuff",
		"createMinorHealth-ifNotInCombat-ifNotHaveHealthstone",
		"summonImp-ifNotHasPet",
		"##Heal me",
		"use=Minor Healthstone-ifPlayer<100hp",
		"## Start off with a shadowBolt",
		"shadowBolt-petAttack-ifNotInCombat-ifNotHistory=1=shadowBolt",
		"corruption-ifNotTargetHasDebuff=corruption",
		"curseAgony-ifNotTargetIs=Cursed",
		"shadowBolt",
	}
	
	-- Custom data
	---------------
	-- Place any other tables of data unique to the class here.
	lazyWarlock.conflagrateDamage = {
		(249+316)/2,
		(316+396)/2,
		(383+479)/2,
		(447+557)/2,
	}
	
	-- Custom initialization
	------------------------
	lazyWarlock.curShards = 0
	lazyWarlock.haveHealthstone = false
	lazyWarlock.haveSoulstone   = false
	lazyWarlock.haveFirestone   = false
	
	
	-- Custom help text
	-------------------
	-- Place any help text that pertains to class specific actions and masks here.
	-- Because of formatting restrictions we place this last so that it does not mess up the indentation.
	function lazyWarlock.CustomHelp()
		return [[
			<P>-if[Not]HaveFirestone</P>
			<P>-if[Not]HaveHealthstone</P>
			<P>-if[Not]HaveSoulstone</P>
			<P>-if[Not]LastConflagrateChance</P>
			<P>-if[{&lt;,=,&gt;}]XShards</P>
			<P>-if[Not]TargetShardable</P>
		]]
	end
	
end -- function lazyWarlockLoad.LoadParseWarlock()