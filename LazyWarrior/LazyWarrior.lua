lazyWarrior = {}
lazyWarriorLoad = {}

lazyWarriorLoad.metadata = lazyScript.Metadata:new("LazyWarrior")
lazyWarriorLoad.metadata:updateRevisionFromKeyword("$Revision: 358 $")

function lazyWarriorLoad.OnLoad()
	-- Check that this player is the correct class
	local localeClass, class = UnitClass("player")
	if class ~= "WARRIOR" then
		return
	end
	
	-- Check that we're compatible with LazyScript
	if not lazyScript.CheckCompatibility(lazyWarriorLoad.metadata) then
		return
	end
	
	-- I like everything with the same name. It makes S&R so easy
	lazyWarrior = lazyScript
	lazyWarriorLocale = lsLocale
	-- Unfortunately this overwrites everything that we already had called lazyWarrior.
	-- Load everything else in class specific files using these loading functions
	-- Localization must be loaded first!
	lazyWarriorLoad.LoadWarriorLocalization(GetLocale())
	lazyWarriorLoad.LoadParseWarrior()
	
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PLAYER_LOGIN")
end

function lazyWarriorLoad.OnEvent()
	if (event == "VARIABLES_LOADED") then
		-- Nothing yet
		
		elseif (event == "PLAYER_LOGIN") then
		lazyWarrior.chat(lazyWarriorLoad.metadata:getNameVersionRevisionString()..WARRIOR_ADDON_LOADED..lazyScript.metadata.name.."!")
		
	end
end