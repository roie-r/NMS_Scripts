--[[-----------------------------------------
 snippets
-------------------------------------------]]

local rgbs = {
	-- {0.88,	0.94,	0.2},
	-- {0.74,	0.1,	0.16},
	-- {0.12,	0.1,	0.62},
	-- {0.01,	0.88,	0.1},
	-- {0.92,	0.12,	0.82},

	{1,	0.34,		0.455,		0.604},
	{1,	0.7,		0.863,		0.925},
	{1,	0.733,		0.878,		0.953},
	{1,	0.996,		1,			0.83},
	{1,	0.7,		0.863,		0.925},
	{1,	0.98,		0.811,		0.628},
	{1,	1,			1,			1},
	{1,	0.10196,	0.15294,	0.2},
	{1,	0.5412,		0.49804,	0.44706}
}

local function rgb2hex(c)
	local h = ''
	for i=1, #c do h = h..string.format('%02X', math.floor(c[i] * 255 + 0.5)) end
	return h
end

-- for _,r in ipairs(rgbs) do
	-- print(rgb2hex(r))
-- end

local str = [[
  <!-- <this is > 5k4 -->
  <my comment > e2e
  <filtering > m4m
  <!-- < pattern> 1o2 -->
]]
local match1 = '()<(.-)>'
local match2 = '<!%-%-[ \t\n]-<(.-)>'
local match3 = '(<!%-%-)[ \t]-<(.-)>'

-- for _,s in str:gmatch(match1) do print(s) end

local a1 = {
	tag = {n=0.95,	x=1.1,	d=1.2, c=0.7}
}
local b2 = {
	tag = {n=0.8,	f=2.0,	d=1.4}
}

-- for k1,v1 in pairs(MergeTables({a1, b2})) do
	-- print(k1..': ')
	-- for k2,v2 in pairs(v1) do
		-- print(k2, v2)
	-- end
-- end

t = {
	m = 'meta',
	a = 'first',
	b = 'second',
}

-- function tpairs(t)
-- 	local k,_ = next(t)
-- 	if k ~= 'm' then
-- 		tm = next, t, nil
-- 	else
-- 		return next, t, 'a'
-- 	end
-- end

-- for k, v in tpairs(t) do print(k, v) end
