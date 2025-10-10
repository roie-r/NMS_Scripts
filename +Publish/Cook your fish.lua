dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
------------------------------------------------------------------------------------
local mod_desc = [[
  Add a bottle standing on the cooker's left shelf that opens the fish storage menu
]]----------------------------------------------------------------------------------
--<<M2L marker>>--

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.cook your fish',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,MIXED_TABLE',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	access fish storage from |fish flask|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/MILKBOTTLE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= ToMxml(ScNode({
					name	= 'LocFishBottle',
					ntype	= 'LOCATOR',
					attr	= {ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/FISHINGPLATFORM/ENTITIES/FISHCASES.ENTITY.MBIN'},
					child	= {
						{
							name	= 'FishBottleCollision',
							ntype	= 'COLLISION',
							form	= {ty=0.15},
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.2
							}
						}
					}
				}))
			}
		}
	},
	{--	|cook fish| access fish storage from cooker
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/COOKER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'DEPTH'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		1.2}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= ToMxml(ScNode({
					name	= 'RefFishBottle',
					ntype	= 'REFERENCE',
					form	= {tx=-0.72, ty=0.785, tz=0.62, sx=0.8, sy=0.8, sz=0.8},
					attr	= {SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/MILKBOTTLE.SCENE.MBIN'}
				}))
			}
		}
	}
}}}}