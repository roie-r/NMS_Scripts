----------------------------------------
dofile('LIB/_lua_2_exml.lua')
dofile('LIB/table_entry.lua')
----------------------------------------
local mod_desc = [[
  Increase stack sizes
  Custom icons & icon background color
  Add and edit crafting requirements
  Reduce ship parts prices
  Add new products
]]--------------------------------------

local function Stack_Multiplier(T)
	for key, prd in pairs({
		CRAFTPROD_SUB				= {op='*',	sm=4},
		FOOD_INGREDIENT_SUB			= {op='*',	sm=4},
		FOOD_COOKED_SUB				= {op='*',	sm=4},
		LAUNCHFUEL_SUB				= {op='*',	sm=5},
		BP_SALVAGE_SUB				= {op='*',	sm=6},
		UI_SALVAGE_TECH_SUB			= {op='*',	sm=8},
		SUB_DEADDRONE_SUBTITLE		= {op='+',	sm=2},
		UI_SHIP_BRAIN_CLEAN_SUB		= {op='+',	sm=2},
		UI_SENTINEL_LOOT_SUB		= {op='*',	sm=8},
		UI_REPAIR_KIT_SUB			= {op='*',	sm=2},
		UI_STORMCRYSTAL_SUB			= {op='*',	sm=2},
		UI_ALLOY_COMPLEX_SUBTITLE	= {op='*',	sm=2},
		UI_REACTION_SUBTITLE		= {op='*',	sm=2},
		UI_MEGAPROD_SUBTITLE		= {op='*',	sm=2},
		UI_ULTRAPROD_SUBTITLE		= {op='*',	sm=8},
		BLD_GLITCHPROP_SUBTITLE		= {op='*',	sm=2},
		UI_DRONE_SHARD_SUB			= {op='*',	sm=12},
		UI_STAFF_PART_SUB			= {op='+',	sm=1}
	}) do
		T[#T+1] = {
			REPLACE_TYPE 		= 'All',
			SPECIAL_KEY_WORDS	= {'Subtitle', key},
			VALUE_CHANGE_TABLE 	= { {'StackMultiplier', '@'..prd.op..prd.sm} }
		}
	end
end

local function Replace_Icons(T)
	for id, icon in pairs({
		CARBON_SEAL		= 'PRODUCTS/PRODUCT.MSEAL.DDS',
		STATION_KEY		= 'PRODUCTS/PRODUCT.STATION.OVERRIDE.DDS',
		FOOD_M_BALL		= 'COOKINGPRODUCTS/PRODUCT.MEAT.BRAIN.DDS',
		FOOD_M_BEETLE	= 'COOKINGPRODUCTS/PRODUCT.MEAT.CARAPACE.DDS',
		FOOD_M_BONE		= 'COOKINGPRODUCTS/PRODUCT.BONE.CRYSTAL.DDS',
		FOOD_M_CAT		= 'COOKINGPRODUCTS/PRODUCT.MEAT.LIVER.DDS',
		FOOD_M_COW		= 'COOKINGPRODUCTS/PRODUCT.MEAT.STEAK1.DDS',
		FOOD_M_CRAB		= 'COOKINGPRODUCTS/PRODUCT.MEAT.CRAB.DDS',
		FOOD_M_DIGGER	= 'COOKINGPRODUCTS/PRODUCT.MEAT.BONEY.DDS',
		FOOD_M_DIPLO	= 'COOKINGPRODUCTS/PRODUCT.MEAT.STEAK2.DDS',
		FOOD_M_DRILL	= 'COOKINGPRODUCTS/PRODUCT.MEAT.SINEW.DDS',
		FOOD_M_FISH		= 'COOKINGPRODUCTS/PRODUCT.MEAT.FISH.DDS',
		FOOD_M_FLYER	= 'COOKINGPRODUCTS/PRODUCT.MEAT.WING.DDS',
		FOOD_M_MEAT		= 'COOKINGPRODUCTS/PRODUCT.MEAT.CHUNKY.DDS',
		FOOD_M_MOLE		= 'COOKINGPRODUCTS/PRODUCT.MEAT.MOLE.DDS',
		FOOD_M_REX		= 'COOKINGPRODUCTS/PRODUCT.MEAT.SCALE.DDS',
		FOOD_M_STRIDER	= 'COOKINGPRODUCTS/PRODUCT.MEAT.SAUSAGE1.DDS',
		FOOD_V_GEK		= 'COOKINGPRODUCTS/PRODUCT.MILK.PROTO.DDS',
		FOOD_V_FLYER	= 'COOKINGPRODUCTS/PRODUCT.MILK.CRAW.DDS',
		FOOD_V_MILK		= 'COOKINGPRODUCTS/PRODUCT.MILK.WILD.DDS',
		FOOD_R_BONEMILK	= 'COOKINGPRODUCTS/PRODUCT.MILK.BONE.DDS',
		FOOD_V_BONE		= 'COOKINGPRODUCTS/PRODUCT.BONE.PIECE.DDS',
		FOOD_V_CAT		= 'COOKINGPRODUCTS/PRODUCT.MEAT.KIDNEY.DDS',
		FOOD_V_CRAB		= 'COOKINGPRODUCTS/PRODUCT.BONE.CRAB.DDS',
		FOOD_V_DIPLO	= 'COOKINGPRODUCTS/PRODUCT.EGG.GIANT.DDS',
		FOOD_V_STRIDER	= 'COOKINGPRODUCTS/PRODUCT.EGG.TALL.DDS',
		GEODE_CAVE		= 'U4PRODUCTS/PRODUCT.GEODECAVE.DDS',
		SHIPCHARGE		= 'U4PRODUCTS/PRODUCT.SHIPCHARGE.DDS',
	---	personal
		SUMMON_GARAGE	= 'BUILDABLE/BAZAAR.ANTENNA0.DDS',
		ACCESS1			= 'PRODUCTS/PRODUCT.ATLASPASS1.DDS',
		ACCESS2			= 'PRODUCTS/PRODUCT.ATLASPASS2.DDS',
		PRODFUEL2		= 'U4PRODUCTS/PRODUCT.OXYGENGEL2.DDS',
	}) do
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', id},
			PRECEDING_KEY_WORDS = 'Icon',
			VALUE_CHANGE_TABLE 	= { {'Filename', 'TEXTURES/UI/FRONTEND/ICONS/'..icon} }
		}
	end
end

--- if NAME then apply color to single item, else apply to SUBTITLE group
local function Icon_Bg_Color(T)
	local function IsSingle(x, a, b)
		return x:find('NAME') and a or b
	end
	for key, rgb in pairs({
		COMMODITY6_NAME				= 'FFF3A923', -- Antimatter
		FUEL_JELLY_NAME				= 'FFF3A923', -- dihydrogen jelly
		UI_TECHMOD_NAME				= 'FFF3A923', -- Wiring Loom
		NEWPROD11_NAME				= 'FF4D2957', -- Vortex Cube
		EXO_SUMMON_POD_NAME			= 'FF0A2E42', -- Exocraft Summoning Station
		UI_VENTGEM_NAME				= 'FFCCCCCC', -- Crystal Sulphide
		UI_STORMCRYSTAL_NAME		= 'FF4D2957', -- Storm Crystal
		FUELGEL3_NAME				= 'FFC61230', -- life support gel
		GRENFUEL1_NAME				= 'FFC61230', -- gernade fuel
		HYPERFUEL1_NAME				= 'FFC61230', -- warp fuel1
		HYPERFUEL2_NAME				= 'FFC61230', -- warp fuel2
		UI_SUBFUEL_NAME				= 'FFC61230', -- sub fuel
		LAUNCHFUEL_SUB				= 'FFC61230', -- ship+frigate fuel
		POWERPROD_SUB				= 'FFC01746', -- ion+ship battery
		FRIG_BOOST_SUB				= 'FF6B7882', -- Consumable Frigate Upgrade
		UI_ALLOY_SIMPLE_SUBTITLE	= 'FF2E409E', -- Alloy Metal
		UI_ALLOY_COMPLEX_SUBTITLE	= 'FF2E409E', -- Enriched Alloy Metal
		UI_REACTION_SUBTITLE		= 'FFDBA82E', -- Enhanced Gas Product
		UI_COMPOUND_SUBTITLE		= 'FFDBA82E', -- Manufactured Gas Product
		UI_NAV_DATA_NAME			= 'FF1A2733', -- navigation data
		UI_SHIP_CORE_C_NAME			= 'FF48A1B0', -- ship core
		UI_SHIP_CORE_B_NAME			= 'FF48A1B0', -- ship core
		UI_SHIP_CORE_A_NAME			= 'FF48A1B0', -- ship core
		UI_SHIP_CORE_S_NAME			= 'FF48A1B0', -- ship core
	}) do
		T[#T+1] = {
			REPLACE_TYPE 		= IsSingle(key, nil, 'All'),
			INTEGER_TO_FLOAT	= 'Force',
			SPECIAL_KEY_WORDS	= {IsSingle(key, 'Name', 'Subtitle'), key},
			VALUE_CHANGE_TABLE 	= ColorFromHex(rgb)
		}
	end
end

local function Prod_Requirements(T)
	local requirements = {
		BASE_TOYCORE	= {-- pocket reality generator
			subs = true,
			req	 = {
				{id='ANTIMATTER', 	n=1,	tp=IT_.PRD},	-- antimatter
				{id='CASING', 		n=1,	tp=IT_.PRD},	-- plating
			}
		},
		FREI_INV_TOKEN	= {-- cargo_bulkhead
			cost = 8,
			req	 = {
				{id='CASING', 		n=20,	tp=IT_.PRD},	-- plating
				{id='HYDRALIC',		n=10,	tp=IT_.PRD},	-- poly fibre
				{id='COMPOUND6',	n=1,	tp=IT_.PRD}		-- cryo pump
			}
		},
		TECH_COMP		= {-- wiring loom
			req	 = {
				{id='MICROCHIP',	n=3,	tp=IT_.PRD},	-- microprocessor
				{id='YELLOW2', 		n=80,	tp=IT_.SBT},	-- copper
				{id='ASTEROID1',	n=40,	tp=IT_.SBT}		-- silver
			}
		},
		POI_LOCATOR		= {-- anomaly detector
			req	 = {
				{id='GEODE_SPACE',	n=1,	tp=IT_.PRD},	-- tritium hypercluster
				{id='ASTEROID1', 	n=20,	tp=IT_.SBT},	-- silver
				{id='ASTEROID2', 	n=20,	tp=IT_.SBT}		-- gold
			}
		},
		WHALE_BEACON	= {-- dream aerial
			subs = true,
			req	 = {
				{id='GEODE_SPACE',	n=1,	tp=IT_.PRD},	-- tritium hypercluster
				{id='POI_LOCATOR',	n=1,	tp=IT_.PRD},	-- anomaly detector
				{id='FARMPROD8', 	n=1,	tp=IT_.PRD}		-- living glass
			}
		},
		BUILDCHAIR		= {-- desk chair
			subs = true,
			req	 = {
				{id='CASING', 		n=1,	tp=IT_.PRD},	-- metal plating
				{id='FUEL2', 		n=20,	tp=IT_.SBT}		-- c carbon
			}
		},
		BUILDCHAIR2		= {-- armchair
			subs = true,
			req	 = {
				{id='CASING', 		n=1,	tp=IT_.PRD},
				{id='FUEL2', 		n=20,	tp=IT_.SBT}
			}
		},
		BUILDCHAIR3		= {-- adjustable chair
			subs = true,
			req	 = {
				{id='CASING', 		n=1,	tp=IT_.PRD},
				{id='FUEL2', 		n=20,	tp=IT_.SBT}
			}
		},
		BUILDCHAIR4		= {-- classic chair
			subs = true,
			req	 = {
				{id='CASING', 		n=1,	tp=IT_.PRD},
				{id='FUEL2', 		n=20,	tp=IT_.SBT}
			}
		},
		CHART_BUILDER	= {-- Echo Locator (builder site)
			req	 = {
				{id='CHART_SETTLE',	n=1,	tp=IT_.PRD},
				{id='ROBOT2', 		n=20,	tp=IT_.SBT}
			}
		}
	}
	for id, prd in pairs(requirements) do
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', id},
			VALUE_CHANGE_TABLE 	= {
				{'RecipeCost',	prd.cost or 1},
				{'IsCraftable',	true}
			}
		}
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', id},
			PRECEDING_KEY_WORDS	= 'Requirements',
			REMOVE				= prd.subs and 'Section' or 'Line'
		}
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'ID', id},
			ADD					= ToExml(GetRequirements(prd.req))
		}
	end
end

local ECT = {}
Stack_Multiplier(ECT)
Replace_Icons(ECT)
Icon_Bg_Color(ECT)
Prod_Requirements(ECT)

ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'ID', 'DRONE_SHARD'},
	VALUE_CHANGE_TABLE 	= {
		{'ChargeValue',	40}
	}
}
ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'Name', 'FUEL_JELLY_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'Subtitle',	'CRAFTPROD_SUB'}
	}
}
ECT[#ECT+1] = {
	SPECIAL_KEY_WORDS	= {'ID', 'TECH_COMP'},
	VALUE_CHANGE_TABLE 	= {
		{'ProductCategory', 'Component'}
	}
}
ECT[#ECT+1] = {
--	text added in custom lang file
	SPECIAL_KEY_WORDS	= {'ID', 'GEODE_CAVE'},
	VALUE_CHANGE_TABLE 	= {
		{'Name',		'UI_GEODE_NAME_CAVE'},
		{'NameLower',	'UI_GEODE_NAME_CAVE_L'}
	}
}
ECT[#ECT+1] = {
--  reduce ship parts price
	REPLACE_TYPE		= 'All',
	SPECIAL_KEY_WORDS	= {
		{'Ignore', 'UI_DROPSHIP_PART_SUB'},
		{'Ignore', 'UI_FIGHTER_PART_SUB'},
		{'Ignore', 'UI_SCIENTIFIC_PART_SUB'}
	},
	SECTION_UP			= 1,
	INTEGER_TO_FLOAT	= 'Preserve',
	VALUE_CHANGE_TABLE	= {
		{'BaseValue',  '@ * 0.01'}
	}
}
ECT[#ECT+1] = {
	PRECEDING_KEY_WORDS	= 'Table',
	ADD					= ToExml({
		ProductEntry({
			id				= 'RAMMOULD5',
			name			= 'RAMMOULD_NAME',
			namelower		= 'RAMMOULD_NAME_L',
			subtitle		= 'UI_MEGAPROD_SUBTITLE',
			description		= 'RAMMOULD_DESC',
			basevalue		= 8000,
			color			= 'FFCCCCCC',
			category		= 'Special',
			type			= 'Tradeable',
			rarity			= 'Rare',
			legality		= 'Legal',
			iscraftable		= true,
			requirements	= {
				{id='SPACEGUNK2', 		n=10000,	tp=IT_.SBT},
				{id='SPACEGUNK2', 		n=10000,	tp=IT_.SBT}
			},
			stackmultiplier	= 12,
			icon			= 'TEXTURES/UI/FRONTEND/ICONS/PRODUCTS/PRODUCT.RAMMOLD.DDS'
		}),
		ProductEntry({
			id				= 'ULTRAPRODX40',
			name			= 'PRODX40_NAME',
			namelower		= 'PRODX40_NAME_L',
			subtitle		= 'CURIO4_SUBTITLE',
			description		= 'PRODX40_DESC',
			basevalue		= 624000000,
			color			= 'FFCCCCCC',
			category		= 'Special',
			type			= 'Tradeable',
			rarity			= 'Rare',
			legality		= 'Legal',
			iscraftable		= true,
			requirements	= {
				{id='ULTRAPROD1', 		n=20,	tp=IT_.PRD},
				{id='ULTRAPROD2', 		n=20,	tp=IT_.PRD}
			},
			stackmultiplier	= 16,
			icon			= 'TEXTURES/UI/FRONTEND/ICONS/PRODUCTS/PRODUCT.ULTRAPRODX4.DDS'
		}),
		ProductEntry({
			id				= 'SUPERFOOD',
			name			= 'SUPERFOOD_NAME',
			namelower		= 'SUPERFOOD_NAME_L',
			subtitle		= 'PROD_NIP_SUBTITLE',
			description		= 'SUPERFOOD_DESC',
			basevalue		= 2,
			color			= 'FF1A273D',
			category		= 'Exotic',
			type			= 'Consumable',
			rarity			= 'Rare',
			legality		= 'Legal',
			consumable		= true,
			requirements	= {
				{id='SENTINEL_LOOT',	n=2,	pt=IT_.PRD},
				{id='FOOD_V_ROBOT',		n=2,	pt=IT_.PRD},
				{id='STELLAR2',			n=50,	pt=IT_.SBT}
			},
			stackmultiplier	= 20,
			icon			= 'TEXTURES/UI/FRONTEND/ICONS/PRODUCTS/PRODUCT.GLOWPELLET.DDS'
		})
	})
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE PRODUCT.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.72',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN',
		EXML_CHANGE_TABLE	= ECT
	}
}}}}
