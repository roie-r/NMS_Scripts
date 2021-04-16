--[[┎───────────────────────────────────────────────
	┃    	ALWAYS EXCLUDED FROM BATCH
	┠──────────────────────────────────────────
	┃ shorter wait for bioship mission
────┸───────────────────────────────────────────--]]
multiplier = 0.1

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META shorter wait for bioship mission.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.37',
	MOD_DESCRIPTION		= 'shorter wait for bioship mission',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\SIMULATION\MISSIONS\SPACEPOIMISSIONTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Message', 'UI_BIO_SHIP_MISSION1_MSG3'},
				VALUE_CHANGE_TABLE 	= {
					{'Time',		multiplier},
					{'Randomness',	multiplier * 3}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Message', 'UI_BIO_SHIP_MISSION2_MSG3'},
				VALUE_CHANGE_TABLE 	= {
					{'Time',		multiplier},
					{'Randomness',	multiplier * 3}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Message', 'UI_BIO_SHIP_MISSION3_MSG3'},
				VALUE_CHANGE_TABLE 	= {
					{'Time',		multiplier},
					{'Randomness',	multiplier * 3}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Message', 'UI_BIO_SHIP_MISSION4_MSG3'},
				VALUE_CHANGE_TABLE 	= {
					{'Time',		multiplier},
					{'Randomness',	multiplier * 3}
				}
			}
		}
	}
}}}}
