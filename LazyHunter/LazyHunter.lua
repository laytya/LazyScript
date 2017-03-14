lazyHunter = {}
lazyHunterLoad = {}

lazyHunterLoad.metadata = lazyScript.Metadata:new("LazyHunter")
lazyHunterLoad.metadata:updateRevisionFromKeyword("$Revision: 358 $")

function lazyHunterLoad.OnLoad()
	-- Check that this player is the correct class
	local localeClass, class = UnitClass("player")
	if class ~= "HUNTER" then
		return
	end
	
	-- Check that we're compatible with LazyScript
	if not lazyScript.CheckCompatibility(lazyHunterLoad.metadata) then
		return
	end
	
	-- I like everything with the same name. It makes S&R so easy
	lazyHunter = lazyScript
	lazyHunterLocale = lsLocale
	-- Unfortunately this overwrites everything that we already had called lazyHunter.
	-- Load everything else in class specific files using these loading functions
	-- Localization must be loaded first!
	lazyHunterLoad.LoadHunterLocalization(GetLocale())
	lazyHunterLoad.LoadParseHunter()
	
	this:RegisterEvent("PLAYER_LOGIN")
	this:RegisterEvent("VARIABLES_LOADED")
end

function lazyHunterLoad.OnEvent()
	if (event == "VARIABLES_LOADED") then
		-- Nothing yet
		
		elseif (event == "PLAYER_LOGIN") then
		lazyHunter.chat(lazyHunterLoad.metadata:getNameVersionRevisionString()..HUNTER_ADDON_LOADED..lazyScript.metadata.name.."!")
		
	end
end