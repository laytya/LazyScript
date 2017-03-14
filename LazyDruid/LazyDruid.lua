lazyDruid = {}
lazyDruidLoad = {}

lazyDruidLoad.metadata = lazyScript.Metadata:new("LazyDruid")
lazyDruidLoad.metadata:updateRevisionFromKeyword("$Revision: 524 $")

function lazyDruidLoad.OnLoad()
	-- Check that this player is the correct class
	local localeClass, class = UnitClass("player")
	if class ~= "DRUID" then
		return
	end
	
	-- Check that we're compatible with LazyScript
	if not lazyScript.CheckCompatibility(lazyDruidLoad.metadata) then
		return
	end
	
	-- I like everything with the same name. It makes S&R so easy
	lazyDruid = lazyScript
	lazyDruidLocale = lsLocale
	-- Unfortunately this overwrites everything that we already had called lazyDruid.
	-- Load everything else in class specific files using these loading functions
	-- Localization must be loaded first!
	lazyDruidLoad.LoadDruidLocalization(GetLocale())
	lazyDruidLoad.LoadParseDruid()
	-- Action based functions should be loaded at PLAYER_LOGIN to be initialized correctly
	
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PLAYER_LOGIN")
end

function lazyDruidLoad.OnEvent()
	if (event == "VARIABLES_LOADED") then
		-- Nothing yet
		
		elseif (event == "PLAYER_LOGIN") then
		
		this:RegisterEvent("UNIT_ENERGY")
		this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")
		this:RegisterEvent("LEARNED_SPELL_IN_TAB")
		
		lazyDruidLoad.LoadBiteTracking()
		
		-- Hook for ferocious bite tracking
		if (not lazyDruid.UseActionOrig and lazyDruid.bite) then
			lazyDruid.UseActionOrig = UseAction
			UseAction = lazyDruid.bite.UseActionHook
		end
		
		if (not lazyDruid.CastSpellOrig and lazyDruid.bite) then
			lazyDruid.CastSpellOrig = CastSpell
			CastSpell = lazyDruid.bite.CastSpellHook
		end
		
		lazyDruid.chat(lazyDruidLoad.metadata:getNameVersionRevisionString()..DRUID_ADDON_LOADED..lazyScript.metadata.name.."!")
		
		elseif (event == "UNIT_ENERGY") then
		if (arg1 == "player") then
			local currentEnergy = UnitMana("player")
			if (currentEnergy > lazyDruid.latestEnergy) then
				-- a tick
				lazyDruid.lastTickTime = GetTime()
				--lazyDruid.d("ENERGY TICK: "..lazyDruid.lastTickTime)
			end
			lazyDruid.latestEnergy = currentEnergy
		end
		
		elseif (event == "CHAT_MSG_SPELL_SELF_DAMAGE") then
		if lazyDruid.bite then
			lazyDruid.bite.TrackBite(arg1)
		end
		
		elseif (event == "LEARNED_SPELL_IN_TAB") then
		-- search for ferocious bite
		lazyDruidLoad.LoadBiteTracking()
		if (not lazyDruid.UseActionOrig and lazyDruid.bite) then
			lazyDruid.UseActionOrig = UseAction
			UseAction = lazyDruid.bite.UseActionHook
		end
		
	end
end