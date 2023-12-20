-----------------------------------------------------------
local mod_desc = [[
  - large living crystal reward fix
  - Increase scan discovery range for rare resources
  - green cave crystal rewards cave2
  - shorter freighter landing tractor range
  - organic rock bio gunk reward
  - Activate planetary portal without cost
  - remove gunk from damaged machinery
  - Remove resource crates at portals
  - remove lowest level frigates lod
  - Re-insert the missing full mangrove tree in swamp biome
]]---------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL various.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.47',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	no |builder body light|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/INTERIORLIGHTS_MAT4.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'Section'
			}
		}
	},
	{--	|builder cloth tile|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/BCLOTHTILEABLEPAD1.MATERIAL.MBIN',
			'MODELS/COMMON/PLAYER/PLAYERCHARACTER/NPCROBOT/BCLOTHTILEABLEPAD1.MATERIAL.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE	= {
					{'Map', 'TEXTURES/COMMON/ROBOTS/CLOTH/CANVAS/CLOTHTILEABLEPADDING.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMasksMap'},
				VALUE_CHANGE_TABLE	= {
					{'Map', 'TEXTURES/COMMON/ROBOTS/CLOTH/CANVAS/CLOTHTILEABLEPADDING.MASKS.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gNormalMap'},
				VALUE_CHANGE_TABLE	= {
					{'Map', 'TEXTURES/COMMON/ROBOTS/CLOTH/CANVAS/CLOTHTILEABLEPADDING.NORMAL.DDS'}
				}
			},
		}
	},
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
	{--	Barren biome |organic rock bio reward| instead of mordite
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
	{--	|no maintenance| use portal without cost, undamaged machinery
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PORTAL/PORTAL/ENTITIES/BUTTON.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/PARTS/DEBRILARGECONTAINER/ENTITIES/TECHDEBRIS.ENTITY.MBIN'
		},
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
	{--	remove lowest |frigate LOD| model
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/COMBATFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/COMBATFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/DIPLOMATICFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/DIPLOMATICFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/INDUSTRIALFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/INDUSTRIALFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SCIENCEFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SCIENCEFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SUPPORTFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SUPPORTFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATE_PROC_LOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATE_PROC_LOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/PIRATECRUISERLOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/PIRATECRUISERLOD4.SCENE.MBIN',
				'REMOVE'
			}
		}
	},
	{--	add full mangroves
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/MANGROVELARGE.DESCRIPTOR.MBIN',
				'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/MANGROVELARGEFULL.DESCRIPTOR.MBIN',
				'REMOVE'
			}
		}
	},
	{--	add full mangroves
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
			}
		}
	}
}}}}
