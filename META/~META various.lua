------------------------------------------------------------------
local mod_desc = [[
  - More hazard plant variaty
  - Restore fauna to abandoned systems
  - Raise green cave crystals probability
  - Round up substances stack to 10000
  - Replace exploration mission log menu icon
  - Restore old creature-scanned icon; Remove selected HUD icons
  - Override corrupt biome filter
  - Add civilian and pirate sentinel ships
  - Remove tiny cargo pod frigates
  - Faster screen text
  - Hide inventory change tab marker (bulletpoint) and slashes
  -! keep whale song mission active
]]----------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META various',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_BATCHNAME		= '+META ~@~collection',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|scrap + hazard plants|
		MBIN_FILE_SOURCE = 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BIOMEFILENAMES.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE = {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'HAZARD_PLANTS'},
				VALUE_CHANGE_TABLE 	= {
					{'MaxFilesToChoose', 4}, -- 2
				}
			}
		}
	},
	{--	|abandoned fauna|
		MBIN_FILE_SOURCE = 'METADATA/SIMULATION/ECOSYSTEM/CREATUREGENERATIONDATA.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE = {
			{
				PRECEDING_KEY_WORDS = 'AbandonedSystemSpecific',
				VALUE_CHANGE_TABLE 	= {
					{'OverrideAllDomains', false}
				}
			}
		}
	},
	{--	|cave crystal|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/CRYSTALS/CAVEFULL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
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
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
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
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/MISSIONS/TABLES/COREMISSIONTABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'EXPLORE_LOG', 'MissionIcon', 'TkTextureResource'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.EXPLORATIONLOG.SYSTEM.OFF.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'EXPLORE_LOG', 'MissionIconSelected', 'TkTextureResource'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.EXPLORATIONLOG.SYSTEM.ON.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'MissionID', 'EXPLORE_LOG', 'MissionIconNotSelected', 'TkTextureResource'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.EXPLORATIONLOG.SYSTEM.OFF.DDS'}
				}
			}
		}
	},
	{--	|HUD scanner icons|
		MBIN_FILE_SOURCE	= 'METADATA/UI/HUD/SCANNERICONS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
			--	bug fix... doesn't work (hardcoded?)
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'ScannableIconsBinocs',
				SPECIAL_KEY_WORDS = {'Terrain', 'GcScannerIcon', 'Main', 'TkTextureResource'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/ICONS/SCANNING/PICKUP.TERRAIN.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'WheeledBike',	'GcScannerIcon', 'Main', 'TkTextureResource'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/ICONS/PLAYER/WHEELEDBIKE.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Submarine',	'GcScannerIcon', 'Main', 'TkTextureResource'},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/ICONS/PLAYER/SUBMARINE.DDS'}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'CreatureDiscovered',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/ICONS/CREATURE.GREEN2.DDS'}
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				PRECEDING_KEY_WORDS = {'SpaceAtlas', 'Highlight'},
				VALUE_CHANGE_TABLE 	= {
					{'ScannerIconHighlightType', 'Octagon'}
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
					{'MessageBeacon.-',	'GcScannerIcon'},
					{'FreighterBase',	'GcScannerIcon'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/BLANK.BC7.64.DDS'}
				}
			}
		}
	},
	{--	|screen filters|
		MBIN_FILE_SOURCE	= 'METADATA/EFFECTS/SCREENFILTERS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
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
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
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
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
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
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Filename', 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTERTINY_PROC.SCENE.MBIN'},
				REMOVE				= 'Section'
			},
			{
				PRECEDING_KEY_WORDS	= {'Police', 'Spaceships', 'Spaceships'},
				SEC_SAVE_TO			= 'ai_spaceship_model_data'
			},
			{
				PRECEDING_KEY_WORDS	= {
					{'Civilian',	'Spaceships'},
					{'Pirate',		'Spaceships'}
				},
				SEC_ADD_NAMED		= 'ai_spaceship_model_data'
			}
		}
	},
	{--	|fast splash logo|
		MBIN_FILE_SOURCE	= 'METADATA/UI/BOOTLOGOPC.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
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
}}}}

	-- {--	|scrap + hazard plants|
		-- MBIN_FILE_SOURCE = 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BIOMEFILENAMES.MBIN',
		-- EXML_CREATE			= false,
		-- MXML_CHANGE_TABLE = {
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'PROC_SALVAGE'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Probability', 0}, -- 1
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'Id', 'NEW_SCRAP'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Probability', 0}, -- 1
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'Id', 'HAZARD_PLANTS'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'MaxFilesToChoose', 4}, -- 2
				-- }
			-- }
		-- }
	-- },
	-- {--	|keep whale song mission active|
		-- MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/MISSIONS/SPACEPOIMISSIONTABLE.MBIN',
		-- EXML_CREATE			= false,
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'MissionID', 'BIO_FRIG'},
				-- PRECEDING_KEY_WORDS	= 'CancelingConditions',
				-- REMOVE				= 'Section',
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'MissionID', 'BIO_FRIG'},
				-- VALUE_CHANGE_TABLE	= {
					-- {'RestartOnCompletion', 'True'}
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'MissionID', 'BIO_FRIG', 'Stage', 'GcMissionSequenceCreateSpecificPulseEncounter'},
				-- VALUE_CHANGE_TABLE	= {
					-- {'PulseEncounterID', 'BIO_FRIG'}
				-- }
			-- }
		-- }
	-- },
