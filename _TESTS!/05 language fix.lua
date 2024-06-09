----------------------------------------------------------
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME			= '__TEST 03 language fix.pak',
	MOD_AUTHOR				= 'lMonk',
	MODIFICATIONS			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE  	= 'LANGUAGE/NMS_LOC1_ENGLISH.MBIN',
		EXML_CHANGE_TABLE 	= {
			{
				SPECIAL_KEY_WORDS	= {'ID','PC_MENU_QUIT_TO_DESKTOP'},
				VALUE_CHANGE_TABLE	= {
					{'English',	'Kill this process!'}
				}
			}
		}
	}
}}}}