-----------------------------------------------------------
mod_desc = [[
  - large living crystal reward fix
  - Increase scan discovery range for rare resources
  - green cave crystal rewards cave2
  - shorter freighter landing tractor range
  - organic rock bio gunk reward
  - Activate planetray portal without cost
  - Remove resource crates at portals
  - Re-insert the missing full mangrove tree in swamp biome
]]---------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL various.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|large crystal shard| reward fix
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/CRYSTALS/SENTINELCRYSTALDRONE.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE	= {
					{'Value', 'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/CRYSTALS/SENTINELCRYSTAL/ENTITIES/DATA.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	|fainter resource| lights
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/COMMODITYPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/FUELPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/TECHPLANT1.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value', 		8000}
				}
			}
		}
	},
	{--	|rares scan range| increase
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/ROLLINGPLANT/ENTITIES/ROLLINGPROP.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/GROUND/METALFORMATION/ENTITIES/METALFORMATION.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/INAIR/FLOATINGGASBAGS/ENTITIES/FLOATINGGASBAG.ENTITY.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'ScanRange',		1600},		-- 400
					{'ScannableType',	'Scanner'},	-- Binoculars
				}
			}
		}
	},
	{--	cave |green crystal cobalt| reward
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/LARGE/CRYSTAL_LARGE_CAVE/ENTITIES/CRYSTAL_LARGE_CAVE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/MEDIUM/CRYSTAL_MEDIUM_CAVE/ENTITIES/CRYSTAL_MEDIUM_CAVE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/SMALL/CRYSTAL_SMALL_CAVE/ENTITIES/CYSTAL_SMALL_CAVE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/SMALL/CRYSTAL_FRAGMENT_CAVE/ENTITIES/SHARDS_CAVE.ENTITY.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'GivesReward',	'PLANT_TECH'},
					{'ScanName',	'UI_GREEN_CRYSTAL_NAME'}, -- UI_CAVE2_NAME_L
					{'ScanIconType','CaveSubstance'}
				}
			}
		}
	},
	{--	Barrren biome |organic rock bio reward| instead of mordite
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/CRYSTALS/GEMCRYSTALS/ENTITIES/GEMCRYSTAL.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'GcSimpleInteractionComponentData.xml',
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'R_BREAK_BIO'}
				}
			}
		}
	},
	{--	Activate planetray |portal without cost|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PORTAL/PORTAL/ENTITIES/BUTTON.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'GcMaintenanceComponentData.xml',
				REMOVE				= 'Section'
			}
		}
	},
	{--	|No crates at portal|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PORTAL/PORTAL.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'PortalStructure'},
				PRECEDING_KEY_WORDS	= 'TkSceneNodeData.xml',
				VALUE_MATCH			= '{^_Clump[1-6]}',
				REMOVE				= 'Section'
			}
		}
	},
	{--	|add full mangroves|
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/MANGROVELARGE.DESCRIPTOR.MBIN',
				'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/MANGROVELARGEFULL.DESCRIPTOR.MBIN',
				'REMOVE'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	=  'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/MANGROVELARGEFULL.DESCRIPTOR.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'TypeId',		'_MFULL_'}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'TkResourceDescriptorData.xml',
				SECTION_ACTIVE		= -1,
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'_MFULL_01LOD0'},
					{'Name',		'_MFull_01LOD0'}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'TkResourceDescriptorData.xml',
				SECTION_ACTIVE		= -2,
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'_MFULL_02LOD0'},
					{'Name',		'_MFull_02LOD0'}
				}
			},
		}
	}
}}}}
