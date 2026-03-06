-----------------------------------------------------------------------------------------
local mod_desc = [[
  Exit sentinel pillar dialog after disabling sentinels
  Replace freighter battles reward for each race, requires(!) additions in rewards table
  Keep chef talking - don't close dialog after each interaction
]]---------------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY dialog puzzle',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_DIALOG_GCALIENPUZZLETABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{--	Exit sentinel pillar dialog after disabling sentinels
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Cost', 'C_SENTINELS_OFF'},
				VALUE_CHANGE_TABLE 	= {
					{'KeepOpen',	false}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'TextAlien', 'DNT_WAR_FREIGHT_LANG_1', 'Name', 'ALL_FREIGHTER_OPT_3'},
				PRECEDING_KEY_WORDS = 'Rewards',
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'Rewards',		'FREIGHTERSAVE_W'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'TextAlien', 'DNT_EXP_FREIGHT_LANG_1', 'Name', 'ALL_FREIGHTER_OPT_3'},
				PRECEDING_KEY_WORDS = 'Rewards',
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'Rewards',		'FREIGHTERSAVE_E'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'TextAlien', 'DNT_TRA_FREIGHT_LANG_1', 'Name', 'ALL_FREIGHTER_OPT_3'},
				PRECEDING_KEY_WORDS = 'Rewards',
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'Rewards',		'FREIGHTERSAVE_T'}
				}
			},
			{--	Keep chef talking
				SPECIAL_KEY_WORDS	= {'Id', '%?CHEF_JUDGE.-', 'Rewards', 'R_CHEF_JUDGE'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'KeepOpen',	true}
				}
			}
		}
	}
}}}}
