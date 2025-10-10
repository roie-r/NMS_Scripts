--------------------------------------------
local mod_desc = [[
  diverse shelters, by Lo2k
]]------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ MODEL diverse shelters',
	MOD_AUTHOR			= 'Lo2k',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/SHACK/SHACK_SCIENTIFIC.LSYSTEM.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'nShack', 'Restriction', 'AtLeast'},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		0}	-- 1
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'nShack', 'Restriction', 'NoMoreThan'},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		3}	-- 2
				},
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', 'nSilo'},
					{'Name', 'nTower'}
				},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		2}	-- 1
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/SHACK/SHACK_TRADER.LSYSTEM.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'nShack', 'Restriction', 'AtLeast'},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		0}	-- 1
				},
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'nShack', 'Restriction', 'NoMoreThan'},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		3}	-- 2
				},
			},
			{
				SPECIAL_KEY_WORDS	= {'Name','nAttachmentA'},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		2}	-- 1
				},
			},
		},
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/SHACK/SHACK_WARRIOR.LSYSTEM.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'nShack', 'Restriction', 'AtLeast'},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		0}	-- 1
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'nShack', 'Restriction', 'NoMoreThan'},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		3}	-- 2
				}
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', 'nSilo'},
					{'Name', 'nAntenna'},
					{'Name', 'nTower'}
				},
				VALUE_CHANGE_TABLE	= {
					{'Amount',		2}	-- 1
				}
			}
		}
	}
}}}}
