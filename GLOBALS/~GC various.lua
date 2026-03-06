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
	NMS_VERSION			= '6.24',
	MOD_BATCHNAME		= '+GLOBALS ~@~collection',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|GC gravitygun|
		MBIN_FILE_SOURCE	= 'GCGRAVITYGUNGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'PushForceUpComponent',	0.12},	-- 0.16
					{'PushPower',				22},	-- 20
					{'PushPowerSentinel',		10},	-- 5
				}
			}
		}
	},
	{--	|GC buildableship| corvette
		MBIN_FILE_SOURCE	= 'GCBUILDABLESHIPGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'ComplexityLimitWarningNX',80	},	-- 40
					{'ComplexityLimitWarning',	200	}	-- 100
				}
			}
		}
	},
	{--	|GC building|
		MBIN_FILE_SOURCE	= 'GCBUILDINGGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'BuildingPlacementScaleMinMax',
				VALUE_CHANGE_TABLE 	= {
					{'X',						0.1	},	-- 0.25
					{'Y',						5	}	-- 3
				}
			},
			{
				VALUE_CHANGE_TABLE 	= {
					{'UnknownBuildingRange',					800	},	-- 600
					{'MarkerLineWidth',							2	},	-- 4
					{'MaxShipScanBuildings',					3	},	-- 2

					--- normal game
					{'BuildingPlacementMaxConnectionLength',	1800},	-- 200
					{'BuildingPlacementMaxDistance',			100	},	-- 50
					{'BuildingPlacementMaxShipBaseRadius',		100	},	-- 40
					{'BuildingPlacementDefaultMinDistance',		1	},	-- 3
					{'BaseRadiusExtension',						30	},	-- 50
					{'MinRadiusForBases',						150	},	-- 300
					{'MaxRadiusForPlanetBases',				 	2000},	-- 1000

					--- Extension for basebuilding
					-- {'BaseRadiusExtension',					100},
					-- {'MinRadiusForBases',					1600},
				}
			},
		}
	},
	{--	|GC fishing|
		MBIN_FILE_SOURCE	= 'GCFISHINGGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'FishingRange', 			50	}	-- 25
				}
			}
		}
	},
	{--	|GC graphics|
		MBIN_FILE_SOURCE	= 'GCGRAPHICSGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Ultra', 'TkGraphicsDetailPreset'},
				VALUE_CHANGE_TABLE 	= {
					{'FFXSR2Quality',			'Quality'		},
					{'MetalFXQuality',			'UltraQuality'	},
					{'AnisotropyLevel',			'_16'			},
					{'AntiAliasing',			'FFXSR2'		}
				}
			}
		}
	},
	{--	|GC fleet|
		MBIN_FILE_SOURCE	= 'GCFLEETGLOBALS.GLOBAL.MBIN',
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
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'BuildingRevealCutsceneLength',			5	}, 	-- 10
					{'SettlementMiniExpeditionSuccessChance',	0.8	}, 	-- 0.7
					{'MaxNPCPopulation',						40	}, 	-- 30
					{'AlertCycleDurationInSeconds',				24000},	-- 3400
					{'BugAttackCycleDurationInSeconds',			36000},	-- 9000
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
			{-- add MEGAPROD3 opion to builders
				PRECEDING_KEY_WORDS	= 'AutophageProductionElementsSelectable',
				ADD_OPTION			= 'AddEndSection',
				SEC_ADD_NAMED		= 'settlement_production_element',
			},

		}
	},
	{--	|GC terrain|
		MBIN_FILE_SOURCE	= 'GCTERRAINGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'SeaLevelGasGiant',		70},	-- 35
					{'SeaLevelMoon',			20},	-- 10
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
	{--	|GC freighterbase|
		MBIN_FILE_SOURCE	= 'GCFREIGHTERBASEGLOBALS.GLOBAL.MBIN',
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
