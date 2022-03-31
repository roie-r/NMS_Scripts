------------------------------------------------------
local desc = [[
  Increase exocraft inventory size
  Vykeen monolith accepts Effigy instead of dagger
  cheaper pet slots
  Add freighter cargo bulkhead to freighter tech tree
]]----------------------------------------------------

local function NewItemTreeNode(id)
	return [[
		<Property value="GcUnlockableItemTreeNode.xml">
			<Property name="Unlockable" value="]]..id..[[" />
			<Property name="Children" />
		</Property>
	]]
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE various.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.84,
	MOD_BATCHNAME		= '_TABLES ~@~collection.pak',
	MOD_DESCRIPTION		= desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		-- |INVENTORY higher vehicle inventory|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/INVENTORYTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'VehicleSmall',
				VALUE_CHANGE_TABLE 	= {
					{'MinSlots',	26},
					{'MaxSlots',	26}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'VehicleMedium',
				VALUE_CHANGE_TABLE 	= {
					{'MinSlots',	42},
					{'MaxSlots',	42}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'VehicleLarge',
				VALUE_CHANGE_TABLE 	= {
					{'MinSlots',	48},
					{'MaxSlots',	48}
				}
			}
		}
	},
	{
		-- |CONSUMABLE healthy silicon egg|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/CONSUMABLEITEMTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'FOOD_P_STELLAR'},
				VALUE_CHANGE_TABLE 	= {
					{'RewardID',				'HEALTH_MAJOR'},
					{'CloseInventoryWhenUsed',	true}
				}
			}
		}
	},
	{
		-- |COST pet slots_Effigy for monolith|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/COSTTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'WAR_FIND_PORTAL', 'Id', 'WAR_CURIO2'},
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'WAR_CURIO1'}
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Id', 'C_PET_SLOT'},
				PRECEDING_KEY_WORDS = 'Costs',
				VALUE_CHANGE_TABLE 	= {
					{'IGNORE',		0.1}
				}
			}
		}
	},
	{
		-- |UNLOCKABLE craft freight bulkehad|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/UNLOCKABLEITEMTREES.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Title', 'UI_FREIGHTER_TREE'},
				PRECEDING_KEY_WORDS = 'Children',
				SECTION_ACTIVE		= 1,
				ADD					= NewItemTreeNode('FREI_INV_TOKEN')
			}
		}
	}
}}}}
