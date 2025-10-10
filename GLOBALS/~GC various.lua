------------------------------------------------------------
local mod_desc = [[
  uncache terrain for better LOD
  longer building detection range; longer base wiring
  longer terrain edit beam
  limit the freighter base NPC crowd
  disable ladder auto-grab; disable falling camera-view
  settlement longer alret cycle, higher population
  settlement add MEGAPROD3 opion to builders
  same (dark mode) warp tunnel in teleports
]]----------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ GC various',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_BATCHNAME		= '+GLOBALS ~@~collection',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|GC buildableship|
		MBIN_FILE_SOURCE	= 'GCBUILDABLESHIPGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'ComplexityLimitWarningNX',80	},	-- 40
					{'ComplexityLimitWarning',	200	}	-- 100
				}
			}
		}
	},
	{--	|GC fishing|
		MBIN_FILE_SOURCE	= 'GCFISHINGGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'FishingRange', 50}	-- 25
				}
			}
		}
	},
	{--	|GC graphics|
		MBIN_FILE_SOURCE	= 'GCGRAPHICSGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					-- {'LUTDistanceFlightMultiplier',	1	},	-- 0
					-- {'SunLightIntensity',			3.2	},	-- 3
					-- {'DOFFarStrengthWater',			0.2	},	-- 0
					{'ForceUncachedTerrain',		true},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Ultra', 'TkGraphicsDetailPreset'},
				VALUE_CHANGE_TABLE 	= {
					{'FFXSR2Quality',				'Quality'		},
					{'MetalFXQuality',				'UltraQuality'	},
					{'AnisotropyLevel',				'_16'			},
					{'AntiAliasing',				'FFXSR2'		},
				}
			}
		}
	},
	{--	|GC building|
		MBIN_FILE_SOURCE	= 'GCBUILDINGGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'UnknownBuildingRange',					800	},	-- 600
					{'MarkerLineWidth',							2	},	-- 4
					{'MaxShipScanBuildings',					3	},	-- 2

					--- normal game
					{'BuildingPlacementMaxDistance',			100	},	-- 50
					{'BuildingPlacementMaxConnectionLength',	1800},	-- 200
					{'BuildingPlacementDefaultMinDistance',		1	},	-- 3
					{'BaseRadiusExtension',						30	},	-- 50
					{'MinRadiusForBases',						150	},	-- 300
					{'MaxRadiusForPlanetBases',				 	2000},	-- 1000

					--- Extension for basebuilding
					-- {'BaseRadiusExtension',					100},
					-- {'MinRadiusForBases',					1600},
				}
			}
		}
	},
	{--	|GC terrain|
		MBIN_FILE_SOURCE	= 'GCTERRAINGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'TerrainEditBeamMaxRange',	120	}	-- 40
				}
			},
			{
				PRECEDING_KEY_WORDS = 'FlatteningSizes',
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'FlatteningSizes',			4}		-- 2
				}
			},
			{
				PRECEDING_KEY_WORDS = 'SubtractSizes',
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'Ignore',					0.4},	-- 0.8
					{'Ignore',					2.0},	-- 1.6
					{'Ignore',					3.8}	-- 3.2
				}
			}
		}
	},
	{--	|GC fleet|
		MBIN_FILE_SOURCE	= 'GCFLEETGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'MinFrigateDistanceFromFreighter',			500	}, -- 400
					{'MaxFrigateDistanceFromFreighter',			1400}, -- 1200
					{'FrigateDistanceMultiplierIfNoCaptialShip',0.6	}, -- 0.66
				}
			}
		}
	},
	{--	|GC settlement|
		MBIN_FILE_SOURCE	= 'GCSETTLEMENTGLOBALS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'BuildingRevealCutsceneLength',			5	}, 	-- 10
					{'SettlementMiniExpeditionSuccessChance',	0.8	}, 	-- 0.7
					{'MaxNPCPopulation',						40	}, 	-- 30
					{'AlertCycleDurationInSeconds',				34000},	-- 3400
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Product', 'FARMPROD8'},
				SEC_SAVE_TO			= 'settlement_production_element',
			},
			{
				SEC_EDIT 			= 'settlement_production_element',
				VALUE_CHANGE_TABLE 	= {
					{'Product',		'MEGAPROD3'}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'AutophageProductionElementsSelectable',
				ADD_OPTION			= 'AddEndSection',
				SEC_ADD_NAMED		= 'settlement_production_element',
			},

		}
	},
	{--	|GC freighterbase|
		MBIN_FILE_SOURCE	= 'GCFREIGHTERBASEGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'MaxTotalNPCCount',		12	},	-- 24
					{'NPCStartSpawnDelayTime',	5	},	-- 3
					{'NPCSpawnIntervalTime',	0.8	},	-- 0.1
				}
			},
			{
				PRECEDING_KEY_WORDS = 'MaxTotalCapacityOfNPCTypes',
				VALUE_CHANGE_TABLE 	= {
					{'SquadronPilot',			2	},	-- 4
					{'FrigateCaptain',			2	},	-- 4
					{'WorkerBio',				3	},	-- 6
					{'WorkerTech',				3	},	-- 6
					{'WorkerIndustry',			3	},	-- 6
				}
			}
		}
	},
	{--	|GC character|
		MBIN_FILE_SOURCE	= 'GCCHARACTERGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'LadderDistanceToAutoMount',			0	},	-- 0.4
					{'LadderCooldownAfterBeforeAutoClimb',	0	},	-- 0.6
					{'TimeNotOnGroundToUseFallingCamera',	88	},	-- 0.2
					{'TimeFallingUntilPanic',				180	},	-- 0.8
				}
			}
		}
	},
	{--	|GC robot|
		MBIN_FILE_SOURCE	= 'GCROBOTGLOBALS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'FriendlyDroneChatCooldown',			12	},	-- 5
					{'FriendlyDroneDissolveTime',			2	},	-- 1
					{'FriendlyDroneChatChanceIdle',			0.15},	-- 0.33
				}
			}
		}
	},
	{--	|GC simulation|
		MBIN_FILE_SOURCE	= 'GCSIMULATIONGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'WarpTunnelScale',			180},
					{'BlackHoleTunnelFile',		'MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN'},
					{'TeleportTunnelFile',		'MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN'},
					{'PortalTunnelFile',		'MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN'},
					{'PortalStoryTunnelFile',	'MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN'}
				}
			}
		}
	}
}}}}
