--[[┎──────────────────────────────────────────────────────────
	┃ Hide lower-right HUD notification popups
	┃ Hide HUD bounding black lines; Hide cinematic black bars
────┸──────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__UI hide notifications & bars.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.35',
	MOD_BATCHNAME		= '_UI ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	-- {
		-- MBIN_FILE_SOURCE	= 'UI\HUD\HUDINDICATORS.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'DataFilename', 'UI/HUD/HUDNOTIFICATIONPANEL.MBIN'},
				-- PRECEDING_KEY_WORDS = {'ElementData', 'Layout'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'IsHidden',	true}
					-- {'PositionX',	-1000},
					-- {'PositionY',	-1000},
					-- {'Width',		0},
					-- {'Height',		0},
				-- }
			-- },
		-- }
	-- },
	{
		MBIN_FILE_SOURCE	= 'UI\HUD\HUDNOTIFICATIONPANEL.MBIN',
		EXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'ID', 'LOWER_NOTIFY'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'IsHidden',	true}
				-- }
			-- },
			{
				SPECIAL_KEY_WORDS	= {'ID', 'TITLE'},
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BODY'},
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'HEADERLINE'},
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BASELINE'},
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
				SPECIAL_KEY_WORDS	= {'ID', 'ICON', 'Vertical', 'Bottom'},
				SECTION_UP			= 2,
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SMALLICON'},
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'EXCLAMATION'},
				VALUE_CHANGE_TABLE 	= {
					{'IsHidden',	true}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			-- 'UI\HUD\HUDLINES.MBIN',
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
