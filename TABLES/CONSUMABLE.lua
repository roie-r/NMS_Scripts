------------------------------------------------------
mod_desc = [[
  Increase exocraft inventory size
  Vykeen monolith accepts Effigy instead of dagger
  cheaper pet slots
]]----------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE CONSUMABLE.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
	--	|CONSUMABLEs replace rewards|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/CONSUMABLEITEMTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
			--	sievert beans (cooked gamma root)
				SPECIAL_KEY_WORDS	= {'ID', 'FOOD_P_RADFARM'},
				VALUE_CHANGE_TABLE 	= {
					{'RewardID',				'TEST_REWARD_09'},
					{'CloseInventoryWhenUsed',	true}
				}
			},
			-- {
			-- --	wheat testing
				-- SPECIAL_KEY_WORDS	= {'ID', 'FOOD_P_ALL1'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'RewardID',				'R_ROGUE_TECH'},
					-- {'CloseInventoryWhenUsed',	true}
				-- }
			-- },
			{
				SPECIAL_KEY_WORDS	= {'ID', 'ALIEN_TECHBOX'},
				SECTION_SAVE_TO		= 'gc_consumable_item'
			},
			{
				SECTION_EDIT 		= 'gc_consumable_item',
				VALUE_CHANGE_TABLE 	= {
					{'ID',						'HEXCORE'},
					{'RewardID',				'RS_QUICKSILV_T'},
					{'ButtonLocID',				'UI_CONSUME'},
					{'ButtonSubLocID',			''},
					{'CloseInventoryWhenUsed',	false},
					{'DestroyItemWhenConsumed',	true}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Table',
				SECTION_ADD_NAMED 	= 'gc_consumable_item'
			},
			{
				SECTION_EDIT 		= 'gc_consumable_item',
				VALUE_CHANGE_TABLE 	= {
					{'ID',						'SUPERFOOD'},
					{'RewardID',				'HEALTH_MAJOR'},
					{'CloseInventoryWhenUsed',	true},
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Table',
				SECTION_ADD_NAMED 	= 'gc_consumable_item'
			}
		}
	}
}}}}
