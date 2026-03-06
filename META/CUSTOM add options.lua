-------------------------------------------------------
dofile('LIB/shared_lists.lua')
-- dofile('LIB/item_dictionary.lua')
dofile('Dictionary.lua')
-------------------------------------------------------
local mod_desc = [[
  - Add texture options to ship builder menu
  - Add substances to the staff parts customization list
   * (UI added in UI/MULTITOOL_BUILDER_PAGE.MBIN)
]]-----------------------------------------------------

local function AddToModCustom()
	local T = {}
	for _,ship in ipairs({'Fighter', 'Dropship', 'Sail'}) do -- 'Sail'
		-- ship :: copy GcModularCustomisationColourData
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {ship, 'GcModularCustomisationConfig', 'RequiredTextureOption', 'PANELS'},
			SEC_SAVE_TO			= 'customisation_colour_data',
		}
		-- ship :: insert new texture options
		for _,snk in ipairs(new_ship_texture) do
			if not snk.org then
				T[#T+1] = {
					SEC_EDIT 			= 'customisation_colour_data',
					VALUE_CHANGE_TABLE 	= {
						{'RequiredTextureOption',	snk.name},
						{'PaletteID',				snk.metal and 'SHIP_METALLIC' or 'SHIP'},
					}
				}
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {ship, 'GcModularCustomisationConfig'},
					PRECEDING_KEY_WORDS = 'ColourDataPriorityList',
					ADD_OPTION			= 'AddEndSection',
					SEC_ADD_NAMED		= 'customisation_colour_data'
				}
			end
		end
	end
	-- Sailship :: copy GcModularCustomisationColourData
	T[#T+1] = {
		SPECIAL_KEY_WORDS	= {'Sail', 'GcModularCustomisationConfig', 'RequiredTextureOption', 'PANELS'},
		SEC_SAVE_TO			= 'customisation_colour_data',
	}
	-- Sailship :: insert new texture options
	for _,snk in ipairs(new_ship_texture) do
		if not snk.org then
			T[#T+1] = {
				SEC_EDIT 			= 'customisation_colour_data',
				VALUE_CHANGE_TABLE 	= {
					{'RequiredTextureOption',	snk.name},
					{'PaletteID',				snk.metal and 'SHIP_METALLIC' or 'SHIP'},
				}
			}
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {'Sail', 'GcModularCustomisationConfig'},
				PRECEDING_KEY_WORDS = 'ColourDataPriorityList',
				ADD_OPTION			= 'AddEndSection',
				SEC_ADD_NAMED		= 'customisation_colour_data'
			}
		end
	end

	-- Scientific :: ready and insert new options
	T[#T+1] = {
		REPLACE_TYPE 		= 'All',
		SPECIAL_KEY_WORDS	= {
			'Scientific', 'GcModularCustomisationConfig',
			'ColourDataPriorityList', 'GcModularCustomisationColourData'
		},
		REMOVE				= 'Section'
	}
	T[#T+1] = {
		SEC_EDIT 			= 'customisation_colour_data',
		VALUE_CHANGE_TABLE 	= {
			{'RequiredTextureGroup',	'SHIP_SCI'}
		}
	}
	for _,snk in ipairs(new_ship_texture) do
		if snk.sci then
			T[#T+1] = {
				SEC_EDIT 			= 'customisation_colour_data',
				VALUE_CHANGE_TABLE 	= {
					{'RequiredTextureOption',	snk.name},
					{'PaletteID',				snk.metal and 'SHIP_METALLIC' or 'SHIP'},
				}
			}
			for col, pal in pairs(snk.palette or {}) do
				T[#T+1] = {
					SEC_EDIT 			= 'customisation_colour_data',
					SPECIAL_KEY_WORDS	= {'Title', 'CUSTOMISE_'..col},
					VALUE_CHANGE_TABLE 	= {
						  {'Palette',	pal[1]},
						  {'ColourAlt',	pal[2]},
					}
				}
			end
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {'Scientific', 'GcModularCustomisationConfig'},
				PRECEDING_KEY_WORDS = 'ColourDataPriorityList',
				ADD_OPTION			= 'AddEndSection',
				SEC_ADD_NAMED		= 'customisation_colour_data'
			}
		end
	end

	-----------------------------------------------------------------------------------------------
	-- staff :: copy new slot header
	T[#T+1] = {
		SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_HEAD'},
		SEC_SAVE_TO			= 'customisation_config',
	}
	T[#T+1] = {
		SEC_EDIT 			= 'customisation_config',
		VALUE_CHANGE_TABLE 	= {
			{'SlotID',		'STAFF_COLOR'},
			{'LabelLocID',	'UI_BUILD_MENU_RECOLOUR_NAME'},
		}
	}
	-- staff :: copy and ready slot sections
	T[#T+1] = {
		SPECIAL_KEY_WORDS	= {'ItemID', 'STAFF_PART_C'},
		SEC_SAVE_TO			= 'customisation_slot_item',
	}
	T[#T+1] = {
		SEC_EDIT 			= 'customisation_slot_item',
		VALUE_CHANGE_TABLE 	= {
			{'ActivatedDescriptorGroupID', ''}
		}
	}
	T[#T+1] = {
		SEC_EDIT 			= 'customisation_config',
		SPECIAL_KEY_WORDS	= {'SlotEmptyPreviewCustomisation', 'GcModularCustomisationSlotItemData'},
		VALUE_CHANGE_TABLE 	= {
			{'ActivatedDescriptorGroupID', ''}
		}
	}
	T[#T+1] = {
		REPLACE_TYPE 		= 'All',
		SEC_EDIT 			= 'customisation_config',
		SPECIAL_KEY_WORDS	= {'SlottableItems', 'GcModularCustomisationSlotItemData'},
		REMOVE				= 'Section'
	}
	-- staff :: insert new slotable items
	for id, dat in pairs(DICTIONARY) do
		if dat.source == 'Substance' and not id:match('^SET_.-') and not id:match('.-STAND.-') then
	-- for id, dat in pairs(DICTIONARY) do
		-- if dat.source == 'Substance' and dat.category ~= 'Currency' then
			T[#T+1] = {
				SEC_EDIT 			= 'customisation_slot_item',
				VALUE_CHANGE_TABLE 	= {
					{'ItemID',		id}
				}
			}
			T[#T+1] = {
				SEC_EDIT 			= 'customisation_config',
				PRECEDING_KEY_WORDS = 'SlottableItems',
				SEC_ADD_NAMED		= 'customisation_slot_item',
			}
		end
	end
	-- staff :: add new slot header
	T[#T+1] = {
		SPECIAL_KEY_WORDS	= {'SlotID', 'STAFF_POLE'},
		ADD_OPTION			= 'AddAfterSection',
		SEC_ADD_NAMED		= 'customisation_config',
	}
	return T
end

local function AddToCharCustom()
	local T = {}
	local prp_val = '<Property name="%s" value="%s"/>'
	-- ship :: copy multilayer
	T[#T+1] = {
		SPECIAL_KEY_WORDS	= {'MultiTextureOptionsID', 'SHIP_FIGHT', 'TextureOptionsID', 'COATING'},
		SEC_SAVE_TO			= 'multi_texture_option',
	}
	-- ship :: insert new multilayers
	for _,snk in ipairs(new_ship_texture) do
		if not snk.org then
			T[#T+1] = {
				SEC_EDIT 			= 'multi_texture_option',
				VALUE_CHANGE_TABLE 	= {
					{'TextureOptionsID',	snk.name},
					{'Option',				snk.name}
				}
			}
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {
					{'MultiTextureOptionsID', 'SHIP_FIGHT'},
					{'MultiTextureOptionsID', 'SHIP_SAIL'},
				},
				PRECEDING_KEY_WORDS = 'Options',
				ADD_OPTION			= 'AddEndSection',
				SEC_ADD_NAMED		= 'multi_texture_option'
			}
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {
					{'MultiTextureOptionsID', 'SHIP_FIGHT'},
					{'MultiTextureOptionsID', 'SHIP_SAIL'},
				},
				PRECEDING_KEY_WORDS = 'Tips',
				ADD_OPTION			= 'AddEndSection',
				ADD					= prp_val:format('Tips', snk.tip)
			}
			-- scientific :: add options and tips
			if snk.sci then
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'SHIP_SCI'},
					PRECEDING_KEY_WORDS = 'Options',
					ADD_OPTION			= 'AddEndSection',
					ADD					= prp_val:format('Options', snk.name)
				}
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'SHIP_SCI'},
					PRECEDING_KEY_WORDS = 'Tips',
					ADD_OPTION			= 'AddEndSection',
					ADD					= prp_val:format('Tips', snk.tip)
				}
			end
		end
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META add customization options',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {
	{
		MBIN_CHANGE_TABLE	= {
			{
				MBIN_FILE_SOURCE 	= 'METADATA/GAMESTATE/PLAYERDATA/MODULARCUSTOMISATIONDATATABLE.MBIN',
				EXML_CREATE			= false,
				MXML_CHANGE_TABLE	= AddToModCustom()
			},
			{
				MBIN_FILE_SOURCE 	= 'METADATA/GAMESTATE/PLAYERDATA/CHARACTERCUSTOMISATIONTEXTUREOPTIONDATA.MBIN',
				EXML_CREATE			= false,
				MXML_CHANGE_TABLE	= AddToCharCustom()
			}
		}
	}
}}

local __locale_text_import__ = {
---	New text ---
	UI_TIP_SHIP_TOPOMAP		    = {
		EN = [[Topography]],
	},
	UI_TIP_SHIP_PAINTSWIRL	    = {
		EN = [[Swirling Colours]],
	},
	UI_TIP_SHIP_MEZO			= {
		EN = [[Mezo Central]],
	},
	UI_TIP_SHIP_MAYA_SNAKE	    = {
		EN = [[Mayan Stone Serpent]],
	},
	UI_TIP_SHIP_MAYA_WALL		= {
		EN = [[Mayan Story]],
	},
	UI_TIP_SHIP_AZTEC_DRAGON	= {
		EN = [[Aztec Dragon]],
	},
	UI_TIP_SHIP_AZTEC_FACE	    = {
		EN = [[Aztec Scream]],
	},
	UI_TIP_SHIP_CELTIC		    = {
		EN = [[Celt Knot]],
	},
	UI_TIP_SHIP_POLYNESIA		= {
		EN = [[Polynesian Interlocks]],
	},
	UI_TIP_SHIP_POLYNESIA_SEA	= {
		EN = [[One With The Sea]],
	},
	UI_TIP_SHIP_MAORI_FACE	    = {
		EN = [[Maori Marked]],
	},
	UI_TIP_SHIP_EASTERN		    = {
		EN = [[Eastern Wise]],
	},
	UI_TIP_SHIP_WOVEN			= {
		EN = [[Woven Craft]],
	},
	UI_TIP_SHIP_WOVEN2		    = {
		EN = [[Woven Excellence]],
	},
	UI_TIP_SHIP_DEMON			= {
		EN = [[Floral Demon]],
	},
	UI_TIP_SHIP_TARGET		    = {
		EN = [[Vertical Target]],
	},
	UI_TIP_SHIP_SKULLS		    = {
		EN = [[Crystal Skulls]],
	},
	UI_TIP_SHIP_THE_HARING	    = {
		EN = [[All Haring]],
	},
---	Existing text overwritten ---

}--- __locale_text_import__ (do not delete)

--[[>-<LocTable>-<
--<< New texts >>--
=UI_TIP_SHIP_TOPOMAP
EN =Topography

=UI_TIP_SHIP_PAINTSWIRL
EN =Swirling Colours

=UI_TIP_SHIP_MEZO
EN =Mezo Central

=UI_TIP_SHIP_MAYA_SNAKE
EN =Mayan Stone Serpent

=UI_TIP_SHIP_MAYA_WALL
EN =Mayan Story

=UI_TIP_SHIP_AZTEC_DRAGON
EN =Aztec Dragon

=UI_TIP_SHIP_AZTEC_FACE
EN =Aztec Scream

=UI_TIP_SHIP_CELTIC
EN =Celt Knot

=UI_TIP_SHIP_POLYNESIA
EN =Polynesian Interlocks

=UI_TIP_SHIP_POLYNESIA_SEA
EN =One With The Sea

=UI_TIP_SHIP_MAORI_FACE
EN =Maori Marked

=UI_TIP_SHIP_EASTERN
EN =Eastern Wise

=UI_TIP_SHIP_WOVEN
EN =Woven Craft

=UI_TIP_SHIP_WOVEN2
EN =Woven Excellence

=UI_TIP_SHIP_DEMON
EN =Floral Demon

=UI_TIP_SHIP_TARGET
EN =Vertical Target

=UI_TIP_SHIP_SKULLS
EN =Crystal Skulls

=UI_TIP_SHIP_THE_HARING
EN =All Haring

>-<LocTable>-<]]
