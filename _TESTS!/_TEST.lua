--[[-----------------------------------------
 snippets
-------------------------------------------]]

local rgbs = {
	-- {0.88,	0.94,	0.2},
	-- {0.74,	0.1,	0.16},
	-- {0.12,	0.1,	0.62},
	-- {0.01,	0.88,	0.1},
	-- {0.92,	0.12,	0.82},

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

for _,r in ipairs(rgbs) do
	print(rgb2hex(r))
end

str = [[
  <!-- <this is > 5k4 -->
  <my comment > e2e
  <filtering > m4m
  <!-- < pattern> 1o2 -->
]]
match1 = '()<(.-)>'
match2 = '<!%-%-[ \t\n]-<(.-)>'
match3 = '(<!%-%-)[ \t]-<(.-)>'

-- for _,s in str:gmatch(match1) do print(s) end