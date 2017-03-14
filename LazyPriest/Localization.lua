lazyPriestLoad.metadata:updateRevisionFromKeyword("$Revision: 308 $")

function lazyPriestLoad.LoadPriestLocalization(locale)
	
	lazyPriestLocale.enUS.ACTION_TTS.abolishDisease		= "Abolish Disease"
	lazyPriestLocale.enUS.ACTION_TTS.cureDisease		= "Cure Disease"
	lazyPriestLocale.enUS.ACTION_TTS.desperatePrayer	= "Desperate Prayer"
	lazyPriestLocale.enUS.ACTION_TTS.devouringPlague	= "Devouring Plague"
	lazyPriestLocale.enUS.ACTION_TTS.dispelMagic		= "Dispel Magic"
	lazyPriestLocale.enUS.ACTION_TTS.divineSpirit		= "Divine Spirit"
	lazyPriestLocale.enUS.ACTION_TTS.elunesGrace		= "Elune's Grace"
	lazyPriestLocale.enUS.ACTION_TTS.fade				= "Fade"
	lazyPriestLocale.enUS.ACTION_TTS.fearWard			= "Fear Ward"
	lazyPriestLocale.enUS.ACTION_TTS.feedback			= "Feedback"
	lazyPriestLocale.enUS.ACTION_TTS.flashHeal			= "Flash Heal"
	lazyPriestLocale.enUS.ACTION_TTS.greaterHeal		= "Greater Heal"
	lazyPriestLocale.enUS.ACTION_TTS.heal				= "Heal"
	lazyPriestLocale.enUS.ACTION_TTS.hexWeakness		= "Hex of Weakness"
	lazyPriestLocale.enUS.ACTION_TTS.holyFire			= "Holy Fire"
	lazyPriestLocale.enUS.ACTION_TTS.holyNova			= "Holy Nova"
	lazyPriestLocale.enUS.ACTION_TTS.innerFire			= "Inner Fire"
	lazyPriestLocale.enUS.ACTION_TTS.innerFocus			= "Inner Focus"
	lazyPriestLocale.enUS.ACTION_TTS.lesserHeal			= "Lesser Heal"
	lazyPriestLocale.enUS.ACTION_TTS.levitate			= "Levitate"
	lazyPriestLocale.enUS.ACTION_TTS.lightwell			= "Lightwell"
	lazyPriestLocale.enUS.ACTION_TTS.lightwellRenew		= "Lightwell Renew"
	lazyPriestLocale.enUS.ACTION_TTS.manaBurn			= "Mana Burn"
	lazyPriestLocale.enUS.ACTION_TTS.mindBlast			= "Mind Blast"
	lazyPriestLocale.enUS.ACTION_TTS.mindControl		= "Mind Control"
	lazyPriestLocale.enUS.ACTION_TTS.mindFlay			= "Mind Flay"
	lazyPriestLocale.enUS.ACTION_TTS.mindSoothe			= "Mind Soothe"
	lazyPriestLocale.enUS.ACTION_TTS.mindVision			= "Mind Vision"
	lazyPriestLocale.enUS.ACTION_TTS.powerInfusion		= "Power Infusion"
	lazyPriestLocale.enUS.ACTION_TTS.pwf				= "Power Word: Fortitude"
	lazyPriestLocale.enUS.ACTION_TTS.pws				= "Power Word: Shield"
	lazyPriestLocale.enUS.ACTION_TTS.prf				= "Prayer of Fortitude"
	lazyPriestLocale.enUS.ACTION_TTS.prh				= "Prayer of Healing"
	lazyPriestLocale.enUS.ACTION_TTS.prsp				= "Prayer of Shadow Protection"
	lazyPriestLocale.enUS.ACTION_TTS.prs				= "Prayer of Spirit"
	lazyPriestLocale.enUS.ACTION_TTS.psychicScream		= "Psychic Scream"
	lazyPriestLocale.enUS.ACTION_TTS.renew				= "Renew"
	lazyPriestLocale.enUS.ACTION_TTS.resurrection		= "Resurrection"
	lazyPriestLocale.enUS.ACTION_TTS.shackleUndead		= "Shackle Undead"
	lazyPriestLocale.enUS.ACTION_TTS.shadowProtection	= "Shadow Protection"
	lazyPriestLocale.enUS.ACTION_TTS.swp				= "Shadow Word: Pain"
	lazyPriestLocale.enUS.ACTION_TTS.shadowform			= "Shadowform"
	lazyPriestLocale.enUS.ACTION_TTS.shadowguard		= "Shadowguard"
	--lazyPriestLocale.enUS.ACTION_TTS.shoot			= "Shoot"
	lazyPriestLocale.enUS.ACTION_TTS.silence			= "Silence"
	lazyPriestLocale.enUS.ACTION_TTS.smite				= "Smite"
	lazyPriestLocale.enUS.ACTION_TTS.starshards			= "Starshards"
	lazyPriestLocale.enUS.ACTION_TTS.touchWeakness		= "Touch of Weakness"
	lazyPriestLocale.enUS.ACTION_TTS.vampiricEmbrace	= "Vampiric Embrace"
	
	
	-- LazyPriest.lua
	PRIEST_ADDON_LOADED = " loaded. Powered by "
	
	-- ParsePriest.lua
	function lazyPriest.CustomLocaleHelp() return [[<H2>Priest Criteria:</H2>]] end
	
	if (locale == "ruRU") then
		
		lazyPriestLocale.ruRU.ACTION_TTS.abolishDisease		= "Устранение болезни"
		lazyPriestLocale.ruRU.ACTION_TTS.cureDisease		= "Излечение болезни"
		lazyPriestLocale.ruRU.ACTION_TTS.desperatePrayer	= "Молитва отчаяния"
		lazyPriestLocale.ruRU.ACTION_TTS.devouringPlague	= "Всепожирающая чума"
		lazyPriestLocale.ruRU.ACTION_TTS.dispelMagic		= "Рассеивание заклинаний"
		lazyPriestLocale.ruRU.ACTION_TTS.divineSpirit		= "Божественный дух"
		lazyPriestLocale.ruRU.ACTION_TTS.elunesGrace		= "Благодать Элуны"
		lazyPriestLocale.ruRU.ACTION_TTS.fade				= "Уход в тень"
		lazyPriestLocale.ruRU.ACTION_TTS.fearWard			= "Защита от страха"
		lazyPriestLocale.ruRU.ACTION_TTS.feedback			= "Ответная реакция"
		lazyPriestLocale.ruRU.ACTION_TTS.flashHeal			= "Быстрое исцеление"
		lazyPriestLocale.ruRU.ACTION_TTS.greaterHeal		= "Великое исцеление"
		lazyPriestLocale.ruRU.ACTION_TTS.heal				= "Исцеление"
		lazyPriestLocale.ruRU.ACTION_TTS.hexWeakness		= "Обессиливающий сглаз"
		lazyPriestLocale.ruRU.ACTION_TTS.holyFire			= "Священный огонь"
		lazyPriestLocale.ruRU.ACTION_TTS.holyNova			= "Кольцо света"
		lazyPriestLocale.ruRU.ACTION_TTS.innerFire			= "Внутренний огонь"
		lazyPriestLocale.ruRU.ACTION_TTS.innerFocus			= "Внутреннее сосредоточение"
		lazyPriestLocale.ruRU.ACTION_TTS.lesserHeal			= "Малое исцеление"
		lazyPriestLocale.ruRU.ACTION_TTS.levitate			= "Левитация"
		lazyPriestLocale.ruRU.ACTION_TTS.lightwell			= "Колодец Света"
		lazyPriestLocale.ruRU.ACTION_TTS.lightwellRenew		= "Обновление колодца Света"
		lazyPriestLocale.ruRU.ACTION_TTS.manaBurn			= "Сожжение маны"
		lazyPriestLocale.ruRU.ACTION_TTS.mindBlast			= "Взрыв разума"
		lazyPriestLocale.ruRU.ACTION_TTS.mindControl		= "Контроль над разумом"
		lazyPriestLocale.ruRU.ACTION_TTS.mindFlay			= "Пытка разума"
		lazyPriestLocale.ruRU.ACTION_TTS.mindSoothe			= "Усмирение"
		lazyPriestLocale.ruRU.ACTION_TTS.mindVision			= "Внутреннее зрение"
		lazyPriestLocale.ruRU.ACTION_TTS.powerInfusion		= "Придание сил"
		lazyPriestLocale.ruRU.ACTION_TTS.pwf				= "Слово силы: Стойкость"
		lazyPriestLocale.ruRU.ACTION_TTS.pws				= "Слово силы: Щит"
		lazyPriestLocale.ruRU.ACTION_TTS.prf				= "Молитва стойкости"
		lazyPriestLocale.ruRU.ACTION_TTS.prh				= "Молитва исцеления"
		lazyPriestLocale.ruRU.ACTION_TTS.prsp				= "Молитва защиты от темной магии"
		lazyPriestLocale.ruRU.ACTION_TTS.prs				= "Молитва духа"
		lazyPriestLocale.ruRU.ACTION_TTS.psychicScream		= "Ментальный крик"
		lazyPriestLocale.ruRU.ACTION_TTS.renew				= "Обновление"
		lazyPriestLocale.ruRU.ACTION_TTS.resurrection		= "Воскрешение"
		lazyPriestLocale.ruRU.ACTION_TTS.shackleUndead		= "Сковывание нежити"
		lazyPriestLocale.ruRU.ACTION_TTS.shadowProtection	= "Защита от темной магии"
		lazyPriestLocale.ruRU.ACTION_TTS.swp				= "Слово Тьмы: Боль"
		lazyPriestLocale.ruRU.ACTION_TTS.shadowform			= "Облик Тьмы"
		lazyPriestLocale.ruRU.ACTION_TTS.shadowguard		= "Страж Тьмы"
		--lazyPriestLocale.ruRU.ACTION_TTS.shoot			= "Выстрел"
		lazyPriestLocale.ruRU.ACTION_TTS.silence			= "Безмолвие"
		lazyPriestLocale.ruRU.ACTION_TTS.smite				= "Кара"
		lazyPriestLocale.ruRU.ACTION_TTS.starshards			= "Звездные осколки"
		lazyPriestLocale.ruRU.ACTION_TTS.touchWeakness		= "Прикосновение слабости"
		lazyPriestLocale.ruRU.ACTION_TTS.vampiricEmbrace	= "Объятия вампира"
		
		-- LazyPriest.lua
		PRIEST_ADDON_LOADED = " загружен. Работает от "
		
		-- ParsePriest.lua
		function lazyPriest.CustomLocaleHelp() return [[<H2>Критерии Жреца:</H2>]] end
		
		elseif (locale == "deDE") then
		
		lazyPriestLocale.deDE.ACTION_TTS.lightwell			= "Brunnen des Lichts"
		lazyPriestLocale.deDE.ACTION_TTS.lightwellRenew		= "Erneuerung des Lichtbrunnens"
		
		elseif (locale == "frFR") then
		
		lazyPriestLocale.frFR.ACTION_TTS.lightwell			= "Puits de lumi\195\168re"
		lazyPriestLocale.frFR.ACTION_TTS.lightwellRenew		= "R\195\169novation du Puits de lumi\195\168re"
		
	end
end