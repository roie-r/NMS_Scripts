----------------------------------------------------------------
mod_desc = [[
  - Remove space dust and plasma
  - Remove lines, include: HUD icons, trade routes, landing pad
  - Reduce space speed lines for thrust and pulse
  - Remove smoke and trails effect from mech and player
]]--------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__MODEL effects lines heavyair.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.08',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
	--	|varied rain|
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/HEAVYAIR/ALPINE/ALPINE2.HEAVYAIR.MBIN',
			'MODELS/EFFECTS/HEAVYAIR/ALPINE/ALPINE3.HEAVYAIR.MBIN',
			'MODELS/EFFECTS/HEAVYAIR/SWAMP/SWAMP2.HEAVYAIR.MBIN',
			'MODELS/EFFECTS/HEAVYAIR/TOXIC/TOXICRAIN1.HEAVYAIR.MBIN',
			'MODELS/EFFECTS/HEAVYAIR/TOXIC/TOXICRAIN2.HEAVYAIR.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'NumberOfParticles',	750} -- 800
				}
			},
			{
				PRECEDING_KEY_WORDS = 'AmplitudeMin',
				VALUE_CHANGE_TABLE 	= {
					{'x',			-1},
					{'y',			-1}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'AmplitudeMax',
				VALUE_CHANGE_TABLE 	= {
					{'x',			1},
					{'y',			1}
				}
			}
		}
	},
	{
	--	|snow1 partice|
		MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/HEAVYAIR/SNOW/SNOW1.HEAVYAIR.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'MinParticleLifetime',	5},
					{'MaxParticleLifetime',	10},
					{'FadeTime',			0.5}
				}
			}
		}
	},
	{
	--	|clean space| of dust and plasma clouds
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/HEAVYAIR/SPACE/SPACE2.HEAVYAIR.MBIN',
			'MODELS/EFFECTS/HEAVYAIR/SPACE/SPACEPLASMA.HEAVYAIR.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'NumberOfParticles',	0},
					{'Radius',				0}
				}
			}
		}
	},
	{
	--	|custom empty line material|
		MBIN_FILE_SOURCE	= {
			{
				'MATERIALS/LINE3D.MATERIAL.MBIN',
				'MATERIALS/LINE3D.EMPTY.MATERIAL.MBIN',
				'REMOVE'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MATERIALS/LINE3D.EMPTY.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'Section'
			}
		}
	},
	{
	--	|no lines|
		MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/LINES/LINERENDERER.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'MATERIAL'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'MATERIALS/LINE3D.EMPTY.MATERIAL.MBIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'MAXNUMLINES'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		1}
				}
			}
		}
	},
	{
	--	|pulse - Less speed lines|
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/SPEEDLINES/MINIJUMPSPEEDLINES.SPEEDLINE.MBIN',
			'MODELS/EFFECTS/SPEEDLINES/MINIJUMPSPEEDLINES2.SPEEDLINE.MBIN',
			'MODELS/EFFECTS/SPEEDLINES/MINIJUMPSPEEDLINES3.SPEEDLINE.MBIN',
			'MODELS/EFFECTS/SPEEDLINES/MINIJUMPSPEEDLINES4.SPEEDLINE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'Preserve',
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'NumberOfParticles',	0.05},
					{'Length',				2},
					{'RemoveCylinderRadius',2},
					{'FadeTime',			0.5}
				}
			}
		}
	},
	{
	--	|boost - Less speed lines|
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/SPEEDLINES/SPACE.SPEEDLINE.MBIN',
			'MODELS/EFFECTS/SPEEDLINES/SPACE2.SPEEDLINE.MBIN',
			'MODELS/EFFECTS/SPEEDLINES/SPACEBIG.SPEEDLINE.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'Preserve',
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'NumberOfParticles',	0.02},
					{'Length',				2},
					{'RemoveCylinderRadius',2},
				}
			},
			{
				MATH_OPERATION 		= '+',
				VALUE_CHANGE_TABLE 	= {
					{'MinVisibleSpeed',		5}
				}
			}
		}
	},
	{
	--	|Remove smoke and trails| effect from mech and player
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/BLUEJETPACKFX.SCENE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/GREENJETPACKFX.SCENE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/REDJETPACKFX.SCENE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/STANDARDJETPACKFX.SCENE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/MECHJETPACKFX.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'Children',
				REMOVE				= 'Section'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/TRAILS/PLAYER/JETPACKTRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/PLAYER/JETPACKWORMTRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/MECH/MECHCONTRAIL.TRAIL.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Width',				0},
					{'Points',				0},
					{'MaxPointsPerFrame',	0},
					{'DistanceThreshold',	0},
					{'PointLife',			0}
				}
			}
		}
	},
	-- {
	-- --	|heavyair alien|
		-- MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/HEAVYAIR/ALIEN/ALIEN.HEAVYAIR.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'NumberOfParticles', 2000}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'TwinkleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0},
					-- {'y',			0.3}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMin',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			-0.04},
					-- {'y',			-0.04},
					-- {'z',			-0.04}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMax',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.04},
					-- {'y',			0.04},
					-- {'z',			0.04}
				-- }
			-- }
		-- }
	-- },
	-- {
	-- --	|heavyair earth|
		-- MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/HEAVYAIR/EARTH/EARTH.HEAVYAIR.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'NumberOfParticles', 400}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'ScaleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.2}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'TwinkleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0},
					-- {'y',			0.2}, -- 0.1
					-- {'z',			0}
				-- }
			-- }
		-- }
	-- },
	-- {
	-- --	|heavyair earth2|
		-- MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/HEAVYAIR/EARTH/EARTH2.HEAVYAIR.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'NumberOfParticles',400},
					-- {'FadeTime',		 0.5}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'ScaleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.2}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'TwinkleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0},	  -- 0.01
					-- {'y',			0.3}, -- 1
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMin',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'y',			-0.02}, -- -0.01
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMax',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.03},
					-- {'y',			0.02},
					-- {'z',			0.03}
				-- }
			-- }
		-- }
	-- },
	-- {
	-- --	|heavyair fogswamp|
		-- MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/HEAVYAIR/FOGSWAMP/FOGSWAMP.HEAVYAIR.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'NumberOfParticles',400}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'ScaleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.02}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'TwinkleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0},
					-- {'y',			0.2},
					-- {'z',			0}
				-- }
			-- }
		-- }
	-- },
	-- {
	-- --	|heavyair fogswamp02|
		-- MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/HEAVYAIR/FOGSWAMP/FOGSWAMP02.HEAVYAIR.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'NumberOfParticles',400},
					-- {'FadeTime',		 0.5}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'MajorDirection',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.05}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'ScaleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.02}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'TwinkleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0},
					-- {'y',			0.3},
					-- {'z',			0}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMin',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'y',			-0.02},
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMax',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.03},
					-- {'y',			0.02},
					-- {'z',			0.03}
				-- }
			-- }
		-- }
	-- },
	-- {
	-- --	|heavyair jungle|
		-- MBIN_FILE_SOURCE	= {
			-- 'MODELS/EFFECTS/HEAVYAIR/JUNGLE/JUNGLE.HEAVYAIR.MBIN'
		-- },
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'NumberOfParticles',400}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'TwinkleRange',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0},
					-- {'y',			0.2}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMin',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			-0.03},
					-- {'y',			-0.03},
					-- {'z',			-0.03}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = 'AmplitudeMax',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'x',			0.03},
					-- {'y',			0.03},
					-- {'z',			0.03}
				-- }
			-- }
		-- }
	-- },
}}}}
