--------------------------------------------------------------------
local mod_desc = [[
  - varied rain and snow
  - Remove space dust and plasma
  - Remove lines, include: HUD icons, trade routes, landing pad
  - Reduce space speed lines for thrust and pulse
  - Remove smoke and trails from mech and player
  - Remove contrails
  - Remove mists fog clouds
]]-----------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__MODEL effects lines trails mist.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.50',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|remove mists|
		MBIN_FILE_SOURCE	= {
			-- sentinel/ beacon/ droppod/ builder camp
			'MODELS/EFFECTS/DEBRIS/SENTINELSHIPCRASHMIST.SCENE.MBIN',
			'MODELS/EFFECTS/DEBRIS/ROBOTCAMPMIST.SCENE.MBIN',
			-- portal
			'MODELS/EFFECTS/PORTAL/PORTALCLOUDS.SCENE.MBIN',
			-- monolith/ plaque
			'MODELS/EFFECTS/RUINS/MONOLITHCLOUDS.SCENE.MBIN',
			'MODELS/EFFECTS/RUINS/PLAQUEAMBIENTMIST.SCENE.MBIN',
			-- abandoned
			'MODELS/EFFECTS/OUTPOST/ABANDONEDBUILDINGDOORMIST.SCENE.MBIN',
			'MODELS/EFFECTS/OUTPOST/ABANDONEDTRADERBUILDINGCORRIDOR.SCENE.MBIN',
			'MODELS/EFFECTS/OUTPOST/ABANDONEDTRADERBUILDINGDOORMIST.SCENE.MBIN',
			'MODELS/EFFECTS/OUTPOST/ABANDONEDWARRIORBUILDINGDOORMIST.SCENE.MBIN',
			-- nexus
			'MODELS/EFFECTS/NEXUS/BRIDGEVOLUMELIGHTSHAFTS.SCENE.MBIN',
			'MODELS/EFFECTS/NEXUS/LANDINGBAYMIST.SCENE.MBIN',
			'MODELS/EFFECTS/NEXUS/LEFTSIDEGROUNDMIST.SCENE.MBIN',
			'MODELS/EFFECTS/NEXUS/RIGHTSIDEGROUNDMIST.SCENE.MBIN',
			'MODELS/EFFECTS/NEXUS/SPIDERGROUNDMIST.SCENE.MBIN',
			-- space station
			'MODELS/EFFECTS/STATION/GENERALFLOATINGSMOKE.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/LAUNCHTUBEFILLMIST.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/LAUNCHTUBEPIPESTEAM.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/LAUNCHTUBESTEAM.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/ENTRANCESMOKE.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/LANDINGPADSMOKELOOP.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/STATIONGROUNDMIST.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/STATIONMIST.SCENE.MBIN',
			-- pirate station
			'MODELS/EFFECTS/STATION/PIRATEFLOORMIST.SCENE.MBIN',
			'MODELS/EFFECTS/STATION/PIRATEROOFMIST.SCENE.MBIN',
			'MODELS/EFFECTS/SMOKE/GENERALFLOORSMOKE.SCENE.MBIN',
			-- living frigate
			'MODELS/EFFECTS/SPACECRAFT/LIVINGFRIGATEATMOSPHERE.SCENE.MBIN',
			-- freighter bridge
			'MODELS/EFFECTS/SPACECRAFT/BRIDGEFLOORMIST.SCENE.MBIN',
			-- derelict freighter
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/EXTERIORMAINDUST.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/SMOKECOLUMN.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/SMALLSMOKECOLUMN.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/ENTRANCESECTIONDEBRIS.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/ENTRANCESECTIONMIST.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/ENTRANCEDOORMIST.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/ENTRANCEFLOORMIST.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/ENTRANCEVOLUMELIGHT.SCENE.MBIN',
			'MODELS/EFFECTS/ABANDONEDFREIGHTER/ZEROGSPARKS.SCENE.MBIN',
			'MODELS/EFFECTS/HEAVYAIR/SPACE/ABANDONEDFREIGHTER.SCENE.MBIN',
			-- crashed freigher
			-- 'MODELS/EFFECTS/DEBRIS/CRASHEDFREIGHTERPLATFORMMIST.SCENE.MBIN',
			-- 'MODELS/EFFECTS/DEBRIS/CRASHEDFREIGHTERMIST.SCENE.MBIN',
			-- 'MODELS/EFFECTS/DEBRIS/CRASHEDFREIGHTERVENTSMOKE.SCENE.MBIN',
			-- 'MODELS/EFFECTS/DEBRIS/CRASHEDFREIGHTERSMOKE.SCENE.MBIN',
			-- 'MODELS/EFFECTS/DEBRIS/CRASHEDFREIGHTERCLOUDS.SCENE.MBIN',
			-- 'MODELS/EFFECTS/DEBRIS/LARGECRASHEDFREIGHTERCLOUDS.SCENE.MBIN',
			-- 'MODELS/EFFECTS/DEBRIS/LARGECRASHEDFREIGHTERSMOKE.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				REMOVE				= 'Section'
			}
		}
	},
	{--	|varied rain|
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
					{'NumberOfParticles',	700} -- 800
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
	{--	|snow1 partice|
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
	{--	|clean space| of dust and plasma clouds
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
	{--	|custom empty line material|
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
	{--	|no lines|
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
	{--	|pulse - Less speed lines|
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
	{--	|boost - Less speed lines|
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
	{--	|Remove jetpack smoke| effect from mech and player
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/STANDARDJETPACKFX/EMITTERS/JETPACKSMOKEEMITTER.PARTICLE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/BLUEJETPACKFX/EMITTERS/BLUEJETPACKSMOKEEMITTER.PARTICLE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/GREENJETPACKFX/EMITTERS/GREENJETPACKSMOKEEMITTER.PARTICLE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/REDJETPACKFX/EMITTERS/REDJETPACKSMOKEEMITTER.PARTICLE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/MECHJETPACKFX/EMITTERS/MECHJETEMBEREMITTER.PARTICLE.MBIN',
			'MODELS/EFFECTS/PLAYER/JETPACKEFFECTS/MECHJETPACKFX/EMITTERS/MECHJETSMOKEEMITTER.PARTICLE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE	= {
					{'StartEnabled', false}
				}
			}
		}
	},
	{--	|Remove trails| jetpack and contrails
		MBIN_FILE_SOURCE	= {
			'MODELS/EFFECTS/TRAILS/PLAYER/JETPACKTRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/PLAYER/JETPACKELECTRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/PLAYER/JETPACKFIRETRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/PLAYER/JETPACKSENTINELTRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/PLAYER/JETPACKWORMTRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/SPACECRAFT/CONTRAIL/CONTRAILTRAIL.TRAIL.MBIN',
			'MODELS/EFFECTS/TRAILS/MECH/MECHCONTRAIL.TRAIL.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'MaxPointsPerFrame', 0}
				}
			}
		}
	},
	-- {--	|tornado| particles fix !! doesn't work
		-- MBIN_FILE_SOURCE	= {
			-- 'MODELS/EFFECTS/WEATHER/TORNADODEBRIS/EMITTERS/TORNDEBRISEMITTER.PARTICLE.MBIN',
			-- 'MODELS/EFFECTS/WEATHER/TORNADODEBRIS/EMITTERS/TORNSMOKEEMITTER.PARTICLE.MBIN',
			-- 'MODELS/EFFECTS/SMOKE/TORNADOBASE/EMITTERS/BASEMOTEEMITTER.PARTICLE.MBIN',
			-- 'MODELS/EFFECTS/SMOKE/TORNADOBASE/EMITTERS/TORNADOBASEEMITTER.PARTICLE.MBIN',
			-- 'MODELS/EFFECTS/SMOKE/TORNADOBASE/EMITTERS/TORNADORINGEMITTER.PARTICLE.MBIN',
			-- 'MODELS/EFFECTS/SMOKE/TORNADOTOP/EMITTERS/SMOKEEMITTER.PARTICLE.MBIN',
			-- 'MODELS/EFFECTS/SMOKE/TORNADOTOP/EMITTERS/TOPDEBRISEMITTER.PARTICLE.MBIN',
			-- 'MODELS/EFFECTS/SMOKE/TORNADOTOP/EMITTERS/TORNADOTRINGEMITTER.PARTICLE.MBIN'
		-- },
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'EmitterQualityLevel', 'High'},
				-- }
			-- }
		-- }
	-- },
}}}}
