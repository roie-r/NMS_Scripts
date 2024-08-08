-------------------------------------------------------
dofile('LIB/_exml_2_lua.lua')
-------------------------------------------------------
local mod_desc = [[
  - Add texture options to ship builder menu
  - Add substances to the staff parts customization list
   * (UI added in UI/MULTITOOL_BUILDER_PAGE.MBIN)
]]-----------------------------------------------------

local ship_new_textures = {
	{
		name	= 'TOPOMAP',
		metal	= false
	},
	{
		name	= 'PAINTSWIRL',
		metal	= false
	},
	{
		name	= 'MEZO',
		metal	= false
	},
	{
		name	= 'MAYA_SNAKE',
		metal	= true
	},
	{
		name	= 'MAYA_WALL',
		metal	= true
	},
	{
		name	= 'AZTEC_DRAGON',
		metal	= false
	},
	{
		name	= 'AZTEC_FACE',
		metal	= false
	},
	{
		name	= 'CELTIC',
		metal	= true
	},
	{
		name	= 'POLYNESIA',
		metal	= false
	},
	{
		name	= 'POLYNESIA_SEA',
		metal	= true
	},
	{
		name	= 'MAORI_FACE',
		metal	= false
	},
	{
		name	= 'EASTERN',
		metal	= false
	},
	{
		name	= 'WOVEN',
		metal	= true
	},
	{
		name	= 'WOVEN2',
		metal	= true
	},
	{
		name	= 'DEMON',
		metal	= false
	},
	{
		name	= 'TARGET',
		metal	= false
	},
	{
		name	= 'SKULLS',
		metal	= true
	},
	{
		name	= 'THE_HARING',
		metal	= true
	},
}

local mbin_substances = 'METADATA/REALITY/TABLES/NMS_REALITY_GCSUBSTANCETABLE.MBIN'
local mbin_mod_custom = 'METADATA/GAMESTATE/PLAYERDATA/MODULARCUSTOMISATIONDATATABLE.MBIN'
local mbin_chr_custom = 'METADATA/GAMESTATE/PLAYERDATA/CHARACTERCUSTOMISATIONTEXTUREOPTIONDATA.MBIN'

local function AddToModCustom(the_index, mbin)
	local ECT = {}
	-- fighter :: copy GcModularCustomisationColourData
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'Fighter', 'GcModularCustomisationConfig.xml', 'RequiredTextureOption', 'PANELS'},
		SEC_SAVE_TO			= 'customisation_colour_data',
	}
	-- fighter :: insert new texture options
	for _,snk in ipairs(ship_new_textures) do
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'customisation_colour_data',
			VALUE_CHANGE_TABLE 	= {
				{'RequiredTextureOption',	snk.name},
				{'PaletteID',				snk.metal and 'SHIP_METALLIC' or 'SHIP'},
			}
		}
		ECT[#ECT+1] = {
			SPECIAL_KEY_WORDS	= {'Fighter', 'GcModularCustomisationConfig.xml'},
			PRECEDING_KEY_WORDS = 'ColourDataPriorityList',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'customisation_colour_data'
		}
	end
	-- dropship :: copy GcModularCustomisationColourData
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'Dropship', 'GcModularCustomisationConfig.xml', 'RequiredTextureOption', 'PANELS'},
		SEC_SAVE_TO			= 'customisation_colour_data',
	}
	-- dropship :: insert new texture options
	for _,snk in ipairs(ship_new_textures) do
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'customisation_colour_data',
			VALUE_CHANGE_TABLE 	= {
				{'RequiredTextureOption',	snk.name},
				{'PaletteID',				snk.metal and 'SHIP_METALLIC' or 'SHIP'},
			}
		}
		ECT[#ECT+1] = {
			SPECIAL_KEY_WORDS	= {'Dropship', 'GcModularCustomisationConfig.xml'},
			PRECEDING_KEY_WORDS = 'ColourDataPriorityList',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'customisation_colour_data'
		}
	end
	-- sailship :: copy GcModularCustomisationColourData
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'Sail', 'GcModularCustomisationConfig.xml', 'RequiredTextureOption', 'PANELS'},
		SEC_SAVE_TO			= 'customisation_colour_data',
	}
	-- sailship :: insert new texture options
	for _,snk in ipairs(ship_new_textures) do
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'customisation_colour_data',
			VALUE_CHANGE_TABLE 	= {
				{'RequiredTextureOption',	snk.name},
				{'PaletteID',				snk.metal and 'SHIP_METALLIC' or 'SHIP'},
			}
		}
		ECT[#ECT+1] = {
			SPECIAL_KEY_WORDS	= {'Sail', 'GcModularCustomisationConfig.xml'},
			PRECEDING_KEY_WORDS = 'ColourDataPriorityList',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'customisation_colour_data'
		}
	end

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

local function AddToCharCustom(the_index, mbin)
	local ECT = {}
	-- ship :: copy multilayer
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'COATING'},
		SEC_SAVE_TO			= 'multi_texture_option',
	}
	-- ship :: insert new multilayers
	for _,snk in ipairs(ship_new_textures) do
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'multi_texture_option',
			VALUE_CHANGE_TABLE 	= {
				{'TextureOptionsID',	snk.name},
				{'Option',				snk.name},
			}
		}
		ECT[#ECT+1] = {
			SPECIAL_KEY_WORDS	= {'MultiTextureOptionsID', 'SHIP_FIGHT'},
			PRECEDING_KEY_WORDS = 'Options',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'multi_texture_option'
		}
		ECT[#ECT+1] = {
			SPECIAL_KEY_WORDS	= {'MultiTextureOptionsID', 'SHIP_FIGHT'},
			PRECEDING_KEY_WORDS = 'Tips',
			ADD_OPTION			= 'AddEndSection',
			ADD					= '<Property value="NMSString0x20.xml"><Property name="Value" value="'..snk.name..'" /></Property>'
		}
	end
	-- Add to MBIN_CT
	the_index.MBIN_CT[#the_index.MBIN_CT+1] = {
		MBIN_FILE_SOURCE	= mbin,
		EXML_CHANGE_TABLE	= ECT
	}
end

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

ProcessRawExml = nil -- to silence unused_variable
function ProcessRawExml(the_index) -- called by AMUMSS
	return {
		[NormalizePath(mbin_substances, true)] = ReadSubstances(the_index, mbin_substances),
		[NormalizePath(mbin_mod_custom, true)] = AddToModCustom(the_index, mbin_mod_custom),
		[NormalizePath(mbin_chr_custom, true)] = AddToCharCustom(the_index, mbin_chr_custom),
	}
end

-------------------------------------------------------------------------------------
---	temporary location !! ---
local PROC_TEX_CT = {}
for _,src in ipairs({
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/HQTRIM_PRIMARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/HQTRIM_SECONDARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/TERTIARY.TEXTURE.MBIN'
}) do
	local ECT = {{
		SPECIAL_KEY_WORDS	= {'Name', 'PAINTED'},
		SEC_SAVE_TO			= 'procedural_texture',
	}}
	for _,snk in ipairs(ship_new_textures) do
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'procedural_texture',
			VALUE_CHANGE_TABLE 	= {
				{'Name',		snk.name},
				{'Probability',	0.005}
			}
		}
		if not src:find('TERTIARY') then
			ECT[#ECT+1] = {
				SEC_EDIT 			= 'procedural_texture',
				VALUE_MATCH			= '{%.xml$}',
				VALUE_MATCH_OPTIONS = '~=',
				VALUE_CHANGE_TABLE 	= {
					{'Palette',		src:find('/PRIM') and 'Paint' or  'Undercoat'},
					{'Multiply',	snk.multi or true},
					{'Diffuse',		'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.'..snk.name..'.DDS'},
					{'Normal',		'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.'..snk.name..'.NORMAL.DDS'},
					{'Mask',		'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.'..snk.name..'.MASKS.DDS'}
				}
			}
		end
		ECT[#ECT+1] = {
			SPECIAL_KEY_WORDS	= {'Name', 'BASE'},
			PRECEDING_KEY_WORDS = 'Textures',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'procedural_texture'
		}
	end
	PROC_TEX_CT[#PROC_TEX_CT+1] = {
		MBIN_FILE_SOURCE	= src,
		EXML_CHANGE_TABLE	= ECT
	}
end
-------------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META add customization options.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.03',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {
	{
		MBIN_CHANGE_TABLE	= {
			{
				MBIN_FILE_SOURCE 	= {
					mbin_substances,
					mbin_mod_custom,
					mbin_chr_custom
				},
				EXT_FUNC		 	= {'ProcessRawExml'}
			}
		}
	},
	{
		MBIN_CHANGE_TABLE	= PROC_TEX_CT
	}
}}