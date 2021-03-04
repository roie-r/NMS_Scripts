--[[┎────────────────────────────────────────
	┃ Reduce freighter warp explosion effect
────┸────────────────────────────────────--]]
SCALE_MULT = 0.4

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META reduce freighter warp boom.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_META ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\EFFECTS\EXPLOSIONTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Id', 'WARP_FRT_ATMOS'},
				VALUE_CHANGE_TABLE 	= {
					{'Scale',		SCALE_MULT}
				}
			},
			{
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Id', 'WARP_FRT'},
				VALUE_CHANGE_TABLE 	= {
					{'Scale',		SCALE_MULT}
				}
			},
			{
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Id', 'WARP_FRG'},
				VALUE_CHANGE_TABLE 	= {
					{'Scale',		SCALE_MULT}
				}
			},
			{
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Id', 'WARP_START'},
				VALUE_CHANGE_TABLE 	= {
					{'Scale',		SCALE_MULT}
				}
			},
			{
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Id', 'WARP_START_FRGT'},
				VALUE_CHANGE_TABLE 	= {
					{'Scale',		SCALE_MULT}
				}
			},
			{
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Id', 'WARP_ARRIVE'},
				VALUE_CHANGE_TABLE 	= {
					{'Scale',		SCALE_MULT}
				}
			}
		}
	}
}}}}
