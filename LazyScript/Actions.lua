lazyScript.metadata:updateRevisionFromKeyword("$Revision: 743 $")

-- Action Objects

function lazyScript.GetActionNameFromTooltip(actionSlot)
	return lazyScript.Tooltip:GetActionTextLeftN(actionSlot, 1)
end

lazyScript.Action = {}
function lazyScript.Action:New(code, texture, interrupts, triggersGlobal, problemTexture, name)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code -- short name reported in History
	obj.codePattern = "^" .. code .. "$" -- used for looking up actions from the table
	obj:InitTexture(texture)
	obj.interrupts = interrupts -- can it interrupt
	obj.slot = nil -- the action slot # on the action bar
	obj.slotCheckedSinceUpdate = nil -- has the slot been checked since an ActionBarSlotChanged event?
	obj.rank = nil -- highest rank of action
	obj.spellIndexStart = nil
	obj.rankCount = nil
	obj.maxRank = nil -- highest rank of action
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0

	-- Full name used for tooltip matching. English is ok if we can't find a match.
	if (name ~= nil) then
		obj.name = name
	else
		obj.name = lazyScript.getLocaleString("ACTION_TTS." .. code, true)
	end

	if (triggersGlobal ~= nil) then -- does it trigger the global cooldown
		obj.triggersGlobal = triggersGlobal
	else
		obj.triggersGlobal = true
	end

	if (problemTexture ~= nil) then
		obj.problemTexture = problemTexture
		if not lazyScript.getLocaleString("ACTION_TTS", false, true) then
			lazyScript.p(ACTION .. code .. NOT_SUPPORTED_PLS_USE)
		end
	else
		obj.problemTexture = false
	end

	obj.requiresSpellStopCasting = true

	return obj
end

function lazyScript.Action:InitTexture(texture)
	if texture == nil then
		self.texture = nil
	elseif type(texture) == "string" then
		self.texture = LS_TEXTURE_PREFIX .. texture
	elseif type(texture) == "table" then
		for idx, value in ipairs(texture) do
			texture[idx] = LS_TEXTURE_PREFIX .. value
		end
		self.texture = texture
	else
		error(ERROR_TYPE_TEXTURE)
	end
end

function lazyScript.Action:CompareTexture(texture)
	if texture == nil or self.texture == nil then
		return false
	elseif type(self.texture) == "string" then
		return (self.texture == texture)
	elseif type(self.texture) == "table" then
		for _, value in ipairs(self.texture) do
			if value == texture then
				return true
			end
		end
		return false
	end
end

function lazyScript.Action:GetSlot(sayNothing)
	if (self.slot) then
		if (not self.slotCheckedSinceUpdate) then
			if (self.texture) then
				if (not GetActionText(self.slot)) then -- ignore any Player macros :-)
					local thisTexture = GetActionTexture(self.slot)
					if (thisTexture and self:CompareTexture(thisTexture)) then
						if (self.problemTexture) then
							if (lazyScript.GetActionNameFromTooltip(self.slot) == self.name) then
								self.slotCheckedSinceUpdate = true
								return self.slot
							end
						else
							self.slotCheckedSinceUpdate = true
							return self.slot
						end
					end
				end
			else
				if (lazyScript.GetActionNameFromTooltip(self.slot) == self.name) then
					self.slotCheckedSinceUpdate = true
					return self.slot
				end
			end
		else
			return self.slot
		end
	end

	-- If we get here then we don't have a slot or it has changed
	self.slot = nil

	if (not self.slot) then
		for slot = 1, 120 do
			local thisTexture = GetActionTexture(slot)
			if (thisTexture) then
				--
				-- We need to be careful of localization here when matching tooltips.
				--
				-- 1. if we have a texture, match it (and it only, no tooltip).  Also, ignore
				--    macros.  This will be the common case of the built-in actions.
				-- 2. if we don't have a texture, then use tooltips.  Macros okay.  This will
				--    be the case for user action=<action> actions.
				--
				if (self.texture) then
					if (not GetActionText(slot)) then -- ignore any Player macros :-)
						if (thisTexture and self:CompareTexture(thisTexture)) then
							if (self.problemTexture) then
								if (lazyScript.GetActionNameFromTooltip(slot) == self.name) then
									lazyScript.d(FOUND .. self.name .. AT_SLOT .. slot)
									self.slot = slot
									break
								end
							else
								lazyScript.d(FOUND .. lazyScript.safeString(self.name) .. AT_SLOT .. slot)
								self.slot = slot
								break
							end
						end
					end
				else
					if (lazyScript.GetActionNameFromTooltip(slot) == self.name) then
						lazyScript.d(FOUND .. lazyScript.safeString(self.name) .. AT_SLOT .. slot)
						self.slot = slot
						break
					end
				end
			end
		end
	end

	if (not self.slot) then
		if (not sayNothing) then
			lazyScript.p(COULDNT_FIND .. lazyScript.safeString(self.name) .. ADD_IT_PLAYER)
		end
		return nil
	end

	return self.slot
end

function lazyScript.Action:FindSpellRanks(sayNothing)
	-- No texture therefore it must be a macro, or an action they want executed directly
	-- Tough :P
	if not self.texture then
		return nil
	end

	if self.spellIndexStart and self.rankCount then
		return self.spellIndexStart, self.rankCount, self.maxRank
	end

	local spellIndexStart
	for spellIndex = 1, 1000 do
		local texture = GetSpellTexture(spellIndex, "spell")
		if (not texture) then
			if not sayNothing then
				lazyScript.d(SPELLSEARCH_FOUND_NIL_TEXTURE .. spellIndex .. ".")
			end
			return nil
		end
		if (self:CompareTexture(texture)) then
			if self.problemTexture then
				if GetSpellName(spellIndex, "spell") == self.name then
					if not sayNothing then
						lazyScript.d(SPELLSEARCH_FOUND .. self.code .. AT_INDEX .. spellIndex .. ".")
					end
					spellIndexStart = spellIndex
					break
				end
			else
				if not sayNothing then
					lazyScript.d(SPELLSEARCH_FOUND .. self.code .. AT_INDEX .. spellIndex .. ".")
				end
				spellIndexStart = spellIndex
				break
			end
		end
	end

	if not spellIndexStart then
		if not sayNothing then
			lazyScript.d(SPELLSEARCH_QUANTITY)
		end
		return nil
	end


	local rankCount = 0
	for spellRank = 1, 99 do
		spellIndex = spellIndexStart + spellRank - 1

		local texture = GetSpellTexture(spellIndex, "spell")
		if (not texture) then
			if not sayNothing then
				lazyScript.d(SPELLSEARCH_FOUND_NIL_TEXTURE .. spellIndex .. RANK_COUNT .. rankCount)
			end
			break
		end
		lazyScript.d(RANK_COUNT_2 .. rankCount .. TEXTURE .. texture)
		if (not self:CompareTexture(texture)) then
			if not sayNothing then
				lazyScript.d(SPELLSEARCH_STOP .. self.code .. AT_INDEX .. spellIndex .. RANK_COUNT .. rankCount)
			end
			break
		else
			if self.problemTexture then
				if GetSpellName(spellIndex, "spell") ~= self.name then
					if not sayNothing then
						lazyScript.d(SPELLSEARCH_STOP .. self.code .. AT_INDEX .. spellIndex .. RANK_COUNT .. rankCount)
					end
					break
				end
			end
			rankCount = rankCount + 1
		end
	end

	local maxRank
	local _, spellRank = GetSpellName(spellIndexStart + rankCount - 1, BOOKTYPE_SPELL)
	if spellRank ~= "" then
		if lazyScript.re(spellRank, "(%d+)") then
			maxRank = tonumber(lazyScript.match1)
		end
	end

	self.spellIndexStart = spellIndexStart
	self.maxRank = maxRank
	self.rankCount = rankCount

	return spellIndexStart, rankCount, maxRank
end

function lazyScript.Action:FindSpellRanksByName(sayNothing)
	if not self.name then
		return nil
	end

	if self.spellIndexStart and self.rankCount then
		return self.spellIndexStart, self.rankCount, self.maxRank
	end

	local spellIndexStart
	for spellIndex = 1, 1000 do
		local spellName = GetSpellName(spellIndex, "spell")
		if (not spellName) then
			if not sayNothing then
				lazyScript.d(SPELLSEARCH_FOUND_NIL_NAME .. spellIndex .. ".")
			end
			return nil
		end
		if (spellName == self.name) then
			if not sayNothing then
				lazyScript.d(SPELLSEARCH_FOUND .. self.code .. AT_INDEX .. spellIndex .. ".")
			end
			spellIndexStart = spellIndex
			break
		end
	end

	if not spellIndexStart then
		lazyScript.d(SPELLSEARCH_QUANTITY)
		return nil
	end


	local rankCount = 0
	for spellRank = 1, 99 do
		spellIndex = spellIndexStart + spellRank - 1

		local spellName, _ = GetSpellName(spellIndex, "spell")
		if (not spellName) then
			if not sayNothing then
				lazyScript.d(SPELLSEARCH_FOUND_NIL_NAME .. spellIndex .. RANK_COUNT .. rankCount)
			end
			break
		end
		if (not (spellName == self.name)) then
			if not sayNothing then
				lazyScript.d(SPELLSEARCH_STOP .. self.code .. AT_INDEX .. spellIndex .. RANK_COUNT .. rankCount)
			end
			break
		else
			rankCount = rankCount + 1
		end
	end

	local maxRank
	local _, spellRank = GetSpellName(spellIndexStart + rankCount - 1, BOOKTYPE_SPELL)
	if spellRank ~= "" then
		if lazyScript.re(spellRank, "(%d+)") then
			maxRank = tonumber(lazyScript.match1)
		end
	end

	self.spellIndexStart = spellIndexStart
	self.maxRank = maxRank
	self.rankCount = rankCount

	return spellIndexStart, rankCount, maxRank
end

function lazyScript.Action:Use()
	lazyScript.d(ACTION_1 .. self.name)
	local spellIndexStart, rankCount, maxRank = self:FindSpellRanks(false)

	if spellIndexStart then
		local spellIndex = spellIndexStart + rankCount - 1
		CastSpell(spellIndex, "spell")
	else
		UseAction(self.slot)
	end

	if (self.interrupts and lazyScript.interrupt.targetCasting) then
		lazyScript.interrupt.lastSpellInterrupted = lazyScript.interrupt.targetCasting
		lazyScript.interrupt.targetCasting = nil
	end

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.Action:IsUsable(sayNothing)
	-- Run this here to make Action:Use quicker by not always having to search the spell book
	local spellIndexStart, rankCount, maxRank = self:FindSpellRanks(sayNothing)
	if (self:GetSlot(sayNothing)) then
		local inRange = IsActionInRange(self.slot)
		if (IsUsableAction(self.slot) == 1 and
			GetActionCooldown(self.slot) == 0 and -- not in cooldown
			not IsCurrentAction(self.slot) and -- not already being used
			(inRange == 1 or inRange == nil or (self.parent and self.parent.target == "player"))) then
			return true
		end
	end
	return false
end

function lazyScript.Action:GetRank()
	-- This does not work on non-rogues who have multiple spell ranks
	if (not self.rank) then
		local i = 1
		while true do
			local texture = GetSpellTexture(i, BOOKTYPE_SPELL)
			if (not texture) then
				break
			end
			if (self:CompareTexture(texture)) then
				local spellNameEn, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
				lazyScript.re(spellRank, "(%d+)")
				self.rank = tonumber(lazyScript.match1)
				break
			end
			i = i + 1
		end
	end
	if (not self.rank) then
		lazyScript.p(COULDNT_FIND .. self.name .. IN_SPELL_BOOK)
		return 0
	end
	return self.rank
end

-- For casting actions by rank
lazyScript.CastSpellByRankAction = {}
function lazyScript.CastSpellByRankAction:New(actionObj, rank, target)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.actionObj = actionObj
	actionObj.parent = obj
	obj.code = actionObj.code -- short name reported in History
	obj.rank = rank -- rank that you want to cast
	obj.name = actionObj.name
	obj.triggersGlobal = actionObj.triggersGlobal
	obj.target = target
	obj.requiresSpellStopCasting = actionObj.requiresSpellStopCasting
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.CastSpellByRankAction:IsUsable(sayNothing)

	local spellIndexStart, rankCount, maxRank = self.actionObj:FindSpellRanks(sayNothing)
	return (self.actionObj:IsUsable(sayNothing) and (spellIndexStart ~= nil))
end

function lazyScript.CastSpellByRankAction:Use()
	lazyScript.d(ATTEMPTING_TO_CAST .. self.code .. " to " .. self.target)
	local spellIndexStart, rankCount, maxRank = self.actionObj:FindSpellRanks(false)
	local spellIndex = spellIndexStart + self.rank - 1

	if self.target == "player" then
		local spellName, spellRank = GetSpellName(spellIndex, BOOKTYPE_SPELL)
		local castSpellByNameName = spellName .. "(" .. spellRank .. ")"
		CastSpellByName(castSpellByNameName, 1)
		if SpellIsTargeting() then
			SpellTargetUnit(self.target)
		end
		if SpellIsTargeting() then SpellStopTargeting() end

	elseif self.target == "target" then
		CastSpell(spellIndex, "spell")

	elseif self.target ~= "" then
		TargetUnit(self.target)
		CastSpell(spellIndex, "spell")
		TargetLastTarget()

	elseif self.target == "" then
		CastSpell(spellIndex, "spell")

	end

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
	self.actionObj.everyTimer = self.everyTimer
end

-- Helper functions

function lazyScript.AlwaysUsable(self, sayNothing)
	return true
end

function lazyScript.DeCacheActionSlotIds()
	for _, action in pairs(lazyScript.actions) do
		action.slotCheckedSinceUpdate = false
	end
	for _, action in pairs(lazyScript.otherActions) do
		action.slotCheckedSinceUpdate = false
	end
end

function lazyScript.DeCacheActionRanks()
	for _, action in pairs(lazyScript.actions) do
		action.rank = nil
		action.spellIndexStart = nil
		action.maxRank = nil
	end
	for _, action in pairs(lazyScript.otherActions) do
		action.rank = nil
	end
end

function lazyScript.DeCacheItemSlots()
	for _, item in pairs(lazyScript.items) do
		item.slotCheckedSinceUpdate = false
	end
	for _, item in pairs(lazyScript.equippedItems) do
		item.slotCheckedSinceUpdate = false
	end
	for _, item in pairs(lazyScript.mainHandItems) do
		item.slotCheckedSinceUpdate = false
	end
	for _, item in pairs(lazyScript.offHandItems) do
		item.slotCheckedSinceUpdate = false
	end
	for _, item in pairs(lazyScript.applyWeaponBuffActions) do
		item.slotCheckedSinceUpdate = false
	end
end

-- ComboAction Objects

lazyScript.ComboAction = {}
function lazyScript.ComboAction:New(code, name, ...)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.name = name
	obj.triggersGlobal = true
	obj.actions = {}
	for i = 1, arg.n do
		table.insert(obj.actions, arg[i])
	end
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.ComboAction:Use()
	local first = true
	for _, action in ipairs(self.actions) do
		if (first) then
			first = false
		else
			SpellStopCasting()
		end
		action:Use()
	end

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.ComboAction:IsUsable(sayNothing)
	for _, action in ipairs(self.actions) do
		if (not action:IsUsable(sayNothing)) then
			return false
		end
	end
	return true
end

-- Form Objects

lazyScript.SetForm = {}
function lazyScript.SetForm:New(code, name)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.name = name
	obj.triggersGlobal = false
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.SetForm:Use()
	lazyScript.SlashCommand("default " .. self.name .. " quiet")
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.SetForm.IsUsable = lazyScript.AlwaysUsable


-- Equip objects

lazyScript.EquipItem = {}
function lazyScript.EquipItem:New(code, name, id, equipSlot)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.name = name
	obj.triggersGlobal = true -- weapon switching triggers a cooldown in combat
	obj.id = id
	obj.equipSlot = equipSlot
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	obj.bag = nil
	obj.slot = nil
	obj.slotCheckedSinceUpdate = nil -- has the slot been checked since a BAG_UPDATE event?
	return obj
end

function lazyScript.EquipItem:Use()
	local slot, bag = self:GetItemSlot()

	PickupContainerItem(bag, slot)
	EquipCursorItem(self.equipSlot)
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.EquipItem:IsUsable(sayNothing)
	-- Check that the item is not already equipped
	local link = GetInventoryItemLink("player", self.equipSlot)
	if (link) then
		local id, name = lazyScript.IdAndNameFromLink(link)
		if (id) then
			-- itemId might be nil, in which case match by name
			if ((self.id and id == self.id) or string.lower(name) == string.lower(self.name)) then
				if (not sayNothing) then
					lazyScript.d(ITEM_EQUIPPED)
				end
				return false
			end
		end
	end

	local slot, bag = self:GetItemSlot(sayNothing)

	if bag and slot then
		return true
	end

	if (not sayNothing) then
		lazyScript.d(ITEM_NOT_FOUND .. lazyScript.safeString(self.name or self.id))
	end
	return false
end

function lazyScript.EquipItem:GetItemSlot(sayNothing)
	local bag = self.bag
	local slot = self.slot

	if (self.slotCheckedSinceUpdate) then
		return slot, bag
	end

	-- Check if the slot is not nil or has changed
	if slot then
		if bag then
			local link = GetContainerItemLink(bag, slot)
			if (link) then
				local id, name = lazyScript.IdAndNameFromLink(link)
				if (id) then
					-- itemId might be nil, in which case match by name
					if ((self.id and id == self.id) or string.lower(name) == string.lower(self.name)) then
						self.slotCheckedSinceUpdate = true
						return slot, bag
					end
				end
			end
		end
	end

	-- Old values did not match. Clear the previous values
	self.slot = nil
	self.bag = nil
	bag = nil
	slot = nil

	-- Do a full inventory search
	for bag = 4, 0, -1 do
		for slot = 1, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			if (link) then
				local id, name = lazyScript.IdAndNameFromLink(link)
				if (id) then
					-- itemId might be nil, in which case match by name
					if ((self.id and id == self.id) or string.lower(name) == string.lower(self.name)) then
						self.bag = bag
						self.slot = slot
						self.slotCheckedSinceUpdate = true
						return slot, bag
					end
				end
			end
		end
	end

	self.slotCheckedSinceUpdate = true
	return slot, bag
end

-- Item Objects

lazyScript.Item = {}
function lazyScript.Item:New(code, name, id, equippedOnly, triggersGlobal)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.name = name
	if triggersGlobal ~= nil then
		obj.triggersGlobal = triggersGlobal
	else
		obj.triggersGlobal = true -- I think
	end
	obj.id = id
	obj.equippedOnly = equippedOnly
	obj.requiresSpellStopCasting = true
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	obj.bag = nil
	obj.slot = nil
	obj.slotCheckedSinceUpdate = nil -- has the slot been checked since a BAG_UPDATE event?
	return obj
end

function lazyScript.Item:Use()
	local slot, bag = self:GetItemSlot()

	if not bag then
		lazyScript.d(USING_ITEM .. self.name .. "(" .. lazyScript.safeString(self.id) .. AT_EQUIPPED_SLOT .. slot)
		UseInventoryItem(slot)
		if (SpellIsTargeting()) then
			SpellTargetUnit("player")
		end
		lazyScript.recordAction(self.code)
		self.everyTimer = GetTime()
		self.nowAndEveryTimer = self.everyTimer
	else
		if (not self.equippedOnly) then
			lazyScript.d(USING_ITEM .. self.name .. "(" .. lazyScript.safeString(self.id) .. AT_BAG_SLOT .. bag .. "/" .. slot)
			UseContainerItem(bag, slot)
			if (SpellIsTargeting()) then
				SpellTargetUnit("player")
			end
			lazyScript.recordAction(self.code)
			self.everyTimer = GetTime()
			self.nowAndEveryTimer = self.everyTimer
		end
	end
end

function lazyScript.Item:IsUsable(sayNothing)
	local slot, bag = self:GetItemSlot(sayNothing)

	if not slot then
		if (not sayNothing) then
			lazyScript.d(ITEM_NOT_FOUND .. lazyScript.safeString(self.name or self.id))
		end
		return false
	end

	if not bag then
		if (GetInventoryItemCooldown("player", slot) == 0) then
			return true
		end
	else
		if (not self.equippedOnly) then
			if (GetContainerItemCooldown(bag, slot) == 0) then
				return true
			end
		end
	end

	return false
end

function lazyScript.Item:GetItemSlot(sayNothing)
	local bag = self.bag
	local slot = self.slot

	if self.slotCheckedSinceUpdate then
		return slot, bag
	end

	-- Check if the slot is not nil or has changed
	if slot then
		-- Check equipped items first
		if not bag then
			local link = GetInventoryItemLink("player", slot)
			if (link) then
				local id, name = lazyScript.IdAndNameFromLink(link)
				if (id) then
					-- itemId might be nil, in which case match by name
					if ((self.id and id == self.id) or string.lower(name) == string.lower(self.name)) then
						self.slotCheckedSinceUpdate = true
						return slot, bag
					end
				end
			end
		elseif bag then
			if not self.equippedOnly then
				local link = GetContainerItemLink(bag, slot)
				if (link) then
					local id, name = lazyScript.IdAndNameFromLink(link)
					if (id) then
						-- itemId might be nil, in which case match by name
						if ((self.id and id == self.id) or string.lower(name) == string.lower(self.name)) then
							self.slotCheckedSinceUpdate = true
							return slot, bag
						end
					end
				end
			end
		end
	end

	-- Old values did not match. Clear the previous values
	self.slot = nil
	self.bag = nil
	bag = nil
	slot = nil

	-- Do a full inventory/equipment search
	-- Check equipped items first
	for slot = 0, 19 do
		local link = GetInventoryItemLink("player", slot)
		if (link) then
			local id, name = lazyScript.IdAndNameFromLink(link)
			if (id) then
				-- itemId might be nil, in which case match by name
				if ((self.id and id == self.id) or string.lower(name) == string.lower(self.name)) then
					self.bag = bag
					self.slot = slot
					self.slotCheckedSinceUpdate = true
					return slot, bag
				end
			end
		end
	end

	if not self.equippedOnly then
		for bag = 4, 0, -1 do
			for slot = 1, GetContainerNumSlots(bag) do
				local link = GetContainerItemLink(bag, slot)
				if (link) then
					local id, name = lazyScript.IdAndNameFromLink(link)
					if (id) then
						-- itemId might be nil, in which case match by name
						if ((self.id and id == self.id) or string.lower(name) == string.lower(self.name)) then
							self.bag = bag
							self.slot = slot
							self.slotCheckedSinceUpdate = true
							return slot, bag
						end
					end
				end
			end
		end
	end

	self.slotCheckedSinceUpdate = true
	return slot, bag
end

-- Apply Weapon Buff Objects
lazyScript.ApplyWeaponBuff = {}

function lazyScript.ApplyWeaponBuff:New(code, weaponBuffName, equipSlot)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.name = weaponBuffName
	obj.weaponBuffName = weaponBuffName
	obj.triggersGlobal = true
	obj.bag = nil
	obj.slot = nil
	obj.slotCheckedSinceUpdate = nil -- has the slot been checked since a BAG_UPDATE event?

	if equipSlot == "OffHand" then
		equipSlot = "SecondaryHandSlot"
	else
		equipSlot = "MainHandSlot"
	end
	obj.equipSlot = equipSlot

	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.ApplyWeaponBuff:Use()
	if (not self.slot) or (not self.bag) then
		-- wtf?
		lazyScript.d(WEAPON_BUFF_BAG_SLOT_NOT_FOUND)
		return
	end

	UseContainerItem(self.bag, self.slot)
	PickupInventoryItem(GetInventorySlotInfo(self.equipSlot))

	-- If the use poison failed we will now have the weapon on our cursor, put it back
	if (CursorHasItem()) then
		PickupInventoryItem(GetInventorySlotInfo(self.equipSlot))
	end

	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.ApplyWeaponBuff:IsUsable(sayNothing)
	local slot = self.slot
	local bag = self.bag

	if not self.slotCheckedSinceUpdate then
		if not lazyScript.IsItemStillHere(self.name, slot, bag, sayNothing) then
			slot, bag = lazyScript.SearchBags(self.name, sayNothing)
			self.slot = slot
			self.bag = bag
		end
		self.slotCheckedSinceUpdate = true
	end

	if not (slot and bag) then
		return false
	end

	local slotId = GetInventorySlotInfo(self.equipSlot)
	local link = GetInventoryItemLink("player", slotId)
	if not (link) then
		return false
	end

	local id, name = lazyScript.IdAndNameFromLink(link)
	local _, _, _, _, itemType = GetItemInfo(id)

	if itemType ~= "Weapon" then
		if not sayNothing then
			lazyScript.d(APPLYWEAPONBUFF ..
				self.name .. IN .. self.equipSlot .. ITEM_TYPE_IS_NOT_WEAPON .. lazyScript.safeString(itemType))
		end
		return false
	end
	return true
end

-- Inventory item helper functions
function lazyScript.IsItemStillHere(idOrName, slot, bag, sayNothing)
	if (not slot) or (not bag) then
		return false
	end

	local itemId, itemName

	lazyScript.re(idOrName, "^(%d+)$")

	if not lazyScript.re(idOrName, "^%d+$") then
		itemName = idOrName
	else
		itemId = tonumber(idOrName)
	end

	local link = GetContainerItemLink(bag, slot)
	if (link) then
		local id, name = lazyScript.IdAndNameFromLink(link)
		if (id) then
			-- itemId might be nil, in which case match by name
			if ((itemId and id == itemId) or (itemName and (string.lower(name) == string.lower(itemName)))) then
				lazyScript.d(ISITEMSTILLHERE_NOT_FOUND .. (itemName or tostring(itemId)) .. AT_BAG_SLOT_1 .. bag .. "/" .. slot)
				return true
			end
		end
	end

	return false
end

function lazyScript.SearchBags(idOrName, sayNothing)
	local slot, bag
	local itemId, itemName

	if not lazyScript.re(idOrName, "^%d+$") then
		itemName = idOrName
	else
		itemId = tonumber(idOrName)
	end


	for bag = 4, 0, -1 do
		for slot = 1, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			if (link) then
				local id, name = lazyScript.IdAndNameFromLink(link)
				if (id) then
					-- itemId might be nil, in which case match by name
					if ((itemId and id == itemId) or (itemName and (string.lower(name) == string.lower(itemName)))) then
						lazyScript.d(SEARCHBAGS_FOUND .. (itemName or tostring(itemId)) .. AT_BAG_SLOT_1 .. bag .. "/" .. slot)
						return slot, bag
					end
				end
			end
		end
	end

	return slot, bag
end

-- PseudoAction Objects

lazyScript.PseudoAction = {}
function lazyScript.PseudoAction:New(code, name, triggersGlobal)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.name = name
	if (triggersGlobal ~= nil) then
		obj.triggersGlobal = triggersGlobal
	else
		obj.triggersGlobal = true
	end
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.PseudoAction:Use()
	-- all PseudoAction instances must define their own Use() method
	-- remember, reset everyTimer in each
end

lazyScript.pseudoActions = {}

lazyScript.pseudoActions.assist = lazyScript.PseudoAction:New("assist", "Assist", false)
function lazyScript.pseudoActions.assist:Use()
	local assistTarget = lazyScript.assistUnitId .. "target"
	lazyScript.d(ASSISTING .. lazyScript.assistName .. " -> " .. UnitName(assistTarget))
	TargetUnit(assistTarget)
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.assist:IsUsable(sayNothing)
	-- If no assist has been set, complain.
	if (lazyScript.assistName == nil) then
		if (not sayNothing) then
			lazyScript.p(ASSIST_TARGET_NOT_SET)
		end
		return false
	end

	-- If we haven't determined the assist's party/raid unitId yet or if the
	-- player for the unitId is not our assist, scan the party/raid to find
	-- the assist's unitId.
	if (
		lazyScript.assistUnitId == nil or
			string.lower(UnitName(lazyScript.assistUnitId) or "") ~= string.lower(lazyScript.assistName)) then
		lazyScript.assistUnitId = lazyScript.findPlayerUnitId(lazyScript.assistName)
		if (lazyScript.assistUnitId == nil) then
			if (not sayNothing) then
				lazyScript.p(CANNOT_FIND .. lazyScript.assistName .. IN_GROUP_OR_RAID_TO_ASSIST)
			end
			return false
		end
	end

	-- If the assist is dead, complain
	if (UnitIsDead(lazyScript.assistUnitId)) then
		if (not sayNothing) then
			lazyScript.p(lazyScript.assistName .. CANNOT_ASSIST_DEAD)
		end
		return false
	end

	-- If the assist is not within range, complain.
	if (not UnitIsVisible(lazyScript.assistUnitId)) then
		if (not sayNothing) then
			lazyScript.p(lazyScript.assistName .. CANNOT_ASSIST_RANGE)
		end
		return false
	end

	local assistTarget = lazyScript.assistUnitId .. "target"

	-- If the assist's target is dead, just pass through.
	if (UnitIsDead(assistTarget)) then
		if (not sayNothing) then
			lazyScript.d(lazyScript.assistName .. TARGET_IS_DEAD_SKIP)
		end
		return false
	end

	-- If the assist's target exists and is not the same unit as the player's current target,
	-- target the assist's target.
	if (UnitExists(assistTarget) and not UnitIsUnit("target", assistTarget)) then
		return true
	end

	return false
end

lazyScript.pseudoActions.assistPet = lazyScript.PseudoAction:New("assistPet", "Assist Pet", false)
function lazyScript.pseudoActions.assistPet:Use()
	AssistUnit("pet")
	PetAttack() -- make certain the pet doesn't change targets any more
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
end

function lazyScript.pseudoActions.assistPet:IsUsable(sayNothing)
	-- Do not use UnitAffectingCombat because this could return true even if pet is not attacking
	-- so long as it has entered combat at some stage.
	if UnitExists("pettarget") then
		if not UnitIsUnit("pettarget", "target") then
			return true
		end
	end

	return false
end

lazyScript.pseudoActions.targetNearest = lazyScript.PseudoAction:New("targetNearest", "Target Nearest", false)
function lazyScript.pseudoActions.targetNearest:Use()
	-- this pseudo action always succeeds, so no action after it will be executed
	TargetNearestEnemy()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.targetNearest.IsUsable = lazyScript.AlwaysUsable

lazyScript.pseudoActions.targetNearestFriend = lazyScript.PseudoAction:New("targetNearestFriend", "Target Nearest Friend"
	, false)
function lazyScript.pseudoActions.targetNearestFriend:Use()
	-- this pseudo action always succeeds, so no action after it will be executed
	TargetNearestFriend()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.targetNearestFriend.IsUsable = lazyScript.AlwaysUsable

lazyScript.pseudoActions.targetLast = lazyScript.PseudoAction:New("targetLast", "Target Last", false)
function lazyScript.pseudoActions.targetLast:Use()
	-- this pseudo action always succeeds, so no action after it will be executed
	TargetLastTarget()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.targetLast.IsUsable = lazyScript.AlwaysUsable

lazyScript.pseudoActions.autoAttack = lazyScript.PseudoAction:New("autoAttack", "Auto Target/Attack", false)
function lazyScript.pseudoActions.autoAttack:Use()
	if (UnitName("target")) then
		lazyScript.StartAutoAttack()
		lazyScript.recordAction(self.code)
		self.everyTimer = GetTime()
		self.nowAndEveryTimer = self.everyTimer
	end
end

function lazyScript.pseudoActions.autoAttack:IsUsable(sayNothing)
	return (not lazyScript.IsAutoAttacking())
end

lazyScript.pseudoActions.stopAttack = lazyScript.PseudoAction:New("stopAttack", "Stop Auto-Attack", false)
function lazyScript.pseudoActions.stopAttack:Use()
	lazyScript.StopAutoAttack()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.stopAttack:IsUsable(sayNothing)
	return (lazyScript.IsAutoAttacking())
end

lazyScript.pseudoActions.stop = lazyScript.PseudoAction:New("stop", "Stop", false)
function lazyScript.pseudoActions.stop:Use()
	-- this pseudo action always succeeds, so no action after it will be executed
	--lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.stop.IsUsable = lazyScript.AlwaysUsable

lazyScript.pseudoActions.stopAll = lazyScript.PseudoAction:New("stopAll", "Stop All", false)
function lazyScript.pseudoActions.stopAll:Use()
	if (lazyScript.IsAutoAttacking()) then
		lazyScript.d(STOPPING_AUTO_ATTACK)
		lazyScript.StopAutoAttack()
	end

	if lazyScript.ClassCanAutoWand() then
		if lazyScript.IsAutoWanding() then
			lazyScript.d(STOPPING_AUTO_SHOOT)
			lazyScript.StopWanding()
		end
	end

	if lazyScript.ClassCanAutoShot() then
		if lazyScript.IsAutoShooting() then
			lazyScript.d(STOPPING_AUTO_SHOT)
			lazyScript.StopAutoShot()
		end
	end

	--lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.stopAll.IsUsable = lazyScript.AlwaysUsable

lazyScript.pseudoActions.dismount = lazyScript.PseudoAction:New("dismount", "Dismount", false)
function lazyScript.pseudoActions.dismount:Use()
	local index = lazyScript.masks.PlayerMountedIndex()
	if (index) then
		CancelPlayerBuff(index)
	end
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.dismount.IsUsable = lazyScript.AlwaysUsable

-- this pseudo action is just for testing criteria
lazyScript.pseudoActions.ping = lazyScript.PseudoAction:New("ping", "Ping", false)
function lazyScript.pseudoActions.ping:Use()
	lazyScript.chat("ping")
	--lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.ping.IsUsable = lazyScript.AlwaysUsable

function lazyScript.ResetEveryTimers()
	local now = GetTime()
	for _, action in pairs(lazyScript.actions) do
		action.everyTimer = now
	end
	for _, action in pairs(lazyScript.comboActions) do
		action.everyTimer = now
	end
	for _, action in pairs(lazyScript.items) do
		action.everyTimer = now
	end
	for _, action in pairs(lazyScript.pseudoActions) do
		action.everyTimer = now
	end
end

function lazyScript.ResetNowAndEveryTimers()
	local now = GetTime()
	for _, action in pairs(lazyScript.actions) do
		action.nowAndEveryTimer = 0
	end
	for _, action in pairs(lazyScript.comboActions) do
		action.nowAndEveryTimer = 0
	end
	for _, action in pairs(lazyScript.items) do
		action.nowAndEveryTimer = 0
	end
	for _, action in pairs(lazyScript.pseudoActions) do
		action.nowAndEveryTimer = 0
	end
end

lazyScript.pseudoActions.stopWand = lazyScript.PseudoAction:New("stopWand", "Stop Wand", false)
function lazyScript.pseudoActions.stopWand:Use()
	lazyScript.StopWanding()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.stopWand:IsUsable(sayNothing)
	if (not lazyScript.GetShootSlot(sayNothing)) then
		return false
	end
	return lazyScript.IsAutoWanding(sayNothing)
end

lazyScript.pseudoActions.wand = lazyScript.PseudoAction:New("wand", "Wand", true)
function lazyScript.pseudoActions.wand:Use()
	lazyScript.StartWanding()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.wand:IsUsable(sayNothing)
	if (not lazyScript.GetShootSlot(sayNothing)) then
		return false
	end
	return (not lazyScript.IsAutoWanding(sayNothing))
end

lazyScript.pseudoActions.stopShot = lazyScript.PseudoAction:New("stopShot", "Stop Auto Shot", false)
function lazyScript.pseudoActions.stopShot:Use()
	lazyScript.StopAutoShot()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.stopShot:IsUsable(sayNothing)
	if (not lazyScript.GetAutoShotSlot(sayNothing)) then
		return false
	end
	return lazyScript.IsAutoShooting(sayNothing)
end

lazyScript.pseudoActions.autoShot = lazyScript.PseudoAction:New("autoShot", "Auto Shot", false)
function lazyScript.pseudoActions.autoShot:Use()
	lazyScript.StartAutoShot()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.autoShot:IsUsable(sayNothing)
	if (not lazyScript.GetAutoShotSlot(sayNothing)) then
		return false
	end
	if (IsActionInRange(lazyScript.autoShotSlot) == 0) then
		return false
	end

	return (not lazyScript.IsAutoShooting(sayNothing))
end

lazyScript.pseudoActions.clearTarget = lazyScript.PseudoAction:New("clearTarget", "Clear Target", false)
function lazyScript.pseudoActions.clearTarget:Use()
	ClearTarget()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.pseudoActions.clearTarget.IsUsable = lazyScript.AlwaysUsable


lazyScript.pseudoActions.stopCasting = lazyScript.PseudoAction:New("stopCasting", "Stop Casting", false)
function lazyScript.pseudoActions.stopCasting:Use()
	SpellStopCasting()
	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.stopCasting:IsUsable(sayNothing)
	if lazyScript.spellcastInProgress then
		return true
	end
	return false
end

lazyScript.pseudoActions.clearHistory = lazyScript.PseudoAction:New("clearHistory", "Clear History", false)
function lazyScript.pseudoActions.clearHistory:Use()
	lazyScript.actionHistory = {}
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.clearHistory:IsUsable(sayNothing)
	if table.getn(lazyScript.actionHistory) >= 1 then
		return true
	end
	return false
end

lazyScript.actionHistory = {}
function lazyScript.recordAction(action)
	-- add to the front, remove from the end
	table.insert(lazyScript.actionHistory, 1, action)
	local size = table.getn(lazyScript.actionHistory)
	if (size > 25) then
		local difference = size - 25
		local i
		for i = 1, difference do
			table.remove(lazyScript.actionHistory)
		end
	end
end

function lazyScript.findPlayerUnitId(name)
	if (lazyScript.masks.PlayerInRaid()) then
		for i = 1, 40 do
			if (string.lower(UnitName("raid" .. i) or "") == string.lower(name)) then
				return "raid" .. i
			end
		end
	elseif (lazyScript.masks.PlayerInGroup()) then
		for i = 1, 4 do
			if (string.lower(UnitName("party" .. i) or "") == string.lower(name)) then
				return "party" .. i
			end
		end
	end

	return nil
end

lazyScript.ShapeshiftForm = {}
function lazyScript.ShapeshiftForm:New(code, texture, triggersGlobal)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.texture = texture -- name of the icon used for the action
	if obj.texture then
		obj.texture = LS_TEXTURE_PREFIX .. obj.texture
	end
	-- Full name used for tooltip matching. English is ok if we can't find a match.
	obj.name = lazyScript.getLocaleString("ACTION_TTS." .. code, true)
	if (triggersGlobal ~= nil) then
		obj.triggersGlobal = triggersGlobal
	else
		obj.triggersGlobal = true
	end
	obj.requiresSpellStopCasting = true
	obj.shapeshiftIndex = nil
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.ShapeshiftForm:Use()
	local icon, name, active, castable = GetShapeshiftFormInfo(self.shapeshiftIndex)
	if (castable == 1) then
		CastShapeshiftForm(self.shapeshiftIndex)
		lazyScript.recordAction(self.code)
		self.everyTimer = GetTime()
		self.nowAndEveryTimer = self.everyTimer
	else
		-- We're in the wrong form and need to be human first
		local activeIndex = lazyScript.FindActiveShapeshift()
		if (activeIndex ~= nil) then
			CastShapeshiftForm(activeIndex)
			lazyScript.recordAction("unshapeshift")
			self.everyTimer = GetTime()
			self.nowAndEveryTimer = self.everyTimer
		end
	end
end

function lazyScript.ShapeshiftForm:IsUsable(sayNothing)
	if (self:FindShapeshift(sayNothing)) then
		local icon, name, active, castable = GetShapeshiftFormInfo(self.shapeshiftIndex)
		if (active == 1) then
			return false
		end
		if (castable == 1) then
			return true
		else
			-- We're in the wrong form and need to be human first
			local activeIndex = lazyScript.FindActiveShapeshift(doNothing)
			if (activeIndex ~= nil) then
				return true
			end
		end
	end
	return false
end

function lazyScript.ShapeshiftForm:FindShapeshift(sayNothing)
	if (self.shapeshiftIndex ~= nil) then
		return true
	end

	local numForms = GetNumShapeshiftForms()

	if numForms < 1 then
		if (not sayNothing) then
			lazyScript.p(NO_SHAPESHIFT_FORMS_AVAILABLE)
		end
		return false
	end

	for formIdx = 1, numForms do
		local icon, name, active, castable = GetShapeshiftFormInfo(formIdx)
		if ((icon == self.texture)) then
			self.shapeshiftIndex = formIdx
			return true
		elseif active then
			-- if this form is active but we couldn't match the texture, look for a buff with the same texture
			local buffObj = lazyScript.buffTable[self.code]
			if buffObj ~= nil then
				local buffId = lazyScript.masks.HasBuffOrDebuff("player", "buff", buffObj.texture, buffObj.name, nil, sayNothing)
				if (buffId and buffId >= 1) then
					-- if we found a buff with the same texture, we assume this active form is the one we're looking for
					self.shapeshiftIndex = formIdx
					return true
				end
			end
		end
	end

	if (not sayNothing) then
		lazyScript.p(SHAPESHIFT_FORM .. self.code .. NOT_FOUND)
	end
	return false
end

function lazyScript.FindActiveShapeshift()
	local numForms = GetNumShapeshiftForms()

	for formIdx = 1, numForms do
		local icon, name, active, castable = GetShapeshiftFormInfo(formIdx)
		if (active == 1) then
			return formIdx
		end
	end
end

lazyScript.SayAction = {}
function lazyScript.SayAction:New(code, channel, message)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.name = "say"
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.channel = channel
	obj.message = message
	obj.triggerGlobal = false
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.SayAction:Use()
	SendChatMessage(self.message, self.channel)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.SayAction.IsUsable = lazyScript.AlwaysUsable


lazyScript.EchoAction = {}
function lazyScript.EchoAction:New(code, message)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.name = "echo"
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.message = message
	obj.triggerGlobal = false
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.EchoAction:Use()
	lazyScript.echo(self.message)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.EchoAction.IsUsable = lazyScript.AlwaysUsable


lazyScript.MinionMessageAction = {}
function lazyScript.MinionMessageAction:New(message)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = "minion=" .. message
	obj.name = message
	obj.minionOverride = true
	obj.triggerGlobal = false
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.MinionMessageAction:Use()
	-- do nothing
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.MinionMessageAction.IsUsable = lazyScript.AlwaysUsable


lazyScript.WhisperAction = {}
function lazyScript.WhisperAction:New(code, recipient, message)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.name = "Whisper to: " .. recipient
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.recipient = string.lower(lazyScript.safeString(recipient))
	obj.message = message
	obj.triggerGlobal = false
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.WhisperAction:Use()
	local whisperTarget = self.recipient
	local unitID = lazyScript.validateUnitId(whisperTarget)
	if unitID then
		if UnitExists(unitID) then
			whisperTarget = UnitName(unitID)
		else
			return
		end
	end

	if whisperTarget then
		SendChatMessage(self.message, "Whisper", nil, whisperTarget)
	end
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.WhisperAction.IsUsable = lazyScript.AlwaysUsable

lazyScript.EmoteAction = {}
function lazyScript.EmoteAction:New(code, emoteToken)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.name = "Do emote: " .. emoteToken
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.emoteToken = emoteToken
	obj.triggerGlobal = false
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.EmoteAction:Use()
	DoEmote(self.emoteToken)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.EmoteAction.IsUsable = lazyScript.AlwaysUsable


-- PlaysoundAction
lazyScript.PlaySoundAction = {}
function lazyScript.PlaySoundAction:New(code, playSoundToken)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.name = "Play Sound: " .. playSoundToken
	obj.code = code
	obj.codePattern = "^" .. code .. "$"
	obj.playSoundToken = playSoundToken
	obj.triggerGlobal = false
	obj.requiresSpellStopCasting = false
	obj.everyTimer = 0
	obj.nowAndEveryTimer = 0
	return obj
end

function lazyScript.PlaySoundAction:Use()
	PlaySound(self.playSoundToken)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.PlaySoundAction.IsUsable = lazyScript.AlwaysUsable


-- Pet actions and related pseudoactions
lazyScript.PetAction = {}
function lazyScript.PetAction:New(code, texture, interrupts, triggersGlobal, problemTexture)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.name = code
	obj.code = code -- short name reported in History
	obj.codePattern = "^" .. code .. "$" -- used for looking up actions from the table
	obj.texture = texture -- name of the icon used for the action
	--if obj.texture then
	--   obj.texture = LS_TEXTURE_PREFIX..obj.texture
	--end
	obj.slot = nil -- the action slot # on the action bar
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0

	local localeName = lazyScript.getLocaleString("ACTION_TTS." .. code, true)
	if (localeName ~= nil) then
		obj.name = lazyScript.getLocaleString("ACTION_TTS." .. code, true)
	else
		obj.name = nil
	end


	obj.interrupts = interrupts

	if (triggersGlobal ~= nil) then -- does it trigger the global cooldown
		obj.triggersGlobal = triggersGlobal
	else
		obj.triggersGlobal = false
	end

	if (problemTexture ~= nil) then
		obj.problemTexture = problemTexture
	else
		obj.problemTexture = false
	end

	obj.requiresSpellStopCasting = false
	return obj
end

function lazyScript.PetAction:GetSlot(sayNothing)
	if (not PetHasActionBar()) then
		return nil
	end

	if (not self.slot) then
		for slot = 1, NUM_PET_ACTION_SLOTS do
			local name, _, thisTexture = GetPetActionInfo(slot)
			if (thisTexture) then
				if (self.texture) then
					if (string.find(thisTexture, self.texture)) then
						if (not self.name) then
							self.name = name
						end
						lazyScript.d(FOUND_PET_ACTION .. self.name .. AT_SLOT .. slot .. ".")
						self.slot = slot
						break
					end
				else
					if (name == self.code) then
						self.name = name
						lazyScript.d(FOUND_PET_ACTION .. self.name .. AT_SLOT .. slot .. ".")
						self.slot = slot
						break
					end
				end
			end
		end
	end

	if (not self.slot) then
		if (not sayNothing) then
			lazyScript.p(COULDNT_FIND .. self.code .. ADD_IT_PET)
		end
		return nil
	end

	return self.slot
end

function lazyScript.PetAction:Use()
	lazyScript.d(PET_ACTION .. lazyScript.safeString(self.name))
	CastPetAction(self.slot)

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.PetAction:IsUsable(sayNothing)
	if (not PetHasActionBar()) then
		if (not sayNothing) then
			lazyScript.d(NOT_HAVE_PET_BAR)
		end
		return false
	end

	if (self:GetSlot(sayNothing)) then
		if (GetPetActionsUsable(self.slot) == 1 and GetPetActionCooldown(self.slot) == 0) then
			if (not self:IsActive(sayNothing)) then
				return true
			end
		end
	end
	return false
end

function lazyScript.PetAction:IsActive(sayNothing)
	if (not PetHasActionBar()) then
		if (not sayNothing) then
			lazyScript.d(NOT_HAVE_PET_BAR)
		end
		return false
	end

	if (self:GetSlot(sayNothing)) then
		local _, _, _, _, isActive = GetPetActionInfo(self.slot)
		return isActive
	end
	return false
end

lazyScript.pseudoActions.petAttack = lazyScript.PseudoAction:New("petAttack", "Pet Attack", false)
function lazyScript.pseudoActions.petAttack:Use()
	PetAttack()

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.petAttack:IsUsable(sayNothing)
	if (not UnitExists("pet")) then
		if (not sayNothing) then
			lazyScript.d(NOT_HAVE_PET)
		end
		return false
	end

	if UnitExists("pettarget") and UnitIsUnit("pettarget", "target") then
		return false
	end

	return true
end

lazyScript.pseudoActions.petStop = lazyScript.PseudoAction:New("petStop", "Pet Stop", false)
function lazyScript.pseudoActions.petStop:Use()
	PetFollow()

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.pseudoActions.petStop:IsUsable(sayNothing)
	if (not UnitExists("pet")) then
		if (not sayNothing) then
			lazyScript.d(NOT_HAVE_PET)
		end
		return false
	end

	return (UnitExists("pettarget"))
end

-- Cancel Player Buff
lazyScript.CancelBuffAction = {}
function lazyScript.CancelBuffAction:New(code, name, texture)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = code -- short name reported in History
	obj.name = "Cancel " .. name -- action name
	obj.buffName = name -- full buff name
	obj.texture = texture -- name of the icon used for the action
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0
	obj.triggersGlobal = false -- does not trigger global cooldown
	obj.requiresSpellStopCasting = false

	return obj
end

function lazyScript.CancelBuffAction:Use()
	CancelPlayerBuff(self.buffIndex)

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.CancelBuffAction:IsUsable(sayNothing)
	self.buffIndex = self:FindPlayerBuff(sayNothing)
	return self.buffIndex ~= nil
end

function lazyScript.CancelBuffAction:FindPlayerBuff(sayNothing)
	local i = 0
	while true do
		local buffIndex = GetPlayerBuff(i, "HELPFUL|PASSIVE")
		if (buffIndex < 0) then
			break
		end
		local texture = GetPlayerBuffTexture(buffIndex)
		if self.texture == nil or (self.texture ~= nil and (texture == self.texture)) then
			local tooltipText = lazyScript.Tooltip:GetPlayerBuffTextLeftN(buffIndex, 1)
			if string.find(tooltipText, "^" .. self.buffName) then
				return buffIndex
			end
		end
		i = i + 1
	end

	return nil
end

-- Call Form
lazyScript.CallFormAction = {}
function lazyScript.CallFormAction:New(form)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = "callForm=" .. form -- short name reported in History
	obj.name = "Call Form " .. form -- action name
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0
	obj.triggersGlobal = false -- does not trigger global cooldown
	obj.requiresSpellStopCasting = false
	obj.form = form

	return obj
end

function lazyScript.CallFormAction:GetSubstituteActions(sayNothing)
	local actions = lazyScript.FindParsedForm(self.form, sayNothing)
	if not actions then
		if not sayNothing then
			lazyScript.p(COULD_NOT_CALL_FORM .. self.form .. ".")
		end
		return nil
	end
	local _, subActions = lazyScript.TryActionsOnly(actions, true)
	return subActions
end

function lazyScript.CallFormAction:IsUsable(sayNothing)
	local actionObj = self:GetSubstituteActions(sayNothing)
	return actionObj ~= nil
end

-- Target Unit
lazyScript.TargetUnitAction = {}
function lazyScript.TargetUnitAction:New(unitId)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = "targetUnit=" .. unitId -- short name reported in History
	obj.name = "Target " .. unitId -- action name
	obj.unitId = unitId
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0
	obj.triggersGlobal = false -- does not trigger global cooldown
	obj.requiresSpellStopCasting = false

	return obj
end

function lazyScript.TargetUnitAction:Use()
	TargetUnit(self.unitId)

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.TargetUnitAction:IsUsable(sayNothing)
	return UnitExists(self.unitId) == 1
end

-- Spell Target Unit
lazyScript.SpellTargetUnitAction = {}
function lazyScript.SpellTargetUnitAction:New(unitId)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = "spellTargetUnit=" .. unitId -- short name reported in History
	obj.name = "Spell Target " .. unitId -- action name
	obj.unitId = unitId
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0
	obj.triggersGlobal = false -- does not trigger global cooldown
	obj.requiresSpellStopCasting = false

	return obj
end

function lazyScript.SpellTargetUnitAction:Use()
	SpellTargetUnit(self.unitId)

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

function lazyScript.SpellTargetUnitAction:IsUsable(sayNothing)
	return UnitExists(self.unitId) == 1
end

-- Target By Name
lazyScript.TargetByNameAction = {}
function lazyScript.TargetByNameAction:New(targetName)
	local obj = {}
	setmetatable(obj, { __index = self })
	obj.code = "targetByName=" .. targetName -- short name reported in History
	obj.name = "Target " .. targetName -- action name
	obj.targetName = targetName
	obj.everyTimer = 0 -- initialize timer for -everyXXs mask
	obj.nowAndEveryTimer = 0
	obj.triggersGlobal = false -- does not trigger global cooldown
	obj.requiresSpellStopCasting = false

	return obj
end

function lazyScript.TargetByNameAction:Use()
	TargetByName(self.targetName, true) -- exact match

	lazyScript.recordAction(self.code)
	self.everyTimer = GetTime()
	self.nowAndEveryTimer = self.everyTimer
end

lazyScript.TargetByNameAction.IsUsable = lazyScript.AlwaysUsable



-- Try Actions
function lazyScript.Try(actions, masks, doNothing)
	if (table.getn(actions) == 0) then
		return false
	end

	local sayNothing = doNothing

	if (masks) then
		for _, mask in ipairs(masks) do
			if (not mask(sayNothing)) then
				return nil
			end
		end
	end

	-- Test if all actions are usable. Also perform action substitution at the same time.
	local temp = {}
	for _, actionObj in ipairs(actions) do
		if actionObj.GetSubstituteActions then
			local subActions = actionObj:GetSubstituteActions(sayNothing)
			-- GetSubstituteActions returns nil if there are no usable substitutes
			if not subActions then
				return nil
			end
			for _, subAction in ipairs(subActions) do
				table.insert(temp, subAction)
			end
		else
			if (not actionObj:IsUsable(sayNothing)) then
				return nil
			end
			table.insert(temp, actionObj)
		end
	end
	actions = temp

	-- Execute the actions in order and remember the action that triggers the global cooldown
	local triggerAction = nil
	for idx, actionObj in ipairs(actions) do
		if not sayNothing then
			lazyScript.d(TRY_ACTION .. idx .. ": " .. actionObj.code)
		end

		if not doNothing then
			-- If we're executing more than one action and both the current and the previously executed
			-- action require SpellStopCasting() before another action can be executed, do so unless
			-- we're already casting a spell or channelling a spell from before LazyScript was called.
			if (idx > 1 and actions[idx - 1].requiresSpellStopCasting and actionObj.requiresSpellStopCasting and
				not (lazyScript.spellcastInProgress or lazyScript.channellingInProgress)) then
				SpellStopCasting()
			end

			actionObj:Use()
		end

		if (actionObj.triggersGlobal) then
			triggerAction = actionObj
		end
	end

	-- Arbitrarily choose the first action if no actions trigger the cooldown
	if (triggerAction == nil) then
		triggerAction = actions[1]
	end

	return triggerAction, actions
end

function lazyScript.TryActions(actionLines, doNothing)

	if (not doNothing) then
		if (not UnitExists("target") and lazyScript.perPlayerConf.autoTarget) then
			TargetNearestEnemy()
		end
	end

	local triggerAction, actions = lazyScript.TryActionsOnly(actionLines, doNothing)
	if triggerAction then
		return triggerAction, actions
	end

	local sayNothing = doNothing
	if (not doNothing and lazyScript.perPlayerConf.initiateAutoAttack) then

		if not lazyScript.ClassCanAutoWand() or not lazyScript.IsAutoWanding(sayNothing) then
			if (lazyScript.CustomAutoAttackMode ~= nil) then
				lazyScript.CustomAutoAttackMode()
			else
				lazyScript.StartAutoAttack()
			end
		end
	end

	return nil
end

function lazyScript.TryActionsOnly(actionLines, doNothing)
	if (actionLines) then
		for _, actionLine in ipairs(actionLines) do
			local actions = actionLine[1]
			local masks = actionLine[2]
			local triggerAction, actions = lazyScript.Try(actions, masks, doNothing)
			if triggerAction then
				return triggerAction, actions
			end
		end
	end
	return nil
end
