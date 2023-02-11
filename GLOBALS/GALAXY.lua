------------------------------------------------------
mod_desc = [[
  Change solar system to faster moving & more varied
  Restore galaxy map black hole icon to the original
]]----------------------------------------------------

local function ColorFromHex(hex)
	local rgb = {{'R', 1}, {'G', 1}, {'B', 1}, {'A', 1}}
	for i=1, (hex:len()/2) do
		rgb[i][2] = tonumber(hex:sub(i*2-1, i*2), 16) * 0.00392
	end
	return rgb
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__GC GALAXY.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.08',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'GCGALAXYGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				VALUE_CHANGE_TABLE 	= {
					{'FinalTransitionMaxSpeed',	50},	-- 350
				}
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = {'SolarSystemParameters', 'PlanetParameters'},
				VALUE_CHANGE_TABLE 	= {
					{'FirstOrbitRadiusMin',		20},	-- 120
					{'FirstOrbitRadiusMax',		40},	-- 160
					{'OrbitRadiusOffsetMin',	12},	-- 50
					{'OrbitRadiusOffsetMax',	10},	-- 70
					{'OrbitRotationSpeedMin',	2},		-- 1
					{'OrbitRotationSpeedMax',	5.5},	-- 2.5
					{'OrbitLineWidth',			0.05}	-- 0.5
				}
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = {'SolarSystemParameters', 'MoonParameters'},
				VALUE_CHANGE_TABLE 	= {
					{'FirstOrbitRadiusMin',		-2},	-- 15
					{'FirstOrbitRadiusMax',		2},		-- 20
					{'OrbitRadiusOffsetMin',	-2},	-- 15
					{'OrbitRadiusOffsetMax',	1},		-- 35
					{'OrbitRotationSpeedMin',	1},		-- 2
					{'OrbitRotationSpeedMax',	2},		-- 5
					{'OrbitLineWidth',			0.05}	-- 0.3
				}
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Yellow'},
				VALUE_CHANGE_TABLE	= ColorFromHex('fac9054d')
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Green'},
				VALUE_CHANGE_TABLE	= ColorFromHex('25bd0380')
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Blue'},
				VALUE_CHANGE_TABLE	= ColorFromHex('1852f580')
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Red'},
				VALUE_CHANGE_TABLE	= ColorFromHex('fc293380')
			}
		}
	}
}}}}
