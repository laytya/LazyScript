lazyWarriorLoad.metadata:updateRevisionFromKeyword("$Revision: 644 $")

function lazyWarriorLoad.LoadWarriorLocalization(locale)
	
	lazyWarriorLocale.enUS.ACTION_TTS.bloodrage         = "Bloodrage"
	lazyWarriorLocale.enUS.ACTION_TTS.charge            = "Charge"
	lazyWarriorLocale.enUS.ACTION_TTS.battleShout       = "Battle Shout"
	lazyWarriorLocale.enUS.ACTION_TTS.thunderClap       = "Thunder Clap"
	lazyWarriorLocale.enUS.ACTION_TTS.rend              = "Rend"
	lazyWarriorLocale.enUS.ACTION_TTS.hamstring         = "Hamstring"
	lazyWarriorLocale.enUS.ACTION_TTS.heroicStrike      = "Heroic Strike"
	lazyWarriorLocale.enUS.ACTION_TTS.sunder            = "Sunder Armor"
	lazyWarriorLocale.enUS.ACTION_TTS.overpower         = "Overpower"
	lazyWarriorLocale.enUS.ACTION_TTS.demoShout         = "Demoralizing Shout"
	lazyWarriorLocale.enUS.ACTION_TTS.revenge           = "Revenge"
	lazyWarriorLocale.enUS.ACTION_TTS.mockingBlow       = "Mocking Blow"
	lazyWarriorLocale.enUS.ACTION_TTS.shieldBlock       = "Shield Block"
	lazyWarriorLocale.enUS.ACTION_TTS.disarm            = "Disarm"
	lazyWarriorLocale.enUS.ACTION_TTS.cleave            = "Cleave"
	lazyWarriorLocale.enUS.ACTION_TTS.execute           = "Execute"
	lazyWarriorLocale.enUS.ACTION_TTS.deathWish         = "Death Wish"
	lazyWarriorLocale.enUS.ACTION_TTS.intercept         = "Intercept"
	lazyWarriorLocale.enUS.ACTION_TTS.berserkerRage     = "Berserker Rage"
	lazyWarriorLocale.enUS.ACTION_TTS.whirlwind         = "Whirlwind"
	lazyWarriorLocale.enUS.ACTION_TTS.pummel            = "Pummel"
	lazyWarriorLocale.enUS.ACTION_TTS.bloodthirst       = "Bloodthirst"
	lazyWarriorLocale.enUS.ACTION_TTS.piercingHowl      = "Piercing Howl"
	lazyWarriorLocale.enUS.ACTION_TTS.taunt             = "Taunt"
	lazyWarriorLocale.enUS.ACTION_TTS.battle            = "Battle Stance"
	lazyWarriorLocale.enUS.ACTION_TTS.defensive         = "Defensive Stance"
	lazyWarriorLocale.enUS.ACTION_TTS.berserk           = "Berserker Stance"
	lazyWarriorLocale.enUS.ACTION_TTS.lastStand         = "Last Stand"
	lazyWarriorLocale.enUS.ACTION_TTS.shieldBash        = "Shield Bash"
	lazyWarriorLocale.enUS.ACTION_TTS.mortalStrike      = "Mortal Strike"
	lazyWarriorLocale.enUS.ACTION_TTS.shieldSlam        = "Shield Slam"
	lazyWarriorLocale.enUS.ACTION_TTS.sweepingStrikes   = "Sweeping Strikes"
	lazyWarriorLocale.enUS.ACTION_TTS.concussionBlow    = "Concussion Blow"
	lazyWarriorLocale.enUS.ACTION_TTS.challengingShout  = "Challenging Shout"
	lazyWarriorLocale.enUS.ACTION_TTS.intimidatingShout = "Intimidating Shout"
	lazyWarriorLocale.enUS.ACTION_TTS.recklessness      = "Recklessness"
	lazyWarriorLocale.enUS.ACTION_TTS.retaliation       = "Retaliation"
	lazyWarriorLocale.enUS.ACTION_TTS.shieldWall        = "Shield Wall"
	lazyWarriorLocale.enUS.ACTION_TTS.slam              = "Slam"
	
	-- LazyWarrior.lua
	WARRIOR_ADDON_LOADED = " loaded. Powered by "
	
	-- ParseWarrior.lua
	WARRIOR_EARLY_BLOODTHIRST = "Early Bloodthirst! Kill shot!"
	WARRIOR_STANCE = "Stance: "
	WARRIOR_NOT_RECOGNISED = " not recognised."
	ITEM_SUBTYPE_SHIELDS = "Shields"
	
	function lazyWarrior.CustomLocaleHelp() return [[<H2>Warrior Criteria:</H2>]] end
	
	if (locale == "ruRU") then
		
		lazyWarriorLocale.ruRU.ACTION_TTS.bloodrage         = "Кровавая ярость"
		lazyWarriorLocale.ruRU.ACTION_TTS.charge            = "Рывок"
		lazyWarriorLocale.ruRU.ACTION_TTS.battleShout       = "Боевой крик"
		lazyWarriorLocale.ruRU.ACTION_TTS.thunderClap       = "Удар грома"
		lazyWarriorLocale.ruRU.ACTION_TTS.rend              = "Кровопускание"
		lazyWarriorLocale.ruRU.ACTION_TTS.hamstring         = "Подрезать сухожилия"
		lazyWarriorLocale.ruRU.ACTION_TTS.heroicStrike      = "Удар героя"
		lazyWarriorLocale.ruRU.ACTION_TTS.sunder            = "Раскол брони"
		lazyWarriorLocale.ruRU.ACTION_TTS.overpower         = "Превосходство"
		lazyWarriorLocale.ruRU.ACTION_TTS.demoShout         = "Деморализующий крик"
		lazyWarriorLocale.ruRU.ACTION_TTS.revenge           = "Реванш"
		lazyWarriorLocale.ruRU.ACTION_TTS.mockingBlow       = "Дразнящий удар"
		lazyWarriorLocale.ruRU.ACTION_TTS.shieldBlock       = "Блок щитом"
		lazyWarriorLocale.ruRU.ACTION_TTS.disarm            = "Разоружение"
		lazyWarriorLocale.ruRU.ACTION_TTS.cleave            = "Рассекающий удар"
		lazyWarriorLocale.ruRU.ACTION_TTS.execute           = "Казнь"
		lazyWarriorLocale.ruRU.ACTION_TTS.deathWish         = "Жажда смерти"
		lazyWarriorLocale.ruRU.ACTION_TTS.intercept         = "Перехват"
		lazyWarriorLocale.ruRU.ACTION_TTS.berserkerRage     = "Ярость берсерка"
		lazyWarriorLocale.ruRU.ACTION_TTS.whirlwind         = "Вихрь"
		lazyWarriorLocale.ruRU.ACTION_TTS.pummel            = "Зуботычина"
		lazyWarriorLocale.ruRU.ACTION_TTS.bloodthirst       = "Жажда крови"
		lazyWarriorLocale.ruRU.ACTION_TTS.piercingHowl      = "Пронзительный вой"
		lazyWarriorLocale.ruRU.ACTION_TTS.taunt             = "Провокация"
		lazyWarriorLocale.ruRU.ACTION_TTS.battle            = "Боевая стойка"
		lazyWarriorLocale.ruRU.ACTION_TTS.defensive         = "Оборонительная стойка"
		lazyWarriorLocale.ruRU.ACTION_TTS.berserk           = "Стойка берсерка"
		lazyWarriorLocale.ruRU.ACTION_TTS.lastStand         = "Ни шагу назад"
		lazyWarriorLocale.ruRU.ACTION_TTS.shieldBash        = "Удар щитом"
		lazyWarriorLocale.ruRU.ACTION_TTS.mortalStrike      = "Смертельный удар"
		lazyWarriorLocale.ruRU.ACTION_TTS.shieldSlam        = "Мощный удар щитом"
		lazyWarriorLocale.ruRU.ACTION_TTS.sweepingStrikes   = "Размашистые удары"
		lazyWarriorLocale.ruRU.ACTION_TTS.concussionBlow    = "Оглушающий удар"
		lazyWarriorLocale.ruRU.ACTION_TTS.challengingShout  = "Вызывающий крик"
		lazyWarriorLocale.ruRU.ACTION_TTS.intimidatingShout = "Устрашающий крик"
		lazyWarriorLocale.ruRU.ACTION_TTS.recklessness      = "Безрассудство"
		lazyWarriorLocale.ruRU.ACTION_TTS.retaliation       = "Возмездие"
		lazyWarriorLocale.ruRU.ACTION_TTS.shieldWall        = "Глухая оборона"
		lazyWarriorLocale.ruRU.ACTION_TTS.slam              = "Мощный удар"
		
		-- LazyWarrior.lua
		WARRIOR_ADDON_LOADED = " загружен. Работает от "
		
		-- ParseWarrior.lua
		WARRIOR_EARLY_BLOODTHIRST = "Поздно Жажда крови! Добивающий удар!"
		WARRIOR_STANCE = "Стойка: "
		WARRIOR_NOT_RECOGNISED = " не знакома."
		ITEM_SUBTYPE_SHIELDS = "Shields"
		
		function lazyWarrior.CustomLocaleHelp() return [[<H2>Критерии Воина:</H2>]] end
		
		elseif (locale == "deDE") then
		
		lazyWarriorLocale.deDE.ACTION_TTS.overpower        = "\195\156berw\195\164ltigen"
		lazyWarriorLocale.deDE.ACTION_TTS.shieldBash       = "Schildhieb"
		
		elseif (locale == "frFR") then
		
		lazyWarriorLocale.frFR.ACTION_TTS.overpower        = "Fulgurance"
		lazyWarriorLocale.frFR.ACTION_TTS.shieldBash       = "Coup de bouclier"
		
	end
end