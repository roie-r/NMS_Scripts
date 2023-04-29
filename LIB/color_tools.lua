---------------------------------------------------------------------
--	rgb color calculation and coverntion
---------------------------------------------------------------------

function Hex2Prc(h)
	-- translates a 0xFF hex string to 0-1.0 percentage
	-- math.floor(X / 255 * 1000) / 1000 == X * 0.00392
	return tonumber(h, 16) * 0.00392
end

function ColorFromHex(hex)
	local rgb = {{'R', 1}, {'G', 1}, {'B', 1}, {'A', 1}}
	for i=1, (hex:len()/2) do
		rgb[i][2] = Hex2Prc(hex:sub(i*2-1, i*2))
	end
	return rgb
end

--	return a color table from 3-number table or hex
--	n=class name, c=hex color (overwrites the rgb)
--	* requires lua_2_exml !!
function ColorData(t, n)
	t = t  or {}
	if t.c then
		for i=1, (t.c:len()/2) do
			t[i] = Hex2Prc(t.c:sub(i*2-1, i*2))
		end
	end
	return {
		-- if a name (n) is present then use 2-property tag
		META= {n or 'value', 'Colour.xml'},
		R	= t[1] or 1,
		G	= t[2] or 1,
		B	= t[3] or 1,
		A	= t[4] or 1
	}
end
