-------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
-------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+  TEST 08 sentinel ship guns',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.7',
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	ship replace guns material
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', 'WeaponsLOD0',		'Name', 'MATERIAL'},
					{'Name', 'WeaponsDetLOD0',	'Name', 'MATERIAL'},
					{'Name', 'WeaponsLOD1',		'Name', 'MATERIAL'},
					{'Name', 'SUB1WeaponsLOD1',	'Name', 'MATERIAL'},
					{'Name', 'WeaponsLOD2',		'Name', 'MATERIAL'},
					{'Name', 'WeaponsLOD3',		'Name', 'MATERIAL'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Value', 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/SENTINELWEAPON.MATERIAL.MBIN'}
				}
			}
		}
	},
	{--	ship replace guns material
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/WINGSB.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
                    -- FlipWingsAaLOD1
                        -- detFWAbaLOD1
                    -- FlipWingsAaLOD2
                    -- FlipWingsAaLOD3

				SPECIAL_KEY_WORDS	= {
					{'Name', 'FlipWingsAaLOD0',	'Name', 'MATERIAL'},
					-- {'Name', 'detFWAbaLOD0',	'Name', 'MATERIAL'},
				},
				VALUE_CHANGE_TABLE 	= {
					{'Value', 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/SENTINELWEAPON.MATERIAL.MBIN'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/SENTINELSHIPMAT.MATERIAL.MBIN',
				'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/SENTINELWEAPON.MATERIAL.MBIN',
				'REMOVE'
			}
		}
	},
	{--	|sentinel gun material|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/SENTINELWEAPON.MATERIAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/ROBOTS/SENTINELSHIPGUN.DDS'}
				}
			}
		}
	},
}}}}
