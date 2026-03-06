dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+  TEST 19 underground fishing',
	LUA_AUTHOR			= 'lMonk',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|cave pool fishing|
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
			},
			-- {
				-- SPECIAL_KEY_WORDS 	= {'Name', '_RockPool_FLOD0'},
				-- PRECEDING_KEY_WORDS	= 'Children',
				-- ADD 				= AddSceneNodes({
					-- name	= 'LocRockPool_F',
					-- ntype	= 'LOCATOR',
					-- attr	= {ATTACHMENT = 'MODELS/PLANETS/BIOMES/GAS/CRATER_LIQUID/ENTITIES/CRATER.ENTITY.MBIN'},
					-- child	= {
						-- {
							-- name	= 'ColRockPool_F1',
							-- ntype	= 'COLLISION',
							-- form	= {ty=1.1},
							-- attr	= {
								-- TYPE	= 'Cylinder',
								-- HEIGHT	= 0.1,
								-- RADIUS	= 0.8
							-- }
						-- },
						-- {
							-- name	= 'ColRockPool_F2',
							-- ntype	= 'COLLISION',
							-- form	= {tx=-1.5, ty=0.61, tz=0.2},
							-- attr	= {
								-- TYPE	= 'Cylinder',
								-- HEIGHT	= 0.1,
								-- RADIUS	= 0.8
							-- }
						-- },
						-- {
							-- name	= 'ColRockPool_F3',
							-- ntype	= 'COLLISION',
							-- form	= {tx=-0.7, ty=0.3, tz=-1.7},
							-- attr	= {
								-- TYPE	= 'Cylinder',
								-- HEIGHT	= 0.1,
								-- RADIUS	= 0.8
							-- }
						-- },
					-- }
				-- })
			-- }
		}
	},
}}}}
