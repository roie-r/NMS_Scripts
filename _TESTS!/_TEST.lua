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

local a = {
	{1},
	c=2,
	8
}
-- for _,x in pairs(a) do print(x) end


local function f2(n)
	for i=1, 10 do
		if n < 6 then
			n = n + 1
			print(n)
			-- break
		end
	end
end

f2(3)