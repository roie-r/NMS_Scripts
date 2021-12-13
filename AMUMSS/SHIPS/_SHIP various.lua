---------------------------------------------------------------
local desc = [[
  - dropship: subwing_F dim lights; left subwing_F decal fix;
   subwing_E delete big decal; delete hull decals
  fighter cockpit F decals fix; cockpit B delete decal
  - Scientific cockpitA re-center trails
   fix decals placement on cockpitA back and fins
  change hot green trail to blue dark
  No foggy headlights cone on cockpits
  bioship delete slime
]]-------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__SHIP various.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.75,
	MOD_BATCHNAME		= '_SHIPS ~@~collection.pak',
	MOD_DESCRIPTION		= desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		-- dropship |subwing_F dim lights|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSF/SUBWINGSF_LEFT.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSF/SUBWINGSF_RIGHT.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'Glow'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0},		-- -0.05168
					{'ScaleY',		0.42}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight1', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		26000}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight2', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		26000}
				}
			}
		}
	},
	{
		-- |dropship left subwing_F decal fix|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSF/SUBWINGSF_LEFT.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Rectangle_A'},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-59.09569},
					{'RotY',		90}
				}
			}
		}
	},
	{
		-- |Scientific cockpitA re-center trails|
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
	{
		-- |Scientific cockpitA back decals| fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/BACK/COCKPITABACKB.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo1_A'},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		-90},
					{'TransY',		3.26},	-- 2.655958
					{'TransZ',		-4.72},	-- -3.727964
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo2_A'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		3.26},	-- 2.655958
					{'TransZ',		-4.72},	-- -3.727964
				}
			}
		}
	},
	{
		-- |Scientific cockpitA back fins decals| fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGILEFT.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo1_A1'},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-90},	-- 90
					{'RotY',		-90},
					{'TransX',		1.1},	-- 0.972093
					{'ScaleX', 		0.562464},
					{'ScaleY', 		0.562464}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo2_A2'},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-90},	-- 90
					{'RotY',		-90},
					{'TransX',		1.1},	-- 0.972093
					{'ScaleX', 		0.562464},
					{'ScaleY', 		0.562464}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGIRIGHT.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo1_A1'},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		-90}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo2_A2'},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		-90}
				}
			}
		}
	},
	{
		-- change hot |green trail to blue dark|
		MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/TRAILS/SPACECRAFT/HOT/HOTGREENTRAIL.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/EFFECTS/TRAILS/HOT/BLUEDARK.DDS'}
				}
			}
		}
	},
	{
		-- |delete contrails|
		MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/TRAILS/SPACECRAFT/CONTRAIL/CONTRAILTRAIL.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				REMOVE				= 'SECTION'
			}
		}
	},
	{
		-- |no foggy headlights| cone from cockpits
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/DROPSHIPS/COCKPIT/COCKPITA.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/DROPSHIPS/COCKPIT/COCKPITB.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/ACCESSORIES/LAMP.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYA.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYB.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				REMOVE				= 'SECTION'
			}
		}
	},
	{
		-- |no cockpit orange fake-light| cone
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E/HQWHITELIGHT_MAT1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_B/COCKPITB/HQWHITELIGHT_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEC/COCKPITANOSEC/HQWHITELIGHT_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEE/COCKPITANOSEE/HQWHITELIGHT_MAT1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/ACCESSORIES/LANDINGGEAR_BASE/HQWHITELIGHT_MAT3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYA/HQWHITELIGHT_MAT3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYB/HQWHITELIGHT_MAT2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITACCESSORIES/COCKPITACC_F/HQWHITELIGHT_MAT2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITACCESSORIES/COCKPITACC_E/HQWHITELIGHT_MAT3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITBDOUBLECYLINDER/HQWHITELIGHT_MAT5.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITBSINGLECYLINDER/HQWHITELIGHT_MAT2.MATERIAL.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', ''}
				}
			}
		}
	},
	{
		-- |dropship delete hull decals|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/DROPSHIPS/HULL/HULLA.DESCRIPTOR.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'TypeId', '_SIDEL_'},
				REMOVE				= 'SECTION'
			}
		}
	},
	{
		-- |dropship subwing_E delete big decal|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSE/SUBWINGSE_LEFT.DESCRIPTOR.MBIN',
			'MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSE/SUBWINGSE_RIGHT.DESCRIPTOR.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', '_DECAL_A'},
				REMOVE				= 'SECTION'
			}
		}
	},
	{
		-- |bioship no slime|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC/MEMBRANE_MAT.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'SECTION'
			}
		}
	}
}}}}
