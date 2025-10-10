------------------------------------------------------
local mod_desc = [[
  edit and add new consumables
]]----------------------------------------------------

local consumable_items = {
	HEXCORE = {
		reward	= 'RS_QUICKSILV_T',
		closed	= false,
		destroy	= true
	},
	SUPERFOOD = {
		reward	= 'HEALTH_MAJOR',
		closed	= true,
		destroy	= true
	},
	CHART_BUILDER = {
		reward	= 'R_CHART_BUILDER',
		closed	= true,
		destroy	= true
	},
	ACCESS3 = {
		reward	= 'R_S19_STATION',
		closed	= true,
		destroy	= false
	},
}

local mx_ct = {
	{
	--	sievert beans (cooked gamma root)
		SPECIAL_KEY_WORDS	= {'ID', 'FOOD_P_RADFARM'},
		VALUE_CHANGE_TABLE 	= {
			{'RewardID',				'TEST_09'},
			{'CloseInventoryWhenUsed',	true}
		}
	},
	{
	--	heptaploid wheat - remove wanted
		SPECIAL_KEY_WORDS	= {'ID', 'FOOD_P_ALL1'},
		VALUE_CHANGE_TABLE 	= {
			{'RewardID',				'R_CLEAR_WANTED'}, -- DE_FOOD_HAZ1
			{'CloseInventoryWhenUsed',	true}
		}
	},
	-- {
	-- --	glass grains (cooked frost crystal)
		-- SPECIAL_KEY_WORDS	= {'ID', 'FOOD_P_COLDFARM'},
		-- VALUE_CHANGE_TABLE 	= {
			-- {'RewardID',				'R_OPEN_TREE_0'},
			-- {'CloseInventoryWhenUsed',	true}
		-- }
	-- },
	{
		SPECIAL_KEY_WORDS	= {'ID', 'ALIEN_TECHBOX'},
		SEC_SAVE_TO			= 'gc_consumable_item'
	}
}
for id, item in pairs(consumable_items) do
	mx_ct[#mx_ct+1] = {
		SEC_EDIT 			= 'gc_consumable_item',
		VALUE_CHANGE_TABLE 	= {
			{'ID',						id},
			{'RewardID',				item.reward},
			{'ButtonLocID',				item.button	or 'UI_CONSUME'},
			{'ButtonSubLocID',			''},
			{'CloseInventoryWhenUsed',	item.closed},
			{'DestroyItemWhenConsumed',	item.destroy}
		}
	}
	mx_ct[#mx_ct+1] = {
		PRECEDING_KEY_WORDS = 'Table',
		SEC_ADD_NAMED		= 'gc_consumable_item'
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY consumable',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {
		{
			MBIN_CHANGE_TABLE	= {
				{
					MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/CONSUMABLEITEMTABLE.MBIN',
					EXML_CREATE			= false,
					MXML_CHANGE_TABLE	= mx_ct
				}
			}
		}
	}
}
