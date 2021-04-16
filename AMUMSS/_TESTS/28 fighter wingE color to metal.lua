--[[┎──────────────────────────────────────────────────────────────────
	┃ WING_E color to metal.pak
────┸──────────────────────────────────────────────────────────────--]]

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 28 Wing_E color to metal.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.37',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_E\WINGSE.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Value', 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_E\WINGSE\TERTIARY.MATERIAL.MBIN'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'MODELS\COMMON\SPACECRAFT\FIGHTERS\COCKPIT\COCKPIT_F\COCKPTF\SECONDARY2.MATERIAL.MBIN'},
				}
			}
		}
	}
}}}}
