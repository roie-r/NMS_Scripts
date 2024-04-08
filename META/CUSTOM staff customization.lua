-------------------------------------------------------
-- dofile('LIB/_lua_2_exml.lua')
dofile('LIB/_exml_2_lua.lua')
-------------------------------------------------------
local mod_desc = [[
  Add substances to the staff parts customization list
  (UI added in UI/MULTITOOL_BUILDER_PAGE.MBIN)

  * MUST BE LAUNCHED WITH A SOURCE PRE-LOADER SCRIPT
]]-----------------------------------------------------

local function GetSubstanceIds()
	local source		= 'METADATA/REALITY/TABLES/NMS_REALITY_GCSUBSTANCETABLE.MBIN' --<< preload_source_discard
	local substances	= {}
	local gc_subs_file	= LoadRuntimeMbin(source)
	local gc_subs		= gc_subs_file and gc_subs_file.template.Table or {}

	for _,subs in ipairs(gc_subs) do
		if subs.Symbol ~= 'UI_REWARDPOP_SYM' and not subs.ID:find('TECH') then			
			substances[#substances+1] = subs.ID
		end
	end
	return substances
end

local ECT = {}
-- staff :: copy new slot header
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
-- staff :: copy and ready slot sections
ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'ItemID', 'STAFF_PART_C'},
	SECTION_SAVE_TO		= 'customisation_slot_item',
}
ECT[#ECT+1] = {
	SECTION_EDIT 		= 'customisation_slot_item',
	VALUE_CHANGE_TABLE 	= {
		{'ActivatedDescriptorGroupID', ''}
	}
}
ECT[#ECT+1] = {
	SECTION_EDIT 		= 'customisation_config',
	SPECIAL_KEY_WORDS	= {'SlotEmptyCustomisation', 'GcModularCustomisationSlotItemData.xml'},
	VALUE_CHANGE_TABLE 	= {
		{'ActivatedDescriptorGroupID', ''}
	}
}
ECT[#ECT+1] = {
	REPLACE_TYPE 		= 'All',
	SECTION_EDIT 		= 'customisation_config',
	PRECEDING_KEY_WORDS = 'GcModularCustomisationSlotItemData.xml',
	REMOVE				= 'Section'
}
-- staff :: insert new slotable items
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
-- staff :: add new slot header
ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_POLE'},
	ADD_OPTION			= 'AddAfterSection',
	SECTION_ADD_NAMED 	= 'customisation_config',
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META staff customization upgrade.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.64',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/GAMESTATE/PLAYERDATA/MODULARCUSTOMISATIONDATATABLE.MBIN',
		EXML_CHANGE_TABLE	= ECT
	}
}}}}