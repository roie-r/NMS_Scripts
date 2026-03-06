-------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
-------------------------------------------------------------------------
local mod_desc = [[
  - slower wings folding anim
  - move the bobble in the sentinel cockpit to a less intrusive location
  - add side engines trails
  - remove red glow in cockpit from selected sections
  - wingB blue glow
  - remove shiny head and 3cross head pieces (replaced with others)
  - remove non-used engine exaust (3, 4, 6)
  - removes orange and purple overlays - painted sentinels only
]]-----------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ SHIP sentinel',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.24',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|sentinel increase LOD|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/WINGSB.SCENE.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST1'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		180}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST2'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		360}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST3'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		480}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LandingLight'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|sentinel trail fix|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/ENGINEFLAMESSMALL.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'Trail'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		-0.32}
				}
			}
		}
	},
	{--	|sentinel slower anim|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/ENTITIES/ROOTJNT.ENTITY.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/ENGINEFLAMEBODY1/ENTITIES/DATA.ENTITY.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/ENGINEFLAMEL/ENTITIES/DATA.ENTITY.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/WINGSB/ENTITIES/ROOTJNT.ENTITY.MBIN'
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				-- PRECEDING_FIRST		= true,
				-- PRECEDING_KEY_WORDS = 'TkAnimationData',
				SPECIAL_KEY_WORDS	= {
					{'Components', 'TkAnimationComponentData', 'Anim', 'LANDING'},
					{'Components', 'TkAnimationComponentData', 'Anim', 'TAKEOFF'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Speed',		0.624}
				}
			}
		}
	},
	{--	|sentinel cockpit|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELCOCKPIT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
			--	move the bobble in the sentinel cockpit to a less intrusive location
				SPECIAL_KEY_WORDS	= {'Name', 'BobbleHeadLocator'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.36},		-- -0.174405
					{'TransY',		-0.338},	-- -0.330305
					{'TransZ',		1.1419},	-- 1.159586
					{'RotY',		32.3536},	-- -32.353622
					{'ScaleX',		0.8},		-- 1
					{'ScaleY',		0.8},		-- 1
					{'ScaleZ',		0.8},		-- 1
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'lightrim'},			-- high sidewall scroll glow
					{'Name', 'WireLights[LR]'},		-- sidewires scrolling glow
					{'Name', 'polySurface8398'},	-- canopy lights
					{'Name', 'Lightbase'},		 	-- map base center
					{'Name', 'MonitorL[12]'},		-- monitors glow
					{'Name', 'SentinelCable[LR]'},	-- thick cables
					{'Name', 'CableSpinner[LR]'},	-- thick cables spinning section
					-- {'Name', 'Red2'},				-- canopy scroll, Red1 ?
				},
				REMOVE = 'Section'
			},
			-- {
				-- SPECIAL_KEY_WORDS 	= {
					-- {'Name', 'HatchFrameL', 'Name', 'MATERIAL'},
					-- {'Name', 'HatchFrameR', 'Name', 'MATERIAL'},
				-- },
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Value', 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELCOCKPIT/GLASSTRIM_MAT2.MATERIAL.MBIN'}
				-- }
			-- },
		}
	},
	{--	|sentinel side engine trails|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/ENFLAMESIDESANI.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RTbodyJNT'},
				PRECEDING_KEY_WORDS	= 'Children',
				CREATE_HOS			= true,
				ADD					= AddSceneNodes(
					{ name='TrailER', ntype='LOCATOR', form={tx=-3.9336, ty=-0.51785, tz=-2.3462, ry=180} }
				)
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LTbodyJNT'},
				PRECEDING_KEY_WORDS	= 'Children',
				CREATE_HOS			= true,
				ADD					= AddSceneNodes(
					{ name='TrailEL', ntype='LOCATOR', form={tx=3.9336, ty=0.51785, tz=2.3462, ry=180} }
				)
			}
		}
	},
	{--	|sentinel blue lights| instead of red
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELCOCKPIT/LIGHTSCROLLBMAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/LIGHTSCROLLBMAT.MATERIAL.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/ROBOTS/SHARED/LIGHTDETAILBLUE.DDS'}
				}
			}
		}
	},
	{--	|sentinel wingB blue glow|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/REDGLOW_MAT2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/WINGSB/REDGLOW_MAT2.MATERIAL.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			0.4},
					{'Y',			0.66},
					{'Z',			0.8}
				}
			}
		}
	},
	{--	|sentinel cockpit eject handle glow|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/EJECTHANDLEL/EJECTVFX3MAT.MATERIAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'Section'
			}
		}
	},
	{--	|sentinel descriptor| remove shiny head and 3cross and non-used engines
	--	Each 2nd suffix replaces its preceding one
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.DESCRIPTOR.MBIN',
		MXML_CHANGE_TABLE	= (
			function()
				T = {}
				for id, sfx in pairs({
					_Lights_		= {-- front heads
						'C',	'E',
						'J',	'D',
						'C1',	'D1'
					},
					_exWingsb_		= {-- wing b top antenna
						'5sts3','NULL4'
					},
					_axWingss_		= {-- wing s top antenna
						'12',	'11'
					},
					_EngineFlame_	= {
						'3',	'1',
						'3b',	'1b',
						'4',	'2',
						'4b',	'2b',
						'6',	'5',
						'6b',	'5b'
					},
					-- _sideEngines_	= {-- wing jets with cable
						-- 'A2',	'NULL',
						-- 'A3',	'NULL1'
					-- },
					_Jets_			= {-- back jets sides
						'A',	'NULL_A',
						'B',	'NULL_B',
						'C',	'NULL_C'
					},
					_Jet			= {-- back jets top & bottom
						'Top_A', 'Top_NULL',
						'Bots_A','Bots_NULL'
					},
				}) do
					for i=1, #sfx, 2 do
						T[#T+1] = {
							SPECIAL_KEY_WORDS	= {'Id', (id..sfx[i]):upper()},
							VALUE_CHANGE_TABLE 	= {
								{'Id',			(id..sfx[i+1]):upper()},
								{'Name',		id..sfx[i+1]}
							}
						}
					end
				end
				return T
			end
		)()
	},
	{--	|sentinel wings descriptor| remove the bugged non-animated antenna from top back tail wing
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/WINGSB.DESCRIPTOR.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', '_EXTENSIONSTOP_A1', 'Id', '_ANTS_14B1'}, -- { '14b1', '15b1'}
				REMOVE				= 'Section'
			}
		}
	}
}}}}
