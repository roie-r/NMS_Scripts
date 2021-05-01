--[[┎────────────────────────────────────────────────────────────────────────────
	┃ Increase stack size for various items
	┃ Change cost of basic metal building parts to ferrites
	┃ Explosive drones craft: ship_shield + unstable_plasma * 2 + platinum * 20
	┃ Fuel oxidiser craft: ship_shield + oxygen * 60 + platinum * 20
	┃ Crago bulkhead craft: plating * 60 + poly_fibre * 5 + cryo_pump * 3
	┃ Embeded:: Ketaros icons
────┸────────────────────────────────────────────────────────────────────────--]]
Stack_Mult = {
	dat = {
		{'CRAFTPROD_SUB', 				6},
		{'FUELGEL_SUB', 				16},
		{'FOOD_INGREDIENT_SUB', 		40},
		{'FOOD_COOKED_SUB',				40},
		{'LAUNCHFUEL_SUB',				4},
		{'UI_REPAIR_KIT_SUB',			4},
		{'UI_STORMCRYSTAL_SUB',			2},
		{'UI_ALLOY_COMPLEX_SUBTITLE',	2},
		{'UI_REACTION_SUBTITLE',		2},
		{'UI_ULTRAPROD_SUBTITLE',		8},
		{'BLD_GLITCHPROP_SUBTITLE',		2}
	},
	Get = function(x)
		return {
			REPLACE_TYPE 		= 'ALL',
			SPECIAL_KEY_WORDS	= {'Value', x[1]},
			SECTION_UP			= 1,
			VALUE_CHANGE_TABLE 	= { {'StackMultiplier',	x[2]} }
		}
	end
}

K_Icons = {
	dat = {
		{'LOG_KEY',			'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.LOGKEY.DDS'},
		{'ACCESS1',			'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.ATLASPASS3.DDS'},
		{'ACCESS2',			'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.ATLASPASS2.DDS'},
		{'FRIG_TOKEN',		'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.FRIGATEMOD.DDS'},
		{'SHIP_INV_TOKEN',	'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.SHIPINV2.DDS'},
		{'FREI_INV_TOKEN',	'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.SHIPINV.DDS'},
		{'CARBON_SEAL',		'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.HERMETICS.DDS'},
		{'MEGAPROD2',		'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.QUANTUMP.DDS'},
		{'FOOD_M_CAT',		'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.MEAT.LIVER.DDS'},
		{'FOOD_M_STRIDER',	'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.MEAT.SAUSAGE.DDS'},
		{'FOOD_M_COW',		'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.MEATSTAKE.DDS'},
		{'FOOD_M_CRAB',		'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.MEATLEG.DDS'},
		{'FOOD_M_CRAB',		'TEXTURES/UI/FRONTEND/ICONS/KETAROS/PRODUCT.MEATCHUNKY.DDS'},
		{'SUMMON_GARAGE',	'TEXTURES/UI/FRONTEND/ICONS/BUILDABLE/BUILDABLE.SIGNAL.DDS'},
		{'PRODFUEL2',		'TEXTURES/UI/FRONTEND/ICONS/U4PRODUCTS/PRODUCT.OXYGENGEL2.DDS'},
		{'SHIPCHARGE',		'TEXTURES/UI/FRONTEND/ICONS/U4PRODUCTS/PRODUCT.SHIPCHARGE.DDS'}
	},
	Get = function(x)
		return {
			SPECIAL_KEY_WORDS	= {'Id', x[1]},
			PRECEDING_KEY_WORDS = 'Icon',
			VALUE_CHANGE_TABLE 	= { {'Filename', x[2]} }
		}
	end
}

K_Icons_Color = {
	dat = {
		{'Id',		'FUELPROD3',					0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'LANDPROD3',					0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'CAVEPROD3',					0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'WATERPROD3',					0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'CATAPROD3',					0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'OXYPROD3',						0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'STORM_CRYSTAL',				0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'VENTGEM',						0,	0.54,	0.26,	0.26,	nil},
		{'Id',		'SUMMON_GARAGE',				0,	0.04,	0.18,	0.26,	nil},
		{'Value',	'FRIG_BOOST_SUB',				1,	0.46,	0.52,	0.58,	'ALL'},
		{'Value',	'UI_ALLOY_SIMPLE_SUBTITLE',		1,	0.18,	0.25,	0.62, 	'ALL'},
		{'Value',	'UI_ALLOY_COMPLEX_SUBTITLE',	1,	0.18,	0.25,	0.62, 	'ALL'},
		{'Value',	'UI_REACTION_SUBTITLE',			1,	0.86,	0.66,	0.18,	'ALL'},
		{'Value',	'UI_COMPOUND_SUBTITLE',			1,	0.86,	0.66,	0.18,	'ALL'}
	},
	Get = function(x)
		return {
			REPLACE_TYPE 		= x[7],
			INTEGER_TO_FLOAT	= 'FORCE',
			SPECIAL_KEY_WORDS	= {x[1], x[2]},
			SECTION_UP			= x[3],
			VALUE_CHANGE_TABLE 	= { {'R', x[4]}, {'G', x[5]}, {'B', x[6]} }
		}
	end
}

Req_Substance = {
	dat = {
		{'M_WALL',			'LAND1',	'LAND3'},
		{'M_WALL_H',		'FUEL1',	'LAND3'},
		{'M_WALL_Q',		'LAND1',	'LAND3'},
		{'M_WALL_Q_H',		'FUEL1',	'LAND3'},
		{'M_WALLDIAGONAL',	'LAND1',	'LAND3'},
		{'M_WALL_WINDOW',	'LAND1',	'LAND3'},
		{'M_SDOOR',			'LAND1',	'LAND3'},
		{'M_DOOR',			'LAND1',	'LAND3'},
		{'M_DOOR_H',		'FUEL1',	'LAND3'},
		{'M_GDOOR',			'FUEL1',	'LAND3'},
		{'M_GDOOR_D',		'FUEL1',	'LAND3'},
		{'M_DOORWINDOW',	'LAND1',	'LAND3'},
		{'M_FLOOR',			'LAND1',	'LAND3'},
		{'M_TRIFLOOR',		'LAND1',	'LAND3'},
		{'M_TRIFLOOR_Q',	'LAND1',	'LAND3'},
		{'M_GFLOOR',		'LAND1',	'LAND3'},
		{'M_FLOOR_Q',		'LAND1',	'LAND3'},
		{'M_RAMP',			'LAND1',	'LAND3'},
		{'M_RAMP_H',		'LAND1',	'LAND3'},
		{'M_ROOF',			'LAND1',	'LAND3'},
		{'M_ROOF_M',		'FUEL1',	'LAND3'},
		{'M_ROOF_M',		'LAND1',	'LAND2'},
		{'M_ROOF_C',		'FUEL1',	'LAND3'},
		{'M_ROOF_C',		'LAND1',	'LAND2'},
		{'M_ROOF_IC',		'FUEL1',	'LAND3'},
		{'M_ROOF_IC',		'LAND1',	'LAND2'},
		{'M_ARCH',			'LAND1',	'LAND3'},
		{'M_ARCH_H',		'LAND1',	'LAND3'}
	},
	Get = function(x)
		return {
			SPECIAL_KEY_WORDS	= {'Id', x[1], 'ID', x[2]},
			VALUE_CHANGE_TABLE 	= { {'ID',	x[3]} }
		}
	end
}

Prod_Requirements = {
	Cargo_Bulkhead = { -- (FREI_INV_TOKEN)
		{'CASING',		'Product', 60},  -- plating
		{'COMPOUND6',	'Product', 3},	 -- cryo pump
		{'FARMPROD5',	'Product', 5}	 -- poly fibre
	},
	Build = function(tbl)
		local exml = '<Property name="Requirements">'
		for i=1, #tbl do exml = exml .. AddNewCraftPart(tbl[i]) end
		return exml .. '</Property>'
	end
}

function AddNewCraftPart(x)
	return [[
		<Property value="GcTechnologyRequirement.xml">
			<Property name="ID" value="]] .. x[1] .. [[" />
			<Property name="InventoryType" value="GcInventoryType.xml">
				<Property name="InventoryType" value="]] .. x[2] .. [[" />
			</Property>
			<Property name="Amount" value="]] .. x[3] .. [[" />
		</Property>
	]]
end

local function BuildExmlChangeTable(tbl)
	local T = {}
	for i = 1, #tbl.dat do table.insert(T, tbl.Get(tbl.dat[i])) end
	return T
end

Source_Table_Product = 'METADATA\REALITY\TABLES\NMS_REALITY_GCPRODUCTTABLE.MBIN'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE PRODUCT.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.38',
	MOD_BATCHNAME		= '_TABLES ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= Source_Table_Product,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(K_Icons)
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Product,
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FRIG_BOOST_SPD'},
				PRECEDING_KEY_WORDS = 'Requirements',
				ADD					= AddNewCraftPart({'OXYGEN', 'Substance', 60})
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FRIG_BOOST_SPD', 'ID', 'QUAD_PROD'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'SHIPCHARGE'},
					{'Amount',		1}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FRIG_BOOST_SPD', 'ID', 'ASTEROID2'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'ASTEROID3'},
					{'Amount',		20}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FRIG_BOOST_COM'},
				PRECEDING_KEY_WORDS = 'Requirements',
				ADD					= AddNewCraftPart({'GRENFUEL1', 'Product', 2})
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FRIG_BOOST_COM', 'ID', 'WALKER_PROD'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'SHIPCHARGE'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FRIG_BOOST_COM', 'ID', 'ASTEROID2'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'ASTEROID3'},
					{'Amount',		20}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'JELLY', 'ID', 'LAUNCHSUB'},
				VALUE_CHANGE_TABLE 	= {
					{'Amount',		50}	-- ancient bug fix
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FREI_INV_TOKEN'},
				VALUE_CHANGE_TABLE 	= {
					{'RecipeCost',	10},
					{'IsCraftable',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FREI_INV_TOKEN', 'Legality', 'Legal'},
				LINE_OFFSET			= 8,
				REMOVE				= 'LINE'
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FREI_INV_TOKEN'},
				ADD					= Prod_Requirements.Build(Prod_Requirements.Cargo_Bulkhead)
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Product,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Stack_Mult)
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Product,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(K_Icons_Color)
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Product,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Req_Substance)
	}
}}}}
