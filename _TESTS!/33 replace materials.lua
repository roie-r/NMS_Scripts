--[[-----------------------------------------
 repalce material texture paths
-------------------------------------------]]

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 13 replace materials.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.45',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
--[[
	{
		-- total black (T1) bat-ship (because these 3 are missing the normal-map section)
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK/PRIMARY1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK/TERTIARY1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_E/WINGSE/TERTIARY.MATERIAL.MBIN'		-- org
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.DDS'},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMasksMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.MASKS.DDS'},
				}
			}
		}
	},
--]]
	{
		MBIN_FILE_SOURCE	= {
--[[
			-- total black shared
			'MODELS/COMMON/SPACECRAFT/SHARED/WEAPONS/SHIPGUN/PRIMARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_C/ENGINEC/PRIMARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_B/COCKPITB/PRIMARY2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_B/COCKPITB/TERTIARY.MATERIAL.MBIN',

			-- total black heavy (T3) bat-ship
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/ACCA/PRIMARY2.MATERIAL.MBIN',
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_B/WINGSB/PRIMARY.MATERIAL.MBIN',
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDLEFT/PRIMARY.MATERIAL.MBIN',
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDLEFT/TERTIARY.MATERIAL.MBIN',
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDRIGHT/PRIMARY.MATERIAL.MBIN',
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDRIGHT/TERTIARY.MATERIAL.MBIN',

			-- total black (T1) bat-ship
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSA/PRIMARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSALEFT/PRIMARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSARIGHT/PRIMARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSA/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSALEFT/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSARIGHT/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK/SUBWINGSALEFT_PRIMARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK/SUBWINGSCRIGHT_TERTIARY2.MATERIAL.MBIN',
--]]
			-- some metal in choice placements
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/ACCA/SUBWINGSC_TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_C/ENGINEC/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_A/WINGS_A/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_B/WINGSB/TERTIARY.MATERIAL.MBIN',
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_E/WINGSE/TERTIARY.MATERIAL.MBIN'		-- org
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.DDS'},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMasksMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.MASKS.DDS'},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gNormalMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.NORMAL.DDS'},
				}
			}
		}
	},
	-- {
		-- MBIN_FILE_SOURCE	= {
			-- -- WINGS_B test
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_B/WINGSB/TERTIARY.MATERIAL.MBIN',
		-- },
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.DDS'},
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'gMasksMap'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.MASKS.DDS'},
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'gNormalMap'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.NORMAL.DDS'},
				-- }
			-- }
		-- }
	-- },
	-- {
		-- MBIN_FILE_SOURCE	= {
			-- -- WINGS_B test
			-- 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_B/WINGSB/PRIMARY.MATERIAL.MBIN',
		-- },
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.DDS'},
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'gMasksMap'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.MASKS.DDS'},
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'Name', 'gNormalMap'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.NORMAL.DDS'},
				-- }
			-- }
		-- }
	-- },
}}}}
