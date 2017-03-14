List of known Spells/Actions
============================

A specific spell rank can be directed at a particular unit using the
syntax:
```
	action[(rankXX)][<UnitId>]
```
The \<UnitId\> can be any valid UnitId sequence as described in [http://www.wowwiki.com/UnitId](http://web.archive.org/web/20070422180647/http://www.wowwiki.com/UnitId) . For example, \@player, \@pet,
\@target, \@targettarget. Note that the rank of the spell must always
appear before the '@' symbol.

Actions in green do not trigger the global cooldown. LazyScript is able
to perform multiple of these actions on a single line provided that the
line has at most one action that triggers the global cooldown.

Full Name = Short Name
----------------------

**Aggressive** = *petAggressive*

**Battle Shout** = battleShout

**Berserker Rage** = berserkerRage

**Berserking** = berserking

**Blood Fury** = bloodFury

**Bloodrage** = bloodrage

**Bloodthirst** = bloodthirst

**Cannibalize** = cannibalize

**Challenging Shout** = challengingShout

**Charge** = charge

**Cleave** = cleave

**Concussion Blow** = concussionBlow

**Death Wish** = deathWish

**Defensive** = petDefensive

**Demoralizing Shout** = demoShout

**Disarm** = disarm

**Escape Artist** = escapeArtist

**Execute** = execute

**Find Herbs** = findHerbs

**Find Minerals** = findMinerals

**Find Treasure** = findTreasure

**Follow** = petFollow

**Hamstring** = hamstring

**Heroic Strike** = heroicStrike

**Intercept** = intercept

**Intimidating Shout** = intimidatingShout

**Last Stand** = lastStand

**Mocking Blow** = mockingBlow

**Mortal Strike** = mortalStrike

**Overpower** = overpower

**Passive** = petPassive

**Perception** = perception

**Piercing Howl** = piercingHowl

**Pummel** = pummel

**Recklessness** = recklessness

**Rend** = rend

**Retaliation** = retaliation

**Revenge** = revenge

**Shadowmeld** = shadowmeld

**Shield Bash** = shieldBash

**Shield Block** = shieldBlock

**Shield Slam** = shieldSlam

**Shield Wall** = shieldWall

**Shoot Bow** = bow

**Shoot Crossbow** = crossbow

**Shoot Gun** = gun

**Slam** = slam

**Stay** = petStay

**Stoneform** = stoneForm

**Sunder Armor** = sunder

**Sweeping Strikes** = sweepingStrikes

**Taunt** = taunt

**Throw** = throw

**Thunder Clap** = thunderClap

**War Stomp** = warStomp

**Whirlwind** = whirlwind

**Will of the Forsaken** = forsaken

Other Actions
-------------

**Battle Stance** = battle

**Berserker Stance** = berserk

**Defensive Stance** = defensive

Special Actions
---------------

**Assist Pet** = assistPet

**Assist** = assist

**Auto Shot** = autoShot

**Auto Target/Attack** = autoAttack

**Clear History** = clearHistory

**Clear Target** = clearTarget

**Dismount** = dismount

**Pet Attack** = petAttack

**Pet Stop** = petStop

**Ping** = ping

**Stop All** = stopAll

**Stop Auto Shot** = stopShot

**Stop Auto-Attack** = stopAttack

**Stop Casting** = stopCasting

**Stop Wand** = stopWand

**Stop** = stop

**Target Last** = targetLast

**Target Nearest Friend** = targetNearestFriend

**Target Nearest** = targetNearest

**Wand** = wand

Actions that take parameters
----------------------------

Use an action: 
```
	action=<action/macro name>
	```
Use an action that does not trigger the global cooldown:
```
	freeAction=<action/macro name>
```
Use a pet action: 
```
	petAction=<action>
```
Use an item in your equipment or inventory: 
```
	use=<itemid/item name>
```
Use an item only if it is equipped: 
```
	useEquipped=<itemid/item name>
```
Use an item in your equipment or inventory that does not trigger the global cooldown: 
```
	useFreeItem=<itemid/item name>
```
Use an item that does not trigger the global cooldown only if it is equipped: 
```
	useFreeEquippedItem=<itemid/item name>
```
Apply an item weapon buff: 
```
	apply{MainHand,OffHand}Buff=<itemid/item name>
```
Equip a weapon in your main hand: 
```
	equipMainHand=<itemid/item name>
```
Equip a weapon in your off hand: 
```
	equipOffHand=<itemid/item name>
```
Echo the message to your chat: 
```
	echo=<message>
```
Say the message in the specified channel: 
```
	sayIn{Emote, Guild, Minion, Party, Raid, RAID_WARNING, Say, Yell} =<message>
```
Whisper the message to the specified player or unitId:
```
	whisperTo{playerName, <UnitId>} =<message>
```
Cancel the specified buff: 
```
	cancelBuff=<buff>
```
Cancel the specified buff by title: 
```
	cancelBuffTitle=<buffTitle>
```
Set the specified form as the default: 
```
	setForm=<form name>
```
Target a specific unit: 
```
	targetUnit=<UnitId>
```
Cast a spell on a specific unit: 
```
	spellTargetUnit=<UnitId>
```
Target a player/creature by their exact name: 
```
	targetByName=<exact name>
```
Perform emote \(See [http://www.wowwiki.com/API_TYPE_Emotes_Token](https://web.archive.org/web/20071213125504/http://www.wowwiki.com/API_TYPE_Emotes_Token)\):
```
	doEmote=<emoteToken>
```
Play sound (See [http://www.wowwiki.com/API_PlaySound](https://web.archive.org/web/20071214171353/http://www.wowwiki.com/API_PlaySound)):
```	
	playSound=<soundName>
```
Meta-Actions
------------

Include the contents of the specified form:
 
```
    gincludeForm=<form name>
```

Note: This does not accept criteria. It must appear on a line by
itself. You cannot include a form in itself, nor should you include a
form which includes another form which includes the first (e.g. form A
includes form B includes form A == BAD).

Call the specified form: 

```
    callForm=<form name>
```

This will try to find a usable action in the specified form, if the criteria on the callForm
action are satisfied.
