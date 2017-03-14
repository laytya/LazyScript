lazyScript.metadata:updateRevisionFromKeyword("$Revision: 745 $")

lsLocale = {}

lsLocale.enUS = {}

-- Popup dialog text
lsLocale.enUS.INCOMPATIBLE_ADDON = "%s is incompatible with %s. Please update to the latest versions."
lsLocale.enUS.DELETE_FORM = "Are you sure you want to delete the '%s' form?"

-- Initiate spell casting
lsLocale.enUS.SPELLCASTOTHERSTART      = "(.+) begins to cast (.+)."
lsLocale.enUS.SPELLPERFORMOTHERSTART   = "(.+) begins to perform (.+)."

--Spell type catches
lsLocale.enUS.SPELLTEXT = {
	".+'s (.+) crits .+ for %d+ (.+) damage.",		-- SPELLLOGCRITSCHOOLOTHEROTHER = "%s's %s crits %s for %d %s damage.";
	".+'s (.+) hits .+ for %d+ (.+) damage.",		-- SPELLLOGSCHOOLOTHEROTHER = "%s's %s hits %s for %d %s damage."
	"You suffer %d+ (.+) damage from .+'s (.+).", 	-- You suffer 3 frost damage from Rabbit's Ice Nova.
}

-- The class of spell damage
lsLocale.enUS.SPELLTYPE = {
	fire     = "Fire",				-- SPELL_SCHOOL2_CAP = "Fire"
	frost    = "Frost",				-- SPELL_SCHOOL4_CAP = "Frost"
	nature   = "Nature",			-- SPELL_SCHOOL3_CAP = "Nature"
	shadow   = "Shadow",			-- SPELL_SCHOOL5_CAP = "Shadow"
	arcane   = "Arcane",			-- SPELL_SCHOOL6_CAP = "Arcane"
	holy     = "Holy",				-- SPELL_SCHOOL1_CAP = "Holy"
}
lsLocale.enUS.MOUNTED_BUFF_TT    = "Increases speed"

-- Dodge, parry, block, resist
lsLocale.enUS.PLAYER_DODGE          = ".+ attacks%. You dodge%."
lsLocale.enUS.PLAYER_DODGE_SPELL    = ".+'s? .+ was dodged%."           -- GUESS
lsLocale.enUS.PLAYER_PARRY          = ".+ attacks%. You parry%."
lsLocale.enUS.PLAYER_PARRY_SPELL    = ".+'s? .+ was parried%."          -- GUESS
lsLocale.enUS.PLAYER_BLOCK          = ".+ attacks%. You block%."
lsLocale.enUS.PLAYER_BLOCK_SPELL    = ".+'s? .+ was blocked%."          -- GUESS
lsLocale.enUS.PLAYER_RESIST_SPELL   = ".+'s? .+ was resisted%."
lsLocale.enUS.TARGET_DODGE          = "You attack%. .+ dodges%."
lsLocale.enUS.TARGET_DODGE_SPELL    = "Your .+ was dodged by .+%."      -- GUESS
lsLocale.enUS.TARGET_PARRY          = "You attack%. .+ parries%."
lsLocale.enUS.TARGET_PARRY_SPELL    = "Your .+ was parried by .+%."     -- GUESS
lsLocale.enUS.TARGET_BLOCK          = "You attack%. .+ blocks%."
lsLocale.enUS.TARGET_BLOCK_SPELL    = "Your .+ was blocked by .+%."     -- GUESS
lsLocale.enUS.TARGET_RESIST_SPELL   = "Your .+ was resisted by .+%."

-- Warsong gulch announcements
lsLocale.enUS.BG_WSG_ZONE = "Warsong Gulch"
lsLocale.enUS.BG_WSG_FLAG_PICKED_UP = "The %s [fF]lag was picked up by (.+)!"
lsLocale.enUS.BG_WSG_FLAG_CAPTURED = "captured the %s flag!"
lsLocale.enUS.BG_WSG_FLAG_DROPPED = "The %s flag was dropped by"
lsLocale.enUS.BG_WSG_FLAG_RETURNED = "The %s flag was returned to its base by"

lsLocale.enUS.DUEL_COUNTDOWN        = "Duel starting: (%d+)"
lsLocale.enUS.DUEL_WINNER_KNOCKOUT  = "(.+) has defeated (.+) in a duel"
lsLocale.enUS.DUEL_WINNER_RETREAT   = "(.+) has fled from (.+) in a duel"

lsLocale.enUS.REMAINING = "(%d+) minutes remaining."

lsLocale.enUS.GANKED = "Ganked By: %s Count: %d"

lsLocale.enUS.GANKED_CHATS = {
	"(.+)'s .+ crits you for",  -- SPELLLOGCRITOTHERSELF = "%s's %s crits you for %d."
	"(.+)'s .+ hits you for",	-- SPELLLOGOTHERSELF = "%s's %s hits you for %d."
	"(.+) crits you for", 		-- COMBATHITCRITOTHERSELF = "%s crits you for %d.";
	"(.+) hits you for", 		-- COMBATHITOTHERSELF = "%s hits you for %d.";
}

-- NPC is fleeing
lsLocale.enUS.NPC_FLEE_MSG = "%%s attempts to run away in fear!"

-- When something is immune to your spell, such as poison etc.
lsLocale.enUS.IMMUNE = "Your (.+) failed. (.+) is immune."

-- These are creatures that cast divine protection on themselves
-- "Phasing" creature? Any ideas what this is from?
lsLocale.enUS.IMMUNITYPROBLEMCREATURES = {
	"Scarlet",
	"Crimson",
	"Phasing",
	"Doan",
	"Gurubashi",
	"Springvale",
	"Arugal",
}

-- Localized instance names
lsLocale.enUS.INSTANCES = {
	"Ragefire Chasm",
	"Deadmines",
	"Wailing Caverns",
	"Shadowfang Keep",
	"The Stockade",
	"Blackfathom Deeps",
	"Gnomeregan",
	"Razorfen Kraul",
	"Scarlet Monastery",
	"Razorfen Downs",
	"Uldaman",
	"Maraudon",
	"Zul'Farrak",
	"The Temple of Atal'Hakkar",
	"Blackrock Depths",
	"Blackrock Spire",
	"Stratholme",
	"Dire Maul",
	"Scholomance",
	"Onyxia's Lair",
	"Ruins of Ahn'Qiraj",
	"Zul'Gurub",
	"Molten Core",
	"Blackwing Lair",
	"Temple of Ahn'Qiraj",
	"Naxxramas",
}

-- Needed for many of the -ifTargetIs=Slowed etc.
lsLocale.enUS.SLOWED_TTS = {
	"Movement slowed",
	"Movement speed slowed",         -- Hunter Frost Trap
	"Movement speed reduced",		 -- Wing Clip
}

lsLocale.enUS.STUNNED_TTS = {		 -- Cheapshot or kidneyshot
	"Stunned",
}
-- Damage over time text like shadow word pain
lsLocale.enUS.DOT_TTS = {
	"(.+) damage over (%d+) sec",
	"(.+) damage every (%d+) sec",
	"(.+) damage inflicted every (%d+) sec", 		-- spell=29407
}

lsLocale.enUS.FEAR_TTS = {
	"Intimidated", 
	"Fleeing in [fF]ear", 	-- Intimidation
	"Running in [fF]ear",	-- Psychic Scream
	"Feared",				-- Fear
	
}
lsLocale.enUS.IMMOBILE_TTS = {
	"Immobilized",
	"Frozen in place",
	"Unable to move",     	 	-- Where is this from?
	"Rooted",
}

lsLocale.enUS.ASLEEP_TTS = {
	"Asleep",					-- Wyvern Sting
}

lsLocale.enUS.DISORIENTED_TTS = {
	"Disoriented",				-- Scatter Shot
}

lsLocale.enUS.INCAPACITATED_TTS = {
	"Incapacitated",			-- Gouge
}

lsLocale.enUS.BUFF_TTS = {
	berserking           = "Berserking",
	bloodFury            = "Blood Fury",
	cannibalize          = "Cannibalize",
	brainFood            = "Brain Food",
	dazed                = "Dazed",
	drink                = "Drink",
	firstAid             = "First Aid",
	fishFood             = "Food",
	food                 = "Food",
	recentlyBandaged     = "Recently Bandaged",
	shadowmeld           = "Shadowmeld",
	silverwingFlag       = "Silverwing Flag",
	warsongFlag          = "Warsong Flag",
	wellFed              = "Well Fed",
	
	--Rogue Buffs
	adrenaline           = "Adrenaline Rush",
	bladeFlurry          = "Blade Flurry",
	blind                = "Blind",
	cs                   = "Cheap Shot",
	coldBlood            = "Cold Blood",
	evasion              = "Evasion",
	expose               = "Expose Armor",
	garrote              = "Garrote",
	ghostly              = "Ghostly Strike",
	gouge                = "Gouge",
	hemo                 = "Hemorrhage",
	ks                   = "Kidney Shot",
	remorseless          = "Remorseless",
	rupture              = "Rupture",
	sap                  = "Sap",
	snd                  = "Slice and Dice",
	stealth              = "Stealth",
	vanish               = "Vanish",
	
	--Priest Buffs
	abolishDisease       = "Abolish Disease",
	devouringPlague      = "Devouring Plague",
	divineSpirit         = "Divine Spirit",
	elunesGrace          = "Elune's Grace",
	fade                 = "Fade",
	fearWard             = "Fear Ward",
	feedback             = "Feedback",
	hexWeakness          = "Hex of Weakness",
	holyFire             = "Holy Fire",
	innerFire            = "Inner Fire",
	innerFocus           = "Inner Focus",
	levitate             = "Levitate",
	lightwell            = "Lightwell",
	lightwellRenew       = "Lightwell Renew",
	mindControl          = "Mind Control",
	mindFlay             = "Mind Flay",
	mindSoothe           = "Mind Soothe",
	mindVision           = "Mind Vision",
	powerInfusion        = "Power Infusion",
	pwf                  = "Power Word: Fortitude",
	pws                  = "Power Word: Shield",
	prf                  = "Prayer of Fortitude",
	prsp                 = "Prayer of Shadow Protection",
	prs                  = "Prayer of Spirit",
	psychicScream        = "Psychic Scream",
	renew                = "Renew",
	shackleUndead        = "Shackle Undead",
	shadowProtection     = "Shadow Protection",
	swp                  = "Shadow Word: Pain",
	shadowform           = "Shadowform",
	shadowguard          = "Shadowguard",
	shadowVulnerability  = "Shadow Vulnerability",
	spiritTap            = "Spirit Tap",
	starshards           = "Starshards",
	touchWeakness        = "Touch of Weakness",
	vampiricEmbrace      = "Vampiric Embrace",
	weakenedSoul         = "Weakened Soul",
	
	-- Warrior Buffs
	battleShout          = "Battle Shout",
	berserkerRage        = "Berserker Rage",
	bloodrage            = "Bloodrage",
	challengingShout     = "Challenging Shout",
	concussionBlow       = "Concussion Blow",
	deathWish            = "Death Wish",
	demoShout            = "Demoralizing Shout",
	disarm               = "Disarm",
	hamstring            = "Hamstring",
	intimidatingShout    = "Intimidating Shout",
	lastStand            = "Last Stand",
	mockingBlow          = "Mocking Blow",
	mortalStrike         = "Mortal Strike",
	piercingHowl         = "Piercing Howl",
	recklessness         = "Recklessness",
	rend                 = "Rend",
	retaliation          = "Retaliation",
	shieldBlock          = "Shield Block",
	shieldWall           = "Shield Wall",
	sunder               = "Sunder Armor",
	sweepingStrikes      = "Sweeping Strikes",
	thunderClap          = "Thunder Clap",
	whirlwind            = "Whirlwind",
	
	-- Druid Buffs
	bear                 = "Bear Form",
	aquatic              = "Aquatic Form",
	cat                  = "Cat Form",
	travel               = "Travel Form",
	direBear             = "Dire Bear Form",
	moonkin              = "Moonkin Form",
	
	prowl                = "Prowl",
	rake                 = "Rake",
	rip                  = "Rip",
	dash                 = "Dash",
	pounce               = "Pounce Bleed",
	tigersFury           = "Tiger's Fury",
	
	bash                 = "Bash",
	charge               = "Feral Charge Effect",
	demoralize           = "Demoralizing Roar",
	enrage               = "Enrage",
	frenziedRegen        = "Frenzied Regeneration",
	
	abolishPoison        = "Abolish Poison",
	barkskin             = "Barkskin",
	faerieFire           = "Faerie Fire",
	gotw                 = "Gift of the Wild",
	grasp                = "Nature's Grasp",
	hibernate            = "Hibernate",
	innervate            = "Innervate",
	moonfire             = "Moonfire",
	motw                 = "Mark of the Wild",
	ns                   = "Nature's Swiftness",
	ooc                  = "Omen of Clarity",
	regrowth             = "Regrowth",
	rejuv                = "Rejuvenation",
	roots                = "Entangling Roots",
	soothe               = "Soothe Animal",
	swarm                = "Insect Swarm",
	thorns               = "Thorns",
	tranquility          = "Tranquility",
	
	-- Hunter Buffs
	aspectBeast          = "Aspect of the Beast",
	aspectCheetah        = "Aspect of the Cheetah",
	aspectHawk           = "Aspect of the Hawk",
	aspectPack           = "Aspect of the Pack",
	aspectMonkey         = "Aspect of the Monkey",
	aspectWild           = "Aspect of the Wild",
	bestialWrath         = "Bestial Wrath",
	concussive           = "Concussive Shot",
	eagleEye             = "Eagle Eye",
	eotb                 = "Eyes of the Beast",
	explosiveTrap        = "Explosive Trap Effect",
	feedPet              = "Feed Pet Effect",
	feign                = "Feign Death",
	frostTrap            = "Frost Trap Aura",
	freezingTrap         = "Freezing Trap",
	furiousHowl          = "Furious Howl",
	huntersMark          = "Hunter's Mark",
	immolationTrap       = "Immolation Trap Effect",
	intimidate           = "Intimidation",
	quickShots           = "Quick Shots",
	rapidFire            = "Rapid Fire",
	scare                = "Scare Beast",
	scatter              = "Scatter Shot",
	scorpid              = "Scorpid Sting",
	serpent              = "Serpent Sting",
	trueshot             = "Trueshot Aura",
	viper                = "Viper Sting",
	wingClip             = "Wing Clip",
	wyvern               = "Wyvern Sting",
	wyvernCC             = "Wyvern Sting",
	wyvernDot            = "Wyvern Sting",
	
	-- Mage Buffs
	amplifyMagic         = "Amplify Magic",
	brilliance           = "Arcane Brilliance",
	combustion           = "Combustion",
	dampenMagic          = "Dampen Magic",
	evocation            = "Evocation",
	fireVulnerability    = "Fire Vulnerability",
	fireWard             = "Fire Ward",
	frostWard            = "Frost Ward",
	frostArmor           = "Frost Armor",
	frostbolt            = "Frostbolt",
	iceArmor             = "Ice Armor",
	iceBarrier           = "Ice Barrier",
	iceBlock             = "Ice Block",
	ignite               = "Ignite",
	intellect            = "Arcane Intellect",
	mageArmor            = "Mage Armor",
	manaShield           = "Mana Shield",
	polymorph            = "Polymorph",
	polymorphPig         = "Polymorph: Pig",
	polymorphTurtle      = "Polymorph: Turtle",
	
	-- Paladin Buffs
	concAura             = "Concentration Aura",
	devAura              = "Devotion Aura",
	fireAura             = "Fire Resistance Aura",
	retAura              = "Retribution Aura",
	sanctAura            = "Sanctity Aura",
	shadowAura           = "Shadow Resistance Aura",
	blessFree            = "Blessing of Freedom",
	blessKings           = "Blessing of Kings",
	blessLight           = "Blessing of Light",
	blessMight           = "Blessing of Might",
	blessProt            = "Blessing of Protection",
	blessSac             = "Blessing of Sacrifice",
	blessSlv             = "Blessing of Salvation",
	blessSnct            = "Blessing of Sanctuary",
	blessWisdom          = "Blessing of Wisdom",
	divFavor             = "Divine Favor",
	divProt              = "Divine Protection",
	divShield            = "Divine Shield",
	forbearance          = "Forbearance",
	gBlessKings          = "Greater Blessing of Kings",
	gBlessLight          = "Greater Blessing of Light",
	gBlessMight          = "Greater Blessing of Might",
	gBlessSlv            = "Greater Blessing of Salvation",
	gBlessSnct           = "Greater Blessing of Sanctuary",
	gBlessWisdom         = "Greater Blessing of Wisdom",
	holyShield           = "Holy Shield",
	redoubt              = "Redoubt",
	repentance           = "Repentance",
	rightFury            = "Righteous Fury",
	sealCommand          = "Seal of Command",
	sealCrusader         = "Seal of the Crusader",
	sealJustice          = "Seal of Justice",
	sealLight            = "Seal of Light",
	sealRight            = "Seal of Righteousness",
	sealWisdom           = "Seal of Wisdom",
	
	judgeCrusader        = "Judgement of the Crusader",
	judgeJustice         = "Judgement of Justice",
	judgeLight           = "Judgement of Light",
	judgeWisdom          = "Judgement of Wisdom",
	
	-- Shaman buffs
	lightShield          = "Lightning Shield",
	ghostwolf            = "Ghost Wolf",
	
	fireResistTotem      = "Fire Resistance",
	flameTotem           = "FlameTongue",
	flameShock           = "Flame Shock",
	frostResistTotem     = "Frost Resistance",
	graceTotem           = "Grace of Air",
	hsTotem              = "Healing Stream",
	msTotem              = "Mana Spring",
	mtTotem              = "Mana Tide",
	natureResistTotem    = "Nature Resistance",
	skinTotem            = "Stoneskin",
	strengthTotem        = "Strength of Earth",
	tranquilTotem        = "Tranquil Air",
	wfTotem              = "Windfury",
	windwallTotem        = "Windwall",
	
	-- Warlock buffs
	amplifyCurse         = "Amplify Curse",
	corruption           = "Corruption",
	curseAgony           = "Curse of Agony",
	curseElements        = "Curse of the Elements",
	curseExhaustion      = "Curse of Exhaustion",
	curseReckless        = "Curse of Recklessness",
	curseShadow          = "Curse of Shadow",
	curseTongues         = "Curse of Tongues",
	curseWeakness        = "Curse of Weakness",
	banish               = "Banish",
	deathCoil            = "Death Coil",
	demonArmor           = "Demon Armor",
	demonSkin            = "Demon Skin",
	detectGreaterInvis   = "Detect Greater Invisibility",
	detectInvis          = "Detect Invisibility",
	detectLesserInvis    = "Detect Lesser Invisibility",
	drainLife            = "Drain Life",
	drainMana            = "Drain Mana",
	drainSoul            = "Drain Soul",
	fear                 = "Fear",
	funnel               = "Health Funnel",
	hellfire             = "Hellfire",
	howl                 = "Howl of Terror",
	immolate             = "Immolate",
	sacrifice            = "Sacrifice",
	seduction            = "Seduction",
	senseDemons          = "Sense Demons",
	shadowburn           = "Shadowburn",
	shadowTrance         = "Shadow Trance",
	shadowWard           = "Shadow Ward",
	siphon               = "Siphon Life",
	soulLink             = "Soul Link",
	
	-- Pet related
	petProwl             = "Prowl",
	
	-- Other
	
	clearcasting         = "Clearcasting",
	
}

lsLocale.enUS.BUFF_BODY_TTS = {
	wyvernCC             = "Asleep",
	wyvernDot            = "(.+) damage every (%d+) sec(.+)."
}


-- Action names
-- Since this table is appended to by the class specific addons, we have to
-- write out each line
lsLocale.enUS.ACTION_TTS = {}
lsLocale.enUS.ACTION_TTS.berserking       = "Berserking"
lsLocale.enUS.ACTION_TTS.bloodFury        = "Blood Fury"
lsLocale.enUS.ACTION_TTS.cannibalize      = "Cannibalize"
lsLocale.enUS.ACTION_TTS.escapeArtist     = "Escape Artist"
lsLocale.enUS.ACTION_TTS.findTreasure     = "Find Treasure"
lsLocale.enUS.ACTION_TTS.perception       = "Perception"
lsLocale.enUS.ACTION_TTS.stoneForm        = "Stoneform"
lsLocale.enUS.ACTION_TTS.shadowmeld       = "Shadowmeld"
lsLocale.enUS.ACTION_TTS.warStomp         = "War Stomp"
lsLocale.enUS.ACTION_TTS.forsaken         = "Will of the Forsaken"
lsLocale.enUS.ACTION_TTS.bow              = "Shoot Bow"
lsLocale.enUS.ACTION_TTS.crossbow         = "Shoot Crossbow"
lsLocale.enUS.ACTION_TTS.gun              = "Shoot Gun"
lsLocale.enUS.ACTION_TTS.throw            = "Throw"
lsLocale.enUS.ACTION_TTS.petFollow        = "Follow"
lsLocale.enUS.ACTION_TTS.petStay          = "Stay"
lsLocale.enUS.ACTION_TTS.petAggressive    = "Aggressive"
lsLocale.enUS.ACTION_TTS.petDefensive     = "Defensive"
lsLocale.enUS.ACTION_TTS.petPassive       = "Passive"
lsLocale.enUS.ACTION_TTS.findHerbs        = "Find Herbs"
lsLocale.enUS.ACTION_TTS.findMinerals     = "Find Minerals"

-- About.lua
ABOUT_ALL_ROPE = "All the rope you need..."
ABOUT_BROUGHT = "Brought to you by:"
ABOUT_SIGNIFICANT_CONTRIBUTIONS = "With significant contributions by:"
ABOUT_TO_USE = "To use LazyScript, place a macro with the following on your action bar and repeatedly hit the macro in battle:"
ABOUT_SEE_WEBSITES = "Please see the following websites for documentation, discussion and new releases:"
ABOUT_LAZYCONTRIBUTORS = "LazyContributors"
ABOUT_ALL_TESTING = "All the testing we need..."
ABOUT_MANY_THANKS = "Many thanks to:"

-- About.xml
About = "About"
Contributors = "Contributors"

-- Actions.lua
ACTION = "The action "
NOT_SUPPORTED_PLS_USE = " is not supported for your locale. Please use 'action=<full action name>' instead."
ERROR_TYPE_TEXTURE = "Holy flying unknown texture type, Batman!"
FOUND = "found "
AT_SLOT = " at slot "
COULDNT_FIND = "Couldn't find \""
ADD_IT_PLAYER = "\" on your action bar, PLEASE ADD IT."
SPELLSEARCH_FOUND_NIL_TEXTURE = "SpellSearch found nil texture at index "
SPELLSEARCH_FOUND = "SpellSearch found "
AT_INDEX = " at index "
SPELLSEARCH_QUANTITY = "SpellSearch found more than 1000 spells."
RANK_COUNT = ". Rank Count = "
RANK_COUNT_2 = "rankCount = "
TEXTURE = ", texture = "
SPELLSEARCH_STOP = "SpellSearch stopped finding "
SPELLSEARCH_FOUND_NIL_NAME = "SpellSearch found nil name at index "
ACTION_1 = "Action: "
IN_SPELL_BOOK = "\" in your spell book."
ATTEMPTING_TO_CAST = "Attempting to cast "
ITEM_EQUIPPED = "Item is already equipped."
ITEM_NOT_FOUND = "Item not found: "
USING_ITEM = "Using item: "
AT_EQUIPPED_SLOT = ") at equipped slot: "
AT_BAG_SLOT = ") at bag/slot slot: "
WEAPON_BUFF_BAG_SLOT_NOT_FOUND = "Weapon buff bag slot not found. WTF?"
APPLYWEAPONBUFF = "ApplyWeaponBuff: Item "
IN = " in "
ITEM_TYPE_IS_NOT_WEAPON = " item type is not a Weapon: "
ISITEMSTILLHERE_NOT_FOUND = "IsItemStillHere: Found item "
AT_BAG_SLOT_1 = " at Bag/Slot: "
SEARCHBAGS_FOUND = "SearchBags: Found item "
ASSISTING = "Assisting "
ASSIST_TARGET_NOT_SET = "Assist target not set. Please set with /lazyscript assist <assist name>"
CANNOT_FIND = "Cannot find "
IN_GROUP_OR_RAID_TO_ASSIST = " in group or raid to assist. Please update with /lazyscript assist <assist name>"
CANNOT_ASSIST_DEAD = " seems to be dead, cannot assist."
CANNOT_ASSIST_RANGE = " seems to be out of range, cannot assist."
TARGET_IS_DEAD_SKIP = "'s target is dead, skipping to next action"
STOPPING_AUTO_ATTACK = "Stopping auto-attack..."
STOPPING_AUTO_SHOOT = "Stopping Shoot..."
STOPPING_AUTO_SHOT = "Stopping Auto Shot..."
NO_SHAPESHIFT_FORMS_AVAILABLE = "No shapeshift forms available."
SHAPESHIFT_FORM = "Shapeshift form: "
NOT_FOUND = " not found."
FOUND_PET_ACTION = "Found pet action "
ADD_IT_PET = "\" on your pet action bar, PLEASE ADD IT."
PET_ACTION = "Pet action: "
NOT_HAVE_PET_BAR = "You do not have a pet action bar."
NOT_HAVE_PET = "You do not have a pet."
COULD_NOT_CALL_FORM = "Could not call form "
TRY_ACTION = "Try: Action #"

-- AutoAttack.lua
COULDNT_FIND_ATTACK = "Couldn't find Attack action on your action bar, PLEASE ADD IT." 
INITIATING_AUTO_ATTACK = "Initiating auto-attack..."
FOUND_AUTO_SHOT = "Found Auto Shot action at slot "
COULDNT_FIND_AUTO_SHOT = "Couldn't find Auto Shot action on your action bar, PLEASE ADD IT."
FOUND_SHOOT_WAND = "Found Shoot Wand action at slot "
COULDNT_FIND_SHOOT_WAND = "Could not find Shoot Wand action on your action bar, PLEASE ADD IT."

-- Deathstimator.lua
YOURE_NOT_IN_COMBAT = "You're not in combat, and the death thing's showing, so I'm hiding it"
YOURE_IN_COMBAT = "You're IN combat, and the death thing's hidden, so I'm showing it"
GATHERING = "...gathering..."
RECALIBRATING = "...recalibrating..."
DEATH_IN = "Death in "
S = "s"
DEATHSTIMATOR = "Deathstimator"
DEATHSTIMATOR_TOOLTIP = "Shift + Left Click to move me around."

-- FormEdit.lua
FORM = "Form "
TESTING = "Testing "
FORM_1 = " form..."
TESTING_COMPLETED = "Testing completed."

TAB_OVERVIEW_1 = "<H1>Overview</H1>"
TAB_OVERVIEW_2 = "<P>LazyScript is a scripting language for World of Warcraft that is able to execute certain attacks or abilities under conditions that you specify. This is accomplished by writing a \"form\", which consists of a series of actions and criteria. When the LazyScript macro is run, the LazyScript engine will read through the list of actions from top to bottom until it finds an action that is ready to be used and then executes it.</P>"
TAB_OVERVIEW_3 = "<P>Any line may be commented out by placing '--', '//', or '#' at the start of the line.</P>"
TAB_OVERVIEW_TUTORIAL_1_1 = "<H1>Tutorial 1: Baby steps</H1>"
TAB_OVERVIEW_TUTORIAL_1_2 = "<P>For example, let us make LazyScript execute Sinister Strike. First, check what the short name is for Sinister Strike in the actions tab. We see that it is \"ss\". Now choose \"Create New Form\" from the LazyScript minimap menu. Give your form a name like \"MyForm\" and type:</P>" 
TAB_OVERVIEW_TUTORIAL_1_3 = "<P>Click on the \"Test\" button. If everything is okay and there were no typos, a \"Testing completed\" message will appear in your chat box. If there were errors, a summary of the error will be printed in the chat box instead. If everything is working then click on the \"Okay\" button. You should now see the form \"MyForm\" in the LazyScript minimap form list. Click on \"MyForm\" to set it as the default. A little check mark should appear next to \"MyForm\" on the minimap menu.</P>"
TAB_OVERVIEW_TUTORIAL_1_4 = "<P>Now create a macro with the command:</P>"
TAB_OVERVIEW_TUTORIAL_1_5 = "<P>and place it on your action bar. Also place the highest rank of \"Sinister Strike\" on your action bar somewhere. The \"Sinister Strike\" action need not be visible. Now go out and fight something and hit your LazyScript macro key and LazyScript will automatically execute Sinister Strike.</P>"
TAB_OVERVIEW_TUTORIAL_2_1 = "<H1>Tutorial 2: Now we're getting somewhere</H1>"
TAB_OVERVIEW_TUTORIAL_2_2 = "<P>|cffffaaff\"That's not particularly impressive\"|r</P>"
TAB_OVERVIEW_TUTORIAL_2_3 = "<P>Well, let us move onto something more interesting then. Let us include an action that we can not execute all the time like \"Riposte\". We always prefer to execute riposte rather than sinister strike, but riposte is not always usable. Edit \"MyForm\" and add riposte before sinister strike, like so:</P>"
TAB_OVERVIEW_TUTORIAL_2_4 = "<P>and place Riposte on your action bar somewhere. Now when you hit the LazyScript macro during combat, LazyScript will execute Sinister Strike until you parry an attack. Once that happens, LazyScript will execute Riposte when you next hit the LazyScript macro button. Most importantly, it will do all this without the \"That action is not ready yet\" spam that you would normally have to put up with when using a standard macro.</P>"
TAB_OVERVIEW_TUTORIAL_3_1 = "<H1>Tutorial 3: To do or not to do, that is the question</H1>"
TAB_OVERVIEW_TUTORIAL_3_2 = "<P>One of the most useful features of LazyScript is the ability to associate conditions or criteria with a particular action. For example, you only want to kick the target if it is casting a spell. Looking at the criteria tab we notice that there is a condition \"-if[Not]TargetIsCasting\" plus some other scary looking stuff. Let us ignore the complicated stuff for now and just use \"-ifTargetIsCasting\". Interrupting a spell is more important than using Riposte, so edit \"MyForm\" and change it to:</P>"
TAB_OVERVIEW_TUTORIAL_3_3 = "<P>Now LazyScript will only kick if it detects that the target is casting a spell.</P>"
TAB_OVERVIEW_TUTORIAL_3_4 = "<P>|cffffaaff\"But what if I only want to interrupt fire spells?\"|r</P>"
TAB_OVERVIEW_TUTORIAL_3_5 = "<P>Well that is what the rest of that complicated string is all about. Edit \"MyForm\" and change the form to:</P>"
TAB_OVERVIEW_TUTORIAL_3_6 = "<P>|cffffaaff\"What about if I only want to interrupt fire or frost spells? Do I have to type that all out again?\"|r</P>"
TAB_OVERVIEW_TUTORIAL_3_7 = "<P>Nope, change \"MyForm\" to:</P>"
TAB_OVERVIEW_TUTORIAL_3_8 = "<P>|cffffaaff\"I'm decked out in MC gear. The only spells I care about interrupting are heals. Darn priests... *mutter*\"|r</P>"
TAB_OVERVIEW_TUTORIAL_3_9 = "<P>We have that covered too. Just use the full text string, correctly capitalized with spaces:</P>"
TAB_OVERVIEW_TUTORIAL_4_1 = "<H1>Tutorial 4: Why'd you have to go and make things so complicated?</H1>"
TAB_OVERVIEW_TUTORIAL_4_2 = "<P>Probably the most complex criteria you will come across are the buff/debuff checking criteria. They are so complex because they are so flexible. For instance, if you only want to renew your Slice and Dice if you do not already have it running. First check the Buff/Debuff tab and find out what the short buff/debuff name is for Slice and Dice. It is \"snd\", so add a line to your form that has:</P>"
TAB_OVERVIEW_TUTORIAL_4_3 = "<P>If you only want to use Rupture on your target if it does not already have rupture active:</P>"
TAB_OVERVIEW_TUTORIAL_4_4 = "<P>|cffffaaff\"Why don't I see buff/debuff xyz in your list?\"|r</P>"
TAB_OVERVIEW_TUTORIAL_4_5 = "<P>Although we try to be as thorough as possible with class abilities, if we were to have entries for every single buff in the game it would take up too much memory. If a buff is not in the list of recognised buffs/debuffs it is still possible to search for the title of the buff. Just use the following criteria and type in the full name of the buff or debuff with capitalization and spacing as it appears in the tooltip text:</P>"
TAB_OVERVIEW_TUTORIAL_4_6 = "<P>|cffffaaff\"My tanks are boring and they tell me not to start attacking the mob until they've sundered it a few times. Can LazyScript help me?\"|r</P>"
TAB_OVERVIEW_TUTORIAL_4_7 = "<P>LazyScript is also able to check how many applications of a buff or debufff there are. After prying out that by \"few\" they mean \"at least 3\", you can add something like this to the top of your form:</P>"
TAB_OVERVIEW_TUTORIAL_5_1 = "<H1>Tutorial 5: Multi-tasking</H1>"
TAB_OVERVIEW_TUTORIAL_5_2 = "<P>By now you may have noticed that some actions on the actions tab are colored green. Hopefully you read the help text and know that this has something to with multiple actions that do not trigger the global cooldown. What it boils down to is that you can chain any number of these actions together in one line along with at most one action that does trigger the global cooldown and LazyScript will execute them in sequence. For example, activate Cold Blood, use Eviscerate and provide a cute parting message:</P>"
TAB_OVERVIEW_TUTORIAL_5_3 = "<P>Here are a few more examples</P>"
TAB_OVERVIEW_TUTORIAL_6_1 = "<H1>Tutorial 6: Form re-use</H1>"
TAB_OVERVIEW_TUTORIAL_6_2 = "<P>So you've written some forms and they're starting to get a little long and complicated. If they contain sections which are identical, you can separate that section out into another form and use |cffff770CincludeForm|r to include it in the other forms. For example:</P>"
TAB_OVERVIEW_TUTORIAL_6_FORM_INT = "<P>Form \"Interrupts\":</P>"
TAB_OVERVIEW_TUTORIAL_6_FORM_FA = "<P>Form \"FrontAttack\":</P>"
TAB_OVERVIEW_TUTORIAL_6_FORM_BA = "<P>Form \"BehindAttack\":</P>"
TAB_OVERVIEW_TUTORIAL_6_3 = "<P>This will include the Interrupts form at the beginning of both the FrontAttack and BehindAttack forms as if you had copy and pasted it in there. When you change the contents of the Interrupts form, it will automatically update the FrontAttack and BehindAttack forms to include the new version.</P>"
TAB_OVERVIEW_TUTORIAL_6_4 = "<P>|cffffff00Note:|r Be careful that you don't try to include a form into itself, or try to include a form which includes the first form (A includes B includes A). Those will cause a stack overflow error because they're infinite recursion loops.</P>"
TAB_OVERVIEW_TUTORIAL_6_5 = "<P>Now perhaps you have some actions that you only want to perform under certain conditions but don't want the whole list of actions to be checked every time you press your LazyScript button. If we look at the previous example, we can see that ifTargetIsCasting is a criteria common to all of the actions in the Interrupts form. Using callForm we could rewrite the previous example like so:</P>"
TAB_OVERVIEW_TUTORIAL_6_6 = "<P>With these changes, when you execute FrontAttack or BehindAttack, it will call the Interrupts form only if the target is casting and not stunned. So if the target is not casting, it won't even check any of the actions/criteria in the Interrupts form.</P>"

TAB_LIST_ACTIONS = "<H1>List of known Spells/Actions</H1>"
TAB_ACTIONS_SYNTAX_SPECIFIC_SPELL_RANK = "<BR/><P>A specific spell rank can be directed at a particular unit using the syntax:</P>"
TAB_ACTIONS_SYNTAX_SPECIFIC_SPELL_RANK_1 = "<BR/><P>The |cff00ffff&lt;UnitId&gt;|r can be any valid UnitId sequence as described in &lt;|cff8080ffhttp://www.wowwiki.com/UnitId|r&gt;. For example, @player, @pet, @target, @targettarget. Note that the rank of the spell must always appear before the '@' symbol.</P>"
TAB_ACTIONS_GREEN_ACTIONS = "<BR/><P>Actions in |cff40ff40green|r do not trigger the global cooldown. LazyScript is able to perform multiple of these actions on a single line provided that the line has at most one action that triggers the global cooldown.</P><BR/>"
TAB_ACTIONS_COMBO = "<H2>Combo Actions</H2>"
TAB_ACTIONS_OTHER = "<H2>Other Actions</H2>"
TAB_ACTIONS_SPECIAL = "<H2>Special Actions</H2>"
TAB_ACTIONS_PARAMETERS = "<H2>Actions that take parameters</H2>"
TAB_ACTIONS_PARAMETERS_1 = "<P>|cffffffffUse an action:|r<BR/> action=&lt;action/macro name&gt;</P>"
TAB_ACTIONS_PARAMETERS_2 = "<P>|cffffffffUse an action that does not trigger the global cooldown:|r<BR/> |cff40ff40freeAction|r=&lt;action/macro name&gt;</P>"
TAB_ACTIONS_PARAMETERS_3 = "<P>|cffffffffUse a pet action:|r<BR/> |cff40ff40petAction|r=&lt;action&gt;</P>"
TAB_ACTIONS_PARAMETERS_4 = "<P>|cffffffffUse an item in your equipment or inventory:|r<BR/> use=&lt;itemid/item name&gt;</P>"
TAB_ACTIONS_PARAMETERS_5 = "<P>|cffffffffUse an item only if it is equipped:|r<BR/> useEquipped=&lt;itemid/item name&gt;</P>"
TAB_ACTIONS_PARAMETERS_6 = "<P>|cffffffffUse an item in your equipment or inventory that does not trigger the global cooldown:|r<BR/> useFreeItem=&lt;itemid/item name&gt;</P>"
TAB_ACTIONS_PARAMETERS_7 = "<P>|cffffffffUse an item that does not trigger the global cooldown only if it is equipped:|r<BR/> useFreeEquippedItem=&lt;itemid/item name&gt;</P>"
TAB_ACTIONS_PARAMETERS_8 = "<P>|cffffffffApply an item weapon buff:|r<BR/> apply{MainHand,OffHand}Buff=&lt;itemid/item name&gt;</P>"
TAB_ACTIONS_PARAMETERS_9 = "<P>|cffffffffEquip a weapon in your main hand:|r<BR/> equipMainHand=&lt;itemid/item name&gt;</P>"
TAB_ACTIONS_PARAMETERS_10 = "<P>|cffffffffEquip a weapon in your off hand:|r<BR/> equipOffHand=&lt;itemid/item name&gt;</P>"
TAB_ACTIONS_PARAMETERS_11 = "<P>|cffffffffEcho the message to your chat:|r<BR/> |cff40ff40echo|r=&lt;message&gt;</P>"
TAB_ACTIONS_PARAMETERS_12 = "<P>|cffffffffSay the message in the specified channel:|r<BR/> |cff40ff40sayIn{|cff40ff40Emote, Guild, Minion, Party, Raid, RAID_WARNING, Say, Yell|r}|cff40ff40|r=&lt;message&gt;</P>"
TAB_ACTIONS_PARAMETERS_13 = "<P>|cffffffffWhisper the message to the specified player or unitId:|r<BR/> |cff40ff40whisperTo|r{|cff40ff40playerName, |cff00ffff&lt;UnitId&gt;|r}|cff40ff40|r=&lt;message&gt;</P>"
TAB_ACTIONS_PARAMETERS_14 = "<P>|cffffffffCancel the specified buff:|r<BR/> |cff40ff40cancelBuff|r=&lt;buff&gt;</P>"
TAB_ACTIONS_PARAMETERS_15 = "<P>|cffffffffCancel the specified buff by title:|r<BR/> |cff40ff40cancelBuffTitle|r=&lt;buffTitle&gt;</P>"
TAB_ACTIONS_PARAMETERS_16 = "<P>|cffffffffSet the specified form as the default:|r<BR/> |cff40ff40setForm|r=&lt;form name&gt;</P>"
TAB_ACTIONS_PARAMETERS_17 = "<P>|cffffffffTarget a specific unit:|r<BR/> |cff40ff40targetUnit|r=|cff00ffff&lt;UnitId&gt;|r</P>"
TAB_ACTIONS_PARAMETERS_18 = "<P>|cffffffffCast a spell on a specific unit:|r<BR/> |cff40ff40spellTargetUnit|r=|cff00ffff&lt;UnitId&gt;|r</P>"
TAB_ACTIONS_PARAMETERS_19 = "<P>|cffffffffTarget a player/creature by their exact name:|r<BR/> |cff40ff40targetByName|r=&lt;exact name&gt;</P>"
TAB_ACTIONS_PARAMETERS_20 = "<P>|cffffffffPerform emote (See |cff8080ffhttp://www.wowwiki.com/API_TYPE_Emotes_Token|r|cffffffff):|r<BR/> |cff40ff40doEmote|r=&lt;emoteToken&gt;</P>"
TAB_ACTIONS_PARAMETERS_21 = "<P>|cffffffffPlay sound (See |cff8080ffhttp://www.wowwiki.com/API_PlaySound|r|cffffffff):|r<BR/> |cff40ff40playSound|r=&lt;soundName&gt;</P>"
TAB_ACTIONS_PARAMETERS_22 = "<H2>Meta-Actions</H2>"
TAB_ACTIONS_PARAMETERS_23 = "<P>|cffffffffInclude the contents of the specified form:|r<BR/> includeForm=&lt;form name&gt;<BR/>"
TAB_ACTIONS_PARAMETERS_24 = "|cffffff00Note:|r This does not accept criteria. It must appear on a line by itself. You cannot include a form in itself, nor should you include a form which includes another form which includes the first (e.g. form A includes form B includes form A == BAD).</P>"
TAB_ACTIONS_PARAMETERS_25 = "<P>|cffffffffCall the specified form:|r<BR/> callForm=&lt;form name&gt;<BR/>"
TAB_ACTIONS_PARAMETERS_26 = "This will try to find a usable action in the specified form, if the criteria on the callForm action are satisfied.</P>"

TAB_LIST_CRITERIA = "<H1>List of recognised criteria</H1>"
TAB_CRITERIA_1 = "<BR/><P>Append zero or more criteria to an action.  All criteria must be true for that action to be used.  List your actions one after another on separate lines.  The first action that matches all criteria is used.</P>"
TAB_CRITERIA_2 = "<BR/><P>Multiple values within curly braces ({}) means choose one or more.  If more than one is chosen, separate them with commas (e.g. ifRace=Human,Gnome) and the criteria will match if any of the choices match.  If a multiple-choice criteria is negated with a \"Not\" (e.g. ifNotRace=Human,Gnome) then the criteria will match only if none of the choices match.  Square brackets ([]) mean the value is optional.  Do NOT leave the curly braces or square brackets in your form.</P>"
TAB_CRITERIA_ACTION = "<H2>Action Criteria:</H2>"
TAB_CRITERIA_SEE_NOTE = "see note"
TAB_CRITERIA_ATTACK = "<H2>Attack Criteria:</H2>"
TAB_CRITERIA_BUFF_DEBUFF = "<H2>Buff/Debuff Criteria:</H2>"
TAB_CRITERIA_PLAYER_ONLY = "player only"
TAB_CRITERIA_SEE_NOTES = "see notes"
TAB_CRITERIA_AND = "and"
TAB_CRITERIA_ITEM = "<H2>Item Criteria:</H2>"
TAB_CRITERIA_PLAYER = "<H2>Player Criteria:</H2>"
TAB_CRITERIA_PARTY_OR_RAID = "party or raid"
TAB_CRITERIA_PVP_ONLY = "PvP only"
TAB_CRITERIA_PET = "<H2>Pet:</H2>"
TAB_CRITERIA_PARTY_PET_TARGET = "<H2>Player, Pet or Target Criteria:</H2>"
TAB_CRITERIA_DEFAULT = "defaults to &lt;5s, "
TAB_CRITERIA_TARGET = "<H2>Target Criteria:</H2>"
TAB_CRITERIA_NPC_ONLY = "NPC only"
TAB_CRITERIA_WITHIN = "Within"
TAB_CRITERIA_YARDS = "yards"
TAB_CRITERIA_NOT_WORK_BOSS = "Does not work for bosses"
TAB_CRITERIA_CUSTOM_HELP_1 = "<P>|cffffff00Note 1:|r To use -if{Ctrl,Alt,Shift}Down, you MUST remove any existing Ctrl/Alt/Shift key bindings from the Main Menu, Key Bindings. Otherwise the game will intercept the key and LazyScript will not see it.</P>"
TAB_CRITERIA_CUSTOM_HELP_2 = "<P>|cffffff00Note 2:|r Always use with -if[Not]TargetFriend since it will return true if the target is not a valid target for the spell.</P>"
TAB_CRITERIA_CUSTOM_HELP_3 = "<P>|cffffff00Note 3:|r Within X.Y sec, defaults to 0.3.</P>"
TAB_CRITERIA_CUSTOM_HELP_4 = "<P>|cffffff00Note 4:|r The buff/debuff name must be the full name (including capitalization and spaces) of the buff/debuff title as it appears in the tooltip.</P>"
TAB_CRITERIA_CUSTOM_HELP_5 = "<P>|cffffff00Note 5:|r XX refers to the number of buff/debuff applications. e.g. -ifTargetHasDebuff&lt;5=sunder</P>"
TAB_CRITERIA_CUSTOM_HELP_6 = "<P>|cffffff00Note 6:|r As of patch 1.12 this only works on unfriendly targets for Rogue (Sinister Strike), Druid (Growl), Hunter (Wing Clip) and Warrior (Rend).</P>"
TAB_CRITERIA_CUSTOM_HELP_7 = "<P>|cffffff00Note 7:|r The ifUsable criteria checks if the action is valid for use at present as per the Blizzard API call IsUsableAction. This does not include cooldown or range checking.</P>"
TAB_CRITERIA_CUSTOM_HELP_8 = "<P>|cffffff00Note 8:|r The ifGlobalCooldown criteria requires a specific action to be placed on your action bar so that it may be checked for the global cooldown. It does not have to be on a visible action bar. For each class, the actions are as follows:</P>"
TAB_CRITERIA_CUSTOM_HELP_8_CLASSES = "<P>Rogue: |cffffffffSinister Strike|r<BR/>Druid: |cffffffffMark of the Wild|r<BR/>Hunter: |cffffffffTrack Beasts|r<BR/>Priest: |cffffffffPower Word: Fortitude|r<BR/>Warrior: |cffffffffBattle Shout|r<BR/>Mage: |cffffffffFrost Armor|r<BR/>Warlock: |cffffffffDemon Skin|r<BR/>Shaman: |cffffffffRockbiter Weapon|r<BR/>Paladin: |cffffffffSeal of Righteousness|r</P>"
TAB_CRITERIA_CUSTOM_HELP_9 = "<P>|cffffff00Note 9:|r The |cff00ffff&lt;UnitId&gt;|r can be any valid UnitId sequence as described in &lt;|cff8080ffhttp://www.wowwiki.com/UnitId|r&gt;. For example, player, pet, target, targettarget. Capitalization is not important.</P>"
TAB_CRITERIA_CUSTOM_HELP_10 = "<P>|cffffff00Note 10:|r The ifLastUsed timer will perform the action immediately at the start of combat or if you changed targets if the action is available. The ifTimer criteria will first countdown XX seconds after initiating combat or changing targets before performing the action for the first time.</P>"
TAB_CRITERIA_CUSTOM_HELP_11 = "<P>|cffffff00Note 11:|r This criteria only detects full blocks and resists. A partial block or resist (\"Joe hits you for 10 damage (5 blocked).\") either on the player or the target will NOT be detected by this criteria.</P>"

TAB_LIST_BUFFS_DEBUFFS = "<H1>List of known Buffs/Debuffs</H1>"
TAB_BUFFS_DEBUFFS_USED = "<BR/><P>Used with \"if[Not]{Player,Pet,Target}Has{Buff,Debuff}\" and \"if[Not]{Buff,Debuff}Duration{&lt;,&gt;}XXs\".</P><BR/>"
TAB_FULL_SHORT_NAME = "<H2>Full Name = Short Name</H2>"

-- FormEdit.xml
LazyScript_Form_Editor = "LazyScript Form Editor"
Editing_form = "Editing form:"
Help = "Help"
Cancel = "Cancel"
Okay = "Okay"
Test = "Test"
LazyScript_Help = "LazyScript Help"
Overview = "Overview"
Actions = "Actions"
Criteria = "Criteria"
Buffs_Debuffs = "Buffs/Debuffs"

-- Immunity.xml
--Cancel = "Cancel"
--Help = "Help"
--Okay = "Okay"
Immunities_Criteria_Editor = "Immunities Criteria Editor"
Shows_all_learned_immunities = "The following shows all learned immunities so far..."

-- ImmunityTypeTracking.lua
IMMUNITY_TRACKING_NOT_SUPPORTED = "Immunity tracking is not supported for your locale."
IMMUNITY_TRACKING_NOT_100 = "Immune tracking is not 100% supported for your locale."
IMMUNITY_DETECTED = "IMMUNITY DETECTED! Spell: "
IMMUNITY_CREATURE = "      Creature: "
IMMUNITY_TYPE_TRACKING_NOT_SUPPORTED = "Spell type immunity tracking is not supported for your locale."
COULD_NOT_DETERMINE_SPELLTYPE = "Could not determine spelltype from: "
NEW_SPELL_TYPE_DETECTED = "New spell type detected. Spell: "
TYPE = " Type: "
GLOBAL_IMMUNITY_CRITERIA_UPDATED = "Global immunity criteria updated."

-- Interrupt.lua
INTERRUPTS_NOT_SUPPORTED = "Interrupts are not supported for your locale."
DETECTED_YOUR_TARGET = "Detected your target is casting "
SUGGEST_INTERRUPT = ", will suggest Interrupt."
IS_CASTING = " is casting "
GLOBAL_INTERRUPT_CRITERIA_UPDATED = "Global interrupt criteria updated."

-- Interrupt.xml
--Cancel = "Cancel"
--Help = "Help"
--Okay = "Okay"
Interrupt_EXCEPTION_Criteria_Editor = "Interrupt EXCEPTION Criteria Editor"
NOT_INTERRUPT_SPELLCAST = "If any of the following are true, LazyScript will NOT interrupt the spellcast."

-- LazyScript.lua
--FORM = "Form "
--IMMUNITY_TRACKING_NOT_SUPPORTED = "Immunity tracking is not supported for your locale."
--NOT_FOUND = " not found."
-- DEATHSTIMATOR =  "Deathstimator"
GANKED_ATTAKERS_NOT_SUPPORT = "ifGanked and ifXAttackers is not supported for your locale."
BATTLEGROUND_FLAG_HOLDER_DET_NOT_SUPPORT = "Battleground flag-holder detection is not supported for your locale."
DUELING_DET_NOT_SUPPORT = "Dueling detection is not supported for your locale."
DOD_PAR_BLOCK_RES_NOT_SUPPORT = "ifDodged/Parried/Blocked/Resisted are not supported for your locale."
WELCOME = "Welcome to "
LOADED = " loaded. All the rope you need...\nType |cffffff00/lazyscript help|r to get a list of commands."
ENTERING_DUEL = "Entering Duel"
LEAVING_DUEL = "Leaving Duel"
FLAG_HOLDER = "Flag Holder: "
FLAG_HOLDER_EMPTY = "Flag Holder: Empty"
BEHIND_ATTACK_FAILED = "I see your behind-only attack just failed, will wait to use it again."
INFRONT_ATTACK_FAILED = "I see your infront-only attack just failed, will wait to use it again."
OUTDOORS_ATTACK_FAILED = "I see your outdoors-only attack just failed, will wait to use it again."
UNHANDLED_EVENT = "Unhandled event: "
PVP_OPPONENTS = "|cffe5e519PVP Opponents:"
NOT_SUPPORTED = "not supported for your locale."
COUNT = " Count:"
MONSTER_EMOTE_ARG1 = "Monster Emote: arg1="
DETECTED_FLEEING_NPC = "Detected fleeing NPC: "
DETECTED_DODGE = " dodge detected at "
DETECTED_PARRY = " parry detected at "
DETECTED_BLOCK = " block detected at "
DETECTED_RESIST = " resist detected at "
CMD_DESCRIPTION_1 = " do <attack1> [<attack2> ...]"
CMD_DESCRIPTION_2 = " list"
CMD_DESCRIPTION_3 = " edit <formName>"
CMD_DESCRIPTION_4 = " set <formName> <attack1> [<attack2> ...]"
CMD_DESCRIPTION_5 = " copy <formName> <formName2>"
CMD_DESCRIPTION_6 = " clear <formName>"
CMD_DESCRIPTION_7 = " default [<formName>] [quiet]"
CMD_DESCRIPTION_8 = " [<formName>]"
CMD_DESCRIPTION_9 = " summon"
CMD_DESCRIPTION_10 = " dismiss"
CMD_DESCRIPTION_11 = " hideMinionOutOfCombat"
CMD_DESCRIPTION_12 = " summonDeath"
CMD_DESCRIPTION_13 = " dismissDeath"
CMD_DESCRIPTION_14 = " hideDeathMinionOutOfCombat"
CMD_DESCRIPTION_15 = " mmshow"
CMD_DESCRIPTION_16 = " mmhide"
CMD_DESCRIPTION_17 = " interruptExceptionCriteria"
CMD_DESCRIPTION_18 = " noLongerInterruptLastInterrupted"
CMD_DESCRIPTION_19 = " showTargetCasts"
CMD_DESCRIPTION_20 = " autoTarget"
CMD_DESCRIPTION_21 = " initiateAutoAttack"
CMD_DESCRIPTION_22 = " assist <playername>"
CMD_DESCRIPTION_23 = " useImmunitiesList"
CMD_DESCRIPTION_24 = " clearImmunitiesList"
CMD_DESCRIPTION_25 = " imunityExceptionCriteria"
CMD_DESCRIPTION_26 = " showGankMessage"
CMD_DESCRIPTION_27 = " clearHistoryAfterCombat"	
CMD_DESCRIPTION_28 = " resetDefaultForms"
CMD_DESCRIPTION_29 = " resetAllForms"
CMD_DESCRIPTION_30 = " about"
NO_DEFAULT_FORM_1 = "No default form assigned, choose a form from the " 
NO_DEFAULT_FORM_2 = " minimap bubble, or use "
NO_DEFAULT_FORM_3 = " default <form> to set one."
YOUR_DEFAULT_FORM_1 = "Your default form is "
YOUR_DEFAULT_FORM_2 = ", but it doesn't exist or there is an error!  Please choose a form from the "
YOUR_DEFAULT_FORM_3 = " minimap bubble or set it using "
DEBUGGING_OFF = "Debugging off."
DEBUGGING_ON = "Debugging on."
FORM_UPDATED = "updated"
FORM_CREATED = "created"
DOESNT_EXIST = " doesn't exist."
COPIED_TO_FORM = " copied to form "
REMOVED = " removed."
WARNING_INCLUDED_FORM_1 = "WARNING: The following forms included the form "
WARNING_INCLUDED_FORM_2 = " which you just removed: "
WARNING_INCLUDED_FORM_3 = ". They have been invalidated and must be edited before you can use them."
NOW_DEFAULT_FORM = "Default form is now lazyScript."
WARNING_NO_LONGER_HAVE_FORM_1 = "WARNING: you no longer have a default form.  Choose one from the "
WARNING_NO_LONGER_HAVE_FORM_2 = " minimap bubble."
WILL_NO_LONGER_AUTO_TARGET = " will no longer auto-target."
WILL_NOW_AUTO_TARGET = " will now auto-target."
WILL_NO_LONGER_INITIATE_AUTO_ATTACK = " will no longer initiate auto-attack."
WILL_NOW_INITIATE_AUTO_ATTACK = " will now initiate auto-attack."
WILL_NO_LONGER_CHECK_IMMUN = " will no longer check for immunities."
WILL_NOW_CHECK_IMMUN = " will now check for immunities."
IMMUN_LIST_CLEAR = "Immunities list cleared."
SHOWING_THE_MINION = "Now showing the minion."
HIDING_THE_MINION = "Hiding the minion."
MINION_NO_LONGER_HIDE_IN_COMBAT = "Minion will no longer hide out of combat."
MINION_NOW_HIDE_IN_COMBAT = "Minion will now hide out of combat."
SHOW_DEATHSTIMATOR = "Now showing the deathstimator minion."
HIDE_DEATHSTIMATOR = "Hiding the deathstimator minion."
DEATH_MINION_NO_LONGER_HIDE_IN_COMBAT = "Death minion will no longer hide out of combat."
DEATH_MINION_NOW_HIDE_IN_COMBAT = "Death minion will now hide out of combat."
NO_LONGER_SHOWING_WHY = "No longer showing why "
SHOWING_WHY = " thinks a target is CCd."
NOW_SHOWING_WHY = "Now showing why "
NO_LONGER_SHOWING_GANK = "No longer showing gank info."
SHOWING_GANK = "Now showing gank info."
NO_LONGER_CLEARING_HISTORY = "No longer clearing History after combat."
NOW_CLEARING_HISTORY = "Now clearing History after combat."
HAVENT_INTERRUPTED = "You haven't interrupted anything recently."
NEW_EXCEPTION_1 = "Added new exception ("
NEW_EXCEPTION_2 = ") to global interrupt criteria."
NO_LONGER_SHOWING_TARGET_CASTS = "No longer showing when the target casts."
NOW_SHOWING_TARGET_CASTS = "Now showing when the target casts."
ASSIST_SET_TO = "Assist set to "
TARGET_ASSIST_NOT_SET = "Target Assist Not Set!"
DEFAULT_FORM_IS_NOW = "Default form is now "
DEFAULT_FORM_IS = "Default form is "
NOT_FOUND_TRY = " not found.  Try "
HELP_FOR_HELPS = " help for help."
ERASED_ALL_FORMS = "Erased all forms."
RESET_FORMS_TO_DEFAULT = "Reset forms to defaults."
A = "A " --1142
ADDON_NOT_FOUND_FOR_YOUR_CLASS = " addon was not found for your class."
NO_FORMS_BOUND_THIS_KEY = "There is no form bound to this key."

-- MinimapMenu.lua
MINIMAP_BUTTON_MENU_NONE = "(none)"
MINIMAP_BUTTON_TOOLTIP_CURRENT_FORM = "Current Form: "
MINIMAP_BUTTON_TOOLTIP_1 = "Left-click to choose your form."
MINIMAP_BUTTON_TOOLTIP_2 = "Right-click and drag to move this button."
MINIMAP_BUTTON_MENU_CREATE_NEW_FORM = "< Create new form >"
MINIMAP_BUTTON_MENU_OPT = "< Options >"
MINIMAP_BUTTON_MENU_IMOPT = "< Immunity Options >"
MINIMAP_BUTTON_MENU_CINTOPT = "< Cast Interrupt Options >"
MINIMAP_BUTTON_MENU_DEB = "< Debugging >"
MINIMAP_BUTTON_MENU_HELP = "< Help >"
MINIMAP_BUTTON_MENU_ABOUT = "< About >"
MINIMAP_BUTTON_MENU_OPT_TITLE = " Options"
MINIMAP_BUTTON_MENU_OPT_AT = "Auto-Target"
MINIMAP_BUTTON_MENU_OPT_AT_INITIATE = "... and initiate Auto-Attack"
MINIMAP_BUTTON_MENU_OPT_SM = "Show Minion"
MINIMAP_BUTTON_MENU_OPT_ONLY_IN_COMBAT = "... Only in combat"
MINIMAP_BUTTON_MENU_OPT_SM_ALWAYS_SHOW_ACTION = "... Always show action"
MINIMAP_BUTTON_MENU_OPT_SD = "Show Deathstimator Minion"
MINIMAP_BUTTON_MENU_OPT_SD_DEATHSTIMATOR_SAMPLE = "Deathstimator sample window:"
MINIMAP_BUTTON_MENU_IMOPT_TITLE = "Immunity Options"
MINIMAP_BUTTON_MENU_IMOPT_STOP_IMMUNITY_TRACKING = "Stop Immunity Tracking"
MINIMAP_BUTTON_MENU_IMOPT_START_IMMUNITY_TRACKING = "Track New Immunities"
MINIMAP_BUTTON_MENU_IMOPT_EDIT_IMMUNITY_EXCEPTION = "Edit Imunity Exception Criteria"
MINIMAP_BUTTON_MENU_CINTOPT_TITLE = "Cast Interrupt Options"
MINIMAP_BUTTON_MENU_CINTOPT_EDIT_INTERRUPT_EXCEPTION_CRITERIA = "Edit Interrupt Exception Criteria"
MINIMAP_BUTTON_MENU_CINTOPT_LAST_INTERRUPTED = "Last interrupted: "
MINIMAP_BUTTON_MENU_CINTOPT_DONT_INTERRUPT_IT_AGAIN = "... Don't interrupt it again"
MINIMAP_BUTTON_MENU_DEB_TITLE = "Debugging Options"
MINIMAP_BUTTON_MENU_DEB_LOG_WHEN_TARGET_CASTS = "Log when target casts"
MINIMAP_BUTTON_MENU_DEB_SHOW_WHY_WHEN = "Show why when -ifTargetCCd is true"
MINIMAP_BUTTON_MENU_DEB_DISPLAY_GANKED_INFO = "Display \"Ganked\" info"
MINIMAP_BUTTON_MENU_DEB_AH = "< Action History >"
MINIMAP_BUTTON_MENU_DEB_CLEAR_HISTORY_AFTER_COMBAT = "... Clear History after combat"
MINIMAP_BUTTON_MENU_DEB_ITERNAL = "Internal "
MINIMAP_BUTTON_MENU_DEB_DEBUGGING_NOISY = " debugging (noisy)"
MINIMAP_BUTTON_MENU_FORM_EDIT = "Edit"
MINIMAP_BUTTON_MENU_FORM_COPY = "Copy"
MINIMAP_BUTTON_MENU_FORM_DELETE = "Delete"
MINIMAP_BUTTON_MENU_FORM_SETKEY = "< Set Keybinding >"
MINIMAP_BUTTON_MENU_DEB_AH_TITLE = "Action History"
MINIMAP_BUTTON_MENU_FORM_SETKEY_TITLE = "Set Keybinding"
MINIMAP_BUTTON_MENU_FORM_SETKEY_KEYBIND = "Keybinding "
SETKEY_KEYBIND = "Set keybinding "
SETKEY_KEYBIND_TO_FORM = " to form: "

-- Minion.lua
HIDE_THING_NOT_COMBAT = "You're not in combat, and the thing's showing, so I'm hiding it"
SHOW_THING_IN_COMBAT = "You're IN combat, and the thing's hidden, so I'm showing it"
ZZZ = "...zzz..."
MINION = " Minion."
MINION_TOOLTIP = "Shift + Left Click to move me around."

-- Parse.lua
SYNTAX_ERROR_FOUND_IN = "Syntax error found in: "
SYNTAX_ERROR_CANNOT_PARSE = "Syntax error: cannot parse bit: "
THE_UNITID = "The UnitId '"
IS_NOT_VALID = "' is not valid."
NOT_POSSIBLE_SPECIFY_RANK = "It is not possible to specify a rank for "
YOU_CAN_ONLY_USE_MAX_RANK = "You can only use the maximum rank of "
RANK = "Rank "
EXCEEDS_MAX_OF = " exceeds maximum of "
FOR = " for "
OR_IS_INVALID = " or is invalid."
PARSED = "Parsed "
ACTIONS_AND = " actions and "
MASKS = " masks"
WARNING_NIL_MASK_FOUND_1 = "WARNING! A 'nil' mask was found when parsing the form line \""
WARNING_NIL_MASK_FOUND_2 = "\". This may be due to LazyScript being incompatible with your class' Lazy-addon or it may be a legitimate bug. Please report this error and the full form line to lazytest@googlegroups.com."
REMOVED_1 = "Removed "
DUPLICATE_MASKS = " duplicate masks."
SYNTAX_ERROR_CANNOT_HAVE_MULTIPLE_ACTIONS = "Syntax error: cannot have multiple actions that activate the global cooldown in the same line."
CANNOT_INCLUDE_FORM_1 = ": Cannot include form "
CANNOT_INCLUDE_FORM_2 = " in itself!"
COULD_NOT_INCLUDE_FORM = ": Could not include form "
DOES_NOT_EXIST = " because it does not exist!"
INCLUDING_FORM = ": Including form: "
CONTAINS_ERRORS = " because it contains errors!"
COULD_NOT_PARSE_FROM_LINE = ": Could not parse form line: "
TOTAL_MASKS = ": Total masks: "
PARSING_FORM = "Parsing form "
REPARSING_FORM = "Reparsing form "
WHITCH_DEPENDS_FORM = " which depends on form "
CLEARING_CACHE = "Clearing cache for form "

-- ParseBuffs.lua
-- NOT_SUPPORTED = "not supported for your locale."
OPTIMIZED_BUFF_DEBUFF_CHECK_NOT_VALID = "Optimized buff/debuff checking is not available for your locale. You will have to use ifHasBuffTitle, ifHasDebuffTitle, etc. instead."
LOOKING_FOR = "Looking for: "
APPLICATIONS = " Applications: "
IS_NOT_VALID_UNITID = " is not a valid UnitId."
BUFF_INFO_FOUND = "Buff info found for: "
DID_NOT_FIND = "Did not find "
IN_THE = " in the "
DATABASE_TRY = " database. Try "
INSTEAD = " instead."
FOUND_KNOWN_BUFF = "Found known buff: "
BUFF_DEBUFF_CATEGORY = "Buff/debuff category "
NOT_RECOGNISED = " not recognised."
AFFLICTED_BY = " afflicted by "
SORRY = "Sorry,"
DID_NOT_FIND_ANY_BUFFS = "Did not find any buffs in the "
CATEGORY = " category."

-- ParseGeneral.lua
-- THE_UNITID = "The UnitId '"
-- IS_NOT_VALID = "' is not valid."
-- FOUND_KNOWN_BUFF = "Found known buff: "
-- IS_NOT_VALID_UNITID = " is not a valid UnitId."
-- SPELLSEARCH_FOUND_NIL_TEXTURE = "SpellSearch found nil texture at index "
-- SPELLSEARCH_FOUND = "SpellSearch found "
-- AT_INDEX = " at index "
-- SORRY = "Sorry,"
-- NOT_SUPPORTED = "not supported for your locale."
UNKNOWN_CHANNEL_NAME = "Unknown channel name: "
CANT_SHOOT_WANDS = "You can't shoot wands."
NOT_HANE_AUTO_SHOT = "You do not have Auto Shot."
NO_BUFF_ENTRY_FOUND = "No buff entry found for "
TRY_CANCLEBUFFTITLE =  ". Try using cancelBuffTitle instead."
COULD_NOT_FIND_FORM = "Could not find form "
ONLY_MAIN_AND_OFF_HAND_SUPPORTED = "Only MainHand and OffHand are supported, not"
RANGECHECKACTION_IS_NIL = "TargetInMeleeRange: rangeCheckAction is nil."
ISACTIONINRANGE_RETURNED_NIL = "TargetInMeleeRange: IsActionInRange returned nil. Target is invalid."
IFTARGETINMELEERANGE_NOT_SUPPORT = "ifTargetInMeleeRange is not currently supported for your class."
IFTARGETINMELEERANGE_NOT_SUPPORT_NOT_HAVE = "ifTargetInMeleeRange is not currently supported for your class because you do not have "
YET = " yet."
MOBINFO2_NOT_INSTALLED = "MobInfo2 (or equivalent) not installed, can't determine target's HP."
LOCALE_NOT_EXIST = "Localization does not exist for problem mount: "
YOU_IN_BG = "You're in batteground: "
ENABLE_GCD_1 = "To enable checking of the Global Cooldown, please place the "
ENABLE_GCD_2 = " action on your action bar."
UNKNOWN_CLASS = "HAX! Unknown class: "
IFTARGETFLAGRUNNER_NOT_SUPPORT = "Sorry, ifTargetFlagRunner is not supported for hostile targets in your locale."
SEARCH_TARGET_OVER = "Search for target over lvl "
SEARCH_TARGET_EQUAL = "Search for target equal to lvl "
SEARCH_TARGET_UNDER = "Search for target under lvl "
UNABLE_TO_DETERMINE = "unable to determine plus/minus sign"
KEY = "Key: "
VALUE = ", value: "
KEY_2 = "Match found: Key: "
ONLY_CTRL_ALT_SHIFT = "Only Ctrl, Alt, and Shift are supported, not: "
YOU_MUST_PUT = "You must put an action before -everyXXs."
SYNTAX_EG = "syntax e.g. "
NOT_VALID_NUMBER = " is not a valid number. Valid examples are: 1, 1.0, 1.5, 19.25"
COULD_NOT_FIND_ACTION = "Could not find action: "
ITEM = "Item "
HAS_IMMUNITY_TO = " has immunity to "
IFTARGETIMMUNE_MUST_APPEAR_AFTER = "-ifTargetImmune must appear after the action to be checked."
DID_NOT_RECOGNICE = "Did not recognise tracking type: "
UNRECOGNISED_ACTION = "Unrecognised action: "
ACTION_MUST_APPEAR_BEFORE = "The action must appear before -ifIsCurrentAction."
INVALID_OPERATOR = "Invalid operator: "
ARE_NOT_SUPPORTED = " are not supported for your locale."
IS_NOT_VALID_NUMBER = "' is not a valid number."
DEATH_IN_2 = "Death in: "
SECONDS = " seconds."
TIMETODEATH_CANNOT_ESTIMATED = "TimeToDeath cannot be estimated without MobInfo-2 installed."
ONLY_MAIN_OR_OFF_HAND_SUPPORTED = "Only MainHand or OffHand supported, not "
SPELLDEARCH_FOUND_MORE_THAN = "SpellSearch found more than "
SPELLS = "spells."

-- Tooltip.lua
CLEARING_CACHE_FOR = ": clearing cache for "

-- Util.lua
SPELL = "Spell: "
TEXTURES = "Textures: "

BINDING_NAME_LAZYSCRIPT_EXECUTE = "Execute Default Form"
BINDING_NAME_LAZYSCRIPT_KEYBIND1 = "Execute Form 1"
BINDING_NAME_LAZYSCRIPT_KEYBIND2 = "Execute Form 2"
BINDING_NAME_LAZYSCRIPT_KEYBIND3 = "Execute Form 3"
BINDING_NAME_LAZYSCRIPT_KEYBIND4 = "Execute Form 4"
BINDING_NAME_LAZYSCRIPT_KEYBIND5 = "Execute Form 5"
BINDING_NAME_LAZYSCRIPT_KEYBIND6 = "Execute Form 6"
BINDING_NAME_LAZYSCRIPT_KEYBIND7 = "Execute Form 7"
BINDING_NAME_LAZYSCRIPT_KEYBIND8 = "Execute Form 8"
BINDING_NAME_LAZYSCRIPT_KEYBIND9 = "Execute Form 9"
BINDING_NAME_LAZYSCRIPT_KEYBIND10 = "Execute Form 10"

function lazyScript.LoadLocalization(locale)
	
	if (locale == "ruRU") then
		-- Russia localization by Lichery
		lsLocale.ruRU = {}
		
		-- Popup dialog text
		lsLocale.ruRU.INCOMPATIBLE_ADDON = "%s несовместим с %s. Пожалуйста обновите до последней версии."
		lsLocale.ruRU.DELETE_FORM = "Вы уверены, что хотите удалить '%s' форму?"
		
		-- Initiate spell casting
		lsLocale.ruRU.SPELLCASTOTHERSTART      = "(.+) начинает использовать (.+)."
		lsLocale.ruRU.SPELLPERFORMOTHERSTART   = "(.+) начинает выполнять действие (.+)."
		
		--Spell type catches
		lsLocale.ruRU.SPELLTEXT = {
			"(.+) .+ наносит .+ %d+ ед. урона (.+): критический эффект.",	-- SPELLLOGCRITSCHOOLOTHEROTHER = "%s's %s crits %s for %d %s damage.";
			"(.+) .+ наносит .+ %d+ ед. урона (.+).",						-- SPELLLOGSCHOOLOTHEROTHER = "%s's %s hits %s for %d %s damage."
			"Вы получаете %d+ ед. урона (.+) от заклинания (.+) .+.", 		-- You suffer 3 frost damage from Rabbit's Ice Nova.
		}
		
		-- The class of spell damage
		lsLocale.ruRU.SPELLTYPE = {
			fire     = "огонь",				-- SPELL_SCHOOL2_CAP = "Fire"
			frost    = "лед",				-- SPELL_SCHOOL4_CAP = "Frost"
			nature   = "природа",			-- SPELL_SCHOOL3_CAP = "Nature"
			shadow   = "тьма",				-- SPELL_SCHOOL5_CAP = "Shadow"
			arcane   = "тайная магия",		-- SPELL_SCHOOL6_CAP = "Arcane"
			holy     = "свет",				-- SPELL_SCHOOL1_CAP = "Holy"
		}
		
		lsLocale.ruRU.MOUNTED_BUFF_TT    = "Скорость повышена"
		
		-- Dodge, parry, block, resist
		lsLocale.ruRU.PLAYER_DODGE          = "Вы уклоняетесь от атаки .+%."
		lsLocale.ruRU.PLAYER_DODGE_SPELL    = "Вы уклоняетесь от заклинания \".+\" .+%."		 -- GUESS
		lsLocale.ruRU.PLAYER_PARRY          = "Вы парируете атаку .+%."
		lsLocale.ruRU.PLAYER_PARRY_SPELL    = "Вы парируете способность \".+\" .+%."         	 -- GUESS
		lsLocale.ruRU.PLAYER_BLOCK          = "Вы блокируете атаку .+%."
		lsLocale.ruRU.PLAYER_BLOCK_SPELL    = "Вы блокируете заклинание \".+\" .+%."        	 -- GUESS
		lsLocale.ruRU.PLAYER_RESIST_SPELL   = "Вы сопротивляетесь заклинанию \".+\" .+%."
		lsLocale.ruRU.TARGET_DODGE          = ".+ уклоняется от вашей атаки%."
		lsLocale.ruRU.TARGET_DODGE_SPELL    = ".+ уклоняется от вашего заклинания \".+\"%."      -- GUESS
		lsLocale.ruRU.TARGET_PARRY          = ".+ парирует вашу атаку%."
		lsLocale.ruRU.TARGET_PARRY_SPELL    = ".+ парирует вашу способность \".+\"%."    		 -- GUESS
		lsLocale.ruRU.TARGET_BLOCK          = ".+ блокирует вашу атаку%."
		lsLocale.ruRU.TARGET_BLOCK_SPELL    = ".+ блокирует ваше заклинание \".+\"%."     		 -- GUESS
		lsLocale.ruRU.TARGET_RESIST_SPELL   = ".+ сопротивляется вашему заклинанию \".+\"%."
		
		-- Warsong gulch announcements
		lsLocale.ruRU.BG_WSG_ZONE = "Ущелье Песни Войны"
		lsLocale.ruRU.BG_WSG_FLAG_PICKED_UP = "(.+) подобрал:подобрала; флаг %s!"
		lsLocale.ruRU.BG_WSG_FLAG_CAPTURED = "(.+) захватил:захватила; флаг %s!"
		lsLocale.ruRU.BG_WSG_FLAG_DROPPED = "(.+) потерял:потеряла; флаг %s!"
		lsLocale.ruRU.BG_WSG_FLAG_RETURNED = "(.+) вернул:вернула; флаг %s на свою базу!" 
		
		lsLocale.ruRU.DUEL_COUNTDOWN        = "До начала поединка: (%d+)"
		lsLocale.ruRU.DUEL_WINNER_KNOCKOUT  = "(.+) побеждает в поединке с (.+)."
		lsLocale.ruRU.DUEL_WINNER_RETREAT   = "(.+) уходит от поединка с (.+)."
		
		lsLocale.ruRU.REMAINING = "Осталось: (%d+) мин."
		
		lsLocale.ruRU.GANKED = "Гибель от: %s Счет: %d"
		
		lsLocale.ruRU.GANKED_CHATS = {
			"(.+) .+ наносит вам (%d+) ед. урона: критический эффект.",  	-- SPELLLOGCRITOTHERSELF = "%s's %s crits you for %d."
			"(.+) .+ наносит вам (%d+) ед. урона.",							-- SPELLLOGOTHERSELF = "%s's %s hits you for %d."
			"(.+) наносит вам (%d+) ед. урона: критический удар.",			-- COMBATHITCRITOTHERSELF = "%s crits you for %d.";
			"(.+) наносит вам (%d+) ед. урона.", 							-- COMBATHITOTHERSELF = "%s hits you for %d.";
		}
		
		-- NPC is fleeing
		lsLocale.ruRU.NPC_FLEE_MSG = "%%s в панике пытается бежать!" 
		
		-- When something is immune to your spell, such as poison etc.
		lsLocale.ruRU.IMMUNE = "(.+) обладает невосприимчивостью к вашему заклинанию (.+)."
		
		-- These are creatures that cast divine protection on themselves
		-- "Phasing" creature? Any ideas what this is from?
		lsLocale.ruRU.IMMUNITYPROBLEMCREATURES = {			-- нужен тест!!!
			"Алого ордена",
			"Багрового Легиона",
			"Изменчивость",
			"Доан",
			"Гурубаши",
			"Ручьедол",
			"Аругал",
		}
		
		-- Localized instance names
		lsLocale.ruRU.INSTANCES = {
			"Огненная Пропасть",
			"Мертвые копи",
			"Пещеры Стенаний",
			"Крепость Темного Клыка",
			"Тюрьма",
			"Непроглядная Пучина",
			"Гномреган",
			"Лабиринты Иглошкурых",
			"Монастырь Алого ордена",
			"Курганы Иглошкурых",
			"Ульдаман",
			"Мародон",
			"Зул'Фаррак",
			"Храм Атал'Хаккара",
			"Глубины Черной горы",
			"Пик Черной горы",
			"Стратхольм",
			"Забытый Город",
			"Некроситет",
			"Логово Ониксии",
			"Руины Ан'Киража",
			"Зул'Гуруб",
			"Огненные Недра",
			"Логово Крыла Тьмы",
			"Храм Ан'Кираж",
			"Наксрамас",
		}
		
		-- Needed for many of the -ifTargetIs=Slowed etc.
		lsLocale.ruRU.SLOWED_TTS = {
		    "Скорость передвижения снижена", 		 -- "Movement speed reduced", "Movement speed slowed" и "Movement slowed" в ruRU имеют один перевод
		}
		
		lsLocale.ruRU.STUNNED_TTS = {
			"Оглушение",							 -- Cheapshot or kidneyshot
		}
		-- Damage over time text like shadow word pain
		lsLocale.ruRU.DOT_TTS = {
			"(.+) ед. урона в течение (%d+) сек.",
			"(.+) урона (.+) раз в (%d+) сек.",
			"(.+) урона (.+) раз в секунду в течение (%d+)", 		-- spell=29407
		}
		
		lsLocale.ruRU.FEAR_TTS = {
			"Вы напуганы", 
			"Панический страх",		-- Intimidation          нужен тест!!!
			"Паническое бегство",  	-- Psychic Scream        нужен тест!!!
			"Страх", 				-- Fear
			
		}
		lsLocale.ruRU.IMMOBILE_TTS = {
			"Обездвиживание",
			"Не в силах пошевелиться",
			"Неподвижность",       -- Where is this from?
			"Оплетение",
		}
		
		lsLocale.ruRU.ASLEEP_TTS = {
			"Сон",					-- Wyvern Sting
		}
		
		lsLocale.ruRU.DISORIENTED_TTS = {
			"Дезориентация",		-- Scatter Shot
		}
		
		lsLocale.ruRU.INCAPACITATED_TTS = {
			"Паралич",				-- Gouge
		}
		
		lsLocale.ruRU.BUFF_TTS = {
			berserking           = "Берсерк",
			bloodFury            = "Кровавое неистовство",
			cannibalize          = "Каннибализм",
			brainFood            = "Пища для ума",
			dazed                = "Головокружение",
			drink                = "Питье",
			firstAid             = "Первая помощь",
			fishFood             = "Пища",
			food                 = "Пища",
			recentlyBandaged     = "Раны перевязаны",
			shadowmeld           = "Слиться с тенью",
			silverwingFlag       = "Флаг Серебряных Крыльев",
			warsongFlag          = "Флаг Песни Войны",
			wellFed              = "Сытость",
			
			--Rogue Buffs
			adrenaline           = "Выброс адреналина",
			bladeFlurry          = "Шквал клинков",
			blind                = "Ослепление",
			cs                   = "Подлый трюк",
			coldBlood            = "Хладнокровие",
			evasion              = "Ускользание",
			expose               = "Ослабление доспеха",
			garrote              = "Гаррота",
			ghostly              = "Призрачный удар",
			gouge                = "Парализующий удар",
			hemo                 = "Кровоизлияние",
			ks                   = "Удар по почкам",
			remorseless          = "Беспощадность",
			rupture              = "Рваная рана",
			sap                  = "Ошеломление",
			snd                  = "Мясорубка",
			stealth              = "Незаметность",
			vanish               = "Исчезновение",
			
			--Priest Buffs
			abolishDisease       = "Устранение болезни",
			devouringPlague      = "Всепожирающая чума",
			divineSpirit         = "Божественный дух",
			elunesGrace          = "Благодать Элуны",
			fade                 = "Уход в тень",
			fearWard             = "Защита от страха",
			feedback             = "Ответная реакция",
			hexWeakness          = "Обессиливающий сглаз",
			holyFire             = "Священный огонь",
			innerFire            = "Внутренний огонь",
			innerFocus           = "Внутреннее сосредоточение",
			levitate             = "Озарение",
			lightwell            = "Колодец Света",
			lightwellRenew       = "Обновление колодца Света",
			mindControl          = "Контроль над разумом",
			mindFlay             = "Пытка разума",
			mindSoothe           = "Усмирение",
			mindVision           = "Внутреннее зрение",
			powerInfusion        = "Придание сил",
			pwf                  = "Слово силы: Стойкость",
			pws                  = "Слово силы: Щит",
			prf                  = "Молитва стойкости",
			prsp                 = "Молитва защиты от темной магии",
			prs                  = "Молитва духа",
			psychicScream        = "Ментальный крик",
			renew                = "Обновление",
			shackleUndead        = "Сковывание нежити",
			shadowProtection     = "Защита от темной магии",
			swp                  = "Слово Тьмы: Боль",
			shadowform           = "Облик Тьмы",
			shadowguard          = "Страж Тьмы",
			shadowVulnerability  = "Уязвимость к Тьме",
			spiritTap            = "Захват духа",
			starshards           = "Звездные осколки",
			touchWeakness        = "Прикосновение слабости",
			vampiricEmbrace      = "Объятия вампира",
			weakenedSoul         = "Ослабленная душа",
			
			-- Warrior Buffs
			battleShout          = "Боевой крик",
			berserkerRage        = "Ярость берсерка",
			bloodrage            = "Кровавая ярость",
			challengingShout     = "Вызывающий крик",
			concussionBlow       = "Оглушающий удар",
			deathWish            = "Жажда смерти",
			demoShout            = "Деморализующий крик",
			disarm               = "Разоружение",
			hamstring            = "Подрезать сухожилия",
			intimidatingShout    = "Устрашающий крик",
			lastStand            = "Ни шагу назад",
			mockingBlow          = "Дразнящий удар",
			mortalStrike         = "Смертельный удар",
			piercingHowl         = "Пронзительный вой",
			recklessness         = "Безрассудство",
			rend                 = "Кровопускание",
			retaliation          = "Возмездие",
			shieldBlock          = "Блок щитом",
			shieldWall           = "Глухая оборона",
			sunder               = "Раскол брони",
			sweepingStrikes      = "Размашистые удары",
			thunderClap          = "Удар грома",
			whirlwind            = "Вихрь",
			
			-- Druid Buffs
			bear                 = "Облик лютого медведя",
			aquatic              = "Водный облик",
			cat                  = "Облик кошки",
			travel               = "Походный облик",
			direBear             = "Облик лютого медведя",
			moonkin              = "Облик лунного совуха",
			
			prowl                = "Крадущийся зверь",
			rake                 = "Глубокая рана",
			rip                  = "Разорвать",
			dash                 = "Порыв",
			pounce               = "Кровоточащая рана",
			tigersFury           = "Тигриное неистовство",
			
			bash                 = "Оглушить",
			charge               = "Звериная атака - эффект",
			demoralize           = "Устрашающий рев",
			enrage               = "Исступление",
			frenziedRegen        = "Неистовое восстановление",
			
			abolishPoison        = "Устранение яда",
			barkskin             = "Дубовая кожа",
			faerieFire           = "Волшебный огонь",
			gotw                 = "Дар дикой природы",
			grasp                = "Хватка природы",
			hibernate            = "Спячка",
			innervate            = "Озарение",
			moonfire             = "Лунный огонь",
			motw                 = "Знак дикой природы",
			ns                   = "Природная стремительность",
			ooc                  = "Знамение ясности",
			regrowth             = "Восстановление",
			rejuv                = "Омоложение",
			roots                = "Гнев деревьев",
			soothe               = "Умиротворение животного",
			swarm                = "Рой насекомых",
			thorns               = "Шипы",
			tranquility          = "Спокойствие",
			
			-- Hunter Buffs
			aspectBeast          = "Дух зверя",
			aspectCheetah        = "Дух гепарда",
			aspectHawk           = "Дух ястреба",
			aspectPack           = "Дух стаи",
			aspectMonkey         = "Дух обезьяны",
			aspectWild           = "Дух дикой природы",
			bestialWrath         = "Звериный гнев",
			concussive           = "Контузящий выстрел",
			eagleEye             = "Орлиный глаз",
			eotb                 = "Звериный глаз",
			explosiveTrap        = "Эффект взрывной ловушки",
			feedPet              = "Кормление питомца",
			feign                = "Притвориться мертвым",
			frostTrap            = "Аура ледяной ловушки",
			freezingTrap         = "Замораживающая ловушка",
			furiousHowl          = "Неистовый вой",
			huntersMark          = "Метка охотника",
			immolationTrap       = "Эффект обжигающей ловушки",
			intimidate           = "Устрашение",
			quickShots           = "Скорострельность",
			rapidFire            = "Быстрая стрельба",
			scare                = "Отпугивание зверя",
			scatter              = "Дезориентирующий выстрел",
			scorpid              = "Укус скорпида",
			serpent              = "Укус змеи",
			trueshot             = "Аура меткого выстрела",
			viper                = "Укус гадюки",
			wingClip             = "Подрезать крылья",
			wyvern               = "Укус виверны",
			wyvernCC             = "Укус виверны",
			wyvernDot            = "Укус виверны",
			
			-- Mage Buffs
			amplifyMagic         = "Усиление магии",
			brilliance           = "Чародейская гениальность",
			combustion           = "Возгорание",
			dampenMagic          = "Ослабление магии",
			evocation            = "Прилив сил",
			fireVulnerability    = "Уязвимость к огню",
			fireWard             = "Защита от огня",
			frostWard            = "Защита от магии льда",
			frostArmor           = "Морозный доспех",
			frostbolt            = "Ледяная стрела",
			iceArmor             = "Ледяной доспех",
			iceBarrier           = "Ледяная преграда",
			iceBlock             = "Ледяная глыба",
			ignite               = "Воспламенение",
			intellect            = "Чародейский интеллект",
			mageArmor            = "Магический доспех",
			manaShield           = "Щит маны",
			polymorph            = "Превращение",
			polymorphPig         = "Превращение: свинья",
			polymorphTurtle      = "Превращение: черепаха",
			
			-- Paladin Buffs
			concAura             = "Аура сосредоточенности",
			devAura              = "Аура благочестия",
			fireAura             = "Аура сопротивления огню",
			retAura              = "Аура воздаяния",
			sanctAura            = "Аура святости",
			shadowAura           = "Аура сопротивления темной магии",
			blessFree            = "Благословение свободы",
			blessKings           = "Благословение королей",
			blessLight           = "Благословение Света",
			blessMight           = "Благословение могущества",
			blessProt            = "Благословение защиты",
			blessSac             = "Благословение жертвенности",
			blessSlv             = "Благословение спасения",
			blessSnct            = "Благословение неприкосновенности",
			blessWisdom          = "Благословение мудрости",
			divFavor             = "Божественное одобрение",
			divProt              = "Божественная защита",
			divShield            = "Божественный щит",
			forbearance          = "Воздержанность",
			gBlessKings          = "Великое благословение королей",
			gBlessLight          = "Великое благословение Света",
			gBlessMight          = "Великое благословение могущества",
			gBlessSlv            = "Великое благословение спасения",
			gBlessSnct           = "Великое благословение неприкосновенности",
			gBlessWisdom         = "Великое благословение мудрости",
			holyShield           = "Щит небес",
			redoubt              = "Оплот",
			repentance           = "Покаяние",
			rightFury            = "Праведное неистовство",
			sealCommand          = "Печать повиновения",
			sealCrusader         = "Печать воина Света",
			sealJustice          = "Печать справедливости",
			sealLight            = "Печать Света",
			sealRight            = "Печать праведности",
			sealWisdom           = "Печать мудрости",
			
			judgeCrusader        = "Правосудие воина света",
			judgeJustice         = "Правосудие справедливости",
			judgeLight           = "Правосудие света",
			judgeWisdom          = "Правосудие мудрости",
			
			-- Shaman buffs
			lightShield          = "Щит молний",
			ghostwolf            = "Призрачный волк",
			fireResistTotem      = "Сопротивление огню",
			flameTotem           = "Тотем языка пламени",
			flameShock           = "Огненный шок",
			frostResistTotem     = "Сопротивление магии льда",
			graceTotem           = "Тотем легкости воздуха",
			hsTotem              = "Тотем исцеляющего потока",
			msTotem              = "Тотем источника маны",
			mtTotem              = "Тотем прилива маны",
			natureResistTotem    = "Тотем защиты от сил природы",
			skinTotem            = "Тотем каменной кожи",
			strengthTotem        = "Тотем силы земли",
			tranquilTotem        = "Тотем безветрия",
			wfTotem              = "Тотем неистовства ветра",
			windwallTotem        = "Тотем стены ветра",
			
			-- Warlock buffs
			amplifyCurse         = "Усиление проклятия",
			corruption           = "Порча",
			curseAgony           = "Проклятие агонии",
			curseElements        = "Проклятие стихий",
			curseExhaustion      = "Проклятие изнеможения",
			curseReckless        = "Проклятие безрассудства",
			curseShadow          = "Проклятие Тьмы",
			curseTongues         = "Проклятие косноязычия",
			curseWeakness        = "Проклятие слабости",
			banish               = "Изгнание",
			deathCoil            = "Лик смерти",
			demonArmor           = "Демонический доспех",
			demonSkin            = "Шкура демона",
			detectGreaterInvis   = "Обнаружение большой невидимости",
			detectInvis          = "Обнаружение невидимости",
			detectLesserInvis    = "Обнаружение простой невидимости",
			drainLife            = "Похищение жизни",
			drainMana            = "Похищение маны",
			drainSoul            = "Похищение души",
			fear                 = "Страх",
			funnel               = "Канал здоровья",
			hellfire             = "Адское Пламя",
			howl                 = "Вой ужаса",
			immolate             = "Жертвенный огонь",
			sacrifice            = "Жертвоприношение",
			seduction            = "Соблазн",
			senseDemons          = "Чутье на демонов",
			shadowburn           = "Ожог Тьмы",
			shadowTrance         = "Теневой транс",
			shadowWard           = "Защита от темной магии",
			siphon               = "Вытягивание жизни",
			soulLink             = "Связка души",
			
			-- Pet related
			petProwl             = "Крадущийся зверь",
			
			-- Other
			
			clearcasting         = "Ясность мысли",
			
		}
		
		lsLocale.ruRU.BUFF_BODY_TTS = {
			wyvernCC             = "Сон",
			wyvernDot            = "(.+) урона от сил природы раз в (%d+) сек."
		}
		
		
		-- Action names
		-- Since this table is appended to by the class specific addons, we have to
		-- write out each line
		lsLocale.ruRU.ACTION_TTS = {}
		lsLocale.ruRU.ACTION_TTS.berserking       = "Берсерк"
		lsLocale.ruRU.ACTION_TTS.bloodFury        = "Кровавое неистовство"
		lsLocale.ruRU.ACTION_TTS.cannibalize      = "Каннибализм"
		lsLocale.ruRU.ACTION_TTS.escapeArtist     = "Мастер побега"
		lsLocale.ruRU.ACTION_TTS.findTreasure     = "Поиск сокровищ"
		lsLocale.ruRU.ACTION_TTS.perception       = "Внимательность"
		lsLocale.ruRU.ACTION_TTS.stoneForm        = "Каменная форма"
		lsLocale.ruRU.ACTION_TTS.shadowmeld       = "Слиться с тенью"
		lsLocale.ruRU.ACTION_TTS.warStomp         = "Громовая поступь"
		lsLocale.ruRU.ACTION_TTS.forsaken         = "Воля Отрекшихся"
		lsLocale.ruRU.ACTION_TTS.bow              = "Выстрел из лука"
		lsLocale.ruRU.ACTION_TTS.crossbow         = "Выстрел с арбалета"
		lsLocale.ruRU.ACTION_TTS.gun              = "Выстрел с огнестрельного оружия"
		lsLocale.ruRU.ACTION_TTS.throw            = "Бросок"
		lsLocale.ruRU.ACTION_TTS.petFollow        = "Петомец - Следовать"
		lsLocale.ruRU.ACTION_TTS.petStay          = "Петомец - Стоять"
		lsLocale.ruRU.ACTION_TTS.petAggressive    = "Петомец - Агрессия"
		lsLocale.ruRU.ACTION_TTS.petDefensive     = "Петомец - Защита"
		lsLocale.ruRU.ACTION_TTS.petPassive       = "Петомец - Бездействие"
		lsLocale.ruRU.ACTION_TTS.findHerbs        = "Поиск трав"
		lsLocale.ruRU.ACTION_TTS.findMinerals     = "Поиск минералов"
		
		-- About.lua
		ABOUT_ALL_ROPE = "All the rope you need..." --!
		ABOUT_BROUGHT = "Brought to you by:"
		ABOUT_SIGNIFICANT_CONTRIBUTIONS = "С значительным вкладом:"
		ABOUT_TO_USE = "Для использования LazyScript, поместите макрос со следующим текстом на панель действий и несколько раз нажмите на него в бою:"
		ABOUT_SEE_WEBSITES = "Пожалуйста, посмотрите следующие сайты с документацией, обсуждениями и новыми версиями:"
		ABOUT_LAZYCONTRIBUTORS = "Lazy Авторы"
		ABOUT_ALL_TESTING = "All the testing we need..." --!
		ABOUT_MANY_THANKS = "Большое спасибо:"
		
		-- About.xml
		About = "Об"
		Contributors = "Авторы"
		
		-- Actions.lua
		ACTION = "Действие "
		NOT_SUPPORTED_PLS_USE = " не поддерживается для вашей локализации. Пожалуйста, используйте 'action=<full action name>'."
		ERROR_TYPE_TEXTURE = "Святой неизвестный тип текстуры, Бэтман!"
		FOUND = "найдено "
		AT_SLOT = " в ячейке "
		COULDNT_FIND = "Не удалось найти \""
		ADD_IT_PLAYER = "\" на панели действий, ПОЖАЛУЙСТА, ДОБАВЬТЕ ЭТО."
		SPELLSEARCH_FOUND_NIL_TEXTURE = "SpellSearch найдена пустая текстура по индексу "
		SPELLSEARCH_FOUND = "SpellSearch найдено "
		AT_INDEX = " на номере "
		SPELLSEARCH_QUANTITY = "SpellSearch нашел более 1000 заклинаний."
		RANK_COUNT = ". Rank Count = " --!
		RANK_COUNT_2 = "rankCount = " --!
		TEXTURE = ", текстура = "
		SPELLSEARCH_STOP = "SpellSearch остановил поиск "
		SPELLSEARCH_FOUND_NIL_NAME = "SpellSearch найдено пустое имя по индексу "
		ACTION_1 = "Действие: "
		IN_SPELL_BOOK = "\" в вашей книге заклинаний."
		ATTEMPTING_TO_CAST = "Попытка произнесения "
		ITEM_EQUIPPED = "Предмет уже экипирован."
		ITEM_NOT_FOUND = "Предмет не найден: "
		USING_ITEM = "Использование предмета: "
		AT_EQUIPPED_SLOT = ") в экипированой ячейке: "
		AT_BAG_SLOT = ") в сумке/ячейке: "
		WEAPON_BUFF_BAG_SLOT_NOT_FOUND = "Бафф оружия в сумке/ячейке не найден. WTF?"
		APPLYWEAPONBUFF = "ApplyWeaponBuff: Предмет "
		IN = " в "
		ITEM_TYPE_IS_NOT_WEAPON = " тип предмета не оружие: "
		ISITEMSTILLHERE_NOT_FOUND = "IsItemStillHere: Найден предмет "
		AT_BAG_SLOT_1 = " в Сумке/Ячейке: "
		SEARCHBAGS_FOUND = "SearchBags: Найден предмет "
		ASSISTING = "Помощь "
		ASSIST_TARGET_NOT_SET = "Помощь цели не установлена. Пожалуйста, установите с /lazyscript assist <assist name>"
		CANNOT_FIND = "Не могу найти "
		IN_GROUP_OR_RAID_TO_ASSIST = " в группе или рейде, чтобы помочь. Необходимо обновить с /lazyscript assist <assist name>" 
		CANNOT_ASSIST_DEAD = " кажется мертвым, не могу помочь."
		CANNOT_ASSIST_RANGE = " кажется находится вне диапазона, не могу помочь."
		TARGET_IS_DEAD_SKIP = " цель мертва, переходите к следующему действию"
		STOPPING_AUTO_ATTACK = "Остановка Автоматической атаки..."
		STOPPING_AUTO_SHOOT = "Остановка Выстрела..."
		STOPPING_AUTO_SHOT = "Остановка Автоматического выстрела..."
		NO_SHAPESHIFT_FORMS_AVAILABLE = "Формы shapeshift не доступны."
		SHAPESHIFT_FORM = "Shapeshift форма: "
		NOT_FOUND = " не найдена."
		FOUND_PET_ACTION = "Найдено действие питомца "
		ADD_IT_PET = "\" на панели действий питомца, ПОЖАЛУЙСТА, ДОБАВЬТЕ ЭТО."
		PET_ACTION = "Действие питомца: "
		NOT_HAVE_PET_BAR = "Вы не имеете панель действий питомца."
		NOT_HAVE_PET = "Вы не имеете питомца."
		COULD_NOT_CALL_FORM = "Не могу вызвать форму "
		TRY_ACTION = "Попытка: Действие #"
		
		-- AutoAttack.lua
		COULDNT_FIND_ATTACK = "Не удалось найти \"Атака\" на панели действий, ПОЖАЛУЙСТА, ДОБАВЬТЕ ЭТО." 
		INITIATING_AUTO_ATTACK = "Начало автоматической атаки..."
		FOUND_AUTO_SHOT = "Найдено действие Автоматическая стрельба в ячейке " 
		COULDNT_FIND_AUTO_SHOT = "Не удалось найти \"Автоматическая стрельба\" на панели действий, ПОЖАЛУЙСТА, ДОБАВЬТЕ ЭТО."
		FOUND_SHOOT_WAND = "Найдено действие Выстрел жезлом в ячейке "
		COULDNT_FIND_SHOOT_WAND = "Не удалось найти \"Выстрел\" на панели действий, ПОЖАЛУЙСТА, ДОБАВЬТЕ ЭТО."
		
		-- Deathstimator.lua
		YOURE_NOT_IN_COMBAT = "Вы не в бою, так что я скрываю Оценщика смерти"
		YOURE_IN_COMBAT = "Вы находитесь в бою, так что я показываю Оценщика смерти" 
		GATHERING = "...сбор..."
		RECALIBRATING = "...переоценка..."
		DEATH_IN = "Смерть через "
		S = " сек."
		DEATHSTIMATOR = "Оценщик смерти"
		DEATHSTIMATOR_TOOLTIP = "Shift + ЛКМ, чтобы переместить меня."
		
		-- FormEdit.lua
		FORM = "Форма "
		TESTING = "Тестирование "
		FORM_1 = " формы..."
		TESTING_COMPLETED = "Тестирование завершено."
		
		TAB_OVERVIEW_1 = "<H1>Обзор</H1>"
		TAB_OVERVIEW_2 = "<P>LazyScript это язык сценариев для World Of Warcraft, который способен выполнить определенные атаки или способности в условиях, которые вы укажете. Это достигается путем написания \"формы\", которая состоит из ряда действий и критериев. Когда макрос LazyScript запускается, двигатель LazyScript прочитает список действий сверху вниз, пока не найдет действие, которое готово к использованию, а затем выполняет его.</P>"
		TAB_OVERVIEW_3 = "<P>Любая строка может быть закомментирована путем размещения '-', '//', или '#' в начале строки.</P>" 
		TAB_OVERVIEW_TUTORIAL_1_1 = "<H1>Урок 1: Детские шаги</H1>"
		TAB_OVERVIEW_TUTORIAL_1_2 = "<P>Например, давайте сделаем использование Коварного удара. Во-первых, проверьте короткое имя для коварного удара на вкладке действия. Мы видим, что это \"ss\". Теперь выберите \"Создать новую форму\" из меню миникарты LazyScript. Дайте вашей форме имя \"MyForm\" и введите:</P>" 
		TAB_OVERVIEW_TUTORIAL_1_3 = "<P>Нажмите на кнопку \"Тест\". Если все в порядке, и не было никаких опечаток, появится сообщение \"Тестирование завершено\" в вашем окне чата. Если были ошибки, они будут напечатаны. Если все работает, то нажмите на кнопку \"Готово\". Теперь вы должны увидеть форму \"MyForm\" в списке форм меню миникарты LazyScript. Нажмите на \"MyForm\", чтобы установить ее по умолчанию. Должна появиться маленькая галочка рядом с \"MyForm\" в меню миникарты.</P>"
		TAB_OVERVIEW_TUTORIAL_1_4 = "<P>Теперь создайте макрос с командой:</P>"
		TAB_OVERVIEW_TUTORIAL_1_5 = "<P>и поместите его на панели действий. Также разместите самый высокий уровень \"Коварный удар\" где-нибудь на панели действий. Его можно спрятать, но присутствовать на панели действий должен обязательно. Теперь идите и ударьте что-то, нажмите на ваш макрос LazyScript и аддон будет автоматически выполнять Коварный удар.</P>"
		TAB_OVERVIEW_TUTORIAL_2_1 = "<H1>Урок 2: Что-то начинает получаться</H1>"
		TAB_OVERVIEW_TUTORIAL_2_2 = "<P>|cffffaaff\"Это не особенно впечатляет\"|r</P>"
		TAB_OVERVIEW_TUTORIAL_2_3 = "<P>Что ж, давайте перейдем на что-то более интересное. Давайте подключим действие, которое мы не можем выполнить все время, наподобие \"Ответный удар\". Мы всегда предпочитаем выполнять Ответный удар перед Коварный удар, но Ответный удар не всегда возможно использоать. Измените \"MyForm\" и добавьте Ответный удар перед Коварным ударом, вот так:</P>"
		TAB_OVERVIEW_TUTORIAL_2_4 = "<P>и поместите Ответный удар где-нибудь на вашей панели действий. Теперь, когда вы нажмете на макрос LazyScript во время боя, аддон будет выполнять Коварный удар, пока вы не парируете атаку. Как только это произойдет, LazyScript выполнит Ответный удар, когда вы в следующий раз нажмете кнопку макроса LazyScript. Самое главное, что он будет делать все это без спама \"Это действие еще не готово\" с чем, как правило, приходится мириться при использовании стандартного макроса.</P>"
		TAB_OVERVIEW_TUTORIAL_3_1 = "<H1>Урок 3: Делать или не делать, вот в чем вопрос</H1>"
		TAB_OVERVIEW_TUTORIAL_3_2 = "<P>Одной из наиболее полезных функций LazyScript является способность связывать условия или критерии с определенным действием. Например, вы хотите использовать Пинок в цель, если она произносит заклинание. Смотря во вкладку критерии мы замечаем, что существует условие \"-if[Not]TargetIsCasting\" плюс некоторые другие страшно выглядящие вещи. Давайте игнорировать сейчас сложные вещи и просто использовать \"-ifTargetIsCasting\". Прерывание заклинания является более важным, чем использование Ответного удара, так что редактируем \"MyForm\" и изменяем ее на:</P>"
		TAB_OVERVIEW_TUTORIAL_3_3 = "<P>Теперь LazyScript будет использовать Пинок, когда он обнаружит, что цель произносит заклинание.</P>" 
		TAB_OVERVIEW_TUTORIAL_3_4 = "<P>|cffffaaff\"Но что, если я хочу, чтобы прерывались только заклинания огня?\"|r</P>"
		TAB_OVERVIEW_TUTORIAL_3_5 = "<P>Изменяем \"MyForm\", добавляя:</P>"
		TAB_OVERVIEW_TUTORIAL_3_6 = "<P>|cffffaaff\"Что, если я хочу, чтобы прервались заклинания огня или льда? Должен ли я набирать все снова?\"|r</P>" 
		TAB_OVERVIEW_TUTORIAL_3_7 = "<P>Нет, изменяем \"MyForm\" на:</P>"
		TAB_OVERVIEW_TUTORIAL_3_8 = "<P>|cffffaaff\"Меня интересует только прерывание конкретных заклинаний исцеления. Как я могу осуществить это?\"|r</P>"
		TAB_OVERVIEW_TUTORIAL_3_9 = "<P>Мы можем сделать это тоже. Просто перенесите все в строку, правильно записав с пробелами:</P>"
		TAB_OVERVIEW_TUTORIAL_4_1 = "<H1>Урок 4: Почему вы должны идти и делать вещи сложнее?</H1>"
		TAB_OVERVIEW_TUTORIAL_4_2 = "<P>Вероятно, наиболее сложные критерии, с которыми вы столкнетесь, являются критерии проверки  баффов/дебаффов. Они настолько сложны, потому что являются очень гибкими. Например, если вы хотите, возобновлять вашу  Мясорубку, если она перестала дейстоать. Сначала проверьте вкладку Баффы/ Дебаффы и выясните короткое имя для Мясорубки. Это \"snd\", так что добавьте строку в форму:</P>"
		TAB_OVERVIEW_TUTORIAL_4_3 = "<P>Если вы хотите использовать Рваную рану на вашей цели, если он уже не имеет активную Рваную рану:</P>"
		TAB_OVERVIEW_TUTORIAL_4_4 = "<P>|cffffaaff\"Почему я не вижу баффов/дебаффов xyz в вашем списке?\"|r</P>"
		TAB_OVERVIEW_TUTORIAL_4_5 = "<P>Хотя мы стараемся быть максимально тщательны, насколько это возможно с классовыми способностями, мы не можем иметь записи для каждого баффа/дебаффа в игре. Список будет занимать слишком много памяти. Если бафф не находится в списке баффов/дебаффов, его можно искать по названию. Просто используйте следующие критерии и введите полное название баффа или дебаффа с заглавной буквы и пробелами, как он написан в тексте всплывающей подсказки:</P>"
		TAB_OVERVIEW_TUTORIAL_4_6 = "<P>|cffffaaff\"Мои танки надоедают и они говорят мне не начинать атаковать, пока они не расколят броню противнику несколько раз. Может LazyScript мне помочь?\"|r</P>"
		TAB_OVERVIEW_TUTORIAL_4_7 = "<P>LazyScript также в состоянии проверить, количество применений, баффов или дебаффов. Вы можете добавить что-то вроде этого сверху формы:</P>"
		TAB_OVERVIEW_TUTORIAL_5_1 = "<H1>Урок 5: Многозадачность</H1>"
		TAB_OVERVIEW_TUTORIAL_5_2 = "<P>К настоящему моменту вы, возможно, заметили, что некоторые действия на вкладке Действия окрашены в зеленый цвет. Надеюсь, вы читали текст справки и знаете, что это что-то с несколькими действиями, которые не вызывают общее время восстановления. Это сводится к тому, что вы можете любое количество 'зеленых' действий записать вместе в одной линии с не более чем одним действием,которое вызывает общее время восстановления и LazyScript будет выполнять их в определенной последовательности. Например, активировать Хладнокровие, использовать Потрошение и обеспечивать милое прощальное сообщение:</P>"
		TAB_OVERVIEW_TUTORIAL_5_3 = "<P>Вот еще несколько примеров:</P>"
		TAB_OVERVIEW_TUTORIAL_6_1 = "<H1>Урок 6: Форма повторного использования</H1>"
		TAB_OVERVIEW_TUTORIAL_6_2 = "<P>Итак, вы написали некоторые формы, и они начинают получаться немного долгими и сложными. Если они содержат разделы, которые идентичны, вы можете отделить ту часть в другую форму и использовать |cffff770CincludeForm|r, чтобы подключить его в других формах. Например:</P>"
		TAB_OVERVIEW_TUTORIAL_6_FORM_INT = "<P>Форма \"Interrupts\":</P>"
		TAB_OVERVIEW_TUTORIAL_6_FORM_FA = "<P>Форма \"FrontAttack\":</P>"
		TAB_OVERVIEW_TUTORIAL_6_FORM_BA = "<P>Форма \"BehindAttack\":</P>"
		TAB_OVERVIEW_TUTORIAL_6_3 = "<P>Это будет подключать форму Interrupts в начале обеих форм FrontAttack и BehindAttack как если бы вы скопировали и вставили туда ее содержимое. При изменении содержимого формы Interrupts, оно будет автоматически обновлено в формах FrontAttack и BehindAttack.</P>"
		TAB_OVERVIEW_TUTORIAL_6_4 = "<P>|cffffff00Заметка:|r Будьте осторожны, не пытайтесь включать форму саму в себя, или пытаться подключить такую форму, которая включает в себя первую форму (A подключает B подключает A). Это вызовет ошибку переполнения стека из-за бесконечного цикла рекурсии.</P>"
		TAB_OVERVIEW_TUTORIAL_6_5 = "<P>Теперь, возможно, у вас есть какие-то действия, которые вы хотите выполнить только при определенных условиях, но не хотите проверять весь список действий, который будут проверяться каждый раз при нажатии кнопки LazyScript. Если мы посмотрим на предыдущий пример, мы можем видеть, что ifTargetIsCasting является общим критерием для всех действий в форме Interrupts. Используя callForm мы могли бы переписать предыдущий пример следующим образом:</P>"
		TAB_OVERVIEW_TUTORIAL_6_6 = "<P>С этими изменениями, когда вы выполняете FrontAttack или BehindAttack, будет вызывана форма Interrupts только если цель произносит заклинание и не оглушена. Так что, если цель не произносит заклинание, не будут проверятся любые действия/критерии в форме Interrupts.</P>"
		
		TAB_LIST_ACTIONS = "<H1>Список известных Заклинаний/Действий</H1>"
		TAB_ACTIONS_SYNTAX_SPECIFIC_SPELL_RANK = "<BR/><P>Конкретный ранг заклинания может быть направлен на конкретную единицу, используя синтаксис:</P>" 
		TAB_ACTIONS_SYNTAX_SPECIFIC_SPELL_RANK_1 = "<BR/><P>|cff00ffff&lt;UnitId&gt;|r может быть любым допустимым UnitId, описываемым в &lt;|cff8080ffhttp://www.wowwiki.com/UnitId|r&gt;. Например, @player, @pet, @target, @targettarget. Обратите внимание, что ранг заклинания всегда должен быть записан перед символом '@'.</P>" 
		TAB_ACTIONS_GREEN_ACTIONS = "<BR/><P>Действия, выделенные |cff40ff40зеленым|r, не вызывают общее время восстановления. LazyScript способен выполнять несколько из этих действий на одной линии, при условии, что линия имеет не более одного действия, которое запускает общее время восстановления.</P><BR/>"
		TAB_ACTIONS_COMBO = "<H2>Комбинированные действия:</H2>"
		TAB_ACTIONS_OTHER = "<H2>Другие действия:</H2>"
		TAB_ACTIONS_SPECIAL = "<H2>Специальные действия:</H2>"
		TAB_ACTIONS_PARAMETERS = "<H2>Действия, которые берут параметры:</H2>"
		TAB_ACTIONS_PARAMETERS_1 = "<P>|cffffffffИспользование действий:|r<BR/> action=&lt;action/macro name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_2 = "<P>|cffffffffИспользование действий, не вызывающих общее время восстановления:|r<BR/> |cff40ff40freeAction|r=&lt;action/macro name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_3 = "<P>|cffffffffИспользование действий питомца:|r<BR/> |cff40ff40petAction|r=&lt;action&gt;</P>"
		TAB_ACTIONS_PARAMETERS_4 = "<P>|cffffffffИспользование предметов в вашей экипировки или инвентаре:|r<BR/> use=&lt;itemid/item name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_5 = "<P>|cffffffffИспользование экипированых предметов:|r<BR/> useEquipped=&lt;itemid/item name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_6 = "<P>|cffffffffИспользование предметов в вашей экипировки или инвентаре, не вызывающих общее время восстановления:|r<BR/> useFreeItem=&lt;itemid/item name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_7 = "<P>|cffffffffИспользование экипированых предметов не вызывающих общее время восстановления:|r<BR/> useFreeEquippedItem=&lt;itemid/item name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_8 = "<P>|cffffffffApply an item weapon buff:|r<BR/> apply{MainHand,OffHand}Buff=&lt;itemid/item name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_9 = "<P>|cffffffffЭкипировка оружия в правую руку:|r<BR/> equipMainHand=&lt;itemid/item name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_10 = "<P>|cffffffffЭкипировка оружия в левую руку:|r<BR/> equipOffHand=&lt;itemid/item name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_11 = "<P>|cffffffffПечать сообщения в ваш чат:|r<BR/> |cff40ff40echo|r=&lt;message&gt;</P>"
		TAB_ACTIONS_PARAMETERS_12 = "<P>|cffffffffОтправка сообщения в указанный канал:|r<BR/> |cff40ff40sayIn{|cff40ff40Emote, Guild, Minion, Party, Raid, RAID_WARNING, Say, Yell|r}|cff40ff40|r=&lt;message&gt;</P>"
		TAB_ACTIONS_PARAMETERS_13 = "<P>|cffffffffШепот указанному игроку или UnitId:|r<BR/> |cff40ff40whisperTo|r{|cff40ff40playerName, |cff00ffff&lt;UnitId&gt;|r}|cff40ff40|r=&lt;message&gt;</P>"
		TAB_ACTIONS_PARAMETERS_14 = "<P>|cffffffffОтмена указанного баффа:|r<BR/> |cff40ff40cancelBuff|r=&lt;buff&gt;</P>"
		TAB_ACTIONS_PARAMETERS_15 = "<P>|cffffffffОтмена указанного баффа по названию:|r<BR/> |cff40ff40cancelBuffTitle|r=&lt;buffTitle&gt;</P>"
		TAB_ACTIONS_PARAMETERS_16 = "<P>|cffffffffУстановка указанной формы по умолчанию:|r<BR/> |cff40ff40setForm|r=&lt;form name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_17 = "<P>|cffffffffВзятие в цель указанного UnitId:|r<BR/> |cff40ff40targetUnit|r=|cff00ffff&lt;UnitId&gt;|r</P>"
		TAB_ACTIONS_PARAMETERS_18 = "<P>|cffffffffЧтение заклинания в указанного UnitId:|r<BR/> |cff40ff40spellTargetUnit|r=|cff00ffff&lt;UnitId&gt;|r</P>"
		TAB_ACTIONS_PARAMETERS_19 = "<P>|cffffffffВзятие в цель игрока/существо по точному назанию :|r<BR/> |cff40ff40targetByName|r=&lt;exact name&gt;</P>"
		TAB_ACTIONS_PARAMETERS_20 = "<P>|cffffffffВыполнение эмоции (Смотрите |cff8080ffhttp://www.wowwiki.com/API_TYPE_Emotes_Token|r|cffffffff):|r<BR/> |cff40ff40doEmote|r=&lt;emoteToken&gt;</P>"
		TAB_ACTIONS_PARAMETERS_21 = "<P>|cffffffffВоспроизведение музыки (Смотрите |cff8080ffhttp://www.wowwiki.com/API_PlaySound|r|cffffffff):|r<BR/> |cff40ff40playSound|r=&lt;soundName&gt;</P>"
		TAB_ACTIONS_PARAMETERS_22 = "<H2>Мета-действия</H2>"
		TAB_ACTIONS_PARAMETERS_23 = "<P>|cffffffffПодключение содержимого указанной формы:|r<BR/> includeForm=&lt;form name&gt;<BR/>"
		TAB_ACTIONS_PARAMETERS_24 = "|cffffff00Заметка:|r Это не принимает критерии. Оно должно быть записано на отдельной строке. Вы не можете подключать форму саму в себя, также вы не должны подключать другую форму, которая подключает первую (например, форма А подключает форму B подключает форму А).</P>"
		TAB_ACTIONS_PARAMETERS_25 = "<P>|cffffffffВызов указанной формы:|r<BR/> callForm=&lt;form name&gt;<BR/>"
		TAB_ACTIONS_PARAMETERS_26 = "Это будет пытаться найти полезное действие в указанной форме, если критерий на действии callForm удовлетворительный.</P>"
		
		TAB_LIST_CRITERIA = "<H1>Список признанных критериев</H1>"
		TAB_CRITERIA_1 = "<BR/><P>Добаляет ноль или несколько критериев к действию. Все критерии должны быть истинными для этого действия, которые будут использоваться. Список ваших действий один за другим на отдельных строках. Используется первое действие, которое соответствует всем критериям.</P>"
		TAB_CRITERIA_2 = "<BR/><P>Несколько значений в фигурных скобках ({}) означает выбрать одно или несколько. Если выбрано более одного, разделите их запятыми (например, ifRace=Human, Gnome) и критерии будут соответствовать любому перечисленному значению. Если множественный выбор критериев отрицается с \"Not\" (например, ifNotRace=Human,Gnome), тогда критерии не будут соответствовать выбранным значениям. Квадратные скобки ([]) означают, что значения необязательны. Не оставляйте фигурные или квадратные скобки в вашей форме.</P>"
		TAB_CRITERIA_ACTION = "<H2>Критерии Действий:</H2>"
		TAB_CRITERIA_SEE_NOTE = "смотрите заметку"
		TAB_CRITERIA_ATTACK = "<H2>Критерии Атак:</H2>"
		TAB_CRITERIA_BUFF_DEBUFF = "<H2>Критерии Баффов/Дебаффов:</H2>"
		TAB_CRITERIA_PLAYER_ONLY = "только игрок"
		TAB_CRITERIA_SEE_NOTES = "смотрите заметки"
		TAB_CRITERIA_AND = "и"
		TAB_CRITERIA_ITEM = "<H2>Критерии Предметов:</H2>"
		TAB_CRITERIA_PLAYER = "<H2>Критерии Игрока:</H2>"
		TAB_CRITERIA_PARTY_OR_RAID = "группа или рейд"
		TAB_CRITERIA_PVP_ONLY = "только PvP"
		TAB_CRITERIA_PET = "<H2>Петомца:</H2>"
		TAB_CRITERIA_PARTY_PET_TARGET = "<H2>Критерии Игрока, Петомца или Цели:</H2>"
		TAB_CRITERIA_DEFAULT = "по умолчанию &lt;5сек., "
		TAB_CRITERIA_TARGET = "<H2>Критерии Цели:</H2>"
		TAB_CRITERIA_NPC_ONLY = "только NPC"
		TAB_CRITERIA_WITHIN = "в пределах"
		TAB_CRITERIA_YARDS = "ярдов"
		TAB_CRITERIA_NOT_WORK_BOSS = "не работает для боссов"
		TAB_CRITERIA_CUSTOM_HELP_1 = "<P>|cffffff00Заметка 1:|r Чтобы использовать -if{Ctrl,Alt,Shift}Down, вы ДОЛЖНЫ удалить любые существующие Ctrl/Alt/Shift назначенные клавиши в Главном меню, Назначение клавиш. В противном случае игра будет перехватывать клавишу и LazyScript не увидит это.</P>"
		TAB_CRITERIA_CUSTOM_HELP_2 = "<P>|cffffff00Заметка 2:|r Всегда используйте с -if[Not]TargetFriend, поскольку он возвращает true, если цель не является допустимым объектом для заклинания.</P>"
		TAB_CRITERIA_CUSTOM_HELP_3 = "<P>|cffffff00Заметка 3:|r В течение X.Y сек., по умолчанию 0.3.</P>"
		TAB_CRITERIA_CUSTOM_HELP_4 = "<P>|cffffff00Заметка 4:|r Имя баффа/дебаффа должно иметь полное имя (включая капитализацию и пробелы) заголовка баффов/дебаффов, как он появляется в подсказке.</P>"
		TAB_CRITERIA_CUSTOM_HELP_5 = "<P>|cffffff00Заметка 5:|r XX относится к числу баффов/дебаффов. Например -ifTargetHasDebuff&lt;5=sunder</P>"
		TAB_CRITERIA_CUSTOM_HELP_6 = "<P>|cffffff00Заметка 6:|r В патче 1.12 это работает только на недружественные цели для Разбойника (Коварный удар), Друида (Рык), Охотника (Подрезать крылья) и Воина (Кровопускание).</P>"
		TAB_CRITERIA_CUSTOM_HELP_7 = "<P>|cffffff00Заметка 7:|r Критерий ifUsable проверяет, если действие доступно для использования в настоящее время в соответствии с Blizzard API вызова IsUsableAction. Это не включает в себя время перезарядки или проверку диапазона.</P>"
		TAB_CRITERIA_CUSTOM_HELP_8 = "<P>|cffffff00Заметка 8:|r Критерий ifGlobalCooldown требует конкретное действие, которое будет размещено на панели действий таким образом, чтобы его можно было проверить на общее время восстановления. Оно не должно быть на видимой панели действий. Для каждого класса, действия следующие:</P>"
		TAB_CRITERIA_CUSTOM_HELP_8_CLASSES = "<P>Разбойник: |cffffffffКоварный удар|r<BR/>Друид: |cffffffffЗнак дикой природы|r<BR/>Охотник: |cffffffffВыслеживание животных|r<BR/>Жрец: |cffffffffСлово силы: Стойкость|r<BR/>Воин: |cffffffffБоевой крик|r<BR/>Маг: |cffffffffМорозный доспех|r<BR/>Чернокнижник: |cffffffffШкура демона|r<BR/>Шаман: |cffffffffОружие Камнедробителя|r<BR/>Паладин: |cffffffffПечать праведности|r</P>"
		TAB_CRITERIA_CUSTOM_HELP_9 = "<P>|cffffff00Заметка 9:|r |cff00ffff&lt;UnitId&gt;|r может быть любым допустимым UnitId, описываемым в &lt;|cff8080ffhttp://www.wowwiki.com/UnitId|r&gt;. Например, player, pet, target, targettarget. Капитализация не имеет значения.</P>"
		TAB_CRITERIA_CUSTOM_HELP_10 = "<P>|cffffff00Заметка 10:|r Таймер ifLastUsed выполнит действие, сразу в начале боя или если вы изменили цели, если действие доступно. Критерий ifTimer имеет первое время восстановления XX секунд после начала боя или изменения целей перед выполнением действия в первый раз.</P>"
		TAB_CRITERIA_CUSTOM_HELP_11 = "<P>|cffffff00Заметка 11:|r Этот критерий определяет только полные блоки и сопротивления. Частичные блоки или сопротивления (\"Джо наносит вам 10 ед. урона. (заблокировано: 5).\") на игроке или цели не будут обнаружены этим критерием.</P>"
		
		TAB_LIST_BUFFS_DEBUFFS = "<H1>Список известных Баффов/Дебаффов</H1>"
		TAB_BUFFS_DEBUFFS_USED = "<BR/><P>Используется с \"if[Not]{Player,Pet,Target}Has{Buff,Debuff}\" и \"if[Not]{Buff,Debuff}Duration{&lt;,&gt;}XXs\".</P><BR/>"
		TAB_FULL_SHORT_NAME = "<H2>Полное имя = Короткое имя</H2>"
		
		-- FormEdit.xml
		LazyScript_Form_Editor = "LazyScript Редактор форм"
		Editing_form = "Имя формы:"
		Help = "Помощь"
		Cancel = "Отмена"
		Okay = "Готово"
		Test = "Тест"
		LazyScript_Help = "LazyScript Помощь"
		Overview = "Обзор"
		Actions = "Действия"
		Criteria = "Критерии"
		Buffs_Debuffs = "Баффы/Дебаффы"
		
		-- Immunity.xml
		--Cancel = "Cancel"
		--Help = "Help"
		--Okay = "Okay"
		Immunities_Criteria_Editor = "Редактор критериев Невосприимчивости"
		Shows_all_learned_immunities = "Нижеперечисленное показывает, все изученные до сих пор невосприимчивости..."
		
		-- ImmunityTypeTracking.lua
		IMMUNITY_TRACKING_NOT_SUPPORTED = "Отслеживание невосприимчивости не поддерживается для вашей локализации."
		IMMUNITY_TRACKING_NOT_100 = "Отслеживание невосприимчивости не на 100% поддерживается для вашей локализации."
		IMMUNITY_DETECTED = "ОБНАРУЖЕНА НЕВОСПРИИМЧИВОСТЬ! Заклинание: "
		IMMUNITY_CREATURE = "      Существо: "
		IMMUNITY_TYPE_TRACKING_NOT_SUPPORTED = "Отслеживание невосприимчивости не поддерживает этот тип заклинания для вашей локализации."
		COULD_NOT_DETERMINE_SPELLTYPE = "Не удалось определить тип заклинания для: "
		NEW_SPELL_TYPE_DETECTED = "Обнаружен новый тип заклинание. Заклинание: "
		TYPE = " Тип: "
		GLOBAL_IMMUNITY_CRITERIA_UPDATED = "Глобальные критерии невосприимчивости обновлены."
		
		-- Interrupt.lua
		INTERRUPTS_NOT_SUPPORTED = "Прерывание заклинаний не поддерживается для вашей локализации."
		DETECTED_YOUR_TARGET = "Обнаружено, ваша цель произносит "
		SUGGEST_INTERRUPT = ", будет предложено прервать."
		IS_CASTING = " произносит "
		GLOBAL_INTERRUPT_CRITERIA_UPDATED = "Глобальные критерии прерывания обновлены."
		
		-- Interrupt.xml
		--Cancel = "Cancel"
		--Help = "Help"
		--Okay = "Okay"
		Interrupt_EXCEPTION_Criteria_Editor = "Редактор критериев ИСКЛЮЧЕНИЙ Прерывания"
		NOT_INTERRUPT_SPELLCAST = "Если что-либо из нижеперечисленного - true, LazyScript НЕ будет прерывать чтение заклинаний."
		
		-- LazyScript.lua
		--FORM = "Form "
		--IMMUNITY_TRACKING_NOT_SUPPORTED = "Immunity tracking is not supported for your locale."
		--NOT_FOUND = " not found."
		--DEATHSTIMATOR =  "Deathstimator
		GANKED_ATTAKERS_NOT_SUPPORT = "ifGanked и ifXAttackers не поддерживаются для вашей локализации."
		BATTLEGROUND_FLAG_HOLDER_DET_NOT_SUPPORT = "Обнаружение носителя флага на Поле Боя не поддерживается для вашей локализации."
		DUELING_DET_NOT_SUPPORT = "Обнаружение дуэлей не поддерживается для вашей локализации."
		DOD_PAR_BLOCK_RES_NOT_SUPPORT = "ifDodged/Parried/Blocked/Resisted не поддерживаются для вашей локализации."
		WELCOME = "Добро пожаловать в "
		LOADED = " загружен. All the rope you need...\nВведите |cffffff00/lazyscript help|r для получения списка команд." --!
		ENTERING_DUEL = "Начало дуэли"
		LEAVING_DUEL = "Выход из дуэли"
		FLAG_HOLDER = "Флаг держит: "
		FLAG_HOLDER_EMPTY = "Флаг держит: Враг"
		BEHIND_ATTACK_FAILED = "Я вижу ваша атака сзади не удалась, подождите, чтобы использовать ее снова."
		INFRONT_ATTACK_FAILED = "Я вижу ваша атака спереди не удалась, подождите, чтобы использовать ее снова."
		OUTDOORS_ATTACK_FAILED = "Я вижу ваша внешняя атака не удалась, подождите, чтобы использовать ее снова."
		UNHANDLED_EVENT = "Неизвестное событие: "
		PVP_OPPONENTS = "|cffe5e519PVP Противники:"
		NOT_SUPPORTED = "не поддерживается для вашей локализации."
		COUNT = " Счет:"
		MONSTER_EMOTE_ARG1 = "Эмоция монстра: arg1="
		DETECTED_FLEEING_NPC = "Обнаружен убегающий NPC: "
		DETECTED_DODGE = " уклонение обнаружено на "
		DETECTED_PARRY = " парирование обнаружено на "
		DETECTED_BLOCK = " блок обнаружен на "
		DETECTED_RESIST = " сопротивление обнаружено на "
		CMD_DESCRIPTION_1 = " do <attack1> [<attack2> ...]|cffffffff - Выполнение указанного действия формы по умолчанию|r"
		CMD_DESCRIPTION_2 = " list|cffffffff - Печать всех форм в чат|r"
		CMD_DESCRIPTION_3 = " edit <formName>|cffffffff - Редактирование формы <formName>|r"
		CMD_DESCRIPTION_4 = " set <formName> <attack1> [<attack2> ...]|cffffffff - Замена содержимого формы <formName> на <attack1> ...|r"
		CMD_DESCRIPTION_5 = " copy <formName> <formName2>|cffffffff - Копирование содержимого <formName> в <formName2>|r"
		CMD_DESCRIPTION_6 = " clear <formName>|cffffffff - Удаление формы <formName>|r"
		CMD_DESCRIPTION_7 = " default [<formName>] [quiet]|cffffffff - Установка формы <formName> по умолчанию|r"
		CMD_DESCRIPTION_8 = " [<formName>]|cffffffff - Выполнение формы <formName>|r"
		CMD_DESCRIPTION_9 = " summon|cffffffff - Включение Помощника|r"
		CMD_DESCRIPTION_10 = " dismiss|cffffffff - Выключение Помощника|r"
		CMD_DESCRIPTION_11 = " hideMinionOutOfCombat|cffffffff - Переключение отображения Помощника вне боя|r"
		CMD_DESCRIPTION_12 = " summonDeath|cffffffff - Включение Оценщика смерти|r"
		CMD_DESCRIPTION_13 = " dismissDeath|cffffffff - Включение Оценщика смерти|r"
		CMD_DESCRIPTION_14 = " hideDeathMinionOutOfCombat|cffffffff - Переключение отображения Оценщика смерти вне боя|r"
		CMD_DESCRIPTION_15 = " mmshow|cffffffff - Отображение кнопки миникарты|r"
		CMD_DESCRIPTION_16 = " mmhide|cffffffff - Скрытие кнопки миникарты|r"
		CMD_DESCRIPTION_17 = " interruptExceptionCriteria|cffffffff - Редактирование критериев исключений прерывания|r"
		CMD_DESCRIPTION_18 = " noLongerInterruptLastInterrupted|cffffffff - Запрет прерывания последнего прерванного заклинания|r"
		CMD_DESCRIPTION_19 = " showTargetCasts|cffffffff - Переключение отображения, когда цель читает заклинание|r"
		CMD_DESCRIPTION_20 = " autoTarget|cffffffff - Переключение Авто-Цели|r"
		CMD_DESCRIPTION_21 = " initiateAutoAttack|cffffffff - Переключение Авто-Атаки|r"
		CMD_DESCRIPTION_22 = " assist <playername>|cffffffff - Установка помощника <playername>|r"
		CMD_DESCRIPTION_23 = " useImmunitiesList|cffffffff - Переключение отслеживание невосприимчивости|r"
		CMD_DESCRIPTION_24 = " clearImmunitiesList|cffffffff - Очистка списка невосприимчивости|r"
		CMD_DESCRIPTION_25 = " immunityExceptionCriteria|cffffffff - Редактирование критериев исключений невосприимчивости|r"
		CMD_DESCRIPTION_26 = " showGankMessage|cffffffff - Переключение отображения Ganked информации|r"
		CMD_DESCRIPTION_27 = " clearHistoryAfterCombat|cffffffff - Очистка истории после выхода из боя|r"	
		CMD_DESCRIPTION_28 = " resetDefaultForms|cffffffff - Сброс формы к значениям по умолчанию|r"
		CMD_DESCRIPTION_29 = " resetAllForms|cffffffff - Сброс всех форм|r"
		CMD_DESCRIPTION_30 = " about|cffffffff - Об аддоне|r"
		NO_DEFAULT_FORM_1 = "Не назначена форма по умолчанию, выберите форму на "
		NO_DEFAULT_FORM_2 = "  иконке миникарты, или используйте "
		NO_DEFAULT_FORM_3 = " default <form> чтобы установить ее."
		YOUR_DEFAULT_FORM_1 = "Ваша форма по умолчанию "
		YOUR_DEFAULT_FORM_2 = ", но она не существует, или содержит ошибку! Пожалуйста, выберите форму из списка меню миникарты "
		YOUR_DEFAULT_FORM_3 = " или используйте команду "
		DEBUGGING_OFF = "Отладка отключена."
		DEBUGGING_ON = "Отладка включена."
		FORM_UPDATED = "обновлена"
		FORM_CREATED = "создана"		
		DOESNT_EXIST = " не существует."
		COPIED_TO_FORM = " скопирована в форму "
		REMOVED = " удалена."
		WARNING_INCLUDED_FORM_1 = "ПРЕДУПРЕЖДЕНИЕ: следующие формы включены в форму "
		WARNING_INCLUDED_FORM_2 = ", которую вы только что удалили: "
		WARNING_INCLUDED_FORM_3 = ". Они были признаны недействительными и должны быть отредактированы, прежде чем вы можете использовать их."
		NOW_DEFAULT_FORM = "Теперь по умолчанию форма lazyScript."
		WARNING_NO_LONGER_HAVE_FORM_1 = "ПРЕДУПРЕЖДЕНИЕ: вы больше не имеете форму по умолчанию. Выберите одну из форм на " 
		WARNING_NO_LONGER_HAVE_FORM_2 = " иконке миникарты."
		WILL_NO_LONGER_AUTO_TARGET = " больше не берет в цель автоматически."
		WILL_NOW_AUTO_TARGET = " теперь берет в цель автоматически."
		WILL_NO_LONGER_INITIATE_AUTO_ATTACK = " больше не начинает автоатаку."
		WILL_NOW_INITIATE_AUTO_ATTACK = " теперь начинает автоатаку."
		WILL_NO_LONGER_CHECK_IMMUN = " больше не проверяет невосприимчивость."
		WILL_NOW_CHECK_IMMUN = " теперь проверяет невосприимчивость."
		IMMUN_LIST_CLEAR = "Список невосприимчивости очищен."
		SHOWING_THE_MINION = "Помощник показан."
		HIDING_THE_MINION = "Помощник скрыт."
		MINION_NO_LONGER_HIDE_IN_COMBAT = "Помощник больше не будет скрыт вне боя."
		MINION_NOW_HIDE_IN_COMBAT = "Помощник будет скрыт вне боя."
		SHOW_DEATHSTIMATOR = "Оценщик смерти показан."
		HIDE_DEATHSTIMATOR = "Оценщик смерти скрыт."
		DEATH_MINION_NO_LONGER_HIDE_IN_COMBAT = "Оценщик смерти больше не будет скрыт вне боя."
		DEATH_MINION_NOW_HIDE_IN_COMBAT = "Оценщик смерти будет скрыт вне боя."
		NO_LONGER_SHOWING_WHY = "Больше не показывается, почему "
		SHOWING_WHY = " думает что цель CCd."
		NOW_SHOWING_WHY = "Теперь показывается, почему "
		NO_LONGER_SHOWING_GANK = "Больше не показывается Ganked информация."
		SHOWING_GANK = "Теперь показывается Ganked информация."
		NO_LONGER_CLEARING_HISTORY = "Больше не очищается история после выхода из боя."
		NOW_CLEARING_HISTORY = "Теперь очищается история после выхода из боя."
		HAVENT_INTERRUPTED = "Вы не имеете каких-либо прерываний в последнее время."
		NEW_EXCEPTION_1 = "Добавлено новое исключение ("
		NEW_EXCEPTION_2 = ") глобальных критериев прерывания."
		NO_LONGER_SHOWING_TARGET_CASTS = "Больше не показывается, когда цель читает заклинание."
		NOW_SHOWING_TARGET_CASTS = "Теперь показывается, когда цель читает заклинание."
		ASSIST_SET_TO = "Помощник установлен на "
		TARGET_ASSIST_NOT_SET = "Помощник цели не установлен!"
		DEFAULT_FORM_IS_NOW = "Теперь по умолчанию форма "
		DEFAULT_FORM_IS = "По умолчанию форма "
		NOT_FOUND_TRY = " не найдена.  Попробуйте "
		HELP_FOR_HELPS = " help для помощи."
		ERASED_ALL_FORMS = "Все формы стерты."
		RESET_FORMS_TO_DEFAULT = "Формы сброшены к значениям по умолчанию."
		A = "" --1141
		ADDON_NOT_FOUND_FOR_YOUR_CLASS = " аддон не был найден для вашего класса."
		NO_FORMS_BOUND_THIS_KEY = "Нет форм, назначенных на эту клавишу."
		
		-- MinimapMenu.lua
		MINIMAP_BUTTON_MENU_NONE = "(нет)"
		MINIMAP_BUTTON_TOOLTIP_CURRENT_FORM = "Текущая форма: "
		MINIMAP_BUTTON_TOOLTIP_1 = "ЛКМ для выбора формы."
		MINIMAP_BUTTON_TOOLTIP_2 = "ПКМ+Перетаскивание для движения этой кнопки."
		MINIMAP_BUTTON_MENU_CREATE_NEW_FORM = "< Создать новую форму >"
		MINIMAP_BUTTON_MENU_OPT = "< Настройки >"
		MINIMAP_BUTTON_MENU_IMOPT = "< Настройки Невосприимчивости >"
		MINIMAP_BUTTON_MENU_CINTOPT = "< Настройки Прерывания >"
		MINIMAP_BUTTON_MENU_DEB = "< Отладка >"
		MINIMAP_BUTTON_MENU_HELP = "< Помощь >"
		MINIMAP_BUTTON_MENU_ABOUT = "< Об аддоне >"
		MINIMAP_BUTTON_MENU_OPT_TITLE = " Настройки"
		MINIMAP_BUTTON_MENU_OPT_AT = "Авто-Цель"
		MINIMAP_BUTTON_MENU_OPT_AT_INITIATE = "... и начать Авто-Атаку"
		MINIMAP_BUTTON_MENU_OPT_SM = "Показать Помощника"
		MINIMAP_BUTTON_MENU_OPT_ONLY_IN_COMBAT = "... Только в бою"
		MINIMAP_BUTTON_MENU_OPT_SM_ALWAYS_SHOW_ACTION = "... Всегда отображать действия"
		MINIMAP_BUTTON_MENU_OPT_SD = "Показать Оценщик смерти"
		MINIMAP_BUTTON_MENU_OPT_SD_DEATHSTIMATOR_SAMPLE = "Окно образца Оценщика смерти:"
		MINIMAP_BUTTON_MENU_IMOPT_TITLE = "Настройки Невосприимчивости"
		MINIMAP_BUTTON_MENU_IMOPT_STOP_IMMUNITY_TRACKING = "Остановить отслеживание невосприимчивости"
		MINIMAP_BUTTON_MENU_IMOPT_START_IMMUNITY_TRACKING = "Отслеживать новую невосприимчивость"
		MINIMAP_BUTTON_MENU_IMOPT_EDIT_IMMUNITY_EXCEPTION = "Изменить критерии исключений невосприимчивости"
		MINIMAP_BUTTON_MENU_CINTOPT_TITLE = "Настройки Прерывания заклинаний"
		MINIMAP_BUTTON_MENU_CINTOPT_EDIT_INTERRUPT_EXCEPTION_CRITERIA = "Изменить критерии исключений прерывания"
		MINIMAP_BUTTON_MENU_CINTOPT_LAST_INTERRUPTED = "Последнее прерывание: "
		MINIMAP_BUTTON_MENU_CINTOPT_DONT_INTERRUPT_IT_AGAIN = "... Не прерывать это сново"
		MINIMAP_BUTTON_MENU_DEB_TITLE = "Настройки отладки"
		MINIMAP_BUTTON_MENU_DEB_LOG_WHEN_TARGET_CASTS = "Записывать, когда цель читает заклинание"
		MINIMAP_BUTTON_MENU_DEB_SHOW_WHY_WHEN = "Показать почему, когда -ifTargetCCd  - true"
		MINIMAP_BUTTON_MENU_DEB_DISPLAY_GANKED_INFO = "Показать \"Ganked\" информацию"
		MINIMAP_BUTTON_MENU_DEB_AH = "< История действий >"
		MINIMAP_BUTTON_MENU_DEB_CLEAR_HISTORY_AFTER_COMBAT = "... Очистить историю после боя"
		MINIMAP_BUTTON_MENU_DEB_ITERNAL = "Внутренняя "
		MINIMAP_BUTTON_MENU_DEB_DEBUGGING_NOISY = " отладка (шумная)"
		MINIMAP_BUTTON_MENU_FORM_EDIT = "Изменить"
		MINIMAP_BUTTON_MENU_FORM_COPY = "Копировать"
		MINIMAP_BUTTON_MENU_FORM_DELETE = "Удалить"
		MINIMAP_BUTTON_MENU_FORM_SETKEY = "< Назначение клавиш >"
		MINIMAP_BUTTON_MENU_DEB_AH_TITLE = "История действий"
		MINIMAP_BUTTON_MENU_FORM_SETKEY_TITLE = "Назначение клавиш"
		MINIMAP_BUTTON_MENU_FORM_SETKEY_KEYBIND = "Назначить клавишу "
		SETKEY_KEYBIND = "Назначена клавиша "
		SETKEY_KEYBIND_TO_FORM = " на форму: "
		
		-- Minion.lua
		HIDE_THING_NOT_COMBAT = "Вы не в бою, так что я скрываю Помощника"
		SHOW_THING_IN_COMBAT = "Вы находитесь в бою, так что я показываю Помощника"
		ZZZ = "...zzz..." --!
		MINION = " Помощник"
		MINION_TOOLTIP = "Shift + ЛКМ, чтобы переместить меня."
		
		-- Parse.lua
		SYNTAX_ERROR_FOUND_IN = "Синтаксическая ошибка найдена в: "
		SYNTAX_ERROR_CANNOT_PARSE = "Синтаксическая ошибка: невозможно разобрать: "
		THE_UNITID = "UnitId '"
		IS_NOT_VALID = "' неправильный."
		NOT_POSSIBLE_SPECIFY_RANK = "Невозможно определить уровень для "
		YOU_CAN_ONLY_USE_MAX_RANK = "Вы можете использовать только максимальный уровень для "
		RANK = "Уровень "
		EXCEEDS_MAX_OF = " превышает максимумальный "
		FOR = " для "
		OR_IS_INVALID = " или неправильный."
		PARSED = "Разбор "
		ACTIONS_AND = " действий и "
		MASKS = " масок"
		WARNING_NIL_MASK_FOUND_1 = "ПРЕДУПРЕЖДЕНИЕ! 'ноль' маска была обнаружена при разборе строки формы \""
		WARNING_NIL_MASK_FOUND_2 = "\". Это может быть связано с несовместимостью LazyScript с вашим классом, или это может быть ошибка аддона. Пожалуйста, сообщите об этой ошибке и полную форму строки на lazytest@googlegroups.com."
		REMOVED_1 = "Удалена "
		DUPLICATE_MASKS = " повторяющаяся маска."
		SYNTAX_ERROR_CANNOT_HAVE_MULTIPLE_ACTIONS = "Синтаксическая ошибка: нельзя иметь несколько действий, которые активируют общее время восстановления в одной строке."
		CANNOT_INCLUDE_FORM_1 = ": Нельзя подключать "
		CANNOT_INCLUDE_FORM_2 = " саму в себя!"
		COULD_NOT_INCLUDE_FORM = ": Невозможно подключить форму "
		DOES_NOT_EXIST = " потому что она не существует!"
		INCLUDING_FORM = ": Подключена форма: "
		CONTAINS_ERRORS = " потому что она содержит ошибки!"
		COULD_NOT_PARSE_FROM_LINE = ": Невозможно разобрать строки формы: "
		TOTAL_MASKS = ": Всего масок: "
		PARSING_FORM = "Разбор формы "
		REPARSING_FORM = "Повторный разбор формы "
		WHITCH_DEPENDS_FORM = " которая зависит от "
		CLEARING_CACHE = "Очистка кэша для формы "
		
		-- ParseBuffs.lua
		--NOT_SUPPORTED = "not supported for your locale."
		OPTIMIZED_BUFF_DEBUFF_CHECK_NOT_VALID = "Оптимизация проверки баффов/дебаффов не доступна для вашей локализации. Вы можете использовать ifHasBuffTitle, ifHasDebuffTitle, и т.д."
		LOOKING_FOR = "Поиск для: "
		APPLICATIONS = " Применение: "
		IS_NOT_VALID_UNITID = " неправильный UnitId."
		BUFF_INFO_FOUND = "Найдена информация для баффа: "
		DID_NOT_FIND = "Не найдено "
		IN_THE = " в "
		DATABASE_TRY = " базе данных. Попробуйте "
		INSTEAD = " взамен."
		FOUND_KNOWN_BUFF = "Найден известный бафф: "
		BUFF_DEBUFF_CATEGORY = "Категория баффа/дебаффа "
		NOT_RECOGNISED = " не признана."
		AFFLICTED_BY = " под воздействием "
		SORRY = "Извините,"
		DID_NOT_FIND_ANY_BUFFS = "Не найдено ни одного баффа в "
		CATEGORY = " категории."
		
		-- ParseGeneral.lua
		--THE_UNITID = "The UnitId '"
		--IS_NOT_VALID = "' is not valid."
		--FOUND_KNOWN_BUFF = "Found known buff: "
		--IS_NOT_VALID_UNITID = " is not a valid UnitId."
		--SPELLSEARCH_FOUND_NIL_TEXTURE = "SpellSearch found nil texture at index "
		--SPELLSEARCH_FOUND = "SpellSearch found "
		--AT_INDEX = " at index "
		--SORRY = "Sorry,"
		--NOT_SUPPORTED = "not supported for your locale."
		UNKNOWN_CHANNEL_NAME = "Неизвестное название канала: "
		CANT_SHOOT_WANDS = "Вы не можете стрелять жезлами."
		NOT_HANE_AUTO_SHOT = "У вас нет Автоматической стрельбы."
		NO_BUFF_ENTRY_FOUND = "Не найдено баффа для введенного "
		TRY_CANCLEBUFFTITLE =  ". Попробуйте использовать cancelBuffTitle."
		COULD_NOT_FIND_FORM = "Не удалось найти форму "
		ONLY_MAIN_AND_OFF_HAND_SUPPORTED = "Поддерживается только правая рука и левая, не"
		RANGECHECKACTION_IS_NIL = "TargetInMeleeRange: rangeCheckAction равен нулю."
		ISACTIONINRANGE_RETURNED_NIL = "TargetInMeleeRange: IsActionInRange возвратил нуль. Неправильная цель."
		IFTARGETINMELEERANGE_NOT_SUPPORT = "ifTargetInMeleeRange в настоящее время не поддерживается для вашего класса."
		IFTARGETINMELEERANGE_NOT_SUPPORT_NOT_HAVE = "ifTargetInMeleeRange в настоящее время не поддерживается для вашего класса, потому что вы не имеете "
		YET = " еще."
		MOBINFO2_NOT_INSTALLED = "MobInfo2 (или аналог) не установлен, невозможно определить здоровье цели."
		LOCALE_NOT_EXIST = "Локализация не существует для проблем монтирования: "
		YOU_IN_BG = "Вы на поле боя: "
		ENABLE_GCD_1 = "Чтобы включить проверку общего времени восстановления, пожалуйста, поместите "
		ENABLE_GCD_2 = " действие на вашу панель действий."
		UNKNOWN_CLASS = "ХАХ! Неизвестный класс: "
		IFTARGETFLAGRUNNER_NOT_SUPPORT = "Извините, ifTargetFlagRunner не поддерживается для враждебных целей в вашей локализации."
		SEARCH_TARGET_OVER = "Поиск цели выше уровнем "
		SEARCH_TARGET_EQUAL = "Поиск цели равного уровня "
		SEARCH_TARGET_UNDER = "Поиск цели ниже уровнем "
		UNABLE_TO_DETERMINE = "не в состоянии определить, плюс/минус символ"
		KEY = "Ключ: "
		VALUE = ", значение: "
		KEY_2 = "Совпадение найдено: Ключ: "
		ONLY_CTRL_ALT_SHIFT = "Пождерживаются только Ctrl, Alt, и Shift, не: "
		YOU_MUST_PUT = "Вы должны поставить действие до -everyXXs."
		SYNTAX_EG = "Синтаксис например, "
		NOT_VALID_NUMBER = " недопустимый номер. Допустимые примеры: 1, 1.0, 1.5, 19.25"
		COULD_NOT_FIND_ACTION = "Не удалось найти действие: "
		ITEM = "Предмет "
		HAS_IMMUNITY_TO = " имеет невосприимчивость к "
		IFTARGETIMMUNE_MUST_APPEAR_AFTER = "-ifTargetImmune должен стоять после действия, которое будет проверяться."
		DID_NOT_RECOGNICE = "Непризнанный отслеживаемый тип: "
		UNRECOGNISED_ACTION = "Непризнанное действие: "
		ACTION_MUST_APPEAR_BEFORE = "Действие должно стоять перед -ifIsCurrentAction."
		INVALID_OPERATOR = "Недопустимый оператор: "
		ARE_NOT_SUPPORTED = " не поддерживаются для вашей локализации."
		IS_NOT_VALID_NUMBER = "' недопустимый номер."
		DEATH_IN_2 = "Смерть через: "
		SECONDS = " секунд."
		TIMETODEATH_CANNOT_ESTIMATED = "TimeToDeath не может быть оценено без установленного MobInfo-2."
		ONLY_MAIN_OR_OFF_HAND_SUPPORTED = "Поддерживается только правая рука или левая, не "
		SPELLDEARCH_FOUND_MORE_THAN = "SpellSearch нашел более "
		SPELLS = "заклинаний."
		
		-- Tooltip.lua
		CLEARING_CACHE_FOR = ": очистка кэша для "
		
		-- Util.lua
		SPELL = "Заклинание: "
		TEXTURES = "Текстуры: "
		
		BINDING_NAME_LAZYSCRIPT_EXECUTE = "Выполнить форму по умолчанию"
		BINDING_NAME_LAZYSCRIPT_KEYBIND1 = "Выполнить форму 1"
		BINDING_NAME_LAZYSCRIPT_KEYBIND2 = "Выполнить форму 2"
		BINDING_NAME_LAZYSCRIPT_KEYBIND3 = "Выполнить форму 3"
		BINDING_NAME_LAZYSCRIPT_KEYBIND4 = "Выполнить форму 4"
		BINDING_NAME_LAZYSCRIPT_KEYBIND5 = "Выполнить форму 5"
		BINDING_NAME_LAZYSCRIPT_KEYBIND6 = "Выполнить форму 6"
		BINDING_NAME_LAZYSCRIPT_KEYBIND7 = "Выполнить форму 7"
		BINDING_NAME_LAZYSCRIPT_KEYBIND8 = "Выполнить форму 8"
		BINDING_NAME_LAZYSCRIPT_KEYBIND9 = "Выполнить форму 9"
		BINDING_NAME_LAZYSCRIPT_KEYBIND10 = "Выполнить форму 10"

		elseif (locale == "deDE") then
		
		lsLocale.deDE = {}
		
		-- Popup dialog text
		lsLocale.deDE.INCOMPATIBLE_ADDON = "%s ist nicht kompatibel mit %s. Bitte updaten Sie auf die neueste(n) Version(en)."
		lsLocale.deDE.DELETE_FORM = "Sind Sie sicher, dass Sie die Form '%s' l\195\182schen m\195\182chten?"
		
		-- Initiate spell casting
		lsLocale.deDE.SPELLCASTOTHERSTART      = "(.+) beginnt (.+) zu wirken."
		lsLocale.deDE.SPELLPERFORMOTHERSTART   = "(.+) beginnt (.+) auszuf\195\188hren."
		
		--Spell type catches
		lsLocale.deDE.SPELLTEXT = {
			".+'s (.+) trifft [Ee]uch kritisch f\195\188r %d+ (.+)schaden.",   --- "Highend's Feuerball trifft Euch kritisch fьr XXX Feuer'schaden."
			".+ trifft [Ee]uch (.+) f\195\188r %d+ (.+)schaden.",              --- "Highend trifft Euch mit 'Feuerball' fьr XXX Feuer'schaden."
			"Ihr erleidet %d+ (.+)schaden (.+).",                      --- "Ihr erleidet XXX Frostschaden von Highend (durch Blizzard)."
		}
		
		-- The class of spell damage
		lsLocale.deDE.SPELLTYPE = {
			fire     = "Feuer",
			frost    = "Frost",
			nature   = "Natur",
			shadow   = "Schatten",
			arcane   = "Arkan",
			holy     = "Heilig",
		}
		
		lsLocale.deDE.MOUNTED_BUFF_TT          = "Erh\195\182ht Tempo um (%d+)%%."
		
		-- Warsong gulch announcements
		lsLocale.deDE.BG_WSG_ZONE =            "Warsongschlucht"     -- zone name
		lsLocale.deDE.BG_WSG_FLAG_PICKED_UP =  "(.+) hat die [Ff]lagge der %s aufgenommen!"
		lsLocale.deDE.BG_WSG_FLAG_CAPTURED =   "hat die [Ff]lagge der %s errungen!"
		lsLocale.deDE.BG_WSG_FLAG_DROPPED =    "hat die [Ff]lagge der %s fallen lassen!"
		lsLocale.deDE.BG_WSG_FLAG_RETURNED =   "die [Ff]lagge der %s wurde von (.+) zu ihrem St\195\188tzpunkt zur\195\188ckgebracht!"
		
		lsLocale.deDE.DUEL_COUNTDOWN        = "Duell beginnt: (%d)"
		lsLocale.deDE.DUEL_WINNER_KNOCKOUT  = "(.+) hat (.+) in einem Duell besiegt."
		lsLocale.deDE.DUEL_WINNER_RETREAT   = "(.+) ist vor (.+) aus einem Duell gefl\195\188chtet."
		
		lsLocale.deDE.REMAINING = "Schlachtfeld schlie\195\159t in %d+"
		
		lsLocale.deDE.GANKED = "Get\195\182tet von: %s Anzahl: %d"    --- "Ganked" is a bit difficult to translate^^
		-- COMBATHITCRITOTHERSELF = "%s crits you for %d.";
		-- COMBATHITOTHERSELF = "%s hits you for %d.";
		lsLocale.deDE.GANKED_CHATS = {
			"(.+)'s .+ trifft [Ee]uch kritisch f\195\188r",          --- "Highend's Feuerball trifft Euch kritisch fьr"
			"(.+) trifft [Ee]uch (.+) f\195\188r",                   --- "Highend trifft Euch mit 'Feuerball' fьr"
			"(.+) trifft [Ee]uch kritisch:",                         --- "Highend trifft Euch kritisch:"
			"(.+) trifft [Ee]uch f\195\188r",                        --- "Highend trifft Euch fьr"
		}
		
		-- NPC is fleeing
		lsLocale.deDE.NPC_FLEE_MSG = "%%s versucht zu fl\195\188chten!"
		
		-- When something is immune to your spell, such as poison etc.
		lsLocale.deDE.IMMUNE = "(.+) war ein Fehlschlag. (.+) ist immun."
		
		-- These are creatures that cast divine protection on themselves
		--- Anmerkung: Wird "Phasing" von irgendeinem Monster als Name verwendet?
		lsLocale.deDE.IMMUNITYPROBLEMCREATURES = {
			"Scharlachroter",
			"Purpurroter",
			
			"Doan",
			"Gurubashi",
			"Springvale",
			"Arugal",
		}
		
		-- Localized instance names
		lsLocale.deDE.INSTANCES = {
			"Ragefireabgrund",
			"Die Todesminen",
			"Die H\195\182hlen des Wehklagens",
			"Burg Shadowfang",
			"Das Verlies",
			"Blackfathom-Tiefen",
			"Gnomeregan",
			"Der Kral von Razorfen",
			"Das scharlachrote Kloster",
			"Die H\195\188gel von Razorfen",
			"Uldaman",
			"Maraudon",
			"Zul'Farrak",
			"Der versunkene Tempel",
			"Blackrocktiefen",
			"Blackrockspitze",
			"Stratholme",
			"D\195\188sterbruch",
			"Scholomance",
			"Onyxias Hort",
			"Ruinen von Ahn'Qiraj",
			"Zul'Gurub",
			"Geschmolzener Kern",
			"Pechschwingenhort",
			"Tempel von Ahn'Qiraj",
			"Naxxramas",
		}
		
		-- Needed for many of the -ifTargetIs=Slowed etc.
		lsLocale.deDE.SLOWED_TTS = {
			"Bewegung um (.+) verlangsamt",           --- "Bewegung um 50% verlangsamt."  <- Kniesehne (Krieger)
			"Bewegungstempo um (.+) verlangsamt",     --- "Bewegungstempo um 60% verlangsamt."  <- Eiskдltefalle / Zurechtstutzen (Jдger)
			
		}
		-- Cheapshot or kidneyshot
		lsLocale.deDE.STUNNED_TTS = {
			"Bet\195\164ubt",                         --- "Betдubt."  <- Fiester Trick / Nierenhieb (Schurke)
		}
		-- Damage over time text like shadow word pain
		lsLocale.deDE.DOT_TTS = {
			"F\195\188gt alle (%d+) Sek. (%d+) (.+)schaden zu",      --- "Fьgt alle X Sek. XXX Feuerschaden zu."  <- Feuerbrand (Hexenmeister)
			"%d+ Sek. lang (%d+) Punkt(e) Schaden",                  --- "XX Sek. lang XXX Punkt(e) Schaden."  <- Fluch der Pein (Hexenmeister)
			"%d+ (.+)schaden alle (%d+) Sekunden",                   --- "XXX Schattenschaden alle 3 Sekunden."   <- Schattenwort: Schmerz (Priester)
		}
		-- Fear spells like psychic scream
		lsLocale.deDE.FEAR_TTS = {
			"Starr vor Furcht",                             --- "Starr vor Furcht."  <- Drohruf (Krieger)
			"Furchterf\195\188llt",                         --- "Furchterfьllt."  <- Furcht (Hexenmeister)
			"Fl\195\188chtet voller Schrecken",             --- "Flьchtet voller Schrecken."  <- Schreckensgeheul (Hexenmeister)
			"Von Entsetzen erf\195\188llt",                 --- "Von Entsetzen erfьllt."  <- Todesmantel (Hexenmeister)
			"L\195\164uft vor Furcht weg",                  --- "Lдuft vor Furcht weg."  <- Psychischer (Schrei)
		}
		lsLocale.deDE.IMMOBILE_TTS = {
			"Unbeweglich",                                  --- "Unbeweglich."  <- Gegenangriff (Jдger) / Wurzeln (Druide)
			"Bewegungsunf\195\164hig",                      --- "Bewegungsunfдhig."  <- Verbessertes Zurechtstutzen (Jдger)
			"Eingefroren",                                  --- "Eingefroren."  <- Frost Nova (Magier)
			
		}
		lsLocale.enUS.ASLEEP_TTS = nil
		
		
		lsLocale.enUS.DISORIENTED_TTS = nil
		
		
		lsLocale.enUS.INCAPACITATED_TTS = nil
		
		lsLocale.deDE.BUFF_TTS = {
			berserking           = "Berserker",
			bloodFury            = "Kochendes Blut",
			cannibalize          = "Kannibalismus",
			brainFood            = "Gehirnnahrung",      -- name of buff that you get when eating sagefish (mana)
			dazed                = "Benommen",
			drink                = "Trinken",            -- name of buff that you get when drinking (water pouch)
			firstAid             = "Erste Hilfe",
			fishFood             = "Essen",              -- name of buff that you get when eating sagefish (hp)
			food                 = "Essen",              -- name of buff that you get when eating (knife and fork)
			recentlyBandaged     = "Gnadenlose Angriffe",
			shadowmeld           = "Schattenhaftigkeit",
			silverwingFlag       = "Silverwing-Flagge",
			warsongFlag          = "Warsongflagge",
			wellFed              = "Satt",               -- name of well fed buff (cheese icon)
			
			--Rogue Buffs
			adrenaline           = "Adrenalinrausch",
			bladeFlurry          = "Klingenwirbel",
			blind                = "Blenden",
			cs                   = "Fieser Trick",
			coldBlood            = "Kaltbl\195\188tigkeit",
			evasion              = "Entrinnen",
			expose               = "R\195\188stung schw\195\164chen",
			garrote              = "Erdrosseln",
			ghostly              = "Geisterhafter Sto\195\159",
			gouge                = "Solarplexus",
			hemo                 = "Blutsturz",
			ks                   = "Nierenhieb",
			remorseless          = "",
			rupture              = "Blutung",
			sap                  = "Kopfnuss",
			snd                  = "Zerh\195\164ckseln",
			stealth              = "Verstohlenheit",
			vanish               = "Verschwinden",
			
			--Priest Buffs
			abolishDisease       = "Krankheit aufheben",
			devouringPlague      = "Verschlingende Seuche",
			divineSpirit         = "G\195\182ttlicher Willen",
			elunesGrace          = "Elunes Anmut",
			fade                 = "Verblassen",
			fearWard             = "Furchtzauberschutz",
			feedback             = "R\195\188ckkopplung",
			hexWeakness          = "Verhexung der Schw\195\164che",
			holyFire             = "Heiliges Feuer",
			innerFire            = "Inneres Feuer",
			innerFocus           = "Innerer Fokus",
			levitate             = "Levitieren",
			lightwell            = "Brunnen des Lichts",
			lightwellRenew       = "Erneuerung des Lichtbrunnens",
			mindControl          = "Gedankenkontrolle",
			mindFlay             = "Gedankenschinden",
			mindSoothe           = "Gedankenbes\195\164nftigung",
			mindVision           = "Gedankensicht",
			powerInfusion        = "Seele der Macht",
			pwf                  = "Machtwort: Seelenst\195\164rke",
			pws                  = "Machtwort: Schild",
			prf                  = "Gebet der Seelenst\195\164rke",
			prsp                 = "Gebet des Schattenschutzes",
			prs                  = "Gebet der Willenskraft",
			psychicScream        = "Psychischer Schrei",
			renew                = "Erneuerung",
			shackleUndead        = "Untote fesseln",
			shadowProtection     = "Schattenschutz",
			swp                  = "Schattenwort: Schmerz",
			shadowform           = "Schattengestalt",
			shadowguard          = "Schattenschild",
			shadowVulnerability  = "Schattenverwundbarkeit",
			spiritTap            = "Willensentzug",
			starshards           = "Sternensplitter",
			touchWeakness        = "Ber\195\188hrung der Schw\195\164che",
			vampiricEmbrace      = "Vampirumarmung",
			weakenedSoul         = "Geschw\195\164chte Seele",
			
			-- Warrior Buffs
			battleShout          = "Schlachtruf",
			berserkerRage        = "Berserkerwut",
			bloodrage            = "Blutrausch",
			challengingShout     = "Herausforderungsruf",
			concussionBlow       = "Ersch\195\188tternder Schlag",
			deathWish            = "Todeswunsch",
			demoShout            = "Demoralisierungsruf",
			disarm               = "Entwaffnen",
			hamstring            = "Kniesehne",
			intimidatingShout    = "Drohruf",
			lastStand            = "Letztes Gefecht",
			mockingBlow          = "Sp\195\182ttischer Schlag",
			mortalStrike         = "T\195\182dlicher Sto\195\159",
			piercingHowl         = "Durchdringendes Heulen",
			recklessness         = "Tollk\195\188hnheit",
			rend                 = "Verwunden",
			retaliation          = "Gegenschlag",
			shieldBlock          = "Schildblock",
			shieldWall           = "Schildwall",
			sunder               = "R\195\188stung zerrei\195\159en",
			sweepingStrikes      = "Weitreichende St\195\182\195\159e",
			thunderClap          = "Donnerknall",
			whirlwind            = "Wirbelwind",
			
			-- Druid Buffs
			bear                 = "B\195\164rengestalt",
			aquatic              = "Wassergestalt",
			cat                  = "Katzengestalt",
			travel               = "Reisegestalt",
			direBear             = "Terrorb\195\164rengestalt",
			moonkin              = "Moonkingestalt",
			
			prowl                = "Schleichen",
			rake                 = "Krallenhieb",
			rip                  = "Zerfetzen",
			dash                 = "Spurt",
			pounce               = "Anspringen",
			tigersFury           = "Tigerfuror",
			
			bash                 = "Hieb",
			charge               = "Wilde Attacke - Effekt",
			demoralize           = "Demoralisierendes Gebr\195\188ll",
			enrage               = "Wutanfall",
			frenziedRegen        = "Rasende Regeneration",
			
			abolishPoison        = "Vergiftung aufheben - Effekt",
			barkskin             = "Baumrinde",
			faerieFire           = "Feenfeuer",
			gotw                 = "Gabe der Wildnis",
			grasp                = "Griff der Natur",
			hibernate            = "Winterschlaf",
			innervate            = "Anregen",
			moonfire             = "Mondfeuer",
			motw                 = "Mal der Wildnis",
			ns                   = "Schnelligkeit der Natur",
			ooc                  = "Omen der Klarsicht",
			regrowth             = "Nachwachsen",
			rejuv                = "Verj\195\188ngung",
			roots                = "Wucherwurzeln",
			soothe               = "Tier bes\195\164nftigen",
			swarm                = "Insektenschwarm",
			thorns               = "Dornen",
			tranquility          = "Gelassenheit",
			
			-- Hunter Buffs
			aspectBeast          = "Aspekt des Wildtiers",
			aspectCheetah        = "Aspekt des Geparden",
			aspectHawk           = "Aspekt des Falken",
			aspectPack           = "Aspekt des Rudels",
			aspectMonkey         = "Aspekt des Affen",
			aspectWild           = "Aspekt der Wildnis",
			bestialWrath         = "Zorn des Wildtiers",
			concussive           = "Ersch\195\188tternder Schuss",
			eagleEye             = "Adlerauge",
			eotb                 = "Augen des Wildtiers",
			explosiveTrap        = "Sprengfalle'-Effekt",
			feedPet              = "Tier f\195\188ttern - Effekt",
			feign                = "Totstellen",
			frostTrap            = "Frostfalle-Aura",
			freezingTrap         = "Eisk\195\164ltefalle",
			furiousHowl          = "Wutgeheul",
			huntersMark          = "Mal des J\195\164gers",
			immolationTrap       = "Feuerbrandfalle",
			intimidate           = "Einsch\195\188chterung",
			quickShots           = "Schnelle Sch\195\188sse",
			rapidFire            = "Schnellfeuer",
			scare                = "Wildtier \195\164ngstigen",
			scatter              = "Streuschuss",
			scorpid              = "Skorpidstich",
			serpent              = "Schlangenbiss",
			trueshot             = "Aura des Volltreffers",
			viper                = "Vipernbiss",
			wingClip             = "Zurechtstutzen",
			wyvern               = "Stich des Fl\195\188geldrachen",
			wyvernCC             = "Stich des Fl\195\188geldrachen",
			wyvernDot            = "Stich des Fl\195\188geldrachen",
			
			-- Mage Buffs
			amplifyMagic         = "Magie verst\195\164rken",
			brilliance           = "Arkane Brillanz",
			combustion           = "Verbrennung",
			dampenMagic          = "Magie d/195/164mpfen",
			evocation            = "Hervorrufung",
			fireVulnerability    = "Feuerverwundbarkeit",
			fireWard             = "Feuerzauberschutz",
			frostArmor           = "Frostr\195\188stung",
			frostbolt            = "Frostblitz",
			frostWard            = "Frostzauberschutz",
			iceArmor             = "Eisr\195\188stung",
			iceBarrier           = "Eis-Barriere",
			iceBlock             = "Eisblock",
			ignite               = "Entz\195\188nden",
			intellect            = "Arkane Intelligenz",
			mageArmor            = "Magische R\195\188stung",
			manaShield           = "Manaschild",
			polymorph            = "Verwandlung",
			polymorphPig         = "Verwandlung: Schwein",
			polymorphTurtle      = "Verwandlung: Schildkr\195\182te",
			
			-- Paladin Buffs
			concAura             = "Aura der Konzentration",
			devAura              = "Aura der Hingabe",
			fireAura             = "Aura des Feuerwiderstands",
			retAura              = "Aura der Vergeltung",
			sanctAura            = "Aura der Heiligkeit",
			shadowAura           = "Aura des Schattenwiderstands",
			blessFree            = "Segen der Freiheit",
			blessKings           = "Segen der K\195\182nige",
			blessLight           = "Segen des Lichts",
			blessMight           = "Segen der Macht",
			blessProt            = "Segen des Schutzes",
			blessSac             = "Segen der Opferung ",
			blessSlv             = "Segen der Rettung",
			blessSnct            = "Segen des Refugiums",
			blessWisdom          = "Segen der Weisheit",
			divFavor             = "G\195\182ttliche Gunst",
			divProt              = "G\195\182ttlicher Schutz",
			divShield            = "Gottesschild",
			forbearance          = "Vorahnung",
			gBlessKings          = "Gro\195\159er Segen der K\195\182nige",
			gBlessLight          = "Gro\195\159er Segen des Lichts",
			gBlessMight          = "Gro\195\159er Segen der Macht",
			gBlessSlv            = "Gro\195\159er Segen der Rettung",
			gBlessSnct           = "Gro\195\159er Segen des Refugiums",
			gBlessWisdom         = "Gro\195\159er Segen der Weisheit",
			holyShield           = "Heiliger Schild ",
			redoubt              = "Verschanzen",
			repentance           = "Bu\195\159e",
			rightFury            = "Zorn der Gerechtigkeit",
			sealCommand          = "Siegel des Befehls ",
			sealCrusader         = "Seal of the Crusader",
			sealJustice          = "Siegel der Gerechtigkeit",
			sealLight            = "Siegel des Lichts",
			sealRight            = "Siegel der Rechtschaffenheit",
			sealWisdom           = "Siegel der Weisheit",
			
			judgeCrusader        = "Richturteil des Kreuzfahrers",
			judgeJustice         = "Richturteil der Gerechtigkeit",
			judgeLight           = "Richturteil des Lichts",
			judgeWisdom          = "Richturteil der Weisheit",
			
			-- Shaman buffs
			lightShield          = "Blitzschlagschild",
			ghostwolf            = "Geisterwolf",
			
			fireResistTotem      = "Feuerwiderstand",
			flameTotem           = "Flammenzunge",
			flameShock           = "Flammenschock",
			frostResistTotem     = "Frostwiderstand",
			graceTotem           = "Anmut der Luft",
			hsTotem              = "Heilstrom",
			msTotem              = "Manaquelle",
			mtTotem              = "Manaflut",
			natureResistTotem    = "Naturwiderstand",
			skinTotem            = "Steinhaut",
			strengthTotem             = "St\195\164rke der Erde",
			tranquilTotem        = "Beruhigenden Winde",
			wfTotem              = "Windzorns",
			windwallTotem        = "Windmauer",
			
			-- Warlock buffs
			amplifyCurse         = "Fluch verst\195\164rken",
			corruption           = "Verderbnis",
			curseAgony           = "Fluch der Pein",
			curseElements        = "Fluch der Elemente",
			curseExhaustion      = "Fluch der Ersch\195\182pfung",
			curseReckless        = "Fluch der Tollk\195\188hnheit",
			curseShadow          = "Schattenfluch",
			curseTongues         = "Fluch der Sprachen",
			curseWeakness        = "Fluch der Schw\195\164che",
			banish               = "Verbannen",
			deathCoil            = "Todesmantel",
			demonArmor           = "D\195\164monenr\195\188stung",
			demonSkin            = "D\195\164monenhaut",
			detectGreaterInvis   = "Gro\195\159e Unsichtbarkeit entdecken",
			detectInvis          = "Unsichtbarkeit entdecken",
			detectLesserInvis    = "Geringe Unsichtbarkeit entdecken",
			drainLife            = "Blutsauger",
			drainMana            = "Mana entziehen",
			drainSoul            = "Seelendieb",
			fear                 = "Furcht",
			funnel               = "Lebenslinie",
			hellfire             = "H\195\182llenfeuer",
			howl                 = "Schreckgeheul",
			immolate             = "Feuerbrand",
			sacrifice            = "Opferung",
			shadowburn           = "Schattenbrand",
			shadowTrance         = "Schattentrance",
			seduction            = "Verf\195\188hrung",
			senseDemons          = "D\195\164monen sp\195\188ren",
			shadowWard           = "Schattenzauberschutz",
			siphon               = "Lebensentzug",
			soulLink             = "Seelenverbindung",
			
			-- Pet related
			petProwl             = "Schleichen",
			
			-- Other
			
			clearcasting         = "Freizaubern",
			
		}
		
		lsLocale.deDE.BUFF_BODY_TTS = {
			wyvernCC             = "Schlafend",
			wyvernDot            = nil
		}
		
		
		-- Action names
		-- Since this table is appended to by the class specific addons, we have to
		-- write out each line
		lsLocale.deDE.ACTION_TTS = {}
		lsLocale.deDE.ACTION_TTS.berserking       = "Berserker"
		lsLocale.deDE.ACTION_TTS.bloodFury        = "Kochendes Blut"
		lsLocale.deDE.ACTION_TTS.cannibalize      = "Kannibalismus"
		lsLocale.deDE.ACTION_TTS.escapeArtist     = "Entfesselungsk\195\188nstler"
		lsLocale.deDE.ACTION_TTS.findTreasure     = "Schatzsucher"
		lsLocale.deDE.ACTION_TTS.perception       = "Wachsamkeit"
		lsLocale.deDE.ACTION_TTS.stoneForm        = "Steingestalt"
		lsLocale.deDE.ACTION_TTS.shadowmeld       = "Schattenhaftigkeit"
		lsLocale.deDE.ACTION_TTS.warStomp         = "Kriegsdonner"
		lsLocale.deDE.ACTION_TTS.forsaken         = "Wille der Verlassenen"
		lsLocale.deDE.ACTION_TTS.bow              = "Bogenschuss"
		lsLocale.deDE.ACTION_TTS.crossbow         = "Armbrust abschie\195\159en"
		lsLocale.deDE.ACTION_TTS.gun              = "Schusswaffe abfeuern"
		lsLocale.deDE.ACTION_TTS.throw            = nil
		lsLocale.deDE.ACTION_TTS.petFollow        = nil
		lsLocale.deDE.ACTION_TTS.petStay          = nil
		lsLocale.deDE.ACTION_TTS.petAggressive    = nil
		lsLocale.deDE.ACTION_TTS.petDefensive     = nil
		lsLocale.deDE.ACTION_TTS.petPassive       = nil
		lsLocale.deDE.ACTION_TTS.findHerbs        = "Kr\195\164utersuche"
		lsLocale.deDE.ACTION_TTS.findMinerals     = "Mineraliensuche"
		
		elseif (locale == "frFR") then
		
		lsLocale.frFR = {}
		-- French
		lsLocale.frFR.SPELLCASTOTHERSTART      = "(.+) commence \195\160 lancer (.+)."
		lsLocale.frFR.SPELLPERFORMOTHERSTART   = "(.+) commence \195\160 ex\195\169cuter (.+)."
		lsLocale.frFR.MOUNTED_BUFF_TT          = "Augmente la vitesse de (%d+)%%."
		--lsLocale.MOUNTED_BUFF_TT = "Augmente la vitesse de mouvement";
		
		
		
		lsLocale.frFR.DUEL_COUNTDOWN        = "D\195\169but du duel : (%d)"
		lsLocale.frFR.DUEL_WINNER_KNOCKOUT  = "(.+) a triomph\195\169 de (.+) lors d'un duel"
		lsLocale.frFR.DUEL_WINNER_RETREAT   = "(.+) s'enfuit de son duel contre (.+)"
		
		-- TBD: BEGIN NEED LOCALIZATION!
		lsLocale.frFR.SPELLTEXT = nil
		lsLocale.frFR.SPELLTYPE = nil
		
		-- TBD: BEGIN NEED LOCALIZATION!
		
		lsLocale.frFR.IMMUNE                   = nil
		lsLocale.frFR.IMMUNITYPROBLEMCREATURES = nil
		lsLocale.frFR.SLOWED_TTS               = nil
		lsLocale.frFR.STUNNED_TTS              = nil
		lsLocale.frFR.DOT_TTS                  = nil
		lsLocale.frFR.FEAR_TTS                 = nil
		lsLocale.frFR.IMMOBILE_TTS             = nil
		lsLocale.frFR.INSTANCES                = nil
		lsLocale.frFR.BGWGTEXT0                = nil
		lsLocale.frFR.GANKED                   = nil
		
		-- TBD: END NEED LOCALIZATION!
		
		lsLocale.frFR.BUFF_TTS = {
			--asleep               = nil,
			berserking           = "Berserker",
			bloodFury            = "Fureur sanguinaire",
			cannibalize          = "Cannibalisme",
			dazed                = "H\195\169b\195\169tement",
			firstAid             = "Premiers soins",
			recentlyBandaged     = "Un bandage a \195\169t\195\169 appliqu\195\169 r\195\169cemment",
			shadowmeld           = "Camouflage dans l'ombre",
			silverwingFlag       = "Drapeau d'Aile-argent",
			warsongFlag          = "Drapeau Warsong",
			
			--Rogue Buffs
			adrenaline           = "Pouss\195\169e d'adr\195\169naline",
			bladeFlurry          = "D\195\169luge de lames",
			blind                = "C\195\169cit\195\169",
			cs                   = "Coup bas",
			coldBlood            = "Sang froid",
			evasion              = "Evasion",
			expose               = "Exposer l'armure",
			garrote              = "Garrot",
			ghostly              = "Frappe fantomatique",
			gouge                = "Suriner",
			hemo                 = "H\195\169morragie",
			ks                   = "Aiguillon perfide",
			remorseless          = "Attaques impitoyables",
			rupture              = "Rupture",
			sap                  = "Assommer",
			snd                  = "D\195\169biter",
			stealth              = "Camouflage",
			vanish               = "Disparition",
			
			--Priest Buffs
			abolishDisease       = "Abolir maladie",
			devouringPlague      = "Peste d\195\169vorante",
			divineSpirit         = "Esprit divin",
			elunesGrace          = "Gr\195\162ce d'Elune",
			fade                 = "Oubli",
			fearWard             = "Gardien de peur",
			feedback             = "R\195\169action",
			hexWeakness          = "Mal\195\169fice de faiblesse",
			holyFire             = "Flammes sacr\195\169es",
			innerFire            = "Feu int\195\169rieur",
			innerFocus           = "Focalisation am\195\169lior\195\169e",
			levitate             = "L\195\169vitation",
			lightwell            = "Puits de lumi\195\168re",
			lightwellRenew       = "R\195\169novation du Puits de lumi\195\168re",
			mindControl          = "Contr\195\180le mental",
			mindFlay             = "Fouet mental",
			mindSoothe           = "Apaisement",
			mindVision           = "Vision t\195\169l\195\169pathique",
			powerInfusion        = "Infusion de puissance",
			pwf                  = "Mot de pouvoir : Robustesse",
			pws                  = "Mot de pouvoir : Bouclier",
			prf                  = "Pri\195\168re de robustesse",
			prsp                 = "Pri\195\168re de protection contre l'Ombre",
			prs                  = "Pri\195\168re d'Esprit",
			psychicScream        = "Cri psychique",
			renew                = "R\195\169novation",
			shackleUndead        = "Entraves des morts-vivants",
			shadowProtection     = "Protection contre l'Ombre",
			swp                  = "Mot de l'ombre : Douleur",
			shadowform           = "Forme d'Ombre",
			shadowguard          = "Garde de l'ombre",
			shadowVulnerability  = "Vuln\195\169rabilit\195\169 \195\160 l'Ombre",
			spiritTap            = "Connexion spirituelle",
			starshards           = "Eclats stellaires",
			touchWeakness        = "Toucher de faiblesse",
			vampiricEmbrace      = "Etreinte vampirique",
			weakenedSoul         = "Ame affaiblie",
			
			-- Warrior Buffs
			battleShout          = "Cri de guerre",
			berserkerRage        = "Rage berserker",
			bloodrage            = "Rage sanguinaire",
			challengingShout     = "Cri de d\195\169fi",
			concussionBlow       = "Bourrasque",
			deathWish            = "Souhait mortel",
			demoShout            = "Cri d\195\169moralisant",
			disarm               = "D\195\169sarmement",
			hamstring            = "Brise-genou",
			intimidatingShout    = "Cri d'intimidation",
			lastStand            = "Dernier rempart",
			mockingBlow          = "Coup railleur",
			mortalStrike         = "Frappe mortelle",
			piercingHowl         = "Hurlement per\195\167ant",
			recklessness         = "T\195\169m\195\169rit\195\169",
			rend                 = "Pourfendre",
			retaliation          = "Repr\195\169sailles",
			shieldBlock          = "Ma\195\174trise du blocage",
			shieldWall           = "Mur protecteur",
			sunder               = "Fracasser armure",
			sweepingStrikes      = "Attaques circulaires",
			thunderClap          = "Coup de tonnerre",
			whirlwind            = "Tourbillon",
			
			-- Druid Buffs
			bear                 = "Forme d'ours",
			aquatic              = "Forme aquatique",
			cat                  = "Forme de f\195\169lin",
			travel               = "Forme de voyage",
			direBear             = "Forme d'ours redoutable",
			moonkin              = "Forme de s\195\169l\195\169nien",
			
			prowl                = "R\195\180der",
			rake                 = "Griffure",
			rip                  = "D\195\169chirure",
			dash                 = "C\195\169l\195\169rit\195\169",
			pounce               = "Traquenard",
			tigersFury           = "Fureur du tigre",
			
			bash                 = "Sonner",
			charge               = "Effet de Charge farouche",
			demoralize           = "Rugissement d\195\169moralisant",
			enrage               = "Enrager",
			frenziedRegen        = "R\195\169g\195\169n\195\169ration fr\195\169n\195\169tique",
			
			abolishPoison        = "Effet Abolir le poison",
			barkskin             = "Ecorce",
			faerieFire           = "Lucioles",
			gotw                 = "Don du fauve",
			grasp                = "Emprise de la nature",
			hibernate            = "Hibernation",
			innervate            = "Innervation",
			moonfire             = "Eclat lunaire",
			motw                 = "Marque du fauve",
			ns                   = "Rapidit\195\169 de la nature",
			ooc                  = "Augure de clart\195\169",
			regrowth             = "R\195\169tablissement",
			rejuv                = "R\195\169cup\195\169ration",
			roots                = "Sarments",
			soothe               = "Apaiser les animaux",
			swarm                = "Essaim d'insectes",
			thorns               = "Epines",
			tranquility          = "Tranquillit\195\169",
			
			-- Hunter Buffs
			aspectBeast          = "Aspect de la b\195\170te",
			aspectCheetah        = "Aspect du gu\195\169pard",
			aspectHawk           = "Aspect du faucon",
			aspectPack           = "Aspect de la meute",
			aspectMonkey         = "Aspect du singe am\195\169lior\195\169",
			aspectWild           = "Aspect de la nature",
			bestialWrath         = "Courroux bestial",
			concussive           = "Trait de choc",
			eagleEye             = "Oeil d'aigle",
			eotb                 = "Oeil de la b\195\170te",
			explosiveTrap        = "Effet Pi\195\168ge explosif",
			feedPet              = "Effet Nourrir le familier",
			feign                = "Feindre la mort",
			frostTrap            = "Aura Pi\195\168ge de givre",
			freezingTrap         = "Pi\195\168ge givrant",
			furiousHowl          = "Hurlement furieux",
			huntersMark          = "Marque du chasseur",
			immolationTrap       = "Effet Pi\195\168ge immolation",
			intimidate           = "Intimidation",
			quickShots           = "Tirs acc\195\169l\195\169r\195\169s",
			rapidFire            = "Tir rapide",
			scare                = "Effrayer une b\195\170te",
			scatter              = "Fl\195\168che de dispersion",
			scorpid              = "Piq\195\187re de scorpide",
			serpent              = "Morsure de serpent",
			trueshot             = "Aura de pr\195\169cision",
			viper                = "Morsure de vip\195\168re",
			wingClip             = "Coupure d'ailes",
			wyvern               = "Piq\195\187re de wyverne",
			wyvernCC             = "Piq\195\187re de wyverne",
			wyvernDot            = "Piq\195\187re de wyverne",
			
			
			-- Mage Buffs
			amplifyMagic         = "Amplification de la magie",
			brilliance           = "Illumination des arcanes",
			combustion           = "Combustion",
			dampenMagic          = "Att\195\169nuation de la magie",
			evocation            = "Evocation",
			fireVulnerability    = "Vuln\195\169rabilit\195\169 au Feu",
			fireWard             = "Gardien de feu",
			frostArmor           = "Armure de givre",
			frostbolt            = "Eclair de givre",
			frostWard            = "Gardien de givre",
			iceArmor             = "Armure de glace",
			iceBarrier           = "Barri\195\168re de glace",
			iceBlock             = "Parade de glace",
			ignite               = "Enflammer",
			intellect            = "Intelligence des arcanes ",
			mageArmor            = "Armure du mage",
			manaShield           = "Bouclier de mana",
			polymorph            = "M\195\169tamorphose",
			polymorphPig         = nil,
			polymorphTurtle      = nil,
			
			-- Paladin Buffs
			concAura             = "Aura de concentration",
			devAura              = "Aura de d\195\169votion",
			fireAura             = "Aura des Feuerwiderstands",
			retAura              = "Aura de vindicte ",
			sanctAura            = "Aura de saintet\195\169",
			shadowAura           = "Aura de r\195\169sistance \195\160 l'Ombre",
			blessFree            = "B\195\169n\195\169diction de libert\195\169",
			blessKings           = "B\195\169n\195\169diction des rois",
			blessLight           = "B\195\169n\195\169diction de lumi\195\168re",
			blessMight           = "B\195\169n\195\169diction de puissance",
			blessProt            = "B\195\169n\195\169diction de protection ",
			blessSac             = "B\195\169n\195\169diction de sacrifice",
			blessSlv             = "B\195\169n\195\169diction de salut ",
			blessSnct            = "B\195\169n\195\169diction du sanctuaire",
			blessWisdom          = "B\195\169n\195\169diction de sagesse",
			divFavor             = "Faveur divine",
			divProt              = "Protection divine",
			divShield            = "Bouclier divin",
			forbearance          = "Longanimit\195\169",
			gBlessKings          = "B\195\169n\195\169diction des rois sup\195\169rieure",
			gBlessLight          = "B\195\169n\195\169diction de lumi\195\168re sup\195\169rieure",
			gBlessMight          = "B\195\169n\195\169diction de puissance sup\195\169rieure",
			gBlessSlv            = "B\195\169n\195\169diction de salut sup\195\169rieure",
			gBlessSnct           = "B\195\169n\195\169diction du sanctuaire sup\195\169rieure",
			gBlessWisdom         = "B\195\169n\195\169diction de sagesse sup\195\169rieure",
			holyShield           = "Bouclier sacr\195\169",
			redoubt              = "Redoute",
			repentance           = "Repentir",
			rightFury            = "Fureur vertueuse",
			sealCommand          = "Sceau d'autorit\195\169 ",
			sealCrusader         = "Seal of the Crusader",
			sealJustice          = "Sceau de justice",
			sealLight            = "Sceau de lumi\195\168re",
			sealRight            = "Sceau de pi\195\169t\195\169",
			sealWisdom           = "Sceau de sagesse",
			
			judgeCrusader        = "Jugement du Crois\195\169",
			judgeJustice         = "Jugement de justice",
			judgeLight           = "Jugement de lumi\195\168re",
			judgeWisdom          = "Jugement de sagesse",
			
			-- Shaman buffs
			lightShield          = "Bouclier de foudre",
			ghostwolf            = "Loup fant\195\180me",
			
			fireResistTotem      = "R\195\169sistance au Feu",
			flameShock           = "Horion de flammes",
			flameTotem           = "Langue de feu",
			frostResistTotem     = "R\195\169sistance au Givre",
			graceTotem           = "Gr\195\162ce a\195\169rienne",
			hsTotem              = "Gu\195\169risseur",
			msTotem              = "Fontaine de mana",
			mtTotem              = "Vague de mana",
			natureResistTotem    = "R\195\169sistance \195\160 la Nature",
			skinTotem            = "Peau de Pierre",
			strengthTotem        = "Force de la Terre",
			tranquilTotem        = "Tranquillit\195\169 de l'air",
			wfTotem              = "Furie-des-vents",
			windwallTotem        = "Mur des vents",
			
			-- Warlock buffs
			amplifyCurse         = "Mal\195\169diction amplifi\195\169e",
			corruption           = "Corruption",
			curseAgony           = "Mal\195\169diction d'agonie",
			curseElements        = "Mal\195\169diction des \195\169l\195\169ments",
			curseExhaustion      = "Mal\195\169diction de fatigue",
			curseReckless        = "Mal\195\169diction de t\195\169m\195\169rit\195\169",
			curseShadow          = "Mal\195\169diction de l'ombre",
			curseTongues         = "Mal\195\169diction des langages",
			curseWeakness        = "Mal\195\169diction de faiblesse",
			banish               = "Bannir",
			deathCoil            = "Voile mortel",
			demonArmor           = "Armure d\195\169moniaque",
			demonSkin            = "Peau de d\195\169mon",
			detectGreaterInvis   = "D\195\169tection de l'invisibilit\195\169 sup\195\169rieure",
			detectInvis          = "D\195\169tection de l'invisibilit\195\169",
			detectLesserInvis    = "D\195\169tection de l'invisibilit\195\169 inf\195\169rieure",
			drainLife            = "Drain de vie",
			drainMana            = "Drain de mana",
			drainSoul            = "Siphon d'\195\162me",
			fear                 = "Peur",
			funnel               = "Captation de vie",
			hellfire             = "Flammes infernales",
			howl                 = "Hurlement de terreur",
			immolate             = "Immolation",
			sacrifice            = "Sacrifice",
			seduction            = "S\195\169duction",
			senseDemons          = "D\195\169tection des d\195\169mons",
			shadowburn           = "Br\195\187lure de l'ombre",
			shadowTrance         = "Transe de l'ombre",
			shadowWard           = "Gardien de l'ombre",
			siphon               = "Siphon de vie",
			soulLink             = "Lien spirituel",
			
			-- Pet related
			petProwl             = "R\195\180der",
			
			-- Other
			
			clearcasting         = "Id\195\169es claires",
			
		}
		
		lsLocale.frFR.BUFF_BODY_TTS = {
			wyvernCC             = nil,
			wyvernDot            = nil,
		}
		
		
		-- Action names
		-- Since this table is appended to by the class specific addons, we have to
		-- write out each line
		lsLocale.frFR.ACTION_TTS = {}
		lsLocale.frFR.ACTION_TTS.berserking       = "Berserker"
		lsLocale.frFR.ACTION_TTS.bloodFury        = "Fureur sanguinaire"
		lsLocale.frFR.ACTION_TTS.cannibalize      = "Cannibalisme"
		lsLocale.frFR.ACTION_TTS.escapeArtist     = "Ma\195\174tre de l'\195\169vasion"
		lsLocale.frFR.ACTION_TTS.findTreasure     = "D\195\169couverte de tr\195\169sors"
		lsLocale.frFR.ACTION_TTS.perception       = "Perception"
		lsLocale.frFR.ACTION_TTS.stoneForm        = "Forme de pierre"
		lsLocale.frFR.ACTION_TTS.shadowmeld       = "Camouflage dans l'ombre"
		lsLocale.frFR.ACTION_TTS.warStomp         = "Choc martial"
		lsLocale.frFR.ACTION_TTS.forsaken         = "Volont\195\169 des R\195\169prouv\195\169s"
		lsLocale.frFR.ACTION_TTS.bow              = "Tir \195\160 l'arc"
		lsLocale.frFR.ACTION_TTS.crossbow         = "Tir \195\160 l'arbal\195\168te"
		lsLocale.frFR.ACTION_TTS.gun              = "Tir avec une arme \195\160 feu"
		lsLocale.frFR.ACTION_TTS.throw            = nil
		lsLocale.frFR.ACTION_TTS.findHerbs        = "D\195\169couverte d'herbes"
		lsLocale.frFR.ACTION_TTS.findMinerals     = "D\195\169couverte de gisements"
		
	end
end

function lazyScript.getLocaleString(token, enOk, sayNothing)
	local locale = GetLocale()
	if locale == "enGB" then
		enOk = true
	end
	
	local value = lazyScript.doLocaleLookup(locale, token)
	
	if value then
		return value
		elseif (not value and enOk) then
		value = lazyScript.doLocaleLookup("enUS", token)
		if value then
			return value
			else
			if (not sayNothing) then
				lazyScript.p("Unrecognized localization token: "..token)
			end
			return nil
		end
		else
		if (not sayNothing) then
			lazyScript.p("This token is not supported for your locale: "..token)
		end
		return nil
	end
end

function lazyScript.doLocaleLookup(locale, token)
	if not lsLocale[locale] then
		return nil
	end
	local value = nil
	for tokenBit in string.gfind(token, "[^\.]+") do
		if value then
			value = value[tokenBit]
			else
			value = lsLocale[locale][tokenBit]
		end
	end
	return value
end					