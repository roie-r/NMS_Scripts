------------------------------------------------------------------------------
local mod_desc = [[
  position cargo inventory above the tech and remove the inventory box labels
  and switch the inventory window expansion icons placement
  (Original by lyravega)
]]----------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ UI cargo on top',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'UI/INVENTORYPAGE.MBIN',
			'UI/BUYSCREEN.MBIN'
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'INV_.-_LABEL'},	-- tech + cargo headers
					{'ID', '.-ICON'},		-- tech + cargo icons
				},
				SECTION_UP			= 2,
				REMOVE			 	= 'Section'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			'UI/COMPONENTS/INVENTORY/SQU_INV_BOXTECH.MBIN',
			'UI/INVENTORYPAGE.MBIN'
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'ID', 'SQU_INV_TECH'},
				VALUE_CHANGE_TABLE 	= {
					{'Position Y',	1230} -- 735
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			'UI/COMPONENTS/INVENTORY/SQU_INV_BOXREGULAR.MBIN',
			'UI/INVENTORYPAGE.MBIN'
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'ID', 'SQU_INV_REGULAR'},
				VALUE_CHANGE_TABLE 	= {
					{'Position Y',	735} -- 1070
				}
			}
		}
	},
	{
	--	switch inventory window expansion icons placement
		MBIN_FILE_SOURCE	= 'UI/COMPONENTS/PAGESELECTBARSIDE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'TECH_EXPAND'},
				VALUE_CHANGE_TABLE 	= {
					{'Position Y',	440} -- 380
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'ITEM_EXPAND'},
				VALUE_CHANGE_TABLE 	= {
					{'Position Y',	380} -- 440
				}
			}
		}
	}
}}}}
