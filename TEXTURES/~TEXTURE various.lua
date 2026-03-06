-------------------------------------------------------------------------
local mod_desc = [[
  - removes orange and purple overlays - painted sentinels only
  - customization robot head lights alt3 instead of alt2 color
]]-----------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ TEXTURE various',
	MOD_AUTHOR			= 'lMonk',
	MOD_BATCHNAME		= '+TEXTURES ~@~collection',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|old station fix1|
		MBIN_FILE_SOURCE	= {
			'TEXTURES/SPACE/SPACESTATION/SHARED/PRIMARY.TEXTURE.MBIN',
			'TEXTURES/SPACE/SPACESTATION/SHARED/SECONDARY.TEXTURE.MBIN',
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'DAMAGE', 'Name', 'PAINTED'},
				VALUE_CHANGE_TABLE 	= {
					{'Palette',		'Paint'},
					{'ColourAlt',	'Alternative2'}
				}
			}
		}
	},
	{--	|old station fix2|
		MBIN_FILE_SOURCE	= 'TEXTURES/SPACE/SPACESTATION/SHARED/TERTIARY.TEXTURE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'DAMAGE', 'Name', 'PAINTED'},
				VALUE_CHANGE_TABLE 	= {
					{'Palette',		'Paint'},
					{'ColourAlt',	'Alternative1'}
				}
			}
		}
	},
	{--	|painted sentinels| only (removes orange and purple)
		MBIN_FILE_SOURCE	= 'TEXTURES/COMMON/ROBOTS/SENTINELPROC.TEXTURE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				WISUBSEC_OPTION		= 'All',
				WHERE_IN_SUBSECTION	= {
					{'Palette', 'Paint'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Palette',	'SpaceCloud'},
				}
			},
			{-- replace non-police orange
				SPECIAL_KEY_WORDS	= {'Name', 'OVERLAY', 'Name', '1'},
				VALUE_CHANGE_TABLE 	= {
					{'TextureName',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.2.DDS'},
				}
			},
			{-- replace purple overlay with proc-dark
				SPECIAL_KEY_WORDS	= {'Name', 'OVERLAY', 'Name', '4'},
				VALUE_CHANGE_TABLE 	= {
					{'TextureName',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.3.DDS'},
				}
			}
		}
	},
	{--	|construct head lights3| alt3 instead of alt2 color
		MBIN_FILE_SOURCE	= 'TEXTURES/COMMON/ROBOTS/BUILDERLIGHTS.TEXTURE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_CHANGE_TABLE 	= {
					{'ColourAlt', 'Alternative3'}
				}
			}
		}
	}
}}}}
