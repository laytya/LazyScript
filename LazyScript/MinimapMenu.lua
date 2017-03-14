lazyScript.metadata:updateRevisionFromKeyword("$Revision: 746 $")

-- Minimap Button Handling

lazyScript.mm = {}


function lazyScript.mm.OnLoad()
	this:SetFrameLevel(this:GetFrameLevel()+1)
	this:RegisterForClicks("LeftButtonDown", "RightButtonDown")
	this:RegisterEvent("VARIABLES_LOADED")
end

function lazyScript.mm.OnClick(button)
	if (button == "LeftButton") then
		-- Toggle menu
		local menu = getglobal("LazyScriptMinimapMenu")
		menu.point = "TOPRIGHT"
		menu.relativePoint = "CENTER"
		ToggleDropDownMenu(1, nil, menu, "LazyScriptMinimapButton", -120, 0)
	end
end

function lazyScript.mm.OnEvent()
	lazyScript.mm.UpdateMinimap()
	if (lazyScript.perPlayerConf.mmIsVisible) then
		this:Show()
		LazyScriptMinimapButton:Show()
		else
		this:Hide()
		LazyScriptMinimapButton:Hide()
	end
end

function lazyScript.mm.OnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT")
	GameTooltip:SetText(lazyScript.metadata.name)
	local defaultForm = lazyScript.perPlayerConf.defaultForm
	if (not defaultForm) then
		defaultForm = MINIMAP_BUTTON_MENU_NONE
	end
	GameTooltip:AddLine(MINIMAP_BUTTON_TOOLTIP_CURRENT_FORM..defaultForm)
	GameTooltip:AddLine(MINIMAP_BUTTON_TOOLTIP_1)
	GameTooltip:AddLine(MINIMAP_BUTTON_TOOLTIP_2)
	GameTooltip:Show()
end

function lazyScript.mm.UpdateMinimap()
	lazyScript.mm.MoveButton()
	if (Minimap:IsVisible()) then
		LazyScriptMinimapButton:EnableMouse(true)
		LazyScriptMinimapButton:Show()
		LazyScriptMinimapFrame:Show()
		else
		LazyScriptMinimapButton:EnableMouse(false)
		LazyScriptMinimapButton:Hide()
		LazyScriptMinimapFrame:Hide()
	end
end

function lazyScript.mm.Menu_Initialize()
	if (not lazyScript.perPlayerConf) then
		-- just loading, skip it for now
		return
	end
	
	if (UIDROPDOWNMENU_MENU_LEVEL == 1) then
		
		local formNames = {}
		for form, actions in pairs(lazyScript.perPlayerConf.forms) do
			table.insert(formNames, form)
		end
		
		table.sort(formNames)
		
		local info = {}
		info.isTitle = 1
		info.text = lazyScript.metadata:getNameVersionRevisionString()
		UIDropDownMenu_AddButton(info)
		
		for idx, formName in ipairs(formNames) do
			local actions = lazyScript.perPlayerConf.forms[formName]
			local info = {}
			info.text = formName
			info.value = formName
			info.func = lazyScript.mm.Menu_ClickFunc(formName)
			info.checked = (lazyScript.perPlayerConf.defaultForm and lazyScript.perPlayerConf.defaultForm == formName)
			info.keepShownOnClick = 1
			info.hasArrow = 1
			info.tooltipTitle = formName
			info.tooltipText = ""
			for idx, action in ipairs(actions) do
				info.tooltipText = info.tooltipText.."\n- "..action
			end
			UIDropDownMenu_AddButton(info)
		end
		
		info = {}
		info.text = MINIMAP_BUTTON_MENU_CREATE_NEW_FORM
		info.func = lazyScript.mm.Menu_ClickSubFunction("New")
		UIDropDownMenu_AddButton(info)
		
		info = {}
		info.text = MINIMAP_BUTTON_MENU_OPT
		info.value = "Options"
		info.keepShownOnClick = 1
		info.hasArrow = 1
		UIDropDownMenu_AddButton(info)
		
		if (lazyScript.CustomMenu ~= nil) then
			lazyScript.CustomMenu()
		end
		
		info = {}
		info.text = MINIMAP_BUTTON_MENU_IMOPT
		info.value = "ImmunityMenu"
		info.keepShownOnClick = 1
		info.hasArrow = 1
		UIDropDownMenu_AddButton(info)
		
		info = {}
		info.text = MINIMAP_BUTTON_MENU_CINTOPT
		info.value = "Interrupts"
		info.keepShownOnClick = 1
		info.hasArrow = 1
		UIDropDownMenu_AddButton(info)
		
		info = {}
		info.text = MINIMAP_BUTTON_MENU_DEB
		info.value = "Debugging"
		info.keepShownOnClick = 1
		info.hasArrow = 1
		UIDropDownMenu_AddButton(info)
		
		info = {}
		info.text = MINIMAP_BUTTON_MENU_HELP
		info.func = lazyScript.mm.Menu_ClickSubFunction("Help")
		UIDropDownMenu_AddButton(info)
		
		info = {}
		info.text = MINIMAP_BUTTON_MENU_ABOUT
		info.func = lazyScript.mm.Menu_ClickSubFunction("About")
		UIDropDownMenu_AddButton(info)
		
		elseif (UIDROPDOWNMENU_MENU_LEVEL == 2) then
		if (lazyScript.CustomMenu ~= nil) then
			lazyScript.CustomMenu()
		end
		
		if (UIDROPDOWNMENU_MENU_VALUE == "Options") then
			
			local info = {}
			info.isTitle = 1
			info.text = lazyScript.metadata.name..MINIMAP_BUTTON_MENU_OPT_TITLE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_OPT_AT
			if (lazyScript.perPlayerConf.autoTarget) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("AutoTarget")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_OPT_AT_INITIATE
			if (lazyScript.perPlayerConf.initiateAutoAttack) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("InitiateAutoAttack")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_OPT_SM
			if (lazyScript.perPlayerConf.minionIsVisible) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("Show Minion")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_OPT_ONLY_IN_COMBAT
			if (lazyScript.perPlayerConf.minionHidesOutOfCombat) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("Show Minion in Combat")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			-- Added by lokyst
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_OPT_SM_ALWAYS_SHOW_ACTION
			if (lazyScript.perPlayerConf.showActionAlways) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("Always show action")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_OPT_SD
			if (lazyScript.perPlayerConf.deathMinionIsVisible) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("Show Death Minion")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_OPT_ONLY_IN_COMBAT
			if (lazyScript.perPlayerConf.deathMinionHidesOutOfCombat) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("Show Death Minion in Combat")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.isTitle = 1
			info.text = MINIMAP_BUTTON_MENU_OPT_SD_DEATHSTIMATOR_SAMPLE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			for idx, i in ipairs({3, 5, 10, 15, 30, 60}) do
				local info = {}
				info.text = "... "..i.."s"
				if (lazyScript.perPlayerConf.healthHistorySize == i) then
					info.checked = true
				end
				info.keepShownOnClick = 1
				info.func = lazyScript.mm.Menu_ClickSubFunction("Deathstimate "..i)
				UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			end
			
			
			elseif (UIDROPDOWNMENU_MENU_VALUE == "ImmunityMenu") then
			local info = {}
			info.isTitle = 1
			info.text = MINIMAP_BUTTON_MENU_IMOPT_TITLE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			if (lazyScript.perPlayerConf.useImmunities) then
				info.text = MINIMAP_BUTTON_MENU_IMOPT_STOP_IMMUNITY_TRACKING
				else
				info.text = MINIMAP_BUTTON_MENU_IMOPT_START_IMMUNITY_TRACKING
			end
			info.func = lazyScript.mm.Menu_ClickSubFunction("Immunity")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_IMOPT_EDIT_IMMUNITY_EXCEPTION
			info.func = lazyScript.mm.Menu_ClickSubFunction("Global Immunity Criteria")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			elseif (UIDROPDOWNMENU_MENU_VALUE == "Interrupts") then
			
			local info = {}
			info.isTitle = 1
			info.text = MINIMAP_BUTTON_MENU_CINTOPT_TITLE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_CINTOPT_EDIT_INTERRUPT_EXCEPTION_CRITERIA
			info.func = lazyScript.mm.Menu_ClickSubFunction("Global Interrupt Criteria")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.isTitle = 1
			local lastInterrupted
			if (lazyScript.interrupt.lastSpellInterrupted) then
				lastInterrupted = lazyScript.interrupt.lastSpellInterrupted
				else
				lastInterrupted = MINIMAP_BUTTON_MENU_NONE
			end
			info.text = MINIMAP_BUTTON_MENU_CINTOPT_LAST_INTERRUPTED..lastInterrupted
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_CINTOPT_DONT_INTERRUPT_IT_AGAIN
			info.func = lazyScript.mm.Menu_ClickSubFunction("noLongerInterruptLastInterrupted")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			elseif (UIDROPDOWNMENU_MENU_VALUE == "Debugging") then
			
			local info = {}
			info.isTitle = 1
			info.text = MINIMAP_BUTTON_MENU_DEB_TITLE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_DEB_LOG_WHEN_TARGET_CASTS
			if (lazyScript.perPlayerConf.showTargetCasts) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("showTargetCasts")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_DEB_SHOW_WHY_WHEN
			if (lazyScript.perPlayerConf.showReasonForTargetCCd) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("showReasonForTargetCCd")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_DEB_DISPLAY_GANKED_INFO
			if (lazyScript.perPlayerConf.showGankMessage) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("showGankMessage")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_DEB_AH
			info.value = "History"
			info.keepShownOnClick = 1
			info.hasArrow = 1
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_DEB_CLEAR_HISTORY_AFTER_COMBAT
			if (lazyScript.perPlayerConf.clearHistoryAfterCombat) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("clearHistoryAfterCombat")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			local info = {}
			info.text = MINIMAP_BUTTON_MENU_DEB_ITERNAL..lazyScript.metadata.name..MINIMAP_BUTTON_MENU_DEB_DEBUGGING_NOISY
			if (lazyScript.perPlayerConf.debug) then
				info.checked = true
			end
			info.keepShownOnClick = 1
			info.func = lazyScript.mm.Menu_ClickSubFunction("debug")
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			elseif (lazyScript.perPlayerConf.forms[UIDROPDOWNMENU_MENU_VALUE] ~= nil) then
			-- a submenu of a form
			local info = {}
			info.isTitle = 1
			info.text = UIDROPDOWNMENU_MENU_VALUE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			for idx, op in ipairs({MINIMAP_BUTTON_MENU_FORM_EDIT, MINIMAP_BUTTON_MENU_FORM_COPY, MINIMAP_BUTTON_MENU_FORM_DELETE}) do
				local info = {}
				info.text = "< "..op.." >"
				info.func = lazyScript.mm.Menu_ClickSubFunction(op, UIDROPDOWNMENU_MENU_VALUE)
				UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			end
			
			info = {}
			info.text = MINIMAP_BUTTON_MENU_FORM_SETKEY
			info.value = UIDROPDOWNMENU_MENU_VALUE
			info.keepShownOnClick = 1
			info.hasArrow = 1
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
		end
		
		elseif (UIDROPDOWNMENU_MENU_LEVEL == 3) then
		if (lazyScript.CustomMenu ~= nil) then
			lazyScript.CustomMenu()
		end
		
		if (UIDROPDOWNMENU_MENU_VALUE == "History") then
			local info = {}
			info.isTitle = 1
			info.text = MINIMAP_BUTTON_MENU_DEB_AH_TITLE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			info = {}
			for idx, action in ipairs(lazyScript.actionHistory) do
				info.text = idx..". "..action
				UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			end
			
			elseif (UIDROPDOWNMENU_MENU_VALUE ~= nil) then
			-- a keybinding submenu of a form
			local info = {}
			info.isTitle = 1
			info.text = MINIMAP_BUTTON_MENU_FORM_SETKEY_TITLE
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			
			info = {}
			for i = 1,10 do
				if lazyScript.perPlayerConf.BoundFormsTable[i] then
					info.text = i..": "..lazyScript.perPlayerConf.BoundFormsTable[i]
					else
					info.text = MINIMAP_BUTTON_MENU_FORM_SETKEY_KEYBIND..i
				end
				info.func = lazyScript.mm.Menu_SetKeyBindFunction(i, UIDROPDOWNMENU_MENU_VALUE)
				UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
			end
		end
	end
end

function lazyScript.mm.Menu_ClickFunc(form)
	return function()
		lazyScript.SlashCommand("default "..form)
		CloseDropDownMenus()
		LazyScriptMinimapButton:Click()
		-- This is a hack to deal with the code in UIDropDownMenu.lua.
		-- This makes it so if a button was already checked, it remains checked,
		-- which is what I want.
		if (this.checked) then
			this.checked = nil
		end
	end
end

function lazyScript.mm.Menu_SetKeyBindFunction(index, form)
	return function()
		if (not index) or (not form) then
			return
		end
		lazyScript.perPlayerConf.BoundFormsTable[index] = form
		lazyScript.p(SETKEY_KEYBIND..index..SETKEY_KEYBIND_TO_FORM..form..".")
	end
end

function lazyScript.mm.Menu_ClickSubFunction(op, form)
	return function()
		if (not form) then
			form = ""
		end
		if (op == "New" or op == MINIMAP_BUTTON_MENU_FORM_EDIT) then
			lazyScript.SlashCommand("edit "..form)
			CloseDropDownMenus()
			elseif (op == "Immunity") then
			lazyScript.SlashCommand("useImmunitiesList")
			CloseDropDownMenus()
			LazyScriptMinimapButton:Click()
			elseif (op == MINIMAP_BUTTON_MENU_FORM_COPY) then
			local newName
			for i = 1, 10 do
				newName = form.."-"..i
				if (not lazyScript.perPlayerConf.forms[newName]) then
					lazyScript.SlashCommand("copy "..form.." "..newName)
					break
				end
			end
			CloseDropDownMenus()
			LazyScriptMinimapButton:Click()
			elseif (op == MINIMAP_BUTTON_MENU_FORM_DELETE) then
			CloseDropDownMenus()
			StaticPopupDialogs["LAZYSCRIPT_DELETE_FORM"] = {
				-- English is ok if no locale string is found
				text = lazyScript.getLocaleString("DELETE_FORM", true),
				button1 = TEXT(OKAY),
				button2 = TEXT(CANCEL),
				OnAccept = function()
					lazyScript.SlashCommand("clear "..form)
				end,
				timeout = 0,
				whileDead = 1,
				exclusive = 1,
				hideOnEscape = 1
			};
			StaticPopup_Show("LAZYSCRIPT_DELETE_FORM", form);
			
			elseif (op == "Help") then
			LazyScriptFormHelp:Show()
			
			elseif (op == "About") then
			lazyScript.SlashCommand("about")
			
			elseif (op == "AutoTarget") then
			lazyScript.SlashCommand("autoTarget")
			lazyScript.mm.RefreshMenu2("Options")
			
			elseif (op == "InitiateAutoAttack") then
			lazyScript.SlashCommand("initiateAutoAttack")
			elseif (op == "Show Minion") then
			if (lazyScript.perPlayerConf.minionIsVisible) then
				lazyScript.SlashCommand("dismiss")
                else
				lazyScript.SlashCommand("summon")
			end
			elseif (op == "Show Minion in Combat") then
			lazyScript.SlashCommand("hideMinionOutOfCombat")
			elseif (op == "Show Death Minion") then
			if (lazyScript.perPlayerConf.deathMinionIsVisible) then
				lazyScript.SlashCommand("dismissDeath")
                else
				lazyScript.SlashCommand("summonDeath")
			end
			elseif (op == "Always show action") then
			if (lazyScript.perPlayerConf.showActionAlways) then
				lazyScript.perPlayerConf.showActionAlways = false
				lazyScript.minion.SetText(lazyScript.perPlayerConf.defaultForm)
                else
				lazyScript.perPlayerConf.showActionAlways = true
				lazyScript.minion.OnUpdate()
			end
			elseif (op == "Show Death Minion in Combat") then
			lazyScript.SlashCommand("hideDeathMinionOutOfCombat")
			elseif (op == "Deathstimate 3") then
			lazyScript.perPlayerConf.healthHistorySize = 3
			lazyScript.mm.RefreshMenu("Options")
			elseif (op == "Deathstimate 5") then
			lazyScript.perPlayerConf.healthHistorySize = 5
			lazyScript.mm.RefreshMenu("Options")
			elseif (op == "Deathstimate 10") then
			lazyScript.perPlayerConf.healthHistorySize = 10
			lazyScript.mm.RefreshMenu("Options")
			elseif (op == "Deathstimate 15") then
			lazyScript.perPlayerConf.healthHistorySize = 15
			lazyScript.mm.RefreshMenu("Options")
			elseif (op == "Deathstimate 30") then
			lazyScript.perPlayerConf.healthHistorySize = 30
			lazyScript.mm.RefreshMenu("Options")
			elseif (op == "Deathstimate 60") then
			lazyScript.perPlayerConf.healthHistorySize = 60
			lazyScript.mm.RefreshMenu("Options")
			
			elseif (op == "Global Immunity Criteria") then
			lazyScript.SlashCommand("immunityExceptionCriteria")
			elseif (op == "Global Interrupt Criteria") then
			lazyScript.SlashCommand("interruptExceptionCriteria")
			elseif (op == "noLongerInterruptLastInterrupted") then
			lazyScript.SlashCommand("noLongerInterruptLastInterrupted")
			
			
			elseif (op == "debug") then
			lazyScript.SlashCommand("debug")
			elseif (op == "showTargetCasts") then
			lazyScript.SlashCommand("showTargetCasts")
			elseif (op == "showReasonForTargetCCd") then
			lazyScript.SlashCommand("showReasonForTargetCCd")
			elseif (op == "showGankMessage") then
			lazyScript.SlashCommand("showGankMessage")
			elseif (op == "clearHistoryAfterCombat") then
			lazyScript.SlashCommand("clearHistoryAfterCombat")
			
		end
		
	end
end

function lazyScript.mm.RefreshMenu(which)
	UIDropDownMenu_Initialize(LazyScriptMinimapMenu, lazyScript.mm.Menu_Initialize, which)
	-- again, a hack to deal with the code in UIDropDownMenu.lua.
	if (this.checked) then
		this.checked = nil
	end
end

function lazyScript.mm.RefreshMenu2(which)
	UIDropDownMenu_Initialize(LazyScriptMinimapMenu, lazyScript.mm.Menu_Initialize, which)
	-- again, a hack to deal with the code in UIDropDownMenu.lua.
	if (this.checked) then
		this.checked = nil
		else
		this.checked = true
	end
end

-- Thanks to Yatlas for this code
function lazyScript.mm.Button_BeingDragged()
    -- Thanks to Gello for this code
    local xpos,ypos = GetCursorPosition()
    local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()
	
    xpos = xmin-xpos/UIParent:GetScale()+70
    ypos = ypos/UIParent:GetScale()-ymin-70
	
    lazyScript.mm.Button_SetPosition(math.deg(math.atan2(ypos,xpos)))
end

function lazyScript.mm.Button_SetPosition(v)
    if(v < 0) then
        v = v + 360
	end
	
    lazyScript.perPlayerConf.minimapButtonPos = v
    lazyScript.mm.MoveButton()
end

function lazyScript.mm.MoveButton()
	local where = lazyScript.perPlayerConf.minimapButtonPos
	LazyScriptMinimapFrame:ClearAllPoints()
	LazyScriptMinimapFrame:SetPoint("TOPLEFT", "Minimap", "TOPLEFT",
		52 - (80 * cos(where)),
	(80 * sin(where)) - 52)
end