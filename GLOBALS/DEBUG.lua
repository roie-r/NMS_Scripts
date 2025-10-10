----------------------
local mod_desc = [[
  gc debug tweaks
]]--------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ GC debug',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCDEBUGOPTIONS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'SaveOutModdedMetadata',				true},

					{'GenerateFarLodBuildingDist',			4000},	-- 1000
					-- {'WeaponScale3P',						0.7},	-- 0.7	0.55
					{'ThirdPersonIsDefaultCameraForPlayer',	false},
					{'DisableSaveSlotSorting',				true},
					{'AlwaysHaveFocus',						true},
					{'ForceInitialShip',					false},
					{'ForceInitialWeapon',					false},
					{'DisableBaseBuildingLimits',			true},
					-- {'MultiplePlayerFreightersInASystem',	true},
					{'DisableFileWatcher',					true},

					--- TESTING! ---
					-- {'ForceExtremeWeather',					true},
					-- {'EnableDayNightCycle',					false},
					-- {'DisableStorms',						true},
				}
			}
		}
	}
}}}}
