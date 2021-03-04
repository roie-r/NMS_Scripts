--[[┎────────────────────────────────────────────────────────────────
	┃ Decrease binoc scan and charge times
	┃ Increase and tweak torch
────┸────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC GAMEPLAY.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MOD_DESCRIPTION		= 'U',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCGAMEPLAYGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				VALUE_CHANGE_TABLE 	= {
					{'OverheatGenerosity',					0.05},	-- 1.05
					{'SurveyMaxDistance',					300},	-- 400
					{'BinocMinScanTime',					-1.1},	-- 3.9
					{'BinocScanTime',						-1.1},	-- 3.9
					{'BinocCreatureScanTime',				-1},	-- 3.2
					{'RefinerProductsMadeInTimeSurvival',	1},		-- 1
					{'RefinerSubsMadeInTimeSurvival',		100},	-- 100
					{'AggressiveSentinelProbability',		-0.08},	-- 0.13
					{'AggressiveSentinelProbabilitySurvival',-0.06},-- 0.13
					{'LowSentinelProbability',				0.15},	-- 0.55
					{'LowSentinelProbabilitySurvival',		0.4},	-- 0.25
					{'MaxDronesLowSurvival',				-1},	-- 1
					{'ShipInteractRadius',					800},	-- 50
					{'ZoomFindBuildingRange',				400},	-- 600
					{'TorchFoV',							-36},	-- 100
					{'TorchStrength',						1},		-- 4
					{'TorchOffsetY',						-0.3},	-- 0.5
					{'TorchOffsetZ',						-0.4},	-- -0.2
					{'LightStrength',						1}		-- 1	(build menu item light)
				}
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = 'TorchColour',
				VALUE_CHANGE_TABLE 	= {
					{'R',			-0.08},	-- 0.95
					{'G',			-0.1},	-- 0.993
					{'B',			0.01}	-- 0.944
				}
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = 'ToolScan',
				VALUE_CHANGE_TABLE 	= {
					{'ChargeTime',	-10}	-- 30
				}
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = 'ToolScanHardMode',
				VALUE_CHANGE_TABLE 	= {
					{'ChargeTime',	-55}	-- 90
				}
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = 'ShipScan',
				VALUE_CHANGE_TABLE 	= {
					{'ChargeTime',	-3}		-- 10
				}
			},
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'BuildingScanEffect',
				VALUE_CHANGE_TABLE 	= {
					{'R',					0.12},	-- 0
					{'G',					0.36},	-- 0.7
					{'B',					0.48},	-- 1
					{'BasecolourIntensity',	0.12},	-- 0.2
					{'FresnelIntensity',	-18},	-- 3
					{'WaveActive',			false}
				}
			},
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'BinocularSelectedEffect',
				VALUE_CHANGE_TABLE 	= {
					{'BasecolourIntensity',	0.32},	-- 0.4
					{'FresnelIntensity',	-26},	-- -10
				}
			},
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'BinocularSelectedColour',
				VALUE_CHANGE_TABLE 	= {
					{'R',			0.06},	-- 0.588
					{'G',			0.16},	-- 1
					{'B',			0.32}	-- 0.639
				}
			},
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'BinocularSelectedUnknownColour',
				VALUE_CHANGE_TABLE 	= {
					{'R',			0.98},	-- 0.926
					{'G',			0.32},	-- 0.539
					{'B',			0.18}	-- 1
				}
			}
		}
	}
}}}}
