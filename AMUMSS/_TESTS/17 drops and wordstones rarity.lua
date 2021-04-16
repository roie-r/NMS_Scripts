--[[┎──────────────────────────────────────────────────────────────
	┃ make random crates and wordstones much rarer
────┸──────────────────────────────────────────────────────────--]]

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 17 crate drop and wordstones rarity.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.37',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'METADATA\SIMULATION\SOLARSYSTEM\BIOMES\OBJECTS\LEVELONEOBJECTS\FULL.MBIN',
			'METADATA\SIMULATION\SOLARSYSTEM\BIOMES\OBJECTS\LEVELONEOBJECTS\FULLSAFE.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	 = {'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/DEBRISLARGE_COMMON.SCENE.MBIN'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'MaxHeight',	-1}
				}
			},
			{
				MATH_OPERATION 		= '*',
				VALUE_MATCH			= 0.02,
				VALUE_MATCH_OPTIONS = '>=',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS 	= {'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/RUINPARTS/WORDSTONE.SCENE.MBIN'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Coverage',		0.2},
					{'FlatDensity',		0.05},
					{'SlopeDensity',	0.05},
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/RUINPARTS/WORDSTONE.SCENE.MBIN'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'DestroyedByPlayerVehicle', false} -- bug fix
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATELAYOUTS.SCENE.MBIN'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'MaxHeight',	-1}
				}
			}
		}
	},
}}}}
