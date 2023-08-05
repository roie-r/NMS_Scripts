-----------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/table_entry.lua')
-----------------------------------------
mod_desc = [[
  Add new recipes
  Decrease all refining time by 1/2
]]---------------------------------------

local new_recipes = {
	{--	make lots of sand from ferrite
		id		= 'RECIPE_MORESAND',
		name	= 'UI_SANDWORD_DIET7',
		make	= 40,
		cook	= 'False',
		{id='SAND1',			n=6,	tp=I_.SBT,	res=true}, -- result!
		{id='LAND1',			n=1,	tp=I_.SBT},
		{id='LAND1',			n=1,	tp=I_.SBT}
	},
	{--	glowing pellets are good for you
		id		= 'RECIPE_HEALTHMAJOR',
		name	= 'RECIPE_CATALYST1_ROBOT1',
		make	= 3,
		cook	= 'False',
		{id='SUPERFOOD',		n=1,	tp=I_.PRD,	res=true}, -- result!
		{id='SENTINEL_LOOT',	n=1,	tp=I_.PRD},
		{id='FOOD_V_ROBOT',		n=1,	tp=I_.PRD},
		{id='STELLAR2',			n=25,	tp=I_.SBT}
	},
	{--	Spawning Sac - bioship inventory
		id   	= 'RECIPE_BIOCARGO',
		name	= 'RECIPE_ASTEROID_MIX',
		make	= 4,
		cook	= 'False',
		{id='ALIEN_INV_TOKEN',	n=1,	tp=I_.PRD,	res=true}, -- result!
		{id='FIENDCORE', 		n=2,	tp=I_.PRD},
		{id='SPACEGUNK2', 		n=40,	tp=I_.SBT},
		{id='ROBOT1', 			n=80,	tp=I_.SBT}
	},
	{--	taint mag ferrite for more taint
		id		= 'RECIPE_TAINT3',
		name	= 'RECIPE_ASTEROID2',
		make	= 40,
		cook	= 'False',
		{id='AF_METAL',			n=3,	tp=I_.SBT,	res=true}, -- result!
		{id='AF_METAL',			n=1,	tp=I_.SBT},
		{id='LAND3',			n=3,	tp=I_.SBT}
	},
	{--	quicksilver from colored sources
		id		= 'RECIPE_GAS2HG',
		name	= 'RECIPE_ASTEROID2',
		make	= 10,
		cook	= 'False',
		{id='HEXCORE',			n=1,	tp=I_.PRD,	res=true}, -- result!
		{id='GAS1',				n=400,	tp=I_.SBT},
		{id='GAS2',				n=400,	tp=I_.SBT},
		{id='GAS3',				n=400,	tp=I_.SBT}
	}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE RECIPE.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
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
					{'TimeToMake',	25}
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
