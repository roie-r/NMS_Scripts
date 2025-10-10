------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
------------------------------------------------------
local mod_desc = [[
  Change solar system to faster moving & more varied
  Restore galaxy map black hole icon to the original
]]----------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ GC galaxy',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.06',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'GCGALAXYGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'FinalTransitionMaxSpeed',	400},	-- 350
				}
			},
			{
				PRECEDING_KEY_WORDS = {'SolarSystemParameters', 'PlanetParameters'},
				VALUE_CHANGE_TABLE 	= {
					{'FirstOrbitRadiusMin',		140	},	-- 120
					{'FirstOrbitRadiusMax',		200	},	-- 160
					{'OrbitRadiusOffsetMin',	60	},	-- 50
					{'OrbitRadiusOffsetMax',	80	},	-- 70
					{'OrbitRotationSpeedMin',	1.5	},	-- 1
					{'OrbitRotationSpeedMax',	4	},	-- 2.5
					{'OrbitLineWidth',			0.55}	-- 0.5
				}
			},
			{
				PRECEDING_KEY_WORDS = {'SolarSystemParameters', 'MoonParameters'},
				VALUE_CHANGE_TABLE 	= {
					{'FirstOrbitRadiusMin',		13	},	-- 15
					{'FirstOrbitRadiusMax',		22	},	-- 20
					{'OrbitRadiusOffsetMin',	13	},	-- 15
					{'OrbitRadiusOffsetMax',	36	},	-- 35
					{'OrbitRotationSpeedMin',	3	},	-- 2
					{'OrbitRotationSpeedMax',	7	},	-- 5
					{'OrbitLineWidth',			0.35}	-- 0.3
				}
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Yellow'},
				VALUE_CHANGE_TABLE	= Hex2VCT('60fae007')
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Green'},
				VALUE_CHANGE_TABLE	= Hex2VCT('a018bd06')
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Blue'},
				VALUE_CHANGE_TABLE	= Hex2VCT('a01f3af5')
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Red'},
				VALUE_CHANGE_TABLE	= Hex2VCT('a0fc2933')
			},
			{
				PRECEDING_KEY_WORDS = {'BaseStarDefaultColours', 'ColourByStarType', 'Purple'},
				VALUE_CHANGE_TABLE	= Hex2VCT('afa424f0')
			}
		}
	}
}}}}

-- BaseStarDefaultColours
-- 33FFCF10
-- 663EEF13
-- 664B85FF
-- 66F10B39
-- 8C903FFF

-- BaseStarProtanopiaColours
-- FFFFFC63
-- FFFE6100
-- FF785EF0
-- FFDC267F
-- B32EF00259

-- BaseStarDeuteranopiaColours
-- FFFFE410
-- FFD219A5
-- FF40B1F5
-- FF9300FD
-- B32EFCF259

-- BaseStarTritanopiaColours
-- FFFFCF10
-- FFBCCEFE
-- FF715BD6
-- FFE3157A
-- B32EF00259