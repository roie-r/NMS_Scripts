---------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
---------------------------------------------------------------------
mod_desc = [[
  Add more water color choices
  math.floor(X / 255 * 1000) / 1000 == X * 0.00392
]]--------------------------------------------------

local water_colors = {
---	earth blue
	'3c5777ff',
	'51749eff',
	'141d28ff',
	'5c6bf2ff',
	'dae4ea33',
---	burnt orange
	'8c6439ff',
	'c99063ff',
	'45230eff',
	'c27547ff',
	'c7e19cff',
---	young red ?
	'985151ff',
	'b87e7eff',
	'4c1c1cff',
	'a83838ff',
	'7ad5eeff',
---	green jade
	'2b695fff',
	'499585ff',
	'093634ff',
	'6be69eff',
	'b9e7d6ff',
---	royal blue
	'1a3e58ff',
	'1d5c79ff',
	'03295dff',
	'2e526bff',
	'c0cbea4d',
---	orange-yellow
	'aa9c6fff',
	'b7ab7eff',
	'302503ff',
	'6d5a1dff',
	'e8e2d0ff',
---	orange-yellow (-)
	'9e885fff',
	'ab936dff',
	'232006ff',
	'69632eff',
	'd6ddb7ff',
---	pale blue-green
	'5a94a8ff',
	'6baabfff',
	'0e304aff',
	'1e546dff',
	'bdedfcff',
---	turquose green
	'1f8475ff',
	'257584ff',
	'183323ff',
	'294729ff',
	'c3ffc7ff',
---	mid blue
	'385a68ff',
	'446c7cff',
	'1b2a30ff',
	'3b8e49ff',
	'87afbfff',
---	swamp green
	'3d4c3dff',
	'3e563fff',
	'202d53ff',
	'7b5119ff',
	'dbc6adff',
---	swamp mid green
	'336660ff',
	'3b776aff',
	'03355dff',
	'1f613cff',
	'dae4ea66',
---	brown-red
	'5a4633ff',
	'775d44ff',
	'093634ff',
	'3b8a6bff',
	'b9e7d6ff',
}

local function GcWaterColourSetting(colors_list)
	local function hex2rgb(hex)
		local n = {}
		for i=1, (#hex/2) do
			n[#n+1] = tonumber(hex:sub(i*2-1, i*2), 16) * 0.00392
		end
		return n
	end
	local function asc2prc(as)
		for i=1, #as do as[i] = as[i] * 0.00392 end
		return as
	end
	local function Convert2Rgba(c)
		if type(c) == 'string' then
			return hex2rgb(c)
		elseif c[1] > 1 or c[2] > 1 or c[3] > 1 then
			return asc2prc(c)
		end
		return c
	end
	local props = {
		'WaterFogColourNear',
		'WaterFogColourFar',
		'WaterColourBase',
		'WaterColourAdd',
		'FoamColour'
	}
	-- Assign the exml table with its designated meta
	local T = {META = {'name', 'Settings'}}
	local rgba = {}
	for i=0, (#colors_list - 1) do
		local b5 = i % 5 + 1
		local c = Convert2Rgba(colors_list[i + 1])
		-- add the color class's name to the rgb table
		rgba[#rgba+1] = ColorData(c, props[b5])
		if b5 == 5 then
			rgba.META = {'value', 'GcPlanetWaterColourData.xml'}
			T[#T+1] = rgba
			rgba = {}
		end
	end
	-- new mbin
	return FileWrapping(T, 'GcWaterColourSettingList')
end

-- io.open('e:/_dump/WATERCOLOURS.EXML', 'w'):write(GcWaterColourSetting(water_colors))
-- print('saved to _dump')

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '__META water colors.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS',
	ADD_FILES			= {
		{
			FILE_CONTENT		= GcWaterColourSetting(water_colors),
			FILE_DESTINATION	= 'METADATA/SIMULATION/SOLARSYSTEM/COLOURS/WATERCOLOURS.EXML'
		}
	}
}
