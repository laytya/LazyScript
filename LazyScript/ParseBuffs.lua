lazyScript.metadata:updateRevisionFromKeyword("$Revision: 741 $")

lazyScript.Buff = {}
function lazyScript.Buff:New(code, texture, categories)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.texture = texture                  -- name of the icon used for the action
	if obj.texture then
		obj.texture = LS_TEXTURE_PREFIX..obj.texture
	end
	if (categories ~= nil) then
		obj.categories = {}
		for category in string.gfind(categories, "[^,]+") do
			table.insert(obj.categories, category)
		end
		else
		obj.categories = nil
	end
	
	local enOk = false
	local sayNothing = false
	obj.name = lazyScript.getLocaleString("BUFF_TTS."..code, enOk, sayNothing)       -- Link to locale name
	
	sayNothing = true
	obj.body = lazyScript.getLocaleString("BUFF_BODY_TTS."..code, enOk, sayNothing)  -- Link to locale body text
	return obj
end


function lazyScript.loadBuffTable()
	if not lazyScript.getLocaleString("BUFF_TTS", false, true) then
		lazyScript.p(OPTIMIZED_BUFF_DEBUFF_CHECK_NOT_VALID)
		lazyScript.buffTable = {}
		return
	end
	
	-- All buff checking happens here because a rogue might want to know about hunter buffs and vice-versa.
	-- Use both locale and English name so that users can still search by the english name
	-- if there is no locale match yet.
	lazyScript.buffTable = {
		brainFood            = lazyScript.Buff:New("brainFood",           "INV_Misc_Fish_21",                 "drink"       ),
		berserking           = lazyScript.Buff:New("berserking",          "Racial_Troll_Berserk"                            ),
		bloodFury            = lazyScript.Buff:New("bloodFury",           "Racial_Orc_BerserkerStrength"                    ),
		cannibalize          = lazyScript.Buff:New("cannibalize",         "Ability_Racial_Cannibalize",       "food"        ),
		dazed                = lazyScript.Buff:New("dazed",               "Spell_Frost_Stun"                                ),
		drink                = lazyScript.Buff:New("drink",               "INV_Drink_07",                     "drink"       ),
		food                 = lazyScript.Buff:New("food",                "INV_Misc_Fork&Knife",              "food"        ),
		fishFood             = lazyScript.Buff:New("fishFood",            "INV_Misc_Fish_21",                 "food"        ),
		firstAid             = lazyScript.Buff:New("firstAid",            "Spell_Holy_Heal"                                 ),
		recentlyBandaged     = lazyScript.Buff:New("recentlyBandaged",    "INV_Misc_Bandage_08"                             ),
		shadowmeld           = lazyScript.Buff:New("shadowmeld",          "Ability_Ambush",                   "stealth"     ),
		silverwingFlag       = lazyScript.Buff:New("silverwingFlag",      "INV_BannerPVP_02"                                ),
		wellFed              = lazyScript.Buff:New("wellFed",             "Spell_Misc_Food"                                 ),
		warsongFlag          = lazyScript.Buff:New("warsongFlag",         "INV_BannerPVP_01"                                ),
		
		-- Rogue related
		adrenaline           = lazyScript.Buff:New("adrenaline",          "Spell_Shadow_ShadowWordDominate"                 ),
		bladeFlurry          = lazyScript.Buff:New("bladeFlurry",         "Ability_Warrior_PunishingBlow"                   ),
		blind                = lazyScript.Buff:New("blind",               "Spell_Shadow_MindSteal",           "cc"          ),
		cs                   = lazyScript.Buff:New("cs",                  "Ability_CheapShot",                "stun"        ),
		coldBlood            = lazyScript.Buff:New("coldBlood",           "Spell_Ice_Lament"                                ),
		evasion              = lazyScript.Buff:New("evasion",             "Spell_Shadow_ShadowWard"                         ),
		expose               = lazyScript.Buff:New("expose",              "Ability_Warrior_Riposte"                         ),
		garrote              = lazyScript.Buff:New("garrote",             "Ability_Rogue_Garrote",            "bleed,dot"   ),
		ghostly              = lazyScript.Buff:New("ghostly",             "Spell_Shadow_Curse"                              ),
		gouge                = lazyScript.Buff:New("gouge",               "Ability_Gouge",                    "cc"          ),
		hemo                 = lazyScript.Buff:New("hemo",                "Spell_Shadow_LifeDrain",           "bleed"       ),
		ks                   = lazyScript.Buff:New("ks",                  "Ability_Rogue_KidneyShot"                        ),
		remorseless          = lazyScript.Buff:New("remorseless",         "Ability_FiegnDead"                               ),
		rupture              = lazyScript.Buff:New("rupture",             "Ability_Rogue_Rupture",            "bleed,dot"   ),
		sap                  = lazyScript.Buff:New("sap",                 "Ability_Sap",                      "cc"          ),
		snd                  = lazyScript.Buff:New("snd",                 "Ability_Rogue_SliceDice"                         ),
		stealth              = lazyScript.Buff:New("stealth",             "Ability_Stealth",                  "stealth"     ),
		vanish               = lazyScript.Buff:New("vanish",              "Ability_Vanish"                                  ),
		
		-- Druid related
		bear                 = lazyScript.Buff:New("bear",                "Ability_Racial_BearForm"                         ),
		aquatic              = lazyScript.Buff:New("aquatic",             "Ability_Druid_AquaticForm"                       ),
		cat                  = lazyScript.Buff:New("cat",                 "Ability_Druid_CatForm"                           ),
		travel               = lazyScript.Buff:New("travel",              "Ability_Druid_TravelForm"                        ),
		direBear             = lazyScript.Buff:New("direBear",            "Ability_Racial_BearForm"                         ),
		moonkin              = lazyScript.Buff:New("moonkin",             "Spell_Nature_ForceOfNature"                      ),
		
		prowl                = lazyScript.Buff:New("prowl",               "Ability_Ambush",                   "stealth"     ),
		rake                 = lazyScript.Buff:New("rake",                "Ability_Druid_Disembowel",         "bleed,dot"   ),
		rip                  = lazyScript.Buff:New("rip",                 "Ability_GhoulFrenzy",              "dot"         ),
		dash                 = lazyScript.Buff:New("dash",                "Ability_Druid_Dash"                              ),
		pounce               = lazyScript.Buff:New("pounce",              "Ability_Druid_SupriseAttack",      "dot"         ),
		tigersFury           = lazyScript.Buff:New("tigersFury",          "Ability_Mount_JungleTiger"                       ),
		
		bash                 = lazyScript.Buff:New("bash",                "Ability_Druid_Bash",               "stun"        ),
		charge               = lazyScript.Buff:New("charge",              "Ability_Hunter_Pet_Bear",          "immobile"    ),
		demoralize           = lazyScript.Buff:New("demoralize",          "Ability_Druid_DemoralizingRoar"                  ),
		enrage               = lazyScript.Buff:New("enrage",              "Ability_Druid_Enrage"                            ),
		frenziedRegen        = lazyScript.Buff:New("frenziedRegen",       "Ability_BullRush"                                ),
		
		abolishPoison        = lazyScript.Buff:New("abolishPoison",       "Spell_Nature_NullifyPoison_02"                   ),
		barkskin             = lazyScript.Buff:New("barkskin",            "Spell_Nature_StoneClawTotem"                     ),
		faerieFire           = lazyScript.Buff:New("faerieFire",          "Spell_Nature_FaerieFire"                         ),
		gotw                 = lazyScript.Buff:New("gotw",                "Spell_Nature_Regeneration"                       ),
		grasp                = lazyScript.Buff:New("grasp",               "Spell_Nature_NaturesWrath"                       ), -- check
		hibernate            = lazyScript.Buff:New("hibernate",           "Spell_Nature_Sleep",               "cc"          ),
		innervate            = lazyScript.Buff:New("innervate",           "Spell_Nature_Lightning"                          ),
		moonfire             = lazyScript.Buff:New("moonfire",            "Spell_Nature_StarFall",            "dot"         ),
		motw                 = lazyScript.Buff:New("motw",                "Spell_Nature_Regeneration"                       ),
		ns                   = lazyScript.Buff:New("ns",                  "Spell_Nature_RavenForm"                          ), -- check
		ooc                  = lazyScript.Buff:New("ooc",                 "Spell_Nature_CrystalBall"                        ), -- check
		regrowth             = lazyScript.Buff:New("regrowth",            "Spell_Nature_ResistNature",        "hot"         ),
		rejuv                = lazyScript.Buff:New("rejuv",               "Spell_Nature_Rejuvenation",        "hot"         ),
		roots                = lazyScript.Buff:New("roots",               "Spell_Nature_StrangleVines",       "dot,immobile"),
		soothe               = lazyScript.Buff:New("soothe",              "Ability_Hunter_BeastSoothe"                      ),
		swarm                = lazyScript.Buff:New("swarm",               "Spell_Nature_InsectSwarm",         "dot"         ), -- check
		thorns               = lazyScript.Buff:New("thorns",              "Spell_Nature_Thorns"                             ),
		tranquility          = lazyScript.Buff:New("tranquility",         "Spell_Nature_Tranquility",         "hot"         ),
		
		
		-- Hunter related
		aspectBeast          = lazyScript.Buff:New("aspectBeast",         "Ability_Mount_PinkTiger"                         ),
		aspectCheetah        = lazyScript.Buff:New("aspectCheetah",       "Ability_Mount_JungleTiger"                       ),
		aspectHawk           = lazyScript.Buff:New("aspectHawk",          "Spell_Nature_RavenForm"                          ),
		aspectPack           = lazyScript.Buff:New("aspectPack",          "Ability_Mount_WhiteTiger"                        ),
		aspectMonkey         = lazyScript.Buff:New("aspectMonkey",        "Ability_Hunter_AspectOfTheMonkey"                ),
		aspectWild           = lazyScript.Buff:New("aspectWild",          "Spell_Nature_ProtectionformNature"               ),
		bestialWrath         = lazyScript.Buff:New("bestialWrath",        "Ability_Druid_FerociousBite"                     ),
		concussive           = lazyScript.Buff:New("concussive",          "Spell_Frost_Stun"                                ),
		eagleEye             = lazyScript.Buff:New("eagleEye",            "Ability_Hunter_EagleEye"                         ),
		eotb                 = lazyScript.Buff:New("eotb",                "Ability_EyeOfTheOwl"                             ),
		explosiveTrap        = lazyScript.Buff:New("explosiveTrap",       "Spell_Fire_SelfDestruct",          "dot"         ),
		feedPet              = lazyScript.Buff:New("feedPet",             "Ability_Hunter_BeastTraining"                    ),
		feign                = lazyScript.Buff:New("feign",               "Ability_Rogue_FeignDeath"                        ),
		freezingTrap         = lazyScript.Buff:New("freezingTrap",        "Spell_Frost_ChainsOfIce",          "cc"          ),
		frostTrap            = lazyScript.Buff:New("frostTrap",           "Spell_Frost_FrostNova",            "slow"        ),
		furiousHowl          = lazyScript.Buff:New("furiousHowl",         "Ability_Hunter_Pet_Wolf"                         ),
		huntersMark          = lazyScript.Buff:New("huntersMark",         "Ability_Hunter_SniperShot"                       ),
		immolationTrap       = lazyScript.Buff:New("immolationTrap",      "Spell_Fire_FlameShock",            "dot"         ),
		intimidate           = lazyScript.Buff:New("intimidate",          "Ability_Devour",                   "stun"        ),
		quickShots           = lazyScript.Buff:New("quickShots",          "Ability_Warrior_InnerRage"                       ),
		rapidFire            = lazyScript.Buff:New("rapidFire",           "Ability_Hunter_RunningShot"                      ),
		scare                = lazyScript.Buff:New("scare",               "Ability_Druid_Cower",              "fear"        ),
		scatter              = lazyScript.Buff:New("scatter",             "Ability_GolemStormBolt",           "cc"          ),
		scorpid              = lazyScript.Buff:New("scorpid",             "Ability_Hunter_CriticalShot",      "sting"       ),
		serpent              = lazyScript.Buff:New("serpent",             "Ability_Hunter_Quickshot",         "sting,dot"   ),
		trueshot             = lazyScript.Buff:New("trueshot",            "Ability_TrueShot"                                ),
		viper                = lazyScript.Buff:New("viper",               "Ability_Hunter_AimedShot",         "sting"       ),
		wingClip             = lazyScript.Buff:New("wingClip",            "Ability_Rogue_Trip"                              ),
		wyvern               = lazyScript.Buff:New("wyvern",              "INV_Spear_02",                     "sting"       ),
		wyvernDot            = lazyScript.Buff:New("wyvernDot",           "INV_Spear_02",                     "sting, dot"  ),
		wyvernCC             = lazyScript.Buff:New("wyvernCC",            "INV_Spear_02",                     "sting, cc"   ),
		
		-- Priest related
		abolishDisease       = lazyScript.Buff:New("abolishDisease",      "Spell_Nature_NullifyDisease"                     ),
		devouringPlague      = lazyScript.Buff:New("devouringPlague",     "Spell_Shadow_BlackPlague",         "dot"         ),
		divineSpirit         = lazyScript.Buff:New("divineSpirit",        "Spell_Holy_DivineSpirit"                         ),
		elunesGrace          = lazyScript.Buff:New("elunesGrace",         "Spell_Holy_ElunesGrace"                          ),
		fade                 = lazyScript.Buff:New("fade",                "Spell_Magic_LesserInvisibilty"                   ),
		fearWard             = lazyScript.Buff:New("fearWard",            "Spell_Holy_Excorcism"                            ),
		feedback             = lazyScript.Buff:New("feedback",            "Spell_Shadow_RitualOfSacrifice"                  ),
		hexWeakness          = lazyScript.Buff:New("hexWeakness",         "Spell_Shadow_FingerOfDeath"                      ),
		holyFire             = lazyScript.Buff:New("holyFire",            "Spell_Holy_SearingLight",          "dot"         ),
		innerFire            = lazyScript.Buff:New("innerFire",           "Spell_Holy_InnerFire"                            ),
		innerFocus           = lazyScript.Buff:New("innerFocus",          "Spell_Frost_WindWalkOn"                          ),
		levitate             = lazyScript.Buff:New("levitate",            "Spell_Holy_LayOnHands"                           ),
		lightwell            = lazyScript.Buff:New("lightwell",           "Spell_Holy_SummonLightwell"                      ),
		lightwellRenew       = lazyScript.Buff:New("lightwellRenew",      "Spell_Holy_SummonLightwell",       "hot"         ),
		mindControl          = lazyScript.Buff:New("mindControl",         "Spell_Shadow_ShadowWordDominate",  "channel,charm"),
		mindFlay             = lazyScript.Buff:New("mindFlay",            "Spell_Shadow_SiphonMana",          "dot,channel" ),
		mindSoothe           = lazyScript.Buff:New("mindSoothe",          "Spell_Holy_MindSooth"                            ),
		mindVision           = lazyScript.Buff:New("mindVision",          "Spell_Holy_MindVision",            "channel"     ),
		powerInfusion        = lazyScript.Buff:New("powerInfusion",       "Spell_Holy_PowerInfusion"                        ),
		pwf                  = lazyScript.Buff:New("pwf",                 "Spell_Holy_WordFortitude"                        ),
		pws                  = lazyScript.Buff:New("pws",                 "Spell_Holy_PowerWordShield",       "absorb"      ),
		prf                  = lazyScript.Buff:New("prf",                 "Spell_Holy_PrayerOfFortitude"                    ),
		prsp                 = lazyScript.Buff:New("prsp",                "Spell_Holy_PrayerofShadowProtection"             ),
		prs                  = lazyScript.Buff:New("prs",                 "Spell_Holy_PrayerofSpirit"                       ),
		psychicScream        = lazyScript.Buff:New("psychicScream",       "Spell_Shadow_PsychicScream",       "fear"        ),
		renew                = lazyScript.Buff:New("renew",               "Spell_Holy_Renew",                 "hot"         ),
		shackleUndead        = lazyScript.Buff:New("shackleUndead",       "Spell_Nature_Slow",                "cc"          ),
		shadowProtection     = lazyScript.Buff:New("shadowProtection",    "Spell_Shadow_AntiShadow"                         ),
		swp                  = lazyScript.Buff:New("swp",                 "Spell_Shadow_ShadowWordPain",      "dot"         ),
		shadowform           = lazyScript.Buff:New("shadowform",          "Spell_Shadow_Shadowform"                         ),
		shadowguard          = lazyScript.Buff:New("shadowguard",         "Spell_Nature_LightningShield"                    ),
		shadowVulnerability  = lazyScript.Buff:New("shadowVulnerability", "Spell_Shadow_BlackPlague"                        ),
		spiritTap            = lazyScript.Buff:New("spiritTap",           "Spell_Shadow_Requiem"                            ),
		starshards           = lazyScript.Buff:New("starshards",          "Spell_Arcane_StarFire",            "dot,channel" ),
		touchWeakness        = lazyScript.Buff:New("touchWeakness",       "Spell_Shadow_DeadofNight"                        ),
		vampiricEmbrace      = lazyScript.Buff:New("vampiricEmbrace",     "Spell_Shadow_UnsummonBuilding",    "dot"         ),
		weakenedSoul         = lazyScript.Buff:New("weakenedSoul",        "Spell_Holy_AshesToAshes"                         ),
		
		-- Mage related
		amplifyMagic         = lazyScript.Buff:New("amplifyMagic",        "Spell_Holy_FlashHeal"                            ),
		brilliance           = lazyScript.Buff:New("brilliance",          "Spell_Holy_ArcaneIntellect"                      ),
		combustion           = lazyScript.Buff:New("combustion",          "Spell_Fire_SealOfFire"                           ),
		dampenMagic          = lazyScript.Buff:New("dampenMagic",         "Spell_Nature_AbolishMagic"                       ),
		evocation            = lazyScript.Buff:New("evocation",           "Spell_Nature_Purge"                              ),
		fireVulnerability    = lazyScript.Buff:New("fireVulnerability",   "Spell_Fire_SoulBurn"                             ),
		fireWard             = lazyScript.Buff:New("fireWard",            "Spell_Fire_FireArmor"                            ),
		frostWard            = lazyScript.Buff:New("frostWard",           "Spell_Frost_FrostWard"                           ),
		frostArmor           = lazyScript.Buff:New("frostArmor",          "Spell_Frost_FrostArmor02"                        ),
		frostbolt            = lazyScript.Buff:New("frostbolt",           "Spell_Frost_FrostBolt02",          "slow"        ),
		iceArmor             = lazyScript.Buff:New("iceArmor",            "Spell_Frost_FrostArmor02"                        ),
		iceBarrier           = lazyScript.Buff:New("iceBarrier",          "Spell_Ice_Lament"                                ),
		iceBlock             = lazyScript.Buff:New("iceBlock",            "Spell_Frost_Frost"                               ),
		ignite               = lazyScript.Buff:New("ignite",              "Spell_Fire_Incinerate"                           ),
		intellect            = lazyScript.Buff:New("intellect",           "Spell_Holy_MagicalSentry"                        ),
		mageArmor            = lazyScript.Buff:New("mageArmor",           "Spell_MageArmor"                                 ),
		manaShield           = lazyScript.Buff:New("manaShield",          "Spell_Shadow_DetectLesserInvisibility"           ),
		polymorph            = lazyScript.Buff:New("polymorph",           "Spell_Nature_Polymorph",           "cc,polymorph"),
		polymorphPig         = lazyScript.Buff:New("polymorphPig",        "Spell_Magic_PolymorphPig",         "cc,polymorph"),
		polymorphTurtle      = lazyScript.Buff:New("polymorphTurtle",     "Ability_Hunter_Pet_Turtle",        "cc,polymorph"),
		
		-- Paladin related
		concAura             = lazyScript.Buff:New("concAura",            "Spell_Holy_MindSooth"                            ),
		devAura              = lazyScript.Buff:New("devAura",             "Spell_Holy_DevotionAura"                         ),
		fireAura             = lazyScript.Buff:New("fireAura",            "Spell_Fire_SealOfFire"                           ),
		retAura              = lazyScript.Buff:New("retAura",             "Spell_Holy_AuraOfLight"                          ),
		sanctAura            = lazyScript.Buff:New("sanctAura",           "Spell_Holy_MindVision"                           ),
		shadowAura           = lazyScript.Buff:New("shadowAura",          "Spell_Shadow_SealOfKings"                        ),
		blessFree            = lazyScript.Buff:New("blessFree",           "Spell_Holy_SealOfValor"                          ),
		blessKings           = lazyScript.Buff:New("blessKings",          "Spell_Magic_MageArmor"                           ),
		blessLight           = lazyScript.Buff:New("blessLight",          "Spell_Holy_PrayerOfHealing02"                    ),
		blessMight           = lazyScript.Buff:New("blessMight",          "Spell_Holy_FistOfJustice"                        ),
		blessProt            = lazyScript.Buff:New("blessProt",           "Spell_Holy_SealOfProtection"                     ),
		blessSac             = lazyScript.Buff:New("blessSac",            "Spell_Holy_SealOfSacrifice"                      ),
		blessSlv             = lazyScript.Buff:New("blessSlv",            "Spell_Holy_SealOfSalvation"                      ),
		blessSnct            = lazyScript.Buff:New("blessSnct",           "Spell_Nature_LightningShield"                    ),
		blessWisdom          = lazyScript.Buff:New("blessWisdom",         "Spell_Holy_SealOfWisdom"                         ),
		divFavor             = lazyScript.Buff:New("divFavor",            "Spell_Holy_Heal"                                 ),
		divProt              = lazyScript.Buff:New("divProt",             "Spell_Holy_Restoration"                          ),
		divShield            = lazyScript.Buff:New("divShield",           "Spell_Holy_DivineIntervention"                   ),
		forbearance          = lazyScript.Buff:New("forbearance",         "Spell_Holy_RemoveCurse"                          ),
		gBlessKings          = lazyScript.Buff:New("gBlessKings",         "Spell_Magic_GreaterBlessingofKings"              ),
		gBlessLight          = lazyScript.Buff:New("gBlessLight",         "Spell_Holy_GreaterBlessingofLight"               ),
		gBlessMight          = lazyScript.Buff:New("gBlessMight",         "Spell_Holy_GreaterBlessingofKings"               ),
		gBlessSlv            = lazyScript.Buff:New("gBlessSlv",           "Spell_Holy_GreaterBlessingofSalvation"           ),
		gBlessSnct           = lazyScript.Buff:New("gBlessSnct",          "Spell_Holy_GreaterBlessingofSanctuary"           ),
		gBlessWisdom         = lazyScript.Buff:New("gBlessWisdom",        "Spell_Holy_GreaterBlessingofWisdom"              ),
		holyShield           = lazyScript.Buff:New("holyShield",          "Spell_Holy_BlessingOfProtection"                 ),
		redoubt              = lazyScript.Buff:New("redoubt",             "Ability_Defend"                                  ),
		repentance           = lazyScript.Buff:New("repentance",          "Spell_Holy_PrayerOfHealing",       "cc"          ),
		rightFury            = lazyScript.Buff:New("rightFury",           "Spell_Holy_SealOfFury"                           ),
		sealCommand          = lazyScript.Buff:New("sealCommand",         "Ability_Warrior_InnerRage"                       ),
		sealCrusader         = lazyScript.Buff:New("sealCrusader",        "Spell_Holy_HolySmite"                            ),
		sealJustice          = lazyScript.Buff:New("sealJustice",         "Spell_Holy_SealOfWrath"                          ),
		sealLight            = lazyScript.Buff:New("sealLight",           "Spell_Holy_HealingAura"                          ),
		sealRight            = lazyScript.Buff:New("sealRight",           "Ability_ThunderBolt"                             ),
		sealWisdom           = lazyScript.Buff:New("sealWisdom",          "Spell_Holy_RighteousnessAura"                    ),
		
		judgeCrusader        = lazyScript.Buff:New("judgeCrusader",       "Spell_Holy_HolySmite"                            ),
		judgeJustice         = lazyScript.Buff:New("judgeJustice",        "Spell_Holy_SealOfWrath"                         ),
		judgeLight           = lazyScript.Buff:New("judgeLight",          "Spell_Holy_HealingAura"                          ),
		judgeWisdom          = lazyScript.Buff:New("judgeWisdom",         "Spell_Holy_RighteousnessAura"                    ),
		
		-- Shaman related
		lightShield          = lazyScript.Buff:New("lightShield",         "Spell_Nature_LightningShield"                    ),
		ghostwolf            = lazyScript.Buff:New("ghostwolf",           "Spell_Nature_SpiritWolf"                         ),
		
		fireResistTotem      = lazyScript.Buff:New("fireResistTotem",     "Spell_FireResistanceTotem_01"                    ),
		flameTotem           = lazyScript.Buff:New("flameTotem",          "Spell_Nature_GuardianWard"                       ),
		flameShock           = lazyScript.Buff:New("flameShock",          "Spell_Fire_FlameShock",            "dot"         ),
		frostResistTotem     = lazyScript.Buff:New("frostResistTotem",    "Spell_FrostResistanceTotem_01"                   ),
		graceTotem           = lazyScript.Buff:New("graceTotem",          "Spell_Nature_InvisibilityTotem"                  ),
		hsTotem              = lazyScript.Buff:New("hsTotem",             "INV_Spear_04"                                    ),
		msTotem              = lazyScript.Buff:New("msTotem",             "Spell_Nature_ManaRegenTotem"                     ),
		mtTotem              = lazyScript.Buff:New("mtTotem",             "Spell_Frost_SummonWaterElemental"                ),
		natureResistTotem    = lazyScript.Buff:New("natureResistTotem",   "Spell_Nature_NatureResistanceTotem"              ),
		skinTotem            = lazyScript.Buff:New("skinTotem",           "Spell_Nature_StoneSkinTotem"                     ),
		strengthTotem        = lazyScript.Buff:New("strengthTotem",       "Spell_Nature_EarthBindTotem"                     ), -- yes, this is the right texture
		tranquilTotem        = lazyScript.Buff:New("tranquilTotem",       "Spell_Nature_Brilliance"                         ),
		wfTotem              = lazyScript.Buff:New("wfTotem",             "Spell_Nature_Windfury"                           ),
		windwallTotem        = lazyScript.Buff:New("windwallTotem",       "Spell_Nature_EarthBind"                          ),
		
		-- Warlock related
		amplifyCurse         = lazyScript.Buff:New("amplifyCurse",        "Spell_Shadow_Contagion"                          ),
		corruption           = lazyScript.Buff:New("corruption",          "Spell_Shadow_AbominationExplosion", "dot"        ),
		curseAgony           = lazyScript.Buff:New("curseAgony",          "Spell_Shadow_CurseOfSargeras",      "dot"        ),
		curseElements        = lazyScript.Buff:New("curseElements",       "Spell_Shadow_ChillTouch"                         ),
		curseExhaustion      = lazyScript.Buff:New("curseExhaustion",     "Spell_Shadow_GrimWard"                           ),
		curseReckless        = lazyScript.Buff:New("curseReckless",       "Spell_Shadow_UnholyStrength"                     ),
		curseShadow          = lazyScript.Buff:New("curseShadow",         "Spell_Shadow_CurseOfAchimonde"                   ),
		curseTongues         = lazyScript.Buff:New("curseTongues",        "Spell_Shadow_CurseOfTounges"                     ),
		curseWeakness        = lazyScript.Buff:New("curseWeakness",       "Spell_Shadow_CurseOfMannoroth"                   ),
		banish               = lazyScript.Buff:New("banish",              "Spell_Shadow_Cripple"                            ),
		deathCoil            = lazyScript.Buff:New("deathCoil",           "Spell_Shadow_DeathCoil"                          ),
		demonArmor           = lazyScript.Buff:New("demonArmor",          "Spell_Shadow_RagingScream"                       ),
		demonSkin            = lazyScript.Buff:New("demonSkin",           "Spell_Shadow_RagingScream"                       ),
		detectGreaterInvis   = lazyScript.Buff:New("detectGreaterInvis",  "Spell_Shadow_DetectInvisibility"                 ),
		detectInvis          = lazyScript.Buff:New("detectInvis",         "Spell_Shadow_DetectInvisibility"                 ),
		detectLesserInvis    = lazyScript.Buff:New("detectLesserInvis",   "Spell_Shadow_DetectLesserInvisibility"           ),
		drainLife            = lazyScript.Buff:New("drainLife",           "Spell_Shadow_LifeDrain02",         "dot,channel" ),
		drainMana            = lazyScript.Buff:New("drainMana",           "Spell_Shadow_SiphonMana",          "dot,channel" ),
		drainSoul            = lazyScript.Buff:New("drainSoul",           "Spell_Shadow_Haunting",            "dot,channel" ),
		fear                 = lazyScript.Buff:New("fear",                "Spell_Shadow_Possession",          "fear"        ),
		funnel               = lazyScript.Buff:New("funnel",              "Spell_Shadow_LifeDrain",           "channel"     ),
		hellfire             = lazyScript.Buff:New("hellfire",            "Spell_Fire_Incinerate",            "channel"     ),
		howl                 = lazyScript.Buff:New("howl",                "Spell_Shadow_DeathScream",         "fear"        ),
		immolate             = lazyScript.Buff:New("immolate",            "Spell_Fire_Immolation",            "dot"         ),
		sacrifice            = lazyScript.Buff:New("sacrifice",           "Spell_Shadow_SacrificialShield"                  ),
		seduction            = lazyScript.Buff:New("seduction",           "Spell_Shadow_MindSteal",           "cc,charm"    ),
		senseDemons          = lazyScript.Buff:New("senseDemons",         "Spell_Shadow_Metamorphosis"                      ),
		shadowburn           = lazyScript.Buff:New("shadowburn",          "Spell_Shadow_ScourgeBuild"                       ),
		shadowTrance         = lazyScript.Buff:New("shadowTrance",        "Spell_Shadow_Twilight"                           ),
		shadowWard           = lazyScript.Buff:New("shadowWard",          "Spell_Shadow_AntiShadow"                         ),
		siphon               = lazyScript.Buff:New("siphon",              "Spell_Shadow_Requiem",             "dot"         ),
		soulLink             = lazyScript.Buff:New("soulLink",            "Spell_Shadow_GatherShadows"                      ),
		
		-- Warrior related
		battleShout          = lazyScript.Buff:New("battleShout",         "Ability_Warrior_BattleShout"                     ),
		berserkerRage        = lazyScript.Buff:New("berserkerRage",       "Spell_Nature_AncestralGuardian"                  ),
		bloodrage            = lazyScript.Buff:New("bloodrage",           "Ability_Racial_BloodRage"                        ),
		challengingShout     = lazyScript.Buff:New("challengingShout",    "Ability_BullRush"                                ),
		concussionBlow       = lazyScript.Buff:New("concussionBlow",      "Ability_ThunderBolt"                             ),
		deathWish            = lazyScript.Buff:New("deathWish",           "Spell_Shadow_DeathPact"                          ),
		demoShout            = lazyScript.Buff:New("demoShout",           "Ability_Warrior_WarCry"                          ),
		disarm               = lazyScript.Buff:New("disarm",              "Ability_Warrior_Disarm"                          ),
		hamstring            = lazyScript.Buff:New("hamstring",           "Ability_ShockWave",                "slow"        ),
		intimidatingShout    = lazyScript.Buff:New("intimidatingShout",   "Ability_GolemThunderClap"                        ),
		lastStand            = lazyScript.Buff:New("lastStand",           "Spell_Holy_AshesToAshes"                         ),
		mockingBlow          = lazyScript.Buff:New("mockingBlow",         "Ability_Warrior_PunishingBlow"                   ),
		mortalStrike         = lazyScript.Buff:New("mortalStrike",        "Ability_Warrior_SavageBlow"                      ),
		piercingHowl         = lazyScript.Buff:New("piercingHowl",        "Spell_Shadow_DeathScream",         "slow"        ),
		recklessness         = lazyScript.Buff:New("recklessness",        "Ability_CriticalStrike"                          ),
		rend                 = lazyScript.Buff:New("rend",                "Ability_Gouge",                    "bleed,dot"   ),
		retaliation          = lazyScript.Buff:New("retaliation",         "Ability_Warrior_Challange"                       ),
		shieldBlock          = lazyScript.Buff:New("shieldBlock",         "Ability_Defend"                                  ),
		shieldWall           = lazyScript.Buff:New("shieldWall",          "Ability_Warrior_ShieldWall"                      ),
		sunder               = lazyScript.Buff:New("sunder",              "Ability_Warrior_Sunder"                          ),
		sweepingStrikes      = lazyScript.Buff:New("sweepingStrikes",     "Ability_Rogue_SliceDice"                         ),
		thunderClap          = lazyScript.Buff:New("thunderClap",         "Spell_Nature_ThunderClap"                        ),
		whirlwind            = lazyScript.Buff:New("whirlwind",           "Ability_Whirlwind"                               ),
		
		-- Pet related
		petProwl             = lazyScript.Buff:New("petProwl",            "Ability_Druid_SupriseAttack",      "stealth"     ),
		
		-- Other
		clearcasting         = lazyScript.Buff:New("clearcasting",        "Spell_Shadow_ManaBurn"                           ),
		
	}
end

-- :-(
--
-- Checking buffs/debuffs is fun!
-- We accept one or more of:
-- - the buff/debuff texture
-- - the Tooltip title
-- - a line found inside the body of the tooltip.
--
function lazyScript.masks.HasBuffOrDebuff(unitId, buffOrDebuff, texture, ttTitle, ttBody, sayNothing)
	local buffId = 1
	
	while true do
		local thisTexture, applications
		if (buffOrDebuff == "buff") then
			thisTexture, applications = UnitBuff(unitId, buffId)
			else
			thisTexture, applications = UnitDebuff(unitId, buffId)
		end
		if (not thisTexture) then
			break
		end
		
		local isMatch = true
		
		-- texture test
		if (texture and thisTexture ~= texture) then
			isMatch = false
		end
		
		-- title test
		if (isMatch and ttTitle) then
			local thisTTTitle = lazyScript.Tooltip:GetUnitBuffOrDebuffTextLeftN(unitId, buffOrDebuff, buffId, 1)
			if (not thisTTTitle or not string.find(thisTTTitle, "^"..ttTitle)) then
				isMatch = false
			end
		end
		
		-- tt body test
		if (isMatch and ttBody) then
			isMatch = false
			local numLines = lazyScript.Tooltip:GetUnitBuffOrDebuffNumLines(unitId, buffOrDebuff, buffId)
			for n = 2, numLines do
				local thisTTBody = lazyScript.Tooltip:GetUnitBuffOrDebuffTextLeftN(unitId, buffOrDebuff, buffId, n)
				if (string.find(thisTTBody, "^"..ttBody)) then
					isMatch = true
					break
				end
			end
		end
		
		if (isMatch) then
			return buffId, applications
		end
		
		buffId = buffId + 1
	end
	
	return nil
end


function lazyScript.masks.CheckBuffOrDebuff(unitId, buffObj, buffType, gtLtEq, val)
	return function(sayNothing)
		local buffId, buffApplications = lazyScript.masks.HasBuffOrDebuff(unitId, buffType, buffObj.texture, buffObj.name, buffObj.body, sayNothing)
		
		if (not buffId) and (gtLtEq ~= "") then
			buffApplications = 0
		end
		
		if (not sayNothing) then
			lazyScript.d(LOOKING_FOR..(buffObj.name or "nil").." buffId: "..(buffId or "nil")..APPLICATIONS..(buffApplications or "nil"))
		end
		
		if buffApplications then
			if gtLtEq == ">" then
				return (buffApplications > val)
				elseif gtLtEq == "<" then
				return (buffApplications < val)
				elseif gtLtEq == "=" then
				return (buffApplications == val)
			end
		end
		return buffId
	end
end

function lazyScript.bitParsers.ifBuffActive(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?([%a%d]*)Has(Buff|Debuff)([<=>]?)(%d+)?=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2)
	local buffType = string.lower(lazyScript.match3)
	local gtLtEq = lazyScript.match4
	local val = lazyScript.match5
	local buffNames = lazyScript.match6
	
	if (val ~= "") and (gtLtEq == "") then
		gtLtEq = "="
	end
	val = tonumber(lazyScript.match5)
	
	if unitId == "" then
		unitId = "player"
	end
	
	if not lazyScript.validateUnitId(unitId) then
		lazyScript.p(unitId..IS_NOT_VALID_UNITID)
		return nil
	end
	
	table.insert(masks, lazyScript.masks.UnitExists(unitId))
	
	local subMasks = {}
	for buffName in string.gfind(buffNames, "[^,]+") do
		
		local buffObj = nil
		
		for key, obj in pairs(lazyScript.buffTable) do
			-- Search by shortName
			if (key == buffName) then
				lazyScript.d(BUFF_INFO_FOUND..buffName.."." )
				buffObj = obj
				break
			end
		end
		
		if (buffObj == nil) then
			local tempString = "if"..lazyScript.match1..lazyScript.match2.."Has"..lazyScript.match3.."Title"..lazyScript.match4..lazyScript.match5.."="..lazyScript.match6
			lazyScript.p(DID_NOT_FIND..buffName..IN_THE..buffType..DATABASE_TRY..tempString..INSTEAD)
			return nil
		end
		
		table.insert(subMasks, lazyScript.masks.CheckBuffOrDebuff(unitId, buffObj, buffType, gtLtEq, val))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	
	return true
end


function lazyScript.masks.CheckBuffOrDebuffTitle(unitId, buffName, buffType, gtLtEq, val)
	return function(sayNothing)
		local buffId, buffApplications = lazyScript.masks.HasBuffOrDebuff(unitId, buffType, nil, buffName, nil, sayNothing)
		
		if (not buffId) and (gtLtEq ~= "") then
			buffId = -1
			buffApplications = 0
		end
		
		if (not sayNothing) then
			lazyScript.d(LOOKING_FOR..(buffName or "nil").." buffId: "..(buffId or "nil")..APPLICATIONS..(buffApplications or "nil"))
		end
		
		if buffId then
			if gtLtEq == ">" then
				return (buffApplications > val)
				elseif gtLtEq == "<" then
				return (buffApplications < val)
				elseif gtLtEq == "=" then
				return (buffApplications == val)
			end
		end
		return buffId
	end
end

function lazyScript.bitParsers.ifHasBuffTitle(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?([%a%d]*)Has(Buff|Debuff)Title([<=>]?)(%d+)?=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2)
	local buffType = string.lower(lazyScript.match3)
	local gtLtEq = lazyScript.match4
	local val = lazyScript.match5
	local buffNames = lazyScript.match6
	
	if (val ~= "") and (gtLtEq == "") then
		gtLtEq = "="
	end
	val = tonumber(lazyScript.match5)
	
	if unitId == "" then
		unitId = "player"
	end
	
	if not lazyScript.validateUnitId(unitId) then
		lazyScript.p(unitId..IS_NOT_VALID_UNITID)
		return nil
	end
	
	table.insert(masks, lazyScript.masks.UnitExists(unitId))
	
	local subMasks = {}
	for buffName in string.gfind(buffNames, "[^,]+") do
		
		local buffObj = nil
		
		for key, obj in pairs(lazyScript.buffTable) do
			-- Search by name
			if (obj.name == buffName) then
				lazyScript.d(BUFF_INFO_FOUND..buffName)
				buffObj = obj
				break
			end
		end
		
		if (buffObj == nil) then
			table.insert(subMasks, lazyScript.masks.CheckBuffOrDebuffTitle(unitId, buffName, buffType, gtLtEq, val))
			else
			table.insert(subMasks, lazyScript.masks.CheckBuffOrDebuff(unitId, buffObj, buffType, gtLtEq, val))
		end
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	
	return true
end


function lazyScript.masks.isShadowmelded(sayNothing)
	local buffObj = lazyScript.buffTable.shadowmeld
	return lazyScript.masks.HasBuffOrDebuff("player", "buff", buffObj.texture, buffObj.name, buffObj.body, sayNothing)
end

function lazyScript.bitParsers.ifShadowmelded(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Shadowmelded$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.isShadowmelded, negate))
	return true
end


function lazyScript.CheckPlayerBuff(texture, ttTitle, ttBody, sayNothing)
	local candidates = {}
	local buffId = 0
	local buffIndex, untilCancelled, buffTexture, timelLeft, applications
	
	while true do
		local buffTexture
		buffIndex, untilCancelled = GetPlayerBuff(buffId, "HELPFUL|HARMFUL|PASSIVE")
		buffTexture = GetPlayerBuffTexture(buffIndex)
		
		if (not buffTexture) then
			break
		end
		
		if (not texture) then
			-- no texture criteria given, so just add to list of candidates
			candidates[buffId] = true
			
			elseif ((buffTexture == texture)) then
			candidates[buffId] = true
			
			else
			candidates[buffId] = false
			
		end
		
		buffId = buffId + 1
	end
	
	if (ttTitle) then
		for buffId, isCandidate in pairs(candidates) do
			buffIndex = GetPlayerBuff(buffId, "HELPFUL|HARMFUL|PASSIVE")
			if (isCandidate) then
				local thisTTTitle = lazyScript.Tooltip:GetPlayerBuffTextLeftN(buffIndex, 1)
				if (thisTTTitle and string.find(thisTTTitle, "^"..ttTitle)) then
					--               if (not sayNothing) then
					--                  lazyScript.d("CheckPlayerBuff: found ttTitle "..ttTitle.." at buffId: "..buffIndex)
					--               end
					else
					--               if (not sayNothing) then
					--                  lazyScript.d("CheckPlayerBuff: did NOT find ttTitle "..ttTitle.." at buffId: "..buffIndex)
					--               end
					candidates[buffId] = false
				end
			end
		end
	end
	
	for buffId, isCandidate in pairs(candidates) do
		if (isCandidate) then
			buffIndex, untilCancelled = GetPlayerBuff(buffId, "HELPFUL|HARMFUL|PASSIVE")
			timeLeft = GetPlayerBuffTimeLeft(buffIndex)
			applications = GetPlayerBuffApplications(buffIndex)
			return buffIndex, untilCancelled, timeLeft, applications
		end
	end
	
	return nil
end


function lazyScript.masks.CheckBuffDuration(buffObj, buffType, gtLtEq, val)
	return function(sayNothing)
		local buffIndex, untilCancelled, timeLeft, applications = lazyScript.CheckPlayerBuff(buffObj.texture, buffObj.name, nil, sayNothing)
		if (not buffIndex) then
			timeLeft = 0
		end
		
		if(untilCancelled == 1) then
			timeLeft = 28800
		end
		
		if gtLtEq == "<" then
			return timeLeft < val
			elseif gtLtEq == ">" then
			return timeLeft > val
		end
	end
end


function lazyScript.bitParsers.ifBuffDuration(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Buff|Debuff)Duration([<>])(%d+)s=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local buffType = string.lower(lazyScript.match2)
	local gtLtEq = lazyScript.match3
	local val = tonumber(lazyScript.match4)
	local buffNames = lazyScript.match5
	
	local subMasks = {}
	for buffName in string.gfind(buffNames, "[^,]+") do
		
		local buffObj = nil
		
		for key, obj in pairs(lazyScript.buffTable) do
			-- Search by shortName
			if (key == buffName) then
				lazyScript.d(FOUND_KNOWN_BUFF..buffName)
				buffObj = obj
				break
			end
		end
		
		if (buffObj == nil) then
			local tempString = "if"..lazyScript.match1..lazyScript.match2.."TitleDuration"..lazyScript.match3..lazyScript.match4.."s="..lazyScript.match5
			lazyScript.p(DID_NOT_FIND..buffName..IN_THE..buffType..DATABASE_TRY..tempString..INSTEAD)
			return nil
		end
		
		table.insert(subMasks, lazyScript.masks.CheckBuffDuration(buffObj, buffType, gtLtEq, val))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	
	return true
end


function lazyScript.masks.CheckBuffDurationByTitle(buffName, buffType, gtLtEq, val)
	return function(sayNothing)
		local buffIndex, untilCancelled, timeLeft, applications = lazyScript.CheckPlayerBuff(nil, buffName, nil, sayNothing)
		if (buffIndex) then
			if(untilCancelled == 1) then
				timeLeft = 28800
			end
			
			timeleft = math.floor(timeLeft)
			
			if gtLtEq == "<" then
				return timeLeft < val
				elseif gtLtEq == ">" then
				return timeLeft > val
			end
		end
	end
end

function lazyScript.bitParsers.ifBuffDurationByTitle(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Buff|Debuff)TitleDuration([<>])(%d+)s=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local buffType = string.lower(lazyScript.match2)
	local gtLtEq = lazyScript.match3
	local val = tonumber(lazyScript.match4)
	local buffNames = lazyScript.match5
	
	local subMasks = {}
	for buffName in string.gfind(buffNames, "[^,]+") do
		local buffObj = nil
		
		for key, obj in pairs(lazyScript.buffTable) do
			-- Search by name
			if (obj.name == buffName) then
				lazyScript.d(FOUND_KNOWN_BUFF..buffName)
				buffObj = obj
				break
			end
		end
		
		if (buffObj == nil) then
			table.insert(subMasks, lazyScript.masks.CheckBuffDurationByTitle(buffName, buffType, gtLtEq, val))
			else
			table.insert(subMasks, lazyScript.masks.CheckBuffDuration(buffObj, buffType, gtLtEq, val))
		end
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	
	return true
end



-- Buff checks by category
--------------------------

function lazyScript.bitParsers.ifIsBuffed(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?([%a%d]*)Is=(.+)$")) then
		return false
	end
	
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2)
	
	if unitId == "" then
		unitId = "player"
	end
	
	if not lazyScript.validateUnitId(unitId) then
		lazyScript.p(unitId..IS_NOT_VALID_UNITID)
		return nil
	end
	
	local debuffTypes = lazyScript.match3
	local subMasks = {}
	for debuffType in string.gfind(debuffTypes, "[^,]+") do
		-- will search for a mask called Is<debuffType>
		local buffCheckFn = lazyScript.masks["Is"..debuffType]
		if (buffCheckFn ~= nil) then
			--         lazyScript.d("Function Is"..debuffType.." found.")
			else
			lazyScript.p(BUFF_DEBUFF_CATEGORY..debuffType..NOT_RECOGNISED)
			return nil
		end
		local mask = buffCheckFn(unitId)
		if mask then
			table.insert(subMasks, mask)
			else
			return nil
		end
	end
	table.insert(masks, lazyScript.masks.UnitExists(unitId))
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end

function lazyScript.masks.IsStung(unitId)
	local buffs = lazyScript.masks.FindBuffsByCategory("sting")
	
	return function(sayNothing)
		if (buffs ~= nil) then
			for idx, buffobj in ipairs(buffs) do
				local buffResult = lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", buffobj.texture, buffobj.name, buffobj.body, sayNothing)
				if (buffResult ~= nil) then
					return true
				end
			end
		end
		return false
	end
end


function lazyScript.masks.IsCCd(unitId)
	local buffs = lazyScript.masks.FindBuffsByCategory("cc")
	
	return function(sayNothing)
		if (buffs ~= nil) then
			for idx, buffobj in ipairs(buffs) do
				local buffResult = lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", buffobj.texture, buffobj.name, buffobj.body, sayNothing)
				if (buffResult ~= nil) then
					if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
						if (not buffobj.name) then
							if (not sayNothing) then
								lazyScript.p("ifCCd: "..unitId..AFFLICTED_BY..buffobj.texture)
							end
							else
							if (not sayNothing) then
								lazyScript.p("ifCCd: "..unitId..AFFLICTED_BY..buffobj.name)
							end
						end
					end
					
					return true
				end
			end
		end
		return false
	end
end

function lazyScript.masks.IsPolymorphed(unitId)
	local buffs = lazyScript.masks.FindBuffsByCategory("polymorph")
	
	return function(sayNothing)
		if (buffs ~= nil) then
			for idx, buffobj in ipairs(buffs) do
				local buffResult = lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", buffobj.texture, buffobj.name, buffobj.body, sayNothing)
				if (buffResult ~= nil) then
					if (not buffobj.name) then
						if (not sayNothing) then
							lazyScript.d("ifPolyMorphed: "..unitId..AFFLICTED_BY..buffobj.texture)
						end
						else
						if (not sayNothing) then
							lazyScript.d("ifPolyMorphed: "..unitId..AFFLICTED_BY..buffobj.name)
						end
					end
					return true
				end
			end
		end
		return false
	end
end

function lazyScript.masks.IsBleeding(unitId)
	local buffs = lazyScript.masks.FindBuffsByCategory("bleed")
	
	return function(sayNothing)
		if (buffs ~= nil) then
			for idx, buffobj in ipairs(buffs) do
				local buffResult = lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", buffobj.texture, buffobj.name, buffobj.body, sayNothing)
				if (buffResult ~= nil) then
					
					if (not buffobj.name) then
						if (not sayNothing) then
							lazyScript.d("ifBleeding: "..unitId..AFFLICTED_BY..buffobj.texture)
						end
						else
						if (not sayNothing) then
							lazyScript.d("ifBleeding: "..unitId..AFFLICTED_BY..buffobj.name)
						end
					end
					return true
				end
			end
		end
		return false
	end
end

function lazyScript.masks.IsCharmed(unitId)
	local buffs = lazyScript.masks.FindBuffsByCategory("charm")
	
	return function(sayNothing)
		if (buffs ~= nil) then
			for idx, buffobj in ipairs(buffs) do
				local buffResult = lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", buffobj.texture, buffobj.name, buffobj.body, sayNothing)
				if (buffResult ~= nil) then
					if (not buffobj.name) then
						if (not sayNothing) then
							lazyScript.d("ifCharmed: "..unitId..AFFLICTED_BY..buffobj.texture)
						end
						else
						if (not sayNothing) then
							lazyScript.d("ifCharmed: "..unitId..AFFLICTED_BY..buffobj.name)
						end
					end
					return true
				end
			end
		end
		return false
	end
end

function lazyScript.masks.IsEating(unitId)
	local buffs = lazyScript.masks.FindBuffsByCategory("food")
	
	return function(sayNothing)
		if (buffs ~= nil) then
			for idx, buffobj in ipairs(buffs) do
				local buffResult = lazyScript.masks.HasBuffOrDebuff(unitId, "buff", buffobj.texture, buffobj.name, buffobj.body, sayNothing)
				if (buffResult ~= nil) then
					if (not buffobj.name) then
						if (not sayNothing) then
							lazyScript.d("ifEating: "..unitId..AFFLICTED_BY..buffobj.texture)
						end
						else
						if (not sayNothing) then
							lazyScript.d("ifEating: "..unitId..AFFLICTED_BY..buffobj.name)
						end
					end
					return true
				end
			end
		end
		return false
	end
end

function lazyScript.masks.IsDrinking(unitId)
	local buffs = lazyScript.masks.FindBuffsByCategory("drink")
	
	return function(sayNothing)
		if (buffs ~= nil) then
			for idx, buffobj in ipairs(buffs) do
				local buffResult = lazyScript.masks.HasBuffOrDebuff(unitId, "buff", buffobj.texture, buffobj.name, buffobj.body, sayNothing)
				if (buffResult ~= nil) then
					if (not buffobj.name) then
						if (not sayNothing) then
							lazyScript.d("ifDrinking: "..unitId..AFFLICTED_BY..buffobj.texture)
						end
						else
						if (not sayNothing) then
							lazyScript.d("ifDrinking: "..unitId..AFFLICTED_BY..buffobj.name)
						end
					end
					return true
				end
			end
		end
		return false
	end
end

function lazyScript.masks.IsDotted(unitId)
	local dotted = lazyScript.getLocaleString("DOT_TTS")
	if (not dotted) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifDotted "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(dotted) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifDotted: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end

function lazyScript.masks.IsSlowed(unitId)
	local slowed = lazyScript.getLocaleString("SLOWED_TTS")
	if (not slowed) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifSlowed "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(slowed) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifSlowed: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end

function lazyScript.masks.IsStunned(unitId)
	local stunned = lazyScript.getLocaleString("STUNNED_TTS")
	if (not stunned) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifStunned "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(stunned) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifStunned: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end

function lazyScript.masks.IsFeared(unitId)
	local feared = lazyScript.getLocaleString("FEAR_TTS")
	if (not feared) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifFeared "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(feared) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifFeared: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end

function lazyScript.masks.IsImmobile(unitId)
	local immobile = lazyScript.getLocaleString("IMMOBILE_TTS")
	if (not immobile) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifImmobile "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(immobile) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifImmobile: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end


function lazyScript.masks.IsAsleep(unitId)
	local asleepStrings = lazyScript.getLocaleString("ASLEEP_TTS")
	if (not asleepStrings) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifAsleep "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(asleepStrings) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifAsleep: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end


function lazyScript.masks.IsDisoriented(unitId)
	local disorientedStrings = lazyScript.getLocaleString("DISORIENTED_TTS")
	if (not disorientedStrings) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifDisoriented "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(disorientedStrings) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifDisoriented: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end


function lazyScript.masks.IsIncapacitated(unitId)
	local incapacitatedStrings = lazyScript.getLocaleString("INCAPACITATED_TTS")
	if (not incapacitatedStrings) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifIncapacitated "..NOT_SUPPORTED)
		end
		return false
	end
	
	return function(sayNothing)
		for idx, ttBody in ipairs(incapacitatedStrings) do
			if (lazyScript.masks.HasBuffOrDebuff(unitId, "debuff", nil, nil, ttBody, sayNothing)) then
				if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
					if (not sayNothing) then
						lazyScript.d("ifIncapacitated: "..unitId..AFFLICTED_BY..ttBody)
					end
				end
				return true
			end
		end
		return false
	end
end


function lazyScript.masks.IsMagicked(unitId)
	local debuffType = "Magic"
	return function(sayNothing)
		return lazyScript.masks.HasDebuffType(unitId, debuffType)
	end
end

function lazyScript.masks.IsCursed(unitId)
	local debuffType = "Curse"
	return function(sayNothing)
		return lazyScript.masks.HasDebuffType(unitId, debuffType)
	end
end

function lazyScript.masks.IsPoisoned(unitId)
	local debuffType = "Poison"
	return function(sayNothing)
		return lazyScript.masks.HasDebuffType(unitId, debuffType)
	end
end

function lazyScript.masks.IsDiseased(unitId)
	local debuffType = "Disease"
	return function(sayNothing)
		return lazyScript.masks.HasDebuffType(unitId, debuffType)
	end
end

function lazyScript.masks.HasDebuffType(unitId, debuffType)
	for buffIdx = 1, 16 do
		local _, _, thisType = UnitDebuff(unitId, buffIdx)
		if (thisType == debuffType) then
			return true
		end
	end
	return false
end




-- Utility functions
--------------------
-- These are functions that are never called by a form but are used within other mask functions.
-- Technically, they are not masks, but we'll leave them alone for now.

function lazyScript.masks.FindBuffsByCategory(category)
	local buffs = {}
	for key, obj in pairs(lazyScript.buffTable) do
		if (obj.categories ~= nil) then
			for idx, buffCategory in ipairs(obj.categories) do
				if (buffCategory == category) then
					table.insert(buffs, obj)
				end
			end
		end
	end
	
	if (table.getn(buffs) == 0) then
		lazyScript.d(DID_NOT_FIND_ANY_BUFFS..category..CATEGORY)
		return nil
	end
	
	return buffs
end