lazyScript.metadata:updateRevisionFromKeyword("$Revision: 702 $")

--Immunity Code - Thanks to Astryl - http://www.curse-gaming.com/en/wow/addons-3321-1-feralskills.html


function lazyScript.WatchForImmunes(text)
	local immune = lazyScript.getLocaleString("IMMUNE", false, true)
	local immuneProblemCreatures = lazyScript.getLocaleString("IMMUNITYPROBLEMCREATURES", false, true)
	if (not immune) then
		lazyScript.d(IMMUNITY_TRACKING_NOT_SUPPORTED)
		return
	end
	if (not immuneProblemCreatures) then
		lazyScript.d(IMMUNITY_TRACKING_NOT_100)
	end
	for spell, creature in string.gfind(text, immune) do
		--Ignore non-targets (or at least, try, based on name), banished targets,
		-- or known problematic targets (targets that have temporary immunities)
		if (UnitName('target') ~= creature or lazyScript.masks.HasBuffOrDebuff("target", "debuff", nil, "Cripple", nil)) then
			return
		end
		for _, problemCreature in ipairs(immuneProblemCreatures) do
			if string.find(creature, problemCreature) then
				return
			end
		end
		--ignore players namly pallys
		if UnitIsPlayer("target") then
			return
		end
		if lazyScript.perPlayerConf.Immunities[spell] then
			if lazyScript.perPlayerConf.Immunities[spell][creature] then
				return
			end
		end
		
		lazyScript.d(IMMUNITY_DETECTED..spell..IMMUNITY_CREATURE..creature)
		if not lazyScript.perPlayerConf.Immunities[spell] then
			lazyScript.perPlayerConf.Immunities[spell] = {};
		end
		lazyScript.perPlayerConf.Immunities[spell][creature] = true;
	end
end


-- damage type tracking F3 - Saved globally across chars.
function lazyScript.WatchForType(text)
	local spellText = lazyScript.getLocaleString("SPELLTEXT", false, true)
	local spellTypeStrings = lazyScript.getLocaleString("SPELLTYPE", false, true)
	if (not spellText) or (not spellTypeStrings) then
		lazyScript.d(IMMUNITY_TYPE_TRACKING_NOT_SUPPORTED)
		return
	end
	
	local spell = nil
	local spellType = nil
	for _, pat in ipairs(spellText) do
		for match1, match2 in string.gfind(text, pat) do
			for _, localeString in pairs(spellTypeStrings) do
				if match1 == localeString then
					spell = match2
					spellType = match1
					break
					elseif match2 == localeString then
					spell = match1
					spellType = match2
					break
				end
			end
			
			if (not spell) or (not spellType) then
				-- Take this out eventually
				lazyScript.d(COULD_NOT_DETERMINE_SPELLTYPE..text)
				return
			end
			
			if lsConfGlobal.SpellType[spell] then
				if lsConfGlobal.SpellType[spell][string.upper(spellType)] then
					return
				end
				else
				lazyScript.d(NEW_SPELL_TYPE_DETECTED..spell..TYPE..spellType)
				lsConfGlobal.SpellType[spell] = {};
				lsConfGlobal.SpellType[spell][string.upper(spellType)] = true
			end
		end
	end
end


-- Immunity Criteria Edit Box F3/Ith

lazyScript.immunityEditBox = {}

lazyScript.immunityEditBox.cancelEdit = false

function lazyScript.immunityEditBox.OnShow()
	local text = ""
	for action, mobs in pairs(lazyScript.perPlayerConf.Immunities) do
		for mob in pairs(mobs) do
			lazyScript.d(action)
			lazyScript.d(mob)
			text = text..action.."#ImmuneOn#"..mob.."\r\n"
		end
	end
	if text=="" then
		text = "Cheap Shot#ImmuneOn#Example Creature\r\n"
	end
	LazyScriptImmunityExceptionCriteriaEditFrameForm:SetText(text)
end

function lazyScript.immunityEditBox.OnHide()
	if (lazyScript.immunityEditBox.cancelEdit) then
		lazyScript.immunityEditBox.cancelEdit = false
		return
	end
	
	local text = LazyScriptImmunityExceptionCriteriaEditFrameForm:GetText()
	
	lazyScript.perPlayerConf.Immunities = {}
	
	for arg in string.gfind(text, "[^\r\n]+") do
		lazyScript.re(arg, "^(.+)#ImmuneOn#(.+)$")
		if lazyScript.match1 and lazyScript.match2 then
			if not lazyScript.perPlayerConf.Immunities[lazyScript.match1] then
				lazyScript.perPlayerConf.Immunities[lazyScript.match1] = {};
			end
			lazyScript.perPlayerConf.Immunities[lazyScript.match1][lazyScript.match2] = true
		end
	end
	
	lazyScript.p(GLOBAL_IMMUNITY_CRITERIA_UPDATED)
end