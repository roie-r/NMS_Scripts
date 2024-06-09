-------------------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
dofile('LIB/scene_tools.lua')
-------------------------------------------------------------
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 11 base plank.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.72',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/TESTS/BUILDINGS/1X1X1_0.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name',	'Floor3'},
					{'Name',	'pCube10'},
					{'Name',	'pCube9'},
					{'Name',	'pCube11'},
					{'Name',	'w'},
				},
				REMOVE			= 'Section'
			},
			{
				PRECEDING_KEY_WORDS = 'Children',
				ADD 				= ToExml(
					ScNode({
						name	= 'Floor4_col',
						stype	= 'COLLISION',
						attr	= {
							{'TYPE',	'Box'},
							{'WIDTH',	5.31},
							{'HEIGHT',	0.33},
							{'DEPTH',	5.31}
						}
					})
				)
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/TESTS/BUILDINGS/1X1X1_0/LAMBERT1.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE	= {
					{'x',	0.18},
					{'y',	0.18},
					{'z',	0.18}
				}
			}
		}
	}
}}}}