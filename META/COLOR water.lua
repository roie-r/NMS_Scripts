---------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/~LIB/lua_2_exml.lua')
---------------------------------------------------------------------
mod_desc = [[
  Add more water color choices
  math.floor(X / 255 * 1000) / 1000 == X * 0.00392
]]--------------------------------------------------

local water_colors = {
---	earth blue
	'3C5777FF',
	'51749EFF',
	'141D28FF',
	'5C6BF2FF',
	'DAE4EA33',
---	burnt orange
	'8C6439FF',
	'C99063FF',
	'45230EFF',
	'C27547FF',
	'C7E19CFF',
---	young red ?
	'985151FF',
	'B87E7EFF',
	'4C1C1CFF',
	'A83838FF',
	'7AD5EEFF',
---	green jade
	'2B695FFF',
	'499585FF',
	'093634FF',
	'6BE69EFF',
	'B9E7D6FF',
---	royal blue
	'1A3E58FF',
	'1D5C79FF',
	'03295DFF',
	'2E526BFF',
	'C0CBEA4D',
---	orange-yellow
	'AA9C6FFF',
	'B7AB7EFF',
	'302503FF',
	'6D5A1DFF',
	'E8E2D0FF',
---	orange-yellow (-)
	'9E885FFF',
	'AB936DFF',
	'232006FF',
	'69632EFF',
	'D6DDB7FF',
---	pale blue-green
	'5A94A8FF',
	'6BAABFFF',
	'0E304AFF',
	'1E546DFF',
	'BDEDFCFF',
---	turquose green
	'1F8475FF',
	'257584FF',
	'183323FF',
	'294729FF',
	'C3FFC7FF',
---	mid blue
	'385A68FF',
	'446C7CFF',
	'1B2A30FF',
	'3B8E49FF',
	'87AFBFFF',
---	swamp green
	'3D4C3DFF',
	'3E563FFF',
	'202D53FF',
	'7B5119FF',
	'DBC6ADFF',
---	swamp mid green
	'336660FF',
	'3B776AFF',
	'03355DFF',
	'1F613CFF',
	'DAE4EA66',
---	brown-red
	'5A4633FF',
	'775D44FF',
	'093634FF',
	'3B8A6BFF',
	'B9E7D6FF',
}

local function GcWaterColourSetting(colors_list)
	local function hex2rgb(hex)
		local n = {}
		for i=1, (hex:len()/2) do
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
	local rgbx = {}
	for i=0, (#colors_list - 1) do
		local b5 = i % 5 + 1
		local c = Convert2Rgba(colors_list[i + 1])
		-- add the color class's name to the rgb table
		rgbx[#rgbx+1] = ColorData(c, props[b5])
		if b5 == 5 then
			rgbx.META = {'value', 'GcPlanetWaterColourData.xml'}
			T[#T+1] = rgbx
			rgbx = {}
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
	NMS_VERSION			= '4.08',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS',
	ADD_FILES			= {
		{
			FILE_CONTENT		= GcWaterColourSetting(water_colors),
			FILE_DESTINATION	= 'METADATA/SIMULATION/SOLARSYSTEM/COLOURS/WATERCOLOURS.EXML'
		}
	}
}
