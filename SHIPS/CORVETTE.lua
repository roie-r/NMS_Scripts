-----------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
-----------------------------------------------------------
local mod_desc = [[
  form-fit defence field collision (instead of a box)
  Add collision to interior stairs banister
  Cockpit A+D bobble relocate, remove blinkers
  Relocate access ramp controls to the side walls
  Remove sections from ground placed teleporter
  Fix floating teleporter collision
  Add system scanner to mission panel
  Add restore health to medpod
  Arcadia thruster remove too bright light
  Titan hab doorway cable remove
]]---------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ SHIP corvette base parts',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|corvette defence field collision| replace
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/SHIELDGENERATOR_D.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Type', 'COLLISION'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Data'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					{
						name	= 'ColShieldGen1',
						ntype	= 'COLLISION',
						form	= {ty=-0.2},
						attr	= {
							TYPE	=  'Capsule',
							HEIGHT	=  2,
							RADIUS	=  0.7
						}
					},
					{
						name	= 'ColShieldGen2',
						ntype	= 'COLLISION',
						form	= {ty=-0.8},
						attr	= {
							TYPE	=  'Cylinder',
							HEIGHT	=  0.8,
							RADIUS	=  2.3
						}
					}
				})
			}
		}
	},
	{--	|corvette interior stairs banister|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/STAIRS0_INTERIOR_A.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Data'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					{
						name	= 'ColBanister1',
						ntype	= 'COLLISION',
						form	= {tx=-0.02, ty=1.7, tz=0.2, rx=54},
						attr	= {
							TYPE	= 'Box',
							HEIGHT	= 0.2,
							WIDTH	= 0.05,
							DEPTH	= 3.0
						}
					},
					{
						name	= 'ColBanister2',
						ntype	= 'COLLISION',
						form	= {tx=-0.87, ty=1.7, tz=0.2, rx=54},
						attr	= {
							TYPE	= 'Box',
							HEIGHT	= 0.2,
							WIDTH	= 0.05,
							DEPTH	= 3.0
						}
					}
				})
			}
		}
	},
	{--	|corvette cockpit A| bobble fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/COCKPIT_1X2_A.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'BobbleHeadLocator'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.17},
					{'TransY',		1.22},
					{'TransZ',		5.56},
					{'ScaleX', 		0.8},
					{'ScaleY', 		0.8},
					{'ScaleZ', 		0.8}
				}
			}
		}
	},
	{--	|corvette cockpit D| bobble fix, remove blinker
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/COCKPIT_1X2_D.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'BobbleHeadLocator'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.164},
					{'TransY',		-0.478},
					{'TransZ',		1.08},
					{'ScaleX', 		0.8},
					{'ScaleY', 		0.8},
					{'ScaleZ', 		0.8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'REFLight.-'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|corvette eject handle| remove vfx
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/EJECTHANDLEL.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'VFX'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|corvette cockpit D external| yellow handle
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/COCKPIT_1X2_D_EXT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'SUB1ext2LOD0'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|corvette ramp A controls|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/AIRLOCK_NESW_A.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'REFLight'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RampControls'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-1.35},
					{'TransY',		2.05},
					{'TransZ',		0.68}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'REFRampControl'},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		270}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'TeleporterControls'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		1.35},
					{'TransY',		2.05},
					{'TransZ',		0.68}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'REFTeleControl'},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		90}
				}
			},
		}
	},
	{--	|corvette ramp B controls|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/AIRLOCK_NESW_B.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'REFLight'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RampControls'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-1.35},
					{'TransY',		2.25},
					{'TransZ',		0.84}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'REFRampControl'},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		270}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'TeleporterControls'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		1.35},
					{'TransY',		2.25},
					{'TransZ',		0.84}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'REFTeleControl'},
				VALUE_CHANGE_TABLE 	= {
					{'RotY',		90}
				}
			},
		}
	},
	{--	|corvette teleporter bits|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/TELEPORTER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RotatingBits'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', [[MODELS\COMMON\SPACECRAFT\BIGGS\TELEPORTER|collision1]]},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		1.83}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', [[MODELS\COMMON\SPACECRAFT\BIGGS\TELEPORTER|collisionCapsule]]},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ',		-0.5}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					{
						name	= '1RefBottomFix',
						ntype	= 'REFERENCE',
						form	= {ty=-4, sx=1.44, sy=2, sz=1.44},
						attr	= {
							SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/CYLINDERSNAPSHAPE.SCENE.MBIN'
						}
					}
				})
			}
		}
	},
	{--	|corvette floating teleporter collision|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/TELEWATER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', [[MODELS\COMMON\SPACECRAFT\BIGGS\TELEWATER|collision1]]},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Trigger'},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ',		-0.8},
					{'ScaleX', 		0.45},
					{'ScaleY', 		0.85},
					{'ScaleZ', 		0.45}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					{
						name	= '1ColFloat',
						ntype	= 'COLLISION',
						form	= {ty=0.1},
						attr	= {
							TYPE	= 'Box',
							HEIGHT	= 0.5,
							WIDTH	= 3.0,
							DEPTH	= 3.0
						}
					},
					{
						name	= '1RefBottomFix',
						ntype	= 'REFERENCE',
						form	= {sx=1.36, sy=0.05, sz=1.36},
						attr	= {
							SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/CYLINDERSNAPSHAPE.SCENE.MBIN'
						}
					}
				})
			}
		}
	},
	{--	|corvette system scanner A|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/WALL_EW_A_TECH1.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocSysScan',
					ntype	= 'LOCATOR',
					form	= {tx=2.1, ty=0.98, tz=0.23},
					attr	= {
						ATTACHMENT = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/BRIDGETERMINAL.INTERACTION.ENTITY.MBIN'
					},
					child	= {
						{
							name	= 'ColSystemScan',
							ntype	= 'COLLISION',
							form	= {ty=0.4, tz=0.15},
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.26
							}
						},
						{
							name	= 'RefTransmitter',
							ntype	= 'REFERENCE',
							form	= {rx=90, s_=0.5},
							attr	= {
								SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/STATION/HOLODISPLAYMEDIUMWALL2.SCENE.MBIN'
							}
						}
					}
				})
			}
		}
	},
	{--	|corvette system scanner B|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/WALL_EW_B_TECH1.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocSysScan',
					ntype	= 'LOCATOR',
					form	= {tx=1.13, ty=0.72, tz=0.79, ry=90},
					attr	= {
						ATTACHMENT = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/BRIDGETERMINAL.INTERACTION.ENTITY.MBIN'
					},
					child	= {
						{
							name	= 'ColSystemScan',
							ntype	= 'COLLISION',
							form	= {tx=0.1, ty=0.6, tz=0.25},
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.26
							}
						},
						{
							name	= 'RefTransmitter',
							ntype	= 'REFERENCE',
							form	= {s_=0.2},
							attr	= {
								SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BUILDERS/SAILFRAME2.SCENE.MBIN'
							}
						}
					}
				})
			}
		}
	},
	{--	|corvette system scanner C|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/WALL_EW_C_TECH1.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'MPMissionTerminal'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		1},
					{'ScaleX',		0.7},
					{'ScaleY',		0.7},
					{'ScaleZ',		0.7}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocSysScan',
					ntype	= 'LOCATOR',
					form	= {ty=2.5, tz=1.3},
					attr	= {
						ATTACHMENT = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/BRIDGETERMINAL.INTERACTION.ENTITY.MBIN'
					},
					child	= {
						{
							name	= 'ColSystemScan',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.26
							}
						}
					}
				})
			}
		}
	},
	{--	|corvette medpod A| add restore health
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/WALL_EW_A_MED0.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocHealthRestore1',
					ntype	= 'LOCATOR',
					form	= {tx=-0.1, ty=1.0, tz=1.5},
					attr	= {
						ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/HEALTHSTATION/ENTITIES/MEDON.ENTITY.MBIN'
					},
					child	= {
						{
							name	= 'ColHealthRestore',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.26
							}
						},
						{
							name	= 'LocHealthRestore2',
							ntype	= 'LOCATOR',
							attr	= {
								ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/HEALTHSTATION/ENTITIES/HEALTHSTATION.ENTITY.MBIN'
							}
						}
					}
				})
			}
		}
	},
	{--	|corvette medpod B|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/WALL_EW_B_MED0.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocHealthRestore1',
					ntype	= 'LOCATOR',
					form	= {ty=1.4, tz=1.6},
					attr	= {
						ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/HEALTHSTATION/ENTITIES/MEDON.ENTITY.MBIN'
					},
					child	= {
						{
							name	= 'ColHealthRestore',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.26
							}
						},
						{
							name	= 'LocHealthRestore2',
							ntype	= 'LOCATOR',
							attr	= {
								ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/HEALTHSTATION/ENTITIES/HEALTHSTATION.ENTITY.MBIN'
							}
						}
					}
				})
			}
		}
	},
	{--	|corvette medpod C|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/WALL_EW_C_MED0.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocHealthRestore1',
					ntype	= 'LOCATOR',
					form	= {ty=1.5, tz=1.8},
					attr	= {
						ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/HEALTHSTATION/ENTITIES/MEDON.ENTITY.MBIN'
					},
					child	= {
						{
							name	= 'ColHealthRestore',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.26
							}
						},
						{
							name	= 'LocHealthRestore2',
							ntype	= 'LOCATOR',
							attr	= {
								ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/HEALTHSTATION/ENTITIES/HEALTHSTATION.ENTITY.MBIN'
							}
						}
					}
				})
			}
		}
	},
	{--	|corvette titan hab doorway cable|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/DOORWAY_NS_A.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'INTERIOR'},
				REMOVE				= 'Section'
			}
		}
	},
	-- {--	|corvette arcadia thruster light remove|
		-- MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/BIGGS/MODULES/PARTS/WING_L_L.SCENE.MBIN',
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'EngineMeshLight'},
				-- REMOVE				= 'Section'
			-- }
		-- }
	-- },
}}}}
