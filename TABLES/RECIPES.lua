-----------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/table_entry.lua')
-----------------------------------------
mod_desc = [[
  Add new recipes
  Decrease all refining time by 1/2
]]---------------------------------------

local new_recipes = {
	{--	double nanites from mould
		id			= 'RECIPE_MOULD2',
		name		= 'RECIPE_BURIEDTECH',
		make		= 32,
		cook		= false,
		result		= {id='TECHFRAG', n=2, tp=I_.SBT},
		ingredients	= {
			{id='SPACEGUNK2',n=5,	tp=I_.SBT},
			{id='SPACEGUNK2',n=5,	tp=I_.SBT}
		}
	},
	{--	triple nanites from mould
		id			= 'RECIPE_MOULD3',
		name		= 'RECIPE_BURIEDTECH',
		make		= 36,
		cook		= false,
		result		= {id='TECHFRAG', n=3, tp=I_.SBT},
		ingredients	= {
			{id='SPACEGUNK2',n=5,	tp=I_.SBT},
			{id='SPACEGUNK2',n=5,	tp=I_.SBT},
			{id='SPACEGUNK2',n=5,	tp=I_.SBT}
		}
	},
	{--	atlantideum to void mote
		id			= 'RECIPE_TOSMOTE',
		name		= 'RECIPE_DRONESCRAP',
		make		= 40,
		cook		= false,
		result		= {id='BUI_SCRAP', n=1, tp=I_.SBT},
		ingredients	= {
			{id='ROBOT2',	n=4,	tp=I_.SBT},
			{id='ROBOT2',	n=4,	tp=I_.SBT}
		}
	},
	{--	radiant shard to atlantideum
		id			= 'RECIPE_SHARDDUST',
		name		= 'RECIPE_DRONESHARD',
		make		= 100,
		cook		= false,
		result		= {id='ROBOT2', n=50, tp=I_.SBT},
		ingredients	= {
			{id='DRONE_SHARD',	n=1,	tp=I_.PRD}
		}
	},
	{--	make lots of sand from ferrite
		id			= 'RECIPE_MORESAND',
		name		= 'UI_SANDWORD_DIET7',
		make		= 40,
		cook		= false,
		result		= {id='SAND1', n=6, tp=I_.SBT},
		ingredients	= {
			{id='LAND1',		n=1,	tp=I_.SBT},
			{id='LAND1',		n=1,	tp=I_.SBT}
		}
	},
	{--	glowing pellets are good for you
		id			= 'RECIPE_HEALTHMAJOR',
		name		= 'RECIPE_CATALYST1_ROBOT1',
		make		= 3,
		result		= {id='SUPERFOOD', n=1, tp=I_.PRD},
		ingredients	= {
			{id='SENTINEL_LOOT',n=1,	tp=I_.PRD},
			{id='FOOD_V_ROBOT',	n=1,	tp=I_.PRD},
			{id='STELLAR2',		n=25,	tp=I_.SBT}
		}
	},
	{--	Spawning Sac - bioship inventory
		id   		= 'RECIPE_BIOCARGO',
		name		= 'RECIPE_ASTEROID_MIX',
		make		= 4,
		result		= {id='ALIEN_INV_TOKEN', n=1, tp=I_.PRD},
		ingredients	= {
			{id='FIENDCORE', 	n=2,	tp=I_.PRD},
			{id='SPACEGUNK2', 	n=40,	tp=I_.SBT},
			{id='ROBOT1', 		n=80,	tp=I_.SBT}
		}
	},
	{--	taint mag ferrite for more taint
		id			= 'RECIPE_TAINT3',
		name		= 'RECIPE_ASTEROID2',
		make		= 40,
		result		= {id='AF_METAL', n=3, tp=I_.SBT},
		ingredients	= {
			{id='AF_METAL',		n=1,	tp=I_.SBT},
			{id='LAND3',		n=3,	tp=I_.SBT}
		}
	},
	{--	quicksilver from colored sources
		id			= 'RECIPE_GAS2HG',
		name		= 'RECIPE_ASTEROID2',
		make		= 10,
		result		= {id='HEXCORE', n=1, tp=I_.PRD},
		ingredients	= {
			{id='GAS1',			n=400,	tp=I_.SBT},
			{id='GAS2',			n=400,	tp=I_.SBT},
			{id='GAS3',			n=400,	tp=I_.SBT}
		}
	}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE RECIPE.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.45',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCRECIPETABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'Preserve',
				VALUE_CHANGE_TABLE 	= {
					{'TimeToMake',	0.5}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'REFINERECIPE_52'},
				VALUE_CHANGE_TABLE 	= {
					{'TimeToMake',	24}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Table',
				ADD 				= (
					function()
						local T = {}
						for _,r in ipairs(new_recipes) do
							T[#T+1] = RefinerRecipeEntry(r)
						end
						return ToExml(T)
					end
				)()
			}
		}
	}
}}}}