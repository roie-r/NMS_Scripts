---------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
---------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+  TEST 05 vehicle refiner',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',
		MBIN_FS_DISCARD		= 'TRUE',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Template', 'GcRefinerUnitComponentData.xml'},
				SECTION_UP			= 1,
				SEC_SAVE_TO			= 'refiner_unit_component',
			},
			{
				SEC_EDIT 			= 'refiner_unit_component',
				VALUE_CHANGE_TABLE 	= {
					{'VisibleMaintenanceSlots',	4},
					{'NumInputs',				3},
					{'Title',	'Vehicular Refining'}
				}
			},
		}
	},
	{
		MBIN_FILE_SOURCE = 'MODELS/COMMON/VEHICLES/BIKE/BIKE/ENTITIES/BIKE.ENTITY.MBIN',
		MXML_CHANGE_TABLE = {
			{
				PRECEDING_KEY_WORDS = 'Components',
				SEC_ADD_NAMED		= 'refiner_unit_component',
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SUIT_REFINER2'},
				SEC_SAVE_TO			= 'gc_technology_item',
			},
			{
				SEC_EDIT 			= 'gc_technology_item',
				VALUE_CHANGE_TABLE 	= {
					{'ID',					'VEHICLE_REFINER'},
					{'Filename',			'TEXTURES/UI/FRONTEND/ICONS/U4PRODUCTS/PRODUCT.WHALEBEACON.DDS'},
					{'TechnologyCategory',	'AllVehicles'},
					{'Name',				'Vehicular Refining'},
					{'NameLower',			'Vehicular Refining'},
					{'Bonus',				3},
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Table',
				SEC_ADD_NAMED		= 'gc_technology_item',
			}
		}
	}
}}}}
