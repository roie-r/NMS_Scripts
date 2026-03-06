-----------------------------------
local mod_desc = [[
  rescale unlockable item tree
  (Original by Lenni)
]]---------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ UI refiner restore minmax',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'UI/REFINERPAGE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BUTTONM.-'},
				VALUE_CHANGE_TABLE	= {
					{ 'Is Hidden', false }
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BEGINGRP'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS	= 'Element Data',
				SECTION_ACTIVE		= 2,
				VALUE_CHANGE_TABLE	= {
					{'Position X', 1500.6},
					{'Width', 193}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BEGINGRP'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS	= 'Element Data',
				SECTION_ACTIVE		= 3,
				VALUE_CHANGE_TABLE	= {
					{'Position X', 1500.6}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BEGINGRP'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS	= 'Element Data',
				SECTION_ACTIVE		= {4, 5},
				VALUE_CHANGE_TABLE	= {
					{'Is Hidden', false}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BEGINGRP'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS	= 'Element Data',
				SECTION_ACTIVE		= 6,
				VALUE_CHANGE_TABLE	= {
					{'Position X', 1692.4}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BUTTONLEFT'},
				VALUE_CHANGE_TABLE	= {
					{'Position X', 1535.8},
					{'Position Y', 607.4},
					{'Width', 58},
					{'AnchorPercent', false}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BUTTONRIGHT'},
				VALUE_CHANGE_TABLE	= {
					{'Width', 58}
				}
			}
		}
	}
}}}}
