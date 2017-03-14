lazyShamanLoad.metadata:updateRevisionFromKeyword("$Revision: 474 $")

function lazyShamanLoad.LoadShamanLocalization(locale)
	
	lazyShamanLocale.enUS.ACTION_TTS.earthShock           = "Earth Shock"
	lazyShamanLocale.enUS.ACTION_TTS.flameShock           = "Flame Shock"
	lazyShamanLocale.enUS.ACTION_TTS.frostShock           = "Frost Shock"
	lazyShamanLocale.enUS.ACTION_TTS.rockbiter            = "Rockbiter Weapon"
	lazyShamanLocale.enUS.ACTION_TTS.flametongue          = "Flametongue Weapon"
	lazyShamanLocale.enUS.ACTION_TTS.frostbrand           = "Frostbrand Weapon"
	lazyShamanLocale.enUS.ACTION_TTS.windfury             = "Windfury Weapon"
	lazyShamanLocale.enUS.ACTION_TTS.chainHeal            = "Chain Heal"
	lazyShamanLocale.enUS.ACTION_TTS.chainLight           = "Chain Lightning"
	lazyShamanLocale.enUS.ACTION_TTS.cureDisease          = "Cure Disease"
	lazyShamanLocale.enUS.ACTION_TTS.curePoison           = "Cure Poison"
	lazyShamanLocale.enUS.ACTION_TTS.elemMastery          = "Elemental Mastery"
	lazyShamanLocale.enUS.ACTION_TTS.ghostWolf            = "Ghost Wolf"
	lazyShamanLocale.enUS.ACTION_TTS.heal                 = "Healing Wave"
	lazyShamanLocale.enUS.ACTION_TTS.lesserHeal           = "Lesser Healing Wave"
	lazyShamanLocale.enUS.ACTION_TTS.lightBolt            = "Lightning Bolt"
	lazyShamanLocale.enUS.ACTION_TTS.lightShield          = "Lightning Shield"
	lazyShamanLocale.enUS.ACTION_TTS.natureSwift          = "Nature's Swiftness"
	lazyShamanLocale.enUS.ACTION_TTS.purge                = "Purge"
	lazyShamanLocale.enUS.ACTION_TTS.stormstrike          = "Stormstrike"
	
	lazyShamanLocale.enUS.ACTION_TTS.diseaseTotem         = "Disease Cleansing Totem"
	lazyShamanLocale.enUS.ACTION_TTS.bindTotem            = "Earthbind Totem"
	lazyShamanLocale.enUS.ACTION_TTS.fireNovaTotem        = "Fire Nova Totem"
	lazyShamanLocale.enUS.ACTION_TTS.fireResistTotem      = "Fire Resistance Totem"
	lazyShamanLocale.enUS.ACTION_TTS.flameTotem           = "Flametongue Totem"
	lazyShamanLocale.enUS.ACTION_TTS.frostResistTotem     = "Frost Resistance Totem"
	lazyShamanLocale.enUS.ACTION_TTS.graceTotem           = "Grace of Air Totem"
	lazyShamanLocale.enUS.ACTION_TTS.groundingTotem       = "Grounding Totem"
	lazyShamanLocale.enUS.ACTION_TTS.hsTotem              = "Healing Stream Totem"
	lazyShamanLocale.enUS.ACTION_TTS.magmaTotem           = "Magma Totem"
	lazyShamanLocale.enUS.ACTION_TTS.msTotem              = "Mana Spring Totem"
	lazyShamanLocale.enUS.ACTION_TTS.mtTotem              = "Mana Tide Totem"
	lazyShamanLocale.enUS.ACTION_TTS.natureResistTotem    = "Nature Resistance Totem"
	lazyShamanLocale.enUS.ACTION_TTS.poisonTotem          = "Poison Cleansing Totem"
	lazyShamanLocale.enUS.ACTION_TTS.searingTotem         = "Searing Totem"
	lazyShamanLocale.enUS.ACTION_TTS.sentryTotem          = "Sentry Totem"
	lazyShamanLocale.enUS.ACTION_TTS.clawTotem            = "Stoneclaw Totem"
	lazyShamanLocale.enUS.ACTION_TTS.skinTotem            = "Stoneskin Totem"
	lazyShamanLocale.enUS.ACTION_TTS.strengthTotem        = "Strength of Earth Totem"
	lazyShamanLocale.enUS.ACTION_TTS.tranquilTotem        = "Tranquil Air Totem"
	lazyShamanLocale.enUS.ACTION_TTS.tremorTotem          = "Tremor Totem"
	lazyShamanLocale.enUS.ACTION_TTS.wfTotem              = "Windfury Totem"
	lazyShamanLocale.enUS.ACTION_TTS.windwallTotem        = "Windwall Totem"
	
	-- LazyShaman.lua
	SHAMAN_ADDON_LOADED = " loaded. Powered by "
	
	-- ParseShaman.lua
	function lazyShaman.CustomLocaleHelp() return [[<H2>Shaman Criteria:</H2>]] end
	
	if (locale == "ruRU") then
		
		lazyShamanLocale.ruRU.ACTION_TTS.earthShock           = "Земной шок"
		lazyShamanLocale.ruRU.ACTION_TTS.flameShock           = "Огненный шок"
		lazyShamanLocale.ruRU.ACTION_TTS.frostShock           = "Ледяной шок"
		lazyShamanLocale.ruRU.ACTION_TTS.rockbiter            = "Оружие Камнедробителя"
		lazyShamanLocale.ruRU.ACTION_TTS.flametongue          = "Оружие языка пламени"
		lazyShamanLocale.ruRU.ACTION_TTS.frostbrand           = "Оружие ледяного клейма"
		lazyShamanLocale.ruRU.ACTION_TTS.windfury             = "Оружие неистовства ветра"
		lazyShamanLocale.ruRU.ACTION_TTS.chainHeal            = "Цепное исцеление"
		lazyShamanLocale.ruRU.ACTION_TTS.chainLight           = "Цепная молния"
		lazyShamanLocale.ruRU.ACTION_TTS.cureDisease          = "Излечение болезни"
		lazyShamanLocale.ruRU.ACTION_TTS.curePoison           = "Выведение яда"
		lazyShamanLocale.ruRU.ACTION_TTS.elemMastery          = "Покорение стихий"
		lazyShamanLocale.ruRU.ACTION_TTS.ghostWolf            = "Призрачный волк"
		lazyShamanLocale.ruRU.ACTION_TTS.heal                 = "Волна исцеления"
		lazyShamanLocale.ruRU.ACTION_TTS.lesserHeal           = "Малая волна исцеления"
		lazyShamanLocale.ruRU.ACTION_TTS.lightBolt            = "Молния"
		lazyShamanLocale.ruRU.ACTION_TTS.lightShield          = "Щит молний"
		lazyShamanLocale.ruRU.ACTION_TTS.natureSwift          = "Природная стремительность"
		lazyShamanLocale.ruRU.ACTION_TTS.purge                = "Развеяние магии"
		lazyShamanLocale.ruRU.ACTION_TTS.stormstrike          = "Удар бури"
		
		lazyShamanLocale.ruRU.ACTION_TTS.diseaseTotem         = "Тотем очищения от болезней"
		lazyShamanLocale.ruRU.ACTION_TTS.bindTotem            = "Тотем оков земли"
		lazyShamanLocale.ruRU.ACTION_TTS.fireNovaTotem        = "Тотем кольца огня"
		lazyShamanLocale.ruRU.ACTION_TTS.fireResistTotem      = "Тотем защиты от огня"
		lazyShamanLocale.ruRU.ACTION_TTS.flameTotem           = "Тотем языка пламени"
		lazyShamanLocale.ruRU.ACTION_TTS.frostResistTotem     = "Тотем защиты от магии льда"
		lazyShamanLocale.ruRU.ACTION_TTS.graceTotem           = "Тотем легкости воздуха"
		lazyShamanLocale.ruRU.ACTION_TTS.groundingTotem       = "Тотем заземления"
		lazyShamanLocale.ruRU.ACTION_TTS.hsTotem              = "Тотем исцеляющего потока"
		lazyShamanLocale.ruRU.ACTION_TTS.magmaTotem           = "Тотем магмы"
		lazyShamanLocale.ruRU.ACTION_TTS.msTotem              = "Тотем источника маны"
		lazyShamanLocale.ruRU.ACTION_TTS.mtTotem              = "Тотем прилива маны"
		lazyShamanLocale.ruRU.ACTION_TTS.natureResistTotem    = "Тотем защиты от сил природы"
		lazyShamanLocale.ruRU.ACTION_TTS.poisonTotem          = "Тотем противоядия"
		lazyShamanLocale.ruRU.ACTION_TTS.searingTotem         = "Опаляющий тотем"
		lazyShamanLocale.ruRU.ACTION_TTS.sentryTotem          = "Сторожевой тотем"
		lazyShamanLocale.ruRU.ACTION_TTS.clawTotem            = "Тотем каменного когтя"
		lazyShamanLocale.ruRU.ACTION_TTS.skinTotem            = "Тотем каменной кожи"
		lazyShamanLocale.ruRU.ACTION_TTS.strengthTotem        = "Тотем силы земли"
		lazyShamanLocale.ruRU.ACTION_TTS.tranquilTotem        = "Тотем безветрия"
		lazyShamanLocale.ruRU.ACTION_TTS.tremorTotem          = "Тотем трепета"
		lazyShamanLocale.ruRU.ACTION_TTS.wfTotem              = "Тотем неистовства ветра"
		lazyShamanLocale.ruRU.ACTION_TTS.windwallTotem        = "Тотем стены ветра"
		
		-- LazyShaman.lua
		SHAMAN_ADDON_LOADED = " загружен. Работает от "
		
		-- ParseShaman.lua
		function lazyShaman.CustomLocaleHelp() return [[<H2>Критерии Шамана:</H2>]] end
		
	end
end