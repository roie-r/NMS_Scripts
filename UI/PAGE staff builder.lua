-----------------------------------------------------------
local mod_desc = [[
  Add another slot to staff building page for substances
  (the slot content data is added in GCGAMEPLAYGLOBALS)
]]---------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__UI staff builder substance coloring.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.47',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'UI/MULTITOOL_BUILDER_PAGE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SLOT03GRP'},
				SECTION_UP_SPECIAL	= 1,
				SECTION_SAVE_TO		= 'gc_ng_uilayer_data',
			},
			{
				SECTION_EDIT 		= 'gc_ng_uilayer_data',
				SPECIAL_KEY_WORDS	= {'ID', 'SLOT03GRP'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'SLOT04GRP'},
					{'PositionX',	49.60241},
				}
			},
			{
				SECTION_EDIT 		= 'gc_ng_uilayer_data',
				SECTION_UP_SPECIAL	= 1,
				SPECIAL_KEY_WORDS	= {'ID', 'LABEL'},
				VALUE_CHANGE_TABLE 	= {
					{'Text',		''}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SLOT03GRP'},
				SECTION_UP_SPECIAL	= 1,
				ADD_OPTION			= 'AddAfterSection',
				SECTION_ADD_NAMED 	= 'gc_ng_uilayer_data',
			}
		}
	},
	-- {
		-- MBIN_FILE_SOURCE	= 'GCGAMEPLAYGLOBALS.GLOBAL.MBIN',
		-- EXML_CHANGE_TABLE	= {}
	-- }
}}}}

-- local substances = {
	-- 'FUEL1',
	-- 'FUEL2',
	-- 'OXYGEN',
	-- 'LAUNCHSUB',
	-- 'LAUNCHSUB2',
	-- 'ROCKETSUB',
	-- 'LAND1',
	-- 'LAND2',
	-- 'LAND3',
	-- 'SAND1',
	-- 'CATALYST1',
	-- 'CATALYST2',
	-- 'CAVE1',
	-- 'CAVE2',
	-- 'WATER1',
	-- 'WATER2',
	-- 'WATERPLANT',
	-- 'YELLOW2',
	-- 'RED2',
	-- 'GREEN2',
	-- 'BLUE2',
	-- 'STELLAR2',
	-- 'LUSH1',
	-- 'DUSTY1',
	-- 'TOXIC1',
	-- 'RADIO1',
	-- 'COLD1',
	-- 'HOT1',
	-- 'LAVA1',
	-- 'CREATURE1',
	-- 'ROBOT1',
	-- 'ROBOT2',
	-- 'ASTEROID1',
	-- 'ASTEROID2',
	-- 'ASTEROID3',
	-- 'GAS1',
	-- 'GAS2',
	-- 'GAS3',
	-- 'EX_YELLOW',
	-- 'EX_RED',
	-- 'EX_GREEN',
	-- 'EX_BLUE',
	-- 'AF_METAL',
	-- 'BUI_SCRAP',
	-- 'SPECIAL_POOP',
	-- 'SUNGOLD',
	-- 'SOULFRAG',
	-- 'WORMDUST',
	-- 'TIMEDUST',
	-- 'TIMEMILK'
-- }

-- local ECT = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE[2].EXML_CHANGE_TABLE

-- ECT[#ECT+1] = {
	-- SPECIAL_KEY_WORDS	= {'ItemID', 'STAFF_PART_C'},
	-- SECTION_SAVE_TO		= 'customisation_slot_item',
-- }
-- ECT[#ECT+1] = {
	-- SECTION_EDIT 		= 'customisation_slot_item',
	-- PRECEDING_KEY_WORDS = 'ActivatedDescriptorGroupIDs',
	-- REMOVE				= 'Section'
-- }
-- ECT[#ECT+1] = {
	-- SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_HEAD'},
	-- SECTION_SAVE_TO		= 'customisation_config',
-- }
-- ECT[#ECT+1] = {
	-- SECTION_EDIT 		= 'customisation_config',
	-- VALUE_CHANGE_TABLE 	= {
		-- {'SlotID',		'STAFF_COLOR'},
		-- {'LabelLocID',	'UI_BUILD_MENU_RECOLOUR_NAME'},
	-- }
-- }
-- ECT[#ECT+1] = {
	-- SECTION_EDIT 		= 'customisation_config',
	-- SPECIAL_KEY_WORDS	= {'SlotEmptyCustomisation', 'GcModularCustomisationSlotItemData.xml'},
	-- REMOVE				= 'Section'
-- }
-- ECT[#ECT+1] = {
	-- REPLACE_TYPE 		= 'All',
	-- SECTION_EDIT 		= 'customisation_config',
	-- PRECEDING_KEY_WORDS = 'GcModularCustomisationSlotItemData.xml',
	-- REMOVE				= 'Section'
-- }
-- for _,sbt in ipairs(substances) do
	-- ECT[#ECT+1] = {
		-- SECTION_EDIT 		= 'customisation_slot_item',
		-- VALUE_CHANGE_TABLE 	= {
			-- {'ItemID',		sbt}
		-- }
	-- }
	-- ECT[#ECT+1] = {
		-- SECTION_EDIT 		= 'customisation_config',
		-- PRECEDING_KEY_WORDS = 'SlottableItems',
		-- SECTION_ADD_NAMED 	= 'customisation_slot_item',
	-- }
-- end
-- ECT[#ECT+1] = {
	-- SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_POLE'},
	-- ADD_OPTION			= 'AddAfterSection',
	-- SECTION_ADD_NAMED 	= 'customisation_config',
-- }
