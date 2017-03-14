lazyScript.metadata:updateRevisionFromKeyword("$Revision: 712 $")

lazyScript.about = {}
lazyScript.about.tabText = {}

function lazyScript.about.ScrollFrame_OnSizeChanged()
	this:GetScrollChild():SetWidth(this:GetWidth()+40)
	if this:GetScrollChild().currentText then
		this:GetScrollChild():SetText(this:GetScrollChild().currentText)
		this:UpdateScrollChildRect()
	end
end

function lazyScript.about.OnLoad()
	PanelTemplates_SetNumTabs(LazyScriptAboutFrame, 2)
	LazyScriptAboutFrame.selectedTab = 1
	PanelTemplates_UpdateTabs(LazyScriptAboutFrame)
end

function lazyScript.about.OnShow()
	PanelTemplates_SetTab(LazyScriptAboutFrame, 1)
	lazyScript.about.OnTabButtonClick("LazyScriptAboutFrameTab1", LazyScriptAboutFrameTab1:GetText())
end

function lazyScript.about.OnTabButtonClick(tabId, tabName)
	--lazyScript.p("OnTabButtonClick "..tabId..": "..tabName)
	
	-- If help text has not been initialized yet, do so.
	if not lazyScript.about.tabText[tabName] then
		lazyScript.about.SetupTabText()
	end
	
	local text = lazyScript.about.tabText[tabName]
	LazyScriptAboutFrameScrollFrameText.currentText = text -- save it for forcing a relayout when resizing
	LazyScriptAboutFrameScrollFrameText:SetText(text)
	LazyScriptAboutFrameScrollFrameScrollBar:SetValue(0);
	LazyScriptAboutFrameScrollFrame:UpdateScrollChildRect()
end

function lazyScript.about.SetupTabText()
	lazyScript.about.SetupAboutText()
	lazyScript.about.SetupContributorsText()
end

function lazyScript.about.SetupAboutText()
	local text = "<HTML><BODY>"
	text = text.."<H1 ALIGN=\"CENTER\">${title}</H1>"
	text = text.."<H2 ALIGN=\"CENTER\">"..ABOUT_ALL_ROPE.."</H2><BR/>"
	text = text.."<P ALIGN=\"CENTER\">"..ABOUT_BROUGHT.."<BR/>"
	text = text.."lokyst<BR/>dOxxx<BR/>Nelar<BR/>and Ithilyn</P><BR/>"
	text = text.."<P ALIGN=\"CENTER\">"..ABOUT_SIGNIFICANT_CONTRIBUTIONS.."<BR/>"
	text = text.."FreeSpeech</P><BR/>"
	text = text.."<P ALIGN=\"CENTER\">"..ABOUT_TO_USE.."</P><BR/>"
	text = text.."<P ALIGN=\"CENTER\">|cffff8040${slashCmd}|r</P><BR/>"
	text = text.."<P ALIGN=\"CENTER\">"..ABOUT_SEE_WEBSITES.."<BR/><BR/>"
	text = text.."|cff6060ffhttp://www.ithilyn.com/|r<BR/>"
	text = text.."|cff6060ffhttp://ui.worldofwar.net/ui.php?id=1574|r<BR/>"
	text = text.."|cff6060ffhttp://code.google.com/p/lazyscript/|r</P>"
	text = text.."</BODY></HTML>"
	
	text = string.gsub(text, "${title}", lazyScript.metadata:getNameVersionRevisionString())
	text = string.gsub(text, "${slashCmd}", SLASH_LAZYSCRIPT1)
	
	lazyScript.about.tabText[About] = text
end

function lazyScript.about.SetupContributorsText()
	local contributors = {
		"Tannon",
		"Sketchy",
		"Karl The Pagan",
		"Tragath",
		"LunaEclipse",
		"Highend",
	}
	table.sort(contributors)
	
	
	local text = "<HTML><BODY>"
	text = text.."<H1 ALIGN=\"CENTER\">"..ABOUT_LAZYCONTRIBUTORS.."</H1>"
	text = text.."<H2 ALIGN=\"CENTER\">"..ABOUT_ALL_TESTING.."</H2><BR/>"
	text = text.."<P>"..ABOUT_MANY_THANKS.."<BR/>${contributors}.</P>"
	text = text.."</BODY></HTML>"
	
	text = string.gsub(text, "${contributors}", table.concat(contributors, ", "))
	lazyScript.about.tabText[Contributors] = text
end