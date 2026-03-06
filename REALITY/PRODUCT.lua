----------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/table_entry.lua')
----------------------------------------
local mod_desc = [[
  Increase stack sizes
  Custom icons & icon background color
  Add and edit crafting requirements
  Lower ship parts prices
  Add new products
  Remove corvette inventory tech addon
]]--------------------------------------

local PRP_ = { NM='Name', ID='ID', SB='Subtitle', DS='Description' }
--    			product	  custom	basepart
local mx_ct = { prd = {}, cmt = {}, bsp = {} }

-- custom icons
for id, prd in pairs({
	CARBON_SEAL		= {ic='PRODUCTS/PRODUCT.MSEAL.DDS',						tb='prd'},
	STATION_KEY		= {ic='PRODUCTS/PRODUCT.STATION.OVERRIDE.DDS',			tb='prd'},
	FISHBAIT_1		= {ic='COOKINGPRODUCTS/PRODUCT.BAIT.WORMS.DDS',			tb='prd'},
	FOOD_M_BALL		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.BRAIN.DDS',			tb='prd'},
	FOOD_M_BEETLE	= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.CARAPACE.DDS',		tb='prd'},
	FOOD_M_BONE		= {ic='COOKINGPRODUCTS/PRODUCT.BONE.CRYSTAL.DDS',		tb='prd'},
	FOOD_M_CAT		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.LIVER.DDS',			tb='prd'},
	FOOD_M_COW		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.STEAK1.DDS',		tb='prd'},
	FOOD_M_CRAB		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.CRAB.DDS',			tb='prd'},
	FOOD_M_DIGGER	= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.BONEY.DDS',			tb='prd'},
	FOOD_M_DIPLO	= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.STEAK2.DDS',		tb='prd'},
	FOOD_M_DRILL	= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.SINEW.DDS',			tb='prd'},
	FOOD_M_FISH		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.FISH.DDS',			tb='prd'},
	FOOD_M_FLYER	= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.WING.DDS',			tb='prd'},
	FOOD_M_HORROR	= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.HORROR.DDS',		tb='prd'},
	FOOD_M_MEAT		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.CHUNKY.DDS',		tb='prd'},
	FOOD_M_MOLE		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.MOLE.DDS',			tb='prd'},
	FOOD_M_REX		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.SCALE.DDS',			tb='prd'},
	FOOD_M_STRIDER	= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.SAUSAGE1.DDS',		tb='prd'},
	FOOD_V_BLOB		= {ic='COOKINGPRODUCTS/PRODUCT.HONEY.ALT.DDS',			tb='prd'},
	FOOD_V_BUG		= {ic='COOKINGPRODUCTS/PRODUCT.R.BUG.DDS',				tb='prd'},
	FOOD_V_GEK		= {ic='COOKINGPRODUCTS/PRODUCT.MILK.PROTO.DDS',			tb='prd'},
	FOOD_V_FLYER	= {ic='COOKINGPRODUCTS/PRODUCT.MILK.CRAW.DDS',			tb='prd'},
	FOOD_V_MILK		= {ic='COOKINGPRODUCTS/PRODUCT.MILK.WILD.DDS',			tb='prd'},
	FOOD_V_PCAT		= {ic='COOKINGPRODUCTS/PRODUCT.HONEY.WHITE.DDS',		tb='prd'},
	FOOD_R_BONEMILK	= {ic='COOKINGPRODUCTS/PRODUCT.MILK.BONE.DDS',			tb='prd'},
	FOOD_R_EYEBALLS	= {ic='COOKINGPRODUCTS/PRODUCT.R.EYEBALLS.DDS',			tb='prd'},
	FOOD_R_HONEY	= {ic='COOKINGPRODUCTS/PRODUCT.HONEY.BLUE.DDS',			tb='prd'},
	FOOD_R_HORROR	= {ic='COOKINGPRODUCTS/PRODUCT.R.HORROR.DDS',			tb='prd'},
	FOOD_V_BONE		= {ic='COOKINGPRODUCTS/PRODUCT.BONE.PIECE.DDS',			tb='prd'},
	FOOD_V_CAT		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.KIDNEY.DDS',		tb='prd'},
	FOOD_V_CRAB		= {ic='COOKINGPRODUCTS/PRODUCT.BONE.CRAB.DDS',			tb='prd'},
	FOOD_V_DIPLO	= {ic='COOKINGPRODUCTS/PRODUCT.EGG.GIANT.DDS',			tb='prd'},
	FOOD_V_ROBOT	= {ic='COOKINGPRODUCTS/PRODUCT.ROBOT.WIRE.DDS',			tb='prd'},
	FOOD_V_STRIDER	= {ic='COOKINGPRODUCTS/PRODUCT.EGG.TALL.DDS',			tb='prd'},
	FOOD_W_CASE		= {ic='COOKINGPRODUCTS/PRODUCT.MEAT.DDS',				tb='prd'},
	FOOD_R_EYESTEW	= {ic='COOKINGPRODUCTS/PRODUCT.R.EYEBALLS.DDS',			tb='prd'},
	GEODE_CAVE		= {ic='U4PRODUCTS/PRODUCT.GEODECAVE.DDS',				tb='prd'},
	SHIPCHARGE		= {ic='U4PRODUCTS/PRODUCT.SHIPCHARGE.DDS',				tb='prd'},
---	personal
	DROPS_ENGIAA	= {ic='SHIPICONS/SHIPPARTS.DROPSHIPENGINE.AA.DDS',		tb='cmt'},
	DROPS_ENGIAB	= {ic='SHIPICONS/SHIPPARTS.DROPSHIPENGINE.AB.DDS',		tb='cmt'},
	DROPS_ENGIBA	= {ic='SHIPICONS/SHIPPARTS.DROPSHIPENGINE.BA.DDS',		tb='cmt'},
	DROPS_ENGIBB	= {ic='SHIPICONS/SHIPPARTS.DROPSHIPENGINE.BB.DDS',		tb='cmt'},
	ACCESS1			= {ic='PRODUCTS/MYPROD/ATLASPASS1.DDS',					tb='prd'},
	ACCESS2			= {ic='PRODUCTS/MYPROD/ATLASPASS2.DDS',					tb='prd'},
	PRODFUEL2		= {ic='U4PRODUCTS/PRODUCT.OXYGENGEL2.DDS',				tb='prd'},
	SIGNALCHARGE	= {ic='U4PRODUCTS/PRODUCT.POWERSURGE.DDS',				tb='prd'},
}) do
	table.insert(mx_ct[prd.tb], {
		SPECIAL_KEY_WORDS	= {'ID', id},
		PRECEDING_KEY_WORDS = 'Icon',
		VALUE_CHANGE_TABLE 	= { {'Filename', 'TEXTURES/UI/FRONTEND/ICONS/'..prd.ic} }
	})
end

-- stack multipliers
for key, prd in pairs({
	CRAFTPROD_SUB				= {op='*',	sm=4,	pr=PRP_.SB,	tb='prd'},
	DELICACY1_SUBTITLE			= {op='*',	sm=4,	pr=PRP_.SB,	tb='prd'},
	['FOOD_.-']					= {op='*',	sm=4,	pr=PRP_.ID,	tb='prd'},
	LAUNCHFUEL_SUB				= {op='*',	sm=5,	pr=PRP_.SB,	tb='prd'},
	BP_SALVAGE_NAME				= {op='*',	sm=6,	pr=PRP_.NM,	tb='prd'},
	UI_TECHMOD_NAME				= {op='*',	sm=1.5,	pr=PRP_.NM,	tb='prd'},
	SUB_DEADDRONE_SUBTITLE		= {op='+',	sm=2,	pr=PRP_.SB,	tb='prd'},
	UI_SHIP_BRAIN_CLEAN_SUB		= {op='+',	sm=2,	pr=PRP_.SB,	tb='prd'},
	UI_SENTINEL_LOOT_NAME		= {op='*',	sm=8,	pr=PRP_.NM,	tb='prd'},
	UI_REPAIR_KIT_NAME			= {op='*',	sm=2,	pr=PRP_.NM,	tb='prd'},
	UI_STORMCRYSTAL_NAME		= {op='*',	sm=2,	pr=PRP_.NM,	tb='prd'},
	UI_ALLOY_COMPLEX_SUBTITLE	= {op='*',	sm=2,	pr=PRP_.SB,	tb='prd'},
	UI_REACTION_SUBTITLE		= {op='*',	sm=2,	pr=PRP_.SB,	tb='prd'},
	['MEGAPROD[1-3]']			= {op='+',	sm=1,	pr=PRP_.ID,	tb='prd'},
	UI_ULTRAPROD_SUBTITLE		= {op='*',	sm=2,	pr=PRP_.SB,	tb='prd'},
	BLD_GLITCHPROP_SUBTITLE		= {op='*',	sm=2,	pr=PRP_.SB,	tb='bsp'},
	UI_DRONE_SHARD_NAME			= {op='*',	sm=12,	pr=PRP_.NM,	tb='prd'},
	UI_STATION_KEY_NAME			= {op='+ ',	sm=1,	pr=PRP_.NM,	tb='prd'},
	UI_STAFF_PART_SUB			= {op='+',	sm=1,	pr=PRP_.SB,	tb='prd'}
}) do
	table.insert(mx_ct[prd.tb], {
		REPLACE_TYPE 		= prd.pr == PRP_.NM and nil or 'All',
		SPECIAL_KEY_WORDS	= {prd.pr, key},
		VALUE_CHANGE_TABLE 	= { {'StackMultiplier', '@'..prd.op..prd.sm} }
	})
end

-- barter markup
for key, prd in pairs({
	UI_STONE_EYE_PROD_NAME	= {bm=2,	tb='prd'}, -- vigilant stone
	UI_STORMCRYSTAL_NAME	= {bm=0.8,	tb='prd'}, -- storm crystal
	NEWPROD11_NAME			= {bm=2,	tb='prd'}, -- vortex cube
	NEWPROD14_NAME			= {bm=2,	tb='prd'}, -- albumen pearl
	NEWPROD13_NAME			= {bm=2,	tb='prd'}, -- gravitino ball
	UI_CLAMPEARL_NAME		= {bm=4,	tb='prd'}, -- living pearl
	NEWPROD12_NAME			= {bm=1.5,	tb='prd'}, -- sac venom
	UI_VENTGEM_NAME			= {bm=2,	tb='prd'}, -- crystal sulphide
	UI_GEODE_ASTEROID_NAME	= {bm=3,	tb='prd'}, -- gold nugget
	UI_GEODE_CRYSTAL_NAME	= {bm=3,	tb='prd'}, -- crystal fragment
	UI_GEODE_RARE_NAME		= {bm=3,	tb='prd'}, -- glowing mineral
}) do
	table.insert(mx_ct[prd.tb], {
		SPECIAL_KEY_WORDS	= {'Name', key},
		VALUE_CHANGE_TABLE 	= { {'BuyBaseMarkup', prd.bm} }
	})
end

-- custom icon background color
for key, prd in pairs({
	FOOD_COOKED_SUB				= {col='FF8A8139', pr=PRP_.SB, tb='prd'}, -- cooked foods
	['FOOD_V_.-']				= {col='FF8A8139', pr=PRP_.ID, tb='prd'}, -- veg foods
	FOOD_FOSSIL_STEW_NAME		= {col='FF8A8139', pr=PRP_.NM, tb='prd'}, -- bone broth
	FOOD_HORROR_MEAT_NAME		= {col='FFBB3830', pr=PRP_.NM, tb='prd'}, -- rancid flesh
	UI_GRUB_POD_NAME			= {col='FFBB3830', pr=PRP_.NM, tb='prd'}, -- juicy grub
	FOOD_BUG_VEG_NAME			= {col='FFBB3830', pr=PRP_.NM, tb='prd'}, -- nourishing slime
	FOOD_EVIL_STEW_NAME			= {col='FFBB3830', pr=PRP_.NM, tb='prd'}, -- worst stew
	COMMODITY6_NAME				= {col='FFF3A923', pr=PRP_.NM, tb='prd'}, -- Antimatter
	FUEL_JELLY_NAME				= {col='FFF3A923', pr=PRP_.NM, tb='prd'}, -- dihydrogen jelly
	UI_TECHMOD_NAME				= {col='FFF3A923', pr=PRP_.NM, tb='prd'}, -- Wiring Loom
	NEWPROD11_NAME				= {col='FF4D2957', pr=PRP_.NM, tb='prd'}, -- Vortex Cube
	UI_VENTGEM_NAME				= {col='FFCCCCCC', pr=PRP_.NM, tb='prd'}, -- Crystal Sulphide
	UI_STORMCRYSTAL_NAME		= {col='FF4D2957', pr=PRP_.NM, tb='prd'}, -- Storm Crystal
	FUELGEL3_NAME				= {col='FFC61230', pr=PRP_.NM, tb='prd'}, -- life support gel
	GRENFUEL1_NAME				= {col='FFC61230', pr=PRP_.NM, tb='prd'}, -- grenade fuel
	['HYPERFUEL[12]_SUBTITLE']	= {col='FFC61230', pr=PRP_.SB, tb='prd'}, -- warp fuel
	UI_SUBFUEL_NAME				= {col='FFC61230', pr=PRP_.NM, tb='prd'}, -- sub fuel
	LAUNCHFUEL_SUB				= {col='FFC61230', pr=PRP_.SB, tb='prd'}, -- ship+frigate fuel
	POWERPROD_SUB				= {col='FFC01746', pr=PRP_.SB, tb='prd'}, -- ion+ship battery
	FRIG_BOOST_SUB				= {col='FF6B7882', pr=PRP_.SB, tb='prd'}, -- Consumable Frigate Upgrade
	['UI_ALLOY_.-_DESC']		= {col='FF2E409E', pr=PRP_.DS, tb='prd'}, -- Alloys
	UI_REACTION_SUBTITLE		= {col='FFDBA82E', pr=PRP_.SB, tb='prd'}, -- Enhanced Gas Product
	UI_COMPOUND_SUBTITLE		= {col='FFDBA82E', pr=PRP_.SB, tb='prd'}, -- Manufactured Gas Product
	UI_NAV_DATA_NAME			= {col='FF1A2733', pr=PRP_.NM, tb='prd'}, -- navigation data
	['SHIP_CORE_.-']			= {col='FF48A1B0', pr=PRP_.ID, tb='cmt'}, -- ship core
}) do
	table.insert(mx_ct[prd.tb], {
		REPLACE_TYPE 		= prd.pr == PRP_.NM and nil or 'All',
		SPECIAL_KEY_WORDS	= {prd.pr, key},
		VALUE_CHANGE_TABLE 	= Hex2VCT(prd.col)
	})
end

-- craft requirements replacement
local requirements = {
		CORRIDOR_WATER = {--glass tunnel
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='FARMPROD3', 	n=1,	tp=IT_.PRD},	-- glass
				{id='WATERPLANT', 	n=50,	tp=IT_.SBT},	-- cyto-phosphate
				{id='LAND1',		n=25,	tp=IT_.SBT}		-- ferrite dust
			}
		},
		CORRIDORL_WATER = {--glass tunnel
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='FARMPROD3', 	n=1,	tp=IT_.PRD},	-- glass
				{id='WATERPLANT', 	n=50,	tp=IT_.SBT},	-- cyto-phosphate
				{id='LAND1',		n=25,	tp=IT_.SBT}		-- ferrite dust
			}
		},
		CORRIDORT_WATER = {--glass tunnel
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='FARMPROD3', 	n=1,	tp=IT_.PRD},	-- glass
				{id='WATERPLANT', 	n=50,	tp=IT_.SBT},	-- cyto-phosphate
				{id='LAND1',		n=25,	tp=IT_.SBT}		-- ferrite dust
			}
		},
		CORRIDORX_WATER = {--glass tunnel
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='FARMPROD3', 	n=1,	tp=IT_.PRD},	-- glass
				{id='WATERPLANT', 	n=50,	tp=IT_.SBT},	-- cyto-phosphate
				{id='LAND1',		n=25,	tp=IT_.SBT}		-- ferrite dust
			}
		},
		CORRIDORV_WATER = {--glass tunnel
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='FARMPROD3', 	n=1,	tp=IT_.PRD},	-- glass
				{id='WATERPLANT', 	n=50,	tp=IT_.SBT},	-- cyto-phosphate
				{id='LAND1',		n=25,	tp=IT_.SBT}		-- ferrite dust
			}
		},
		BUILDDOOR_WATER = {--glass tunnel
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='WATERPLANT', 	n=25,	tp=IT_.SBT},	-- cyto-phosphate
				{id='LAND1',		n=15,	tp=IT_.SBT}		-- ferrite dust
			}
		},
		HYPERFUEL2 = {--warp hypercore
			subs = true,
			tb   = 'prd',
			req	 = {
				{id='AM_HOUSING', 	n=1,	tp=IT_.PRD},	-- antimatter housing
				{id='ANTIMATTER', 	n=1,	tp=IT_.PRD},	-- antimatter
				{id='STORM_CRYSTAL',n=1,	tp=IT_.PRD}		-- storm crystal
			}
		},
		FISHBAIT_3 = {--bionic lure
			subs = true,
			tb   = 'prd',
			req	 = {
				{id='BIO', 			n=2,	tp=IT_.PRD},	-- amino chamber
				{id='POWERCELL', 	n=3,	tp=IT_.PRD},	-- ion battery
				{id='FARMPROD2', 	n=1,	tp=IT_.PRD}		-- lubricant
			}
		},
		BASE_TOYCORE = {--pocket reality generator
			subs = true,
			tb   = 'prd',
			req	 = {
				{id='ANTIMATTER', 	n=1,	tp=IT_.PRD},	-- antimatter
				{id='POWERCELL', 	n=1,	tp=IT_.PRD},	-- ion battery
				{id='CASING', 		n=2,	tp=IT_.PRD},	-- plating
			}
		},
		FREI_INV_TOKEN = {--cargo_bulkhead
			cost = 8,
			tb   = 'prd',
			req	 = {
				{id='CASING', 		n=20,	tp=IT_.PRD},	-- plating
				{id='HYDRALIC',		n=10,	tp=IT_.PRD},	-- poly fibre
				{id='COMPOUND6',	n=1,	tp=IT_.PRD}		-- cryo pump
			}
		},
		TECH_COMP = {--wiring loom
			tb   = 'prd',
			req	 = {
				{id='MICROCHIP',	n=3,	tp=IT_.PRD},	-- microprocessor
				{id='YELLOW2', 		n=80,	tp=IT_.SBT},	-- copper
				{id='ASTEROID1',	n=40,	tp=IT_.SBT}		-- silver
			}
		},
		POI_LOCATOR = {--anomaly detector
			tb   = 'prd',
			req	 = {
				{id='GEODE_SPACE',	n=1,	tp=IT_.PRD},	-- tritium hypercluster
				{id='ASTEROID1', 	n=20,	tp=IT_.SBT},	-- silver
				{id='ASTEROID2', 	n=20,	tp=IT_.SBT}		-- gold
			}
		},
		WHALE_BEACON = {--dream aerial
			tb   = 'prd',
			subs = true,
			req	 = {
				{id='GEODE_SPACE',	n=1,	tp=IT_.PRD},	-- tritium hypercluster
				{id='POI_LOCATOR',	n=1,	tp=IT_.PRD},	-- anomaly detector
				{id='FARMPROD8', 	n=1,	tp=IT_.PRD}		-- living glass
			}
		},
		BUILDCHAIR = {--desk chair
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='CASING', 		n=1,	tp=IT_.PRD},	-- metal plating
				{id='FUEL2', 		n=20,	tp=IT_.SBT}		-- c carbon
			}
		},
		BUILDCHAIR2 = {--armchair
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='CASING', 		n=1,	tp=IT_.PRD},
				{id='FUEL2', 		n=20,	tp=IT_.SBT}
			}
		},
		BUILDCHAIR3 = {--adjustable chair
			subs = true,
			tb   = 'bsp',
			req	 = {
				{id='CASING', 		n=1,	tp=IT_.PRD},
				{id='FUEL2', 		n=20,	tp=IT_.SBT}
			}
		}
}
for id, prd in pairs(requirements) do
	table.insert(mx_ct[prd.tb], {
		SPECIAL_KEY_WORDS	= {'ID', id},
		VALUE_CHANGE_TABLE 	= {
			{'RecipeCost',	prd.cost or 1},
			{'IsCraftable',	true}
		}
	})
	table.insert(mx_ct[prd.tb], {
		SPECIAL_KEY_WORDS	= {'ID', id},
		PRECEDING_KEY_WORDS	= 'Requirements',
		REMOVE				= prd.subs and 'Section' or 'Line'
	})
	table.insert(mx_ct[prd.tb], {
		SPECIAL_KEY_WORDS	= {'ID', id},
		ADD					= ToMxml(GetRequirements(prd.req))
	})
end

mx_ct.prd[#mx_ct.prd+1] = {--ion battery
	SPECIAL_KEY_WORDS	= {'Name', 'POWERCELL_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'DefaultCraftAmount',		5},
		{'CraftAmountStepSize',		5}
	}
}
mx_ct.prd[#mx_ct.prd+1] = {--life support gel
	SPECIAL_KEY_WORDS	= {'Name', 'FUELGEL3_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'DefaultCraftAmount',		2},
		{'CraftAmountStepSize',		2}
	}
}
mx_ct.prd[#mx_ct.prd+1] = {--radiant shard
	SPECIAL_KEY_WORDS	= {'Name', 'UI_DRONE_SHARD_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'ChargeValue',	40}
	}
}
mx_ct.prd[#mx_ct.prd+1] = {--di-hydrogen jelly
	SPECIAL_KEY_WORDS	= {'Name', 'FUEL_JELLY_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'Subtitle',	'CRAFTPROD_SUB'}
	}
}
mx_ct.prd[#mx_ct.prd+1] = {--wiring loom
	SPECIAL_KEY_WORDS	= {'Name', 'UI_TECHMOD_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'ProductCategory', 'Component'}
	}
}
mx_ct.prd[#mx_ct.prd+1] = {--pilgrimberry
	SPECIAL_KEY_WORDS	= {'Name', 'FOOD_PLANT_LUSH_FARM_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'StatsType',	'Suit_Jetpack_Tank'},
		{'FoodBonusStatAmount',	1.4}
	}
}
mx_ct.prd[#mx_ct.prd+1] = {--silicon egg
	SPECIAL_KEY_WORDS	= {'Name', 'FOOD_MISC_STELLAR_NAME'},
	VALUE_CHANGE_TABLE 	= {
		{'StatsType',	'Weapon_Laser_MiningBonus'},
		{'FoodBonusStatAmount',	1.5}
	}
}
mx_ct.prd[#mx_ct.prd+1] = {--geode
	SPECIAL_KEY_WORDS	= {'ID', 'GEODE_CAVE'},
	VALUE_CHANGE_TABLE 	= {
		{'Name',		'UI_GEODE_NAME_CAVE'},
		{'NameLower',	'UI_GEODE_NAME_CAVE_L'}
	}
}
mx_ct.cmt[#mx_ct.cmt+1] = {--lower ship parts price
	SPECIAL_KEY_WORDS	= {'Filename', 'TEXTURES/UI/FRONTEND/ICONS/SHIPICONS/SHIPPARTS.-DDS'},
	SECTION_UP			= 1,
	INTEGER_TO_FLOAT	= 'Preserve',
	VALUE_CHANGE_TABLE	= {
		{'BaseValue',  '@ * 0.01'}
	}
}
mx_ct.bsp[#mx_ct.bsp+1] = {--remove corvette tech addons
	SPECIAL_KEY_WORDS	= {
		{'BuildableShipTechID', 'CV_INV.-'}, -- inventory
		{'BuildableShipTechID', 'CV_LAUN.-'}, -- landing gear
	},
	VALUE_CHANGE_TABLE	= {
		{'BuildableShipTechID', ''}
	}
}

--- add new products ---
mx_ct.prd[#mx_ct.prd+1] = {
	PRECEDING_KEY_WORDS	= 'Table',
	ADD					= ToMxml(ProductEntry({
		{
			id					= 'RAMMOULD5',
			name				= 'RAMMOULD_NAME',
			namelower			= 'RAMMOULD_NAME_L',
			subtitle			= 'UI_MEGAPROD_SUBTITLE',
			description			= 'RAMMOULD_DESC',
			basevalue			= 8000,
			color				= 'FFBBBBBB',
			category			= 'Special',
			type				= 'Tradeable',
			rarity				= 'Rare',
			legality			= 'Legal',
			iscraftable			= true,
			requirements		= {
				{id='SPACEGUNK2', 		n=10000,	tp=IT_.SBT},
				{id='SPACEGUNK2', 		n=10000,	tp=IT_.SBT}
			},
			stackmultiplier		= 12,
			icon				= 'TEXTURES/UI/FRONTEND/ICONS/PRODUCTS/MYPROD/RAMMOLD.DDS'
		},
		{
			id					= 'ULTRAPRODX40',
			name				= 'PRODX40_NAME',
			namelower			= 'PRODX40_NAME_L',
			subtitle			= 'CURIO4_SUBTITLE',
			description			= 'PRODX40_DESC',
			basevalue			= 624000000,
			color				= 'FFBBBBBB',
			category			= 'Special',
			type				= 'Tradeable',
			rarity				= 'Rare',
			legality			= 'Legal',
			iscraftable			= true,
			requirements		= {
				{id='ULTRAPROD1', 		n=20,	tp=IT_.PRD},
				{id='ULTRAPROD2', 		n=20,	tp=IT_.PRD}
			},
			stackmultiplier		= 16,
			icon				= 'TEXTURES/UI/FRONTEND/ICONS/PRODUCTS/MYPROD/ULTRAPRODX4.DDS'
		},
		{
			id					= 'SUPERFOOD',
			name				= 'SUPERFOOD_NAME',
			namelower			= 'SUPERFOOD_NAME_L',
			subtitle			= 'PROD_NIP_SUBTITLE',
			description			= 'SUPERFOOD_DESC',
			basevalue			= 2,
			color				= 'FF4F442A',
			category			= 'Exotic',
			type				= 'Consumable',
			rarity				= 'Rare',
			legality			= 'Legal',
			consumable			= true,
			cookingingredient	= true,
			requirements		= {
				{id='SENTINEL_LOOT',	n=2,	tp=IT_.PRD},
				{id='FOOD_V_ROBOT',		n=2,	tp=IT_.PRD},
				{id='STELLAR2',			n=50,	tp=IT_.SBT}
			},
			stackmultiplier		= 20,
			foodbonusstat		= 'Suit_Jetpack_Tank',
			foodbonusstatamount = 0.8,
			icon				= 'TEXTURES/UI/FRONTEND/ICONS/PRODUCTS/MYPROD/GLOWPELLET.DDS'
		}
	}))
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY product',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= mx_ct.prd
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_MODULARCUSTOMISATIONPRODUCTS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= mx_ct.cmt
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_BASEPARTPRODUCTS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= mx_ct.bsp
	}
}}}}

local __locale_text_import__ = {
---	New text ---
	SUPERFOOD_NAME = {
		EN = [[GLOWING PELLETS]]
	},
	SUPERFOOD_NAME_L = {
		EN = [[Glowing Pellets]]
	},
	SUPERFOOD_DESC = {
		EN = [[This odd collection of pellets pulses with a faint, curiously organic phosphorescence. It seems to remember the whole from which it was parted...|NL|Consuming a sample seems to be a good for you.]]
	},
	RAMMOULD_NAME = {
		EN = [[RAMPANT MOLD]]
	},
	RAMMOULD_NAME_L = {
		EN = [[Rampant Mold]]
	},
	RAMMOULD_DESC = {
		EN = [[A highly <>EARTH<> concentrated form, up to 1:5 ratio, of the runaway mold. Extremely volatile outside of its seal container! Use of <TECHNOLOGY>power gloves<> recommended.]]
	},
	PRODX40_NAME = {
		EN = [[FUSED POWER KETTLE]],
		FR = [[BOUILLOIRE ÉLECTRIQUE À FUSIBLE]]
	},
	PRODX40_NAME_L = {
		EN = [[Fused Power Kettle]],
		FR = [[Bouilloire électrique à fusible]]
	},
	PRODX40_DESC = {
		EN = [[This plain-looking custom-made device is so vanishingly rare as to be practically extinct. It's <IMG>UNITSMALL<><RED>value<>, for the right collector, is so outrageous the technology itself is considered worthless.]],
		FR = [[Cet appareil sur mesure d'apparence simple est si rare qu'il est pratiquement éteint. Sa <IMG>UNITSMALL<><RED>valeur<>, pour le bon collectionneur, est si scandaleuse que la technologie elle-même est considérée comme sans valeur.]]
	},
	UI_STARCHART_BUILDER_NAME = {
		EN = [[ROAMING BUILDER LOCATOR]]
	},
	UI_STARCHART_BUILDER_NAME_L = {
		EN = [[Roaming Builder Locator]]
	},
	UI_STARCHART_BUILDER_DESC = {
		EN = [[A curious mesh of old and new technology, a hybrid between two entirely separate methods of creation. Nonetheless, this <STELLAR>location tracing device<> appears fully functional.]]
	},
	UI_STARCHART_BUILDER_SUB = {
		EN = [[Harmonious Synthetics Tracker]]
	},

---	Existing text overwritten ---
	UI_GEODE_NAME_CAVE = {
		EN = [[CAVE GEODE]]
	},
	UI_GEODE_NAME_CAVE_L = {
		EN = [[Cave Geode]]
	},
	UI_GREEN_CRYSTAL_NAME = {
		EN = [[Ionized Cobalt Crystals]],
		FR = [[Cristaux de cobalt ionisés]]
	},
	UI_FREIGHTER_FUEL_1_NAME = {
		EN = [[FRIGATE FUEL]]
	},
	UI_FREIGHTER_FUEL_1_NAME_L = {
		EN = [[Frigate Fuel]]
	},
	UI_FREIGHTER_FUEL_2_NAME = {
		EN = [[FRIGATE FUEL x2]]
	},
	UI_FREIGHTER_FUEL_2_NAME_L = {
		EN = [[Frigate Fuel x2]]
	},
	UI_FREIGHTER_FUEL_3_NAME = {
		EN = [[FRIGATE FUEL x4]]
	},
	UI_FREIGHTER_FUEL_3_NAME_L = {
		EN = [[Frigate Fuel x4]]
	},
	UI_SALVAGE_TECH_10_NAME = {
		EN = [[STARSHIP AI KERNEL]]
	},
	UI_SALVAGE_TECH_10_NAME_L = {
		EN = [[starship AI Kernel]]
	},
	UI_GEODE_NAME = {
		EN = [[ROCK GEODE]]
	},
	UI_GEODE_NAME_L = {
		EN = [[Rock Geode]]
	},
}--- __locale_text_import__ (do not delete)

--[[>-<LocTable>-<
--<< New texts >>--
=SUPERFOOD_NAME
EN =GLOWING PELLETS

=SUPERFOOD_NAME_L
EN =Glowing Pellets

=SUPERFOOD_DESC
EN =This odd collection of pellets pulses with a faint, curiously organic phosphorescence. It seems to remember the whole from which it was parted...|NL|Consuming a sample seems to be a good for you.

=RAMMOULD_NAME
EN =RAMPANT MOLD

=RAMMOULD_NAME_L
EN =Rampant Mold

=RAMMOULD_DESC
EN =A highly <>EARTH<> concentrated form, up to 1:5 ratio, of the runaway mold. Extremely volatile outside of its seal container! Use of <TECHNOLOGY>power gloves<> recommended.

=PRODX40_NAME
EN =FUSED STASIS ENABLER

=PRODX40_NAME_L
EN =Fused Stasis Enabler

=PRODX40_DESC
EN =This plain-looking custom-made device is so vanishingly rare as to be practically extinct. It's <IMG>UNITSMALL<><RED>value<>, for the right collector, is so outrageous the technology itself is considered worthless.

=UI_STARCHART_BUILDER_NAME
EN =ROAMING BUILDER LOCATOR

=UI_STARCHART_BUILDER_NAME_L
EN =Roaming Builder Locator

=UI_STARCHART_BUILDER_DESC
EN =A curious mesh of old and new technology, a hybrid between two entirely separate methods of creation. Nonetheless, this <STELLAR>location tracing device<> appears fully functional.

=UI_STARCHART_BUILDER_SUB
EN =Harmonious Synthetics Tracker

--<< Existing texts >>--
=UI_GEODE_NAME_CAVE
EN =CAVE GEODE

=UI_GEODE_NAME_CAVE_L
EN =Cave Geode

=UI_GREEN_CRYSTAL_NAME
EN =Ionised Cobalt Crystals

=UI_FREIGHTER_FUEL_1_NAME
EN =FRIGATE FUEL

=UI_FREIGHTER_FUEL_1_NAME_L
EN =Frigate Fuel

=UI_FREIGHTER_FUEL_2_NAME
EN =FRIGATE FUEL x2

=UI_FREIGHTER_FUEL_2_NAME_L
EN =Frigate Fuel x2

=UI_FREIGHTER_FUEL_3_NAME
EN =FRIGATE FUEL x4

=UI_FREIGHTER_FUEL_3_NAME_L
EN =Frigate Fuel x4

=UI_SALVAGE_TECH_10_NAME
EN =STARSHIP AI KERNEL

=UI_SALVAGE_TECH_10_NAME_L
EN =starship AI Kernel

=UI_GEODE_NAME
EN =ROCK GEODE

=UI_GEODE_NAME_L
EN =Rock Geode

>-<LocTable>-<]]
