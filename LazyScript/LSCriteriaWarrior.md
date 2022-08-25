List of recognised criteria
===========================

Append zero or more criteria to an action. All criteria must be true for
that action to be used. List your actions one after another on separate
lines. The first action that matches all criteria is used.

Multiple values within curly braces ({}) means choose one or more. If
more than one is chosen, separate them with commas (e.g.
ifRace=Human,Gnome) and the criteria will match if any of the choices
match. If a multiple-choice criteria is negated with a "Not" (e.g.
ifNotRace=Human,Gnome) then the criteria will match only if none of the
choices match. Square brackets ([]) mean the value is optional. Do NOT
leave the curly braces or square brackets in your form.

Warrior Criteria:
-----------------
```
	-if[Fury]BloodthirstKillShot[XX%hp]
	-if[Not]Stance={battle,berserk,defensive}
```
Action Criteria:
----------------
```
	-everyXXs
	-if[Not]{Ctrl,Alt,Shift}Down (see note #1)
	-if[Not]Cooldown{<,>}XXs={action1,action2,...}
	-if[Not]CurrentAction[=action1,action2,...]
	-if[Not]GlobalCooldown (see note #8)
	-if[Not]History{<,=,>}XX=action
	-if[Not]HistoryCount{<,=,>}XX=action
	-if[Not]LastAction=action
	-if[Not]LastUsed>XXs=action (see note #10)
	-if[Not]InCooldown={action1,action2,...}
	-if[Not]InRange={action1,action2,...} (see note #2)
	-if[Not]Timer>XXs=action (see note #10)
	-if[Not]Usable={action1,action2,...} (see note #7)
```
Attack Criteria:
----------------
```
	-if[Not]BehindAttackJustFailed[X[.Y]s] (see note #3)
	-if[Not]InFrontAttackJustFailed[X[.Y]s] (see note #3)
	-if[Not]OutdoorsAttackJustFailed[X[.Y]s] (see note #3)
	-if[Not]Casting
	-if[Not]Channelling
	-if[Not]Shooting
	-if[Not]Wanding
```
Buff/Debuff Criteria:
---------------------
```
	-if[Not]{Buff,Debuff}Duration{<,>}XXs={buff1,buff2,...} (player only)
	-if[Not]{Buff,Debuff}TitleDuration{<,>}XXs={buffTitle1,buffTitle2,...} (see note #4, player only)
	-if[Not][<UnitId>]Has{Buff,Debuff}[{<,=,>}XX]={buff1,buff2,...} (see notes #5 and #9)
	-if[Not][<UnitId>]Has{Buff,Debuff}Title[{<,=,>}XX]={buffTitle1,buffTitle2,...} (see notes #4, #5, and #9)
	-if[Not][<UnitId>]Is={Asleep, Bleeding, CCd, Charmed, Cursed, Diseased, Disoriented, Dotted, Drinking, Eating, Feared, Immobile, Incapacitated, Magicked, Poisoned, Polymorphed, Slowed, Stunned, Stung} (see note #9)
	-if[Not]{MainHand, OffHand}Buffed
```
Item Criteria:
--------------
```
	-if[Not]ItemCooldown{<,>}XXs={item1,item2,...}
	-if[Not]ItemInCooldown={item1,item2,...}
```
Player Criteria:
----------------
```
	-if[Not]Dueling
	-if[Not]Equipped=item
	-if[Not]Ganked
	-if[Not]InGroup (party or raid)
	-if[Not]InInstance
	-if[Not]InBattleground
	-if[Not]InRaid
	-if[Not]Mounted
	-if[Not]Shadowmelded
	-if[Not]Tracking={Herbs, Minerals, Treasure}
	-if[{<,=,>}]XAttackers (PvP only)
	-if[Not]Zone=zonename
```
Pet:
----
```
	-if[Not]HasPet
	-if[Not]PetAlive
	-if[Not]Pet{Attacking, Following, Staying, Aggressive, Defensive, Passive}
	-if[Not]PetFamily={Bat, Bear, Boar, Carrion Bird, Cat, Crab, Crocolisk, Doomguard, Felhunter, Gorilla, Hyena, Imp, Infernal, Owl, Raptor, Scorpid, Spider, Succubus, Tallstrider, Turtle, Voidwalker, Windserpent, Wolf}
	-if[Not]PetName=name
```
Player, Pet or Target Criteria:
-------------------------------
```
	-if[Not]{[Player],Target}{Blocked, Dodged, Parried, Resisted}[{<,>}XX.XXs] (defaults to <5s, see note #11)
	-if[Not]{[Player],Target}FlaggedPVP
	-if[Not]{[Player],Target}FlagRunner
	-if[Not]{[Player],Pet,Target}InCombat
	-if[<UnitId>]{<,=,>}XX[%]{hp,mana/energy/rage/focus}[Deficit] (see note #9)
	-if[Not]{[Player],Target}Race={Human, Night Elf, Gnome, Dwarf, Orc, Scourge/Undead, Tauren, Troll}
```
Target Criteria:
----------------
```
	-if[Not]CanDebuff
	-if[Not]HaveTarget
	-if[Not]TargetAlive
	-if[Not]TargetAttackable
	-if[Not]TargetBoss
	-if[Not]TargetClass={Druid, Hunter, Mage, Paladin, Priest, Rogue, Shaman, Warlock, Warrior}
	-if[Not]TargetElite
	-if[Not]TargetEnemy
	-if[Not]TargetFleeing (NPC only)
	-if[Not]TargetFriend
	-if[Not]TargetHasTarget
	-if[Not]TargetHostile
	-if[Not]TargetIsCasting[={name regex,FIRE,FROST,NATURE,SHADOW,ARCANE,HOLY}]
	-if[Not]TargetImmune[=action]
	-if[Not]TargetInBlindRange (Within 10 yards)
	-if[Not]TargetInLongRange (Within 28 yards)
	-if[Not]TargetInMediumRange (Within 10 yards)
	-if[Not]TargetInMeleeRange (see note #6)
	-if[Not]TargetLevel{<,=,>}XX (Does not work for bosses)
	-if[Not]TargetMyLevel{<,=,>}{plus,minus}XX (Does not work for bosses)
	-if[Not]TargetNamed={regex1,regex2,...}
	-if[Not]TargetNPC
	-if[Not]TargetOfTarget
	-if[Not]TargetOfTargetClass={Druid, Hunter, Mage, Paladin, Priest, Rogue, Shaman, Warlock, Warrior}
	-if[Not]TargetTrivial
	-if[Not]TargetType={Beast, Critter, Demon, Dragonkin, Elemental, Humanoid, Undead}
	-ifTimeToDeath{<,=,>}XXs
```
**Note 1**: To use -if{Ctrl,Alt,Shift}Down, you MUST remove any existing
Ctrl/Alt/Shift key bindings from the Main Menu, Key Bindings. Otherwise
the game will intercept the key and LazyScript will not see it.

**Note 2**: Always use with -if[Not]TargetFriend since it will return true
if the target is not a valid target for the spell.

**Note 3**: Within X.Y sec, defaults to 0.3.

**Note 4**: The buff/debuff name must be the full name (including
capitalization and spaces) of the buff/debuff title as it appears in the
tooltip.

**Note 5**: XX refers to the number of buff/debuff applications. e.g.
-ifTargetHasDebuff<5=sunder

**Note 6**: As of patch 1.12 this only works on unfriendly targets for Rogue
(Sinister Strike), Druid (Growl), Hunter (Wing Clip) and Warrior (Rend).

**Note 7**: The ifUsable criteria checks if the action is valid for use at
present as per the Blizzard API call IsUsableAction. This does not
include cooldown or range checking.

**Note 8**: The ifGlobalCooldown criteria requires a specific action to be
placed on your action bar so that it may be checked for the global
cooldown. It does not have to be on a visible action bar. For each
class, the actions are as follows:

Rogue: Sinister StrikeDruid: Mark of the WildHunter: Track BeastsPriest:
Power Word: FortitudeWarrior: Battle ShoutMage: Frost ArmorWarlock:
Demon SkinShaman: Rockbiter WeaponPaladin: Seal of Righteousness

**Note 9**: The <UnitId> can be any valid UnitId sequence as described
in <http://www.wowwiki.com/UnitId>. For example, player, pet,
target, targettarget. Capitalization is not important.

**Note 10**: The ifLastUsed timer will perform the action immediately at the
start of combat or if you changed targets if the action is available.
The ifTimer criteria will first countdown XX seconds after initiating
combat or changing targets before performing the action for the first
time.

**Note 11**: This criteria only detects full blocks and resists. A partial
block or resist ("Joe hits you for 10 damage (5 blocked).") either on
the player or the target will NOT be detected by this criteria.
