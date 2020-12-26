--[[┎──────────────────────────────────────────────────────────────
	┃ Reduce turret scale for the Nomad exocraft (BIKE)
────┸──────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL nomad smaller turret.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.13',
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MOD_DESCRIPTION		= 'U',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\VEHICLES\BIKE\BIKEPRES.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'Gun'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.78},
					{'TransZ',		-0.44},
					{'ScaleX',		0.56},
					{'ScaleY',		0.56},
					{'ScaleZ',		0.56}
				}
			}
		}
	}
}}}}