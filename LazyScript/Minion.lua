lazyScript.metadata:updateRevisionFromKeyword("$Revision: 527 $")

-- Minion support

lazyScript.minion = {}

lazyScript.minion.lastUpdate = 0
lazyScript.minion.updateInterval = 0.1


function lazyScript.minion.OnUpdate()
	if (not lazyScript.addOnIsActive) then
		return
	end
	if (not lazyScript.perPlayerConf.minionIsVisible) then
		return
	end
	
	local now = GetTime()
	if (now >= (lazyScript.minion.lastUpdate + lazyScript.minion.updateInterval)) then
		lazyScript.minion.lastUpdate = now
		
		if (lazyScript.perPlayerConf.minionHidesOutOfCombat) then
			if (not lazyScript.isInCombat and LazyScriptMinionFrame:IsShown()) then
				lazyScript.d(HIDE_THING_NOT_COMBAT)
				LazyScriptMinionFrame:Hide()
			end
			if (lazyScript.isInCombat and not LazyScriptMinionFrame:IsShown()) then
				lazyScript.d(SHOW_THING_IN_COMBAT)
				LazyScriptMinionFrame:Show()
			end
		end
		
		if (lazyScript.isInCombat or lazyScript.perPlayerConf.showActionAlways) then
			local noParse = true
			local actions = lazyScript.FindParsedForm(lazyScript.perPlayerConf.defaultForm, noParse)
			if (actions) then
				local doNothing = true
				local triggerAction, actions = lazyScript.TryActions(actions, doNothing)
				if (not triggerAction) then
					lazyScript.minion.SetText(ZZZ)
					else
					local text
					for _, action in ipairs(actions) do
						if action.minionOverride then
							text = action.name
							break
						end
						if not ((action.code == "echo" or action.code == "ping") and triggerAction.triggersGlobal) then
							if text then
								text = text..", "..action.name
								else
								text = action.name
							end
						end
					end
					lazyScript.minion.SetText(text)
				end
			end
		end
	end
end

function lazyScript.minion.OnEnter(button)
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	GameTooltip:AddLine(lazyScript.metadata.name..MINION)
	GameTooltip:AddLine(MINION_TOOLTIP)
	GameTooltip:Show()
end

function lazyScript.minion.OnLeave(button)
	GameTooltip:Hide()
end

function lazyScript.minion.SetText(text)
	if (not text) then
		text = ""
	end
	LazyScriptMinionText:SetText(text)
end