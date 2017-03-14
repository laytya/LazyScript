lazyScript.metadata:updateRevisionFromKeyword("$Revision: 681 $")

-- Auto-attack support

-- Thanks to FeralSkills for the idea on how to do this
function lazyScript.IsAutoAttacking()
	if (not lazyScript.attackSlot) then
		for i = 1, 120 do
			if (IsAttackAction(i)) then
				lazyScript.attackSlot = i
				break
			end
		end
	end
	if (not lazyScript.attackSlot) then
		lazyScript.p(COULDNT_FIND_ATTACK)
		return false
	end
	return (IsCurrentAction(lazyScript.attackSlot) == 1)
end

function lazyScript.StartAutoAttack()
	if (not lazyScript.IsAutoAttacking()) then
		lazyScript.d(INITIATING_AUTO_ATTACK)
		AttackTarget()
	end
end

function lazyScript.StopAutoAttack()
	if (lazyScript.IsAutoAttacking()) then
		AttackTarget()
	end
end


-- For ranged attacks that change their texture based on equipped weapon
function lazyScript.GetRangedWeaponTexture()
	local slotId, _ = GetInventorySlotInfo("RangedSlot")
	return GetInventoryItemTexture("player",slotId)
end


-- For AutoShoot
function lazyScript.IsAutoShooting(sayNothing)
	if lazyScript.GetAutoShotSlot(sayNothing) then
		return (IsAutoRepeatAction(lazyScript.autoShotSlot) == 1)
	end
	return nil
end

function lazyScript.StartAutoShot()
	if (lazyScript.IsAutoShooting() == false) then
		UseAction(lazyScript.autoShotSlot)
	end
end

function lazyScript.StopAutoShot()
	if (lazyScript.IsAutoShooting() == true) then
		UseAction(lazyScript.autoShotSlot)
	end
end

function lazyScript.ClassCanAutoShot()
	local _, class = UnitClass("player")
	if class == "HUNTER" then
		return true
	end
end

function lazyScript.GetAutoShotSlot(sayNothing)
	local texture = lazyScript.GetRangedWeaponTexture()
	if texture then
		
		if lazyScript.autoShotSlot then
			return lazyScript.autoShotSlot
		end
		
		for i = 1, 120 do
			if (not GetActionText(i)) then -- ignore any Player macros :-)
				if (not IsEquippedAction(i)) then -- ignore any equip macros :-)
					if (GetActionTexture(i) == texture) then
						lazyScript.autoShotSlot = i
						lazyScript.d(FOUND_AUTO_SHOT..i..".")
						break
					end
				end
			end
		end
		
		if (not lazyScript.autoShotSlot) then
			if (not sayNothing) then
				lazyScript.p(COULDNT_FIND_AUTO_SHOT)
			end
		end
		else
		lazyScript.autoShotSlot = nil
	end
	return lazyScript.autoShotSlot
end


-- For AutoWand
function lazyScript.IsAutoWanding(sayNothing)
	if lazyScript.GetShootSlot(sayNothing) then
		return (IsAutoRepeatAction(lazyScript.autoWandSlot) == 1)
	end
	return nil
end

function lazyScript.StartWanding()
	if (lazyScript.IsAutoWanding() == false) then
		UseAction(lazyScript.autoWandSlot)
	end
end

function lazyScript.StopWanding()
	if (lazyScript.IsAutoWanding() == true) then
		UseAction(lazyScript.autoWandSlot)
	end
end

function lazyScript.ClassCanAutoWand()
	local _, class = UnitClass("player")
	if class == "MAGE" or class == "PRIEST" or class == "WARLOCK" then
		return true
	end
end

function lazyScript.GetShootSlot(sayNothing)
	local texture = lazyScript.GetRangedWeaponTexture()
	if texture then
		
		if lazyScript.autoWandSlot then
			return lazyScript.autoWandSlot
		end
		
		for i = 1, 120 do
			if (not GetActionText(i)) then -- ignore any Player macros :-)
				if (not IsEquippedAction(i)) then -- ignore any equip macros :-)
					if (GetActionTexture(i) == texture) then
						lazyScript.autoWandSlot = i
						lazyScript.d(FOUND_SHOOT_WAND..i..".")
						break
					end
				end
			end
		end
		
		if (not lazyScript.autoWandSlot) then
			if (not sayNothing) then
				lazyScript.p(COULDNT_FIND_SHOOT_WAND)
			end
		end
		else
		lazyScript.autoWandSlot = nil
	end
	return lazyScript.autoWandSlot
end