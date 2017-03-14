lazyScript.metadata:updateRevisionFromKeyword("$Revision: 746 $")

-- Deathstimator support

lazyScript.deathstimator = {}

function lazyScript.deathstimator.OnUnitHealth(unitId)
	if (unitId == "target") then
		-- Doesn't matter if it's hp or hpp
		local hp = UnitHealth(unitId)
		if not hp then
			return
		end
		lazyScript.targetHealthHistory:AddInfo(hp)
	end
end


-- Target Health History Object
-- Used for computing the best fit line (slope) for the Target's health.
--
-- Compute the best slope using the method of least squares.
-- http://www.acad.sunytccc.edu/instruct/sbrown/stat/leastsq.htm
--
-- Wow, I NEVER thought I'd ever use ANYTHING like this in real life.
-- Haha, and then, it's only for a computer game.
-- Ms. Chen, my high school Calculus teacher, would be so proud.  Nah,
-- probably still too pissed at me.
--

lazyScript.deathstimator.minEntries = 5
lazyScript.deathstimator.HealthHistory = {}

function lazyScript.deathstimator.HealthHistory:New()
	local obj = {}
	setmetatable(obj, { __index = self })
	lazyScript.deathstimator.HealthHistory.Reset(obj)
	return obj
end

function lazyScript.deathstimator.HealthHistory:Reset()
	self.info = {}
	self.ctr = 0
	self.lastCtrComputed = 0
	self.m = 0
end

function lazyScript.deathstimator.HealthHistory:AddInfo(hp)
	self.ctr = self.ctr + 1
	
	local now = GetTime()
	table.insert(self.info, { time = now, hp = hp })
	
	-- Remove entries which are older than the configured sample window,
	-- but retain a minimum number of entries.
	--local ct = 0
	local cutOffTime = now - lazyScript.perPlayerConf.healthHistorySize
	while table.getn(self.info) > lazyScript.deathstimator.minEntries do
		if self.info[1].time >= cutOffTime then
			break
		end
		table.remove(self.info, 1)
		--ct = ct + 1
	end
	--lazyScript.d("AddInfo: trimmed "..ct.." expired entries.")
end

function lazyScript.deathstimator.HealthHistory:GetN()
	return table.getn(self.info)
end

function lazyScript.deathstimator.HealthHistory:ComputeSlope()
	local n = self:GetN()
	if (n == 0) then
		return nil
	end
	if (self.ctr == self.lastCtrComputed) then
		return self.m
	end
	self.lastCtrComputed = self.ctr
	
	local xSum = 0
	local ySum = 0
	local xSquaredSum = 0
	local xySum = 0
	for idx, healthInfo in ipairs(self.info) do
		local time = healthInfo.time
		local hp = healthInfo.hp
		-- time is the x access, hp is the y access
		xSum = xSum + time
		ySum = ySum + hp
		xSquaredSum = xSquaredSum + (time * time)
		xySum = xySum + (time * hp)
	end
	
	if (xSquaredSum == 0 or xSum == 0) then
		return nil
	end
	
	self.m = ( (n * xySum) - (xSum * ySum) ) / ( (n * xSquaredSum) - (xSum * xSum) )
	
	return self.m
end




-- Deathstimator minion

lazyScript.deathstimator.minion = {}
lazyScript.deathstimator.minion.lastUpdate = 0
lazyScript.deathstimator.minion.updateInterval = 0.25


function lazyScript.deathstimator.minion.OnUpdate()
	if (not lazyScript.addOnIsActive) then
		return
	end
	if (not lazyScript.perPlayerConf.deathMinionIsVisible) then
		return
	end
	
	local now = GetTime()
	if (now >= (lazyScript.deathstimator.minion.lastUpdate + lazyScript.deathstimator.minion.updateInterval)) then
		lazyScript.deathstimator.minion.lastUpdate = now
		
		if (lazyScript.perPlayerConf.deathMinionHidesOutOfCombat) then
			if (not lazyScript.isInCombat and LazyScriptDeathstimatorFrame:IsShown()) then
				lazyScript.d(YOURE_NOT_IN_COMBAT)
				LazyScriptDeathstimatorFrame:Hide()
			end
			if (lazyScript.isInCombat and not LazyScriptDeathstimatorFrame:IsShown()) then
				lazyScript.d(YOURE_IN_COMBAT)
				LazyScriptDeathstimatorFrame:Show()
			end
		end
		
		if (not UnitName("target")) then
			return
		end
		
		if (lazyScript.isInCombat) then
			local text
			local m, timeToDeath = lazyScript.deathstimator.timeToDeath()
			if m == nil then
				text = GATHERING
				elseif m > 0 then
				-- Target is gaining health. Recalibrate.
				text = RECALIBRATING
				else
				text = DEATH_IN..string.format("%.1f", timeToDeath)..S
			end
			lazyScript.deathstimator.minion.SetText(text)
		end
	end
end

function lazyScript.deathstimator.minion.OnEnter(button)
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	GameTooltip:AddLine(lazyScript.metadata.name.." "..DEATHSTIMATOR)
	GameTooltip:AddLine(DEATHSTIMATOR_TOOLTIP)
	GameTooltip:Show()
end

function lazyScript.deathstimator.minion.OnLeave(button)
	GameTooltip:Hide()
end

function lazyScript.deathstimator.minion.SetText(text)
	if (not text) then
		text = ""
	end
	LazyScriptDeathstimatorText:SetText(text)
end

function lazyScript.deathstimator.timeToDeath()
	if (not UnitExists("target")) then
		return nil
	end
	
	local currentHp = UnitHealth("target")
	if (not currentHp or currentHp == 0) then
		return nil
	end
	
	local n = lazyScript.targetHealthHistory:GetN()
	-- we want at least two data points to make a line
	if (n < 2) then
		return nil
	end
	
	local m = lazyScript.targetHealthHistory:ComputeSlope()
	-- m is the slope, or hp(p) per second
	if (not m) then
		return nil
	end
	
	return m, math.abs(currentHp / m)
end