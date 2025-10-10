-----------------------------------------------------------------------------
local mod_desc = [[
  Enable scanner tech and materials teleport for bioship
  Increase bioship pulse upgrades stats for higher speed and maneuverability
]]---------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.living ship upgrades',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCPROCEDURALTECHNOLOGYTABLE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS	= {'Template', 'A_SHIPJUMP', 'StatsType', 'Ship_Boost'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'ValueMin',		0.16},	-- 1.1
					{'ValueMax',		0.2}	-- 1.25
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS	= {'Template', 'A_SHIPJUMP', 'StatsType', 'Ship_BoostManeuverability'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'ValueMin',		0.18},	-- 1.05
					{'ValueMax',		0.32}	-- 1.18
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS	= {'Template', 'A_SHIPJUMP', 'StatsType', 'Ship_Maneuverability'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'ValueMin',		0.07},	-- 1.0065
					{'ValueMax',		0.07} 	-- 1.0065
				}
			}
		}
	}
}}}}
