------------------------------------------------------------------
local mod_desc = [[
  Add 'harvest all' at radius of 24u to Sealed Container base part
  Add 'harvest all' to Large planter (3u radius)
  (Duplicates the funcion from the Bioroom)
]]----------------------------------------------------------------

local build_parts = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ MODEL harvet all in radius',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			{
				build_parts..'BIOROOM/ENTITIES/INTERACTION.ENTITY.MBIN',
				build_parts..'TECH/CUBEROOM_PLANTERMEGA/INTERACTION.ENTITY.MBIN'
			},
			{
				build_parts..'BIOROOM/ENTITIES/INTERACTION.ENTITY.MBIN',
				build_parts..'DECORATION/TOYDRONE/INTERACTION.ENTITY.MBIN'
			},
			{
				build_parts..'BIOROOM/ENTITIES/INTERACTION.ENTITY.MBIN',
				build_parts..'DECORATION/BAZAAR/WATERVALVE/INTERACTION.ENTITY.MBIN',
				'REMOVE'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= build_parts..'TECH/CUBEROOM_PLANTERMEGA/INTERACTION.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Components', 'TkAnimationComponentData'},
				REMOVE				= 'Section'
			},
			{
				VALUE_CHANGE_TABLE 	= {
					{'Radius',		3}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			build_parts..'DECORATION/TOYDRONE/INTERACTION.ENTITY.MBIN',
			build_parts..'DECORATION/BAZAAR/WATERVALVE/INTERACTION.ENTITY.MBIN'
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Components', 'TkAnimationComponentData'},
				REMOVE				= 'Section'
			},
			{
				VALUE_CHANGE_TABLE 	= {
					{'Radius',		24}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= build_parts..'BIOROOM.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Interaction'},
				SEC_SAVE_TO			= 'harvest_entity_scene_node',
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= build_parts..'DECORATION/TOYDRONE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SEC_EDIT 			= 'harvest_entity_scene_node',
				SPECIAL_KEY_WORDS	= {'Name', 'Interaction'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		1},
				}
			},
			{
				SEC_EDIT 			= 'harvest_entity_scene_node',
				SPECIAL_KEY_WORDS	= {'Name', 'RADIUS'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		1},
				}
			},
			{
				SEC_EDIT 			= 'harvest_entity_scene_node',
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value', build_parts..'DECORATION/TOYDRONE/INTERACTION.ENTITY.MBIN'},
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				SEC_ADD_NAMED		= 'harvest_entity_scene_node',
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= build_parts..'DECORATION/BAZAAR/WATERVALVE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SEC_EDIT 			= 'harvest_entity_scene_node',
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value', build_parts..'DECORATION/BAZAAR/WATERVALVE/INTERACTION.ENTITY.MBIN'},
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				SEC_ADD_NAMED		= 'harvest_entity_scene_node',
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= build_parts..'TECH/CUBEROOM_PLANTERMEGA.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'INTERACT'},
				REMOVE				= 'Section'
			},
			{
				SEC_EDIT 			= 'harvest_entity_scene_node',
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value', build_parts..'TECH/CUBEROOM_PLANTERMEGA/INTERACTION.ENTITY.MBIN'},
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				SEC_ADD_NAMED		= 'harvest_entity_scene_node',
			}
		}
	}
}}}}
