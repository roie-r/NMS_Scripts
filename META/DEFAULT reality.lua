------------------------------------------------
mod_desc = [[
  Reduce creature damage from mining laser
  proper icon for the mech inventory
  More items at shops
  More substance amount at shops
]]----------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META default reality.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.36',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/DEFAULTREALITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {
					{'Id', 'CREATURE',	'DamageType', 'Laser'},
					{'Id', 'FIEND',		'DamageType', 'Laser'},
				},
				INTEGER_TO_FLOAT	= 'Force',
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Multiplier',	0.05}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'TransferMech', 'TkTextureResource.xml'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename',	'TEXTURES/UI/FRONTEND/ICONS/CATEGORIES/INVCAT.MECH.DDS'}
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'Preserve',
				PRECEDING_KEY_WORDS = 'TradeSettings',
				VALUE_CHANGE_TABLE 	= {
					{'MinItemsForSale',	1.5},
					{'MaxItemsForSale',	2}
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'Preserve',
				PRECEDING_KEY_WORDS = 'MinAmountOfSubstanceAvailable',
				VALUE_CHANGE_TABLE 	= {
					{'Ignore',		1.5},
					{'Ignore',		2.5},
					{'Ignore',		3},
					{'Ignore',		2}
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'Preserve',
				PRECEDING_KEY_WORDS = 'MaxAmountOfSubstanceAvailable',
				VALUE_CHANGE_TABLE 	= {
					{'Ignore',		1.5},
					{'Ignore',		2.5},
					{'Ignore',		3},
					{'Ignore',		2}
				}
			}
		}
	}
}}}}
