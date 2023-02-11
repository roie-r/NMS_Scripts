----------------------
mod_desc = [[
  debug tweaks
]]--------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC DEBUG.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.08',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCDEBUGOPTIONS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					-- {'OctahedralImpostersEnable',			true},
					{'DisableSaveSlotSorting',				true},
					{'DisableBaseBuildingLimits',			true},
					{'DisableProfanityFilter', 				true},
					{'MultiplePlayerFreightersInASystem',	true},

					-- {'EnableBaseMovingOption',				true},
					-- {'MoveBaseIndex',						5},

					--- FOR TESTING!
					-- {'ForceSunAngle',						35},	-- 0
					-- {'EnableDayNightCycle',					false},
					-- {'DisableStorms',						true},
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'LocTableList',
				ADD = '<Property value="NMSString0x20.xml"><Property name="Value" value="NMS_Loc88"/></Property>'
			}
		}
	}
}}}}
