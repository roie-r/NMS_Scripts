-------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
-------------------------------------------------------------
local mod_desc = [[
  - Settlement landing pad fabricator pov fix
  - Enable fishing in underground rock pools
  - Increase scan discovery range for rare resources
  - green cave crystal rewards cave2
  - large living crystal reward fix
  - organic rock bio gunk reward
  - fainter resource plants light
  - Black carbon crystals instead of red (by Lo2k)
]]-----------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ MODEL planetary props',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|Settlement pad fabricator| pov fix
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/SETTLEMENT/LANDINGZONESHIPBUILDER_TERMINAL.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD_OPTION			= 'AddEndSection',
				ADD 				= AddSceneNodes({
					name	= 'CAMERAFOCUS',
					ntype	= 'JOINT',
					attr	= {JOINTINDEX = 3},
				})
			}
		}
	},
	{--	|cave rock pool fishing|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/CAVE/MEDIUMPROP/MEDIUMROCKPOOL.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', '_RockPool_AxRARELOD0','Name', 'ATTACHMENT'},
					{'Name', '_RockPool_DLOD0', 	'Name', 'ATTACHMENT'},
					{'Name', '_RockPool_ELOD0', 	'Name', 'ATTACHMENT'},
				},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', '_RockPool_AxRARELOD0'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocRockPool_X',
					ntype	= 'LOCATOR',
					form	= {ty=0.58, ry=35},
					attr	= {ATTACHMENT = 'MODELS/PLANETS/BIOMES/GAS/CRATER_LIQUID/ENTITIES/CRATER.ENTITY.MBIN'},
					child	= {
						{
							name	= 'ColRockPool_X',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Box',
								HEIGHT	= 0.1,
								WIDTH	= 2.5,
								DEPTH	= 1.5
							}
						}
					}
				})
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', '_RockPool_DLOD0'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocRockPool_D',
					ntype	= 'LOCATOR',
					form	= {tx=-0.2, ty=0.26, tz=0.3, ry=45},
					attr	= {ATTACHMENT = 'MODELS/PLANETS/BIOMES/GAS/CRATER_LIQUID/ENTITIES/CRATER.ENTITY.MBIN'},
					child	= {
						{
							name	= 'ColRockPool_D',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Box',
								HEIGHT	= 0.1,
								WIDTH	= 2.5,
								DEPTH	= 1.5
							}
						}
					}
				})
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', '_RockPool_ELOD0'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocRockPool_E',
					ntype	= 'LOCATOR',
					form	= {ty=0.93, tz=-0.1},
					attr	= {ATTACHMENT = 'MODELS/PLANETS/BIOMES/GAS/CRATER_LIQUID/ENTITIES/CRATER.ENTITY.MBIN'},
					child	= {
						{
							name	= 'ColRockPool_E',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Cylinder',
								HEIGHT	= 0.1,
								RADIUS	= 1
							}
						}
					}
				})
			}
		}
	},
	{--	|rares scan range| increase
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/ROLLINGPLANT/ENTITIES/ROLLINGPROP.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/GROUND/METALFORMATION/ENTITIES/METALFORMATION.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/INAIR/FLOATINGGASBAGS/ENTITIES/FLOATINGGASBAG.ENTITY.MBIN',
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
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
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'GivesReward',		'PLANT_TECH'},
					{'ScanName',		'UI_GREEN_CRYSTAL_NAME'}, -- UI_CAVE2_NAME_L
					{'ScanIconType',	'CaveSubstance'}
				}
			}
		}
	},
	{--	|large crystal shard| reward fix
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/CRYSTALS/SENTINELCRYSTALDRONE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE	= {
					{'Value', 'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/CRYSTALS/SENTINELCRYSTAL/ENTITIES/DATA.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	Barren biome |organic rock bio reward| instead of mordite
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/CRYSTALS/GEMCRYSTALS/ENTITIES/GEMCRYSTAL.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Components', 'GcSimpleInteractionComponentData'},
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'R_BREAK_BIO'}
				}
			}
		}
	},
	{--	black carbon
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/LARGE/CRYSTAL_LARGE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight1', 'Name', 'COL_R'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.4}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight1', 'Name', 'COL_G'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.15}
				}
			}
		}
	},
	{--	black carbon
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/LARGE/CRYSTAL_LARGE/CRYSTAL_LARGE.MATERIAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gCustomParams01Vec4'},
				VALUE_CHANGE_TABLE 	= {
					{'W',			0}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map',			'TEXTURES/PLANETS/BIOMES/COMMON/CRYSTALS/LARGECRYSTAL2.RED.DDS'}
				}
			}
		}
	},
	{--	black carbon
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/MEDIUM/CRYSTAL_MEDIUM.SCENE.MBIN',
			'MODELS/EFFECTS/DEBRIS/RESOURCEDEBRIS.SCENE.MBIN',
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight1', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.5}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight1', 'Name', 'COL_R'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight1', 'Name', 'COL_G'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.5}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight1', 'Name', 'COL_B'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0}
				}
			}
		}
	},
	{--	black carbon
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/MEDIUM/CRYSTAL_MEDIUM/ICEFORMATION_MAT.MATERIAL.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/SMALL/CRYSTAL_FRAGMENT/ICEFORMATION_MAT.MATERIAL.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/CRYSTALS/SMALL/CRYSTAL_SMALL/ICEFORMATION_MAT.MATERIAL.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map',			'TEXTURES/PLANETS/BIOMES/COMMON/CRYSTALS/MEDIUMCRYSTAL2.RED.DDS'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/DEBRIS/RESOURCEDEBRIS/GEMTHINGS_MINERALMAT.MATERIAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gCustomParams01Vec4'},
				VALUE_CHANGE_TABLE 	= {
					{'W',			0}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map',			'TEXTURES/PLANETS/BIOMES/CRYSTAL/LARGEPROP/MINERAL2.BASE.DDS'}
				}
			}
		}
	},
	{--	reduced |commodity+tech plant light|
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/COMMODITYPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/TECHPLANT1.SCENE.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		'@ * 0.1'}
				}
			}
		}
	},
	{--	reduced |lush+impulse bean light|
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/BIOMESPECPLANTS/LUSHPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/COOKING/IMPULSEBEANS.SCENE.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		'@ * 0.2'}
				}
			}
		}
	},
	{--	reduced |fuel plant light|
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/FUELPLANT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		'@ * 0.9'}
				}
			}
		}
	},
}}}}
