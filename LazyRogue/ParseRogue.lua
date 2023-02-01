lazyRogueLoad.metadata:updateRevisionFromKeyword("$Revision: 740 $")

-- The functions and data inside this block will not be defined unless the user is a ROGUE.

function lazyRogueLoad.LoadParseRogue()
	
	-- Rogue actions
	----------------
	-- The lazyRogue.actions.<name> must match the short name so that we only need additional
	-- bitParsing functions for special cases.
	
	
	lazyRogue.actions.adrenaline       = lazyRogue.Action:New("adrenaline",       "Spell_Shadow_ShadowWordDominate")
	lazyRogue.actions.ambush           = lazyRogue.Action:New("ambush",           "Ability_Rogue_Ambush")
	lazyRogue.actions.bladeFlurry      = lazyRogue.Action:New("bladeFlurry",      "Ability_Warrior_PunishingBlow")
	lazyRogue.actions.blind            = lazyRogue.Action:New("blind",            "Spell_Shadow_MindSteal", true)
	lazyRogue.actions.bs               = lazyRogue.Action:New("bs",               "Ability_BackStab")
	lazyRogue.actions.cs               = lazyRogue.Action:New("cs",               "Ability_CheapShot", true)
	lazyRogue.actions.coldBlood        = lazyRogue.Action:New("coldBlood",        "Spell_Ice_Lament", nil, false)
	lazyRogue.actions.distract         = lazyRogue.Action:New("distract",         "Ability_Rogue_Distract")
	lazyRogue.actions.evasion          = lazyRogue.Action:New("evasion",          "Spell_Shadow_ShadowWard")
	lazyRogue.actions.evisc            = lazyRogue.Action:New("evisc",            "Ability_Rogue_Eviscerate")
	lazyRogue.actions.expose           = lazyRogue.Action:New("expose",           "Ability_Warrior_Riposte")
	lazyRogue.actions.feint            = lazyRogue.Action:New("feint",            "Ability_Rogue_Feint")
	lazyRogue.actions.garrote          = lazyRogue.Action:New("garrote",          "Ability_Rogue_Garrote")
	lazyRogue.actions.ghostly          = lazyRogue.Action:New("ghostly",          "Spell_Shadow_Curse")
	lazyRogue.actions.gouge            = lazyRogue.Action:New("gouge",            "Ability_Gouge", true)
	lazyRogue.actions.hemo             = lazyRogue.Action:New("hemo",             "Spell_Shadow_LifeDrain")
	lazyRogue.actions.kick             = lazyRogue.Action:New("kick",             "Ability_Kick", true)
	lazyRogue.actions.ks               = lazyRogue.Action:New("ks",               "Ability_Rogue_KidneyShot", true)
	lazyRogue.actions.pickPocket       = lazyRogue.Action:New("pickPocket",       "INV_Misc_Bag_11")
	lazyRogue.actions.premeditation    = lazyRogue.Action:New("premeditation",    "Spell_Shadow_Possession", nil, false)
	lazyRogue.actions.preparation      = lazyRogue.Action:New("preparation",      "Spell_Shadow_AntiShadow")
	lazyRogue.actions.riposte          = lazyRogue.Action:New("riposte",          "Ability_Warrior_Challange")
	lazyRogue.actions.rupture          = lazyRogue.Action:New("rupture",          "Ability_Rogue_Rupture")
	lazyRogue.actions.sap              = lazyRogue.Action:New("sap",              "Ability_Sap")
	lazyRogue.actions.snd              = lazyRogue.Action:New("snd",              "Ability_Rogue_SliceDice")
	lazyRogue.actions.sprint           = lazyRogue.Action:New("sprint",           "Ability_Rogue_Sprint")
	lazyRogue.actions.ss               = lazyRogue.Action:New("ss",               "Spell_Shadow_RitualOfSacrifice")
	lazyRogue.actions.stealth          = lazyRogue.Action:New("stealth",          "Ability_Stealth")
	lazyRogue.actions.vanish           = lazyRogue.Action:New("vanish",           "Ability_Vanish")
	
	
	
	-- Special Rogue actions
	------------------------
	-- Only include actions that require additional implicit conditions or non-standard action entries
	-- e.g. lazyRogue.comboActions.<actionName> or lazyRogue.items.<itemName>, otherwise an entry in
	-- the list above should be sufficient.
	
	lazyRogue.comboActions.cbAmbush = lazyRogue.ComboAction:New("cbAmbush", "CB+Ambush", lazyRogue.actions.coldBlood, lazyRogue.actions.ambush)
	lazyRogue.comboActions.cbEvisc = lazyRogue.ComboAction:New("cbEvisc", "CB+Eviscerate", lazyRogue.actions.coldBlood, lazyRogue.actions.evisc)
	
	lazyRogue.items.tea = lazyRogue.Item:New("tea", "Thistle Tea", 7676)
	
	function lazyRogue.bitParsers.ambush(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.actions.ambush.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.actions.ambush)
		table.insert(masks, lazyRogue.masks.UnitAlive("target"))
		return true
	end
	
	function lazyRogue.bitParsers.backstab(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.actions.bs.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.actions.bs)
		table.insert(masks, lazyRogue.masks.UnitAlive("target"))
		return true
	end
	
	function lazyRogue.bitParsers.feint(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.actions.feint.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.actions.feint)
		table.insert(masks, lazyRogue.masks.PlayerInGroup)
		return true
	end
	
	function lazyRogue.bitParsers.garrote(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.actions.garrote.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.actions.garrote)
		table.insert(masks, lazyRogue.masks.UnitAlive("target"))
		return true
	end
	
	function lazyRogue.bitParsers.gouge(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.actions.gouge.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.actions.gouge)
		table.insert(masks, lazyRogue.masks.UnitAlive("target"))
		return true
	end
	
	function lazyRogue.bitParsers.kick(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.actions.kick.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.actions.kick)
		return true
	end
	
	function lazyRogue.bitParsers.Stealth(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.actions.stealth.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.actions.stealth)
		table.insert(masks, lazyRogue.negWrapper(lazyRogue.masks.IsStealthed, true))
		return true
	end
	
	function lazyRogue.bitParsers.cbAmbush(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.comboActions.cbAmbush.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.comboActions.cbAmbush)
		table.insert(masks, lazyRogue.masks.UnitAlive("target"))
		return true
	end
	
	function lazyRogue.bitParsers.cbEvisc(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.comboActions.cbEvisc.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.comboActions.cbEvisc)
		return true
	end
	
	function lazyRogue.bitParsers.tea(bit, actions, masks)
		if (not lazyRogue.rebit(bit, lazyRogue.items.tea.codePattern)) then
			return false
		end
		table.insert(actions, lazyRogue.items.tea)
		return true
	end
	
	function lazyRogue.bitParsers.applyPoison(bit, actions, masks)
		if (not lazyRogue.rebit(bit, "^applyPoison(%a+)=(.+)$")) then
			return false
		end
		
		if (lazyRogue.match1 ~= "MainHand" and lazyRogue.match1 ~= "OffHand") then
			lazyRogue.p(ROGUE_APPLY_POISON_ONLY_MAIN_OFF_HAND..lazyRogue.match1)
			return nil
		end
		
		local equipSlot = lazyRogue.match1
		local weaponBuffName = lazyRogue.match2
		local key = equipSlot..":"..weaponBuffName
		if (not lazyRogue.applyWeaponBuffActions[key]) then
			lazyRogue.applyWeaponBuffActions[key] = lazyRogue.ApplyWeaponBuff:New("applyWeaponBuff"..equipSlot, weaponBuffName, equipSlot)
		end
		table.insert(actions, lazyRogue.applyWeaponBuffActions[key])
		return true
	end
	
	function lazyRogue.bitParsers.ifPoisoned(bit, actions, masks)
		if (not lazyRogue.rebit(bit, "^if(Not)?Poisoned=(%a+)$")) then
			return false
		end
		if (lazyRogue.match2 ~= "MainHand" and lazyRogue.match2 ~= "OffHand") then
			lazyScript.p(ROGUE_IF_POISONED_ONLY_MAIN_OFF_HAND..lazyScript.match2)
			return nil
		end
		local negate = lazyRogue.negate1()
		local weapon = lazyRogue.match2
		table.insert(masks, lazyRogue.negWrapper(lazyRogue.masks.IsWeaponBuffed(weapon), negate))
		
		return true
	end
	
	
	
	
	-- Simple Rogue specific masks
	------------------------------
	-- These masks do not require parameters and return the check directly so we can omit the function
	--  call and just refer to the mask by name i.e. lazyRogue.masks.<functionName> instead of
	-- lazyRogue.masks.<functionName>().
	-- I try to keep the mask and the bitParser that refers to said mask together for ease
	-- of reading.
	
	function lazyRogue.masks.IsStealthed()
		local icon, name, active, castable = GetShapeshiftFormInfo(1)
		return (active == 1)
	end
	
	function lazyRogue.bitParsers.ifStealthed(bit, actions, masks)
		if (not lazyRogue.rebit(bit, "^if(Not)?Stealthed$")) then
			return false
		end
		local negate = lazyRogue.negate1()
		table.insert(masks, lazyRogue.negWrapper(lazyRogue.masks.IsStealthed, negate))
		return true
	end
	
	
	-- if you don't eviscerate now, will you have time for 2 ticks before the target dies?
	-- we determine the rate of damage, and estimate when the target will be dead
	-- then we look at the last tick, and add 4 seconds, and see if that's before he'll die.
	function lazyRogue.masks.IsLastChance(fudgeFactor)
		return function(sayNothing)
			-- MobInfo-2 required
			--[[
			if (not MobHealth_GetTargetCurHP) then
				return false
			end
			]]
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
			-- the player will use if he doesn't evisc right now... well, the maximum attack is
			-- backstab (60), but more likely a SS (40-45).
			-- Okay, for simplicity let's just assume the player will SS (40).
			local ticksNeeded = 2
			local currentEnergy = lazyRogue.masks.GetUnitMana("player", false, false, sayNothing)
			-- 35 (evisc) + 40 (ss) - 20 (regen) = 55
			if (currentEnergy >= 55) then
				ticksNeeded = 1
				-- 35 (evisc) + 40 (ss) = 75
				elseif (currentEnergy >= 75) then
				ticksNeeded = 0
			end
			local whenTicks = lazyRogue.lastTickTime + (ticksNeeded * 2)
			
			local isLastChance
			if ((whenTicks + fudgeFactor) > (GetTime() + secondsTilDeath)) then
				isLastChance = true
				else
				isLastChance = false
			end
			
			if (not sayNothing and lazyRogue.perPlayerConf.debug) then
				local msg = ROGUE_DEAD_IN..
				string.format("%.1f", secondsTilDeath)..ROGUE_S
				if (isLastChance) then
					msg = msg..ROGUE_EVISCERATE_NOW
				end
				msg = msg.."."
				lazyRogue.d(msg)
			end
			
			return isLastChance
		end
	end
	
	function lazyRogue.bitParsers.ifLastChance(bit, actions, masks)
		if (not lazyRogue.rebit(bit, "^if(Not)?LastChance(Plus)?([%d%.]+s)?$")) then
			return false
		end
		local negate = lazyRogue.negate1()
		local fudgeFactor = lazyScript.match3
		if fudgeFactor ~= nil and fudgeFactor ~= "" then
			fudgeFactor = tonumber(string.sub(fudgeFactor, 1, -2))
			if not fudgeFactor then
				lazyScript.p(ROGUE_NOT_VALID_NUMBER..lazyScript.match3)
			end
			else
			fudgeFactor = 0.25
		end
		
		table.insert(masks, lazyRogue.negWrapper(lazyRogue.masks.IsLastChance(fudgeFactor), negate))
		return true
	end
	
	
	
	-- Complex Rogue masks
	----------------------
	-- These are masks which require additional parameters or have a structure optimized for run-time
	-- efficiency. The mask function must be executed e.g. lazyRogue.masks.<functionName>(parameters).
	-- The portion of the code that needs to be executed when the button is pressed should appear within
	-- "return function() ... end" inside the mask function, everything else will be evaluated at
	-- the time that the mask is parsed.
	
	function lazyRogue.masks.IsEviscKillShot(assumeCBActive, goalPct)
		return function(sayNothing)
			local cp = GetComboPoints()
			if (cp == 0) then
				return false
			end
			
			local hp = lazyRogue.masks.GetUnitHealth("target", false, false, sayNothing)
			
			if not hp then
				return false
			end
			
			-- adjust hp for goalPct
			if (goalPct ~= 100) then
				hp = hp * (goalPct / 100)
			end
			
			local eviscDamage = lazyRogue.masks.CalculateObservedEviscDamage(cp, sayNothing)
			
			-- adjust for Cold Blood, if we're asked to, or if active
			-- Don't want this to spam localization warning everytime if coldblood is not found
			-- even if the key is pressed.
			local cbBuff = lazyRogue.buffTable.coldBlood
			if (assumeCBActive or lazyRogue.masks.HasBuffOrDebuff("player", "buff", cbBuff.texture, cbBuff.name)) then
				-- Cold Blood guarantees a crit (if it hits)
				eviscDamage = eviscDamage * 2
			end
			
			--lazyRogue.d("Adjusted evisc dmg: "..origEviscDamage.." vs "..eviscDamage)
			--lazyRogue.d("Avg evisc dmg with "..cp.." combo points is "..eviscDamage..", vs: "..hp)
			if (hp <= eviscDamage) then
				if (cp < 5) then
					if (not sayNothing) then
						lazyRogue.d(ROGUE_EARLY_EVISCERATE)
					end
				end
				return true
				else
				return false
			end
		end
	end
	
	function lazyRogue.bitParsers.ifKillShot(bit, actions, masks)
		if (not lazyRogue.rebit(bit, "^if(Cb)?KillShot=?(%d+%%)?$")) then
			return false
		end
		local assumeCBActive = (lazyScript.match1 == "Cb")
		local goalPct = 100
		
		local lastAction1 = actions[table.getn(actions)]
		local lastAction2 = actions[table.getn(actions)-1]
		
		if (not assumeCBActive and lastAction1 ~= lazyRogue.actions.evisc) and lastAction1 ~= lazyRogue.comboActions.cbEvisc then
			lazyRogue.p(ROGUE_ONLY_WITH_EVISC)
			return nil
			elseif (assumeCBActive and lastAction1 ~= lazyRogue.comboActions.cbEvisc and
			(lastAction1 ~= lazyRogue.actions.evisc or lastAction2 ~= lazyRogue.actions.coldBlood)) then
			lazyRogue.p(ROGUE_ONLY_WITH_CBEVISC)
			return nil
		end
		
		if (lazyRogue.match2 and lazyRogue.match2 ~= "") then
			goalPct = string.sub(lazyRogue.match2, 1, -2)
			goalPct = tonumber(goalPct)
			if goalPct == nil then
				lazyScript.p("ifKillShot: "..goalPct..ROGUE_NOT_VALID_GOAL_PERCENTAGE)
				return nil
			end
		end
		
		table.insert(masks, lazyRogue.masks.IsEviscKillShot(assumeCBActive, goalPct))
		return true
	end
	
	
	function lazyRogue.masks.ComboPoints(cp, gtLtEq)
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
	
	function lazyRogue.bitParsers.ifComboPointCheck(bit, actions, masks)
		if (not lazyRogue.rebit(bit, "^if([<=>]?)(%d+)cp$") and not lazyRogue.rebit(bit, "^([<=>]?)(%d+)cp$")) then
			return false
		end
		local gtLtEq = lazyRogue.match1
		local val = tonumber(lazyRogue.match2)
		table.insert(masks, lazyRogue.masks.ComboPoints(val, gtLtEq))
		return true
	end
	
	
	-- Rogue-specific Actions
	-- Poison Action
	------------------------
	
	lazyRogue.ApplyPoison ={}
	
	function lazyRogue.ApplyPoison:New(code, poisonName, equipSlot)
		local obj ={}
		setmetatable(obj, { __index = self })
		obj.code = code
		obj.name = poisonName
		obj.psnName = poisonName
		obj.psnDst = equipSlot
		obj.everyTimer = 0
		obj.nowAndEveryTimer = 0
		return obj
	end
	
	function lazyRogue.PickupPoison(name, doNothing)
		local i, itemLink, bagSlots, bagId, icon, quantity
		for i=0, 4 do
			itemLink = nil
			bagSlots = GetContainerNumSlots(i)
			if (bagSlots > 0) then
				for j=1, bagSlots do
					itemLink = nil
					itemLink = GetContainerItemLink(i, j)
					if (itemLink) then
						local _, _, itemName = string.find(itemLink, "%[(.*)%]")
						if (itemName ~= nil and itemName == name) then
							if (not doNothing) then
								lazyRogue.d(ROGUE_FOUND..name..ROGUE_AT..i.."/"..j)
								UseContainerItem(i, j)
							end
							return true
						end
					end
				end
			end
		end
		return false
	end
	
	function lazyRogue.ApplyPoison:Use()
		local poison = self.psnName
		local slotgiven = self.psnDst
		if (slotgiven == "OffHand") then
			slot = "SecondaryHandSlot"
			else
			slot = "MainHandSlot"
		end
		poison=gsub (poison, "[%[%]]", "")
		local doNothing = false
		if (not lazyRogue.PickupPoison(poison, doNothing)) then
			return
		end
		PickupInventoryItem(GetInventorySlotInfo(slot))
		-- If the use poison failed we will now have the weapon on our cursor, put it back
		if (CursorHasItem()) then
			PickupInventoryItem(GetInventorySlotInfo(slot))
		end
		self.everyTimer = GetTime()
		self.nowAndEveryTimer = self.everyTimer
	end
	
	function lazyRogue.ApplyPoison:IsUsable(sayNothing)
		local poison = self.psnName
		local slotgiven = self.psnDst
		if (slotgiven == "OffHand") then
			slot = "SecondaryHandSlot"
			else
			slot = "MainHandSlot"
		end
		poison=gsub (poison, "[%[%]]", "")
		local doNothing = true
		if (not lazyRogue.PickupPoison(poison, doNothing)) then
			if (not sayNothing) then
				lazyRogue.p(ROGUE_OUT_OF_POISON..poison)
			end
			return false
		end
		return true
	end
	
	
	-- Rogue utility functions
	--------------------------
	-- These are functions that are never called by a form but are used within other mask functions.
	-- Technically, they are not masks, but we'll leave them alone for now.
	
	function lazyRogue.masks.CalculateBaseEviscDamage(cp, sayNothing)
		-- find eviscerate rank
		-- lookup damage cp using damage table
		local rank = lazyRogue.actions.evisc:GetRank()
		if (rank == 0) then
			return false
		end
		local eviscDamage = lazyRogue.eviscDamage[rank][cp]
		if (not eviscDamage) then
			if (not sayNothing) then
				lazyRogue.p(ROGUE_STR_DMG_LOOKUP_FAILED)
			end
			return false
		end
		--origEviscDamage = eviscDamage
		
		-- adjust for Improved Eviscerate, if invested
		local ieAdjust = { 1.05, 1.1, 1.15 }
		local tpts = lazyRogue.masks.FindTalentPoints("Ability_Rogue_Eviscerate$")
		if (tpts > 0) then
			eviscDamage = eviscDamage * ieAdjust[tpts]
		end
		
		-- adjust for Aggression, if invested
		local aggrAdjust = { 1.02, 1.04, 1.06 }
		local tpts = lazyRogue.masks.FindTalentPoints("Ability_Racial_Avatar$")
		if (tpts > 0) then
			eviscDamage = eviscDamage * aggrAdjust[tpts]
		end
		
		return eviscDamage
	end
	
	-- :-(
	function lazyRogue.masks.CalculateObservedEviscDamage(cp, sayNothing)
		if (lazyRogue.perPlayerConf.useEviscTracking) and (lazyRogue.et) then
			local observedDamage, observedCt = lazyRogue.et.GetEviscTrackingInfo(cp)
			if (observedCt > 0) then
				--lazyRogue.d("Calculate Evisc Dmg: Using the OBSERVED Evisc ("..cp.."cp) damage of: "..observedDamage)
				return observedDamage
			end
		end
		
		local dmg = lazyRogue.masks.CalculateBaseEviscDamage(cp, sayNothing)
		--lazyRogue.d("Calculate Evisc Dmg: Using the OPTIMAL Evisc ("..cp.."cp) damage of: "..dmg)
		return dmg
	end
	
	function lazyRogue.importOldSettings()
		if not lrConf.perPlayer or
            not lrConf.perPlayer[GetRealmName()] or
            not lrConf.perPlayer[GetRealmName()][UnitName("player")] then
			return
		end
		
		local lrPerPlayerConf = lrConf.perPlayer[GetRealmName()][UnitName("player")]
		
		lazyRogue.perPlayerConf.interruptExceptionCriteria = lrConf.interruptExceptionCriteria
		lazyRogue.perPlayerConf.initiateAutoAttack = lrPerPlayerConf.initiateAutoAttack
		lazyRogue.perPlayerConf.autoTarget = lrPerPlayerConf.autoTarget
		lazyRogue.perPlayerConf.showTargetCasts = lrPerPlayerConf.showTargetCasts
		lazyRogue.perPlayerConf.defaultForm = lrPerPlayerConf.defaultForm
		lazyRogue.perPlayerConf.minionIsVisible = lrPerPlayerConf.minionIsVisible
		lazyRogue.perPlayerConf.minionHidesOutOfCombat = lrPerPlayerConf.minionHidesOutOfCombat
		lazyRogue.perPlayerConf.deathMinionIsVisible = lrPerPlayerConf.deathMinionIsVisible
		lazyRogue.perPlayerConf.deathMinionHidesOutOfCombat = lrPerPlayerConf.deathMinionHidesOutOfCombat
		lazyRogue.perPlayerConf.showReasonForTargetCCd = lrPerPlayerConf.showReasonForTargetCCd
		lazyRogue.perPlayerConf.useEviscTracking = lrPerPlayerConf.useEviscTracking
		lazyRogue.perPlayerConf.trackEviscCrits = lrPerPlayerConf.trackEviscCrits
		lazyRogue.perPlayerConf.eviscerateSample = lrPerPlayerConf.eviscerateSample
		lazyRogue.perPlayerConf.minimapButtonPos = lrPerPlayerConf.minimapButtonPos
		lazyRogue.perPlayerConf.mmIsVisible = lrPerPlayerConf.mmIsVisible
		lazyRogue.perPlayerConf.healthHistorySize = lrPerPlayerConf.healthHistorySize
		lazyRogue.perPlayerConf.useImmunities = lrPerPlayerConf.useImmunities
		lazyRogue.perPlayerConf.Immunities = lrPerPlayerConf.Immunities
		--debug
	end
	
	function lazyRogue.importOldForms()
		if (lrConf.forms) then
			for name, form in pairs(lrConf.forms) do
				local newName = name
				local suffix = 1
				while lazyRogue.perPlayerConf.forms[newName] do
					newName = newName..suffix
					suffix = suffix + 1
				end
				local newForm, changedLines = lazyRogue.convertForm(form)
				local msg = ROGUE_IMPORTED_FORM..name.." => "..newName.."."
				if changedLines > 1 then
					msg = msg..ROGUE_CHANGED..changedLines..ROGUE_LINES
					elseif changedLines == 1 then
					msg = msg..ROGUE_CHANGED_1..changedLines..ROGUE_LINE
					else
					msg = msg..ROGUE_NO_CHANGES_MADE
				end
				lazyRogue.p(msg)
				lazyRogue.perPlayerConf.forms[newName] = newForm
			end
		end
	end
	
	function lazyRogue.convertForm(form)
		local newForm = {}
		local changedLines = 0
		for idx, line in ipairs(form) do
			local newLine = lazyRogue.convertLazyRogue3_1FormToLazyRogue4_0(line)
			if line ~= newLine then
				changedLines = changedLines + 1
				lazyRogue.d(ROGUE_ORIGINAL_LINE..line)
				lazyRogue.d(ROGUE_CONVERTED_LINE..newLine)
			end
			table.insert(newForm, newLine)
		end
		return newForm, changedLines
	end
	
	function lazyRogue.convertLazyRogue3_1FormToLazyRogue4_0(arg)
		-- If it's just a comment, return it as is.
		if (string.find(arg, "^%s*#") or string.find(arg, "^%s*//") or string.find(arg, "^%s*%-%-")) then
			return arg
		end
		
		-- remove comments: # .... or // ....
		-- ignore blank lines
		arg = string.gsub(arg, "#.*", "")
		arg = string.gsub(arg, "//.*", "")
		arg = string.gsub(arg, "%-%-.*", "")
		
		-- trim leading/trailing whitespace
		arg = string.gsub(arg, "^%s+", "")
		arg = string.gsub(arg, "%s+$", "")
		
		if (arg == "") then
			return ""
		end
		
		local bits = {}
		for bit in string.gfind(arg, "[^\-]+") do
			table.insert(bits, bit)
		end
		
		local newBits = {}
		
		for _, bit in ipairs(bits) do
			local oldbit = bit
			-- Enforce camel-casing of action names
			bit = string.gsub(bit, "^bladeflurry$", "bladeFlurry")
			bit = string.gsub(bit, "^coldblood$", "coldBlood")
			bit = string.gsub(bit, "^cbevisc$", "cbEvisc")
			bit = string.gsub(bit, "^stopall$", "stopAll")
			
			-- New buff checking syntax
			if lazyRogue.rebit(bit, "^if(Not)?(%a+)(Not)?Active") then
				local negateString = ""
				if lazyRogue.match1 ~= "" or lazyRogue.match3 ~= "" then
					negateString = "Not"
				end
				local buffString = "Buff"
				local buffTarget = ""      -- assumes player
				lazyRogue.match2 = lazyRogue.match2
				
				if (lazyRogue.match2 == "Blind" or lazyRogue.match2 == "Cs" or lazyRogue.match2 == "Expose" or
					lazyRogue.match2 == "Garrote" or lazyRogue.match2 == "Gouge" or lazyRogue.match2 == "Hemo" or
				lazyRogue.match2 == "Ks" or lazyRogue.match2 == "Rupture" or lazyRogue.match2 == "Sap") then
				buffString = "Debuff"
				buffTarget = "Target"
				
				elseif lazyRogue.match2 == "RecentlyBandaged" then
				buffString = "Debuff"
				end
				
				local buffName = ""
				for k,v in pairs(lazyRogue.buffTable) do
					if string.lower(k) == string.lower(lazyRogue.match2) then
						buffName = k
						break
					end
				end
				
				if buffName ~= "" then
					bit =  "if"..negateString..buffTarget.."Has"..buffString.."Title="..buffName
					else
					lazyRogue.p(ROGUE_NO_EQUIVALENT_BUFF_DEBUFF_FOUND..lazyRogue.match2..".")
				end
				
			end
			
			-- ifInCooldown was case-insensitive after the '='
			if lazyRogue.rebit(bit, "^if(Not)?InCooldown=(.+)$") then
				local action = string.lower(lazyRogue.match2)
				local newAction = nil
				for k,v in pairs(lazyRogue.actions) do
					if (string.lower(v.code) == action) then
						newAction = v.code
						break
					end
				end
				if (not newAction) then
					lazyRogue.p(ROGUE_CONVERSION_ERROR..lazyRogue.match2..".")
					else
					bit = "if"..lazyRogue.match1.."InCooldown="..newAction
				end
			end
			
			-- New buff checking by category syntax
			bit = string.gsub(bit, "^if(N?o?t?)(T?a?r?g?e?t?)Slowed$", "if%1%2Is=Slowed")
			bit = string.gsub(bit, "^if(N?o?t?)(T?a?r?g?e?t?)Stunned$", "if%1%2Is=Stunned")
			bit = string.gsub(bit, "^if(N?o?t?)TargetCCd$", "if%1TargetIs=CCd")
			bit = string.gsub(bit, "^if(N?o?t?)Feared$", "if%1Is=Feared")
			bit = string.gsub(bit, "^if(N?o?t?)Immobile$", "if%1Is=Immobile")
			bit = string.gsub(bit, "^if(N?o?t?)Dotted$", "if%1Is=Dotted")
			bit = string.gsub(bit, "^if(N?o?t?)Bleeding$", "if%1Is=Bleeding")
			bit = string.gsub(bit, "^if(N?o?t?)HuntersMark$", "if%1HasDebuff=huntersMark")
			bit = string.gsub(bit, "^if(N?o?t?)Polymorphed$", "if%1Is=Polymorphed")
			
			-- Miscellaneous
			bit = string.gsub(bit, "^if([<=>]?)(%d+)attackers$", "if%1%2Attackers")
			bit = string.gsub(bit, "^ifInstance$", "ifInInstance")
			bit = string.gsub(bit, "^ifBattleground$", "ifInBattleground")
			bit = string.gsub(bit, "^ifFlagRunner$", "ifTargetFlagRunner")
			bit = string.gsub(bit, "^if(N?o?t?)Timer=(.+)>(%d+)s$", "if%1Timer>%3s=%2")
			bit = string.gsub(bit, "^targetAssist$", "assist")
			
			-- HP/mana/energy mask was entirely too promiscuous--I mean permissive--in older versions
			local start, _, m1, m2, m3, m4, m5, m6 = string.find(bit, "^(i?f?)(%a+)([<=>])(%d+)(%%?)(%a+)$")
			if start then
				if m1 ~= "if" then m1 = "if" end
				if m2 == "target" then m2 = "Target" end
				if m2 == "player" then m2 = "Player" end
				if m6 == "hp" or m6 == "mana" or m6 == "energy" then
					bit = m1..m2..m3..m4..m5..m6
				end
			end
			
			table.insert(newBits, bit)
		end
		
		return table.concat(newBits, "-")
	end
	
	
	
	-- Custom AutoAttack
	--------------------
	-- Include any modifications to the autoAttack function. If this omitted, lazyRogue
	-- will use the default auto-attack behaviour in Parse.lua. The function must be called
	-- CustomAutoAttackMode.
	
	function lazyRogue.CustomAutoAttackMode()
		if (not lazyRogue.masks.IsStealthed()) then
			lazyRogue.StartAutoAttack()
		end
		
	end
	
	
	
	-- Custom command line arguments
	--------------------------------
	function lazyRogue.CustomCommandLineHelp()
		if lazyRogue.et then
			lazyRogue.chat(SLASH_LAZYSCRIPT1..ROGUE_CMD_DESCRIPTION_1)
			lazyRogue.chat(SLASH_LAZYSCRIPT1..ROGUE_CMD_DESCRIPTION_2)
			lazyRogue.chat(SLASH_LAZYSCRIPT1..ROGUE_CMD_DESCRIPTION_3)
			lazyRogue.chat(SLASH_LAZYSCRIPT1..ROGUE_CMD_DESCRIPTION_4)
			lazyRogue.chat(SLASH_LAZYSCRIPT1..ROGUE_CMD_DESCRIPTION_5)
		end
	end
	
	function lazyRogue.CustomCommandLineArgs(cmd, args)
		if (cmd == "resetEviscerateStats") then
			if lazyRogue.et then
				lazyRogue.et.ResetEviscTracking()
			end
			
			elseif (cmd == "useEviscerateTracking") then
			if (lazyRogue.perPlayerConf.useEviscTracking) then
				lazyRogue.perPlayerConf.useEviscTracking = false
				lazyRogue.p(ROGUE_EVIRCERATE_NO_LONGER_USING)
				else
				lazyRogue.perPlayerConf.useEviscTracking = true
				lazyRogue.p(ROGUE_EVIRCERATE_NOW_USING)
			end
			
			elseif (cmd == "trackEviscCrits") then
			if (lazyRogue.perPlayerConf.trackEviscCrits) then
				lazyRogue.perPlayerConf.trackEviscCrits = false
				lazyRogue.p(ROGUE_EVIRCERATE_NO_LONGER_CRITS)
				else
				lazyRogue.perPlayerConf.trackEviscCrits = true
				lazyRogue.p(ROGUE_EVIRCERATE_NOW_CRITS)
			end
			
			elseif (cmd == "importOldForms") then
			if lrConf then
				lazyRogue.importOldForms()
			end
			
			elseif (cmd == "convertOldForm") then
			if not args[1] then
				lazyRogue.p(ROGUE_FORM_NAME_REQUIRED)
				return true
			end
			
			local formName = args[1]
			local form = lazyRogue.perPlayerConf.forms[formName]
			local newForm, changedLines = lazyRogue.convertForm(form)
			local msg = ROGUE_CONVERTED_FORM..formName.."."
			if changedLines > 1 then
				msg = msg..ROGUE_CHANGED..changedLines..ROGUE_LINES
				elseif changedLines == 1 then
				msg = msg..ROGUE_CHANGED..changedLines..ROGUE_LINE
				else
				msg = msg..ROGUE_NO_CHANGES_MADE
			end
			lazyRogue.p(msg)
			lazyRogue.perPlayerConf.forms[formName] = newForm
			
			else
			return false
		end
		return true
	end
	
	
	
	-- Custom minimap entries
	-------------------------
	function lazyRogue.CustomMenu()
		if lazyRogue.et then
			if (UIDROPDOWNMENU_MENU_LEVEL == 1) then
				
				info = {}
				info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT
				info.value = "Eviscerates"
				info.keepShownOnClick = 1
				info.hasArrow = 1
				UIDropDownMenu_AddButton(info)
				
				elseif (UIDROPDOWNMENU_MENU_LEVEL == 2) then
				if (UIDROPDOWNMENU_MENU_VALUE == "Eviscerates") then
					
					local info = {}
					info.isTitle = 1
					info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT_TITLE
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT_USE_EVISC
					if (lazyRogue.perPlayerConf.useEviscTracking) then
						info.checked = true
					end
					info.keepShownOnClick = 1
					info.func = lazyRogue.CustomMenu_ClickSubFunction("Use Eviscerate Tracking")
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT_INC_CRITS
					if (lazyRogue.perPlayerConf.trackEviscCrits) then
						info.checked = true
					end
					info.keepShownOnClick = 1
					info.func = lazyRogue.CustomMenu_ClickSubFunction("Track Eviscerate Crits")
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.isTitle = 1
					info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					for idx, i in ipairs({10, 25, 50, 100}) do
						local info = {}
						info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE_LAST..i..ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE_EVISC
						if (lazyRogue.perPlayerConf.eviscerateSample == i) then
							info.checked = true
						end
						info.keepShownOnClick = 1
						info.func = lazyRogue.CustomMenu_ClickSubFunction("Eviscerate Sample "..i)
						UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					end
					
					local info = {}
					info.isTitle = 1
					info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.isTitle = 1
					info.text = ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_FORMAT
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					
					local info = {}
					info.isTitle = 1
					
					for cp = 1, 5 do
						local sayNothing = true
						local expectedDamage = lazyRogue.masks.CalculateBaseEviscDamage(cp, sayNothing)
						if (not expectedDamage) then
							break
						end
						local observedDamage, observedCt = lazyRogue.et.GetEviscTrackingInfo(cp)
						local ratio = observedDamage / expectedDamage
						info.text = cp..ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_OUTPUT_CP..
						string.format("%.1f", observedDamage)..
						"/"..string.format("%.1f", expectedDamage)..
						" => "..string.format("%.1f", (ratio * 100)).."%"..
						" ("..observedCt..ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_OUTPUT_SEEN
						
						-- TBD: tooltip
						--info.tooltipTitle = "Eviscerate Stats ("..i.."cp)"
						--local text = observedCt.." Eviscerates observed."
						--text = text.."\nAveraging "..observedDamage.." damage"
						--text = text.."\nThe documented "..observedDamage.." damage"
						--info.tooltipText = text
						
						UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
					end
					
					local info = {}
					info.text = ROGUE_CUSTOM_MENU_EVISCERATE_RESET
					info.func = lazyRogue.CustomMenu_ClickSubFunction("Reset Eviscerate Stats")
					-- TBD:
					--info.keepShownOnClick = 1
					UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
				end
				
				elseif (UIDROPDOWNMENU_MENU_LEVEL == 3) then
				-- Do nothing for now
			end
		end -- if lazyRogue.et then
	end
	
	function lazyRogue.CustomMenu_ClickSubFunction(op)
		if lazyRogue.et then
			return function()
				if (op == "Reset Eviscerate Stats") then
					lazyRogue.SlashCommand("resetEviscerateStats")
					elseif (op == "Use Eviscerate Tracking") then
					lazyRogue.SlashCommand("useEviscerateTracking")
					elseif (op == "Track Eviscerate Crits") then
					lazyRogue.SlashCommand("trackEviscCrits")
					elseif (op == "Eviscerate Sample 10") then
					lazyRogue.perPlayerConf.eviscerateSample = 10
					lazyRogue.mm.RefreshMenu("Eviscerates")
					elseif (op == "Eviscerate Sample 25") then
					lazyRogue.perPlayerConf.eviscerateSample = 25
					lazyRogue.mm.RefreshMenu("Eviscerates")
					elseif (op == "Eviscerate Sample 50") then
					lazyRogue.perPlayerConf.eviscerateSample = 50
					lazyRogue.mm.RefreshMenu("Eviscerates")
					elseif (op == "Eviscerate Sample 100") then
					lazyRogue.perPlayerConf.eviscerateSample = 100
					lazyRogue.mm.RefreshMenu("Eviscerates")
				end
			end
		end
	end
	
	
	
	-- Default forms
	----------------
	-- Specify any default forms if they exist.
	lazyRogue.defaultForms = {}
	
	lazyRogue.defaultForms.lr = {
		"--",
		"-- This is the classic lazyRogue form.  Nice and easy.",
		"-- Sinister Strike until you have 5 combo points, then Eviscerate.",
		"-- Uncomment Riposte (remove the leading '--') if you have it.",
		"--",
		"evisc-5cp",
		"--riposte",
		"ss"
	}
	lazyRogue.defaultForms.lazy1 = {
		"--",
		"-- Open with Cheap Shot.",
		"-- SS until you have 5 combo points, or enough to kill the target.",
		"-- Throw in a Kidney Shot if your health is dropping, or a Rupture",
		"-- if the guy's elite.",
		"--",
		"cs",
		"evisc-ifKillShot",
		"ks-5cp-ifPlayer<60%hp",
		"rupture-5cp-ifTarget>65%hp-ifNotTargetHasDebuff=rupture-ifTargetElite",
		"evisc-5cp",
		"--riposte",
		"ss",
	}
	lazyRogue.defaultForms.lazy2 = {
		"--",
		"-- This form works well both solo and in groups.",
		"-- Note: Comment out the cbevisc entries if you don't have",
		"-- Cold Blood.",
		"--",
		"stopAll-ifHasBuff=vanish",
		"--stopAll-ifNotTargetNPC -- uncomment to avoid accidental PvP",
		"dismount-ifMounted",
		"stealth",
		"stopAll-ifTargetIs=CCd-ifNotShiftDown",
		"vanish-ifPlayer<30%hp-ifInCombat-ifTargetOfTarget",
		"cs",
		"evisc-ifKillShot",
		"evisc-ifInGroup-ifLastChance",
		"cbEvisc-3cp-ifCbKillShot-ifNotShiftDown",
		"kick-ifTargetIsCasting-ifNotShiftDown",
		"ks-<3cp-ifTargetIsCasting-ifNotShiftDown",
		"gouge-ifTargetIsCasting-ifNotShiftDown",
		"ks-5cp-ifPlayer<75%hp-ifTargetOfTarget-ifTarget>35%hp",
		"rupture-5cp-ifTarget>75%hp-ifNotTargetHasDebuff=rupture-ifTargetElite",
		"cbEvisc-5cp-ifNotShiftDown",
		"evisc-5cp",
		"snd-=1cp-ifNotHasBuff=snd",
		"feint-ifTargetOfTarget-ifInGroup-ifNotShiftDown",
		"-- uncomment the following if you keep pulling aggro :-)",
		"--feint-ifInGroup-every15s-ifNotShiftDown",
		"--riposte",
		"ss"
	}
	lazyRogue.defaultForms.lazy3 = {
		"--",
		"-- Here's a form I used as a Subtlety/Hemo build.",
		"-- Apply Hemo when not active, SS the rest of the time.",
		"--",
		"dismount-ifMounted",
		"--stealth",
		"stopAll-ifTargetIs=CCd-ifNotShiftDown",
		"stopAll-ifHasBuff=vanish",
		"vanish-ifPlayer<30%hp-ifInGroup-ifInCombat-ifTargetAlive",
		"cs",
		"evisc-ifKillShot",
		"evisc-ifInGroup-ifLastChance",
		"cbEvisc-3cp-ifCbKillShot-ifNotShiftDown",
		"kick-ifTargetIsCasting",
		"ks-<3cp-ifTargetIsCasting",
		"gouge-ifTargetIsCasting",
		"ks-5cp-ifPlayer<60%hp-ifTargetOfTarget-ifTarget>35%hp",
		"rupture-5cp-ifTarget>60%hp-ifNotTargetHasDebuff=rupture",
		"cbEvisc-5cp-ifNotShiftDown",
		"evisc-5cp",
		"snd-=1cp-ifNotHasBuff=snd",
		"feint-ifTargetOfTarget-ifInGroup-ifNotShiftDown",
		"--feint-ifInGroup-every20s-ifNotShiftDown",
		"ghostly-ifNotHasBuff=ghostly-ifTargetOfTarget",
		"hemo-ifNotTargetHasDebuff=hemo",
		"ss"
	}
	
	-- Custom data
	---------------
	-- Place any other tables of data unique to the class here.
	lazyRogue.eviscDamage = {
		{ (7+11)/2, (13+17)/2, (19+23)/2, (25+29)/2, (31+35)/2 },
		{ (16+24)/2, (29+37)/2, (42+50)/2, (55+63)/2, (68+76)/2 },
		{ (29+43)/2, (52+66)/2, (75+89)/2, (98+112)/2, (121+135)/2 },
		{ (47+67)/2, (84+104)/2, (121+141)/2, (158+178)/2, (195+215)/2 },
		{ (69+99)/2, (123+153)/2, (177+207)/2, (231+261)/2, (285+315)/2 },
		{ (104+148)/2, (186+230)/2, (268+312)/2, (350+394)/2, (432+476)/2 },
		{ (158+226)/2, (282+350)/2, (406+474)/2, (530+598)/2, (654+722)/2 },
		{ (216+312)/2, (384+480)/2, (552+648)/2, (720+816)/2, (888+984)/2 },
		{ (242+350)/2, (430+538)/2, (618+726)/2, (806+914)/2, (994+1102)/2 },
	}
	
	lazyRogue.eviscComboPoints = 0
	
	-- Custom initialization
	------------------------
	lazyRogue.customPerPlayerDefaults = {
		["eviscTracker"] = { {0,0}, {0,0}, {0,0}, {0,0}, {0,0} },
		["eviscerateSample"] = 25,
		["trackEviscCrits"] = false,
		["useEviscTracking"] = true,
	}
	
	-- Custom help text
	-------------------
	-- Place any help text that pertains to class specific masks here.
	-- Because of formatting restrictions we place this last so that it does not mess up the indentation.
	function lazyRogue.CustomActionHelp()
		return [[
			<P>|cffffffffApply poison:|r applyPoison{MainHand,OffHand}=&lt;poison&gt;</P>
		]]
	end
	
	function lazyRogue.CustomHelp()
		return [[
			<P>-if[Not]Poisoned={MainHand,OffHand}</P>
			<P>-if[Not]Stealthed</P>
			<P>-if[{&lt;,=,&gt;}]Xcp</P>
		]]
	end
	
end -- function lazyRogueLoad.LoadParseRogue