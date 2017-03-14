lazyHunterLoad.metadata:updateRevisionFromKeyword("$Revision: 713 $")

-- The functions and data inside this block will not be defined unless the user is a HUNTER.

function lazyHunterLoad.LoadParseHunter()
	
	-- Hunter actions
	-----------------
	-- The lazyHunter.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	lazyHunter.actions.aimed               = lazyHunter.Action:New("aimed",                "INV_Spear_07")
	lazyHunter.actions.arcane              = lazyHunter.Action:New("arcane",               "Ability_ImpalingBolt")
	lazyHunter.actions.aspectBeast         = lazyHunter.Action:New("aspectBeast",          "Ability_Mount_PinkTiger", nil, nil, true)
	lazyHunter.actions.aspectCheetah       = lazyHunter.Action:New("aspectCheetah",        "Ability_Mount_JungleTiger", nil, nil, true)
	lazyHunter.actions.aspectHawk          = lazyHunter.Action:New("aspectHawk",           "Spell_Nature_RavenForm")
	lazyHunter.actions.aspectMonkey        = lazyHunter.Action:New("aspectMonkey",         "Ability_Hunter_AspectOfTheMonkey")
	lazyHunter.actions.aspectPack          = lazyHunter.Action:New("aspectPack",           "Ability_Mount_WhiteTiger", nil, nil, true)
	lazyHunter.actions.aspectWild          = lazyHunter.Action:New("aspectWild",           "Spell_Nature_ProtectionformNature")
	lazyHunter.actions.beastLore           = lazyHunter.Action:New("beastLore",            "Ability_Physical_Taunt", nil, nil, true)
	lazyHunter.actions.bestialWrath        = lazyHunter.Action:New("bestialWrath",         "Ability_Druid_FerociousBite", nil, false)
	lazyHunter.actions.call                = lazyHunter.Action:New("call",                 "Ability_Hunter_BeastCall")
	lazyHunter.actions.concussive          = lazyHunter.Action:New("concussive",           "Spell_Frost_Stun")
	lazyHunter.actions.counter             = lazyHunter.Action:New("counter",              "Ability_Warrior_Challange")
	lazyHunter.actions.deterrence          = lazyHunter.Action:New("deterrence",           "Ability_Whirlwind", nil, nil, true)
	lazyHunter.actions.disengage           = lazyHunter.Action:New("disengage",            "Ability_Rogue_Feint")
	lazyHunter.actions.dismiss             = lazyHunter.Action:New("dismiss",              "Spell_Nature_SpiritWolf")
	lazyHunter.actions.distract            = lazyHunter.Action:New("distract",             "Spell_Arcane_Blink")
	lazyHunter.actions.eagleEye            = lazyHunter.Action:New("eagleEye",             "Ability_Hunter_EagleEye")
	lazyHunter.actions.eotb                = lazyHunter.Action:New("eotb",                 "Ability_EyeOfTheOwl")
	lazyHunter.actions.explosiveTrap       = lazyHunter.Action:New("explosiveTrap",        "Spell_Fire_SelfDestruct")
	--lazyHunter.actions.feed                = lazyHunter.Action:New("feed",                 "Ability_Hunter_BeastTraining")
	lazyHunter.actions.feign               = lazyHunter.Action:New("feign",                "Ability_Rogue_FeignDeath")
	lazyHunter.actions.flare               = lazyHunter.Action:New("flare",                "Spell_Fire_Flare")
	lazyHunter.actions.freezingTrap        = lazyHunter.Action:New("freezingTrap",         "Spell_Frost_ChainsOfIce")
	lazyHunter.actions.frostTrap           = lazyHunter.Action:New("frostTrap",            "Spell_Frost_FreezingBreath")
	lazyHunter.actions.huntersMark         = lazyHunter.Action:New("huntersMark",          "Ability_Hunter_SniperShot")
	lazyHunter.actions.immolationTrap      = lazyHunter.Action:New("immolationTrap",       "Spell_Fire_FlameShock")
	lazyHunter.actions.intimidate          = lazyHunter.Action:New("intimidate",           "Ability_Devour")
	lazyHunter.actions.mend                = lazyHunter.Action:New("mend",                 "Ability_Hunter_MendPet")
	lazyHunter.actions.mongoose            = lazyHunter.Action:New("mongoose",             "Ability_Hunter_SwiftStrike")
	lazyHunter.actions.multi               = lazyHunter.Action:New("multi",                "Ability_UpgradeMoonGlaive")
	lazyHunter.actions.raptor              = lazyHunter.Action:New("raptor",               "Ability_MeleeDamage")
	lazyHunter.actions.rapidFire           = lazyHunter.Action:New("rapidFire",            "Ability_Hunter_RunningShot")
	lazyHunter.actions.revive              = lazyHunter.Action:New("revive",               "Ability_Hunter_BeastSoothe")
	lazyHunter.actions.scare               = lazyHunter.Action:New("scare",                "Ability_Druid_Cower", nil, nil, true)
	lazyHunter.actions.scatter             = lazyHunter.Action:New("scatter",              "Ability_GolemStormBolt")
	lazyHunter.actions.scorpid             = lazyHunter.Action:New("scorpid",              "Ability_Hunter_CriticalShot")
	lazyHunter.actions.serpent             = lazyHunter.Action:New("serpent",              "Ability_Hunter_Quickshot")
	lazyHunter.actions.tame                = lazyHunter.Action:New("tame",                 "Ability_Hunter_BeastTaming")
	lazyHunter.actions.trackBeasts         = lazyHunter.Action:New("trackBeasts",          "Ability_Tracking")
	lazyHunter.actions.trackDemons         = lazyHunter.Action:New("trackDemons",          "Spell_Shadow_SummonFelHunter")
	lazyHunter.actions.trackDragonkin      = lazyHunter.Action:New("trackDragonkin",       "INV_Misc_Head_Dragon_01")
	lazyHunter.actions.trackElementals     = lazyHunter.Action:New("trackElementals",      "Spell_Frost_SummonWaterElemental")
	lazyHunter.actions.trackGiants         = lazyHunter.Action:New("trackGiants",          "Ability_Racial_Avatar")
	lazyHunter.actions.trackHidden         = lazyHunter.Action:New("trackHidden",          "Ability_Stealth")
	lazyHunter.actions.trackHumanoids      = lazyHunter.Action:New("trackHumanoids",       "Spell_Holy_PrayerOfHealing")
	lazyHunter.actions.trackUndead         = lazyHunter.Action:New("trackUndead",          "Spell_Shadow_DarkSummoning")
	--lazyHunter.actions.train               = lazyHunter.Action:New("train",                "Ability_Hunter_BeastCall02")
	lazyHunter.actions.tranquilizing       = lazyHunter.Action:New("tranquilizing",        "Spell_Nature_Drowsy")
	lazyHunter.actions.trueshot            = lazyHunter.Action:New("trueshot",             "Ability_TrueShot")
	lazyHunter.actions.viper               = lazyHunter.Action:New("viper",                "Ability_Hunter_AimedShot")
	lazyHunter.actions.volley              = lazyHunter.Action:New("volley",               "Ability_Marksmanship", nil, nil, true)
	lazyHunter.actions.wingClip            = lazyHunter.Action:New("wingClip",             "Ability_Rogue_Trip", nil, nil, true)
	lazyHunter.actions.wyvern              = lazyHunter.Action:New("wyvern",               "INV_Spear_02")
	
	
	-- Pet actions
	lazyHunter.actions.petBite             = lazyHunter.PetAction:New("petBite",           "Ability_Racial_Cannibalize", nil, nil, true)
	lazyHunter.actions.petBreath           = lazyHunter.PetAction:New("petBreath",         "Spell_Nature_Lightning")
	lazyHunter.actions.petCharge           = lazyHunter.PetAction:New("petCharge",         "Ability_Hunter_Pet_Boar")
	lazyHunter.actions.petClaw             = lazyHunter.PetAction:New("petClaw",           "Ability_Druid_Rake")
	lazyHunter.actions.petCower            = lazyHunter.PetAction:New("petCower",          "Ability_Druid_Cower", nil, nil, true)
	lazyHunter.actions.petDash             = lazyHunter.PetAction:New("petDash",           "Ability_Druid_Dash")
	lazyHunter.actions.petDive             = lazyHunter.PetAction:New("petDive",           "Spell_Shadow_BurningSpirit")
	lazyHunter.actions.petGrowl            = lazyHunter.PetAction:New("petGrowl",          "Ability_Physical_Taunt", nil, nil, true)
	lazyHunter.actions.petHowl             = lazyHunter.PetAction:New("petHowl",           "Ability_Hunter_Pet_Wolf")
	lazyHunter.actions.petPoison           = lazyHunter.PetAction:New("petPoison",         "Ability_PoisonSting")
	lazyHunter.actions.petProwl            = lazyHunter.PetAction:New("petProwl",          "Ability_Druid_SupriseAttack")
	lazyHunter.actions.petStomp            = lazyHunter.PetAction:New("petStomp",          "Ability_Hunter_Pet_Gorilla")
	lazyHunter.actions.petScreech          = lazyHunter.PetAction:New("petScreech",        "Ability_Hunter_Pet_Bat")
	lazyHunter.actions.petShell            = lazyHunter.PetAction:New("petShell",          "Ability_Hunter_Pet_Turtle")
	lazyHunter.actions.petUnprowl          = lazyHunter.PetAction:New("petUnprowl",        "Ability_Vanish")
	
	
	-- Trackers
	lazyHunter.trackers.beasts             = lazyHunter.Tracker:New("Track Beasts",        "Ability_Tracking")
	lazyHunter.trackers.demons             = lazyHunter.Tracker:New("Track Demons",        "Spell_Shadow_SummonFelHunter")
	lazyHunter.trackers.dragonkin          = lazyHunter.Tracker:New("Track Dragonkin",     "INV_Misc_Head_Dragon_01")
	lazyHunter.trackers.elementals         = lazyHunter.Tracker:New("Track Elementals",    "Spell_Frost_SummonWaterElemental")
	lazyHunter.trackers.giants             = lazyHunter.Tracker:New("Track Giants",        "Ability_Racial_Avatar")
	lazyHunter.trackers.hidden             = lazyHunter.Tracker:New("Track Hidden",        "Ability_Stealth")
	lazyHunter.trackers.humanoids          = lazyHunter.Tracker:New("Track Humanoids",     "Spell_Holy_PrayerOfHealing")
	lazyHunter.trackers.undead             = lazyHunter.Tracker:New("Track Undead",        "Spell_Shadow_DarkSummoning")
	
	
	
	-- Special Hunter actions
	-------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyHunter.comboActions.<actionName> or lazyHunter.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	
	function lazyHunter.bitParsers.aspectBeast(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.aspectBeast.codePattern)) then
			return false
		end
		local buffObj = lazyHunter.buffTable[lazyHunter.actions.aspectBeast.code]
		table.insert(actions, lazyHunter.actions.aspectBeast)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.CheckBuffOrDebuff("player", buffObj, "buff", "", nil),true))
		return true
	end
	
	function lazyHunter.bitParsers.aspectCheetah(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.aspectCheetah.codePattern)) then
			return false
		end
		local buffObj = lazyHunter.buffTable[lazyHunter.actions.aspectCheetah.code]
		table.insert(actions, lazyHunter.actions.aspectCheetah)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.CheckBuffOrDebuff("player", buffObj, "buff", "", nil),true))
		return true
	end
	
	function lazyHunter.bitParsers.aspectHawk(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.aspectHawk.codePattern)) then
			return false
		end
		local buffObj = lazyHunter.buffTable[lazyHunter.actions.aspectHawk.code]
		table.insert(actions, lazyHunter.actions.aspectHawk)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.CheckBuffOrDebuff("player", buffObj, "buff", "", nil),true))
		return true
	end
	
	function lazyHunter.bitParsers.aspectPack(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.aspectPack.codePattern)) then
			return false
		end
		local buffObj = lazyHunter.buffTable[lazyHunter.actions.aspectPack.code]
		table.insert(actions, lazyHunter.actions.aspectPack)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.CheckBuffOrDebuff("player", buffObj, "buff", "", nil),true))
		return true
	end
	
	function lazyHunter.bitParsers.aspectMonkey(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.aspectMonkey.codePattern)) then
			return false
		end
		local buffObj = lazyHunter.buffTable[lazyHunter.actions.aspectMonkey.code]
		table.insert(actions, lazyHunter.actions.aspectMonkey)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.CheckBuffOrDebuff("player", buffObj, "buff", "", nil),true))
		return true
	end
	
	function lazyHunter.bitParsers.aspectWild(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.aspectWild.codePattern)) then
			return false
		end
		local buffObj = lazyHunter.buffTable[lazyHunter.actions.aspectWild.code]
		table.insert(actions, lazyHunter.actions.aspectWild)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.CheckBuffOrDebuff("player", buffObj, "buff", "", nil),true))
		return true
	end
	
	function lazyHunter.bitParsers.beastLore(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.beastLore.codePattern)) then
			return false
		end
		table.insert(masks, lazyHunter.masks.HaveTarget)
		table.insert(actions, lazyHunter.actions.beastLore)
		return true
	end
	
	function lazyHunter.bitParsers.huntersMark(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.huntersMark.codePattern)) then
			return false
		end
		table.insert(masks, lazyHunter.masks.HaveTarget)
		table.insert(actions, lazyHunter.actions.huntersMark)
		return true
	end
	
	function lazyHunter.bitParsers.scorpid(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.scorpid.codePattern)) then
			return false
		end
		table.insert(actions, lazyHunter.actions.scorpid)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.IsImmune(lazyHunter.actions.scorpid.name), true))
		return true
	end
	
	function lazyHunter.bitParsers.serpent(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.serpent.codePattern)) then
			return false
		end
		table.insert(actions, lazyHunter.actions.serpent)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.IsImmune(lazyHunter.actions.serpent.name), true))
		return true
	end
	
	function lazyHunter.bitParsers.viper(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.viper.codePattern)) then
			return false
		end
		table.insert(actions, lazyHunter.actions.viper)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.IsImmune(lazyHunter.actions.viper.name), true))
		return true
	end
	
	function lazyHunter.bitParsers.wyvern(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.wyvern.codePattern)) then
			return false
		end
		table.insert(actions, lazyHunter.actions.wyvern)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.IsImmune(lazyHunter.actions.wyvern.name), true))
		return true
	end
	
	lazyHunter.pseudoActions.petDashDive = lazyHunter.PseudoAction:New("petDashDive", "Pet Dash/Dive", false)
	function lazyHunter.pseudoActions.petDashDive:Use()
		local sayNothingOverride = true
		if lazyHunter.actions.petDash:IsUsable(sayNothingOverride) then
			lazyHunter.actions.petDash:Use()
			elseif lazyHunter.actions.petDive:IsUsable(sayNothingOverride) then
			lazyHunter.actions.petDive:Use()
		end
		lazyHunter.recordAction(self.code)
		self.everyTimer = GetTime()
		self.nowAndEveryTimer = self.everyTimer
	end
	
	function lazyHunter.pseudoActions.petDashDive:IsUsable(sayNothing)
		local sayNothingOverride = true
		if lazyHunter.actions.petDash:IsUsable(sayNothingOverride) or lazyHunter.actions.petDive:IsUsable(sayNothingOverride) then
			return true
		end
		return false
	end
	
	function lazyHunter.bitParsers.petDashDive(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.pseudoActions.petDashDive.codePattern)) then
			return false
		end
		table.insert(actions, lazyHunter.pseudoActions.petDashDive)
		return true
	end
	
	function lazyHunter.bitParsers.call(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.call.codePattern)) then
			return false
		end
		table.insert(actions, lazyHunter.actions.call)
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.HasPet, true))
		return true
	end
	
	function lazyHunter.bitParsers.dismiss(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.dismiss.codePattern)) then
			return false
		end
		table.insert(actions, lazyHunter.actions.dismiss)
		table.insert(masks, lazyHunter.masks.HasPet)
		return true
	end
	
	function lazyHunter.bitParsers.petProwl(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.petProwl.codePattern)) then
			return false
			end
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.isPetProwling,true))
		table.insert(actions, lazyHunter.actions.petProwl)
		return true
	end
	
	
	function lazyHunter.actions.petUnprowl:IsUsable()
		local sayNothing = true
		if (not PetHasActionBar()) then
			if (not sayNothing) then
				lazyHunter.d(HUNTER_DONT_HAVE_PET_ACTION_BAR)
			end
			return false
		end
		
		if (self:GetSlot(sayNothing)) then
			return true
		end
		return false
	end
	
	function lazyHunter.bitParsers.petUnprowl(bit, actions, masks)
		if (not lazyHunter.rebit(bit, lazyHunter.actions.petUnprowl.codePattern)) then
			return false
		end
		table.insert(masks, lazyHunter.masks.isPetProwling)
		table.insert(actions, lazyHunter.actions.petUnprowl)
		return true
	end
	
	
	
	-- Simple Hunter specific masks
	-------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyHunter.masks.<functionName> instead of
	-- lazyHunter.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	function lazyHunter.masks.isPetProwling(sayNothing)
		local buffObj = lazyHunter.buffTable.petProwl
		return lazyHunter.masks.HasBuffOrDebuff("pet", "buff", buffObj.texture, buffObj.name, buffObj.body, sayNothing)
	end
	
	function lazyHunter.bitParsers.ifPetProwling(bit, actions, masks)
		if (not lazyHunter.rebit(bit, "^if(Not)?PetProwling$")) then
			return false
		end
		local negate = lazyHunter.negate1()
		table.insert(masks, lazyHunter.negWrapper(lazyHunter.masks.isPetProwling, negate))
		return true
	end
	
	
	lazyHunter.petMoods ={
		"unhappy",
		"content",
		"happy"
	}
	function lazyHunter.masks.PetMood(mood)
		return function(sayNothing)
			local happiness = GetPetHappiness()
			
			if happiness and (lazyHunter.petMoods[happiness] == mood) then
				return true
			end
			return false
		end
	end
	
	function lazyHunter.bitParsers.ifPetMood(bit, actions, masks)
		if (not lazyHunter.rebit(bit, "^if(Not)?PetMood=(.+)$")) then
			return false
		end
		local negate = lazyHunter.negate1()
		local moods = lazyHunter.match2
		
		table.insert(masks, lazyScript.masks.HasPet)
		local subMasks = {}
		for mood in string.gfind(moods, "[^,]+") do
			table.insert(subMasks, lazyScript.masks.PetMood(mood))
		end
		table.insert(masks, lazyScript.orWrapper(subMasks, negate))
		return true
	end
	
	
	
	-- Complex Hunter masks
	-----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyHunter.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	
	
	-- Hunter utility functions
	---------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	
	
	-- Custom AutoAttack
	--------------------
	-- Include any modifications to the autoAttack function. If this omitted, lazyHunter
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	function lazyHunter.CustomAutoAttackMode()
		-- Check if range or melee action is appropriate
		if not lazyHunter.autoShotSlot then
			lazyHunter.GetAutoShotSlot()
		end
		
		if UnitExists("target") and UnitCanAttack("player","target") then
			if lazyHunter.autoShotSlot then
				if (IsActionInRange(lazyHunter.autoShotSlot) == 1) then
					lazyHunter.d(HUNTER_INITIATING_AUTO_SHOT)
					lazyHunter.StartAutoShot()
					
					elseif (IsActionInRange(lazyHunter.autoShotSlot) == 0) and lazyHunter.masks.TargetInLongRange() then
					-- Auto-shot out of range, but still within 30 yards. Must be deadzone or melee.
					lazyHunter.d(HUNTER_INITIATING_AUTO_ATTACK)
					lazyHunter.StartAutoAttack()
				end
			end
		end
	end
	
	
	
	-- Custom command line arguments
	--------------------------------
	
	
	
	-- Custom minimap entries
	-------------------------
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	
	lazyHunter.defaultForms = {}
	
	lazyHunter.defaultForms.allPurpose = {
		"wingClip-ifNotTargetHasDebuff=wingClip-ifTargetInMeleeRange",
		"distract-ifPet<20%hp",
		"aspectHawk-ifNotHasBuff=aspectHawk",
		"huntersMark-ifNotTargetHasDebuff=huntersMark",
		"serpent-ifNotTargetHasDebuff=serpent",
		"arcane",
		"mongoose-ifTargetInMeleeRange",
		"raptor-ifTargetInMeleeRange"
	}
	
	lazyHunter.defaultForms.Melee = {
		"aspectMonkey-ifNotHasBuff=aspectMonkey",
		"wingClip-ifNotTargetHasDebuff=wingClip",
		"mongoose",
		"raptor"
	}
	
	lazyHunter.defaultForms.Range = {
		"distract-ifPet<20%hp",
		"aspectHawk-ifNotHasBuff=aspectHawk",
		"huntersMark-ifNotTargetHasDebuff=huntersMark-ifNotTargetInMeleeRange",
		"serpent-ifNotTargetIs=Stung",
		"arcane"
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
	function lazyHunter.CustomHelp()
		return [[
			<P>-if[Not]PetMood={happy,content,unhappy}</P>
			<P>-if[Not]PetProwling</P>
		]]
	end
	
end -- function lazyHunterLoad.LoadParseHunter()