------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
------------------------------------------------------
local mod_desc = [[
  Decrease binoc scan and charge times
  visor focus: unknown is red / scanned is dark blue
  Change torch color and intensity
]]----------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ GC gameplay',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.06',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'GCGAMEPLAYGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			-- {
				-- MATH_OPERATION 		= '+',
				-- PRECEDING_KEY_WORDS = 'ChanceOfPirateFreighterBattleOnWarpToSystem',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Ignore',		0.8},	-- 0
					-- {'Ignore',		0.8},	-- 0
					-- {'Ignore',		0.8},	-- 0.1
					-- {'Ignore',		0.8}	-- 0.2
				-- }
			-- },
			{
				VALUE_CHANGE_TABLE 	= {
					{'WarpsBetweenBattles',					7		},	-- 5
					{'HoursBetweenBattles',					4		},	-- 3
					{'UseSecondaryBiomeSubstances',			true	},
					{'CargoShieldStrength',					0.65	},	-- 0.5		4425
					{'NormalModeHeatBonus',					3		},	-- 2
					{'ShipMiningMul',						0.8		},	-- 0.2
					{'OverheatGenerosity',					1.1		},	-- 1.05
					{'SurveyBeginScanPercentage',			0.007	},	-- 0.01
					{'SurveyMaxDistance',					600		},	-- 400
					{'TechDamageChanceShieldedMax',			0.2		},	-- 0.5
					{'TechDamageChanceShieldLevelMax',		0.2		},	-- 0.75
					{'ShipScanPlanetRechargeMultiplier',	0.5		},	-- 1
					{'ShipScanSpaceRechargeMultiplier',		0.2		},	-- 0.3
					{'LowSentinelProbability',				0.6		},	-- 0.55
					{'ResourceReducer',						8		},	-- 10
					{'ResourceMinAmount',					2		},	-- 1
					{'ResourceMaxAmount',					3		},	-- 2
					{'ResourceCommonReducer',				4		},	-- 5
					{'ResourceCommonMinAmount',				2		},	-- 8
					{'ResourceDirtReducer',					30		},	-- 40
					{'ResourceDirtMinAmount',				2		},	-- 8
					{'ResourceDirtMaxAmount',				10		},	-- 8
					{'ShipInteractRadius',					850		},	-- 50		5279
					{'ZoomFindBuildingRange',				1000	},	-- 600
					{'TorchFoV',							110		},	-- 120		6102
					{'TorchStrength',						4.8		},	-- 3.5
					{'TorchDimFoV',							70		},	-- 65
					{'TorchDimStrength',					2.7		},	-- 1.5
					{'InteractionTorchFoV',					90		},	-- 120
					{'InteractionTorchStrength',			0.8		},	-- 2
					{'UndergroundTorchFoV',					65		},	-- 70
					{'UndergroundTorchStrength',			3		},	-- 2.5
					{'UnderwaterTorchStrengthMax',			7.2		}, -- 6
					{'UnderwaterAmbientLightStrength',		0.78	}, -- 0.75
					{'UnderwaterTorchVolumetricStrength',	0.0005	}, -- 0.005
					{'TorchOffsetY',						0.5		},	-- -0.5
					{'TorchOffsetZ',						-0.8	},	-- -0.75
					{'TorchStaffOffsetY',					0.5		},	-- -0.2
					{'TorchStaffOffsetZMin',				-0.9	},	-- -2
					{'TorchStaffOffsetZ',					-0.9	},	-- -2.5
					{'TorchFollowCameraTime',				0.08	},	-- 0.15
					{'LightStrength',						1.6		},	-- 1 (build item light)
				}
			},
			{
				PRECEDING_KEY_WORDS = 'TorchColour',
				VALUE_CHANGE_TABLE 	= Hex2VCT('ffd1f7f7')
			},
			{
				PRECEDING_KEY_WORDS = 'BinocularSelectedEffect',
				VALUE_CHANGE_TABLE 	= {
					{'BasecolourIntensity',	0.32},	-- 0.4
					{'FresnelIntensity',	-26}	-- -10
				}
			},
			{
				PRECEDING_KEY_WORDS = 'BinocularSelectedColour',
				VALUE_CHANGE_TABLE 	= Hex2VCT('770f1f2b')
			},
			{
				PRECEDING_KEY_WORDS = 'BinocularSelectedUnknownColour',
				VALUE_CHANGE_TABLE 	= Hex2VCT('aae04e4e')
			},
			{
				PRECEDING_KEY_WORDS = {'PassiveScanEffect', 'Colour'},
				VALUE_CHANGE_TABLE 	= Hex2VCT('77ffeedd')
			},
			{
				PRECEDING_KEY_WORDS = {'BuildingScanEffect', 'Colour'},
				VALUE_CHANGE_TABLE 	= Hex2VCT('ff1f5c7a')
			},
			{
				PRECEDING_KEY_WORDS = 'BuildingScanEffect',
				VALUE_CHANGE_TABLE 	= {
					{'BasecolourIntensity',	0.12},	-- 0.2
					{'FresnelIntensity',	-18},	-- 3
					{'WaveActive',			false}
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FreighterTimers', 'High'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			3},	-- 10
					{'Y',			3}	-- 30
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FreighterTimers', 'Normal'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			2},	-- 60
					{'Y',			1.5}-- 240
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FlybyTimers', 'High'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			5},	-- 20
					{'Y',			7}	-- 40
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FlybyTimers', 'Normal'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			4},	-- 60
					{'Y',			5}	-- 60
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FlybyTimers', 'Low'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			1.5},-- 200
					{'Y',			2.5} -- 600
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = 'FrigateFlybyTimer',
				VALUE_CHANGE_TABLE 	= {
					{'X',			6},	-- 600
					{'Y',			6},	-- 1200
				}
			}
		}
	}
}}}}
