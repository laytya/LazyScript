lazyScript.metadata:updateRevisionFromKeyword("$Revision: 690 $")

-- Utilities

-- this is a quik split function that allows escaping the delimiter (with \).
-- limitation: the delimiter cannot be the first character on the line.
function lazyScript.split(s, delim)
	local pieces = {}
	local init = 1
	
	-- strip off any leading delimiters
	s = string.gsub(s, "^"..delim.."+", "")
	
	delim = "[^\\]"..delim
	
	while true do
		local start, send = string.find(s, delim, init)
		if (not start) then
			break
		end
		table.insert(pieces, string.sub(s, init, start))
		init = send + 1
	end
	
	table.insert(pieces, string.sub(s, init))
	
	return pieces
end

function lazyScript.SplitArgs(line)
	return lazyScript.split(line, "%s")
end

function lazyScript.filterArgs(line)
	return string.gsub(line, "_", " ")
end

-- Helper regex function.  Returns true/false if the pattern matched,
-- and sets the globals lazyScript.match1, 2, 3, 4, 5, 6  per your parenthesis matching.
function lazyScript.re(text, re)
	local starts, ends
	starts, ends, lazyScript.match1, lazyScript.match2, lazyScript.match3, lazyScript.match4, lazyScript.match5, lazyScript.match6 = string.find(text, re)
	return starts
end

function lazyScript.rebit(bit, re)
	if bit == nil or re == nil or bit == "" then
		return false
	end
	--bit = lazyScript.relax(bit)
	--re = string.lower(re)
	local starts, ends
	starts, ends, lazyScript.match1, lazyScript.match2, lazyScript.match3, lazyScript.match4, lazyScript.match5, lazyScript.match6 = lazyScript.efind(bit, re)
	return starts
end


function lazyScript.relax(text)
	--[[
		local equals = string.find(text, "=")
		if (equals ~= nil and equals > 1) then
		local starts, ends, left, right
		starts, ends, left, right = string.find(text, "(.+=.+)(=.+)")
		if (starts == nil) then
		starts, ends, left, right = string.find(text, "(.+)(=.+)")
		end
		
		text = string.gsub(string.lower(left), " ", "")..right
		else
		text = string.gsub(string.lower(text), " ", "")
		end
	--]]
	return text
end


function lazyScript.chat(msg, r, g, b)
	if (not r) then
		r = .9
		g = .6
		b = .05
	end
	DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b)
end

function lazyScript.p(msg)
	lazyScript.chat("## "..lazyScript.metadata.name..": "..msg)
	lazyScript.trace(msg)
end

function lazyScript.d(msg)
	if (lazyScript.perPlayerConf ~= nil and lazyScript.perPlayerConf.debug) then
		lazyScript.chat("### "..lazyScript.metadata.name..": "..msg, .8, .5, 0)
	end
	lazyScript.trace(msg)
end

function lazyScript.echo(msg)
	lazyScript.chat("# "..lazyScript.metadata.name..": "..msg, .8, .8, 0)
	lazyScript.trace(msg)
end

-- provide optional Tracer module support, for debugging problems
function lazyScript.trace(msg)
	if (tracer) then
		tracer.Log(lazyScript.metadata.name, msg)
	end
end

function lazyScript.safeString(str)
	if (str == nil) then
		str = "nil"
		elseif str == false then
		str = "false"
		elseif str == true then
		str = "true"
	end
	return str
end

function lazyScript.IdAndNameFromLink(link)
	local name
	if (not link) then
		return ""
	end
	for id, name in string.gfind(link, "|c%x+|Hitem:(%d+):%d+:%d+:%d+|h%[(.-)%]|h|r$") do
		return tonumber(id), name
	end
	return nil
end

function lazyScript.efind_addRawToExpansions(expansions, raw)
	if table.getn(expansions) == 0 then
		table.insert(expansions, raw)
		return expansions
	end
	
	for i, exp in ipairs(expansions) do
		expansions[i] = exp..raw
	end
	
	return expansions
end

function lazyScript.efind_addAlternatesToExpansions(expansions, alternates, leadup)
	local newExpansions = {}
	
	if table.getn(expansions) == 0 then
		for _, alt in ipairs(alternates) do
			table.insert(newExpansions, leadup.."("..alt..")")
		end
		return newExpansions
	end
	
	for _, exp in ipairs(expansions) do
		for _, alt in ipairs(alternates) do
			table.insert(newExpansions, exp..leadup.."("..alt..")")
		end
	end
	
	return newExpansions
end

function lazyScript.efind(text, pattern)
	local pos = 1
	local expansions = {}
	
	while pos <= string.len(pattern) do
		local a, b = string.find(pattern, "%(.-%)%??", pos)
		if a then
			local group = string.sub(pattern, a, b)
			local leadup = string.sub(pattern, pos, a-1)
			local optional = string.sub(group, -1) == "?"
			
			if optional then
				group = string.sub(group, 2, -3)
				else
				group = string.sub(group, 2, -2)
			end
			
			local alternates = {}
			
			if string.find(group, "|") then
				for alt in string.gfind(group, "[^|]+") do
					table.insert(alternates, alt)
				end
				else
				table.insert(alternates, group)
			end
			
			if optional then
				table.insert(alternates, "")
			end
			
			if table.getn(alternates) > 1 then
				expansions = lazyScript.efind_addAlternatesToExpansions(expansions, alternates, leadup)
				else
				expansions = lazyScript.efind_addRawToExpansions(expansions, leadup.."("..group..")")
			end
			
			pos = b+1
			else
			lazyScript.efind_addRawToExpansions(expansions, string.sub(pattern, pos))
			break
		end
	end
	
	for i, exp in ipairs(expansions) do
		--print("Expansion: "..i.."="..exp)
		local s, e, m1, m2, m3, m4, m5, m6 = string.find(text, exp)
		if s then
			if type(m1) == "number" then m1 = "" end
			if type(m2) == "number" then m2 = "" end
			if type(m3) == "number" then m3 = "" end
			if type(m4) == "number" then m4 = "" end
			if type(m5) == "number" then m5 = "" end
			if type(m6) == "number" then m6 = "" end
			return s, e, m1, m2, m3, m4, m5, m6
		end
	end
	
	return nil
end

function lazyScript.ListBuffs()
	for id=0,31 do
		local index = GetPlayerBuff(id, "HELPFUL")
		local texture = GetPlayerBuffTexture(index)
		if texture == nil then
			break
		end
		lazyScript.p("Helpful Buff #"..id.." ("..index..") = "..texture)
	end
	
	for id=0,31 do
		local index = GetPlayerBuff(id, "HARMFUL")
		local texture = GetPlayerBuffTexture(index)
		if texture == nil then
			break
		end
		lazyScript.p("Harmful Buff #"..id.." ("..index..") = "..texture)
	end
end

function lazyScript.FindMultiTextureSpells()
	local lastSpellName = nil
	local lastTexture = nil
	local multiTextureSpells = {}
	for spellIndex = 1, 1000 do
		local spellName = GetSpellName(spellIndex,"spell")
		if (not spellName) then
			break
		end
		local texture = GetSpellTexture(spellIndex,"spell")
		if (spellName == lastSpellName and texture ~= lastTexture) then
			if not multiTextureSpells[spellName] then
				multiTextureSpells[spellName] = {}
			end
			multiTextureSpells[spellName][texture] = true
			multiTextureSpells[spellName][lastTexture] = true
		end
		lastSpellName = spellName
		lastTexture = texture
	end
	
	for spellName, textures in pairs(multiTextureSpells) do
		local textureNames
		for texture, _ in pairs(textures) do
			local textureName = string.sub(texture, 17)
			if not textureNames then
				textureNames = textureName
				else
				textureNames = textureNames..", "..textureName
			end
		end
		lazyScript.p(SPELL..spellName)
		lazyScript.p(TEXTURES..textureNames)
	end
end