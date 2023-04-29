------------------------------------------------------
mod_desc = [[
  Decrease binoc scan and charge times
  visor focus: unknown is red / scanned is dark blue
  Change torch color and intensity
]]----------------------------------------------------

local function ColorFromHex(hex)
	local rgb = {{'R', 1}, {'G', 1}, {'B', 1}, {'A', 1}}
	for i=1, (#hex/2) do
		rgb[i][2] = tonumber(hex:sub(i*2-1, i*2), 16) * 0.00392
	end
	return rgb
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__GC GAMEPLAY.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.23',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'GCGAMEPLAYGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'UseSecondaryBiomeSubstances',			true},
					{'CargoShieldStrength',					0.72},	-- 0.5		4425
					{'NormalModeHeatBonus',					3},		-- 2
					{'ShipMiningMul',						0.8},	-- 0.2
					{'OverheatGenerosity',					1.1},	-- 1.05
					{'SurveyMaxDistance',					100},	-- 400
					{'WarpsBetweenBattles',					7},		-- 5		5054
					{'HoursBetweenBattles',					4},		-- 3
					{'TechDamageChanceShieldedMax',			0.2},	-- 0.5
					{'TechDamageChanceShieldLevelMax',		0.2},	-- 0.75
					{'ShipScanPlanetRechargeMultiplier',	0.5},	-- 1
					{'ShipScanSpaceRechargeMultiplier',		0.2},	-- 0.3
					{'AggressiveSentinelProbability',		0.08},	-- 0.13		5093
					{'LowSentinelProbability',				0.1},	-- 0.55
					{'FreighterStartPecent',				50},	-- 60
					{'ShipInteractRadius',					850},	-- 50		5279
					{'ZoomFindBuildingRange',				1000},	-- 600
					{'TorchFoV',							80},	-- 120		6102
					{'TorchStrength',						4.8},	-- 3.5
					{'TorchDimFoV',							68},	-- 65
					{'TorchDimStrength',					2.7},	-- 1.5
					{'InteractionTorchStrength',			1.2},	-- 2
					{'UndergroundTorchFoV',					66},	-- 70
					{'UndergroundTorchStrength',			3},		-- 2.5
					{'TorchOffsetY',						0.5},	-- -0.5
					{'TorchOffsetZ',						-0.85},	-- -0.75
					{'TorchFollowCameraTime',				0.08},	-- 0.15
					{'LightStrength',						1.6},	-- 1 (build selected item light)
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				PRECEDING_KEY_WORDS = 'InventoryStackLimitsOptionData',
				VALUE_CHANGE_TABLE 	= {
					{'SubstanceStackLimit',		10000},
					{'ProductStackLimit',		10000}
				}
			},
			{
				PRECEDING_KEY_WORDS = {'InventoryStackLimitsOptionData', 'High', 'MaxSubstanceStackSizes'},
				VALUE_CHANGE_TABLE 	= {
					{'Default',					10000},
					{'Personal',				10000},
					{'PersonalCargo',			10000},
					{'Ship', 					10000},
					{'ShipCargo',				10000},
					{'Freighter', 				10000},
					{'FreighterCargo',			10000},
					{'Vehicle',					10000},
					{'Chest',					10000},
					{'BaseCapsule',				10000},
					{'MaintenanceObject',		10000},
					{'UIPopup',					10000}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'TorchColour',
				VALUE_CHANGE_TABLE 	= ColorFromHex('edf7f0ff')
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = 'ToolScan',
				VALUE_CHANGE_TABLE 	= {
					{'ChargeTime',	-18}	-- 30
				}
			},
			{
				MATH_OPERATION 		= '+',
				PRECEDING_KEY_WORDS = 'ToolScanHardMode',
				VALUE_CHANGE_TABLE 	= {
					{'ChargeTime',	-60}	-- 90
				}
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
				VALUE_CHANGE_TABLE 	= ColorFromHex('0f1f2b77')
			},
			{
				PRECEDING_KEY_WORDS = 'BinocularSelectedUnknownColour',
				VALUE_CHANGE_TABLE 	= ColorFromHex('e04e4eaa')
			},
			{
				PRECEDING_KEY_WORDS = {'BuildingScanEffect', 'Colour'},
				VALUE_CHANGE_TABLE 	= ColorFromHex('1f5c7aff')
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
					{'x',			4},	-- 10
					{'y',			4}	-- 30
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FreighterTimers', 'Normal'},
				VALUE_CHANGE_TABLE 	= {
					{'x',			3},	-- 60
					{'y',			2}	-- 240
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FlybyTimers', 'High'},
				VALUE_CHANGE_TABLE 	= {
					{'x',			5},	-- 20
					{'y',			7}	-- 40
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FlybyTimers', 'Normal'},
				VALUE_CHANGE_TABLE 	= {
					{'x',			4},	-- 60
					{'y',			5}	-- 60
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = {'FlybyTimers', 'Low'},
				VALUE_CHANGE_TABLE 	= {
					{'x',			1.5},-- 200
					{'y',			2.5} -- 600
				}
			},
			{
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = 'FrigateFlybyTimer',
				VALUE_CHANGE_TABLE 	= {
					{'x',			6},	-- 600
					{'y',			6},	-- 1200
				}
			}
		}
	}
}}}}
