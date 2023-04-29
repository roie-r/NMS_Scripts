-------------------------------------------------------------------------
mod_desc = [[
  - removes orange and purple overlays - painted sentinels only
]]-----------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME			= '__TEXTURE various.pak',
	MOD_BATCHNAME			= '_TEXTURES ~@~collection.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.23',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
	--	|painted sentinels| only (removes orange and purple)
		MBIN_FILE_SOURCE	= 'TEXTURES/COMMON/ROBOTS/SENTINELPROC.TEXTURE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'OVERLAY', 'Name', '1'},
				VALUE_CHANGE_TABLE 	= {
					{'Diffuse',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.2.DDS'},
					{'Normal',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.2.NORMAL.DDS'},
					{'Mask',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.2.MASKS.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'OVERLAY', 'Name', '3'},
				VALUE_CHANGE_TABLE 	= {
					{'Diffuse',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.4.DDS'},
					{'Normal',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.4.NORMAL.DDS'},
					{'Mask',	'TEXTURES/COMMON/ROBOTS/SENTINELPROC.OVERLAY.4.MASKS.DDS'}
				}
			}
		}
	}
}}}}
