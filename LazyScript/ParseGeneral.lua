lazyScript.metadata:updateRevisionFromKeyword("$Revision: 740 $")

-- The functions and data inside this block will be available to all classes.

lazyScript.masks = {}
lazyScript.bitParsers = {}
lazyScript.items = {}
lazyScript.comboActions = {}
lazyScript.otherActions = {}
lazyScript.shapeshift = {}
--lazyScript.sayActions = {}
--lazyScript.echoActions = {}
--lazyScript.whisperActions = {}
--lazyScript.emoteActions = {}
--lazyScript.soundActions = {}
lazyScript.forms = {}
lazyScript.mainHandItems = {}
lazyScript.offHandItems = {}
lazyScript.equippedItems = {}
lazyScript.applyWeaponBuffActions = {}
lazyScript.castSpellByRankActions = {}

-- klugy, but hey
lazyScript.masks.parsingInterruptExceptionCriteria = false



-- General actions
------------------
-- The lazyScript.actions.<name> must match the short name so that we only need additional
-- bitParsing functions for special cases.
function lazyScript.loadActionTable()
	lazyScript.actions = {}
	
	-- Racial          code                                     code              texture                          intrpt   trgrGlbl problemTexture
	lazyScript.actions.berserking       = lazyScript.Action:New("berserking",     "Racial_Troll_Berserk",          false,   false)
	lazyScript.actions.bloodFury        = lazyScript.Action:New("bloodFury",      "Racial_Orc_BerserkerStrength",  false,   false)
	lazyScript.actions.cannibalize      = lazyScript.Action:New("cannibalize",    "Ability_Racial_Cannibalize",    false,   true,    true)
	lazyScript.actions.escapeArtist     = lazyScript.Action:New("escapeArtist",   "Ability_Rogue_Trip",            false,   true,    true)
	lazyScript.actions.findTreasure     = lazyScript.Action:New("findTreasure",   "Racial_Dwarf_FindTreasure",     false,   true)
	lazyScript.actions.perception       = lazyScript.Action:New("perception",     "Spell_Nature_Sleep",            false,   true,    true)
	lazyScript.actions.stoneForm        = lazyScript.Action:New("stoneForm",      "Spell_Shadow_UnholyStrength",   false,   true,    true)
	lazyScript.actions.shadowmeld       = lazyScript.Action:New("shadowmeld",     "Ability_Ambush",                false,   false,   true)
	lazyScript.actions.warStomp         = lazyScript.Action:New("warStomp",       "Ability_WarStomp",              true,    false)
	lazyScript.actions.forsaken         = lazyScript.Action:New("forsaken",       "Spell_Shadow_RaiseDead",        false,   true)
	
	-- Ranged Attacks
	lazyScript.actions.bow              = lazyScript.Action:New("bow",            "Ability_Marksmanship",          nil,     nil,     true)
	lazyScript.actions.crossbow         = lazyScript.Action:New("crossbow",       "Ability_Marksmanship",          nil,     nil,     true)
	lazyScript.actions.gun              = lazyScript.Action:New("gun",            "Ability_Marksmanship",          nil,     nil,     true)
	lazyScript.actions.throw            = lazyScript.Action:New("throw",          "Ability_Throw")
	
	-- Pet Functions
	lazyScript.actions.petFollow        = lazyScript.PetAction:New("petFollow",      "PET_FOLLOW_TEXTURE")
	lazyScript.actions.petStay          = lazyScript.PetAction:New("petStay",        "PET_WAIT_TEXTURE")
	lazyScript.actions.petAggressive    = lazyScript.PetAction:New("petAggressive",  "PET_AGGRESSIVE_TEXTURE")
	lazyScript.actions.petDefensive     = lazyScript.PetAction:New("petDefensive",   "PET_DEFENSIVE_TEXTURE")
	lazyScript.actions.petPassive       = lazyScript.PetAction:New("petPassive",     "PET_PASSIVE_TEXTURE")
	
	-- Other
	lazyScript.actions.findHerbs        = lazyScript.Action:New("findHerbs",      "INV_Misc_Flower_02")
	lazyScript.actions.findMinerals     = lazyScript.Action:New("findMinerals",   "Spell_Nature_Earthquake")
	
	
	-- Minimap Tracking Actions
	
	lazyScript.Tracker = {}
	function lazyScript.Tracker:New(name, texture)
		local obj = {}
		setmetatable(obj, { __index = self })
		obj.name = name
		obj.texture = texture                  -- name of the icon used for the action
		if obj.texture then
			obj.texture = LS_TEXTURE_PREFIX..obj.texture
		end
		return obj
	end
	
	lazyScript.trackers = {}
	lazyScript.trackers.herbs           = lazyScript.Tracker:New("Find Herbs",       "INV_Misc_Flower_02")
	lazyScript.trackers.minerals        = lazyScript.Tracker:New("Find Minerals",    "Spell_Nature_Earthquake")
	lazyScript.trackers.treasure        = lazyScript.Tracker:New("Find Treasure",    "Racial_Dwarf_FindTreasure")
end


-- Special actions
------------------
-- Only include actions that require additional implicit conditions or non-standard action entries
-- e.g. lazyScript.comboActions.<actionName> or lazyScript.items.<itemName>, otherwise an entry in
-- the list above should be sufficient.

function lazyScript.bitParsers.findTreasure(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.actions.findTreasure.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.actions.findTreasure)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.isTracking(lazyScript.trackers.treasure), true))
	return true
end

function lazyScript.bitParsers.shadowmeld(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.actions.shadowmeld.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.actions.shadowmeld)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.isShadowmelded, true))
	return true
end

function lazyScript.bitParsers.findHerbs(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.actions.findHerbs.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.actions.findHerbs)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.isTracking(lazyScript.trackers.herbs), true))
	return true
end

function lazyScript.bitParsers.findMinerals(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.actions.findMinerals.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.actions.findMinerals)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.isTracking(lazyScript.trackers.minerals), true))
	return true
end




function lazyScript.bitParsers.stop(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.stop.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.stop)
	return true
end

function lazyScript.bitParsers.stopAll(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.stopAll.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.stopAll)
	return true
end

function lazyScript.bitParsers.dismount(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.dismount.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.dismount)
	return true
end

function lazyScript.bitParsers.ping(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.ping.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.ping)
	return true
end

function lazyScript.bitParsers.assist(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.assist.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.assist)
	return true
end

function lazyScript.bitParsers.assistPet(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.assistPet.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.assistPet)
	table.insert(masks,   lazyScript.masks.HasPet)
	table.insert(masks,   lazyScript.masks.UnitAlive("pet"))
	return true
end

function lazyScript.bitParsers.targetNearest(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.targetNearest.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.targetNearest)
	return true
end

function lazyScript.bitParsers.targetNearestFriend(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.targetNearestFriend.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.targetNearestFriend)
	return true
end

function lazyScript.bitParsers.targetLast(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.targetLast.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.targetLast)
	return true
end

function lazyScript.bitParsers.targetUnit(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^targetUnit=([%a%d]+)$")) then
		return false
	end
	local unitId = lazyScript.validateUnitId(lazyScript.match1)
	if not unitId then
		lazyScript.p(THE_UNITID..unitId..IS_NOT_VALID)
		return nil
	end
	
	local key = "targetUnit="..unitId
	local actionObj = lazyScript.otherActions[key]
	if actionObj == nil then
		actionObj = lazyScript.TargetUnitAction:New(unitId)
		lazyScript.otherActions[key] = actionObj
	end
	table.insert(actions, actionObj)
	return true
end

function lazyScript.bitParsers.spellTargetUnit(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^spellTargetUnit=([%a%d]+)$")) then
		return false
	end
	local unitId = lazyScript.validateUnitId(lazyScript.match1)
	if not unitId then
		lazyScript.p(THE_UNITID..unitId..IS_NOT_VALID)
		return nil
	end
	
	local key = "spellTargetUnit="..unitId
	local actionObj = lazyScript.otherActions[key]
	if actionObj == nil then
		actionObj = lazyScript.SpellTargetUnitAction:New(unitId)
		lazyScript.otherActions[key] = actionObj
	end
	table.insert(actions, actionObj)
	return true
end

function lazyScript.bitParsers.targetByName(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^targetByName=([%a ]+)$")) then
		return false
	end
	local name = lazyScript.match1
	
	local key = "targetByName="..name
	local actionObj = lazyScript.otherActions[key]
	if actionObj == nil then
		actionObj = lazyScript.TargetByNameAction:New(name)
		lazyScript.otherActions[key] = actionObj
	end
	table.insert(actions, actionObj)
	return true
end

function lazyScript.bitParsers.autoAttack(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.autoAttack.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.autoAttack)
	return true
end

function lazyScript.bitParsers.stopAttack(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.stopAttack.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.stopAttack)
	return true
end

function lazyScript.bitParsers.slotAction(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^action=(.+)$")) then
		return false
	end
	local thisAction = lazyScript.match1
	if (not lazyScript.otherActions[thisAction]) then
		lazyScript.otherActions[thisAction] = lazyScript.Action:New(thisAction, nil, nil, nil, nil, thisAction)
	end
	table.insert(actions, lazyScript.otherActions[thisAction])
	return true
end

function lazyScript.bitParsers.slotFreeAction(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^freeAction=(.+)$")) then
		return false
	end
	local thisAction = lazyScript.match1
	if (not lazyScript.otherActions[thisAction.."-free"]) then
		lazyScript.otherActions[thisAction.."-free"] = lazyScript.Action:New(thisAction, nil, nil, false, nil, thisAction)
	end
	table.insert(actions, lazyScript.otherActions[thisAction.."-free"])
	return true
end

function lazyScript.bitParsers.sayIn(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^sayIn([%a_]+)=(.+)$")) then
		return false
	end
	
	local channel = lazyScript.match1
	local message = lazyScript.match2
	
	-- Capitalize first letter of channel to get in valid form for Blizz API
	channel = string.upper(string.sub(channel, 1, 1))..string.sub(channel, 2)
	if (channel == "Guild" or channel == "Party" or channel == "Raid" or channel == "Say"
	or channel == "Emote" or channel == "RAID_WARNING" or channel == "Yell") then
	local key = "sayIn"..channel.."="..message
	if (not lazyScript.otherActions[key]) then
		lazyScript.otherActions[key] = lazyScript.SayAction:New("sayIn"..channel, channel, message)
	end
	table.insert(actions, lazyScript.otherActions[key])
	
	elseif (channel == "Minion") then
	local key = "sayInMinion="..message
	local actionObj = lazyScript.otherActions[key]
	if actionObj == nil then
		actionObj = lazyScript.MinionMessageAction:New(message)
		lazyScript.otherActions[key] = actionObj
	end
	table.insert(actions, actionObj)
	
	else
	lazyScript.p(UNKNOWN_CHANNEL_NAME..lazyScript.match1)
	return nil
	
	end
	
	return true
end

function lazyScript.bitParsers.echo(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^echo=(.+)$")) then
		return false
	end
	
	local message = lazyScript.match1
	
	local key = "echo="..message
	if (not lazyScript.otherActions[key]) then
		lazyScript.otherActions[key] = lazyScript.EchoAction:New("echo", message)
	end
	table.insert(actions, lazyScript.otherActions[key])
	return true
end

function lazyScript.bitParsers.whisper(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^whisperTo([%a%d]+)=(.+)$")) then
		return false
	end
	
	local recipient = lazyScript.match1
	local message = lazyScript.match2
	local messageCode = recipient.." : "..message
	
	local key = "whisperTo"..lazyScript.match1.."="..message
	if (not lazyScript.otherActions[key]) then
		lazyScript.otherActions[key] = lazyScript.WhisperAction:New("whisper", recipient, message)
	end
	table.insert(actions, lazyScript.otherActions[key])
	return true
end

function lazyScript.bitParsers.doEmote(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^doEmote=(.+)$")) then
		return false
	end
	
	local emoteToken = lazyScript.match1
	local key = "doEmote="..emoteToken
	
	if (not lazyScript.otherActions[key]) then
		lazyScript.otherActions[key] = lazyScript.EmoteAction:New("emote", emoteToken)
	end
	table.insert(actions, lazyScript.otherActions[key])
	return true
end

function lazyScript.bitParsers.playSound(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^playSound=(.+)$")) then
		return false
	end
	
	local playSoundToken = lazyScript.match1
	local key = "playSound="..playSoundToken
	if (not lazyScript.otherActions[key]) then
		lazyScript.otherActions[key] = lazyScript.PlaySoundAction:New("sound", playSoundToken)
	end
	table.insert(actions, lazyScript.otherActions[key])
	return true
end

function lazyScript.bitParsers.setForm(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^setForm=(.+)$")) then
		return false
	end
	local form = lazyScript.match1
	if (not lazyScript.forms[form]) then
		lazyScript.forms[form] = lazyScript.SetForm:New("form"..form, form)
	end
	table.insert(actions, lazyScript.forms[form])
	return true
end

function lazyScript.bitParsers.equipMainHand(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^equipMainHand=(.+)$")) then
		return false
	end
	local item = lazyScript.match1
	local itemId
	local itemName
	if (string.find(item, '^%d')) then
		itemId = tonumber(item)
		itemName = "Item "..itemId
		else
		itemName = item
	end
	if (not lazyScript.mainHandItems[item]) then
		lazyScript.mainHandItems[item] = lazyScript.EquipItem:New(item, itemName, itemId, 16)
	end
	table.insert(actions, lazyScript.mainHandItems[item])
	return true
end

function lazyScript.bitParsers.equipOffHand(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^equipOffHand=(.+)$")) then
		return false
	end
	local item = lazyScript.match1
	local itemId
	local itemName
	if (string.find(item, '^%d')) then
		itemId = tonumber(item)
		itemName = "Item "..itemId
		else
		itemName = item
	end
	if (not lazyScript.offHandItems[item]) then
		lazyScript.offHandItems[item] = lazyScript.EquipItem:New(item, itemName, itemId, 17)
	end
	table.insert(actions, lazyScript.offHandItems[item])
	return true
end

function lazyScript.bitParsers.useItem(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^use(Equipped)?=(.+)$")) then
		return false
	end
	local equippedOnly = (lazyScript.match1 == lazyScript.relax("Equipped"))
	local item = lazyScript.match2
	local itemId
	local itemName
	if (string.find(item, '^%d')) then
		itemId = tonumber(item)
		itemName = "Item "..itemId
		else
		itemName = item
	end
	local myItemSet
	if (equippedOnly) then
		myItemSet = lazyScript.equippedItems
		else
		myItemSet = lazyScript.items
	end
	if (not myItemSet[item]) then
		myItemSet[item] = lazyScript.Item:New(item, itemName, itemId, equippedOnly)
	end
	table.insert(actions, myItemSet[item])
	return true
end

function lazyScript.bitParsers.useFreeItem(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^useFree(Equipped)?Item=(.+)$")) then
		return false
	end
	local equippedOnly = (lazyScript.match1 == lazyScript.relax("Equipped"))
	local item = lazyScript.match2
	local itemId
	local itemName
	if (string.find(item, '^%d')) then
		itemId = tonumber(item)
		itemName = "Item "..itemId
		else
		itemName = item
	end
	local myItemSet
	if (equippedOnly) then
		myItemSet = lazyScript.equippedItems
		else
		myItemSet = lazyScript.items
	end
	
	local itemIndex = item.."-free"
	if (not myItemSet[itemIndex]) then
		myItemSet[itemIndex] = lazyScript.Item:New(item, itemName, itemId, equippedOnly, false)
	end
	table.insert(actions, myItemSet[itemIndex])
	return true
end

function lazyScript.bitParsers.wand(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.wand.codePattern)) then
		return false
	end
	local _, class = UnitClass("player")
	if class ~= "MAGE" and class ~= "PRIEST" and class ~= "WARLOCK" then
		lazyScript.p(CANT_SHOOT_WANDS)
		return nil
	end
	table.insert(actions, lazyScript.pseudoActions.wand)
	return true
end

function lazyScript.bitParsers.stopWand(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.stopWand.codePattern)) then
		return false
	end
	local _, class = UnitClass("player")
	if class ~= "MAGE" and class ~= "PRIEST" and class ~= "WARLOCK" then
		lazyScript.p(CANT_SHOOT_WANDS)
		return nil
	end
	table.insert(actions, lazyScript.pseudoActions.stopWand)
	return true
end

function lazyScript.bitParsers.autoShot(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.autoShot.codePattern)) then
		return false
	end
	local _, class = UnitClass("player")
	if class ~= "HUNTER" then
		lazyScript.p(NOT_HANE_AUTO_SHOT)
		return nil
	end
	table.insert(actions, lazyScript.pseudoActions.autoShot)
	return true
end

function lazyScript.bitParsers.stopShot(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.stopShot.codePattern)) then
		return false
	end
	local _, class = UnitClass("player")
	if class ~= "HUNTER" then
		lazyScript.p(NOT_HANE_AUTO_SHOT)
		return nil
	end
	table.insert(actions, lazyScript.pseudoActions.stopShot)
	return true
end

function lazyScript.bitParsers.petAction(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^petAction=(.+)$")) then
		return false
	end
	local thisAction = lazyScript.match1
	if (not lazyScript.otherActions[thisAction]) then
		lazyScript.otherActions[thisAction] = lazyScript.PetAction:New(thisAction)
	end
	table.insert(actions, lazyScript.otherActions[thisAction])
	return true
end

function lazyScript.bitParsers.petAttack(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.petAttack.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.petAttack)
	return true
end

function lazyScript.bitParsers.petStop(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.petStop.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.petStop)
	return true
end


function lazyScript.bitParsers.clearTarget(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.clearTarget.codePattern)) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	table.insert(actions, lazyScript.pseudoActions.clearTarget)
	return true
end


function lazyScript.bitParsers.cancelBuff(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^cancelBuff=(.+)$")) then
		return false
	end
	local buffCode = lazyScript.match1
	
	local buffObj
	
	for idx, obj in pairs(lazyScript.buffTable) do
		-- Search by shortName
		if (idx == buffCode) then
			lazyScript.d(FOUND_KNOWN_BUFF..buffCode)
			buffObj = obj
			break
		end
	end
	
	local buffName
	local buffTexture
	
	if (buffObj == nil) then
		lazyScript.p(NO_BUFF_ENTRY_FOUND..buffCode..TRY_CANCLEBUFFTITLE)
		return nil
		else
		buffName = buffObj.name
		buffTexture = buffObj.texture
	end
	
	local key = "cancelBuff="..buffCode
	local actionObj = lazyScript.otherActions[key]
	if actionObj == nil then
		actionObj = lazyScript.CancelBuffAction:New(buffCode, buffName, buffTexture)
		lazyScript.otherActions[key] = actionObj
	end
	table.insert(actions, actionObj)
	return true
end


function lazyScript.bitParsers.cancelBuffTitle(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^cancelBuffTitle=(.+)$")) then
		return false
	end
	local buffCode = lazyScript.match1
	
	local buffObj
	
	for idx, obj in pairs(lazyScript.buffTable) do
		-- Search by name
		if (obj.name == buffCode) then
			lazyScript.d(FOUND_KNOWN_BUFF..buffCode)
			buffObj = obj
			break
		end
	end
	
	local buffName
	local buffTexture
	
	if (buffObj == nil) then
		lazyScript.d(NO_BUFF_ENTRY_FOUND..buffCode..".")
		buffName = buffCode
		else
		buffName = buffObj.name
		buffTexture = buffObj.texture
	end
	
	local key = "cancelBuffTitle="..buffCode
	local actionObj = lazyScript.otherActions[key]
	if actionObj == nil then
		actionObj = lazyScript.CancelBuffAction:New(buffCode, buffName, buffTexture)
		lazyScript.otherActions[key] = actionObj
	end
	table.insert(actions, actionObj)
	return true
end


function lazyScript.bitParsers.stopCasting(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.stopCasting.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.stopCasting)
	return true
end


function lazyScript.bitParsers.callForm(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^callForm=(.+)$")) then
		return false
	end
	local form = lazyScript.match1
	
	if not lazyScript.FindForm(form) then
		lazyScript.p(COULD_NOT_FIND_FORM..form..".")
		return nil
	end
	
	local key = "callForm="..form
	local actionObj = lazyScript.otherActions[key]
	if actionObj == nil then
		actionObj = lazyScript.CallFormAction:New(form)
		lazyScript.otherActions[key] = actionObj
	end
	table.insert(actions, actionObj)
	return true
end


function lazyScript.bitParsers.clearHistory(bit, actions, masks)
	if (not lazyScript.rebit(bit, lazyScript.pseudoActions.clearHistory.codePattern)) then
		return false
	end
	table.insert(actions, lazyScript.pseudoActions.clearHistory)
	return true
end


function lazyScript.bitParsers.applyWeaponBuff(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^apply(%a+)Buff=(.+)$")) then
		return false
	end
	if (lazyScript.match1 ~= "MainHand" and lazyScript.match1 ~= "OffHand") then
		lazyScript.p(ONLY_MAIN_AND_OFF_HAND_SUPPORTED..lazyScript.match1)
		return nil
	end
	
	local equipSlot = lazyScript.match1
	local weaponBuffName = lazyScript.match2
	local key = equipSlot..":"..weaponBuffName
	if (not lazyScript.applyWeaponBuffActions[key]) then
		lazyScript.applyWeaponBuffActions[key] = lazyScript.ApplyWeaponBuff:New("applyWeaponBuff"..equipSlot, weaponBuffName, equipSlot)
	end
	table.insert(actions, lazyScript.applyWeaponBuffActions[key])
	return true
end



-- Simple masks
---------------
-- These masks do not require parameters and return the check directly so we can omit the function
--  call and just refer to the mask by name i.e. lazyScript.masks.<functionName> instead of
-- lazyScript.masks.<functionName>().
-- I try to keep the mask and the bitParser that refers to said mask together for ease
-- of reading.

function lazyScript.masks.IsTargetOfTarget()
	return UnitIsUnit("player", "targettarget")
end

function lazyScript.bitParsers.ifTargetOfTarget(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetOfTarget$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsTargetOfTarget, negate))
	return true
end


function lazyScript.masks.TargetHasTarget()
	return UnitExists("targettarget")
end

function lazyScript.bitParsers.ifTargetHasTarget(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetHasTarget$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetHasTarget, negate))
	return true
end


function lazyScript.masks.HaveTarget()
	return UnitExists("target")
end

function lazyScript.bitParsers.ifHaveTarget(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?HaveTarget$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.HaveTarget, negate))
	return true
end


function lazyScript.masks.UnitExists(unitId)
	return function()
		return UnitExists(unitId)
	end
end


function lazyScript.masks.PlayerInGroup()
	return (GetNumPartyMembers() > 0)
end

function lazyScript.bitParsers.ifPlayerInGroup(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?InGroup$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.PlayerInGroup, negate))
	return true
end

function lazyScript.masks.PlayerInRaid()
	return (GetNumRaidMembers() > 0)
end

function lazyScript.bitParsers.ifInRaid(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?InRaid$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.PlayerInRaid, negate))
	return true
end

function lazyScript.masks.PartyHaveClass(class)
	return function()
		local class = string.upper(class)
		for i=1,4 do
			local _ , partyClass = UnitClass("party"..i) 
			if  class == partyClass  then
				return true
			end
		end
	end
end

function lazyScript.bitParsers.ifPartyHaveClass(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PartyHaveClass=?(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local subMasks = {}
	for class in string.gfind(lazyScript.match2, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.PartyHaveClass(class))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end

function lazyScript.masks.TargetInMeleeRange(sayNothing)
	if (not lazyScript.rangeCheckAction) then
		if not sayNothing then
			lazyScript.p(RANGECHECKACTION_IS_NIL)
		end
		return nil
	end
	
	local rangeCheck = IsActionInRange(lazyScript.rangeCheckAction:GetSlot(sayNothing))
	if rangeCheck == nil then
		if not sayNothing then
			lazyScript.p(ISACTIONINRANGE_RETURNED_NIL)
		end
		return nil
	end
	
	return (rangeCheck == 1)
end

function lazyScript.bitParsers.ifTargetInMeleeRange(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetInMeleeRange$")) then
		return false
	end
	
	local _, class = UnitClass("player")
	if class ~= "ROGUE" and class ~= "DRUID" and class ~= "HUNTER" and class ~= "WARRIOR" then
		lazyScript.p(IFTARGETINMELEERANGE_NOT_SUPPORT)
		return nil
		elseif (not lazyScript.rangeCheckAction) then
		local rangeAction = lazyScript.getRangeCheckAction()
		lazyScript.p(IFTARGETINMELEERANGE_NOT_SUPPORT_NOT_HAVE..lazyScript.safeString(rangeAction.name)..YET)
		return nil
	end
	
	table.insert(masks, lazyScript.masks.HaveTarget)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetFriend, true))
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetInMeleeRange, negate))
	return true
end


function lazyScript.masks.TargetFriend()
	return UnitIsFriend("player", "target")
end

function lazyScript.bitParsers.ifTargetFriend(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetFriend$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetFriend, negate))
	return true
end


function lazyScript.masks.TargetEnemy()
	return UnitIsEnemy("player", "target")
end

function lazyScript.bitParsers.ifTargetEnemy(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetEnemy$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetEnemy, negate))
	return true
end


function lazyScript.masks.TargetAttackable()
	return (UnitCanAttack("player", "target") and not UnitIsDead("target"))
end

function lazyScript.bitParsers.ifTargetAttackable(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetAttackable$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetAttackable, negate))
	return true
end


-- :-(
-- supported unitIds: player, pet, target
function lazyScript.masks.GetUnitHealth(unitId, wantPct, wantDeficit, sayNothing)
	if (unitId == "player" or unitId == "pet" or UnitPlayerOrPetInParty(unitId) or UnitPlayerOrPetInRaid(unitId)) then
		if (wantPct) then
			local pct = (UnitHealth(unitId) / UnitHealthMax(unitId)) * 100
			if (wantDeficit) then
				return (100 - pct)
				else
				return pct
			end
			else
			if (wantDeficit) then
				return UnitHealthMax(unitId) - UnitHealth(unitId)
				else
				return UnitHealth(unitId)
			end
		end
		
		elseif (unitId == "target") then
		if (wantPct) then
			if (wantDeficit) then
				return (100 - UnitHealth(unitId))
				else
				return UnitHealth(unitId)
			end
			else
			if (not MobHealth_GetTargetCurHP) then
				if (not sayNothing) then
					lazyScript.p(MOBINFO2_NOT_INSTALLED)
				end
				return nil
			end
			local hp = MobHealth_GetTargetCurHP()
			if (not hp) then
				return nil
			end
			if (wantDeficit) then
				local maxHP = MobHealth_GetTargetMaxHP()
				if not maxHP then
					return nil
				end
				return (maxHP - hp)
				else
				return hp
			end
		end
	end
end

-- :-(
-- returns mana, energy, or rage
function lazyScript.masks.GetUnitMana(unitId, wantPct, wantDeficit, sayNothing)
	-- mana is different than health, we get actual values for everything, even enemies
	if (wantPct) then
		local pct = (UnitMana(unitId) / UnitManaMax(unitId)) * 100
		if (wantDeficit) then
			return (100 - pct)
			else
			return pct
		end
		else
		if (wantDeficit) then
			return UnitManaMax(unitId) - UnitMana(unitId)
			else
			return UnitMana(unitId)
		end
	end
end


lazyScript.powerTypes ={
	"Mana",        -- 0
	"Rage",        -- 1
	"Focus",       -- 2
	"Energy",      -- 3
	"Happiness",   -- 4
}
function lazyScript.masks.UnitPowerMask(unitId, gtLtEq, val, powerType, wantPct, wantDeficit)
	return function(sayNothing)
		local compareVal = 0
		
		if (powerType == "hp") then
			compareVal = lazyScript.masks.GetUnitHealth(unitId, wantPct, wantDeficit, sayNothing)
			
			elseif (powerType == "mana" or powerType == "energy" or powerType == "rage" or powerType == "focus") then
			local thisPowerType = lazyScript.powerTypes[UnitPowerType(unitId)+1]
			if thisPowerType then
				if string.lower(thisPowerType) == string.lower(powerType) then
					compareVal = lazyScript.masks.GetUnitMana(unitId, wantPct, wantDeficit, sayNothing)
					else
					return false
				end
				else
				return false
			end
			
		end
		
		if not compareVal then
			return false
		end
		
		if (gtLtEq == ">") then
			return (compareVal > val)
			elseif (gtLtEq == "=") then
			return (compareVal == val)
			else
			return (compareVal < val)
		end
	end
end

function lazyScript.bitParsers.UnitHPMP(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if([%a%d]*)([<=>])(%d+)(%%?)(hp|mana|energy|rage|focus)(Deficit)?$")) then
		return false
	end
	local unitId = string.lower(lazyScript.match1)
	local gtLtEq = lazyScript.match2
	local val = tonumber(lazyScript.match3)
	local wantPct = (lazyScript.match4 == "%")
	local powerType = lazyScript.match5
	local wantDeficit = (lazyScript.match6 == "Deficit")
	
	if (unitId == "") then
		unitId = "player"
	end
	unitId = lazyScript.validateUnitId(unitId)
	if not unitId then
		lazyScript.p(unitId..IS_NOT_VALID_UNITID)
		return nil
	end
	
	table.insert(masks, lazyScript.masks.UnitExists(unitId))
	table.insert(masks, lazyScript.masks.UnitPowerMask(unitId, gtLtEq, val, powerType, wantPct, wantDeficit))
	return true
end


function lazyScript.masks.PlayerInCombat()
	return lazyScript.isInCombat
end

function lazyScript.masks.UnitInCombat(unitId)
	return function(sayNothing)
		return (UnitAffectingCombat(unitId) == 1)
	end
end

function lazyScript.bitParsers.ifUnitInCombat(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Player|Pet|Target)?InCombat$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2)
	
	if unitId == "" then
		unitId = "player"
	end
	
	if unitId == "target" then
		table.insert(masks, lazyScript.masks.HaveTarget)
		elseif unitId == "player" then
		table.insert(masks, lazyScript.negWrapper(lazyScript.masks.PlayerInCombat, negate))
		return true
	end
	
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.UnitInCombat(unitId), negate))
	return true
end


function lazyScript.masks.BehindAttackFailedRecently(timeout)
	return function(sayNothing)
		return ((GetTime() - lazyScript.behindAttackLastFailedAt) < timeout)
	end
end

function lazyScript.bitParsers.ifBehindAttackJustFailed(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?BehindAttackJustFailed([0-9]s|[0-9]%.[0-9]s)?$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local timeout = lazyScript.match2
	if timeout ~= nil and timeout ~= "" then
		timeout = tonumber(string.sub(timeout, 1, -2))
		else
		timeout = 0.3
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.BehindAttackFailedRecently(timeout), negate))
	return true
end


function lazyScript.masks.InFrontAttackFailedRecently(timeout)
	return function()
		return ((GetTime() - lazyScript.inFrontAttackLastFailedAt) < timeout)
	end
end

function lazyScript.bitParsers.ifInFrontAttackJustFailed(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?InFrontAttackJustFailed([0-9]s|[0-9]%.[0-9]s)?$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local timeout = lazyScript.match2
	if timeout ~= nil and timeout ~= "" then
		timeout = tonumber(string.sub(timeout, 1, -2))
		else
		timeout = 0.3
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.InFrontAttackFailedRecently(timeout), negate))
	return true
end


function lazyScript.masks.OutdoorsAttackFailedRecently(timeout)
	return function(sayNothing)
		return ((GetTime() - lazyScript.outdoorsAttackLastFailedAt) < timeout)
	end
end

function lazyScript.bitParsers.ifOutdoorsAttackJustFailed(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?OutdoorsAttackJustFailed([0-9]s|[0-9]%.[0-9]s)?$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local timeout = lazyScript.match2
	if timeout ~= nil and timeout ~= "" then
		timeout = tonumber(string.sub(timeout, 1, -2))
		else
		timeout = 0.3
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.OutdoorsAttackFailedRecently(timeout), negate))
	return true
end


function lazyScript.masks.IsDueling()
	return lazyScript.InDuel
end

function lazyScript.bitParsers.ifDueling(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Dueling$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsDueling, negate))
	return true
end


-- Problematic textures:
--   a Hunter with the Aspect of the Beast/Cheetah buff
--   a Hunter in the group with the Aspect of the Pack buff
--   a Druid with the Tiger's Fury buff
lazyScript.masks.problemMounts = {
	["Interface\\Icons\\Ability_Mount_PinkTiger"]   = true,  -- Aspect of the Beast
	["Interface\\Icons\\Ability_Mount_WhiteTiger"]  = true,  -- Aspect of the Pack
	["Interface\\Icons\\Ability_Mount_JungleTiger"] = true,  -- Aspect of the Cheetah, Tiger's Fury
}

--Thanks to Gello's ItemRack for the ideas behind this function.
function lazyScript.masks.PlayerMountedIndex(sayNothing)
	local mountBuffIndex = nil
	local i = 0
	while true do
		local buffIndex = GetPlayerBuff(i, "HELPFUL|PASSIVE")
		if (buffIndex < 0) then
			break
		end
		local texture = GetPlayerBuffTexture(buffIndex)
		if (lazyScript.masks.problemMounts[texture]) then
			-- these problematic Ability_Mount_* textures might not
			-- actually be mounts, so verify the tooltip
			local mountString = lazyScript.getLocaleString("MOUNTED_BUFF_TT")
			if (not mountString) then
				if not sayNothing then
					lazyScript.d(LOCALE_NOT_EXIST..texture)
				end
				return false
			end
			local ttText = lazyScript.Tooltip:GetPlayerBuffTextLeftN(buffIndex, 2)
			if (string.find(ttText, "^"..mountString)) then
				mountBuffIndex = buffIndex
				break
			end
			elseif (string.find(texture,"Ability_Mount_") or
				string.find(texture,"Spell_Nature_Swiftness$") or
				string.find(texture,"INV_Misc_QirajiCrystal$") or
			string.find(texture,"INV_Misc_Foot_Kodo$")) then
			mountBuffIndex = buffIndex
			break
		end
		i = i + 1
	end
	
	return mountBuffIndex
end

function lazyScript.masks.PlayerMounted()
	return function(sayNothing)
		return lazyScript.masks.PlayerMountedIndex(sayNothing)
	end
end

function lazyScript.bitParsers.ifMounted(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Mounted$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.PlayerMounted(), negate))
	return true
end


function lazyScript.masks.InInstance(sayNothing)
	local instances = lazyScript.getLocaleString("INSTANCES")
	if (not instances) then
		if (not sayNothing) then
			lazyScript.p(SORRY.." ifInInstance "..NOT_SUPPORTED)
		end
		return nil
	end
	local zone = GetZoneText()
	for idx, instance in ipairs(instances) do
		if string.find(zone, instance) then
			return true
		end
	end
	return false
end

function lazyScript.bitParsers.ifInInstance(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?InInstance$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.InInstance, negate))
	return true
end


function lazyScript.masks.InBattleground(sayNothing)
	for i = 1, MAX_BATTLEFIELD_QUEUES do
		status, mapName, instanceID = GetBattlefieldStatus(i)
		if (status == "active") then
			if (not sayNothing) then
				lazyScript.d(YOU_IN_BG..mapName)
			end
			return true
		end
		return false
	end
end

function lazyScript.bitParsers.ifInBattleground(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?InBattleground$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.InBattleground, negate))
	return true
end

function lazyScript.masks.IsGlobalCooldown(gcdActionObj)
	return function(sayNothing)
		local slot = gcdActionObj:GetSlot(true)
		if not slot then
			if not sayNothing then
				lazyScript.p(ENABLE_GCD_1..lazyScript.safeString(gcdActionObj.name)..ENABLE_GCD_2)
			end
			return nil
		end
		
		return (GetActionCooldown(slot) > 0)
	end
end

function lazyScript.bitParsers.ifGlobalCooldown(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?GlobalCooldown$")) then
		return false
	end
	
	local gcdActionObj
	local _, class = UnitClass("player")
	if class == "ROGUE" then
		gcdActionObj = lazyScript.actions.ss
		elseif class == "DRUID" then
		gcdActionObj = lazyScript.actions.motw
		elseif class == "HUNTER" then
		gcdActionObj = lazyScript.actions.trackBeasts
		elseif class == "PRIEST" then
		gcdActionObj = lazyScript.actions.pwf
		elseif class == "WARRIOR" then
		gcdActionObj = lazyScript.actions.battleShout
		elseif class == "MAGE" then
		gcdActionObj = lazyScript.actions.frostArmor
		elseif class == "WARLOCK" then
		gcdActionObj = lazyScript.actions.demonSkin
		elseif class == "SHAMAN" then
		gcdActionObj = lazyScript.actions.rockbiter
		elseif class == "PALADIN" then
		gcdActionObj = lazyScript.actions.sealRight
		else
		lazyScript.p(UNKNOWN_CLASS..lazyScript.safeString(class))
		return nil
	end
	
	if not gcdActionObj:GetSlot(true) then
		lazyScript.p(ENABLE_GCD_1..lazyScript.safeString(gcdActionObj.name)..ENABLE_GCD_2)
		return nil
	end
	
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsGlobalCooldown(gcdActionObj), negate))
	return true
end


function lazyScript.masks.TargetNPC()
	return not UnitIsPlayer("target")
end

function lazyScript.bitParsers.ifTargetNPC(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetNPC$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetNPC, negate))
	return true
end


function lazyScript.masks.TargetHostile()
	-- http://www.wowwiki.com/API_UnitReaction
	local reaction = UnitReaction("player", "target")
	if (not reaction) then
		-- dunno...
		return false
	end
	return (reaction <= 3)
end

function lazyScript.bitParsers.ifTargetHostile(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetHostile$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetHostile, negate))
	return true
end


function lazyScript.masks.TargetElite()
	return string.find(UnitClassification("target"), "elite")
end

function lazyScript.bitParsers.ifTargetElite(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetElite$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetElite, negate))
	return true
end

function lazyScript.masks.TargetBoss(sayNothing)
	return UnitClassification("target") == "worldboss"
end

function lazyScript.bitParsers.ifTargetBoss(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetBoss$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetBoss, negate))
	return true
end

function lazyScript.masks.IsBeingGanked()
	return lazyScript.ganked
end

function lazyScript.bitParsers.ifGanked(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Ganked$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsBeingGanked, negate))
	return true
end


function lazyScript.masks.IsFlagRunner(unitId)
	local buffObj
	if (UnitFactionGroup("player") == "Alliance") then
		buffObj = lazyScript.buffTable.warsongFlag
		elseif (UnitFactionGroup("player") == "Horde") then
		buffObj = lazyScript.buffTable.silverwingFlag
	end
	
	if unitId == "target" then
		return function(sayNothing)
			if UnitIsFriend(unitId, "player") then
				return lazyScript.masks.HasBuffOrDebuff(unitId, "buff", buffObj.texture, buffObj.name, buffObj.body, sayNothing)
				else
				local target, realm = UnitName(unitId)
				
				if (target == lazyScript.flagHolder) then
					return true
					else
					return false
				end
			end
		end
		
		elseif unitId == "player" then
		return function(sayNothing)
			return lazyScript.masks.HasBuffOrDebuff(unitId, "buff", buffObj.texture, buffObj.name, buffObj.body, sayNothing)
		end
	end
	
end

function lazyScript.bitParsers.ifFlagRunner(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Player|Target)?FlagRunner$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2)
	
	if unitId == "" then
		unitId = "player"
		elseif unitId == "target" then
		if (not lazyScript.getLocaleString("BG_WSG_ZONE")) then
			lazyScript.p(IFTARGETFLAGRUNNER_NOT_SUPPORT)
			return nil
		end
		
		table.insert(masks, lazyScript.masks.HaveTarget)
	end
	
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsFlagRunner(unitId), negate))
	return true
end


function lazyScript.masks.TargetInMediumRange()
	return CheckInteractDistance("target", 3)
end

function lazyScript.bitParsers.ifTargetInMediumRange(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetInMediumRange$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetInMediumRange, negate))
	
	return true
end

function lazyScript.bitParsers.ifTargetInBlindRange(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetInBlindRange$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetInMediumRange, negate))
	
	return true
end


function lazyScript.masks.TargetInLongRange()
	return CheckInteractDistance("target", 4)
end

function lazyScript.bitParsers.ifTargetInLongRange(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetInLongRange$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetInLongRange, negate))
	
	return true
end


function lazyScript.masks.DebuffSpace()
	if UnitExists("target") then
		for i=1,16 do
			s = UnitDebuff("target", i)
			if (not s) then
				return true
			end
		end
	end
	return false
end

function lazyScript.bitParsers.ifCanDebuff(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?CanDebuff$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.DebuffSpace, negate))
	
	return true
end


function lazyScript.masks.IsAutoWanding(sayNothing)
	if (not lazyScript.GetRangedWeaponTexture()) then
		return false
	end
	return lazyScript.IsAutoWanding(sayNothing)
end

function lazyScript.bitParsers.ifWanding(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Wanding$")) then
		return false
	end
	if (not lazyScript.ClassCanAutoWand()) then
		lazyScript.p(CANT_SHOOT_WANDS)
		return nil
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsAutoWanding, negate))
	return true
end


function lazyScript.masks.IsAutoShooting(sayNothing)
	if (not lazyScript.GetRangedWeaponTexture()) then
		return false
	end
	return lazyScript.IsAutoShooting(sayNothing)
end

function lazyScript.bitParsers.ifShooting(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Shooting$")) then
		return false
	end
	if (not lazyScript.ClassCanAutoShot()) then
		lazyScript.p(NOT_HANE_AUTO_SHOT)
		return nil
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsAutoShooting, negate))
	return true
end


function lazyScript.masks.IsPetAttacking()
	if (not PetHasActionBar()) then
		return false
	end
	
	return UnitExists("pettarget")
end

function lazyScript.bitParsers.ifPetAttacking(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetAttacking$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.masks.HasPet)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsPetAttacking, negate))
	return true
end


function lazyScript.masks.IsPetAggressive(sayNothing)
	actionObj = lazyScript.actions.petAggressive
	return actionObj:IsActive(sayNothing)
end

function lazyScript.bitParsers.ifPetAggressive(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetAggressive$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.masks.HasPet)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsPetAggressive, negate))
	return true
end


function lazyScript.masks.IsPetDefensive(sayNothing)
	actionObj = lazyScript.actions.petDefensive
	return actionObj:IsActive(sayNothing)
end

function lazyScript.bitParsers.ifPetDefensive(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetDefensive$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.masks.HasPet)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsPetDefensive, negate))
	return true
end


function lazyScript.masks.IsPetPassive(sayNothing)
	actionObj = lazyScript.actions.petPassive
	return actionObj:IsActive(sayNothing)
end

function lazyScript.bitParsers.ifPetPassive(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetPassive$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.masks.HasPet)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsPetPassive, negate))
	return true
end


function lazyScript.masks.IsPetFollowing(sayNothing)
	actionObj = lazyScript.actions.petFollow
	return actionObj:IsActive(sayNothing)
end

function lazyScript.bitParsers.ifPetFollowing(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetFollowing$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.masks.HasPet)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsPetFollowing, negate))
	return true
end


function lazyScript.masks.IsPetStaying(sayNothing)
	actionObj = lazyScript.actions.petStay
	return actionObj:IsActive(sayNothing)
end

function lazyScript.bitParsers.ifPetStaying(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetStaying$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.masks.HasPet)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsPetStaying, negate))
	return true
end


function lazyScript.masks.IsTargetNpcFleeing(sayNothing)
	if (lazyScript.npcIsFleeing == UnitName("target")) then
		if (not UnitExists("targettarget")) then
			return true
			elseif not sayNothing then
			lazyScript.npcIsFleeing = nil
		end
	end
	return false
end

function lazyScript.bitParsers.ifTargetNpcFleeing(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetFleeing$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.masks.HaveTarget)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsTargetNpcFleeing, negate))
	return true
end


function lazyScript.masks.HasPet()
	return (UnitExists("pet") == 1)
end

function lazyScript.bitParsers.ifHasPet(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?HasPet$")) then
		return false
	end
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.HasPet, negate))
	return true
end



-- Complex masks
----------------
-- These are masks which require additional parameters or have a structure optimized for run-time
-- efficiency. The mask function must be executed e.g. lazyScript.masks.<functionName>(parameters).
-- The portion of the code that needs to be executed when the button is pressed should appear within
-- "return function() ... end" inside the mask function, everything else will be evaluated at
-- the time that the mask is parsed.


function lazyScript.masks.UnitAlive(unitId)
	return function(sayNothing)
		return (not UnitIsDead(unitId))
	end
end

function lazyScript.bitParsers.ifUnitAlive(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Target|Pet)?Alive$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2)
	
	if unitId == "target" then
		table.insert(masks, lazyScript.masks.HaveTarget)
		elseif unitId == "pet" then
		table.insert(masks, lazyScript.masks.HasPet)
	end
	
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.UnitAlive(unitId), negate))
	return true
end


function lazyScript.masks.IsEquipped(item)
	return function()
		local itemId
		local itemName
		if (string.find(item, '^%d')) then
			itemId = tonumber(item)
			else
			itemName = item
		end
		for slot = 0, 19 do
			local link = GetInventoryItemLink("player", slot)
			if (link) then
				local id, name = lazyScript.IdAndNameFromLink(link)
				if (id) then
					if ((itemId and id == itemId)) then
						return true
						elseif (itemName) then
						if string.lower(name) == string.lower(itemName) then
							return true
						end
					end
				end
			end
		end
		return false
	end
end

function lazyScript.bitParsers.ifEquipped(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Equipped=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local items = lazyScript.match2
	local subMasks = {}
	for item in string.gfind(items, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.IsEquipped(item))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.IsTargetOfTargetClass(class)
	return function()
		return (class == UnitClass("targettarget"))
	end
end

function lazyScript.bitParsers.ifTargetOfTargetClass(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetOfTargetClass=(.+)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	local subMasks = {}
	for class in string.gfind(lazyScript.match2, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.IsTargetOfTargetClass(class))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.IsFlaggedPVP(unit)
	return function()
		if unit ~= "target" then
			if UnitIsPVP("player") then
				return true
				else
				return false
			end
			else
			if (UnitIsPVP("target") and UnitIsEnemy("target","player") and UnitExists("target")) then
				return true
				else
				return false
			end
		end
	end
end

function lazyScript.bitParsers.ifFlaggedPVP(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Player|Target)?FlaggedPVP$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2)
	if (unitId == "target") then
		table.insert(masks, lazyScript.masks.HaveTarget)
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsFlaggedPVP(unitId), negate))
	return true
end


function lazyScript.masks.IsBeingAttackedBy(num, gtLtEq)
	num = tonumber(num)
	return function()
		if (not gtLtEq or gtLtEq == "") then
			return (lazyScript.numberOfAttackers >= num)
		end
		if (gtLtEq == ">") then
			return (lazyScript.numberOfAttackers > num)
			elseif (gtLtEq == "=") then
			return (lazyScript.numberOfAttackers == num)
			else
			return (lazyScript.numberOfAttackers < num)
		end
	end
end

function lazyScript.bitParsers.ifNumAttackers(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if([<=>]?)(%d+)Attackers$")) then
		return false
	end
	local gtLtEq = lazyScript.match1
	local val = tonumber(lazyScript.match2)
	table.insert(masks, lazyScript.masks.IsBeingAttackedBy(val, gtLtEq))
	return true
end


function lazyScript.masks.TargetClass(class)
	return function()
		return (class == UnitClass("target"))
	end
end

function lazyScript.bitParsers.ifTargetClass(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetClass=?(.+)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	local subMasks = {}
	for class in string.gfind(lazyScript.match2, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.TargetClass(class))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.TargetLevel(gtLtEq, val)
	return function()
		if (not UnitExists("target")) then
			return false
		end
		local tLevel = UnitLevel("target")
		if (tLevel == -1) then
			-- "??"
			-- means target is > 10 levels above the player.
			-- hmm, special case.  we can still be smart here.
			-- if the criteria was greater than something, where something
			-- is at most your level + 10, then we can return true.
			-- otherwise we can't be sure.
			local pLevel = UnitLevel("player")
			if (gtLtEq == ">" and (val <= pLevel + 10)) then
				return true
			end
			return false
		end
		
		if (gtLtEq == ">") then
			return (tLevel > val)
			elseif (gtLtEq == "=") then
			return (tLevel == val)
			else
			return (tLevel < val)
		end
	end
end

function lazyScript.bitParsers.ifTargetLevel(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetLevel([<=>])(%d+)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetBoss, true))
	local negate = lazyScript.negate1()
	local gtLtEq = lazyScript.match2
	local val = tonumber(lazyScript.match3)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetLevel(gtLtEq, val), negate))
	return true
end


function lazyScript.masks.TargetMyLevel(gtLtEq, val)
	return function(sayNothing)
		if (not UnitExists("target")) then
			return false
		end
		local tLevel = tonumber(UnitLevel("target"))
		local pLevel = tonumber(UnitLevel("player"))
		local tmp=pLevel+val
		--not sure how to code this with the information availble
		--if (tLevel == -1) then
		-- "??"
		-- means target is > 10 levels above the player.
		-- hmm, special case.  we can still be smart here.
		-- if the criteria was greater than something, where something
		-- is at most your level + 10, then we can return true.
		-- otherwise we can't be sure.
		--    if (gtLtEq == ">" and (tmp <= pLevel + 10)) then
		--       return true
		--    end
		--    return false
		-- end
		if (gtLtEq == ">") then
			if (not sayNothing) then
				lazyScript.d(SEARCH_TARGET_OVER..tmp)
			end
			return (tmp < tLevel)
			elseif (gtLtEq == "=") then
			if (not sayNothing) then
				lazyScript.d(SEARCH_TARGET_EQUAL..tmp)
			end
			return (tmp == tLevel)
			else
			if (not sayNothing) then
				lazyScript.d(SEARCH_TARGET_UNDER..tmp)
			end
			return (tmp > tLevel)
		end
	end
end

function lazyScript.bitParsers.ifTargetMyLevel(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetMyLevel([<=>])(%a*)(%d+)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetBoss, true))
	local val = nil
	local negate = lazyScript.negate1()
	local gtLtEq = lazyScript.match2
	if lazyScript.match3 == "plus" or lazyScript.match3 == "" then
		val = tonumber(lazyScript.match4)
		elseif lazyScript.match3 == "minus" then
		val = tonumber(lazyScript.match4)*(-1)
		else
		lazyScript.d(UNABLE_TO_DETERMINE)
		return nil
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetMyLevel(gtLtEq, val), negate))
	return true
end


function lazyScript.masks.TargetTrivial(sayNothing)
	return UnitIsTrivial("target") or
	(UnitIsPlayer("target") and UnitLevel("player") - UnitLevel("target") > GetQuestGreenRange())
end

function lazyScript.bitParsers.ifTargetTrivial(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetTrivial$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetTrivial, negate))
	return true
end


function lazyScript.masks.TargetType(type)
	return function()
		return (type == UnitCreatureType("target"))
	end
end

function lazyScript.bitParsers.ifTargetType(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetType=?(.+)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	local subMasks = {}
	for type in string.gfind(lazyScript.match2, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.TargetType(type))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.TargetNamed(nameRegex)
	return function()
		local tName = UnitName("target")
		if (tName and string.find(tName, nameRegex)) then
			return true
		end
		return false
	end
end

function lazyScript.bitParsers.ifTargetNamed(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetNamed=(.+)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	local names = lazyScript.match2
	local subMasks = {}
	for name in string.gfind(names, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.TargetNamed(name))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


-- if any of the exception criteria return true, we return FALSE
function lazyScript.masks.InterruptExceptionCriteria(sayNothing)
	local actionInfos = lazyScript.parsedInterruptExceptionCriteriaCache
	
	if (not actionInfos) then
		return true
	end
	
	for idx, actionInfo in ipairs(actionInfos) do
		local action = actionInfo[1] -- should be nil
		local masks = actionInfo[2]
		local areAllTrue = true
		if (masks) then
			for idx, mask in ipairs(masks) do
				if (not mask(sayNothing)) then
					areAllTrue = false
					break
				end
			end
			if (areAllTrue) then
				-- all criteria on this line returned true, so this mask returns false
				return false
			end
		end
	end
	return true
end

function lazyScript.masks.TargetIsCasting(nameRegex)
	local spellTypeStrings = lazyScript.getLocaleString("SPELLTYPE", false, true)
	if spellTypeStrings and nameRegex then
		for k, v in pairs(spellTypeStrings) do
			lazyScript.d(KEY..k..VALUE..v.." SpellTypeRegex: "..nameRegex)
			if string.upper(nameRegex) == string.upper(k) then
				nameRegex = string.upper(v)
				lazyScript.d(MATCHKEY..k..VALUE..v.." SpellTypeRegex: "..nameRegex)
				break
			end
		end
	end
	
	return function(sayNothing)
		if (lazyScript.interrupt.targetCasting and ((GetTime() - lazyScript.interrupt.castingDetectedAt) <= 5)) then
			-- If there is no nameRegex, it's an automatic match
			if (nameRegex == nil or nameRegex == "") then
				return true
			end
			
			--if (not sayNothing) then
			--   lazyScript.d("TargetIsCasting: targetCasting="..lazyScript.interrupt.targetCasting..", nameRegex="..nameRegex)
			--end
			
			-- Check if the nameRegex matches the school of the spell being cast
			if lsConfGlobal.SpellType[lazyScript.interrupt.targetCasting] then
				if lsConfGlobal.SpellType[lazyScript.interrupt.targetCasting][nameRegex] then
					return true
				end
			end
			
			-- Check if the nameRegex matches the spell being cast
			if (string.find(lazyScript.interrupt.targetCasting, nameRegex)) then
				return true
				else
				return false
			end
		end
	end
end

function lazyScript.bitParsers.ifTargetIsCasting(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetIsCasting=?(.*)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	if lazyScript.match2 ~= "" then
		local subMasks = {}
		for nameRegex in string.gfind(lazyScript.match2, "[^,]+") do
			table.insert(subMasks, lazyScript.masks.TargetIsCasting(nameRegex))
		end
		table.insert(masks, lazyScript.orWrapper(subMasks, negate))
		else
		table.insert(masks, lazyScript.negWrapper(lazyScript.masks.TargetIsCasting(), negate))
	end
	
	-- XXX: parsingInterruptExceptionCriteria is set before the interrupt
	-- exception criteria are parsed so that ifTargetIsCasting masks in the
	-- interrupt exception criteria don't insert the InterruptExceptionCriteria
	-- mask and cause an infinite loop. We also don't insert the
	-- InterruptExceptionCriteria mask if this ifTargetIsCasting mask is negated.
	if (not negate and not lazyScript.masks.parsingInterruptExceptionCriteria) then
		table.insert(masks, lazyScript.masks.InterruptExceptionCriteria)
	end
	
	return true
end


function lazyScript.masks.IsKeyDown(key)
	return function()
		if key == lazyScript.relax("Ctrl") then
			return IsControlKeyDown()
			elseif key == lazyScript.relax("Alt") then
			return IsAltKeyDown()
			elseif key == lazyScript.relax("Shift") then
			return IsShiftKeyDown()
		end
		return false
	end
end

function lazyScript.bitParsers.ifKeyDown(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(%a+)Down$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local key = lazyScript.match2
	if (key ~= lazyScript.relax("Ctrl") and key ~= lazyScript.relax("Alt") and key ~= lazyScript.relax("Shift")) then
		lazyScript.p(ONLY_CTRL_ALT_SHIFT..key)
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsKeyDown(key), negate))
	
	return true
end


function lazyScript.masks.Every(action, seconds)
	return function()
		if (GetTime() > (action.everyTimer + seconds)) or (action.everyTimer == nil) then
			return true
		end
		return false
	end
end

function lazyScript.bitParsers.everyXSeconds(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^every(%d+)s$")) then
		return false
	end
	local lastAction = actions[table.getn(actions)]
	if (not lastAction) then
		lazyScript.p(YOU_MUST_PUT)
		return nil
	end
	local val = tonumber(lazyScript.match1)
	table.insert(masks, lazyScript.masks.Every(lastAction, val))
	
	return true
end


function lazyScript.masks.Timer(action, seconds)
	return function(sayNothing)
		if lazyScript.actions[action] then
			if (GetTime() > (lazyScript.actions[action].everyTimer + seconds)) then
				return true
			end
			elseif lazyScript.forms[action] then
			if (GetTime() > (lazyScript.forms[action].everyTimer + seconds)) then
				return true
			end
			elseif lazyScript.items[action] then
			if (GetTime() > (lazyScript.item[action].everyTimer + seconds)) then
				return true
			end
			elseif lazyScript.pseudoActions[action] then
			if (GetTime() > (lazyScript.pseudoActions[action].everyTimer + seconds)) then
				return true
			end
			elseif lazyScript.comboActions[action] then
			if (GetTime() > (lazyScript.comboActions[action].everyTimer + seconds)) then
				return true
			end
			elseif lazyScript.shapeshift[action] then
			if (GetTime() > (lazyScript.shapeshift[action].everyTimer + seconds)) then
				return true
			end
			elseif lazyScript.otherActions[action] then
			if (GetTime() > (lazyScript.otherActions[action].everyTimer + seconds)) then
				return true
			end
		end
		return false
	end
end

function lazyScript.bitParsers.ifTimer(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Timer>([%d%.]+)s=(.+)$")) then
		return false
	end
	if (lazyScript.match2 == nil) or (lazyScript.match3 == nil) then
		lazyScript.p(SYNTAX_EG.."-ifTimer>5s=gouge")
		return nil
	end
	local negate = lazyScript.negate1()
	local val = tonumber(lazyScript.match2)
	if val == nil then
		lazyScript.p(lazyScript.match2..NOT_VALID_NUMBER)
		return nil
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.Timer(lazyScript.match3, val), negate))
	
	return true
end


function lazyScript.masks.LastUsedTimer(action, seconds)
	return function(sayNothing)
		if lazyScript.actions[action] then
			if (GetTime() > (lazyScript.actions[action].nowAndEveryTimer + seconds)) then
				return true
			end
			elseif lazyScript.forms[action] then
			if (GetTime() > (lazyScript.forms[action].nowAndEveryTimer + seconds)) then
				return true
			end
			elseif lazyScript.items[action] then
			if (GetTime() > (lazyScript.item[action].nowAndEveryTimer + seconds)) then
				return true
			end
			elseif lazyScript.pseudoActions[action] then
			if (GetTime() > (lazyScript.pseudoActions[action].nowAndEveryTimer + seconds)) then
				return true
			end
			elseif lazyScript.comboActions[action] then
			if (GetTime() > (lazyScript.comboActions[action].nowAndEveryTimer + seconds)) then
				return true
			end
			elseif lazyScript.shapeshift[action] then
			if (GetTime() > (lazyScript.shapeshift[action].nowAndEveryTimer + seconds)) then
				return true
			end
			elseif lazyScript.otherActions[action] then
			if (GetTime() > (lazyScript.otherActions[action].nowAndEveryTimer + seconds)) then
				return true
			end
		end
		return false
	end
end

function lazyScript.bitParsers.ifLastUsed(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?LastUsed>([%d%.]+)s=(.+)$")) then
		return false
	end
	if (lazyScript.match2 == nil) or (lazyScript.match3 == nil) then
		lazyScript.p(SYNTAX_EG.."-ifLastUsed>5s=gouge")
		return nil
	end
	local negate = lazyScript.negate1()
	local val = tonumber(lazyScript.match2)
	if val == nil then
		lazyScript.p(lazyScript.match2..NOT_VALID_NUMBER)
		return nil
	end
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.LastUsedTimer(lazyScript.match3, val), negate))
	
	return true
end


function lazyScript.masks.InZone(nameRegex)
	return function()
		if (string.find(GetRealZoneText(), nameRegex)) then
			return true
		end
		return false
	end
end

function lazyScript.bitParsers.ifZone(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Zone=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local zones = lazyScript.match2
	local subMasks = {}
	for zone in string.gfind(zones, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.InZone(zone))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end

-- LaYt
function lazyScript.masks.GotTalent(nameRegex)
	return function()
		local tpts = lazyScript.masks.FindTalentPoints(nameRegex)
		lazyScript.d("Search Talent:"..nameRegex)
		lazyScript.d("Talent rank:"..tpts)
		if (tpts > 0) then
			return true
		end
		return false
	end
end

function lazyScript.bitParsers.ifGotTalent(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?GotTalent=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local talents = lazyScript.match2
	local subMasks = {}
	for talent in string.gfind(talents, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.GotTalent(talent))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end
--/LaYt

function lazyScript.masks.History(gtLtEq, val, action)
	return function()
		local historySize = table.getn(lazyScript.actionHistory)
		if (gtLtEq == ">") then
			local i = val + 1
			while true do
				if (not lazyScript.actionHistory[i]) then
					return false
				end
				if (lazyScript.actionHistory[i] == action) then
					return true
				end
				i = i + 1
			end
			elseif (gtLtEq == "<") then
			local i = val - 1
			while (i > 0) do
				if (lazyScript.actionHistory[i] and lazyScript.actionHistory[i] == action) then
					return true
				end
				i = i - 1
			end
			return false
			else
			if (lazyScript.actionHistory[val] and lazyScript.actionHistory[val] == action) then
				return true
			end
			return false
		end
	end
end

function lazyScript.bitParsers.ifHistory(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?History([<=>])(%d+)=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local gtLtEq = lazyScript.match2
	local val = tonumber(lazyScript.match3)
	local actions = lazyScript.match4
	local subMasks = {}
	for action in string.gfind(actions, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.History(gtLtEq, val, action))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end

function lazyScript.bitParsers.ifLastAction(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?LastAction=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local actions = lazyScript.match2
	local subMasks = {}
	for action in string.gfind(actions, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.History("=", 1, action))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.HistoryCount(gtLtEq, val, action)
	return function()
		local count = 0
		for i, entry in ipairs(lazyScript.actionHistory) do
			if entry == action then
				count = count + 1
			end
		end
		
		if (gtLtEq == ">") then
			return count > val
			elseif (gtLtEq == "<") then
			return count < val
			else
			return count == val
		end
	end
end

function lazyScript.bitParsers.ifHistoryCount(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?HistoryCount([<=>])(%d+)=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local gtLtEq = lazyScript.match2
	local val = tonumber(lazyScript.match3)
	local actions = lazyScript.match4
	local subMasks = {}
	for action in string.gfind(actions, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.HistoryCount(gtLtEq, val, action))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.InCooldown(actionObj)
	return function(sayNothing)
		local slot = actionObj:GetSlot(sayNothing)
		if (not slot) then
			return false
		end
		local start, duration, enable = GetActionCooldown(slot);
		if ( (duration - (GetTime() - start)) > 1) then
			return true
			else
			return false
		end
	end
end

function lazyScript.bitParsers.ifInCooldown(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?InCooldown=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local actions = lazyScript.match2
	
	local subMasks = {}
	for action in string.gfind(actions, "[^,]+") do
		local actionObj = lazyScript.actions[action]
		if (not actionObj) then
			lazyScript.p(COULD_NOT_FIND_ACTION..action)
			return nil
		end
		table.insert(subMasks, lazyScript.masks.InCooldown(actionObj))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.ActionCooldownTimeout(actionObj,gtLtEq,val)
	return function(sayNothing)
		local slot = actionObj:GetSlot(sayNothing)
		if (not slot) then
			return false
		end
		local start, duration, enable = GetActionCooldown(slot)
		if gtLtEq == "<" then
			return ((duration - (GetTime() - start)) < val)
			elseif gtLtEq == ">" then
			return ((duration - (GetTime() - start)) > val)
		end
	end
end

function lazyScript.bitParsers.ifActionCooldownTimeout(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Cooldown([<>])(%d+)s=(.+)$")) then
		return false
	end
	
	local negate = lazyScript.negate1()
	local gtLtEq = lazyScript.match2
	local val = tonumber(lazyScript.match3)
	local actions = lazyScript.match4
	
	local subMasks = {}
	for action in string.gfind(actions, "[^,]+") do
		local actionObj = lazyScript.actions[action]
		if (not actionObj) then
			lazyScript.p(COULD_NOT_FIND_ACTION..action)
			return nil
		end
		table.insert(subMasks, lazyScript.masks.ActionCooldownTimeout(actionObj,gtLtEq,val))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.ItemInCooldown(myItemObj)
	return function(sayNothing)
		local slot, bag = myItemObj:GetItemSlot(sayNothing)
		if (not slot) then
			return true
		end
		
		local start, duration, isEnabled
		if not bag then
			start, duration, enable = GetInventoryItemCooldown("player", slot)
			else
			start, duration, isEnabled = GetContainerItemCooldown(bag, slot)
		end
		
		if ( (duration - (GetTime() - start)) > 1) then
			return true
			else
			return false
		end
		
	end
end

function lazyScript.bitParsers.ifItemInCooldown(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?ItemInCooldown=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local items = lazyScript.match2
	
	local subMasks = {}
	for item in string.gfind(items, "[^,]+") do
		local itemId
		local itemName
		if (string.find(item, '^%d')) then
			itemId = tonumber(item)
			itemName = ITEM..itemId
			else
			itemName = item
		end
		
		local myItemObj = lazyScript.items[item]
		if (not myItemObj) then
			myItemObj = lazyScript.Item:New(item, itemName, itemId, false)
		end
		
		table.insert(subMasks, lazyScript.masks.ItemInCooldown(myItemObj))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.ItemCooldownTimeout(myItemObj, gtLtEq, val)
	return function(sayNothing)
		local slot, bag = myItemObj:GetItemSlot(sayNothing)
		if (not slot) then
			return true
		end
		
		local start, duration, isEnabled
		if not bag then
			start, duration, enable = GetInventoryItemCooldown("player", slot)
			else
			start, duration, isEnabled = GetContainerItemCooldown(bag, slot)
		end
		
		if gtLtEq == "<" then
			return ((duration - (GetTime() - start)) < val)
			elseif gtLtEq == ">" then
			return ((duration - (GetTime() - start)) > val)
		end
		
	end
end

function lazyScript.bitParsers.ifItemCooldownTimeout(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?ItemCooldown([<>])(%d+)s=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local gtLtEq = lazyScript.match2
	local val = tonumber(lazyScript.match3)
	local items = lazyScript.match4
	
	local subMasks = {}
	for item in string.gfind(items, "[^,]+") do
		local itemId
		local itemName
		if (string.find(item, '^%d')) then
			itemId = tonumber(item)
			itemName = ITEM..itemId
			else
			itemName = item
		end
		
		local myItemObj = lazyScript.items[item]
		if (not myItemObj) then
			myItemObj = lazyScript.Item:New(item, itemName, itemId, false)
		end
		
		table.insert(subMasks, lazyScript.masks.ItemCooldownTimeout(myItemObj, gtLtEq, val))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.IsImmune(action)
	return function(sayNothing)
		if (lazyScript.perPlayerConf.Immunities[action] and lazyScript.perPlayerConf.Immunities[action][UnitName("target")]) then
			if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
				if (not sayNothing) then
					lazyScript.d("-ifTargetImmune:  "..UnitName("target")..HAS_IMMUNITY_TO..action)
				end
			end
			return true
		end
		return false
	end
end

function lazyScript.bitParsers.ifTargetImmune(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?TargetImmune=?(.*)$")) then
		return false
	end
	table.insert(masks, lazyScript.masks.HaveTarget)
	local negate = lazyScript.negate1()
	if (lazyScript.match2 ~= "") then
		local subMasks = {}
		for thisAction in string.gfind(lazyScript.match2, "[^,]+") do
			local actionObj = lazyScript.actions[thisAction]
			if actionObj and actionObj.name then
				thisAction = actionObj.name
			end
			table.insert(subMasks, lazyScript.masks.IsImmune(thisAction))
		end
		table.insert(masks, lazyScript.orWrapper(subMasks, negate))
		else
		local lastAction = actions[table.getn(actions)]
		if (not lastAction) then
			lazyScript.p(IFTARGETIMMUNE_MUST_APPEAR_AFTER)
			return nil
		end
		lazyScript.d("IfTargetImmune lastAction: "..lastAction.name)
		table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsImmune(lastAction.name), negate))
	end
	return true
end


function lazyScript.masks.isTracking(trackObj)
	return function()
		if (GetTrackingTexture() == nil) then
			return false
			elseif ((GetTrackingTexture() == trackObj.texture)) then
			return true
		end
		return false
	end
end

function lazyScript.bitParsers.ifTracking(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Tracking=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local trackItems = string.lower(lazyScript.match2 or "")
	local subMasks = {}
	for trackItem in string.gfind(trackItems, "[^,]+") do
		local found = false
		for trackKey, trackObj in pairs(lazyScript.trackers) do
			if (trackItem == trackKey) then
				table.insert(subMasks, lazyScript.masks.isTracking(trackObj))
				found = true
				break
			end
		end
		if (not found) then
			lazyScript.p(DID_NOT_RECOGNICE..trackItem)
			return nil
		end
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end

function lazyScript.masks.IsRace(unitId, race)
	return function()
		local raceLocal, raceEnglish = UnitRace(unitId)
		return (race == raceLocal or race == raceEnglish)
	end
end

function lazyScript.bitParsers.ifRace(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Player|Target)?Race=(.*)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local unitId = string.lower(lazyScript.match2 or "")
	
	if (unitId == "target") then
		table.insert(masks, lazyScript.masks.HaveTarget)
		else
		unitId = "player"
	end
	
	local subMasks = {}
	for race in string.gfind(lazyScript.match3 or "", "[^,]+") do
		table.insert(subMasks, lazyScript.masks.IsRace(unitId, race))
	end
	
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.IsCasting()
	return lazyScript.spellcastInProgress
end

function lazyScript.bitParsers.ifCasting(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Casting$")) then
		return false
	end
	
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsCasting, negate))
	return true
end


function lazyScript.masks.IsChannelling()
	return lazyScript.channellingInProgress
end

function lazyScript.bitParsers.ifChannelling(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Channelling$")) then
		return false
	end
	
	local negate = lazyScript.negate1()
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsChannelling, negate))
	return true
end


function lazyScript.masks.IsUsable(actionObj)
	return function(sayNothing)
		local slot = actionObj:GetSlot(sayNothing)
		if not slot then
			return false
		end
		return IsUsableAction(slot) == 1
	end
end

function lazyScript.bitParsers.ifUsable(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?Usable=(.+)$")) then
		return false
	end
	
	local negate = lazyScript.negate1()
	local actions = lazyScript.match2
	
	local subMasks = {}
	for action in string.gfind(actions, "[^,]+") do
		local actionObj = lazyScript.actions[action]
		if (not actionObj) then
			lazyScript.p(COULD_NOT_FIND_ACTION..action)
			return nil
		end
		table.insert(subMasks, lazyScript.masks.IsUsable(actionObj))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.IsCurrentAction(actionObj)
	return function(sayNothing)
		local slot = actionObj:GetSlot(sayNothing)
		if (not slot) then
			return false
		end
		return (IsCurrentAction(slot) == 1)
	end
end

function lazyScript.bitParsers.ifCurrentAction(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?CurrentAction=?(.*)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local subMasks = {}
	local actionObj = nil
	if (lazyScript.match2 ~= "") then
		for action in string.gfind(lazyScript.match2, "[^,]+") do
			actionObj = lazyScript.actions[action]
			if (not actionObj) then
				lazyScript.p(UNRECOGNISED_ACTION..action)
				return nil
			end
			table.insert(subMasks, lazyScript.masks.IsCurrentAction(actionObj))
		end
		table.insert(masks, lazyScript.orWrapper(subMasks, negate))
		else
		actionObj = actions[table.getn(actions)]
		if (not actionObj) then
			lazyScript.p(ACTION_MUST_APPEAR_BEFORE)
			return nil
		end
		table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsCurrentAction(actionObj),negate))
	end
	return true
end


function lazyScript.masks.EventTime(time, op, val)
	if time ~= nil then
		local elapsed = GetTime() - time
		if op == "<" then
			return elapsed < val
			elseif op == ">" then
			return elapsed > val
			else
			if not sayNothing then
				lazyScript.p(INVALID_OPERATOR..op)
			end
			return false
		end
		else
		return false
	end
end

function lazyScript.masks.Dodged(unitId, op, val)
	return function(sayNothing)
		return lazyScript.masks.EventTime(lazyScript.lastDodgeTime[unitId], op, val)
	end
end

function lazyScript.masks.Blocked(unitId, op, val)
	return function(sayNothing)
		return lazyScript.masks.EventTime(lazyScript.lastBlockTime[unitId], op, val)
	end
end

function lazyScript.masks.Parried(unitId, op, val)
	return function(sayNothing)
		return lazyScript.masks.EventTime(lazyScript.lastParryTime[unitId], op, val)
	end
end

function lazyScript.masks.Resisted(unitId, op, val)
	return function(sayNothing)
		return lazyScript.masks.EventTime(lazyScript.lastResistTime[unitId], op, val)
	end
end

function lazyScript.bitParsers.ifEventTime(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(Player|Target)?(Dodged|Blocked|Parried|Resisted)([<>][%d%.]+s)?$")) then
		return false
	end
	
	if not lazyScript.DodgeParryBlockResistLocalized() then
		lazyScript.p("ifDodged/Parried/Blocked/Resisted"..ARE_NOT_SUPPORTED)
		return nil
	end
	
	local negate = lazyScript.negate1()
	
	local unitId = lazyScript.match2
	if unitId == "" then
		unitId = "player"
		else
		unitId = string.lower(unitId)
	end
	
	local event = lazyScript.match3
	local eventFunc = lazyScript.masks[event]
	
	local op = nil
	local val = nil
	local factor = lazyScript.match4
	if factor and factor ~= "" then
		op = string.sub(factor, 1, 1)
		local s = string.sub(factor, 2, -2)
		val = tonumber(s)
		if val == nil then
			lazyScript.p("'"..s..IS_NOT_VALID_NUMBER)
			return nil
		end
	end
	
	if op == nil then
		op = "<"
		val = 5
	end
	
	table.insert(masks, lazyScript.negWrapper(eventFunc(unitId, op, val), negate))
	return true
end


function lazyScript.masks.InRange(actionObj)
	return function(sayNothing)
		local slot = actionObj:GetSlot(sayNothing)
		if (not slot) then
			return false
		end
		return (IsActionInRange(slot) == 1)
	end
end

function lazyScript.bitParsers.ifInRange(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?InRange=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local actions = lazyScript.match2
	
	local subMasks = {}
	for action in string.gfind(actions, "[^,]+") do
		local actionObj = lazyScript.actions[action]
		if (not actionObj) then
			lazyScript.p(COULD_NOT_FIND_ACTION..action)
			return nil
		end
		table.insert(subMasks, lazyScript.masks.InRange(actionObj))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	return true
end


function lazyScript.masks.PetName(name)
	return function(sayNothing)
		local unitName = UnitName("pet")
		if unitName then
			return (string.lower(unitName) == string.lower(name))
		end
		return false
	end
end

function lazyScript.bitParsers.ifPetName(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetName=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local name = lazyScript.match2
	
	table.insert(masks, lazyScript.masks.HasPet)
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.PetName(name),negate))
	return true
end


function lazyScript.masks.PetFamily(family)
	return function(sayNothing)
		local unitFamily = UnitCreatureFamily("pet")
		if unitFamily then
			return (string.lower(unitFamily) == string.lower(family))
		end
		return false
	end
end

function lazyScript.bitParsers.ifPetFamily(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?PetFamily=(.+)$")) then
		return false
	end
	local negate = lazyScript.negate1()
	local families = lazyScript.match2
	
	table.insert(masks, lazyScript.masks.HasPet)
	
	local subMasks = {}
	for family in string.gfind(families, "[^,]+") do
		table.insert(subMasks, lazyScript.masks.PetFamily(family))
	end
	table.insert(masks, lazyScript.orWrapper(subMasks, negate))
	
	return true
end


function lazyScript.masks.TimeToDeath(gtLtEq, val)
	return function(sayNothing)
		local slope, timeToDeath = lazyScript.deathstimator.timeToDeath()
		if (not timeToDeath) or (slope > 0) then
			return false
		end
		
		if (not sayNothing) then
			lazyScript.d(DEATH_IN_2..timeToDeath..SECONDS)
		end
		
		if gtLtEq == "<" then
			return timeToDeath < val
			elseif gtLtEq == ">" then
			return timeToDeath > val
			elseif gtLtEq == "=" then
			return timeToDeath == val
		end
		
		return false
	end
end

function lazyScript.bitParsers.ifTimeToDeath(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^ifTimeToDeath([<=>])(%d+)s$")) then
		return false
	end
	local gtLtEq = lazyScript.match1
	local val = tonumber(lazyScript.match2)
	
	if (not MobHealth_GetTargetCurHP) then
		lazyScript.p(TIMETODEATH_CANNOT_ESTIMATED)
		return nil
	end
	
	table.insert(masks, lazyScript.masks.HaveTarget)
	table.insert(masks, lazyScript.masks.TimeToDeath(gtLtEq, val))
	return true
end


function lazyScript.masks.IsWeaponBuffed(weapon)
	return function(sayNothing)
		local bMh, tMh, cMh, bOh, tOh, cOh = GetWeaponEnchantInfo()
		if (weapon == "MainHand" and bMh) then
			return true
			elseif (weapon == "OffHand" and bOh) then
			return true
			else
			return false
		end
		return false
	end
end

function lazyScript.bitParsers.ifWeaponBuffed(bit, actions, masks)
	if (not lazyScript.rebit(bit, "^if(Not)?(%a+)Buffed$")) then
		return false
	end
	if (lazyScript.match2 ~= "MainHand" and lazyScript.match2 ~= "OffHand") then
		lazyScript.p("ifWeaponBuffed: "..ONLY_MAIN_OR_OFF_HAND_SUPPORTED..lazyScript.match2)
		return nil
	end
	
	local negate = lazyScript.negate1()
	local weapon = lazyScript.match2
	table.insert(masks, lazyScript.negWrapper(lazyScript.masks.IsWeaponBuffed(weapon), negate))
	
	return true
end



-- Utility functions
--------------------
-- These are functions that are never called by a form but are used within other mask functions.
-- Technically, they are not masks, but we'll leave them alone for now.

function lazyScript.masks.FindTalentPoints(icon)
	-- Okay, there is no event that gets fired when talents have changed, so
	-- normally we'd need to scan the talent tree every single time.
	-- Instead, for fun, we cache talent point lookups for 1 minute.  Not sure
	-- how much this really helps performance, but hey.
	
	local cacheInfo = lazyScript.talentCache[icon]
	if (cacheInfo) then
		local time = cacheInfo[1]
		local rank = cacheInfo[2]
		if (time and time > (GetTime() - 60)) then
			return rank
		end
	end
	
	rank = 0
	for i = 1, GetNumTalentTabs() do
		for j = 1, GetNumTalents(i) do
			local name, thisIcon, _, _, rank, max = GetTalentInfo(i, j)
			if (thisIcon and string.find(thisIcon, icon)) then
				lazyScript.talentCache[icon] = {GetTime(), rank}
				return rank
			elseif (name and string.find(name, icon)) then
				lazyScript.d("icon:'"..icon.."' name:'"..name)
				lazyScript.talentCache[icon] = {GetTime(), rank}
				return rank
			end
		end
	end
	
	lazyScript.talentCache[icon] = {GetTime(), 0}
	return 0
end

function lazyScript.masks.BehindAttackHasNotFailedRecently()
	return ((GetTime() - lazyScript.behindAttackLastFailedAt) >= .3)
end

function lazyScript.masks.InFrontAttackHasNotFailedRecently()
	return ((GetTime() - lazyScript.inFrontAttackLastFailedAt) >= .3)
end


-- Yes, I'm lazy. :P
function lazyScript.negate1()
	return lazyScript.match1 == lazyScript.relax("Not")
end


function lazyScript.spellSearch(actionObj)
	if (not actionObj) then
		return false
	end
	for spellIndex = 1, 1000 do
		local texture = GetSpellTexture(spellIndex,"spell")
		if (not texture) then
			lazyScript.d(SPELLSEARCH_FOUND_NIL_TEXTURE..spellIndex..".")
			return false
			elseif (texture == actionObj.texture) then
			lazyScript.d(SPELLSEARCH_FOUND..actionObj.code..AT_INDEX..spellIndex..".")
			return spellIndex
		end
	end
	lazyScript.d(SPELLDEARCH_FOUND_MORE_THAN..spellIndex..SPELLS)
	return false
end

function lazyScript.getRangeCheckAction()
	local rangeCheckAction = nil
	local _, class = UnitClass("player")
	if class == "ROGUE" then
		rangeCheckAction = lazyScript.actions.ss
		elseif class == "DRUID" then
		rangeCheckAction = lazyScript.actions.growl
		elseif class == "HUNTER" then
		rangeCheckAction = lazyScript.actions.wingClip
		elseif class == "WARRIOR" then
		rangeCheckAction = lazyScript.actions.rend
	end
	
	return rangeCheckAction
end

lazyScript.VALID_UNIT_IDS = {
	"^player",
	"^pet",
	"^(party)(%d)",
	"^(partypet)(%d)",
	"^(raid)(%d%d?)",
	"^(raidpet)(%d%d?)",
	"^target",
	"^mouseover"
}

function lazyScript.validateUnitId(unitId)
	if  string.find(unitId, "^mouseover") then
		local unitFF = lazyScript.GetUnitIdFromFrame()
		if unitFF then
			unitId = unitFF
		else
			unitId = "mouseover"
		end
	end
	for _, validUnitId in ipairs(lazyScript.VALID_UNIT_IDS) do
		s, e, base, n = string.find(unitId, validUnitId)
		if s then
			n = tonumber(n)
			if n and not (((base == "party" or base == "partypet") and (n >= 1 and n <= 4)) or
			((base == "raid" or base == "raidpet") and (n >= 1 and n <= 40))) then
            return false
			end
			
			local unit = string.sub(unitId, e + 1)
			if unit == "" then
				return unitId
			end
			
			while string.sub(unit, 1, 6) == "target" do
				unit = string.sub(unit, 7)
			end
			if unit == "" then
				return unitId
			end
			
			break
		end
	end
	return false
end

function lazyScript.GetUnitIdFromFrame()
	local frame = GetMouseFocus()
	if (LunaUF and frame) then
		return frame.unit
	end
	if (pfUI and frame and frame.label and frame.id) then
        return frame.label .. frame.id
	end
	if (NotGrid and frame and frame.unit) then
		return frame.unit
	end
	return nil
end
	