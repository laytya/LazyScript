lazyWarlock = {}
lazyWarlockLoad = {}

lazyWarlockLoad.metadata = lazyScript.Metadata:new("LazyWarlock")
lazyWarlockLoad.metadata:updateRevisionFromKeyword("$Revision: 414 $")

function lazyWarlockLoad.OnLoad()
	-- Check that this player is the correct class
	local localeClass, class = UnitClass("player")
	if class ~= "WARLOCK" then
		return
	end
	
	-- Check that we're compatible with LazyScript
	if not lazyScript.CheckCompatibility(lazyWarlockLoad.metadata) then
		return
	end
	
	-- I like everything with the same name. It makes S&R so easy
	lazyWarlock = lazyScript
	lazyWarlockLocale = lsLocale
	-- Unfortunately this overwrites everything that we already had called lazyWarlock.
	-- Load everything else in class specific files using these loading functions
	-- Localization must be loaded first!
	lazyWarlockLoad.LoadWarlockLocalization(GetLocale())
	lazyWarlockLoad.LoadParseWarlock()
	
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PLAYER_LOGIN")
	
	this:RegisterEvent("BAG_UPDATE")
end

function lazyWarlockLoad.OnEvent()
	if (event == "BAG_UPDATE") then
		lazyWarlock.CheckStones()
		elseif (event == "VARIABLES_LOADED") then
		-- Nothing yet
		elseif (event == "PLAYER_LOGIN") then
		lazyWarlock.chat(lazyWarlockLoad.metadata:getNameVersionRevisionString()..WARLOCK_ADDON_LOADED..lazyScript.metadata.name.."!")
	end
end