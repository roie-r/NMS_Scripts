
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME	= '___TEST 05 delete by pattern.pak',
	MOD_AUTHOR		= 'lMonk',
	MODIFICATIONS	= {{
	MBIN_CHANGE_TABLE = {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.SCENE.MBIN',
		EXML_CHANGE_TABLE = {
			{
				PRECEDING_KEY_WORDS = 'TkSceneNodeAttributeData.xml',
				VALUE_MATCH			= '{LODDIST?$}',
				-- VALUE_MATCH_OPTIONS	= '~=',
				REMOVE				= 'Section'
			},
		}
	}
}}}}
