--[[┎────────────────────────────────────────────────────────────────
	┃ debug tweaks
────┸────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC DEBUG.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MOD_DESCRIPTION		= 'U',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCDEBUGOPTIONS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'SkipPlanetDiscoverOnBoot',			true}, -- ??
					{'AllowSavingOnAbandonedFreighters',	true},
					{'DisableSaveSlotSorting',				true},
					-- {'DisableProfanityFilter', 				true},
					{'MultiplePlayerFreightersInASystem',	true},

					-- {'EnableBaseMovingOption',				true},
					-- {'MoveBaseIndex',						1},
				}
			}
		}
	}
}}}}
