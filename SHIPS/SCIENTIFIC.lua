-------------------------------------------
mod_desc = [[
  Scientific cockpitA re-center trails.
  Decals placement tweaks.
  No foggy headlights cone on cockpits
]]-----------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__SHIP scientific.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.44',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|Scientific cockpitD re-align trails|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITD/COCKPITD.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'Trail'},
					{'Name', 'Trail1'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		1.8692},	-- 2.069246
					{'TransZ',		-2.019},	-- -2.51901
					{'RotX',		0}			-- 30.782648
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Number_A1'},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-38.173},
					{'RotY',		0}
				}
			}
		}
	},
	{--	|Scientific cockpitA re-center trails|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/COCKPITA.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Trail'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		1.055}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Trail1'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-1.055}
				}
			}
		}
	},
	{--	|Scientific cockpitA back decals| fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/BACK/COCKPITABACKB.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', '_logo1_A'},
					{'Name', '_logo2_A'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		3.26},	-- 2.65596
					{'TransZ',		-4.72},	-- -3.72796
				}
			}
		}
	},
	{--	|Scientific subwing_E logo| fix
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSE/SUBWINGE_L.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSE/SUBWINGE_R.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo_A1'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleZ', 		0.6}
				}
			}
		}
	},
	{--	|Scientific tail wings decals| fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGILEFT.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', '_logo1_A1'},
					{'Name', '_logo2_A2'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-90},	-- 90
					{'RotY',		-90},	-- 0
					{'TransX',		1.1},	-- 0.9721
					{'ScaleX', 		0.56},
					{'ScaleY', 		0.56}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGIRIGHT.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', '_logo1_A1'},
					{'Name', '_logo2_A2'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		-90},
					{'ScaleX', 		0.56},
					{'ScaleY', 		0.56}
				}
			}
		}
	},
	{--	|no foggy headlights| cone from cockpits
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/ACCESSORIES/LAMP.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|glow parts bluewhite| glow
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGILEFT/SUBMARINEPRES_LIGHTS_TEST3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGIRIGHT/SUBMARINEPRES2_LIGHTS_TEST3.MATERIAL.MBIN',

		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE 	= {
					{'x',			0.46},
					{'y',			0.62},
					{'z',			0.76}
				}
			}
		}
	}
}}}}
