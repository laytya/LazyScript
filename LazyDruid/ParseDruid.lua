lazyDruidLoad.metadata:updateRevisionFromKeyword("$Revision: 740 $")

-- The functions and data inside this block will not be defined unless the user is a DRUID.

function lazyDruidLoad.LoadParseDruid()
	
	-- Druid actions
	-----------------
	-- The lazyDruid.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	-- Cat
	lazyDruid.actions.bite              = lazyDruid.Action:New("bite",               "Ability_Druid_FerociousBite")
	lazyDruid.actions.claw              = lazyDruid.Action:New("claw",               "Ability_Druid_Rake")
	lazyDruid.actions.cower             = lazyDruid.Action:New("cower",              "Ability_Druid_Cower")
	lazyDruid.actions.dash              = lazyDruid.Action:New("dash",               "Ability_Druid_Dash")
	lazyDruid.actions.pounce            = lazyDruid.Action:New("pounce",             "Ability_Druid_SupriseAttack")
	lazyDruid.actions.prowl             = lazyDruid.Action:New("prowl",              "Ability_Ambush", nil, nil, true)
	lazyDruid.actions.rake              = lazyDruid.Action:New("rake",               "Ability_Druid_Disembowel")
	lazyDruid.actions.ravage            = lazyDruid.Action:New("ravage",             "Ability_Druid_Ravage")
	lazyDruid.actions.rip               = lazyDruid.Action:New("rip",                "Ability_GhoulFrenzy")
	lazyDruid.actions.shred             = lazyDruid.Action:New("shred",              "Spell_Shadow_VampiricAura")
	lazyDruid.actions.tigersFury        = lazyDruid.Action:New("tigersFury",         "Ability_Mount_JungleTiger", nil, false)
	lazyDruid.actions.trackHumanoids    = lazyDruid.Action:New("trackHumanoids",     "Ability_Tracking")
	
	-- Bear
	lazyDruid.actions.bash              = lazyDruid.Action:New("bash",               "Ability_Druid_Bash")
	lazyDruid.actions.challenge         = lazyDruid.Action:New("challenge",          "Ability_Druid_ChallangingRoar")
	lazyDruid.actions.charge            = lazyDruid.Action:New("charge",             "Ability_Hunter_Pet_Bear")
	lazyDruid.actions.demoralize        = lazyDruid.Action:New("demoralize",         "Ability_Druid_DemoralizingRoar")
	lazyDruid.actions.enrage            = lazyDruid.Action:New("enrage",             "Ability_Druid_Enrage")
	lazyDruid.actions.frenziedRegen     = lazyDruid.Action:New("frenziedRegen",      "Ability_BullRush")
	lazyDruid.actions.growl             = lazyDruid.Action:New("growl",              "Ability_Physical_Taunt")
	lazyDruid.actions.maul              = lazyDruid.Action:New("maul",               "Ability_Druid_Maul")
	lazyDruid.actions.swipe             = lazyDruid.Action:New("swipe",              "INV_Misc_MonsterClaw_03")
	
	-- General
	lazyDruid.actions.abolishPoison     = lazyDruid.Action:New("abolishPoison",      "Spell_Nature_NullifyPoison_02")
	lazyDruid.actions.barkskin          = lazyDruid.Action:New("barkskin",           "Spell_Nature_StoneClawTotem")
	lazyDruid.actions.curePoison        = lazyDruid.Action:New("curePoison",         "Spell_Nature_NullifyPoison")
	lazyDruid.actions.faerieFire        = lazyDruid.Action:New("faerieFire",         "Spell_Nature_FaerieFire", nil, nil, true)
	lazyDruid.actions.feralFire         = lazyDruid.Action:New("feralFire",          "Spell_Nature_FaerieFire", nil, nil, true)
	lazyDruid.actions.gotw              = lazyDruid.Action:New("gotw",               "Spell_Nature_Regeneration", nil, nil, true)
	lazyDruid.actions.grasp             = lazyDruid.Action:New("grasp",              "Spell_Nature_NaturesWrath")
	lazyDruid.actions.healingTouch      = lazyDruid.Action:New("healingTouch",       "Spell_Nature_HealingTouch")
	lazyDruid.actions.hibernate         = lazyDruid.Action:New("hibernate",          "Spell_Nature_Sleep", nil, nil, true)
	lazyDruid.actions.hurricane         = lazyDruid.Action:New("hurricane",          "Spell_Nature_Cyclone")
	lazyDruid.actions.innervate         = lazyDruid.Action:New("innervate",          "Spell_Nature_Lightning")
	lazyDruid.actions.moonfire          = lazyDruid.Action:New("moonfire",           "Spell_Nature_StarFall")
	lazyDruid.actions.motw              = lazyDruid.Action:New("motw",               "Spell_Nature_Regeneration", nil, nil, true)
	lazyDruid.actions.ns                = lazyDruid.Action:New("ns",                 "Spell_Nature_RavenForm")
	lazyDruid.actions.ooc               = lazyDruid.Action:New("ooc",                "Spell_Nature_CrystalBall")
	lazyDruid.actions.rebirth           = lazyDruid.Action:New("rebirth",            "Spell_Nature_Reincarnation")
	lazyDruid.actions.regrowth          = lazyDruid.Action:New("regrowth",           "Spell_Nature_ResistNature")
	lazyDruid.actions.rejuv             = lazyDruid.Action:New("rejuv",              "Spell_Nature_Rejuvenation")
	lazyDruid.actions.removeCurse       = lazyDruid.Action:New("removeCurse",        "Spell_Holy_RemoveCurse")
	lazyDruid.actions.roots             = lazyDruid.Action:New("roots",              "Spell_Nature_StrangleVines")
	lazyDruid.actions.soothe            = lazyDruid.Action:New("soothe",             "Ability_Hunter_BeastSoothe")
	lazyDruid.actions.starfire          = lazyDruid.Action:New("starfire",           "Spell_Arcane_StarFire")
	lazyDruid.actions.swarm             = lazyDruid.Action:New("swarm",              "Spell_Nature_InsectSwarm")
	lazyDruid.actions.swiftmend         = lazyDruid.Action:New("swiftmend",          "INV_Relics_IdolofRejuvenation")
	lazyDruid.actions.teleMoonglade     = lazyDruid.Action:New("teleMoonglade",      "Spell_Arcane_TeleportMoonglade")
	lazyDruid.actions.thorns            = lazyDruid.Action:New("thorns",             "Spell_Nature_Thorns")
	lazyDruid.actions.tranquility       = lazyDruid.Action:New("tranquility",        "Spell_Nature_Tranquility")
	lazyDruid.actions.wrath             = lazyDruid.Action:New("wrath",              "Spell_Nature_AbolishMagic")
	
	-- Druid tracking abilities
	lazyDruid.trackers.humanoids        = lazyDruid.Tracker:New("trackHumanoids",    "Ability_Tracking")
	
	-- Druid shapeshift forms
	lazyDruid.shapeshift.aquatic     = lazyDruid.ShapeshiftForm:New("aquatic",       "Ability_Druid_AquaticForm")
	lazyDruid.shapeshift.bear        = lazyDruid.ShapeshiftForm:New("bear",          "Ability_Racial_BearForm")
	lazyDruid.shapeshift.cat         = lazyDruid.ShapeshiftForm:New("cat",           "Ability_Druid_CatForm")
	lazyDruid.shapeshift.moonkin     = lazyDruid.ShapeshiftForm:New("moonkin",       "Spell_Nature_ForceOfNature")
	lazyDruid.shapeshift.travel      = lazyDruid.ShapeshiftForm:New("travel",        "Ability_Druid_TravelForm")
	lazyDruid.pseudoActions.caster   = lazyDruid.PseudoAction:New("caster",          "Caster")
	
	
	
	
	-- Special Druid actions
	-------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyDruid.comboActions.<actionName> or lazyDruid.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	function lazyDruid.bitParsers.growl(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.actions.growl.codePattern)) then
			return false
		end
		table.insert(actions, lazyDruid.actions.growl)
		table.insert(masks, lazyDruid.masks.TargetHasTarget)
		table.insert(masks, lazyDruid.negWrapper(lazyDruid.masks.IsTargetOfTarget,true))
		return true
	end
	
	function lazyDruid.bitParsers.feralFire(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.actions.feralFire.codePattern)) then
			return false
		end
		table.insert(actions, lazyDruid.actions.feralFire)
		table.insert(masks, lazyDruid.masks.HaveTarget)
		return true
	end
	
	function lazyDruid.bitParsers.prowl(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.actions.prowl.codePattern)) then
			return false
		end
		table.insert(actions, lazyDruid.actions.prowl)
		table.insert(masks, lazyDruid.negWrapper(lazyDruid.masks.IsProwling, true))
		return true
	end
	
	-- Needs a group
	function lazyDruid.bitParsers.cower(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.actions.cower.codePattern)) then
			return false
		end
		table.insert(actions, lazyDruid.actions.cower)
		table.insert(masks, lazyDruid.masks.PlayerInGroup)
		return true
	end
	
	function lazyDruid.bitParsers.tranquility(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.actions.tranquility.codePattern)) then
			return false
		end
		table.insert(actions, lazyDruid.actions.tranquility)
		table.insert(masks, lazyDruid.masks.PlayerInGroup)
		return true
	end
	
	-- Tracking function
	function lazyDruid.bitParsers.trackHumanoids(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.actions.trackHumanoids.codePattern)) then
			return false
		end
		table.insert(actions, lazyDruid.actions.trackHumanoids)
		table.insert(masks, lazyDruid.negWrapper(lazyDruid.masks.isTracking(lazyDruid.trackers.humanoids), true))
		return true
	end
	
	-- Shapeshift actions
	function lazyDruid.bitParsers.aquatic(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.shapeshift.aquatic.codePattern)) then
			return false
		end
		
		table.insert(actions, lazyDruid.shapeshift.aquatic)
		return true
	end
	
	function lazyDruid.bitParsers.bear(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.shapeshift.bear.codePattern)) then
			return false
		end
		
		table.insert(actions, lazyDruid.shapeshift.bear)
		return true
	end
	
	function lazyDruid.bitParsers.cat(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.shapeshift.cat.codePattern)) then
			return false
		end
		
		table.insert(actions, lazyDruid.shapeshift.cat)
		return true
	end
	
	function lazyDruid.bitParsers.moonkin(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.shapeshift.moonkin.codePattern)) then
			return false
		end
		
		table.insert(actions, lazyDruid.shapeshift.moonkin)
		return true
	end
	
	function lazyDruid.bitParsers.travel(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.shapeshift.travel.codePattern)) then
			return false
		end
		
		table.insert(actions, lazyDruid.shapeshift.travel)
		return true
	end
	
	function lazyDruid.pseudoActions.caster:Use()
		local activeIndex = lazyDruid.FindActiveShapeshift()
		if (activeIndex ~= nil) then
			CastShapeshiftForm(activeIndex)
			lazyDruid.recordAction(self.code)
			self.everyTimer = GetTime()
			self.nowAndEveryTimer = self.everyTimer
		end
	end
	
	function lazyDruid.pseudoActions.caster:IsUsable(sayNothing)
		local activeIndex = lazyDruid.FindActiveShapeshift()
		if (activeIndex ~= nil) then
			return true
		end
		-- You're already in caster form
		return false
	end
	
	function lazyDruid.bitParsers.caster(bit, actions, masks)
		if (not lazyDruid.rebit(bit, lazyDruid.pseudoActions.caster.codePattern)) then
			return false
		end
		table.insert(actions, lazyDruid.pseudoActions.caster)
		return true
	end
	
	
	-- Simple Druid specific masks
	-------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyDruid.masks.<functionName> instead of
	-- lazyDruid.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	
	-- if you don't bite now, will you have time for 2 ticks before the target dies?
	-- we determine the rate of damage, and estimate when the target will be dead
	-- then we look at the last tick, and add 4 seconds, and see if that's before he'll die.
	function lazyDruid.masks.IsLastChance(fudgeFactor)
		return function(sayNothing)
			-- MobInfo-2 required
			if (not MobHealth_GetTargetCurHP) then
				return false
			end
			if (GetComboPoints() == 0 or not UnitName("target") or UnitHealth("target") == 0) then
				return false
			end
			
			local m, secondsTilDeath = lazyScript.deathstimator.timeToDeath()
			
			if (not secondsTilDeath) then
				return false
			end
			
			-- now, we know when he'll die.
			-- look at the last tick, and add 4 seconds (and a 1/4s buffer), and see
			-- if that's before he'll die.
			-- Also consider the player's current energy:
			-- Maybe we won't need 2 ticks... to be really smart, we'd need to know what attack
			-- the player will use if he doesn't bite right now... well, the maximum attack is
			-- shred (60), but more likely a claw (40-45).
			-- Okay, for simplicity let's just assume the player will claw (40).
			local ticksNeeded = 2
			local currentEnergy = lazyDruid.masks.GetUnitMana("player", false, false, sayNothing)
			-- 35 (Bite) + 40 (claw) - 20 (regen) = 55
			if (currentEnergy >= 55) then
				ticksNeeded = 1
				-- 35 (Bite) + 40 (claw) = 75
				elseif (currentEnergy >= 75) then
				ticksNeeded = 0
			end
			local whenTicks = lazyDruid.lastTickTime + (ticksNeeded * 2)
			
			local isLastChance
			if ((whenTicks + fudgeFactor) > (GetTime() + secondsTilDeath)) then
				isLastChance = true
				else
				isLastChance = false
			end
			
			if (not sayNothing and lazyDruid.perPlayerConf.debug) then
				local msg = DRUID_DEAD_IN..
				string.format("%.1f", secondsTilDeath)..DRUID_SEC
				if (isLastChance) then
					msg = msg..DRUID_BITE_NOW
				end
				msg = msg.."."
				lazyDruid.d(msg)
			end
			
			return isLastChance
		end
	end
	
	function lazyDruid.bitParsers.ifLastChance(bit, actions, masks)
		if (not lazyDruid.rebit(bit, "^if(Not)?LastChance(Plus)?([%d%.]+s)?$")) then
			return false
		end
		local negate = lazyDruid.negate1()
		local fudgeFactor = lazyScript.match3
		if fudgeFactor ~= nil and fudgeFactor ~= "" then
			fudgeFactor = tonumber(string.sub(fudgeFactor, 1, -2))
			if not fudgeFactor then
				lazyScript.p(DRUID_NOT_VALID_NUMBER..lazyScript.match3)
			end
			else
			fudgeFactor = 0.25
		end
		
		table.insert(masks, lazyDruid.negWrapper(lazyDruid.masks.IsLastChance(fudgeFactor), negate))
		return true
	end
	
	
	function lazyDruid.masks.IsProwling(sayNothing)
		local buffObj = lazyDruid.buffTable.prowl
		return lazyDruid.masks.HasBuffOrDebuff("player", "buff", buffObj.texture, buffObj.localeName, nil, sayNothing)
	end
	
	function lazyDruid.bitParsers.ifProwling(bit, actions, masks)
		if (not lazyDruid.rebit(bit, "^if(Not)?Prowling$")) then
			return false
		end
		local negate = lazyDruid.negate1()
		table.insert(masks, lazyDruid.negWrapper(lazyDruid.masks.IsProwling, negate))
		return true
	end
	
	
	-- Complex Druid masks
	-----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyDruid.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	function lazyDruid.masks.IsBiteKillShot(goalPct)
		return function(sayNothing)
			local cp = GetComboPoints()
			if (cp == 0) then
				return false
			end
			
			local hp = lazyDruid.masks.GetUnitHealth("target", false, false, sayNothing)
			
			if not hp then
				return false
			end
			
			-- adjust hp for goalPct
			if (goalPct ~= 100) then
				hp = hp * (goalPct / 100)
			end
			
			local biteDamage = lazyDruid.masks.CalculateObservedBiteDamage(cp, sayNothing)
			
			-- adjust for Tiger's Fury, if we're asked to, or if active
			-- TBD
			
			--lazyDruid.d("Adjusted bite dmg: "..origBiteDamage.." vs "..biteDamage)
			--lazyDruid.d("Avg bite dmg with "..cp.." combo points is "..biteDamage..", vs: "..hp)
			if (hp <= biteDamage) then
				if (cp < 5) then
					if (not sayNothing) then
						lazyDruid.d(DRUID_EARLY_BITE)
					end
				end
				return true
				else
				return false
			end
		end
	end
	
	function lazyDruid.bitParsers.ifKillShot(bit, actions, masks)
		if (not lazyDruid.rebit(bit, "^ifKillShot=?(%d?%d?%d?)%%?$")) then
			return false
		end
		local goalPct = 100
		local lastAction = actions[table.getn(actions)]
		if (bit == "ifKillShot" and lastAction ~= lazyDruid.actions.bite) then
			lazyDruid.p(DRUID_ONLY_WITH_BITE)
			return nil
		end
		if (lazyDruid.match1 ~= "") then
			goalPct = tonumber(lazyDruid.match1)
		end
		table.insert(masks, lazyDruid.masks.IsBiteKillShot(goalPct))
		
		return true
	end
	
	
	function lazyDruid.masks.ComboPoints(cp, gtLtEq)
		cp = tonumber(cp)
		return function()
			if (not gtLtEq or gtLtEq == "") then
				return (GetComboPoints() >= cp)
			end
			if (gtLtEq == ">") then
				return (GetComboPoints() > cp)
				elseif (gtLtEq == "=") then
				return (GetComboPoints() == cp)
				else
				return (GetComboPoints() < cp)
			end
		end
	end
	
	function lazyDruid.bitParsers.ifComboPointCheck(bit, actions, masks)
		if (not lazyDruid.rebit(bit, "^if([<=>]?)(%d+)cp$") and not lazyDruid.rebit(bit, "^([<=>]?)(%d+)cp$")) then
			return false
		end
		local gtLtEq = lazyDruid.match1
		local val = tonumber(lazyDruid.match2)
		table.insert(masks, lazyDruid.masks.ComboPoints(val, gtLtEq))
		return true
	end
	
	
	-- Druid utility functions
	---------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	function lazyDruid.masks.CalculateBaseBiteDamage(cp, sayNothing)
		-- find bite rank
		-- lookup damage cp using damage table
		local rank = lazyDruid.actions.bite:GetRank()
		if (rank == 0) then
			return false
		end
		local biteDamage = lazyDruid.biteDamage[rank][cp]
		if (not biteDamage) then
			if (not sayNothing) then
				lazyDruid.p(DRUID_BITE_LOOKUP_FILED)
			end
			return false
		end
		
		-- adjust for extra energy
		local energy = UnitMana("player")
		local ooc = lazyDruid.buffTable.ooc
		if (not lazyDruid.masks.HasBuffOrDebuff("player", "buff", ooc.texture, ooc.name)) then
			energy = energy - 35 -- minus Bite cost unless Omen of Clarity is up
		end
		local energyDamage = 0
		if (rank == 1) then
			energyDamage = energy
			elseif (rank == 2) then
			energyDamage = (energy * 1.5)
			elseif (rank == 3) then
			energyDamage = (energy * 2)
			elseif (rank == 4) then
			energyDamage = (energy * 2.5)
			elseif (rank > 4) then
			energyDamage = (energy * 2.7)
		end
		
		--local autoDamage = (lazyDruid.lastAutoHit + lazyDruid.lastAutoHit)
		--biteDamage = biteDamage + energyDamage + autoDamage
		biteDamage = biteDamage + energyDamage
		return biteDamage
		
	end
	
	
	function lazyDruid.masks.CalculateObservedBiteDamage(cp, sayNothing)
		if (lazyDruid.perPlayerConf.useBiteTracking and lazyDruid.bite) then
			local observedDamage, observedCt = lazyDruid.bite.GetBiteTrackingInfo(cp)
			if (observedCt > 0) then
				if (not sayNothing) then
					lazyDruid.d(DRUID_CALCULATE_BITE_DMG_1..cp..DRUID_CALCULATE_BITE_DMG_2..observedDamage)
				end
				return observedDamage
			end
		end
		
		local dmg = lazyDruid.masks.CalculateBaseBiteDamage(cp, sayNothing)
		if (not sayNothing) then
			lazyDruid.d(DRUID_CALCULATE_BITE_DMG_1..cp..DRUID_CALCULATE_BITE_DMG_2..dmg)
		end
		return dmg
	end
	
	
	
	-- Custom AutoAttack
	--------------------
	-- Finally, include any modifications to the autoAttack function. If this omitted, lazyDruid
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	function lazyDruid.CustomAutoAttackMode()
		if (not lazyDruid.masks.IsProwling()) then
			lazyDruid.StartAutoAttack()
		end
		
	end
	
	
	
	-- Custom command line arguments
	--------------------------------
	function lazyDruid.CustomCommandLineHelp()
		if lazyDruid.bite then
			lazyDruid.chat(SLASH_LAZYSCRIPT1..DRUID_CMD_DESCRIPTION_1)
			lazyDruid.chat(SLASH_LAZYSCRIPT1..DRUID_CMD_DESCRIPTION_2)
			lazyDruid.chat(SLASH_LAZYSCRIPT1..DRUID_CMD_DESCRIPTION_3)
		end
	end
	
	function lazyDruid.CustomCommandLineArgs(cmd, args)
		if (cmd == "resetBiteStats") then
			if lazyDruid.bite then
				lazyDruid.bite.ResetBiteTracking()
			end
			
			elseif (cmd == "useBiteTracking") then
			if (lazyDruid.perPlayerConf.useBiteTracking) then
				lazyDruid.perPlayerConf.useBiteTracking = false
				lazyDruid.p(DRUID_FEROCIOUS_BITE_NO_LONGER_USING)
				else
				lazyDruid.perPlayerConf.useBiteTracking = true
				lazyDruid.p(DRUID_FEROCIOUS_BITE_NOW_USING)
			end
			
			elseif (cmd == "trackBiteCrits") then
			if (lazyDruid.perPlayerConf.trackBiteCrits) then
				lazyDruid.perPlayerConf.trackBiteCrits = false
				lazyDruid.p(DRUID_FEROCIOUS_BITE_NO_LONGER_TRACKING)
				else
				lazyDruid.perPlayerConf.trackBiteCrits = true
				lazyDruid.p(DRUID_FEROCIOUS_BITE_NOW_TRACKING)
			end
			else
			return false
		end
		return true
	end
	
	
	
	-- Custom minimap entries
	-------------------------
	function lazyDruid.CustomMenu()
		if lazyDruid.bite then
			if (UIDROPDOWNMENU_MENU_LEVEL == 1) then
				
				info = {}
				info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT
				info.value = "Ferocious Bites"
				info.keepShownOnClick = 1
				info.hasArrow = 1
				UIDropDownMenu_AddButton(info)
				
				elseif (UIDROPDOWNMENU_MENU_LEVEL == 2) then
				if (UIDROPDOWNMENU_MENU_VALUE == "Ferocious Bites") then
					
					local info = {}
					info.isTitle = 1
					info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT_TITLE
					if (lazyDruid.perPlayerConf.useBiteTracking) then
						info.checked = true
					end
					info.keepShownOnClick = 1
					info.func = lazyDruid.CustomMenu_ClickSubFunction("Use Ferocious Bite Tracking")
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT_INC_CRITS
					if (lazyDruid.perPlayerConf.trackBiteCrits) then
						info.checked = true
					end
					info.keepShownOnClick = 1
					info.func = lazyDruid.CustomMenu_ClickSubFunction("Track Ferocious Bite Crits")
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.isTitle = 1
					info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					for idx, i in ipairs({10, 25, 50, 100}) do
						local info = {}
						info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE_LAST..i..DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE_BITES
						if (lazyDruid.perPlayerConf.biteSample == i) then
							info.checked = true
						end
						info.keepShownOnClick = 1
						info.func = lazyDruid.CustomMenu_ClickSubFunction("Ferocious Bite Sample "..i)
						UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					end
					
					local info = {}
					info.isTitle = 1
					info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.isTitle = 1
					info.text = DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_FORMAT
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.isTitle = 1
					
					for cp = 1, 5 do
						local sayNothing = true
						local expectedDamage = lazyDruid.masks.CalculateBaseBiteDamage(cp, sayNothing)
						if (not expectedDamage) then
							break
						end
						local observedDamage, observedCt = lazyDruid.bite.GetBiteTrackingInfo(cp)
						local ratio = observedDamage / expectedDamage
						info.text = cp..DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_OUTPUT_CP..
						string.format("%.1f", observedDamage)..
						"/"..string.format("%.1f", expectedDamage)..
						" => "..string.format("%.1f", (ratio * 100)).."%"..
						" ("..observedCt..DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_OUTPUT_SEEN
						
						-- TBD: tooltip
						--info.tooltipTitle = "Eviscerate Stats ("..i.."cp)"
						--local text = observedCt.." Eviscerates observed."
						--text = text.."\nAveraging "..observedDamage.." damage"
						--text = text.."\nThe documented "..observedDamage.." damage"
						--info.tooltipText = text
						
						UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					end
					
					local info = {}
					info.text = DRUID_CUSTOM_MENU_FER_BITE_RESET
					info.func = lazyDruid.CustomMenu_ClickSubFunction("Reset Ferocious Bite Stats")
					-- TBD:
					--info.keepShownOnClick = 1
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
				end
				
				elseif (UIDROPDOWNMENU_MENU_LEVEL == 3) then
				-- Do nothing for now
			end
		end
	end
	
	function lazyDruid.CustomMenu_ClickSubFunction(op)
		if lazyDruid.bite then
			return function()
				if (op == "Reset Ferocious Bite Stats") then
					lazyDruid.SlashCommand("resetBiteStats")
					elseif (op == "Use Ferocious Bite Tracking") then
					lazyDruid.SlashCommand("useBiteTracking")
					elseif (op == "Track Ferocious Bite Crits") then
					lazyDruid.SlashCommand("trackBiteCrits")
					elseif (op == "Ferocious Bite Sample 10") then
					lazyDruid.perPlayerConf.biteSample = 10
					lazyDruid.mm.RefreshMenu("Ferocious Bites")
					elseif (op == "Ferocious Bite Sample 25") then
					lazyDruid.perPlayerConf.biteSample = 25
					lazyDruid.mm.RefreshMenu("Ferocious Bites")
					elseif (op == "Ferocious Bite Sample 50") then
					lazyDruid.perPlayerConf.biteSample = 50
					lazyDruid.mm.RefreshMenu("Ferocious Bites")
					elseif (op == "Ferocious Bite Sample 100") then
					lazyDruid.perPlayerConf.biteSample = 100
					lazyDruid.mm.RefreshMenu("Ferocious Bite")
				end
			end
		end
	end
	
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	
	lazyDruid.defaultForms = {}
	
	lazyDruid.defaultForms.allPurpose = {
		"-- Uncomment to use feral faerie fire if you have it",
		"--feralFire-ifTargetInMeleeRange-ifNotTargetHasDebuff=faerieFire",
		"stopAll-ifTargetIs=CCd",
		"-- Cat Form",
		"bite-ifLastChance-ifInGroup",
		"bite-ifKillShot",
		"cower-ifTargetOfTarget",
		"rake-ifNotTargetHasDebuff=rake",
		"rip-=3cp-ifNotTargetHasDebuff=rip",
		"bite-5cp",
		"claw",
		"-- Bear Form",
		"-- Hold down shift for tank mode",
		"--charge-ifNotTargetInMeleeRange-ifShiftDown",
		"growl-ifShiftDown",
		"demoralize-ifNotTargetHasDebuff=demoralize",
		"swipe-ifShiftDown",
		"maul"
	}
	
	
	lazyDruid.defaultForms.Tank = {
		"-- Uncomment to use feral faerie fire if you have it",
		"--feralFire-ifTargetInMeleeRange-ifNotTargetHasDebuff=faerieFire",
		"stopAll-ifTargetIs=CCd",
		"-- Bear Form",
		"-- Hold down shift for tank mode",
		"--charge-ifNotTargetInMeleeRange-ifShiftDown",
		"growl",
		"demoralize-ifNotTargetHasDebuff=demoralize",
		"swipe-if>20rage-ifShiftDown",
		"maul"
	}
	
	
	lazyDruid.defaultForms.MsSmolderweb = {
		"starfire-ifTarget=100%hp",
		"-- Network/server lag delays the debuff appearing on the mob",
		"-- Let's use the history instead",
		"hibernate-ifHistory=1=starfire",
		"starfire-ifTargetIs=CCd",
		"-- Onoes! Hibernate broke early",
		"hibernate"
	}
	
	
	-- Custom data
	---------------
	-- Place any other tables of data unique to the class here.
	lazyDruid.biteDamage = {
		{ (60+76)/2,   (106+122)/2, (152+168)/2, (198+214)/2, (244+260)/2},
		{ (91+115)/2,  (162+186)/2, (233+257)/2, (304+328)/2, (375+399)/2},
		{ (136+176)/2, (136+176)/2, (348+388)/2, (454+494)/2, (560+600)/2},
		{ (190+240)/2, (335+385)/2, (480+530)/2, (625+675)/2, (770+820)/2},
		{ (199+259)/2, (346+406)/2, (493+553)/2, (640+700)/2, (787+847)/2},
	}
	
	-- Custom initialization
	------------------------
	lazyDruid.customPerPlayerDefaults = {
		["biteTracker"] = { {0,0}, {0,0}, {0,0}, {0,0}, {0,0} },
		["biteSample"] = 25,
		["trackBiteCrits"] = false,
		["useBiteTracking"] = true,
	}
	
	-- Custom help text
	-------------------
	-- Place any help text that pertains to class specific masks here.
	-- Because of formatting restrictions we place this last so that it does not mess up the indentation.
	function lazyDruid.CustomHelp()
		return [[
			<P>-if[Not]Prowling</P>
			<P>-if[Not]Tracking=Humanoids</P>
		]]
	end
	
end -- lazyDruidLoad.LoadParseDruid()