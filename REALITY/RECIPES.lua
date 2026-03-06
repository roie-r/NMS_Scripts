-----------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/table_entry.lua')
-----------------------------------------
local mod_desc = [[
  Add new recipes
  more process-expensive plant products
  Decrease all refining time by 1/2
]]---------------------------------------

local new_recipes = {
	{--	silicate to dirt product
		id			= 'RECIPE_SAND2DIRT',
		name		= 'RECIPE_SILICATE',
		make		= 3,
		cook		= false,
		result		= {
			id='TRA_MINERALS1',	n=1,	tp=IT_.PRD		-- dirt
		},
		ingredients	= {
			{id='SAND1',		n=50,	tp=IT_.SBT},	-- silicate powder
			{id='SAND1',		n=50,	tp=IT_.SBT}		-- silicate powder
		}
	},
	{--	hatch juicy grub
		id			= 'RECIPE_GROWGRUB',
		name		= 'RECIPE_HOT1_PLANT_HOT',
		make		= 50,
		cook		= false,
		result		= {
			id='FOOD_M_GRUB',	n=1,	tp=IT_.PRD		-- juicy grub
		},
		ingredients	= {
			{id='FIENDCORE',	n=1,	tp=IT_.PRD},	-- larval corelarval core
			{id='GRAVBALL',		n=2,	tp=IT_.PRD}		-- gravitino ball
		}
	},
	{--	rampant mould to nanites
		id			= 'RECIPE_RAMMOULD5',
		name		= 'RECIPE_BURIEDTECH',
		make		= 60000,
		cook		= false,
		result		= {
			id='TECHFRAG',		n=4000,	tp=IT_.SBT		-- nanite cluster
		},
		ingredients	= {
			{id='RAMMOULD5',	n=1,	tp=IT_.PRD}		-- rampant mold !!
		}
	},
	{--	double nanites from mould
		id			= 'RECIPE_MOULD2',
		name		= 'RECIPE_BURIEDTECH',
		make		= 45,
		cook		= false,
		result		= {
			id='TECHFRAG',		n=2,	tp=IT_.SBT		-- nanite cluster
		},
		ingredients	= {
			{id='SPACEGUNK2',	n=5,	tp=IT_.SBT},	-- runaway mould
			{id='SPACEGUNK2',	n=5,	tp=IT_.SBT}		-- runaway mould
		}
	},
	{--	triple nanites from mould
		id			= 'RECIPE_MOULD3',
		name		= 'RECIPE_BURIEDTECH',
		make		= 50,
		cook		= false,
		result		= {
			id='TECHFRAG',		n=3,	tp=IT_.SBT		-- nanite cluster
		},
		ingredients	= {
			{id='SPACEGUNK2',	n=5,	tp=IT_.SBT},	-- runaway mould
			{id='SPACEGUNK2',	n=5,	tp=IT_.SBT},	-- runaway mould
			{id='SPACEGUNK2',	n=5,	tp=IT_.SBT}		-- runaway mould
		}
	},
	{--	atlantideum to void mote
		id			= 'RECIPE_TOSMOTE',
		name		= 'RECIPE_DRONESCRAP',
		make		= 40,
		cook		= false,
		result		= {
			id='BUI_SCRAP',		n=1,	tp=IT_.SBT		-- void mote
		},
		ingredients	= {
			{id='ROBOT2',		n=4,	tp=IT_.SBT},	-- atlantideum
			{id='ROBOT2',		n=4,	tp=IT_.SBT}		-- atlantideum
		}
	},
	{--	radiant shard to atlantideum
		id			= 'RECIPE_SHARDDUST1',
		name		= 'RECIPE_DRONESHARD',
		make		= 100,
		cook		= false,
		result		= {
			id='ROBOT2',		n=40,	tp=IT_.SBT		-- atlantideum
		},
		ingredients	= {
			{id='DRONE_SHARD',	n=1,	tp=IT_.PRD}		-- radiant shard
		}
	},
	{--	radiant shard to void mote
		id			= 'RECIPE_SHARDDUST2',
		name		= 'RECIPE_DRONESHARD',
		make		= 110,
		cook		= false,
		result		= {
			id='BUI_SCRAP',		n=10,	tp=IT_.SBT		-- void mote
		},
		ingredients	= {
			{id='DRONE_SHARD',	n=1,	tp=IT_.PRD},	-- radiant shard
			{id='DRONE_SHARD',	n=1,	tp=IT_.PRD}		-- radiant shard
		}
	},
	{--	quick mag ferrite
		id			= 'RECIPE_3XFERRITE',
		name		= 'RECIPE_LAND2',
		make		= 40,
		cook		= false,
		result		= {
			id='LAND3',			n=2,	tp=IT_.SBT		-- magnetised ferrite
		},
		ingredients	= {
			{id='LAND1',		n=1,	tp=IT_.SBT},	-- ferrite dust
			{id='LAND1',		n=1,	tp=IT_.SBT},	-- ferrite dust
			{id='LAND1',		n=1,	tp=IT_.SBT}		-- ferrite dust
		}
	},
	{--	glowing pellets are good for you
		id			= 'RECIPE_HEALTHMAJOR',
		name		= 'RECIPE_CATALYST1_ROBOT1',
		make		= 3,
		cook		= false,
		result		= {
			id='SUPERFOOD',		n=1,	tp=IT_.PRD		-- glowing pellets !!
		},
		ingredients	= {
			{id='SENTINEL_LOOT',n=1,	tp=IT_.PRD},	-- salvaged glass
			{id='FOOD_V_ROBOT',	n=1,	tp=IT_.PRD},	-- chewy wires
			{id='LAUNCHSUB2',	n=40,	tp=IT_.SBT}		-- deuterium
		}
	},
	{--	Spawning Sac - bioship inventory
		id   		= 'RECIPE_BIOCARGO',
		name		= 'RECIPE_ASTEROID_MIX',
		make		= 4,
		cook		= false,
		result		= {
			id='ALIEN_INV_TOKEN',n=1,	tp=IT_.PRD		-- spawning sac
		},
		ingredients	= {
			{id='FIENDCORE', 	n=2,	tp=IT_.PRD},	-- larval core
			{id='SPACEGUNK2', 	n=40,	tp=IT_.SBT},	-- runaway mould
			{id='ROBOT1', 		n=80,	tp=IT_.SBT}		-- pugneum
		}
	},
	{--	taint mag ferrite for more tainted
		id			= 'RECIPE_TAINT3',
		name		= 'RECIPE_ASTEROID2',
		make		= 40,
		cook		= false,
		result		= {
			id='AF_METAL',		n=3,	tp=IT_.SBT		-- tainted metal
		},
		ingredients	= {
			{id='AF_METAL',		n=1,	tp=IT_.SBT},	-- tainted metal
			{id='LAND3',		n=3,	tp=IT_.SBT}		-- magnetised ferrite
		}
	},
	{--	copper from activated copper
		id			= 'RECIPE_2COPPER',
		name		= 'RECIPE_LAUNCHSUB_GAS2',
		make		= 40,
		cook		= false,
		result		= {
			id='YELLOW2',		n=7,	tp=IT_.SBT		-- copper
		},
		ingredients	= {
			{id='EX_YELLOW',	n=2,	tp=IT_.SBT},	-- activated copper
			{id='EX_YELLOW',	n=2,	tp=IT_.SBT}		-- activated copper
		}
	},
	{--	quicksilver from gases
		id			= 'RECIPE_GAS2HG',
		name		= 'RECIPE_ASTEROID2',
		make		= 10,
		cook		= false,
		result		= {
			id='HEXCORE',		n=1,	tp=IT_.PRD		-- hex core
		},
		ingredients	= {
			{id='GAS1',			n=400,	tp=IT_.SBT},	-- sulphurine
			{id='GAS2',			n=400,	tp=IT_.SBT},	-- radon
			{id='GAS3',			n=400,	tp=IT_.SBT}		-- nitrogen
		}
	}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY recipe',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCRECIPETABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'Preserve',
				VALUE_CHANGE_TABLE 	= {
					{'TimeToMake',	0.5}
				}
			},
			{--	mould to nanites
				SPECIAL_KEY_WORDS	= {'Id', 'REFINERECIPE_52'},
				VALUE_CHANGE_TABLE 	= {
					{'TimeToMake',	40}
				}
			},
			{--	removes
				SPECIAL_KEY_WORDS	= {
					{'Id', 'REFINERECIPE_328'}, -- shard to nanites
					{'Id', 'REFINERECIPE_387'}, -- gas123 to gas4
				},
				REMOVE				= 'Section'
			},
			{--	process-expensive plant product
				SPECIAL_KEY_WORDS	= {'Result', 'GcRefinerRecipeElement', 'Id', 'FOOD_P_.-'},
				SECTION_UP			= 1,
				AFTER_KEY_WORDS		= 'Ingredients',
				VALUE_CHANGE_TABLE 	= {
					{'Amount',		10}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Table',
				ADD 				= ToMxml(RefinerRecipeEntry(new_recipes))
			}
		}
	}
}}}}
