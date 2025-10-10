----------------------------------------------------
dofile('LIB/_mxml_2_lua.lua')
dofile('LIB/_lua_2_mxml.lua')
dofile('Dictionary.lua')
----------------------------------------------------
local mod_desc = [[
  remove proc-tech and add extras in tech catalog
  add ship parts to materials catalog
]]--------------------------------------------------

local tech_catalog = {
	UI_PORTAL_CAT_TECH_SUIT		= {
		pattern	= {'^U_.+[1234X]$'}
	},
	UI_PORTAL_CAT_TECH_SHIP		= {
		pattern	= {'^U_.+[1234X]$'},
		add		= {
			{'PHOTONIX_CORE',	4},
			{'LAUNCHER_SPEC'},
			{'SHIPJUMP_SPEC'},
			{'HYPERDRIVE_SPEC'},
			{'SHIP_LIFESUP'}
		}
	},
	UI_PORTAL_CAT_TECH_TOOL		= {
		pattern	= {'^U_.+[1234X]$'},
		add		= {
			{'LASER_XO',		3},
			{'UT_BUI_SCAN2',	12},
			{'UT_S10_SCAN',		12},
			{'UT_BUI_SCAN',		12},
			{'SUN_LASER'},
			{'SOUL_LASER'},
			{'SENT_LASER'},
			{'ATLAS_LASER'}
		}
	},
	UI_PORTAL_CAT_TECH_GUN		= {
		pattern	= {'^U_.+[1234X]$'},
		add		= {
			{'BOLT_SM',			3},
			{'FLAME',			20}
		}
	},
	UI_PORTAL_CAT_TECH_FRE		= {
		pattern	= {'^U_FR_.+[123]$'}
	},
	UI_PORTAL_CAT_TECH_VEH		= {
		pattern	= {'^U_.+[1234X]$'}
	},
	UI_PORTAL_CAT_TECH_WEIRD	= {
		pattern	= {
			'UT_BUI_SCAN2',
			'.-LASER$',
		},
		add		= {
			{'F_LIFESUPP',		15},
		}
	}
}
-----------------------------------------------------------------------------------------
local function ProcessCatalogCraft(the_index, norm_path)
	local mbin_craft = ToLua(table.concat(the_index.ModdedEXMLs[norm_path]))

	for _,cat in ipairs(mbin_craft.Categories) do
		if tech_catalog[cat.CategoryID].pattern then
			-- remove by pattern
			for _,ptrn in ipairs(tech_catalog[cat.CategoryID].pattern) do
				for i=#cat.Items, 1, -1 do
					if cat.Items[i]:find(ptrn) then
						table.remove(cat.Items, i)
					end
				end
			end
		end
		if tech_catalog[cat.CategoryID].add then
			-- add extras
			for _,item in ipairs(tech_catalog[cat.CategoryID].add) do
				table.insert(cat.Items, item[2] or #cat.Items + 1, item[1])
			end
		end
	end
	return ToMxmlFile(mbin_craft)
end

-----------------------------------------------------------------------------------------
local function ProcessCatalogMaterial(the_index, norm_path)
	local mbin_material = ToLua(table.concat(the_index.ModdedEXMLs[norm_path]))
	local material_cat4	= mbin_material.Categories[4]

	material_cat4.Items[#material_cat4.Items+1] = 'ULTRAPRODX40'
	material_cat4.Items[#material_cat4.Items+1] = 'RAMMOULD5'

	return ToMxmlFile(mbin_material)
end

-----------------------------------------------------------------------------------------
local function ProcessCatalogRecipe(the_index, norm_path)
	local mbin_recipe		= ToLua(table.concat(the_index.ModdedEXMLs[norm_path]))
	local recipe_categories	= mbin_recipe.Categories
	local new_category 		= UnionTables({recipe_categories[1]})

	for _,head in ipairs({
		{f='FIGHT.-',	t='UI_SHIP_TAB_STARSHIP'},
		{f='DROPS.-',	t='UI_SHIP_TAB_DROPSHIP'},
		{f='SAIL.-',	t='UI_SHIP_TAB_SAILSHIP'},
		{f='SCIEN.-',	t='UI_SHIP_TAB_SCIENTIFIC'},
	}) do
		new_category.CategoryID			= head.t
		new_category.CategoryIDUpper	= head.t
		new_category.IconOn.Filename	= 'TEXTURES/UI/FRONTEND/ICONS/WIKI/WIKI.TECH.SHIP.ON.DDS'
		new_category.IconOff.Filename	= 'TEXTURES/UI/FRONTEND/ICONS/WIKI/WIKI.TECH.SHIP.OFF.DDS'
		new_category.Type.WikiTopicType	= 'CustomItemList'
		new_category[1] = nil -- remove stubs
		new_category[2] = nil

		-- search custom parts list
		local parts = {}
		for id, dat in pairs(DICTIONARY) do
			if id:find(head.f) and dat.source == 'ModularCustomisationProducts' and dat.category == 'CustomisationPart' then
				parts[#parts+1] = id
			end
		end
		new_category.Items = StringArray(parts, 'Items')
		recipe_categories[#recipe_categories+1] = UnionTables({new_category})
	end
	return ToMxmlFile(mbin_recipe)
end

-----------------------------------------------------------------------------------------
local source_mbins = {
	'METADATA/REALITY/CATALOGUECRAFTING.MBIN',
	'METADATA/REALITY/CATALOGUEMATERIALS.MBIN',
	'METADATA/REALITY/CATALOGUERECIPES.MBIN'
}

ProcessRawMxml = nil
function ProcessRawMxml(the_index) -- called by AMUMSS
	local T = {}
	for i, func in ipairs({
		ProcessCatalogCraft,
		ProcessCatalogMaterial,
		ProcessCatalogRecipe
	}) do
		local norm_path = NormalizePath(source_mbins[i], true)
		T[norm_path] = func(the_index, norm_path)
	end
	return T
end
-----------------------------------------------------------------------------------------
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '+ META wiki catalogs',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= source_mbins,
		EXML_CREATE			= false,
		EXT_FUNC			= {'ProcessRawMxml'}
	}
}}}}
