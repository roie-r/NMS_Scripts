
-- MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/MODULES/F1_ROOM.DESCRIPTOR.MBIN
-- MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/MODULES/ROOM_ROOF.DESCRIPTOR.MBIN

-- MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PROCRUINS.SCENE.MBIN
-- MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PROCRUINS.DESCRIPTOR.MBIN

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+  TEST 05 underground ruin fix',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/MODULES/F1_ROOM.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_FLRoof_1'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',	'FLRoof1Fix'}
				}
			},
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', '_FLRoof_2'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Name',	'FLRoof2Fix'}
				-- }
			-- },
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Stripe1_A'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',	'Stripe1Fix'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Stripe2_A'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',	'Stripe2Fix'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Stripe3_A'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',	'Stripe3Fix'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Stripe4_A'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',	'Stripe4Fix'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Square1_A'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',	'Square1Fix'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Square2_A'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',	'Square2Fix'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', '_FLRoof_2'},
					-- {'Name', '.-Square.-'},
					-- {'Name', '.-Stripe.-'},
				},
				REMOVE				= 'Section'
			},
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/MODULES/ROOM_ROOF.DESCRIPTOR.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE		= 'All',
				PRECEDING_KEY_WORDS	= 'ReferencePaths',
				REMOVE				= 'Section'
			}
		}
	}
	
}}}}
