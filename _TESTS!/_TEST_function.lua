--[[-----------------------------------------
 random functions
-------------------------------------------]]

local rgbs = {
	{0.34,		0.455,		0.604},
	{0.7,		0.863,		0.925},
	{0.733,		0.878,		0.953},
	{0.996,		1,			0.83},
	{0.7,		0.863,		0.925},
	{0.98,		0.811,		0.628},
	{1,			1,			1},
	{0.10196,	0.15294,	0.2},
	{0.5411765,	0.49803922,	0.44705883}

}

function rgb2hex(c)
	local h = ''
	for i=1, #c do h = h..string.format('%02X', math.floor(c[i] * 255 + 0.5)) end
	return h
end

for _,r in ipairs(rgbs) do print(rgb2hex(r)) end

function hex2rgb2(hex)
	local function trunc(x, n)
		return tonumber(string.format('%.'..(n or 0)..'f', x))
	end
	local n = {}
	for i=1, hex:len()-1, 2 do
		table.insert(n, trunc(tonumber(hex:sub(i, i+1), 16) / 255, 3))
	end
	return n[1], n[2], n[3], (n[4] or 1)
	-- return n
end

function Adjacency(sc)
	local function Adj(a, b)
		return (a[1] == b[1] and math.abs(a[2] - b[2]) <= 1) or (a[2] == b[2] and math.abs(a[1] - b[1]) <= 1)
	end
	local count = 0
	for i=1, (#sc-1) do
		for j=i+1, #sc do
			count = count + (Adj(sc[i], sc[j]) and 1 or 0)
		end
	end
	return count >= 3 -- 4 is FULL adjacency
end

local function InsertHexColor(hex)
	local rgb = {{'R', 1}, {'G', 1}, {'B', 1}, {'A', 1}}
	for i=1, (hex:len()/2) do
		rgb[i][2] = tonumber(hex:sub(i*2-1, i*2), 16) / 255
	end
	return rgb
end

local function Hex2Pr(h, dec)
	dec = dec or 3
	return (math.floor(tonumber(h, 16) / 255) * 10^dec) / 10^dec
end

function JenkinsHash(input)
	local hash = 0
	local t_chars = {string.byte(input:upper(), 1, #input)}

	for i = 1, #input do
		hash = (hash + t_chars[i]) & 0xffffffff
		hash = (hash + (hash << 10)) & 0xffffffff
		hash = (hash ~ (hash >> 6)) & 0xffffffff
	end
	hash = (hash + (hash << 3)) & 0xffffffff
	hash = (hash ~ (hash >> 11)) & 0xffffffff
	hash = (hash + (hash << 15)) & 0xffffffff
	return tostring(hash)
end

function _add(val) return '@'..(val >= 0 and '+'..val or val) end
function _add(val) return '@'..(val >= 0 and '+' or '-')..math.abs(val) end

function _mul(val) return '@*'..val end
-- function _mul(val) return '@*'..(val >= 0 and val or math.abs(1/val)) end
-- no solution for multiplying a negative!!

print(JenkinsHash('CROSSING1'))