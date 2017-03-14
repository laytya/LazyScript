lazyMage = {}
lazyMageLoad = {}

lazyMageLoad.metadata = lazyScript.Metadata:new("LazyMage")
lazyMageLoad.metadata:updateRevisionFromKeyword("$Revision: 571 $")

function lazyMageLoad.OnLoad()
	-- Check that this player is the correct class
	local localeClass, class = UnitClass("player")
	if class ~= "MAGE" then
		return
	end
	
	-- Check that we're compatible with LazyScript
	if not lazyScript.CheckCompatibility(lazyMageLoad.metadata) then
		return
	end
	
	-- I like everything with the same name. It makes S&R so easy
	lazyMage = lazyScript
	lazyMageLocale = lsLocale
	-- Unfortunately this overwrites everything that we already had called lazyMage.
	-- Load everything else in class specific files using these loading functions
	-- Localization must be loaded first!
	lazyMageLoad.LoadMageLocalization(GetLocale())
	lazyMageLoad.LoadParseMage()
	
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PLAYER_LOGIN")
	
	this:RegisterEvent("BAG_UPDATE")
end

function lazyMageLoad.OnEvent()
	if (event == "BAG_UPDATE") then
		lazyMage.CheckStones()
		elseif (event == "VARIABLES_LOADED") then
		-- Nothing yet
		
		elseif (event == "PLAYER_LOGIN") then
		lazyMage.chat(lazyMageLoad.metadata:getNameVersionRevisionString()..MAGE_ADDON_LOADED..lazyScript.metadata.name.."!")
	end
end