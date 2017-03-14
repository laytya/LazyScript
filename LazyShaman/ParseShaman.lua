lazyShamanLoad.metadata:updateRevisionFromKeyword("$Revision: 654 $")

-- The functions and data inside this block will not be defined unless the user is a Shaman.

function lazyShamanLoad.LoadParseShaman()
	
	-- Shaman actions
	-----------------
	-- The lazyShaman.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	lazyShaman.actions.earthShock          = lazyShaman.Action:New("earthShock",        "Spell_Nature_EarthShock")
	lazyShaman.actions.flameShock          = lazyShaman.Action:New("flameShock",        "Spell_Fire_FlameShock")
	lazyShaman.actions.frostShock          = lazyShaman.Action:New("frostShock",        "Spell_Frost_FrostShock")
	
	lazyShaman.actions.flametongue         = lazyShaman.Action:New("flametongue",       "Spell_Fire_FlameTounge")
	lazyShaman.actions.frostbrand          = lazyShaman.Action:New("frostbrand",        "Spell_Frost_FrostBrand")
	lazyShaman.actions.rockbiter           = lazyShaman.Action:New("rockbiter",         "Spell_Nature_RockBiter")
	lazyShaman.actions.windfury            = lazyShaman.Action:New("windfury",          "Spell_Nature_Cyclone")
	
	lazyShaman.actions.chainHeal           = lazyShaman.Action:New("chainHeal",         "Spell_Nature_HealingWaveGreater")
	lazyShaman.actions.chainLight          = lazyShaman.Action:New("chainLight",        "Spell_Nature_ChainLightning")
	lazyShaman.actions.cureDisease         = lazyShaman.Action:New("cureDisease",       "Spell_Nature_RemoveDisease")
	lazyShaman.actions.curePoison          = lazyShaman.Action:New("curePoison",        "Spell_Nature_NullifyPoison")
	lazyShaman.actions.elemMastery         = lazyShaman.Action:New("elemMastery",       "Spell_Nature_WispHeal")
	lazyShaman.actions.ghostWolf           = lazyShaman.Action:New("ghostWolf",         "Spell_Nature_SpiritWolf")
	lazyShaman.actions.heal                = lazyShaman.Action:New("heal",              "Spell_Nature_MagicImmunity")
	lazyShaman.actions.lesserHeal          = lazyShaman.Action:New("lesserHeal",        "Spell_Nature_HealingWaveLesser")
	lazyShaman.actions.lightBolt           = lazyShaman.Action:New("lightBolt",         "Spell_Nature_Lightning")
	lazyShaman.actions.lightShield         = lazyShaman.Action:New("lightShield",       "Spell_Nature_LightningShield")
	lazyShaman.actions.natureSwift         = lazyShaman.Action:New("natureSwift",       "Spell_Nature_RavenForm")
	lazyShaman.actions.purge               = lazyShaman.Action:New("purge",             "Spell_Nature_Purge")
	lazyShaman.actions.stormstrike         = lazyShaman.Action:New("stormstrike",       "Spell_Holy_SealOfMight")
	
	-- Earth totems
	
	lazyShaman.actions.bindTotem           = lazyShaman.Action:New("bindTotem",         "Spell_Nature_StrengthOfEarthTotem02")
	lazyShaman.actions.clawTotem           = lazyShaman.Action:New("clawTotem",         "Spell_Nature_StoneClawTotem")
	lazyShaman.actions.skinTotem           = lazyShaman.Action:New("skinTotem",         "Spell_Nature_StoneSkinTotem")
	lazyShaman.actions.strengthTotem       = lazyShaman.Action:New("strengthTotem",     "Spell_Nature_EarthBindTotem")
	lazyShaman.actions.tremorTotem         = lazyShaman.Action:New("tremorTotem",       "Spell_Nature_TremorTotem")
	
	-- Fire totems
	
	lazyShaman.actions.fireNovaTotem       = lazyShaman.Action:New("fireNovaTotem",     "Spell_Fire_SealOfFire")
	lazyShaman.actions.flameTotem          = lazyShaman.Action:New("flameTotem",        "Spell_Nature_GuardianWard")
	lazyShaman.actions.frostResistTotem    = lazyShaman.Action:New("frostResistTotem",  "Spell_FrostResistanceTotem_01")
	lazyShaman.actions.magmaTotem          = lazyShaman.Action:New("magmaTotem",        "Spell_Fire_SelfDestruct")
	lazyShaman.actions.searingTotem        = lazyShaman.Action:New("searingTotem",      "Spell_Fire_SearingTotem")
	
	-- Water totems
	
	lazyShaman.actions.diseaseTotem        = lazyShaman.Action:New("diseaseTotem",      "Spell_Nature_DiseaseCleansingTotem")
	lazyShaman.actions.fireResistTotem     = lazyShaman.Action:New("fireResistTotem",   "Spell_FireResistanceTotem_01")
	lazyShaman.actions.hsTotem             = lazyShaman.Action:New("hsTotem",           "INV_Spear_04")
	lazyShaman.actions.msTotem             = lazyShaman.Action:New("msTotem",           "Spell_Nature_ManaRegenTotem")
	lazyShaman.actions.mtTotem             = lazyShaman.Action:New("mtTotem",           "Spell_Frost_SummonWaterElemental")
	lazyShaman.actions.poisonTotem         = lazyShaman.Action:New("poisonTotem",       "Spell_Nature_PoisonCleansingTotem")
	
	-- Air totems
	
	lazyShaman.actions.graceTotem          = lazyShaman.Action:New("graceTotem",        "Spell_Nature_InvisibilityTotem")
	lazyShaman.actions.groundingTotem      = lazyShaman.Action:New("groundingTotem",    "Spell_Nature_GroundingTotem")
	lazyShaman.actions.natureResistTotem   = lazyShaman.Action:New("natureResistTotem", "Spell_Nature_NatureResistanceTotem")
	lazyShaman.actions.sentryTotem         = lazyShaman.Action:New("sentryTotem",       "Spell_Nature_RemoveCurse") -- yes, this is the right texture
	lazyShaman.actions.tranquilTotem       = lazyShaman.Action:New("tranquilTotem",     "Spell_Nature_Brilliance")
	lazyShaman.actions.wfTotem             = lazyShaman.Action:New("wfTotem",           "Spell_Nature_Windfury")
	lazyShaman.actions.windwallTotem       = lazyShaman.Action:New("windwallTotem",     "Spell_Nature_EarthBind")
	
	-- Special Shaman actions
	-------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyShaman.comboActions.<actionName> or lazyShaman.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	
	
	-- Simple Shaman specific masks
	-------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyShaman.masks.<functionName> instead of
	-- lazyShaman.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	
	
	-- Complex Shaman masks
	-----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyShaman.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	
	-- Shaman utility functions
	---------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	
	-- Custom AutoAttack
	--------------------
	-- Include any modifications to the autoAttack function. If this omitted, lazyShaman
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	
	-- Custom command line arguments
	--------------------------------
	
	
	
	-- Custom minimap entries
	-------------------------
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	
	lazyShaman.defaultForms = {}
	
	lazyShaman.defaultForms.solo = {
		"-- Out of combat",
		"heal-ifNotInCombat-ifPlayer<60%hp-spellTargetUnit=player",
		"curePoison-ifNotInCombat-ifPlayerIs=Poisoned-spellTargetUnit=player",
		"cureDisease-ifNotInCombat-ifPlayerIs=Diseased-spellTargetUnit=player",
		"windfury-ifNotMainHandBuffed",
		"lightShield-ifNotHasBuff=lightShield-ifNotInCombat-ifPlayer>50%mana",
		"-- In combat",
		"stop-ifCasting",
		"earthShock(rank1)-ifTargetIsCasting",
		"frostShock(rank1)-ifTargetFleeing",
		"lesserHeal-ifInCombat-ifPlayer<50%hp-spellTargetUnit=player",
		"strengthTotem-ifNotHasBuff=strengthTotem-ifNotTargetFriend-ifPlayer>50%hp",
		"lightBolt-ifNotInCombat-ifNotTargetFriend",
		"hsTotem-ifNotHasBuff=hsTotem-ifNotTargetFriend",
		"lightShield-ifNotHasBuff=lightShield-ifInCombat-ifPlayer>60%mana",
	}
	lazyShaman.defaultForms.lowbie = {
		"-- Out of combat",
		"heal@player-ifNotInCombat-ifPlayer<60%hp",
		"curePoison@player-ifNotInCombat-ifPlayerIs=Poisoned",
		"lightShield-ifNotHasBuff=lightShield-ifNotInCombat-ifPlayer>50%mana",
		"rockbiter-ifNotMainHandBuffed",
		"-- In combat",
		"stop-ifCasting",
		"earthShock(rank1)-ifTargetIsCasting",
		"frostShock(rank1)-ifTargetFleeing",
		"lesserHeal@player-ifInCombat-ifPlayer<50%hp",
		"strengthTotem-ifNotHasBuff=strengthTotem-ifNotTargetFriend-ifPlayer>50%hp",
		"lightShield-ifNotHasBuff=lightShield-ifInCombat-ifPlayer>60%mana",
		"lightBolt-ifNotInCombat-ifNotTargetFriend",
	}
	
	-- Custom data
	---------------
	-- Place any other tables of data unique to the class here.
	

	-- Custom initialization
	------------------------
	
	
	-- Custom help text
	-------------------
	-- Place any help text that pertains to class specific actions and masks here.
	-- Because of formatting restrictions we place this last so that it does not mess up the indentation.
	function lazyShaman.CustomHelp()
		return [[
			<P>Currently None!</P>
		]]
	end
	
end -- function lazyShamanLoad.LoadParseShaman()