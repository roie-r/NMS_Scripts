----------------------------------------------------
mod_desc = [[
  space station interior LOD increase; mod by Lo2k
  station landing pad lights changed to near-white
]]--------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL station interior FIX.pak',
	MOD_AUTHOR			= 'Lo2k, lMonk',
	NMS_VERSION			= '4.36',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/GUILDSHOP.SCENE.MBIN',
			'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/MISSIONSHOP.SCENE.MBIN',
			'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/SCRAPDEALERSHOP.SCENE.MBIN',
			'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/SHIPSHOP.SCENE.MBIN',
			'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/SUITSHOP.SCENE.MBIN',
			'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/VEHICLESHOP.SCENE.MBIN',
			'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/WEAPONSHOP.SCENE.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST1'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		50}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST2'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		100}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST3'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		200}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/MAPSHOP.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST1'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		50}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST2'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		100}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/BACK_SECTION/ENTITIES/LEFTSECTIONTRIGGER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'StateID', 'LEFTOFF'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'RequirePlayerAction', 'None'},
				SECTION_UP_SPECIAL	= 1,
				REMOVE				= 'Section'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 	'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/BACK_SECTION/ENTITIES/RIGHTSECTIONTRIGGER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'StateID', 'RIGHTOFF'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'RequirePlayerAction', 'None'},
				SECTION_UP_SPECIAL	= 1,
				REMOVE				= 'Section'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 	'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/BACK_SECTION/ENTITIES/SHOP_LIGHTTRIGGER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_CHANGE_TABLE	= {
					{'Distance',	50}
				}
			}
		}
	},
	{
	--	|station landing pad lights|
		MBIN_FILE_SOURCE 	= 'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/LANDINGPAD.SCENE.MBIN',
		EXML_CHANGE_TABLE 	= {
			{
				REPLACE_TYPE		= 'All',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				VALUE_CHANGE_TABLE	= {
					{'TransY',		25},	--original : 10.46178
					{'TransZ',		2.3},	--original : 0.266191
				}
			},
			{
				REPLACE_TYPE		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', 'FOV'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		70},
				}
			},
			{
				REPLACE_TYPE		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', 'COL_R'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.95}
				}
			},
			{
				REPLACE_TYPE		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', 'COL_G'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.95}
				}
			},
			{
				REPLACE_TYPE		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', 'COL_B'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.85}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'spotLight7', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		70000}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'spotLight8', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		60000}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'spotLight9', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		50000}
				}
			}
		}
	}
}}}}
