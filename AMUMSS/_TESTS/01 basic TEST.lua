
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '___TEST no charge portal.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.68',
	MODIFICATIONS		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PORTAL/PORTAL/ENTITIES/BUTTON.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'GcMaintenanceComponentData.xml',
				REMOVE				= 'SECTION'
			}
		}
	}
}}}}