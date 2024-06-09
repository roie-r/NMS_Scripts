------------------------------------------------------------------
local mod_desc = [[
  - Add vulture parts to dropship custom groups
  - Raise green cave crystals probability
  - Round up substances stack to 10000
  - Replace exploration mission log menu icon
  - Restore old creature-scanned icon; Remove selected HUD icons
  - override corrupt biome filter
  - Add civilian and pirate sentinel ships
  - Remove tiny cargo pod frigates
  - Faster screen text
  - hide inventory change tab marker (bulletpoint) and slashes
  - better cloud map
  - keep whale song mission active
]]----------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META various.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.72',
	MOD_BATCHNAME		= '_META ~@~collection.pak',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|custom dropship add vulture| parts
		MBIN_FILE_SOURCE = 'METADATA/GAMESTATE/PLAYERDATA/CHARACTERCUSTOMISATIONDESCRIPTORGROUPSDATA.MBIN',
		EXML_CHANGE_TABLE = {
			{
				SPECIAL_KEY_WORDS	= {'Value', '_COCKPIT_S13XNEVER'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		'_COCKPIT_S13'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Value', '_ENGINES_S13xNEVER'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		'_ENGINES_S13'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Value', '_WINGS_S13xNEVER'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		'_WINGS_S13'}
				}
			}
		}
	},
	{--	|cave crystal|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/CRYSTALS/CAVEFULL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/LARGE/CRYSTAL_LARGE_CAVE.SCENE.MBIN'},
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/MEDIUM/CRYSTAL_MEDIUM_CAVE.SCENE.MBIN'}
				},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Placement',	'CRYSTAL2'}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/SMALL/CRYSTAL_SMALL_CAVE.SCENE.MBIN'},
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/SMALL/CRYSTAL_FRAGMENT_CAVE.SCENE.MBIN'}
				},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Placement',	'CRYSTALCAVE'}
				}
			}
		}
	},
	{--	substance |stacks|
		MBIN_FILE_SOURCE	= 'METADATA/GAMESTATE/DIFFICULTYCONFIG.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_MATCH			= 9999,
				VALUE_CHANGE_TABLE 	= {
					{'Ignore',		10000}
				}
			}
		}
	},
	{--	|exploration mission icon|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/MISSIONS/COREMISSIONTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'EXPLORE_LOG', 'MissionIconSelected', 'TkTextureResource.xml'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.EXPLORATIONLOG.SYSTEM.ON.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'EXPLORE_LOG', 'MissionIconNotSelected', 'TkTextureResource.xml'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.EXPLORATIONLOG.SYSTEM.OFF.DDS'}
				}
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
				PRECEDING_KEY_WORDS = {'RareEgg', 'Main'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/ICONS/PICKUPS/PICKUP.HAZARDEGG.DDS'}
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
					{'Filename', 'TEXTURES/BLANK.BC7.64.DDS'}
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
	{--	|ai ship manager| Add civilian and pirate sentinel ships
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SPACE/AISPACESHIPMANAGER.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Filename', 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTERTINY_PROC.SCENE.MBIN'},
				REMOVE				= 'Section'
			},
			{
				PRECEDING_KEY_WORDS	= {'Police', 'Spaceships', 'GcAISpaceshipModelData.xml'},
				SEC_SAVE_TO			= 'ai_spaceship_model_data'
			},
			{
				PRECEDING_KEY_WORDS	= {'Civilian', 'Spaceships'},
				SEC_ADD_NAMED		= 'ai_spaceship_model_data'
			},
			{
				PRECEDING_KEY_WORDS	= {'Pirate', 'Spaceships'},
				SEC_ADD_NAMED		= 'ai_spaceship_model_data'
			}
		}
	},
	{--	|fast splash logo|
		MBIN_FILE_SOURCE	= 'METADATA/UI/BOOTLOGOPC.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = 'DisplayTime',
				VALUE_CHANGE_TABLE 	= {
					{'Ignore',		0},
					{'Ignore',		0},
					{'Ignore',		0},
					{'Ignore',		0}
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
}}}}
