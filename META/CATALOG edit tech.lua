----------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/exml_2_lua.lua')
----------------------------------------------------
local mod_desc = [[
  remove proc-tech and add extras in tech catalog
]]--------------------------------------------------

local catalog = {
	UI_PORTAL_CAT_TECH_SUIT		= {
		add	 = {
			{22,	'SUIT_REFINER2'}
		}
	},
	UI_PORTAL_CAT_TECH_SHIP		= {
		add  = {
			{4,		'PHOTONIX_CORE'},
			{'LAUNCHER_SPEC'},
			{'SHIPJUMP_SPEC'},
			{'HYPERDRIVE_SPEC'},
			{'SHIP_LIFESUP'}
		}
	},
	UI_PORTAL_CAT_TECH_TOOL		= {
		add  = {
			{3,		'LASER_XO'},
			{5,		'ATLAS_LASER'},
			{5,		'SENT_LASER'},
			{12,	'UT_BUI_SCAN2'},
			{12,	'UT_S10_SCAN'},
			{12,	'UT_BUI_SCAN'}
		}
	},
	UI_PORTAL_CAT_TECH_GUN		= {
		add  = {
			{3,		'BOLT_SM'},
			{20,	'FLAME'}
		}
	},
	UI_PORTAL_CAT_TECH_WEIRD	= {
		add  = {
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
}

local catalogue_source	= 'METADATA/REALITY/CATALOGUECRAFTING.MBIN' --<< preload_source
local mbin_table		= LoadRuntimeMbin(catalogue_source)
local categories		= mbin_table and mbin_table.template.Categories or {}
-- * on error fails silently and results in an empty catalog

for _,cat in ipairs(categories) do
	local pattern	= cat.CategoryID:find('_FRE') and '^U_FR_.+[123]$' or '^U_.+[1234X]$'
	local T			= {}

	for _,item in ipairs(cat.Items) do
		-- filter proc-tech from the lists except top level freighter proc-tech
		if not item.Value:find(pattern) then
			T[#T+1] = item.Value
		end
	end
	if not catalog[cat.CategoryID] then catalog[cat.CategoryID] = {} end
	-- add extras (if exists)
	for _,item in ipairs(catalog[cat.CategoryID].add or {}) do
		if item[2] then
			table.insert(T, item[1], item[2])
		else
			T[#T+1] = item[1]
		end
	end
	catalog[cat.CategoryID].tech = T
end

local ECT = {
	{
		REPLACE_TYPE 		= 'All',
		PRECEDING_KEY_WORDS	= 'Items',
		REMOVE				= 'Section'
	}
}
for id, item in pairs(catalog) do
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {'CategoryID', id},
		ADD					= ToExml(StringArray(item.tech, 'Items', 10))
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '__META tech catalog.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.47',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= catalogue_source,
		EXML_CHANGE_TABLE	= ECT
	}
}}}}

-- keep S 				>> {^U_.+[124X]X$}
-- keep freighter S		>> {^U_FR_.+[123]$}
-- remove all proc tech	>> {^U_.+[1234X]$}