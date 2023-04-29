----------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/table_entry.lua')
----------------------------------------------------------------------
mod_desc = [[
  Increase stack sizes
  Custom icons & icon background color
  Add and edit crafting requirements
  Add new products
]]--------------------------------------

local stack_mult = {
	{'CRAFTPROD_SUB', 				4},
	{'FOOD_INGREDIENT_SUB', 		4},
	{'FOOD_COOKED_SUB',				4},
	{'LAUNCHFUEL_SUB',				5},
	{'BP_SALVAGE_SUB',				6},
	{'UI_SALVAGE_TECH_SUB',			8},
	{'UI_SENTINEL_LOOT_SUB',		8},
	{'UI_REPAIR_KIT_SUB',			2},
	{'UI_STORMCRYSTAL_SUB',			2},
	{'UI_ALLOY_COMPLEX_SUBTITLE',	2},
	{'UI_REACTION_SUBTITLE',		2},
	{'UI_MEGAPROD_SUBTITLE',		2},
	{'UI_ULTRAPROD_SUBTITLE',		8},
	{'BLD_GLITCHPROP_SUBTITLE',		2},
	{'UI_DRONE_SHARD_SUB',			12}
}
function stack_mult:GetExmlCT()
	local T = {}
	for _,x in ipairs(self) do
		T[#T+1] = {
			REPLACE_TYPE 		= 'All',
			MATH_OPERATION 		= '*',
			SPECIAL_KEY_WORDS	= {'Value', x[1]},
			SECTION_UP			= 1,
			VALUE_CHANGE_TABLE 	= { {'StackMultiplier',	x[2]} }
		}
	end
	return T
end

local replace_icons = {
	{'ACCESS1',			'PRODUCTS/KETAROS/PRODUCT.ATLASPASS3.DDS'},
	{'ACCESS2',			'PRODUCTS/KETAROS/PRODUCT.ATLASPASS2.DDS'},
	{'CARBON_SEAL',		'PRODUCTS/KETAROS/PRODUCT.HERMETICS.DDS'},
	{'MEGAPROD2',		'PRODUCTS/KETAROS/PRODUCT.QUANTUMP.DDS'},
	{'FOOD_M_MEAT',		'PRODUCTS/KETAROS/PRODUCT.MEATCHUNKY.DDS'},
	{'FOOD_M_DIPLO',	'PRODUCTS/KETAROS/PRODUCT.MEATCHUNKY.DDS'},
	{'FOOD_M_CAT',		'PRODUCTS/KETAROS/PRODUCT.MEAT.LIVER.DDS'},
	{'FOOD_M_STRIDER',	'PRODUCTS/KETAROS/PRODUCT.MEAT.SAUSAGE.DDS'},
	{'FOOD_M_COW',		'PRODUCTS/KETAROS/PRODUCT.MEATSTAKE.DDS'},
	{'FOOD_M_CRAB',		'PRODUCTS/KETAROS/PRODUCT.MEATLEG.DDS'},
	{'SUMMON_GARAGE',	'BUILDABLE/BAZAAR.ANTENNA0.DDS'},
	{'GEODE_CAVE',		'U4PRODUCTS/PRODUCT.GEODECAVE.DDS'},
	{'PRODFUEL2',		'U4PRODUCTS/PRODUCT.OXYGENGEL2.DDS'},
	{'SHIPCHARGE',		'U4PRODUCTS/PRODUCT.SHIPCHARGE.DDS'},
	{'STATION_KEY',		'PRODUCTS/PRODUCT.PIRATEINVITE.DDS'},
}
function replace_icons:GetExmlCT()
	local T = {}
	for _,x in ipairs(self) do
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', x[1]},
			PRECEDING_KEY_WORDS = 'Icon',
			VALUE_CHANGE_TABLE 	= { {'Filename', 'TEXTURES/UI/FRONTEND/ICONS/'..x[2]} }
		}
	end
	return T
end

--- if subtitle, will apply color to entire group
local icon_bg_color = {
	{'COMMODITY6_NAME',				'f3a923ff'}, -- Antimatter
	{'FUEL_JELLY_NAME',				'f3a923ff'}, -- dihydrogen jelly
	{'UI_TECHMOD_NAME',				'f3a923ff'}, -- Wiring Loom
	{'NEWPROD11_NAME',				'4d2957ff'}, -- Vortex Cube
	{'EXO_SUMMON_POD_NAME',			'0a2e42ff'}, -- Exocraft Summoning Station
	{'UI_VENTGEM_NAME',				'ccccccff'}, -- Crystal Sulphide
	{'UI_STORMCRYSTAL_NAME',		'4d2957ff'}, -- Storm Crystal	
	{'FUELGEL3_NAME',				'c61230ff'}, -- life support gel
	{'GRENFUEL1_NAME',				'c61230ff'}, -- gernade fuel
	{'HYPERFUEL1_NAME',				'c61230ff'}, -- warp fuel1
	{'HYPERFUEL2_NAME',				'c61230ff'}, -- warp fuel2
	{'UI_SUBFUEL_NAME',				'c61230ff'}, -- sub fuel	
	{'LAUNCHFUEL_SUB',				'c61230ff'}, -- ship+frigate fuel	
	{'POWERPROD_SUB',				'c01746ff'}, -- ion+ship battery	
	{'FRIG_BOOST_SUB',				'6b7882ff'}, -- Consumable Frigate Upgrade
	{'UI_ALLOY_SIMPLE_SUBTITLE',	'2e409eff'}, -- Alloy Metal
	{'UI_ALLOY_COMPLEX_SUBTITLE',	'2e409eff'}, -- Enriched Alloy Metal
	{'UI_REACTION_SUBTITLE',		'dba82eff'}, -- Enhanced Gas Product
	{'UI_COMPOUND_SUBTITLE',		'dba82eff'}, -- Manufactured Gas Product
}
function icon_bg_color:GetExmlCT()
	local function IsSingle(x, a, b)
		return x:find('NAME') and a or b
	end
	local T = {}
	for _,x in ipairs(self) do
		T[#T+1] = {
			REPLACE_TYPE 		= IsSingle(x[1], nil, 'All'),
			INTEGER_TO_FLOAT	= 'Force',
			SPECIAL_KEY_WORDS	= {IsSingle(x[1], 'Name', 'Value'), x[1]},
			SECTION_UP			= IsSingle(x[1], 0, 1),
			VALUE_CHANGE_TABLE 	= ColorFromHex(x[2])
		}
	end
	return T
end

local prod_requirements = {
	{
	---	cargo_bulkhead
		id	 = 'FREI_INV_TOKEN',
		cost = 8,
		{'CASING', 		20,		I_.PRD},	-- plating
		{'HYDRALIC',	10,		I_.PRD},	-- poly fibre
		{'COMPOUND6',	1,		I_.PRD}		-- cryo pump
	},{
	---	wiring loom
		id   = 'TECH_COMP',
		{'MICROCHIP', 	3,		I_.PRD},	-- microprocessor
		{'YELLOW2', 	80,		I_.SBT},	-- copper
		{'ASTEROID1', 	40,		I_.SBT}		-- silver
	},{
	---	anomaly detector
		id   = 'POI_LOCATOR',
		{'GEODE_SPACE', 1,		I_.PRD},	-- tritium hypercluster
		{'ASTEROID1', 	20,		I_.SBT},	-- silver
		{'ASTEROID2', 	20,		I_.SBT},	-- gold
	},{
	---	dream aerial
		id   = 'WHALE_BEACON',
		subs = true,
		{'GEODE_SPACE', 1,		I_.PRD},	-- tritium hypercluster
		{'POI_LOCATOR',	1,		I_.PRD},	-- anomaly detector
		{'FARMPROD8', 	1,		I_.PRD},	-- living glass
	},{
	---	desk chair
		id   = 'BUILDCHAIR',
		subs = true,
		{'CASING', 		1,		I_.PRD},	-- metal plating
		{'FUEL2', 		20,		I_.SBT},	-- c carbon
	},{
	---	armchair
		id   = 'BUILDCHAIR2',
		subs = true,
		{'CASING', 		1,		I_.PRD},
		{'FUEL2', 		20,		I_.SBT},
	},{
	---	adjustable chair
		id   = 'BUILDCHAIR3',
		subs = true,
		{'CASING', 		1,		I_.PRD},
		{'FUEL2', 		20,		I_.SBT},
	},{
	---	classic chair
		id   = 'BUILDCHAIR4',
		subs = true,
		{'CASING', 		1,		I_.PRD},
		{'FUEL2', 		20,		I_.SBT},
	},
	multi = true
}
function prod_requirements:GetExmlCT()
	local function BuildReqs(r)
		local reqs = {META = {'name', 'Requirements'}}
		for _,req in ipairs(r) do
			reqs[#reqs+1] = {
				META	= {'value', 'GcTechnologyRequirement.xml'},
				ID		= req[1],
				Amount	= req[2],
				Type	= {
					META	= {'Type', 'GcInventoryType.xml'},
					InventoryType	= req[3]
				}
			}
		end
		return ToExml(reqs)
	end
	local T = {}
	for _,x in ipairs(self) do
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', x.id},
			VALUE_CHANGE_TABLE 	= {
				{'RecipeCost',	x.cost or 1},
				{'IsCraftable',	true}
			}
		}
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', x.id},
			PRECEDING_KEY_WORDS	= 'Requirements',
			REMOVE				= x.subs and 'Section' or 'Line'
		}
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', x.id},
			ADD					= BuildReqs(x)
		}
	end
	return T
end

local source_table_product = 'METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE PRODUCT.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= source_table_product,
		EXML_CHANGE_TABLE	= (
			-- process all the above tables
			function()
				local T = {}
				for _,tm in ipairs({
					stack_mult,
					replace_icons,
					icon_bg_color,
					prod_requirements
				}) do
					for _,tv in ipairs(tm:GetExmlCT()) do
						T[#T+1] = tv
					end
				end
				return T
			end
		)()
	},
	{
		MBIN_FILE_SOURCE	= source_table_product,
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'JELLY'},
				PRECEDING_KEY_WORDS = 'Subtitle',
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'CRAFTPROD_SUB'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'TECH_COMP'},
				VALUE_CHANGE_TABLE 	= {
					{'ProductCategory', 'Component'}
				}
			},
			{
			--	text added in custom lang file
				SPECIAL_KEY_WORDS	= {'ID', 'GEODE_CAVE'},
				VALUE_CHANGE_TABLE 	= {
					{'Name',		'UI_GEODE_NAME_CAVE'},
					{'NameLower',	'UI_GEODE_NAME_CAVE_L'}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Table',
				ADD					= ToExml({
					[1] = ProductEntry({
						id				= 'ULTRAPRODX40',
						name			= 'PRODX40_NAME',
						namelower		= 'PRODX40_NAME_L',
						subtitle		= 'CURIO4_SUBTITLE',
						description		= 'PRODX40_DESC',
						basevalue		= 624000000,
						color			= {c='ccccccff'},
						category		= 'Special',
						type			= 'Tradeable',
						rarity			= 'Rare',
						legality		= 'Legal',
						iscraftable		= true,
						requirements	= {
							{'ULTRAPROD1', 		20,	I_.PRD},
							{'ULTRAPROD2', 		20,	I_.PRD}
						},
						stackmultiplier	= 16,
						icon			= 'TEXTURES/UI/FRONTEND/ICONS/U4PRODUCTS/PRODUCT.CAPTUREDNANODE.DDS'
					}),
					[2] = ProductEntry({
						id				= 'SUPERFOOD',
						name			= 'SUPERFOOD_NAME',
						namelower		= 'SUPERFOOD_NAME_L',
						subtitle		= 'PROD_NIP_SUBTITLE',
						description		= 'SUPERFOOD_DESC',
						basevalue		= 2,
						color			= {c='1a273dff'},
						category		= 'Exotic',
						type			= 'Consumable',
						rarity			= 'Rare',
						legality		= 'Legal',
						consumable		= true,
						requirements	= {
							{'SENTINEL_LOOT',	2,	I_.PRD},
							{'FOOD_V_ROBOT',	2,	I_.PRD},
							{'STELLAR2',		50,	I_.SBT}
						},
						stackmultiplier	= 20,
						icon			= 'TEXTURES/UI/FRONTEND/ICONS/PRODUCTS/PRODUCT.GLOWPELLET.DDS'
					})
				})
			}
		}
	}
}}}}
