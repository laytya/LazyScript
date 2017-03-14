lazyPriestLoad.metadata:updateRevisionFromKeyword("$Revision: 729 $")

-- The functions and data inside this block will not be defined unless the user is a PRIEST.

function lazyPriestLoad.LoadParsePriest()
	
	-- Priest actions
	-----------------
	-- The lazyPriest.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	lazyPriest.actions.abolishDisease            = lazyPriest.Action:New("abolishDisease",             "Spell_Nature_NullifyDisease")
	lazyPriest.actions.cureDisease               = lazyPriest.Action:New("cureDisease",                "Spell_Holy_NullifyDisease")
	lazyPriest.actions.desperatePrayer           = lazyPriest.Action:New("desperatePrayer",            "Spell_Holy_Restoration")
	lazyPriest.actions.devouringPlague           = lazyPriest.Action:New("devouringPlague",            "Spell_Shadow_BlackPlague")
	lazyPriest.actions.dispelMagic               = lazyPriest.Action:New("dispelMagic",                "Spell_Holy_DispelMagic")
	lazyPriest.actions.divineSpirit              = lazyPriest.Action:New("divineSpirit",               "Spell_Holy_DivineSpirit")
	lazyPriest.actions.elunesGrace               = lazyPriest.Action:New("elunesGrace",                "Spell_Holy_ElunesGrace")
	lazyPriest.actions.fade                      = lazyPriest.Action:New("fade",                       "Spell_Magic_LesserInvisibilty")
	lazyPriest.actions.fearWard                  = lazyPriest.Action:New("fearWard",                   "Spell_Holy_Excorcism")
	lazyPriest.actions.feedback                  = lazyPriest.Action:New("feedback",                   "Spell_Shadow_RitualOfSacrifice")
	lazyPriest.actions.flashHeal                 = lazyPriest.Action:New("flashHeal",                  "Spell_Holy_FlashHeal")
	lazyPriest.actions.greaterHeal               = lazyPriest.Action:New("greaterHeal",                "Spell_Holy_GreaterHeal")
	lazyPriest.actions.heal                      = lazyPriest.Action:New("heal",                       { "Spell_Holy_Heal", "Spell_Holy_Heal02" })
	lazyPriest.actions.hexWeakness               = lazyPriest.Action:New("hexWeakness",                "Spell_Shadow_FingerOfDeath")
	lazyPriest.actions.holyFire                  = lazyPriest.Action:New("holyFire",                   "Spell_Holy_SearingLight")
	lazyPriest.actions.holyNova                  = lazyPriest.Action:New("holyNova",                   "Spell_Holy_HolyNova")
	lazyPriest.actions.innerFire                 = lazyPriest.Action:New("innerFire",                  "Spell_Holy_InnerFire")
	lazyPriest.actions.innerFocus                = lazyPriest.Action:New("innerFocus",                 "Spell_Frost_WindWalkOn", nil, false)
	lazyPriest.actions.lesserHeal                = lazyPriest.Action:New("lesserHeal",                 "Spell_Holy_LesserHeal")
	lazyPriest.actions.levitate                  = lazyPriest.Action:New("levitate",                   "Spell_Holy_LayOnHands")
	lazyPriest.actions.lightwell                 = lazyPriest.Action:New("lightwell",                  "Spell_Holy_SummonLightwell", nil, nil, true)
	lazyPriest.actions.manaBurn                  = lazyPriest.Action:New("manaBurn",                   "Spell_Shadow_ManaBurn")
	lazyPriest.actions.mindBlast                 = lazyPriest.Action:New("mindBlast",                  "Spell_Shadow_UnholyFrenzy")
	lazyPriest.actions.mindControl               = lazyPriest.Action:New("mindControl",                "Spell_Shadow_ShadowWordDominate")
	lazyPriest.actions.mindFlay                  = lazyPriest.Action:New("mindFlay",                   "Spell_Shadow_SiphonMana")
	lazyPriest.actions.mindSoothe                = lazyPriest.Action:New("mindSoothe",                 "Spell_Holy_MindSooth")
	lazyPriest.actions.mindVision                = lazyPriest.Action:New("mindVision",                 "Spell_Holy_MindVision")
	lazyPriest.actions.powerInfusion             = lazyPriest.Action:New("powerInfusion",              "Spell_Holy_PowerInfusion")
	lazyPriest.actions.pwf                       = lazyPriest.Action:New("pwf",                        "Spell_Holy_WordFortitude")
	lazyPriest.actions.pws                       = lazyPriest.Action:New("pws",                        "Spell_Holy_PowerWordShield")
	lazyPriest.actions.prf                       = lazyPriest.Action:New("prf",                        "Spell_Holy_PrayerOfFortitude")
	lazyPriest.actions.prh                       = lazyPriest.Action:New("prh",                        "Spell_Holy_PrayerOfHealing02")
	lazyPriest.actions.prsp                      = lazyPriest.Action:New("prsp",                       "Spell_Holy_PrayerofShadowProtection")
	lazyPriest.actions.prs                       = lazyPriest.Action:New("prs",                        "Spell_Holy_PrayerofSpirit")
	lazyPriest.actions.psychicScream             = lazyPriest.Action:New("psychicScream",              "Spell_Shadow_PsychicScream")
	lazyPriest.actions.renew                     = lazyPriest.Action:New("renew",                      "Spell_Holy_Renew")
	lazyPriest.actions.resurrection              = lazyPriest.Action:New("resurrection",               "Spell_Holy_Resurrection")
	lazyPriest.actions.shackleUndead             = lazyPriest.Action:New("shackleUndead",              "Spell_Nature_Slow")
	lazyPriest.actions.shadowProtection          = lazyPriest.Action:New("shadowProtection",           "Spell_Shadow_AntiShadow")
	lazyPriest.actions.swp                       = lazyPriest.Action:New("swp",                        "Spell_Shadow_ShadowWordPain")
	lazyPriest.actions.shadowform                = lazyPriest.Action:New("shadowform",                 "Spell_Shadow_Shadowform")
	lazyPriest.actions.shadowguard               = lazyPriest.Action:New("shadowguard",                "Spell_Nature_LightningShield")
	lazyPriest.actions.silence                   = lazyPriest.Action:New("silence",                    "Spell_Shadow_ImpPhaseShift")
	lazyPriest.actions.smite                     = lazyPriest.Action:New("smite",                      "Spell_Holy_HolySmite")
	lazyPriest.actions.starshards                = lazyPriest.Action:New("starshards",                 "Spell_Arcane_StarFire")
	lazyPriest.actions.touchWeakness             = lazyPriest.Action:New("touchWeakness",              "Spell_Shadow_DeadofNight")
	lazyPriest.actions.vampiricEmbrace           = lazyPriest.Action:New("vampiricEmbrace",            "Spell_Shadow_UnsummonBuilding")
	
	
	
	-- Special Priest actions
	-------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyPriest.comboActions.<actionName> or lazyPriest.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	function lazyPriest.bitParsers.shadowform(bit, actions, masks)
		if (not lazyPriest.rebit(bit, lazyPriest.actions.shadowform.codePattern)) then
			return false
		end
		local buffObj = lazyPriest.buffTable[lazyPriest.actions.shadowform.code]
		table.insert(actions, lazyPriest.actions.shadowform)
		table.insert(masks, lazyPriest.negWrapper(lazyPriest.masks.CheckBuffOrDebuff("player", buffObj, "buff", "", nil),true))
		return true
	end
	
	-- Simple Priest specific masks
	-------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyPriest.masks.<functionName> instead of
	-- lazyPriest.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	-- NONE
	
	-- Complex Priest masks
	-----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyPriest.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	-- NONE
	
	-- Priest utility functions
	---------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	-- NONE
	
	-- Custom AutoAttack
	--------------------
	-- Finally, include any modifications to the autoAttack function. If this omitted, lazyPriest
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	
	
	-- Custom command line arguments
	--------------------------------
	
	
	
	-- Custom minimap entries
	-------------------------
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	
	lazyPriest.defaultForms = {}
	
	lazyPriest.defaultForms.lowbie = {
		"stop-ifCasting",
		"stop-ifChannelling",
		"stop-ifNotInCombat-ifHasBuff=spiritTap-if<100%mana",
		"sayInMinion=Global cooldown-ifGlobalCooldown-ifNotWanding",
		"## Out of combat",
		"pws@self-ifNotInCombat-ifNotHasDebuff=weakenedSoul-if>95%mana",
		"pwf@self-ifNotHasBuff=pwf-ifNotInCombat",
		"innerFire-ifNotHasBuff=innerFire-ifNotInCombat",
		"cureDisease@self-ifPlayerIs=Diseased-ifNotInCombat",
		"## In combat heal",
		"pws@self-ifInCombat-ifNotHasBuff=pws-ifNotHasDebuff=weakenedSoul",
		"pws@self-ifPlayer<40%hp-ifInCombat-ifNotHasBuff=pws-ifNotHasDebuff=weakenedSoul",
		"flashHeal@self-ifPlayer>245hpDeficit",
		"## Open combat",
		"holyFire-ifNotInCombat-ifLastUsed>4.0s=holyFire",
		"## In combat",
		"swp-ifLastUsed>1.5s=swp-ifNotTargetHasDebuff=swp",
		"smite-ifTarget>50%hp",
		"## Wands",
		"stopWand-ifPlayer<40%hp",
		"wand-ifTarget<50%hp",
		"wand-ifPlayer<40%mana"
	}
	
	-- Custom data
	---------------
	-- Place any other tables of data unique to the class here.

	
	-- Custom initialization
	------------------------
	
	
	-- Custom help text
	-------------------
	-- Place any help text that pertains to class specific masks here.
	-- Because of formatting restrictions we place this last so that it does not mess up the indentation.
	function lazyPriest.CustomHelp()
		return [[
			<P>Currently None!</P>
		]]
	end
	
end -- lazyPriestLoad.LoadParsePriest()