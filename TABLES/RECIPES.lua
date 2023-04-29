---------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
---------------------------------------------------------------------
mod_desc = [[
  Add new recipes
  Decrease all refining time by 1/2
  Decrease Gas reaction time by 1/5
]]-------------------------------------------------------------------

local new_recipes = {
	{
	---	make lots of sand from ferrite
		id		= 'RECIPE_MORESAND',
		name	= 'UI_SANDWORD_DIET7',
		make	= 40,
		cook	= 'False',
		{'SAND1',			6,	I_.SBT,	true}, -- result!
		{'LAND1',			1,	I_.SBT},
		{'LAND1',			1,	I_.SBT}
	},{
	---	glowing pellets are good for you
		id		= 'RECIPE_HEALTHMAJOR',
		name	= 'RECIPE_CATALYST1_ROBOT1',
		make	= 3,
		cook	= 'False',
		{'SUPERFOOD',		1,	I_.PRD,	true}, -- result!
		{'SENTINEL_LOOT',	1,	I_.PRD},
		{'FOOD_V_ROBOT',	1,	I_.PRD},
		{'STELLAR2',		25,	I_.SBT}
	},{
	---	Spawning Sac - bioship inventory
		id   	= 'RECIPE_BIOCARGO',
		name	= 'RECIPE_ASTEROID_MIX',
		make	= 4,
		cook	= 'False',
		{'ALIEN_INV_TOKEN', 1,	I_.PRD,	true}, -- result!
		{'FIENDCORE', 		2,	I_.PRD},
		{'SPACEGUNK2', 		40,	I_.SBT},
		{'ROBOT1', 			80,	I_.SBT}
	},{
	---	taint mag ferrite for more taint
		id		= 'RECIPE_TAINT3',
		name	= 'RECIPE_ASTEROID2',
		make	= 40,
		cook	= 'False',
		{'AF_METAL',		3,	I_.SBT,	true}, -- result!
		{'AF_METAL',		1,	I_.SBT},
		{'LAND3',			3,	I_.SBT}
	},{
	---	quicksilver from colored sources
		id		= 'RECIPE_GAS2HG',
		name	= 'RECIPE_ASTEROID2',
		make	= 10,
		cook	= 'False',
		{'HEXCORE',			1,	I_.PRD,	true}, -- result!
		{'GAS1',			200,I_.SBT},
		{'GAS2',			200,I_.SBT},
		{'GAS3',			200,I_.SBT}
	}
}

local function AddNewRecipes()
	local function addIngredient(x)
		return {
			META	= {x[4] and 'Result' or 'value', 'GcRefinerRecipeElement.xml'},
			Id		= x[1],
			Amount	= x[2],
			Type	= {
				META			= {'Type', 'GcInventoryType.xml'},
				InventoryType	= x[3]
			}
		}
	end
	local function BuildRecipe(rec)
		local T = {META = {'name', 'Ingredients'}}
		for i=2, #rec do
			T[#T+1] = addIngredient(rec[i])
		end
		return {
			META		= {'value', 'GcRefinerRecipe.xml'},
			Id			= rec.id,
			RecipeType	= rec.name,
			RecipeName	= rec.name,
			TimeToMake	= rec.make,
			Cooking		= rec.cook,
			Result		= addIngredient(rec[1]),
			Ingredients	= T
		}
	end
	local T = {}
	for _,r in ipairs(new_recipes) do
		T[#T+1] = BuildRecipe(r)
	end
	return ToExml(T)
end

local function ChangeTimeToMakeRange(id1, id2, multiplier)
	local T = {}
	T[1] = {
		SKW					= {},
		INTEGER_TO_FLOAT	= 'Preserve',
		MATH_OPERATION 		= '*',
		VALUE_CHANGE_TABLE 	= { {'TimeToMake',	multiplier} }
	}
	for i = id1, id2 do
		T[1].SKW[#T[1].SKW + 1] = {'Id', 'REFINERECIPE_'..i}
	end
	return T
end

local source_table_recipe = 'METADATA/REALITY/TABLES/NMS_REALITY_GCRECIPETABLE.MBIN'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE RECIPE.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= source_table_recipe,
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
				SPECIAL_KEY_WORDS	= {'Id', 'REFINERECIPE_322'},
				VALUE_CHANGE_TABLE 	= {
					{'TimeToMake',	45}	-- ancient bug fix
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
				ADD 				= AddNewRecipes()
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= source_table_recipe,
		EXML_CHANGE_TABLE	= ChangeTimeToMakeRange(132, 137, 0.4)
	},
	{
		MBIN_FILE_SOURCE	= source_table_recipe,
		EXML_CHANGE_TABLE	= ChangeTimeToMakeRange(311, 322, 0.4)
	}
}}}}
