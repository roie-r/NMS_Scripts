------------------------------------------------------------------------------------
local mod_desc = [[
  Fix speeder LOD to match other ships (same ancient thing as the fighter model)
]]----------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ SHIP speeder',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/VRSPEEDER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS 	= {'Name', 'Number[24]_A[34]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ', 		0.02}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST1'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		180}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST2'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		360}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST3'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		480}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'REFLamp_[34]'}
				},
				REMOVE = 'Section'
			}
		}
	}
}}}}
