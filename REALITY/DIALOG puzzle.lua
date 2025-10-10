-----------------------------------------------------------------------------------------
local mod_desc = [[
  Replace freighter battles reward for each race, requires(!) additions in rewards table
  Keep chef talking - don't close dialog after each interaction
]]---------------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY dialog puzzle',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_DIALOG_GCALIENPUZZLETABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', '%?FREIGHTER', 'AlienRace', 'Warriors'},
				SECTION_UP			= 1,
				WHERE_IN_SUBSECTION	= { {'Rewards', 'FREIGHTER_SAVED'} },
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'Rewards',		'FREIGHTERSAVE_W'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', '%?FREIGHTER', 'AlienRace', 'Explorers'},
				SECTION_UP			= 1,
				WHERE_IN_SUBSECTION	= { {'Rewards', 'FREIGHTER_SAVED'} },
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'Rewards',		'FREIGHTERSAVE_E'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', '%?FREIGHTER', 'AlienRace', 'Traders'},
				SECTION_UP			= 1,
				WHERE_IN_SUBSECTION	= { {'Rewards', 'FREIGHTER_SAVED'} },
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'Rewards',		'FREIGHTERSAVE_T'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', '%?CHEF_JUDGE.-', 'Rewards', 'R_CHEF_JUDGE'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'KeepOpen',	true}
				}
			}
		}
	}
}}}}
