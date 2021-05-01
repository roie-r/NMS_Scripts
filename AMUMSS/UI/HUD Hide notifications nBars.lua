--[[┎────────────────────────────────────────────────────────────────────────────────
	┃ Hide elements of the lower-right notification panel and fade the text contents
	┃ Hide cinematic black bars
────┸────────────────────────────────────────────────────────────────────────────--]]
Text_Alpha = 0.65

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__UI hide notifications & bars.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.38',
	MOD_BATCHNAME		= '_UI ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'UI\HUD\HUDNOTIFICATIONPANEL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'TITLEBACKGROUND'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BACKGROUND'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'ICONS'},
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'ID', 'TITLE'},
				SECTION_UP			= 1,
				PRECEDING_KEY_WORDS	= {'Style'},
				VALUE_CHANGE_TABLE 	= {
					{'A',	Text_Alpha}
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'ID', 'BODY'},
				SECTION_UP			= 1,
				PRECEDING_KEY_WORDS	= {'Style'},
				VALUE_CHANGE_TABLE 	= {
					{'A',	Text_Alpha}
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'ID', 'HEADERLINE'},
				SECTION_UP			= 1,
				PRECEDING_KEY_WORDS	= {'Style'},
				VALUE_CHANGE_TABLE 	= {
					{'A',	Text_Alpha - 0.1}
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'ID', 'BASELINE'},
				SECTION_UP			= 1,
				PRECEDING_KEY_WORDS	= {'Style'},
				VALUE_CHANGE_TABLE 	= {
					{'A',	Text_Alpha - 0.1}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			'UI\HUD\HUDBARS.MBIN', 'UI\COMPONENTS\INTERACTION\CINEMATICBARS.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			}
		}
	}
}}}}
