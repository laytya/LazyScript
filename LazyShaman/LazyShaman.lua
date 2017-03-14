lazyShaman = {}
lazyShamanLoad = {}

lazyShamanLoad.metadata = lazyScript.Metadata:new("LazyShaman")
lazyShamanLoad.metadata:updateRevisionFromKeyword("$Revision: 358 $")

function lazyShamanLoad.OnLoad()
	-- Check that this player is the correct class
	local localeClass, class = UnitClass("player")
	if class ~= "SHAMAN" then
		return
	end
	
	-- Check that we're compatible with LazyScript
	if not lazyScript.CheckCompatibility(lazyShamanLoad.metadata) then
		return
	end
	
	-- I like everything with the same name. It makes S&R so easy
	lazyShaman = lazyScript
	lazyShamanLocale = lsLocale
	-- Unfortunately this overwrites everything that we already had called lazyShaman.
	-- Load everything else in class specific files using these loading functions
	-- Localization must be loaded first!
	lazyShamanLoad.LoadShamanLocalization(GetLocale())
	lazyShamanLoad.LoadParseShaman()
	
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PLAYER_LOGIN")
end

function lazyShamanLoad.OnEvent()
	if (event == "VARIABLES_LOADED") then
		-- Nothing yet
		
		elseif (event == "PLAYER_LOGIN") then
		lazyShaman.chat(lazyShamanLoad.metadata:getNameVersionRevisionString()..SHAMAN_ADDON_LOADED..lazyScript.metadata.name.."!")
		
	end
end