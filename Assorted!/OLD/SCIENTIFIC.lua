---------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
---------------------------------------------------
local mod_desc = [[
  cockpitA re-center trails.
  docking fix
  cockpitA move guns below body to match interior
  cockpitD guns placed on body (instead of joint)
  Decals placement tweaks.
  No foggy headlights cone on cockpits
]]-------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ SHIP scientific',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '5.5+',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|sci interior light|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/INTERIORS/CANOPYA_INTERIOR.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= AddLightNodes({name='Light08', i=7000, ty=-0.6, tz=1.5, c='FF98A6F2'})
			}
		}
	},
	{--	|wingA_L add trail|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSA/WINGSA_LEFT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'WingALeft'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= AddSceneNodes({name='Trail', ntype='LOCATOR', form={8.55, 0, -0.458, 0, 180}})
			}
		}
	},
	{--	|wingA_R add trail|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSA/WINGSA_RIGHT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'WingALeft'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= AddSceneNodes({name='Trail', ntype='LOCATOR', form={-8.55, 0, -0.4, 0, 180}})
			}
		}
	},
	{--	|Scientific cockpitD re-alignments|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITD/COCKPITD.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref[34]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-0.9},
					{'TransY',		2.5},
					{'TransZ',		-0.6},
					{'RotZ',		-90},
					{'ScaleX', 		0.8},
					{'ScaleY', 		0.8},
					{'ScaleZ', 		0.8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref4'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.9},
					{'RotZ',		90}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'Trail.-'},
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
	{--	|Scientific cockpitA alignments|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/COCKPITA.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref[12]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-0.32},
					{'TransY',		0.952},
					{'TransZ',		-0.48},
					{'RotZ',		-18},
					{'ScaleX', 		0.7},
					{'ScaleY', 		0.7},
					{'ScaleZ', 		0.7}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref2'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.32},
					{'RotZ',		18}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Trail'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		1.055},
					{'TransY',		1.5},
					{'RotX',		0}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Trail1'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-1.055},
					{'TransY',		1.5},
					{'RotX',		0}
				}
			},
			-- {
				-- SPECIAL_KEY_WORDS	= {
					-- {'Name', 'Trail'},
					-- {'Name', 'Trail1'}
				-- },
				-- REMOVE				= 'Section'
			-- },
			-- {
			-- 	SPECIAL_KEY_WORDS	= {'Name', 'Cockpit_AData'},
			-- 	PRECEDING_KEY_WORDS	= 'Children',
			-- 	ADD					= AddSceneNodes({
			-- 		name='Trailm', ntype='LOCATOR',
			-- 		form={ty=3.3, tz=-5.4, ry=180} }
			-- 	)
			-- }
		}
	},
	{--	|Scientific cockpitA back decals| fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/BACK/COCKPITABACKB.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', '_logo[12]_A'},
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
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo_A1'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleZ', 		0.6}
				}
			}
		}
	},
	{-- |wing_A decals| fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGILEFT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo[12]_A[12]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		1.1},
					{'RotX',		90},
					{'RotY',		90},
					{'ScaleX', 		0.56},
					{'ScaleY', 		0.56}
				}
			}
		}
	},
	{-- |wing_A decals| fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGIRIGHT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo[12]_A[12]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-1.1},
					{'RotX',		-90},
					{'RotY',		90},
					{'ScaleX', 		0.56},
					{'ScaleY', 		0.56}
				}
			}
		}
	},
	{--	|no foggy headlights| cone from cockpits
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/ACCESSORIES/LAMP.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
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
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			0.46},
					{'Y',			0.62},
					{'Z',			0.76}
				}
			}
		}
	}
}}}}
