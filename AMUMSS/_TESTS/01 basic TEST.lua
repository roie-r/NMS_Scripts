--[[┎──────────────────────────────────────────────────────
	┃ MORE COMMENTS
────┸──────────────────────────────────────────────────--]]

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 1 basic.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.38',
	MOD_BATCHNAME		= '_1_.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
		{
			-- remove startup logo splash
			MBIN_FILE_SOURCE	= 'METADATA\UI\BOOTLOGOPC.MBIN',
			EXML_CHANGE_TABLE	= {
				{
					REPLACE_TYPE 		= 'ALL',
					PRECEDING_KEY_WORDS = 'Textures',
					VALUE_CHANGE_TABLE 	= {
						{'value',		''}
					}
				},
				{
					REPLACE_TYPE 		= 'ALL',
					MATH_OPERATION 		= '*',
					PRECEDING_KEY_WORDS = 'DisplayTime',
					VALUE_CHANGE_TABLE 	= {
						{'IGNORE',		0}
					}
				}
			}
		},
	}}}}
