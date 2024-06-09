------------------------------------------------------------
-- EXCLUDED FROM BATCH
----------------------------------------------------
dofile('LIB/_exml_2_lua.lua')
dofile('LIB/_lua_2_exml.lua')
----------------------------------------------------
local mod_desc = [[
  remove proc-tech and add extras in tech catalog
  add ship parts to materials catalog
]]--------------------------------------------------

local tech_catalog = {
	UI_PORTAL_CAT_TECH_SUIT		= {
		{'SUIT_REFINER2',	22}
	},
	UI_PORTAL_CAT_TECH_SHIP		= {
		{'PHOTONIX_CORE',	4},
		{'LAUNCHER_SPEC'},
		{'SHIPJUMP_SPEC'},
		{'HYPERDRIVE_SPEC'},
		{'SHIP_LIFESUP'}
	},
	UI_PORTAL_CAT_TECH_TOOL		= {
		{'LASER_XO',		3},
		{'ATLAS_LASER',		5},
		{'SENT_LASER',		5},
		{'UT_BUI_SCAN2',	12},
		{'UT_S10_SCAN',		12},
		{'UT_BUI_SCAN',		12}
	},
	UI_PORTAL_CAT_TECH_GUN		= {
		{'BOLT_SM',			3},
		{'FLAME',			20}
	},
	UI_PORTAL_CAT_TECH_WEIRD	= {
		{'STORY_TRANSLATE',	3},
		{'F_LIFESUPP',		15},
		{'SHIPGUN_ROBO',	15},
		{'SHIPSHIELD_ROBO',	15},
		{'HYPERDRIVE_ROBO',	15},
		{'SHIPJUMP_ROBO',	15},
		{'LAUNCHER_ROBO',	15},
		{'LIFESUP_ROBO',	15},
	}
}

-----------------------------------------------------------------------------------------
local function ProcessCatalogCraft(exml_sources, index)
	local mbin_craft		= ToLua(exml_sources[index])
	-- * on error fails silently and results in an empty catalog

	for _,cat in ipairs(mbin_craft.template.Categories) do
		local pattern	= cat.CategoryID:find('_FRE') and '^U_FR_.+[123]$' or '^U_.+[1234X]$'
		for i=#cat.Items, 1, -1 do
			-- filter proc-tech from the lists except top level freighter proc-tech
			if cat.Items[i].Value:find(pattern) then
				table.remove(cat.Items, i)
			end
		end
		if tech_catalog[cat.CategoryID] then
			-- add extras
			for _,item in ipairs(tech_catalog[cat.CategoryID]) do
				table.insert(cat.Items, item[2] or #cat.Items+1, item[1])
			end
		end
	end
	return FileWrapping(mbin_craft)
end

-----------------------------------------------------------------------------------------
local function ProcessCatalogMaterial(exml_sources, index)
	local mbin_material	= ToLua(exml_sources[index])
	local material_cat4	= mbin_material.template.Categories[4]

	material_cat4.Items[#material_cat4.Items+1] = {
		meta	= {'value', 'NMSString0x10.xml'},
		Value	= 'ULTRAPRODX40'
	}
	material_cat4.Items[#material_cat4.Items+1] = {
		meta	= {'value', 'NMSString0x10.xml'},
		Value	= 'RAMMOULD5'
	}
	return FileWrapping(mbin_material)
end

-----------------------------------------------------------------------------------------
local function ProcessCatalogRecipe(exml_sources, index)

	local gc_products		= ToLua(exml_sources[4]) -- just to pull data, will be discarded

	local mbin_recipe		= ToLua(exml_sources[index])
	local recipe_categories	= mbin_recipe.template.Categories
	local new_category 		= UnionTables({recipe_categories[1]})

	for _,head in ipairs({
		{f='UI_FIGHTER_PART_SUB',		t='UI_SHIP_TAB_STARSHIP'},
		{f='UI_DROPSHIP_PART_SUB',		t='UI_SHIP_TAB_DROPSHIP'},
		{f='UI_SCIENTIFIC_PART_SUB',	t='UI_SHIP_TAB_SCIENTIFIC'},
	}) do
		new_category.CategoryID			= head.t
		new_category.CategoryIDUpper	= head.t
		new_category.IconOn.Filename	= 'TEXTURES/UI/FRONTEND/ICONS/WIKI/WIKI.TECH.SHIP.ON.DDS'
		new_category.IconOff.Filename	= 'TEXTURES/UI/FRONTEND/ICONS/WIKI/WIKI.TECH.SHIP.OFF.DDS'
		new_category.Type.WikiTopicType	= 'CustomItemList'

		-- read prodcut list
		local parts = {}
		for _,prd in ipairs(gc_products.template.Table) do
			if prd.Subtitle.Value:find(head.f) then
				parts[#parts+1] = prd.ID
			end
		end
		new_category.Items = StringArray(parts, 'Items')
		recipe_categories[#recipe_categories+1] = UnionTables({new_category})
	end
	return FileWrapping(mbin_recipe)
end

-----------------------------------------------------------------------------------------
local source_mbins = {
	'METADATA/REALITY/CATALOGUECRAFTING.MBIN',
	'METADATA/REALITY/CATALOGUEMATERIALS.MBIN',
	'METADATA/REALITY/CATALOGUERECIPES.MBIN',
	'METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN'
}

ProcessExmlData = nil -- to silence unused_variable
function ProcessExmlData(arg) -- called by AMUMSS
	local T = {}
	for i, func in ipairs({ProcessCatalogCraft, ProcessCatalogMaterial, ProcessCatalogRecipe}) do
		T[source_mbins[i]] = func(arg, i)
	end
	return T
end

-----------------------------------------------------------------------------------------
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '__META wiki catalogs.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.72',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE = source_mbins,
		EXML_DATA		 = { 'ProcessExmlData', source_mbins }
	}
}}}}

-- keep S 				>> {^U_.+[124X]X$}
-- keep freighter S		>> {^U_FR_.+[123]$}
-- remove all proc tech	>> {^U_.+[1234X]$}
