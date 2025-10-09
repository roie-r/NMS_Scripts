-------------------------------------------------
-- stuff?
-------------------------------------------------

local rgbs = {

	-- {1, 0.301684, 0.444985, 0.447955},
	-- {1, 0.323133, 0.391086, 0.522305},

	{1, 0.117647059, 0.541176498, 0.258823544},
	{1, 0.129411772, 0.466666669, 0.784313738},
	{1, 0.301960796, 0.160784319, 0.34117648},
	{1, 0.952941179, 0.662745118, 0.137254909},

}

local function rgb2hex(c)
	local h = ''
	for i=1, #c do h = h..string.format('%02X', math.floor(c[i] * 255 + 0.5)) end
	return h
end

-- for i,r in ipairs(rgbs) do
	-- if (i-1) % 5 == 0 then print('\n') end
	-- print(rgb2hex(r))
-- end

-- local str = [[
  -- <!-- <this is > 5k4 -->
  -- <my comment > e2e
  -- <filtering > m4m
  -- <!-- < pattern> 1o2 -->
-- ]]
-- local match1 = '()<(.-)>'
-- local match2 = '<!%-%-[ \t\n]-<(.-)>'
-- local match3 = '(<!%-%-)[ \t]-<(.-)>'

local src = {
	e={i=5, dat='REC_20'},
	v={i=4, dat='REC_24'},
	g={i=3, dat='REC_23'},
	f={i=2, dat='REC_22'},
	r={i=1, dat='REC_21'},
}
