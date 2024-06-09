--------------------------------------------------------------------------
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '___TEST 04 rewards.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.72',
	MODIFICATIONS		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION		= '*',
				INTEGER_TO_FLOAT	= 'Preserve',
				WHERE_IN_SUBSECTION	= {
					{'Id', 'PLANT_SNOW'}
				},
				-- SPECIAL_KEY_WORDS	= {'Id', 'PLANT_SNOW'}, 
				-- PRECEDING_KEY_WORDS	= 'Reward',
				-- VALUE_MATCH			= 'Id',
				VALUE_CHANGE_TABLE	= {
					{'AmountMin',	0.9},
					{'AmountMax',	1.1}
				}
			}
		}
	},
}}}}
