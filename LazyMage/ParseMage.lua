lazyMageLoad.metadata:updateRevisionFromKeyword("$Revision: 689 $")

-- The functions and data inside this block will not be defined unless the user is a Mage.

function lazyMageLoad.LoadParseMage()
	
	-- Mage actions
	-----------------
	-- The lazyMage.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	lazyMage.actions.amplifyMagic       = lazyMage.Action:New("amplifyMagic",     "Spell_Holy_FlashHeal")
	lazyMage.actions.arcanePower        = lazyMage.Action:New("arcanePower",      "Spell_Nature_Lightning")
	lazyMage.actions.arcaneRupture      = lazyMage.Action:New("arcaneRupture",    "Spell_Arcane_Blast")
	lazyMage.actions.arcaneSurge        = lazyMage.Action:New("arcaneSurge",      "INV_Enchant_EssenceMysticalLarge")
	lazyMage.actions.blastWave          = lazyMage.Action:New("blastWave",        "Spell_Holy_Excorcism_02")
	lazyMage.actions.blink              = lazyMage.Action:New("blink",            "Spell_Arcane_Blink")
	lazyMage.actions.blizzard           = lazyMage.Action:New("blizzard",         "Spell_Frost_IceStorm")
	lazyMage.actions.brilliance         = lazyMage.Action:New("brilliance",       "Spell_Holy_ArcaneIntellect")
	lazyMage.actions.coldSnap           = lazyMage.Action:New("coldSnap",         "Spell_Frost_WizardMark", nil, false)
	lazyMage.actions.combustion         = lazyMage.Action:New("combustion",       "Spell_Fire_SealOfFire")
	lazyMage.actions.coneCold           = lazyMage.Action:New("coneCold",         "Spell_Frost_Glacier")
	lazyMage.actions.conjureAgate       = lazyMage.Action:New("conjureAgate",     "INV_Misc_Gem_Emerald_01", nil, nil, true)
	lazyMage.actions.conjureCitrine     = lazyMage.Action:New("conjureCitrine",   "INV_Misc_Gem_Opal_01", nil, nil, true)
	lazyMage.actions.conjureFood        = lazyMage.Action:New("conjureFood",      { "INV_Misc_Food_10", "INV_Misc_Food_09", "INV_Misc_Food_12", "INV_Misc_Food_08", "INV_Misc_Food_11", "INV_Misc_Food_33", "INV_Misc_Food_73CinnamonRoll" })
	lazyMage.actions.conjureJade        = lazyMage.Action:New("conjureJade",      "INV_Misc_Gem_Emerald_02", nil, nil, true)
	lazyMage.actions.conjureRuby        = lazyMage.Action:New("conjureRuby",      "INV_Misc_Gem_Ruby_01", nil, nil, true)
	lazyMage.actions.conjureWater       = lazyMage.Action:New("conjureWater",     { "INV_Drink_06", "INV_Drink_07", "INV_Drink_Milk_02", "INV_Drink_10", "INV_Drink_09", "INV_Drink_11", "INV_Drink_18" })
	lazyMage.actions.counter            = lazyMage.Action:New("counter",          "Spell_Frost_IceShock")
	lazyMage.actions.dampenMagic        = lazyMage.Action:New("dampenMagic",      "Spell_Nature_AbolishMagic")
	lazyMage.actions.detectMagic        = lazyMage.Action:New("detectMagic",      "Spell_Holy_Dizzy")
	lazyMage.actions.evocation          = lazyMage.Action:New("evocation",        "Spell_Nature_Purge")
	lazyMage.actions.explosion          = lazyMage.Action:New("explosion",        "Spell_Nature_WispSplode", nil, nil, true)
	lazyMage.actions.fireball           = lazyMage.Action:New("fireball",         "Spell_Fire_FlameBolt")
	lazyMage.actions.fireBlast          = lazyMage.Action:New("fireBlast",        "Spell_Fire_Fireball")   -- yes, texture is Fireball for blast. go figure...
	lazyMage.actions.fireWard           = lazyMage.Action:New("fireWard",         "Spell_Fire_FireArmor")
	lazyMage.actions.flamestrike        = lazyMage.Action:New("flamestrike",      "Spell_Fire_SelfDestruct")
	lazyMage.actions.frostArmor         = lazyMage.Action:New("frostArmor",       "Spell_Frost_FrostArmor02", nil, nil, true)
	lazyMage.actions.frostbolt          = lazyMage.Action:New("frostbolt",        "Spell_Frost_FrostBolt02")
	lazyMage.actions.frostNova          = lazyMage.Action:New("frostNova",        "Spell_Frost_FrostNova")
	lazyMage.actions.frostWard          = lazyMage.Action:New("frostWard",        "Spell_Frost_FrostWard")
	lazyMage.actions.iceArmor           = lazyMage.Action:New("iceArmor",         "Spell_Frost_FrostArmor02", nil, nil, true)
	lazyMage.actions.iceBarrier         = lazyMage.Action:New("iceBarrier",       "Spell_Ice_Lament")
	lazyMage.actions.iceBlock           = lazyMage.Action:New("iceBlock",         "Spell_Frost_Frost")
	lazyMage.actions.intellect          = lazyMage.Action:New("intellect",        "Spell_Holy_MagicalSentry")
	lazyMage.actions.mageArmor          = lazyMage.Action:New("mageArmor",        "Spell_MageArmor")
	lazyMage.actions.manaShield         = lazyMage.Action:New("manaShield",       "Spell_Shadow_DetectLesserInvisibility")
	lazyMage.actions.missiles           = lazyMage.Action:New("missiles",         "Spell_Nature_StarFall")
	lazyMage.actions.pig                = lazyMage.Action:New("pig",              "Spell_Magic_PolymorphPig")
	lazyMage.actions.pom                = lazyMage.Action:New("pom",              "Spell_Nature_EnchantArmor")
	lazyMage.actions.portDarnassus      = lazyMage.Action:New("portDarnassus",    "Spell_Arcane_PortalDarnassus")
	lazyMage.actions.portIronforge      = lazyMage.Action:New("portIronforge",    "Spell_Arcane_PortalIronForge")
	lazyMage.actions.portOgrimmar       = lazyMage.Action:New("portOgrimmar",     "Spell_Arcane_PortalOrgrimmar")
	lazyMage.actions.portStormwind      = lazyMage.Action:New("portStormwind",    "Spell_Arcane_PortalStormWind")
	lazyMage.actions.portThunderBluff   = lazyMage.Action:New("portThunderBluff", "Spell_Arcane_PortalThunderBluff")
	lazyMage.actions.portUndercity      = lazyMage.Action:New("portUndercity",    "Spell_Arcane_PortalUnderCity")
	lazyMage.actions.pyroblast          = lazyMage.Action:New("pyroblast",        "Spell_Fire_Fireball02")
	lazyMage.actions.removeCurse        = lazyMage.Action:New("removeCurse",      "Spell_Nature_RemoveCurse")
	lazyMage.actions.scorch             = lazyMage.Action:New("scorch",           "Spell_Fire_SoulBurn")
	lazyMage.actions.sheep              = lazyMage.Action:New("sheep",            "Spell_Nature_Polymorph")
	lazyMage.actions.slowFall           = lazyMage.Action:New("slowFall",         "Spell_Magic_FeatherFall")
	lazyMage.actions.teleDarnassus      = lazyMage.Action:New("teleDarnassus",    "Spell_Arcane_TeleportDarnassus")
	lazyMage.actions.teleIronforge      = lazyMage.Action:New("teleIronforge",    "Spell_Arcane_TeleportIronForge")
	lazyMage.actions.teleOgrimmar       = lazyMage.Action:New("teleOgrimmar",     "Spell_Arcane_TeleportOrgrimmar")
	lazyMage.actions.teleStormwind      = lazyMage.Action:New("teleStormwind",    "Spell_Arcane_TeleportStormWind")
	lazyMage.actions.teleThunderBluff   = lazyMage.Action:New("teleThunderBluff", "Spell_Arcane_TeleportThunderBluff")
	lazyMage.actions.teleUndercity      = lazyMage.Action:New("teleUndercity",    "Spell_Arcane_TeleportUnderCity")
	lazyMage.actions.turtle             = lazyMage.Action:New("turtle",           "Ability_Hunter_Pet_Turtle")
	
	-- Special Mage actions
	-------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyMage.comboActions.<actionName> or lazyMage.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	function lazyMage.bitParsers.ifHaveAgate(bit, actions, masks)
		if (not lazyMage.rebit(bit, "^if(Not)?HaveAgate$")) then
			return false
		end
		local negate = lazyMage.negate1()
		table.insert(masks, lazyMage.negWrapper(lazyMage.masks.HaveAgate, negate))
		return true
	end
	
	function lazyMage.bitParsers.ifHaveCitrine(bit, actions, masks)
		if (not lazyMage.rebit(bit, "^if(Not)?HaveCitrine$")) then
			return false
		end
		local negate = lazyMage.negate1()
		table.insert(masks, lazyMage.negWrapper(lazyMage.masks.HaveCitrine, negate))
		return true
	end
	
	function lazyMage.bitParsers.ifHaveJade(bit, actions, masks)
		if (not lazyMage.rebit(bit, "^if(Not)?HaveJade$")) then
			return false
		end
		local negate = lazyMage.negate1()
		table.insert(masks, lazyMage.negWrapper(lazyMage.masks.HaveJade, negate))
		return true
	end
	
	function lazyMage.bitParsers.ifHaveRuby(bit, actions, masks)
		if (not lazyMage.rebit(bit, "^if(Not)?HaveRuby$")) then
			return false
		end
		local negate = lazyMage.negate1()
		table.insert(masks, lazyMage.negWrapper(lazyMage.masks.HaveRuby, negate))
		return true
	end
	
	-- Simple Mage specific masks
	-------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyMage.masks.<functionName> instead of
	-- lazyMage.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	function lazyMage.masks.HaveAgate(sayNothing)
		return lazyMage.haveAgate
	end
	
	function lazyMage.masks.HaveCitrine(sayNothing)
		return lazyMage.haveCitrine
	end
	
	function lazyMage.masks.HaveJade(sayNothing)
		return lazyMage.haveJade
	end
	
	function lazyMage.masks.HaveRuby(sayNothing)
		return lazyMage.haveRuby
	end
	
	-- Complex Mage masks
	-----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyMage.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	
	
	-- Mage utility functions
	---------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	function lazyMage.CheckStones()
		-- find out how many shards the user has in their inventory, but only check once every second (this event is fired
		-- multiple times on login and when an item in the bag is moved).
		if (UnitName("player") ~= "Unknown Being" and UnitName("player") ~= "Unknown Entity" and UnitHealth("player") > 2) then
			lazyMage.haveAgate   = false
			lazyMage.haveCitrine = false
			lazyMage.haveJade    = false
			lazyMage.haveRuby    = false
			
			for bag = 4, 0, -1 do
				local size = GetContainerNumSlots(bag);
				if (size > 0) then
					
					-- for each slot in the bag
					for slot=1, size, 1 do
						
						-- get info about the item in this slot
						local itemCount
						_, itemCount = GetContainerItemInfo(bag, slot);
						if (itemCount) then
							local itemLink = GetContainerItemLink (bag, slot)
							if (itemLink) then
								local itemId
								_, _, itemId = string.find(itemLink, "|Hitem:(%d+):")
								if (itemId == "5514") then
									lazyMage.haveAgate = true
									elseif (itemId == "8007") then
									lazyMage.haveCitrine = true
									elseif (itemId == "8008") then
									lazyMage.haveRuby = true
									elseif (itemId == "5513") then
									lazyMage.haveJade = true
								end
							end
						end
					end
				end
			end
		end
	end
	
	-- Custom AutoAttack
	--------------------
	-- Include any modifications to the autoAttack function. If this omitted, lazyMage
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	
	-- Custom command line arguments
	--------------------------------
	
	
	
	-- Custom minimap entries
	-------------------------
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	
	lazyMage.defaultForms = {}
	
	lazyMage.defaultForms.frost = {
		"stop-ifCasting",
		"iceArmor-ifNotHasBuff=mageArmor,iceArmor",
		"intellect@player-ifNotHasBuff=intellect",
		"counter-ifTargetIsCasting",
		"dampenMagic@player-ifTargetIsCasting-ifNotHasBuff=dampenMagic",
		"frostbolt-ifTarget>30%hp",
		"wand-ifTarget<30%hp",
		"wand-ifPlayer<100mana",
	}
	lazyMage.defaultForms.fire = {
		"stop-ifCasting",
		"iceArmor-ifNotHasBuff=mageArmor,iceArmor",
		"intellect@player-ifNotHasBuff=intellect",
		"pyroblast-ifNotInCombat-ifNotTargetFriend",
		"counter-ifTargetIsCasting",
		"dampenMagic@player-ifTargetIsCasting-ifNotHasBuff=dampenMagic",
		"fireBlast-ifHasBuff=clearcasting",
		"fireball-ifInCombat-ifNotTargetInMediumRange",
		"scorch-ifInCombat-ifTargetInMediumRange-ifTarget>9%hp",
		"fireball-ifTarget>30%hp",
		"wand-ifTarget<30%hp",
		"wand-ifPlayer<100mana",
	}
	lazyMage.defaultForms.lowbie = {
		"stop-ifCasting",
		"frostArmor-ifNotHasBuff=frostArmor",
		"intellect@player-ifNotHasBuff=intellect",
		"fireball-ifInCombat-ifNotTargetInMediumRange",
		"fireball-ifTarget>30%hp",
		"wand-ifTarget<30%hp",
		"wand-ifPlayer<100mana",
	}
	
	-- Custom data
	---------------
	-- Place any other tables of data unique to the class here.
	
	
	-- Custom initialization
	------------------------
	lazyMage.haveAgate   = false
	lazyMage.haveCitrine = false
	lazyMage.haveRuby    = false
	lazyMage.haveJade    = false
	
	-- Custom help text
	-------------------
	-- Place any help text that pertains to class specific masks here.
	-- Because of formatting restrictions we place this last so that it does not mess up the indentation.
	function lazyMage.CustomHelp()
		return [[
			<P>-if[Not]HaveAgate</P>
			<P>-if[Not]HaveCitrine</P>
			<P>-if[Not]HaveRuby</P>
			<P>-if[Not]HaveJade</P>
		]]
	end
	
end -- function lazyMageLoad.LoadParseMage()