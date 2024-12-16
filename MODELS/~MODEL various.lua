-----------------------------------------------------------
local mod_desc = [[
  - trading post landing pad fix
  - Remove multiplayer comms messenger
  - remove builder body lights
  - change builder cloth texture
  - Increase scan discovery range for rare resources
  - Activate planetary portal without cost
  - remove gunk from damaged machinery
  - Remove resource crates at portals
  - remove lowest level frigates lod
  - better cloud map
  - null anim for other mods
]]---------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL various.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.29',
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|trade post pad| fix
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/TRADINGPOST/LANDINGPAD.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'EXIT'},
				VALUE_CHANGE_TABLE	= {
					{'TransY',		-0.4221}
				}
			}
		}
	},
	{--	no |comms messenger body|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/MESSENGER/MESSENGER.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {
					{'Name', 'root'},
					{'Type', 'COLLISION'},
				},
				REMOVE				= 'Section'
			},
		}
	},
	{--	no |comms messenger trigger|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/MESSENGER/ENTITIES/MESSENGER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'InteractionType',
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE	= {
					{'InteractionType',	'None'}
				}
			}
		}
	},
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
	{--	|No crates at portal|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PORTAL/PORTAL.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '^_Clump[1-6]'},
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
	{--	|better clouds|
		MBIN_FILE_SOURCE	= 'MATERIALS/ATMOSPHERE.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gCloudMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/SPACE/ATMOSPHERE/ATMOSPHERE03.DDS'}
				}
			}
		}
	},
	{--	null anim for other mods
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/EFFECTS/ENGINES/SPEEDCOOL.ANIM.MBIN',
				'MODELS/COMMON/SHARED/NULL.ANIM.MBIN',
				'REMOVE'
			}
		}
	},
	{--	null anim for other mods
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SHARED/NULL.ANIM.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'FrameCount',	10}
				}
			}
		}
	}
}}}}
