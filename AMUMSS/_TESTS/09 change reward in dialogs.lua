--[[┎──────────────────────────────────────────────────────
	┃ change rewards in dialog options
────┸──────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 09 change rewards in dialogs.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.42',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\NMS_DIALOG_GCALIENPUZZLETABLE.MBIN',
		EXML_CHANGE_TABLE	= { 
			{
				-- insert the test reward into the construction recipe analyser 'Cancel' menu option
				SPECIAL_KEY_WORDS	= {'Id', '?BLUEPRINT_ANALYSER', 'Name', 'ALL_REQUEST_LEAVE'},
				PRECEDING_KEY_WORDS	= 'Rewards',
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'TEST_REWARD_09'}
				}
			},
			{
				VALUE_MATCH			= 'FREIGHTERLOOT',
				SPECIAL_KEY_WORDS	= {'Id', '?FREIGHTER', 'AlienRace', 'Warriors'},
				SECTION_UP			= 1,
				-- PRECEDING_KEY_WORDS	= 'Options',
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'FREIGHTERLOOT_W'}
				}
			},
			{
				VALUE_MATCH			= 'FREIGHTERLOOT',
				SPECIAL_KEY_WORDS	= {'Id', '?FREIGHTER', 'AlienRace', 'Explorers'},
				SECTION_UP			= 1,
				-- PRECEDING_KEY_WORDS	= 'Options',
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'FREIGHTERLOOT_E'}
				}
			},
			{
				VALUE_MATCH			= 'FREIGHTERLOOT',
				SPECIAL_KEY_WORDS	= {'Id', '?FREIGHTER', 'AlienRace', 'Traders'},
				SECTION_UP			= 1,
				-- PRECEDING_KEY_WORDS	= 'Options',
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'FREIGHTERLOOT_T'}
				}
			}
		}
	}
}}}}
