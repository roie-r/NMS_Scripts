---------------------------------------------------------------------------------
local mod_desc = [[
  Hide elements of the lower-right notification panel and fade the text contents
]]-------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ UI fade notifications',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.24',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'UI/HUD/HUDNOTIFICATIONPANEL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'ID', '.-BACKGROUND'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Is Hidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'ICONS'},
				VALUE_CHANGE_TABLE 	= {
					{'Is Hidden',	true}
				}
			},
			-- {
				-- SPECIAL_KEY_WORDS 	= {'ID', '.-LINE'},
				-- VALUE_MATCH			= 1,
				-- SECTION_UP			= 1,
				-- VALUE_CHANGE_TABLE 	= {
					-- {'A',			0.2}
				-- }
			-- },
			{
				SPECIAL_KEY_WORDS 	= {'ID', '.-LINE'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Is Hidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'TITLE'},
					{'ID', 'BODY'}
				},
				REPLACE_TYPE 		= 'All',
				VALUE_MATCH			= 1,
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'A',			0.64}
				}
			},
		}
	}
}}}}
