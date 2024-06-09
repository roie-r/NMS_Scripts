-------------------------------------------------------
dofile('LIB/_exml_2_lua.lua')
-------------------------------------------------------
local mod_desc = [[
  Add substances to the staff parts customization list
  (UI added in UI/MULTITOOL_BUILDER_PAGE.MBIN)
]]-----------------------------------------------------

local mbin_substances = 'METADATA/REALITY/TABLES/NMS_REALITY_GCSUBSTANCETABLE.MBIN'
local mbin_mod_custom = 'METADATA/GAMESTATE/PLAYERDATA/MODULARCUSTOMISATIONDATATABLE.MBIN'

local function ReadSubstances(the_index, mbin)
	local gc_subs = ToLua(table.concat(the_index.ModdedEXMLs[NormalizePath(mbin, true)]))
	-- read substances ids
	local ids = {}
	for _,subs in ipairs(gc_subs.template.Table) do
		if subs.Symbol ~= 'UI_REWARDPOP_SYM' and not subs.ID:find('TECH') then
			ids[#ids+1] = subs.ID
		end
	end
	the_index.substance_ids = ids
	return nil
end

local function AddToMbinCT(the_index, mbin)
	local ECT = {}
	-- staff :: copy new slot header
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_HEAD'},
		SEC_SAVE_TO			= 'customisation_config',
	}
	ECT[#ECT+1] = {
		SEC_EDIT 			= 'customisation_config',
		VALUE_CHANGE_TABLE 	= {
			{'SlotID',		'STAFF_COLOR'},
			{'LabelLocID',	'UI_BUILD_MENU_RECOLOUR_NAME'},
		}
	}
	-- staff :: copy and ready slot sections
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'ItemID', 'STAFF_PART_C'},
		SEC_SAVE_TO			= 'customisation_slot_item',
	}
	ECT[#ECT+1] = {
		SEC_EDIT 			= 'customisation_slot_item',
		VALUE_CHANGE_TABLE 	= {
			{'ActivatedDescriptorGroupID', ''}
		}
	}
	ECT[#ECT+1] = {
		SEC_EDIT 			= 'customisation_config',
		SPECIAL_KEY_WORDS	= {'SlotEmptyCustomisation', 'GcModularCustomisationSlotItemData.xml'},
		VALUE_CHANGE_TABLE 	= {
			{'ActivatedDescriptorGroupID', ''}
		}
	}
	ECT[#ECT+1] = {
		REPLACE_TYPE 		= 'All',
		SEC_EDIT 			= 'customisation_config',
		PRECEDING_KEY_WORDS = 'GcModularCustomisationSlotItemData.xml',
		REMOVE				= 'Section'
	}
	-- staff :: insert new slotable items
	for _,sbt in ipairs(the_index.substance_ids) do
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'customisation_slot_item',
			VALUE_CHANGE_TABLE 	= {
				{'ItemID',		sbt}
			}
		}
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'customisation_config',
			PRECEDING_KEY_WORDS = 'SlottableItems',
			SEC_ADD_NAMED		= 'customisation_slot_item',
		}
	end
	-- staff :: add new slot header
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_POLE'},
		ADD_OPTION			= 'AddAfterSection',
		SEC_ADD_NAMED		= 'customisation_config',
	}
	
	-- Add to MBIN_CT
	the_index.MBIN_CT[#the_index.MBIN_CT+1] = {
		MBIN_FILE_SOURCE	= mbin,
		EXML_CHANGE_TABLE	= ECT
	}
end

ProcessRawExml = nil -- to silence unused_variable
function ProcessRawExml(the_index) -- called by AMUMSS
	return {
		[NormalizePath(mbin_substances, true)] = ReadSubstances(the_index, mbin_substances),
		[NormalizePath(mbin_mod_custom, true)] = AddToMbinCT(the_index, mbin_mod_custom)
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META staff customization upgrade.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.72',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE 	= {
			mbin_substances,
			mbin_mod_custom
		},
		EXT_FUNC		 	= {'ProcessRawExml'}
	}
}}}}