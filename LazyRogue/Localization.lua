lazyRogueLoad.metadata:updateRevisionFromKeyword("$Revision: 627 $")

function lazyRogueLoad.LoadRogueLocalization(locale)
	
	lazyRogueLocale.enUS.IMPORTED = "LazyRogue v3.1 settings, forms, interrupt exception criteria and tracked immunities have been imported."
	
	lazyRogueLocale.enUS.ACTION_TTS.adrenaline        = "Adrenaline Rush"
	lazyRogueLocale.enUS.ACTION_TTS.ambush            = "Ambush"
	lazyRogueLocale.enUS.ACTION_TTS.bladeFlurry       = "Blade Flurry"
	lazyRogueLocale.enUS.ACTION_TTS.blind             = "Blind"
	lazyRogueLocale.enUS.ACTION_TTS.bs                = "Backstab"
	lazyRogueLocale.enUS.ACTION_TTS.cs                = "Cheap Shot"
	lazyRogueLocale.enUS.ACTION_TTS.coldBlood         = "Cold Blood"
	lazyRogueLocale.enUS.ACTION_TTS.distract          = "Distract"
	lazyRogueLocale.enUS.ACTION_TTS.evasion           = "Evasion"
	lazyRogueLocale.enUS.ACTION_TTS.evisc             = "Eviscerate"
	lazyRogueLocale.enUS.ACTION_TTS.expose            = "Expose Armor"
	lazyRogueLocale.enUS.ACTION_TTS.feint             = "Feint"
	lazyRogueLocale.enUS.ACTION_TTS.garrote           = "Garrote"
	lazyRogueLocale.enUS.ACTION_TTS.ghostly           = "Ghostly Strike"
	lazyRogueLocale.enUS.ACTION_TTS.gouge             = "Gouge"
	lazyRogueLocale.enUS.ACTION_TTS.hemo              = "Hemorrhage"
	lazyRogueLocale.enUS.ACTION_TTS.kick              = "Kick"
	lazyRogueLocale.enUS.ACTION_TTS.ks                = "Kidney Shot"
	lazyRogueLocale.enUS.ACTION_TTS.pickPocket        = "Pick Pocket"
	lazyRogueLocale.enUS.ACTION_TTS.premeditation     = "Premeditation"
	lazyRogueLocale.enUS.ACTION_TTS.preparation       = "Preparation"
	lazyRogueLocale.enUS.ACTION_TTS.riposte           = "Riposte"
	lazyRogueLocale.enUS.ACTION_TTS.rupture           = "Rupture"
	lazyRogueLocale.enUS.ACTION_TTS.sap               = "Sap"
	lazyRogueLocale.enUS.ACTION_TTS.snd               = "Slice and Dice"
	lazyRogueLocale.enUS.ACTION_TTS.sprint            = "Sprint"
	lazyRogueLocale.enUS.ACTION_TTS.ss                = "Sinister Strike"
	lazyRogueLocale.enUS.ACTION_TTS.stealth           = "Stealth"
	lazyRogueLocale.enUS.ACTION_TTS.sa                = "Surprise Attack"
	lazyRogueLocale.enUS.ACTION_TTS.vanish            = "Vanish"
	
	lazyRogueLocale.enUS.EVISCERATE_HIT = "Your Eviscerate hits (.+) for (%d+)."
	lazyRogueLocale.enUS.EVISCERATE_CRIT = "Your Eviscerate crits (.+) for (%d+).";
	
	-- EviscerateTracking.lua
	ROGUE_EVIRCERATE_NOT_SUPPORTED = "Eviscerate tracking is not supported by your locale"
	ROGUE_RESET_EVIRCERATE_STATS = "Reset Eviscerate stats."
	ROGUE_EVIRCERATE_CANT_RECORD = "lazyRogue.eviscComboPoints is nil or 0, can't record"
	ROGUE_EVIRCERATE_OUTPUT_1 = "Eviscerate ("
	ROGUE_EVIRCERATE_OUTPUT_2 = "cp): "
	ROGUE_EVIRCERATE_OUTPUT_3 = " damage (optimal "
	ROGUE_EVIRCERATE_OUTPUT_4 = " (cur/avg vs. optimal)"
	ROGUE_EVIRCERATE_USE_ACTION_HOOK = "UseActionHook, I see you're eviscerating with "
	ROGUE_EVIRCERATE_CAST_SPELL_HOOK = "CastSpellHook, I see you're eviscerating with "
	ROGUE_EVIRCERATE_CPS = " cps"
	
	-- LazyRogue.lua
	ROGUE_ADDON_LOADED = " loaded. Powered by "
	
	-- ParseRogue.lua
	ROGUE_APPLY_POISON_ONLY_MAIN_OFF_HAND = "applyPoison: Only MainHand and OffHand are supported, not"
	ROGUE_IF_POISONED_ONLY_MAIN_OFF_HAND = "ifPoisoned: Only MainHand or OffHand supported, not "
	ROGUE_DEAD_IN = "IsLastChance: DEAD IN "
	ROGUE_S = "s"
	ROGUE_EVISCERATE_NOW = " EVISCERATE NOW"
	ROGUE_NOT_VALID_NUMBER = "That is not a valid number: "
	ROGUE_EARLY_EVISCERATE = "Early eviscerate! Kill shot!"
	ROGUE_ONLY_WITH_EVISC = "ifKillShot only works with evisc or cbEvisc"
	ROGUE_ONLY_WITH_CBEVISC = "ifCbKillShot only works with cbEvisc or coldBlood-evisc"
	ROGUE_NOT_VALID_GOAL_PERCENTAGE = " is not a valid goal percentage"
	ROGUE_FOUND = "Found "
	ROGUE_AT = " at "
	ROGUE_OUT_OF_POISON = "Out of poison: "
	ROGUE_STR_DMG_LOOKUP_FAILED = "strange, damage lookup failed"
	ROGUE_IMPORTED_FORM = "Imported form "
	ROGUE_CHANGED = " Changed "
	ROGUE_CHANGED_1 = " Changed "
	ROGUE_LINES = " lines."
	ROGUE_LINE = " line."
	ROGUE_NO_CHANGES_MADE = " No changes made."
	ROGUE_ORIGINAL_LINE = "Original line: "
	ROGUE_CONVERTED_LINE = "Converted line: "
	ROGUE_NO_EQUIVALENT_BUFF_DEBUFF_FOUND = "No equivalent buff/debuff found for "
	ROGUE_CONVERSION_ERROR = "Conversion error: No equivalent action found for "
	ROGUE_CMD_DESCRIPTION_1 = " resetEviscerateStats"
	ROGUE_CMD_DESCRIPTION_2 = " useEviscerateTracking"
	ROGUE_CMD_DESCRIPTION_3 = " trackEviscCrits"
	ROGUE_CMD_DESCRIPTION_4 = " importOldForms"
	ROGUE_CMD_DESCRIPTION_5 = " convertOldForm <formName>"
	ROGUE_EVIRCERATE_NO_LONGER_USING = "No longer using Eviscerate tracking."
	ROGUE_EVIRCERATE_NOW_USING = "Now using Eviscerate tracking."
	ROGUE_EVIRCERATE_NO_LONGER_CRITS = "No longer tracking Eviscerate crits."
	ROGUE_EVIRCERATE_NOW_CRITS = "Now tracking Eviscerate crits."
	ROGUE_FORM_NAME_REQUIRED = "Form name required."
	ROGUE_CONVERTED_FORM = "Converted form "
	
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT = "< Eviscerate Options >"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_TITLE = "Eviscerate Options"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_USE_EVISC = "Use Eviscerate Tracking"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_INC_CRITS = "... Include Crits (may skew kill shots)"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE = "Eviscerate sample window:"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE_LAST = "... Last "
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE_EVISC = " Eviscerates"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS = "Eviscerate Stats"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_FORMAT = "Observed/Optimal => % (# seen)"
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_OUTPUT_CP = "cp: "
	ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_OUTPUT_SEEN = " seen)"
	ROGUE_CUSTOM_MENU_EVISCERATE_RESET = "< Reset >"
	
	function lazyRogue.CustomLocaleActionHelp() return [[<H2>Rogue Actions that take parameters:</H2>]] end
	function lazyRogue.CustomLocaleHelp() 
		return [[
			<H2>Rogue Criteria:</H2>
			<P>-ifCbKillShot |cffffff00(evisc or cbevisc only)|r</P>
			<P>-ifKillShot[=XX%] |cffffff00(evisc only)|r</P>
			<P>-if[Not]LastChance[PlusX.Xs] |cffffff00(default is 0.25s)|r</P>
		]] 
	end
	
	if (locale == "ruRU") then
		
		lazyRogueLocale.ruRU.IMPORTED = "LazyRogue v3.1 настройки, формы, исключения критериев прерывания и отслеживаемые иммунитеты были импортированы."
		
		lazyRogueLocale.ruRU.ACTION_TTS.adrenaline        = "Выброс адреналина"
		lazyRogueLocale.ruRU.ACTION_TTS.ambush            = "Внезапный удар"
		lazyRogueLocale.ruRU.ACTION_TTS.bladeFlurry       = "Шквал клинков"
		lazyRogueLocale.ruRU.ACTION_TTS.blind             = "Ослепление"
		lazyRogueLocale.ruRU.ACTION_TTS.bs                = "Удар в спину"
		lazyRogueLocale.ruRU.ACTION_TTS.cs                = "Подлый трюк"
		lazyRogueLocale.ruRU.ACTION_TTS.coldBlood         = "Хладнокровие"
		lazyRogueLocale.ruRU.ACTION_TTS.distract          = "Отвлечение"
		lazyRogueLocale.ruRU.ACTION_TTS.evasion           = "Ускользание"
		lazyRogueLocale.ruRU.ACTION_TTS.evisc             = "Потрошение"
		lazyRogueLocale.ruRU.ACTION_TTS.expose            = "Ослабление доспеха"
		lazyRogueLocale.ruRU.ACTION_TTS.feint             = "Ложный выпад"
		lazyRogueLocale.ruRU.ACTION_TTS.garrote           = "Гаррота"
		lazyRogueLocale.ruRU.ACTION_TTS.ghostly           = "Призрачный удар"
		lazyRogueLocale.ruRU.ACTION_TTS.gouge             = "Парализующий удар"
		lazyRogueLocale.ruRU.ACTION_TTS.hemo              = "Кровоизлияние"
		lazyRogueLocale.ruRU.ACTION_TTS.kick              = "Пинок"
		lazyRogueLocale.ruRU.ACTION_TTS.ks                = "Удар по почкам"
		lazyRogueLocale.ruRU.ACTION_TTS.pickPocket        = "Обшаривание карманов"
		lazyRogueLocale.ruRU.ACTION_TTS.premeditation     = "Умысел"
		lazyRogueLocale.ruRU.ACTION_TTS.preparation       = "Подготовка"
		lazyRogueLocale.ruRU.ACTION_TTS.riposte           = "Ответный удар"
		lazyRogueLocale.ruRU.ACTION_TTS.rupture           = "Рваная рана"
		lazyRogueLocale.ruRU.ACTION_TTS.sap               = "Ошеломление"
		lazyRogueLocale.ruRU.ACTION_TTS.snd               = "Мясорубка"
		lazyRogueLocale.ruRU.ACTION_TTS.sprint            = "Спринт"
		lazyRogueLocale.ruRU.ACTION_TTS.ss                = "Коварный удар"
		lazyRogueLocale.ruRU.ACTION_TTS.stealth           = "Незаметность"
		lazyRogueLocale.ruRU.ACTION_TTS.vanish            = "Исчезновение"
		
		lazyRogueLocale.ruRU.EVISCERATE_HIT = "Ваше заклинание \"Потрошение\" наносит (.+) (%d+) ед. урона."
		lazyRogueLocale.ruRU.EVISCERATE_CRIT = "Ваше заклинание \"Потрошение\" наносит (.+) (%d+) ед. урона: критический эффект.";
		
		-- EviscerateTracking.lua
		ROGUE_EVIRCERATE_NOT_SUPPORTED = "Отслеживание Потрошения не поддерживается для вашей локализации."
		ROGUE_RESET_EVIRCERATE_STATS = "Статистика потрошения сброшена."
		ROGUE_EVIRCERATE_CANT_RECORD = "lazyRogue.eviscComboPoints ничего или 0, запись невозможна"
		ROGUE_EVIRCERATE_OUTPUT_1 = "Потрошение ("
		ROGUE_EVIRCERATE_OUTPUT_2 = " комбо): "
		ROGUE_EVIRCERATE_OUTPUT_3 = " урон (оптимальный "
		ROGUE_EVIRCERATE_OUTPUT_4 = " (текущий в среднем/оптимальный)"
		ROGUE_EVIRCERATE_USE_ACTION_HOOK = "UseActionHook, Я вижу, что вы используете потрошение с "
		ROGUE_EVIRCERATE_CAST_SPELL_HOOK = "CastSpellHook, Я вижу, что вы используете потрошение с "
		ROGUE_EVIRCERATE_CPS = " комбо"
		
		-- LazyRogue.lua
		ROGUE_ADDON_LOADED = " загружен. Работает от "
		
		-- ParseRogue.lua
		ROGUE_APPLY_POISON_ONLY_MAIN_OFF_HAND = "applyPoison: Поддерживается только правая или левая рука, не "
		ROGUE_IF_POISONED_ONLY_MAIN_OFF_HAND = "ifPoisoned: Поддерживается только правая или левая рука, не "
		ROGUE_DEAD_IN = "IsLastChance: УМЕР В "
		ROGUE_S = "сек."
		ROGUE_EVISCERATE_NOW = " ПОТРОШЕНИЕ СЕЙЧАС"
		ROGUE_NOT_VALID_NUMBER = "Это недопустимый номер: "
		ROGUE_EARLY_EVISCERATE = "Поздно потрошение! Добивающий удар!"
		ROGUE_ONLY_WITH_EVISC = "ifKillShot работает только с evisc или cbEvisc"
		ROGUE_ONLY_WITH_CBEVISC = "ifCbKillShot работает только с cbEvisc или coldBlood-evisc"
		ROGUE_NOT_VALID_GOAL_PERCENTAGE = " недопустимый процент цели"
		ROGUE_FOUND = "Найдено "
		ROGUE_AT = " в "
		ROGUE_OUT_OF_POISON = "Без яда: "
		ROGUE_STR_DMG_LOOKUP_FAILED = "странно, ошибка поиска урона"
		ROGUE_IMPORTED_FORM = "Импортируемые формы "
		ROGUE_CHANGED = " Изменены "
		ROGUE_CHANGED_1 = " Изменена "
		ROGUE_LINES = " линии."
		ROGUE_LINE = " линия."
		ROGUE_NO_CHANGES_MADE = " Изменений не сделано."
		ROGUE_ORIGINAL_LINE = "Оригинальная линия: "
		ROGUE_CONVERTED_LINE = "Конвертируемая линия: "
		ROGUE_NO_EQUIVALENT_BUFF_DEBUFF_FOUND = "Эквивалентный бафф/дебафф не найден для "
		ROGUE_CONVERSION_ERROR = "Ошибка преобразования: Эквивалентное действие не найдено для "
		ROGUE_CMD_DESCRIPTION_1 = " resetEviscerateStats|cffffffff - Сброс статистики Потрошения|r"
		ROGUE_CMD_DESCRIPTION_2 = " useEviscerateTracking|cffffffff - Переключение отслеживания Потрошения|r"
		ROGUE_CMD_DESCRIPTION_3 = " trackEviscCrits|cffffffff - Подключение критических ударов Потрошения|r"
		ROGUE_CMD_DESCRIPTION_4 = " importOldForms|cffffffff - Импортирование старых форм|r"
		ROGUE_CMD_DESCRIPTION_5 = " convertOldForm <formName>|cffffffff - Конвертирование старых форм|r"
		ROGUE_EVIRCERATE_NO_LONGER_USING = "Отслеживание потрошения больше не используется."
		ROGUE_EVIRCERATE_NOW_USING = "Отслеживание потрошения теперь используется."
		ROGUE_EVIRCERATE_NO_LONGER_CRITS = "Отслеживание критических ударов потрошения больше не используется."
		ROGUE_EVIRCERATE_NOW_CRITS = "Отслеживание критических ударов потрошения теперь используется."
		ROGUE_FORM_NAME_REQUIRED = "Требуется имя формы."
		ROGUE_CONVERTED_FORM = "Конвертируемая форма "
		
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT = "< Настройки Потрошения >"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_TITLE = "Настройки Потрошения"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_USE_EVISC = "Использовать отслеживание Потрошения"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_INC_CRITS = "... Подключить криты (может исказить данные)"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE = "Окно замеров Потрошения:"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE_LAST = "... Последние "
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_SAMPLE_EVISC = " Потрошений"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS = "Статистика Потрошения"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_FORMAT = "Реальные/Оптимальные => % (# раз)"
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_OUTPUT_CP = " комбо: "
		ROGUE_CUSTOM_MENU_EVISCERATE_OPT_STATS_OUTPUT_SEEN = " раз)"
		ROGUE_CUSTOM_MENU_EVISCERATE_RESET = "< Сброс >"
		
		function lazyRogue.CustomLocaleActionHelp() return [[<H2>Действия Разбойника, которые берут параметры:</H2>]] end
		function lazyRogue.CustomLocaleHelp() 
			return [[
				<H2>Критерии Разбойника:</H2>
				<P>-ifCbKillShot |cffffff00(только evisc или cbevisc)|r</P>
				<P>-ifKillShot[=XX%] |cffffff00(только evisc)|r</P>
				<P>-if[Not]LastChance[PlusX.Xs] |cffffff00(по умолчанию 0.25сек.)|r</P>
			]] 
		end
		
		elseif (locale == "deDE") then
		
		lazyRogueLocale.deDE.EVISCERATE_HIT = "Ausweiden von Euch trifft (.+) f\195\188r (%d+) Schaden."
		lazyRogueLocale.deDE.EVISCERATE_CRIT = "Euer Ausweiden trifft (.+) kritisch. Schaden: (%d+).";
		
		elseif (locale == "frFR") then
		
		lazyRogueLocale.frFR.EVISCERATE_HIT = "Votre Evisc\195\169ration touche (.+) et inflige (%d+) points de d\195\169g\195\162ts."
		lazyRogueLocale.frFR.EVISCERATE_CRIT = "Votre Evisc\195\169ration inflige un coup critique \195\160 (.+) %((%d+) points de d\195\169g\195\162ts%).";
		
	end
end