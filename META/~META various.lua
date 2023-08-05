---------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
---------------------------------------------------------------
mod_desc = [[
  - Same underwater freighter crash site as on land
  - Remove proc tech upgrades and add sentinel tech to
   technology catalogue
  - Restore old creature-scanned icon; Remove selected HUD icons
  - override corrupt biome filter
  - Remove tiny cargo pod frigates
  - Faster screen text
  - hide inventory change tab marker (bulletpoint) and slashes
  - better cloud map
  - keep whale song mission active
]]-------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META various.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|same underwater freigher|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/ENVIRONMENT/PLANETBUILDINGTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'WaterCrashedFreighter', 'GcBuildingFilename.xml'},
				PRECEDING_KEY_WORDS = 'Scene',
				VALUE_CHANGE_TABLE 	= {
					{'Value', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER.SCENE.MBIN'}
				}
			}
		}
	},
	{--	|catalogue changes| no procs & add sentinel tech
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/CATALOGUECRAFTING.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'CategoryID', 'UI_PORTAL_CAT_TECH_SUIT'}, -- keep s-class >> {^U_.+[124X]X$}
					{'CategoryID', 'UI_PORTAL_CAT_TECH_SHIP'}, -- keep s-class >> {^U_.+[123X]$}
					{'CategoryID', 'UI_PORTAL_CAT_TECH_TOOL'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_GUN'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_VEH'}
				},
				PRECEDING_KEY_WORDS = 'NMSString0x10.xml',
				VALUE_MATCH			= '{^U_.+[1234X]$}', -- remove all procs
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_FRE'},
				PRECEDING_KEY_WORDS = 'NMSString0x10.xml',
				VALUE_MATCH			= '{^U_FR_.+[123]$}', -- keep s-class
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_WEIRD'},
				PRECEDING_KEY_WORDS = 'Items',
				ADD					= (
					function()
						local T = {}
						for _,id in ipairs({
							'LIFESUP_ROBO',
							'LAUNCHER_ROBO',
							'SHIPJUMP_ROBO',
							'HYPERDRIVE_ROBO',
							'SHIPSHIELD_ROBO',
							'SHIPGUN_ROBO'
						}) do
							T[#T+1] = {
								META	= {'value', 'NMSString0x10.xml'},
								Value	= id
							}
						end
						return ToExml(T)
					end
				)()
			}
		}
	},
	{--	|alt HUD icons|
		MBIN_FILE_SOURCE	= 'METADATA/UI/HUD/SCANNERICONS.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'CreatureDiscovered',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/ICONS/CREATURE.GREEN2.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS = {
					{'MessageBeacon',		'GcScannerIcon.xml'},
					{'MessageBeaconSmall',	'GcScannerIcon.xml'},
					{'FreighterBase',		'GcScannerIcon.xml'},
					-- {'PlayerFreighter',		'GcScannerIcon.xml'},
				},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/BLANK.64.DDS'}
				}
			}
		}
	},
	{--	|screen filters|
		MBIN_FILE_SOURCE	= 'METADATA/EFFECTS/SCREENFILTERS.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Filename', 'TEXTURES/LUT/FILTERS/BINOCULARS.DDS'},
					{'Filename', 'TEXTURES/LUT/FILTERS/SURVEYING1.DDS'},
					{'Filename', 'TEXTURES/LUT/FILTERS/MISSIONSURVEY.DDS'},
				},
				VALUE_CHANGE_TABLE 	= {
					{'Filename',	'TEXTURES/LUT/FILTERS/DEFAULT.DDS'}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'CorruptSentinels',
				VALUE_CHANGE_TABLE 	= {
					{'Filename',	'TEXTURES/LUT/FILTERS/VIBRANT.DDS'}
				}
			}
		}
	},
	{--	|text images styles|
		MBIN_FILE_SOURCE	= 'METADATA/UI/SPECIALSTYLESIMAGESDATA.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'BULLETPOINT'},
				VALUE_CHANGE_TABLE 	= {
					{'Path',		''}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'SLASH'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|Faster screen text|
		MBIN_FILE_SOURCE	= 'METADATA/UI/SPECIALTEXTPUNCTUATIONDELAYDATA.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				INTEGER_TO_FLOAT	= 'Force',
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'Delay',			0.1},
					{'DefaultDelay',	0.2}
				}
			}
		}
	},
	{--	|No tiny frigates|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SPACE/AISPACESHIPMANAGER.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Filename', 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTERTINY_PROC.SCENE.MBIN'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|faster splash logo|
		MBIN_FILE_SOURCE	= 'METADATA/UI/BOOTLOGOPC.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = 'DisplayTime',
				VALUE_CHANGE_TABLE 	= {
					{'IGNORE',		0}
				}
			}
		}
	},
	{--	|better clouds|
		MBIN_FILE_SOURCE	= 'MATERIALS/ATMOSPHERE.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gCloudMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/SPACE/ATMOSPHERE/ATMOSPHERE.DDS'}
				}
			}
		}
	},
	{--	|keep whale song mission active|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/MISSIONS/SPACEPOIMISSIONTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'BIO_FRIG'},
				PRECEDING_KEY_WORDS	= 'CancelingConditions',
				REMOVE				= 'Section',
			},
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'BIO_FRIG'},
				SECTION_ACTIVE		= -1,
				VALUE_CHANGE_TABLE	= {
					{'RestartOnCompletion', 'True'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'BIO_FRIG', 'Stage', 'GcMissionSequenceCreateSpecificPulseEncounter.xml'},
				VALUE_CHANGE_TABLE	= {
					{'PulseEncounterID', 'BIO_FRIG'}
				}
			}
		}
	},
	-- {--	|deeper oceans|
		-- MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/VOXELGENERATORSETTINGS.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- -- MATH_OPERATION 		= '+',
				-- REPLACE_TYPE 		= 'All',
				-- PRECEDING_KEY_WORDS = 'UnderWater',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Subtract',	true},
					-- -- {'Height',		1000},
					-- {'OffsetType',	'Base'}, -- Zero, Base, All, SeaLevel
					-- {'HeightOffset',200}
				-- }
			-- },
		-- }
	-- }
}}}}
