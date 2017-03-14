Overview
========

LazyScript is a scripting language for World of Warcraft that is able to
execute certain attacks or abilities under conditions that you specify.
This is accomplished by writing a "form", which consists of a series of
actions and criteria. When the LazyScript macro is run, the LazyScript
engine will read through the list of actions from top to bottom until it
finds an action that is ready to be used and then executes it.

Any line may be commented out by placing '--', '//', or '\#' at the
start of the line.

Tutorial 1: Baby steps
======================

For example, let us make LazyScript execute Sinister Strike. First,
check what the short name is for Sinister Strike in the actions tab. We
see that it is "ss". Now choose "Create New Form" from the LazyScript
minimap menu. Give your form a name like "MyForm" and type:

```
	ss
```
Click on the "Test" button. If everything is okay and there were no
typos, a "Testing completed" message will appear in your chat box. If
there were errors, a summary of the error will be printed in the chat
box instead. If everything is working then click on the "Okay" button.
You should now see the form "MyForm" in the LazyScript minimap form
list. Click on "MyForm" to set it as the default. A little check mark
should appear next to "MyForm" on the minimap menu.

Now create a macro with the command:
```
	/lazyscript
```
and place it on your action bar. Also place the highest rank of
"Sinister Strike" on your action bar somewhere. The "Sinister Strike"
action need not be visible. Now go out and fight something and hit your
LazyScript macro key and LazyScript will automatically execute Sinister
Strike.

Tutorial 2: Now we're getting somewhere
=======================================

_"That's not particularly impressive"_

Well, let us move onto something more interesting then. Let us include
an action that we can not execute all the time like "Riposte". We always
prefer to execute riposte rather than sinister strike, but riposte is
not always usable. Edit "MyForm" and add riposte before sinister strike,
like so:
```
	riposte
	ss
```
and place Riposte on your action bar somewhere. Now when you hit the
LazyScript macro during combat, LazyScript will execute Sinister Strike
until you parry an attack. Once that happens, LazyScript will execute
Riposte when you next hit the LazyScript macro button. Most importantly,
it will do all this without the "That action is not ready yet" spam that
you would normally have to put up with when using a standard macro.

Tutorial 3: To do or not to do, that is the question
====================================================

One of the most useful features of LazyScript is the ability to
associate conditions or criteria with a particular action. For example,
you only want to kick the target if it is casting a spell. Looking at
the criteria tab we notice that there is a condition
"-if\[Not\]TargetIsCasting" plus some other scary looking stuff. Let us
ignore the complicated stuff for now and just use "-ifTargetIsCasting".
Interrupting a spell is more important than using Riposte, so edit
"MyForm" and change it to:
```
	kick-ifTargetIsCasting
	riposte
	ss
```
Now LazyScript will only kick if it detects that the target is casting a
spell.

_"But what if I only want to interrupt fire spells?"_

Well that is what the rest of that complicated string is all about. Edit
"MyForm" and change the form to:
```
	kick-ifTargetIsCasting=FIRE
	riposte
	ss
```
_"What about if I only want to interrupt fire or frost spells? Do I have to type that all out again?"_

Nope, change "MyForm" to:
```
	kick-ifTargetIsCasting=FIRE,FROST
	riposte
	ss
```
_"I'm decked out in MC gear. The only spells I care about interrupting
are heals. Darn priests... \*mutter\*"_

We have that covered too. Just use the full text string, correctly
capitalized with spaces:
```
	kick-ifTargetIsCasting=Heal,Greater Heal
	riposte
	ss
```
Tutorial 4: Why'd you have to go and make things so complicated?
================================================================

Probably the most complex criteria you will come across are the
buff/debuff checking criteria. They are so complex because they are so
flexible. For instance, if you only want to renew your Slice and Dice if
you do not already have it running. First check the Buff/Debuff tab and
find out what the short buff/debuff name is for Slice and Dice. It is
"snd", so add a line to your form that has:
```
	snd-ifNotPlayerHasBuff=snd
```
If you only want to use Rupture on your target if it does not already
have rupture active:
```
	rupture-ifNotTargetHasDebuff=rupture
```
_"Why don't I see buff/debuff xyz in your list?"_

Although we try to be as thorough as possible with class abilities, if
we were to have entries for every single buff in the game it would take
up too much memory. If a buff is not in the list of recognised
buffs/debuffs it is still possible to search for the title of the buff.
Just use the following criteria and type in the full name of the buff or
debuff with capitalization and spacing as it appears in the tooltip
text:
```
	echo=w00t-ifPlayerHasBuffTitle=Rallying Cry of the Dragonslayer
```
_"My tanks are boring and they tell me not to start attacking the mob
until they've sundered it a few times. Can LazyScript help me?"_

LazyScript is also able to check how many applications of a buff or
debufff there are. After prying out that by "few" they mean "at least
3", you can add something like this to the top of your form:
```
	stopAll-ifTargetHasDebuff&lt;3=sunder
```
Tutorial 5: Multi-tasking
=========================

By now you may have noticed that some actions on the actions tab are
colored green. Hopefully you read the help text and know that this has
something to with multiple actions that do not trigger the global
cooldown. What it boils down to is that you can chain any number of
these actions together in one line along with at most one action that
does trigger the global cooldown and LazyScript will execute them in
sequence. For example, activate Cold Blood, use Eviscerate and provide a
cute parting message:

```	
	coldBlood-evisc-sayInSay=DIE!-ifCbKillShot
```
Here are a few more examples
```
	huntersMark-petAttack
	judge-sealCommand
	innerFocus-greaterHeal
```
Tutorial 6: Form re-use
=======================

So you've written some forms and they're starting to get a little long
and complicated. If they contain sections which are identical, you can
separate that section out into another form and use includeForm to
include it in the other forms. For example:

Form "Interrupts":
```
	kick-ifTargetIsCasting-ifNotTargetIs=Stunned
	gouge-ifTargetIsCasting-ifNotInFrontAttackJustFailed-ifNotTargetIs=Stunned
	ks-ifTargetIsCasting=Greater Heal,Prayer of Healing,Healing Touch,Holy Light,Healing Wave,Chain Heal-ifNotTargetIs=Stunned
	blind-ifTargetIsCasting=Greater Heal,Prayer of Healing,Healing Touch,Holy Light,Healing Wave,Chain Heal-ifNotTargetIs=Stunned
```
Form "FrontAttack":
```
	includeForm=Interrupts
	riposte
	evisc-5cp
	ss
```
Form "BehindAttack":
```
	includeForm=Interrupts
	evisc-5cp
	bs
```
This will include the Interrupts form at the beginning of both the
FrontAttack and BehindAttack forms as if you had copy and pasted it in
there. When you change the contents of the Interrupts form, it will
automatically update the FrontAttack and BehindAttack forms to include
the new version.

Note: Be careful that you don't try to include a form into itself, or
try to include a form which includes the first form (A includes B
includes A). Those will cause a stack overflow error because they're
infinite recursion loops.

Now perhaps you have some actions that you only want to perform under
certain conditions but don't want the whole list of actions to be
checked every time you press your LazyScript button. If we look at the
previous example, we can see that ifTargetIsCasting is a criteria common
to all of the actions in the Interrupts form. Using callForm we could
rewrite the previous example like so:

Form "Interrupts":
```
	kick
	gouge-ifNotInFrontAttackJustFailed
	ks-ifTargetIsCasting=Greater Heal,Prayer of Healing,Healing Touch,Holy Light,Healing Wave,Chain Heal
	blind-ifTargetIsCasting=Greater Heal,Prayer of Healing,Healing Touch,Holy Light,Healing Wave,Chain Heal
```
Form "FrontAttack":
```
	callForm=Interrupts-ifTargetIsCasting-ifNotTargetIs=Stunned
	riposte
	evisc-5cp
	ss
```
Form "BehindAttack":
```
	callForm=Interrupts-ifTargetIsCasting-ifNotTargetIs=Stunned
	evisc-5cp
	bs
```
With these changes, when you execute FrontAttack or BehindAttack, it
will call the Interrupts form only if the target is casting and not
stunned. So if the target is not casting, it won't even check any of the
actions/criteria in the Interrupts form.
