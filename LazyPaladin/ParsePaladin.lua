lazyPaladinLoad.metadata:updateRevisionFromKeyword("$Revision: 715 $")

-- The functions and data inside this block will not be defined unless the user is a Paladin.

function lazyPaladinLoad.LoadParsePaladin()
	
	-- Paladin actions
	-----------------
	-- The lazyPaladin.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	lazyPaladin.actions.blessFree       = lazyPaladin.Action:New("blessFree",           "Spell_Holy_SealOfValor")
	lazyPaladin.actions.blessKings      = lazyPaladin.Action:New("blessKings",          "Spell_Magic_MageArmor")
	lazyPaladin.actions.blessLight      = lazyPaladin.Action:New("blessLight",          "Spell_Holy_PrayerOfHealing02")
	lazyPaladin.actions.blessMight      = lazyPaladin.Action:New("blessMight",          "Spell_Holy_FistOfJustice")
	lazyPaladin.actions.blessProt       = lazyPaladin.Action:New("blessProt",           "Spell_Holy_SealOfProtection")
	lazyPaladin.actions.blessSac        = lazyPaladin.Action:New("blessSac",            "Spell_Holy_SealOfSacrifice")
	lazyPaladin.actions.blessSlv        = lazyPaladin.Action:New("blessSlv",            "Spell_Holy_SealOfSalvation")
	lazyPaladin.actions.blessSnct       = lazyPaladin.Action:New("blessSnct",           "Spell_Nature_LightningShield")
	lazyPaladin.actions.blessWisdom     = lazyPaladin.Action:New("blessWisdom",         "Spell_Holy_SealOfWisdom")
	lazyPaladin.actions.cleanse         = lazyPaladin.Action:New("cleanse",             "Spell_Holy_Renew")
	lazyPaladin.actions.crusaderStrike  = lazyPaladin.Action:New("crusaderStrike",      "Spell_Holy_CrusaderStrike")
	lazyPaladin.actions.consecrate      = lazyPaladin.Action:New("consecrate",          "Spell_Holy_InnerFire")
	lazyPaladin.actions.divFavor        = lazyPaladin.Action:New("divFavor",            "Spell_Holy_Heal")
	lazyPaladin.actions.divIntr         = lazyPaladin.Action:New("divIntr",             "Spell_Nature_TimeStop")
	lazyPaladin.actions.divProt         = lazyPaladin.Action:New("divProt",             "Spell_Holy_Restoration")
	lazyPaladin.actions.divShield       = lazyPaladin.Action:New("divShield",           "Spell_Holy_DivineIntervention")  -- yes, this is the right texture
	lazyPaladin.actions.exorcism        = lazyPaladin.Action:New("exorcism",            "Spell_Holy_Excorcism_02")
	lazyPaladin.actions.flashLight      = lazyPaladin.Action:New("flashLight",          "Spell_Holy_FlashHeal")
	lazyPaladin.actions.gBlessKings     = lazyPaladin.Action:New("gBlessKings",         "Spell_Magic_GreaterBlessingofKings")
	lazyPaladin.actions.gBlessLight     = lazyPaladin.Action:New("gBlessLight",         "Spell_Holy_GreaterBlessingofLight")
	lazyPaladin.actions.gBlessMight     = lazyPaladin.Action:New("gBlessMight",         "Spell_Holy_GreaterBlessingofKings")
	lazyPaladin.actions.gBlessSlv       = lazyPaladin.Action:New("gBlessSlv",           "Spell_Holy_GreaterBlessingofSalvation")
	lazyPaladin.actions.gBlessSnct      = lazyPaladin.Action:New("gBlessSnct",          "Spell_Holy_GreaterBlessingofSanctuary")
	lazyPaladin.actions.gBlessWisdom    = lazyPaladin.Action:New("gBlessWisdom",        "Spell_Holy_GreaterBlessingofWisdom")
	lazyPaladin.actions.handFreedom     = lazyPaladin.Action:New("handFreedom",         "Spell_Holy_SealOfValor")
	lazyPaladin.actions.handProt        = lazyPaladin.Action:New("handProt",            "Spell_Holy_SealOfMight")
	lazyPaladin.actions.hmrJustice      = lazyPaladin.Action:New("hmrJustice",          "Spell_Holy_SealOfProtection")
	lazyPaladin.actions.hmrWrath        = lazyPaladin.Action:New("hmrWrath",            "Ability_ThunderClap")
	lazyPaladin.actions.holyLight       = lazyPaladin.Action:New("holyLight",           "Spell_Holy_HolyBolt")
	lazyPaladin.actions.holyShield      = lazyPaladin.Action:New("holyShield",          "Spell_Holy_BlessingOfProtection")
	lazyPaladin.actions.holyShock       = lazyPaladin.Action:New("holyShock",           "Spell_Holy_SearingLight")
	lazyPaladin.actions.holyStrike       = lazyPaladin.Action:New("holyStrike",           "INV_Sword_01")
	lazyPaladin.actions.holyWrath       = lazyPaladin.Action:New("holyWrath",           "Spell_Holy_Excorcism")
	lazyPaladin.actions.judge           = lazyPaladin.Action:New("judge",               "Spell_Holy_RighteousFury", nil, false)
	lazyPaladin.actions.layOnHands      = lazyPaladin.Action:New("layOnHands",          "Spell_Holy_LayOnHands")
	lazyPaladin.actions.purify          = lazyPaladin.Action:New("purify",              "Spell_Holy_Purify")
	lazyPaladin.actions.redemption      = lazyPaladin.Action:New("redemption",          "Spell_Holy_Resurrection")
	lazyPaladin.actions.repentance      = lazyPaladin.Action:New("repentance",          "Spell_Holy_PrayerOfHealing")
	lazyPaladin.actions.rightFury       = lazyPaladin.Action:New("rightFury",           "Spell_Holy_SealOfFury")
	lazyPaladin.actions.sealCommand     = lazyPaladin.Action:New("sealCommand",         "Ability_Warrior_InnerRage")
	lazyPaladin.actions.sealCrusader    = lazyPaladin.Action:New("sealCrusader",        "Spell_Holy_HolySmite")
	lazyPaladin.actions.sealJustice     = lazyPaladin.Action:New("sealJustice",         "Spell_Holy_SealOfWrath")
	lazyPaladin.actions.sealLight       = lazyPaladin.Action:New("sealLight",           "Spell_Holy_HealingAura")
	lazyPaladin.actions.sealRight       = lazyPaladin.Action:New("sealRight",           "Ability_ThunderBolt")
	lazyPaladin.actions.sealWisdom      = lazyPaladin.Action:New("sealWisdom",          "Spell_Holy_RighteousnessAura")
	lazyPaladin.actions.senseUndead     = lazyPaladin.Action:New("senseUndead",         "Spell_Holy_SenseUndead")
	lazyPaladin.actions.smnCharger		= lazyPaladin.Action:New("smnCharger",          "Ability_Mount_Charger")
	lazyPaladin.actions.smnWarhorse     = lazyPaladin.Action:New("smnWarhorse",         "Spell_Nature_Swiftness")
	lazyPaladin.actions.turnUndead      = lazyPaladin.Action:New("turnUndead",          "Spell_Holy_TurnUndead")
	
	lazyPaladin.shapeshift.concAura     = lazyPaladin.ShapeshiftForm:New("concAura",    "Spell_Holy_MindSooth")
	lazyPaladin.shapeshift.devAura      = lazyPaladin.ShapeshiftForm:New("devAura",     "Spell_Holy_DevotionAura")
	lazyPaladin.shapeshift.fireAura     = lazyPaladin.ShapeshiftForm:New("fireAura",    "Spell_Fire_SealOfFire")
	lazyPaladin.shapeshift.frostAura    = lazyPaladin.ShapeshiftForm:New("frostAura",   "Spell_Frost_WizardMark")
	lazyPaladin.shapeshift.retAura      = lazyPaladin.ShapeshiftForm:New("retAura",     "Spell_Holy_AuraOfLight")
	lazyPaladin.shapeshift.sanctAura    = lazyPaladin.ShapeshiftForm:New("sanctAura",   "Spell_Holy_MindVision")
	lazyPaladin.shapeshift.shadowAura   = lazyPaladin.ShapeshiftForm:New("shadowAura",  "Spell_Shadow_SealOfKings")
	
	
	-- Special Paladin actions
	-------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyPaladin.comboActions.<actionName> or lazyPaladin.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	function lazyPaladin.bitParsers.concAura(bit, actions, masks)
		if (not lazyPaladin.rebit(bit, lazyPaladin.shapeshift.concAura.codePattern)) then
			return false
		end
		table.insert(actions, lazyPaladin.shapeshift.concAura)
		return true
	end
	
	function lazyPaladin.bitParsers.devAura(bit, actions, masks)
		if (not lazyPaladin.rebit(bit, lazyPaladin.shapeshift.devAura.codePattern)) then
			return false
		end
		table.insert(actions, lazyPaladin.shapeshift.devAura)
		return true
	end
	
	function lazyPaladin.bitParsers.fireAura(bit, actions, masks)
		if (not lazyPaladin.rebit(bit, lazyPaladin.shapeshift.fireAura.codePattern)) then
			return false
		end
		table.insert(actions, lazyPaladin.shapeshift.fireAura)
		return true
	end
	
	function lazyPaladin.bitParsers.frostAura(bit, actions, masks)
		if (not lazyPaladin.rebit(bit, lazyPaladin.shapeshift.frostAura.codePattern)) then
			return false
		end
		table.insert(actions, lazyPaladin.shapeshift.frostAura)
		return true
	end
	
	function lazyPaladin.bitParsers.retAura(bit, actions, masks)
		if (not lazyPaladin.rebit(bit, lazyPaladin.shapeshift.retAura.codePattern)) then
			return false
		end
		table.insert(actions, lazyPaladin.shapeshift.retAura)
		return true
	end
	
	function lazyPaladin.bitParsers.sanctAura(bit, actions, masks)
		if (not lazyPaladin.rebit(bit, lazyPaladin.shapeshift.sanctAura.codePattern)) then
			return false
		end
		table.insert(actions, lazyPaladin.shapeshift.sanctAura)
		return true
	end
	
	function lazyPaladin.bitParsers.shadowAura(bit, actions, masks)
		if (not lazyPaladin.rebit(bit, lazyPaladin.shapeshift.shadowAura.codePattern)) then
			return false
		end
		table.insert(actions, lazyPaladin.shapeshift.shadowAura)
		return true
	end
	
	-- Simple Paladin specific masks
	-------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyPaladin.masks.<functionName> instead of
	-- lazyPaladin.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	
	
	-- Complex Paladin masks
	-----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyPaladin.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	
	
	-- Paladin utility functions
	---------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	
	-- Custom AutoAttack
	--------------------
	-- Include any modifications to the autoAttack function. If this omitted, lazyPaladin
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	
	-- Custom command line arguments
	--------------------------------
	
	
	
	-- Custom minimap entries
	-------------------------
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	
	lazyPaladin.defaultForms = {}
	
	lazyPaladin.defaultForms.solo = {
		"stop-ifCasting",
		"devAura-ifNotHasBuff=devAura",
		"-- self healing",
		"divProt@player-ifPlayer<40%hp-ifNotHasBuff=blessProt",
		"hmrJustice-ifPlayer<40%hp-ifTargetOfTarget-ifTargetAlive-ifNotHasBuff=divProt",
		"blessProt@player-ifPlayer<40%hp-ifNotHasBuff=divProt",
		"holyLight@player-ifPlayer<40%hp",
		"blessMight@player-ifNotHasBuff=blessMight,blessProt",
		"stop-ifNotTargetAlive",
		"-- start with Crusader, judge the mob and swtich to Righteousness",
		"sealCrusader-ifNotHasBuff=sealCrusader-ifNotInCombat",
		"judge-sealRight-ifHasBuff=sealCrusader-ifNotTargetClass=mage",
		"judge-sealRight-ifTargetHasDebuff=judgeCrusader-ifTarget>40%hp-ifPlayer>50%mana",
		"-- once in combat, only cast Crusader if no other seal is up",
		"sealCrusader-ifNotHasBuff=sealCrusader,sealRight-ifTarget>10%hp-ifNotTargetHasDebuff=judgeCrusader",
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
	function lazyPaladin.CustomHelp()
		return [[
			<P>Currently None!</P>
		]]
	end
	
end -- function lazyPaladinLoad.LoadParsePaladin()