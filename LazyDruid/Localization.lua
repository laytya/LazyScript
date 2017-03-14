lazyDruidLoad.metadata:updateRevisionFromKeyword("$Revision: 171 $")

function lazyDruidLoad.LoadDruidLocalization(locale)
	
	lazyDruidLocale.enUS.ACTION_TTS.bite               = "Ferocious Bite"
	lazyDruidLocale.enUS.ACTION_TTS.claw               = "Claw"
	lazyDruidLocale.enUS.ACTION_TTS.cower              = "Cower"
	lazyDruidLocale.enUS.ACTION_TTS.dash               = "Dash"
	lazyDruidLocale.enUS.ACTION_TTS.pounce             = "Pounce"
	lazyDruidLocale.enUS.ACTION_TTS.prowl              = "Prowl"
	lazyDruidLocale.enUS.ACTION_TTS.rake               = "Rake"
	lazyDruidLocale.enUS.ACTION_TTS.ravage             = "Ravage"
	lazyDruidLocale.enUS.ACTION_TTS.rip                = "Rip"
	lazyDruidLocale.enUS.ACTION_TTS.shred              = "Shred"
	lazyDruidLocale.enUS.ACTION_TTS.tigersFury         = "Tiger's Fury"
	lazyDruidLocale.enUS.ACTION_TTS.trackHumanoids     = "Track Humanoids"
	
	lazyDruidLocale.enUS.ACTION_TTS.bash               = "Bash"
	lazyDruidLocale.enUS.ACTION_TTS.challenge          = "Challenging Roar"
	lazyDruidLocale.enUS.ACTION_TTS.charge             = "Feral Charge"
	lazyDruidLocale.enUS.ACTION_TTS.demoralize         = "Demoralizing Roar"
	lazyDruidLocale.enUS.ACTION_TTS.enrage             = "Enrage"
	lazyDruidLocale.enUS.ACTION_TTS.frenziedRegen      = "Frenzied Regeneration"
	lazyDruidLocale.enUS.ACTION_TTS.growl              = "Growl"
	lazyDruidLocale.enUS.ACTION_TTS.maul               = "Maul"
	lazyDruidLocale.enUS.ACTION_TTS.swipe              = "Swipe"
	
	lazyDruidLocale.enUS.ACTION_TTS.abolishPoison      = "Abolish Poison"
	lazyDruidLocale.enUS.ACTION_TTS.barkskin           = "Barkskin"
	lazyDruidLocale.enUS.ACTION_TTS.curePoison         = "Cure Poison"
	lazyDruidLocale.enUS.ACTION_TTS.faerieFire         = "Faerie Fire"
	lazyDruidLocale.enUS.ACTION_TTS.feralFire          = "Faerie Fire (Feral)"
	lazyDruidLocale.enUS.ACTION_TTS.gotw               = "Gift of the Wild"
	lazyDruidLocale.enUS.ACTION_TTS.grasp              = "Nature's Grasp"
	lazyDruidLocale.enUS.ACTION_TTS.healingTouch       = "Healing Touch"
	lazyDruidLocale.enUS.ACTION_TTS.hibernate          = "Hibernate"
	lazyDruidLocale.enUS.ACTION_TTS.hurricane          = "Hurricane"
	lazyDruidLocale.enUS.ACTION_TTS.innervate          = "Innervate"
	lazyDruidLocale.enUS.ACTION_TTS.moonfire           = "Moonfire"
	lazyDruidLocale.enUS.ACTION_TTS.motw               = "Mark of the Wild"
	lazyDruidLocale.enUS.ACTION_TTS.ns                 = "Nature's Swiftness"
	lazyDruidLocale.enUS.ACTION_TTS.ooc                = "Omen of Clarity"
	lazyDruidLocale.enUS.ACTION_TTS.rebirth            = "Rebirth"
	lazyDruidLocale.enUS.ACTION_TTS.regrowth           = "Regrowth"
	lazyDruidLocale.enUS.ACTION_TTS.rejuv              = "Rejuvenation"
	lazyDruidLocale.enUS.ACTION_TTS.removeCurse        = "Remove Curse"
	lazyDruidLocale.enUS.ACTION_TTS.roots              = "Entangling Roots"
	lazyDruidLocale.enUS.ACTION_TTS.soothe             = "Soothe Animal"
	lazyDruidLocale.enUS.ACTION_TTS.starfire           = "Starfire"
	lazyDruidLocale.enUS.ACTION_TTS.swarm              = "Insect Swarm"
	lazyDruidLocale.enUS.ACTION_TTS.swiftmend          = "Swiftmend"
	lazyDruidLocale.enUS.ACTION_TTS.teleMoonglade      = "Teleport: Moonglade"
	lazyDruidLocale.enUS.ACTION_TTS.thorns             = "Thorns"
	lazyDruidLocale.enUS.ACTION_TTS.tranquility        = "Tranquility"
	lazyDruidLocale.enUS.ACTION_TTS.wrath              = "Wrath"
	
	lazyDruidLocale.enUS.ACTION_TTS.bear               = "Bear Form"
	lazyDruidLocale.enUS.ACTION_TTS.aquatic            = "Aquatic Form"
	lazyDruidLocale.enUS.ACTION_TTS.cat                = "Cat Form"
	lazyDruidLocale.enUS.ACTION_TTS.travel             = "Travel Form"
	lazyDruidLocale.enUS.ACTION_TTS.moonkin            = "Moonkin Form"
	
	
	lazyDruidLocale.enUS.BITE_HIT = "Your Ferocious Bite hits (.+) for (%d+)."
	lazyDruidLocale.enUS.BITE_CRIT = "Your Ferocious Bite crits (.+) for (%d+).";
	
	-- BiteTracking.lua
	DRUID_YOU_DONT_HAVE_BITE = "You don't have ferocious bite yet."
	DRUID_BITE_NOT_SUPPORTED = "Ferocious Bite tracking is not supported by your locale"
	DRUID_RESET_BITE_STATS = "Reset Ferocious Bite stats."
	DRUID_BITE_CANT_RECORD = "lazyDruid.biteComboPoints is nil or 0, can't record"
	DRUID_BITE_OUTPUT_1 = "Ferocious Bite ("
	DRUID_BITE_OUTPUT_2 = " cp): "
	DRUID_BITE_OUTPUT_3 = " damage (optimal "
	DRUID_BITE_OUTPUT_4 = " (cur/avg vs. optimal)"
	DRUID_BITE_CAST_SPELL_HOOK = "CastSpellHook, I see you're using ferocious bite with "
	DRUID_BITE_CPS = " cps"
	
	-- LazyDruid.lua
	DRUID_ADDON_LOADED = " loaded. Powered by "
	
	-- ParseDruid.lua
	DRUID_DEAD_IN = "IsLastChance: DEAD IN "
	DRUID_SEC = "s"
	DRUID_BITE_NOW = " BITE NOW"
	DRUID_NOT_VALID_NUMBER = "That is not a valid number: "
	DRUID_EARLY_BITE = "Early bite! Kill shot!"
	DRUID_ONLY_WITH_BITE = "-ifKillShot only works with bite"
	DRUID_BITE_LOOKUP_FILED = "strange, bite damage lookup failed"
	DRUID_CALCULATE_BITE_DMG_1 = "Calculate Bite Dmg: Using the OBSERVED Bite ("
	DRUID_CALCULATE_BITE_DMG_2 = "cp) damage of: "
	DRUID_CMD_DESCRIPTION_1 = " resetBiteStats"
	DRUID_CMD_DESCRIPTION_2 = " useBiteTracking"
	DRUID_CMD_DESCRIPTION_3 = " trackBiteCrits"
	DRUID_FEROCIOUS_BITE_NO_LONGER_USING = "No longer using Ferocious Bite tracking."
	DRUID_FEROCIOUS_BITE_NOW_USING = "Now using Ferocious Bite tracking."
	DRUID_FEROCIOUS_BITE_NO_LONGER_TRACKING = "No longer tracking Ferocious Bite crits."
	DRUID_FEROCIOUS_BITE_NOW_TRACKING = "Now tracking Ferocious Bite crits."
	
	DRUID_CUSTOM_MENU_FER_BITE_OPT = "< Ferocious Bite Options >"
	DRUID_CUSTOM_MENU_FER_BITE_OPT_TITLE = "Ferocious Bite Options"
	DRUID_CUSTOM_MENU_FER_BITE_OPT_INC_CRITS = "... Include Crits (may skew kill shots)"
	DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE = "Ferocious Bite sample window:"
	DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE_LAST = "... Last "
	DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE_BITES = " Bites"
	DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS = "Ferocious Bite Stats"
	DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_FORMAT = "Observed/Optimal => % (# seen)"
	DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_OUTPUT_CP = "cp: "
	DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_OUTPUT_SEEN = " seen)"
	DRUID_CUSTOM_MENU_FER_BITE_RESET = "< Reset >"
	
	function lazyDruid.CustomLocaleHelp()
		return [[
			<H2>Druid Criteria:</H2>
			<P>-ifKillShot[=XX%] (for 'bite' action only)</P>
			<P>-if[Not]LastChance[PlusX.Xs] |cffffff00(default is 0.25s)|r</P>
		]]
	end
	
	if (locale == "ruRU") then
		
		lazyDruidLocale.ruRU.ACTION_TTS.bite               = "Свирепый укус"
		lazyDruidLocale.ruRU.ACTION_TTS.claw               = "Цапнуть"
		lazyDruidLocale.ruRU.ACTION_TTS.cower              = "Попятиться"
		lazyDruidLocale.ruRU.ACTION_TTS.dash               = "Порыв"
		lazyDruidLocale.ruRU.ACTION_TTS.pounce             = "Наскок"
		lazyDruidLocale.ruRU.ACTION_TTS.prowl              = "Крадущийся зверь"
		lazyDruidLocale.ruRU.ACTION_TTS.rake               = "Глубокая рана"
		lazyDruidLocale.ruRU.ACTION_TTS.ravage             = "Накинуться"
		lazyDruidLocale.ruRU.ACTION_TTS.rip                = "Разорвать"
		lazyDruidLocale.ruRU.ACTION_TTS.shred              = "Полоснуть"
		lazyDruidLocale.ruRU.ACTION_TTS.tigersFury         = "Тигриное неистовство"
		lazyDruidLocale.ruRU.ACTION_TTS.trackHumanoids     = "Выслеживание гуманоидов"
		
		lazyDruidLocale.ruRU.ACTION_TTS.bash               = "Оглушить"
		lazyDruidLocale.ruRU.ACTION_TTS.challenge          = "Вызывающий рев"
		lazyDruidLocale.ruRU.ACTION_TTS.charge             = "Звериная атака"
		lazyDruidLocale.ruRU.ACTION_TTS.demoralize         = "Устрашающий рев"
		lazyDruidLocale.ruRU.ACTION_TTS.enrage             = "Исступление"
		lazyDruidLocale.ruRU.ACTION_TTS.frenziedRegen      = "Неистовое восстановление"
		lazyDruidLocale.ruRU.ACTION_TTS.growl              = "Рык"
		lazyDruidLocale.ruRU.ACTION_TTS.maul               = "Трепка"
		lazyDruidLocale.ruRU.ACTION_TTS.swipe              = "Размах"
		
		lazyDruidLocale.ruRU.ACTION_TTS.abolishPoison      = "Устранение яда"
		lazyDruidLocale.ruRU.ACTION_TTS.barkskin           = "Дубовая кожа"
		lazyDruidLocale.ruRU.ACTION_TTS.curePoison         = "Выведение яда"
		lazyDruidLocale.ruRU.ACTION_TTS.faerieFire         = "Волшебный огонь"
		lazyDruidLocale.ruRU.ACTION_TTS.feralFire          = "Волшебный огонь (зверь)"
		lazyDruidLocale.ruRU.ACTION_TTS.gotw               = "Дар дикой природы"
		lazyDruidLocale.ruRU.ACTION_TTS.grasp              = "Хватка природы"
		lazyDruidLocale.ruRU.ACTION_TTS.healingTouch       = "Целительное прикосновение"
		lazyDruidLocale.ruRU.ACTION_TTS.hibernate          = "Спячка"
		lazyDruidLocale.ruRU.ACTION_TTS.hurricane          = "Гроза"
		lazyDruidLocale.ruRU.ACTION_TTS.innervate          = "Озарение"
		lazyDruidLocale.ruRU.ACTION_TTS.moonfire           = "Лунный огонь"
		lazyDruidLocale.ruRU.ACTION_TTS.motw               = "Знак дикой природы"
		lazyDruidLocale.ruRU.ACTION_TTS.ns                 = "Природная стремительность"
		lazyDruidLocale.ruRU.ACTION_TTS.ooc                = "Знамение ясности"
		lazyDruidLocale.ruRU.ACTION_TTS.rebirth            = "Возрождение"
		lazyDruidLocale.ruRU.ACTION_TTS.regrowth           = "Восстановление"
		lazyDruidLocale.ruRU.ACTION_TTS.rejuv              = "Омоложение"
		lazyDruidLocale.ruRU.ACTION_TTS.removeCurse        = "Снятие проклятия"
		lazyDruidLocale.ruRU.ACTION_TTS.roots              = "Гнев деревьев"
		lazyDruidLocale.ruRU.ACTION_TTS.soothe             = "Умиротворение животного"
		lazyDruidLocale.ruRU.ACTION_TTS.starfire           = "Звездный огонь"
		lazyDruidLocale.ruRU.ACTION_TTS.swarm              = "Рой насекомых"
		lazyDruidLocale.ruRU.ACTION_TTS.swiftmend          = "Быстрое восстановление"
		lazyDruidLocale.ruRU.ACTION_TTS.teleMoonglade      = "Телепортация: Лунная поляна"
		lazyDruidLocale.ruRU.ACTION_TTS.thorns             = "Шипы"
		lazyDruidLocale.ruRU.ACTION_TTS.tranquility        = "Спокойствие"
		lazyDruidLocale.ruRU.ACTION_TTS.wrath              = "Гнев"
		
		lazyDruidLocale.ruRU.ACTION_TTS.bear               = "Облик медведя"
		lazyDruidLocale.ruRU.ACTION_TTS.aquatic            = "Водный облик"
		lazyDruidLocale.ruRU.ACTION_TTS.cat                = "Облик кошки"
		lazyDruidLocale.ruRU.ACTION_TTS.travel             = "Походный облик"
		lazyDruidLocale.ruRU.ACTION_TTS.moonkin            = "Облик лунного совуха"
		
		
		lazyDruidLocale.ruRU.BITE_HIT = "Ваше заклинание \"Свирепый укус\" наносит (.+) (%d+) ед. урона."
		lazyDruidLocale.ruRU.BITE_CRIT = "Ваше заклинание \"Свирепый укус\" наносит (.+) (%d+) ед. урона: критический эффект.";
		
		-- BiteTracking.lua
		DRUID_YOU_DONT_HAVE_BITE = "У вас еще нет Свирепого укуса."
		DRUID_BITE_NOT_SUPPORTED = "Отслеживание Свирепого укуса не поддерживается для вашей локализации"
		DRUID_RESET_BITE_STATS = "Статистика свирепого укуса сброшена."
		DRUID_BITE_CANT_RECORD = "lazyDruid.biteComboPoints ничего или 0, запись невозможна"
		DRUID_BITE_OUTPUT_1 = "Свирепый удар ("
		DRUID_BITE_OUTPUT_2 = " комбо): "
		DRUID_BITE_OUTPUT_3 = " урон (оптимальный "
		DRUID_BITE_OUTPUT_4 = " (текущий в среднем/оптимальный)"
		DRUID_BITE_CAST_SPELL_HOOK = "CastSpellHook, Я вижу, что вы используете свирепый укус с "
		DRUID_BITE_CPS = " комбо"
		
		-- LazyDruid.lua
		DRUID_ADDON_LOADED = " загружен. Работает от "
		
		-- ParseDruid.lua
		DRUID_DEAD_IN = "IsLastChance: УМЕР В "
		DRUID_SEC = "сек."
		DRUID_BITE_NOW = " УКУС СЕЙЧАС"
		DRUID_NOT_VALID_NUMBER = "Это недопустимый номер: "
		DRUID_EARLY_BITE = "Поздно укус! Добивающий удар!"
		DRUID_ONLY_WITH_BITE = "-ifKillShot работает только с укусом"
		DRUID_BITE_LOOKUP_FILED = "странно, ошибка поиска урона укуса"
		DRUID_CALCULATE_BITE_DMG_1 = "Калькулятор урона Укуса: Использование Укуса (" 
		DRUID_CALCULATE_BITE_DMG_2 = " комбо) нанесло урона: "
		DRUID_CMD_DESCRIPTION_1 = " resetBiteStats|cffffffff - Сброс статистики Свирепого укуса|r"
		DRUID_CMD_DESCRIPTION_2 = " useBiteTracking|cffffffff - Переключение отслеживания Свирепого укуса|r"
		DRUID_CMD_DESCRIPTION_3 = " trackBiteCrits|cffffffff - Подключение критических ударов Свирепого укуса|r"
		DRUID_FEROCIOUS_BITE_NO_LONGER_USING = "Отслеживание Свирепого укуса выключено."
		DRUID_FEROCIOUS_BITE_NOW_USING = "Отслеживание Свирепого укуса включено."
		DRUID_FEROCIOUS_BITE_NO_LONGER_TRACKING = "Отслеживание критических ударов Свирепого укуса выключено."
		DRUID_FEROCIOUS_BITE_NOW_TRACKING = "Отслеживание критических ударов Свирепого укуса включено."
		
		DRUID_CUSTOM_MENU_FER_BITE_OPT = "< Настройки Свирепого укуса >"
		DRUID_CUSTOM_MENU_FER_BITE_OPT_TITLE = "Настройки Свирепого укуса"
		DRUID_CUSTOM_MENU_FER_BITE_OPT_INC_CRITS = "... Подключить криты (может исказить данные)"
		DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE = "Окно замеров Свирепого укуса:"
		DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE_LAST = "... Последние "
		DRUID_CUSTOM_MENU_FER_BITE_OPT_SAMPLE_BITES = " Укусов"
		DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS = "Статистика Свирепого укуса"
		DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_FORMAT = "Реальные/Оптимальные => % (# раз)"
		DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_OUTPUT_CP = "комбо: "
		DRUID_CUSTOM_MENU_FER_BITE_OPT_STATS_OUTPUT_SEEN = " раз)"
		DRUID_CUSTOM_MENU_FER_BITE_RESET = "< Сброс >"
		
		function lazyDruid.CustomLocaleHelp()
			return [[
				<H2>Критерии Друида:</H2>
				<P>-ifKillShot[=XX%] (действие только для 'укуса')</P>
				<P>-if[Not]LastChance[PlusX.Xs] |cffffff00(по умолчанию 0.25сек.)|r</P>
			]]
		end
		
		elseif (locale == "deDE") then
		
		lazyDruidLocale.deDE.ACTION_TTS.prowl           = "Schleichen"
		lazyDruidLocale.deDE.ACTION_TTS.faerieFire      = "Feenfeuer"
		lazyDruidLocale.deDE.ACTION_TTS.feralFire       = "Feenfeuer (Tiergestalt)"
		lazyDruidLocale.deDE.ACTION_TTS.hibernate       = "Winterschlaf"
		lazyDruidLocale.deDE.ACTION_TTS.motw            = "Mal der Wildnis"
		lazyDruidLocale.deDE.ACTION_TTS.gotw            = "Gabe der Wildnis"
		
		lazyDruidLocale.deDE.BITE_HIT = nil
		lazyDruidLocale.deDE.BITE_CRIT = nil
		
		elseif (locale == "frFR") then
		
		lazyDruidLocale.frFR.ACTION_TTS.prowl           = "R\195\180der"
		lazyDruidLocale.frFR.ACTION_TTS.faerieFire      = "Lucioles"
		lazyDruidLocale.frFR.ACTION_TTS.feralFire       = "Lucioles (farouche)"
		lazyDruidLocale.frFR.ACTION_TTS.hibernate       = "Hibernation"
		lazyDruidLocale.frFR.ACTION_TTS.motw            = "Marque du fauve"
		lazyDruidLocale.frFR.ACTION_TTS.gotw            = "Don du fauve"
		
		lazyDruidLocale.frFR.BITE_HIT = nil
		lazyDruidLocale.frFR.BITE_CRIT = nil
		
	end
end