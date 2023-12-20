------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/exml_2_lua.lua')
------------------------------------------------------
local mod_desc = [[
  Decrease binoc scan and charge times
  visor focus: unknown is red / scanned is dark blue
  Change torch color and intensity
  Add substances to the staff parts lists

  * MUST BE LAUNCHED WITH A SOURCE PRE-LOADER SCRIPT
]]----------------------------------------------------

local function GetSubstanceIds()
	local source		= 'METADATA/REALITY/TABLES/NMS_REALITY_GCSUBSTANCETABLE.MBIN' --<< preload_source_discard
	local substances	= {}
	local gc_subs_file	= LoadRuntimeMbin(source)
	local gc_subs		= gc_subs_file and gc_subs_file.template.Table or {}

	for _,subs in ipairs(gc_subs) do
		if subs.Symbol ~= 'UI_REWARDPOP_SYM' then
			substances[#substances+1] = subs.ID
		end
	end
	return substances
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__GC GAMEPLAY.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.47',
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
					{'CargoShieldStrength',					0.65},	-- 0.5		4425
					{'NormalModeHeatBonus',					3},		-- 2
					{'ShipMiningMul',						0.8},	-- 0.2
					{'OverheatGenerosity',					1.1},	-- 1.05
					{'SpecialTechSlotBonus',				1.32},	-- 1.25
					{'SurveyMaxDistance',					600},	-- 400
					-- {'WarpsBetweenBattles',					7},		-- 5		5054
					-- {'HoursBetweenBattles',					4},		-- 3
					{'TechDamageChanceShieldedMax',			0.2},	-- 0.5
					{'TechDamageChanceShieldLevelMax',		0.2},	-- 0.75
					{'ShipScanPlanetRechargeMultiplier',	0.5},	-- 1
					{'ShipScanSpaceRechargeMultiplier',		0.2},	-- 0.3
					{'LowSentinelProbability',				0.6},	-- 0.55
					{'FreighterStartPecent',				50},	-- 60
					{'ResourceReducer',						8},		-- 10
					{'ResourceMaxAmount',					3},		-- 2
					{'ResourceCommonReducer',				4},		-- 5
					{'ResourceDirtReducer',					30},	-- 40
					{'ShipInteractRadius',					850},	-- 50		5279
					{'ZoomFindBuildingRange',				1000},	-- 600
					{'TorchFoV',							122},	-- 120		6102
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
				VALUE_CHANGE_TABLE 	= ColorFromHex('FFD1F7F7')
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
				VALUE_CHANGE_TABLE 	= ColorFromHex('770F1F2B')
			},
			{
				PRECEDING_KEY_WORDS = 'BinocularSelectedUnknownColour',
				VALUE_CHANGE_TABLE 	= ColorFromHex('AAE04E4E')
			},
			{
				PRECEDING_KEY_WORDS = {'PassiveScanEffect', 'Colour'},
				VALUE_CHANGE_TABLE 	= ColorFromHex('77FFEEDD')
			},
			{
				PRECEDING_KEY_WORDS = {'BuildingScanEffect', 'Colour'},
				VALUE_CHANGE_TABLE 	= ColorFromHex('FF1F5C7A')
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

local ECT = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE[1].EXML_CHANGE_TABLE

ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'ItemID', 'STAFF_PART_C'},
	SECTION_SAVE_TO		= 'customisation_slot_item',
}
ECT[#ECT+1] = {
	SECTION_EDIT 		= 'customisation_slot_item',
	PRECEDING_KEY_WORDS = 'ActivatedDescriptorGroupIDs',
	REMOVE				= 'Section'
}
ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_HEAD'},
	SECTION_SAVE_TO		= 'customisation_config',
}
ECT[#ECT+1] = {
	SECTION_EDIT 		= 'customisation_config',
	VALUE_CHANGE_TABLE 	= {
		{'SlotID',		'STAFF_COLOR'},
		{'LabelLocID',	'UI_BUILD_MENU_RECOLOUR_NAME'},
	}
}
ECT[#ECT+1] = {
	SECTION_EDIT 		= 'customisation_config',
	SPECIAL_KEY_WORDS	= {'SlotEmptyCustomisation', 'GcModularCustomisationSlotItemData.xml'},
	REMOVE				= 'Section'
}
ECT[#ECT+1] = {
	REPLACE_TYPE 		= 'All',
	SECTION_EDIT 		= 'customisation_config',
	PRECEDING_KEY_WORDS = 'GcModularCustomisationSlotItemData.xml',
	REMOVE				= 'Section'
}
for _,sbt in ipairs(GetSubstanceIds()) do
	ECT[#ECT+1] = {
		SECTION_EDIT 		= 'customisation_slot_item',
		VALUE_CHANGE_TABLE 	= {
			{'ItemID',		sbt}
		}
	}
	ECT[#ECT+1] = {
		SECTION_EDIT 		= 'customisation_config',
		PRECEDING_KEY_WORDS = 'SlottableItems',
		SECTION_ADD_NAMED 	= 'customisation_slot_item',
	}
end
ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_POLE'},
	ADD_OPTION			= 'AddAfterSection',
	SECTION_ADD_NAMED 	= 'customisation_config',
}
