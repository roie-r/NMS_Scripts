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
		{22,	'SUIT_REFINER2'}
	},
	UI_PORTAL_CAT_TECH_SHIP		= {
		{4,		'PHOTONIX_CORE'},
		{'LAUNCHER_SPEC'},
		{'SHIPJUMP_SPEC'},
		{'HYPERDRIVE_SPEC'},
		{'SHIP_LIFESUP'}
	},
	UI_PORTAL_CAT_TECH_TOOL		= {
		{3,		'LASER_XO'},
		{5,		'ATLAS_LASER'},
		{5,		'SENT_LASER'},
		{12,	'UT_BUI_SCAN2'},
		{12,	'UT_S10_SCAN'},
		{12,	'UT_BUI_SCAN'}
	},
	UI_PORTAL_CAT_TECH_GUN		= {
		{3,		'BOLT_SM'},
		{20,	'FLAME'}
	},
	UI_PORTAL_CAT_TECH_WEIRD	= {
		{3,		'STORY_TRANSLATE'},
		{15,	'F_LIFESUPP'},
		{15,	'SHIPGUN_ROBO'},
		{15,	'SHIPSHIELD_ROBO'},
		{15,	'HYPERDRIVE_ROBO'},
		{15,	'SHIPJUMP_ROBO'},
		{15,	'LAUNCHER_ROBO'},
		{15,	'LIFESUP_ROBO'}
	}
}

local catalog_craft		= 'METADATA/REALITY/CATALOGUECRAFTING.MBIN' --<< preload_source_discard
local mbin_craft		= LoadRuntimeMbin(catalog_craft)
local craft_categories	= mbin_craft and mbin_craft.template.Categories or {}
-- * on error fails silently and results in an empty catalog

for _,cat in ipairs(craft_categories) do
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
			if item[2] then
				table.insert(cat.Items, item[1], item[2])
			else
				cat.Items[#cat.Items+1] = item[1]
			end
		end
	end
end

-----------------------------------------------------------------------------------------

local gc_products			= LoadRuntimeMbin('METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN') --<< preload_source_discard

-- local catalog_material		= 'METADATA/REALITY/CATALOGUEMATERIALS.MBIN' --<< preload_source_discard
-- local mbin_material			= LoadRuntimeMbin(catalog_material)
-- local material_categories	= mbin_material and mbin_material.template.Categories or {}
-- local new_category 			= UnionTables({material_categories[1]})
local new_category 			= UnionTables({craft_categories[1]})

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
	new_category.Items = StringArray(parts, 'Items', 10)
	-- material_categories[#material_categories+1] = UnionTables({new_category})
	craft_categories[#craft_categories+1] = UnionTables({new_category})
end

-----------------------------------------------------------------------------------------
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '__META wiki catalogs.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.64',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= {
		{
			FILE_CONTENT	 = FileWrapping(mbin_craft),
			FILE_DESTINATION = catalog_craft:gsub('.MBIN$', '.EXML')
		},
		-- {
			-- FILE_CONTENT	 = FileWrapping(mbin_material),
			-- FILE_DESTINATION = catalog_material:gsub('.MBIN$', '.EXML')
		-- }
	}
}

-- keep S 				>> {^U_.+[124X]X$}
-- keep freighter S		>> {^U_FR_.+[123]$}
-- remove all proc tech	>> {^U_.+[1234X]$}