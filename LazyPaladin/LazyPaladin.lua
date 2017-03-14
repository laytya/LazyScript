lazyPaladin = {}
lazyPaladinLoad = {}

lazyPaladinLoad.metadata = lazyScript.Metadata:new("LazyPaladin")
lazyPaladinLoad.metadata:updateRevisionFromKeyword("$Revision: 358 $")

function lazyPaladinLoad.OnLoad()
	-- Check that this player is the correct class
	local localeClass, class = UnitClass("player")
	if class ~= "PALADIN" then
		return
	end
	
	-- Check that we're compatible with LazyScript
	if not lazyScript.CheckCompatibility(lazyPaladinLoad.metadata) then
		return
	end
	
	-- I like everything with the same name. It makes S&R so easy
	lazyPaladin = lazyScript
	lazyPaladinLocale = lsLocale
	-- Unfortunately this overwrites everything that we already had called lazyPaladin.
	-- Load everything else in class specific files using these loading functions
	-- Localization must be loaded first!
	lazyPaladinLoad.LoadPaladinLocalization(GetLocale())
	lazyPaladinLoad.LoadParsePaladin()
	
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PLAYER_LOGIN")
end

function lazyPaladinLoad.OnEvent()
	if (event == "VARIABLES_LOADED") then
		-- Nothing yet
		
		elseif (event == "PLAYER_LOGIN") then
		lazyPaladin.chat(lazyPaladinLoad.metadata:getNameVersionRevisionString()..PALADIN_ADDON_LOADED..lazyScript.metadata.name.."!")
	end
end