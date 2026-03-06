----------------------
local mod_desc = [[
  gc debug tweaks
]]--------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ GC debug',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCDEBUGOPTIONS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'DisableCorvetteValidation',			true},
					{'GenerateFarLodBuildingDist',			6000},	-- 1000
					{'ThirdPersonIsDefaultCameraForPlayer',	false},
					{'DisableSaveSlotSorting',				true},
					{'AlwaysHaveFocus',						true},
					{'ForceInitialShip',					false},
					{'ForceInitialWeapon',					false},
					{'DisableBaseBuildingLimits',			true},
					{'DisableFileWatcher',					true},
					-- {'WeaponScale3P',						0.7},	-- 0.7	0.55
					-- {'MultiplePlayerFreightersInASystem',	true},

					--- TESTING! ---
					-- {'SaveOutModdedMetadata',				true},
					-- {'ForceExtremeWeather',					true},
					-- {'EnableDayNightCycle',					false},
					-- {'DisableStorms',						true},
				}
			}
		}
	}
}}}}
