lazyScript.metadata:updateRevisionFromKeyword("$Revision: 622 $")

-- Tooltip caching

lazyScript.tooltip = {}
lazyScript.tooltip.debug = false

lazyScript.tooltip.cachableUnitIds = {
	player = true,
	pet = true,
	target = true,
}
for i = 1, 5 do
	lazyScript.tooltip.cachableUnitIds["party"..i] = true
	lazyScript.tooltip.cachableUnitIds["partypet"..i] = true
end
for i = 1, 40 do
	lazyScript.tooltip.cachableUnitIds["raid"..i] = true
	lazyScript.tooltip.cachableUnitIds["raidpet"..i] = true
end


function lazyScript.tooltip.OnLoad()
	this:RegisterEvent("PLAYER_ENTERING_WORLD")
	this:RegisterEvent("PLAYER_AURAS_CHANGED")
	this:RegisterEvent("PLAYER_TARGET_CHANGED")
	this:RegisterEvent("UNIT_AURA")
	this:RegisterEvent("UNIT_AURASTATE")
	this:RegisterEvent("PARTY_MEMBERS_CHANGED")
	this:RegisterEvent("RAID_ROSTER_UPDATE")
	this:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
end

function lazyScript.tooltip.OnEvent()
	-- the tooltip needs re-pointing on any event we're catching
	lazyScript.Tooltip.currentlyPointing = nil
	
	if (event == "PLAYER_ENTERING_WORLD") then
		lazyScript.Tooltip:ResetCache()
		
		elseif (event == "PLAYER_AURAS_CHANGED") then
		lazyScript.Tooltip.cache.playerBuffs = {}
		lazyScript.Tooltip.cache.unitBuffs.player = {}
		lazyScript.Tooltip.cache.unitDebuffs.player = {}
		
		elseif (event == "PLAYER_TARGET_CHANGED") then
		lazyScript.Tooltip.cache.unitBuffs.target = {}
		lazyScript.Tooltip.cache.unitDebuffs.target = {}
		
		elseif (event == "UNIT_AURA" or event == "UNIT_AURASTATE") then
		local unitId = arg1
		if (unitId) then
			lazyScript.tooltip.d(event..": "..unitId)
			lazyScript.Tooltip.cache.unitBuffs[unitId] = {}
			lazyScript.Tooltip.cache.unitDebuffs[unitId] = {}
		end
		
		elseif (event == "PARTY_MEMBERS_CHANGED") then
		for idx, val in ipairs(lazyScript.Tooltip.cache.unitBuffs) do
			if (string.sub(idx, 1, 5) == "party") then
				lazyScript.Tooltip.cache.unitBuffs[idx] = nil
				lazyScript.tooltip.d(event..CLEARING_CACHE_FOR..idx)
			end
		end
		for idx, val in ipairs(lazyScript.Tooltip.cache.unitDebuffs) do
			if (string.sub(idx, 1, 5) == "party") then
				lazyScript.Tooltip.cache.unitDebuffs[idx] = nil
				lazyScript.tooltip.d(event..CLEARING_CACHE_FOR..idx)
			end
		end
		
		elseif (event == "RAID_ROSTER_UPDATE") then
		for idx, val in ipairs(lazyScript.Tooltip.cache.unitBuffs) do
			if (string.sub(idx, 1, 4) == "raid") then
				lazyScript.Tooltip.cache.unitBuffs[idx] = nil
				lazyScript.tooltip.d(event..CLEARING_CACHE_FOR..idx)
			end
		end
		for idx, val in ipairs(lazyScript.Tooltip.cache.unitDebuffs) do
			if (string.sub(idx, 1, 4) == "raid") then
				lazyScript.Tooltip.cache.unitDebuffs[idx] = nil
				lazyScript.tooltip.d(event..CLEARING_CACHE_FOR..idx)
			end
		end
		
		elseif (event == "ACTIONBAR_SLOT_CHANGED") then
		lazyScript.Tooltip.cache.actionSlots = {}
		
	end
end


lazyScript.TooltipClass = {}
function lazyScript.TooltipClass:New()
	local obj = {}
	setmetatable(obj, { __index = self })
	obj:ResetCache()
	obj.ttObjs = {}
	obj.currentlyPointing = nil
	obj.hits = 0
	obj.misses = 0
	return obj
end

function lazyScript.TooltipClass:ResetCache()
	self.cache = {}
	self.cache.playerBuffs = {}
	self.cache.unitBuffs = {}
	self.cache.unitDebuffs = {}
	self.cache.actionSlots = {}
end

function lazyScript.TooltipClass:GetTextLeftN(n)
	if (not self.ttObjs[n]) then
		self.ttObjs[n] = getglobal("LazyScript_TooltipTextLeft"..n)
		if (not self.ttObjs[n]) then
			return nil
		end
	end
	return self.ttObjs[n]:GetText()
end

function lazyScript.TooltipClass:IsCachableUnitId(unitId)
	return (lazyScript.tooltip.cachableUnitIds[unitId] == true)
end

function lazyScript.TooltipClass:GetCachedVal(...)
	local ptr = self.cache
	for i = 1, (arg.n - 1) do
		if (not ptr[arg[i]]) then
			ptr[arg[i]] = {}
		end
		ptr = ptr[arg[i]]
	end
	local val = ptr[arg[arg.n]]
	if (val) then
		self.hits = self.hits + 1
		else
		lazyScript.tooltip.d("GetCachedVal: MISS: "..table.concat(arg, ":"))
		self.misses = self.misses + 1
	end
	return val
end

function lazyScript.TooltipClass:SetCachedVal(...)
	local ptr = self.cache
	for i = 1, (arg.n - 2) do
		if (not ptr[arg[i]]) then
			ptr[arg[i]] = {}
		end
		ptr = ptr[arg[i]]
	end
	ptr[arg[arg.n - 1]] = arg[arg.n]
end

function lazyScript.TooltipClass:PointTooltip(where, ...)
	local pointTo = where..":"..table.concat(arg, ":")
	if (self.currentlyPointing ~= pointTo) then
		--lazyScript.tooltip.d("PointTooltip: had to move the tooltip: "..pointTo)
		LazyScript_Tooltip:ClearLines()
		if (where == "actionSlots") then
			local actionSlot = arg[1]
			LazyScript_Tooltip:SetAction(actionSlot)
			elseif (where == "unitBuffs") then
			local unitId = arg[1]
			local buffId = arg[2]
			LazyScript_Tooltip:SetUnitBuff(unitId, buffId)
			elseif (where == "unitDebuffs") then
			local unitId = arg[1]
			local debuffId = arg[2]
			LazyScript_Tooltip:SetUnitDebuff(unitId, debuffId)
			elseif (where == "playerBuffs") then
			local buffIndex = arg[1]
			LazyScript_Tooltip:SetPlayerBuff(buffIndex)
		end
		self.currentlyPointing = pointTo
	end
end


function lazyScript.TooltipClass:GetActionTextLeftN(actionSlot, n)
	local val = self:GetCachedVal("actionSlots", actionSlot, n)
	if (not val) then
		self:PointTooltip("actionSlots", actionSlot)
		val = self:GetTextLeftN(n)
		self:SetCachedVal("actionSlots", actionSlot, n, val)
	end
	return val
end


function lazyScript.TooltipClass:GetUnitBuffOrDebuffNumLines(unitId, buffOrDebuff, buffId)
	local where
	if (buffOrDebuff == "buff") then
		where = "unitBuffs"
		else
		where = "unitDebuffs"
	end
	if (not self:IsCachableUnitId(unitId)) then
		self:PointTooltip(where, unitId, buffId)
		return LazyScript_Tooltip:NumLines()
	end
	local val = self:GetCachedVal(where, unitId, buffId, "numLines")
	if (not val) then
		self:PointTooltip(where, unitId, buffId)
		val = LazyScript_Tooltip:NumLines()
		self:SetCachedVal(where, unitId, buffId, "numLines", val)
	end
	return val
end

function lazyScript.TooltipClass:GetUnitBuffOrDebuffTextLeftN(unitId, buffOrDebuff, buffId, n)
	local where
	if (buffOrDebuff == "buff") then
		where = "unitBuffs"
		else
		where = "unitDebuffs"
	end
	if (not self:IsCachableUnitId(unitId)) then
		self:PointTooltip(where, unitId, buffId)
		return self:GetTextLeftN(n)
	end
	local val = self:GetCachedVal(where, unitId, buffId, n)
	if (not val) then
		self:PointTooltip(where, unitId, buffId)
		val = self:GetTextLeftN(n)
		self:SetCachedVal(where, unitId, buffId, n, val)
	end
	return val
end



function lazyScript.TooltipClass:GetPlayerBuffTextLeftN(buffIndex, n)
	local val = self:GetCachedVal("playerBuffs", buffIndex, n)
	if (not val) then
		self:PointTooltip("playerBuffs", buffIndex)
		val = self:GetTextLeftN(n)
		self:SetCachedVal("playerBuffs", buffIndex, n, val)
	end
	return val
end



lazyScript.Tooltip = lazyScript.TooltipClass:New()




-- stuff for debugging/diagnostics

function lazyScript.tooltip.d(msg)
	if (lazyScript.tooltip.debug) then
		lazyScript.chat("### tooltip cache: "..msg, .9, .9, 0)
	end
end

function lazyScript.tooltip.stats()
	lazyScript.chat("### tooltip stats ###", .9, .9, 0)
	lazyScript.chat("hits: "..lazyScript.Tooltip.hits, .9, .9, 0)
	lazyScript.chat("misses: "..lazyScript.Tooltip.misses, .9, .9, 0)
end

function lazyScript.tooltip.dump(table, n)
	if (not table) then
		lazyScript.chat("### tooltip cache dump ###", .9, .9, 0)
		table = lazyScript.Tooltip.cache
		n = 1
	end
	for idx, val in ipairs(table) do
		local indent = ""
		for i = 1, n do
			indent = indent.."  "
		end
		if (type(val) == 'table') then
			lazyScript.chat(indent.."t: "..idx, .9, .9, 0)
			lazyScript.tooltip.dump(val, n + 1)
			else
			lazyScript.chat(indent..idx..": "..val, .9, .9, 0)
		end
	end
end