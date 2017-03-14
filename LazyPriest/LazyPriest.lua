lazyPriest = {}
lazyPriestLoad = {}

lazyPriestLoad.metadata = lazyScript.Metadata:new("LazyPriest")
lazyPriestLoad.metadata:updateRevisionFromKeyword("$Revision: 358 $")

function lazyPriestLoad.OnLoad()
   -- Check that this player is the correct class
   local localeClass, class = UnitClass("player")
   if class ~= "PRIEST" then
      return
   end

   -- Check that we're compatible with LazyScript
   if not lazyScript.CheckCompatibility(lazyPriestLoad.metadata) then
      return
   end

   -- I like everything with the same name. It makes S&R so easy
   lazyPriest = lazyScript
   lazyPriestLocale = lsLocale
   -- Unfortunately this overwrites everything that we already had called lazyPriest.
   -- Load everything else in class specific files using these loading functions
   -- Localization must be loaded first!
   lazyPriestLoad.LoadPriestLocalization(GetLocale())
   lazyPriestLoad.LoadParsePriest()

   this:RegisterEvent("VARIABLES_LOADED")
   this:RegisterEvent("PLAYER_LOGIN")
end

function lazyPriestLoad.OnEvent()
   if (event == "VARIABLES_LOADED") then
      -- Nothing yet

   elseif (event == "PLAYER_LOGIN") then
      lazyPriest.chat(lazyPriestLoad.metadata:getNameVersionRevisionString()..PRIEST_ADDON_LOADED..lazyScript.metadata.name.."!")

   end
end