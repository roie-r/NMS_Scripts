----------------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
----------------------------------------------------------------------------------
mod_desc = [[
  Fixes fighter's wingsK missing LOD sections and increases it to to 5 LOD stages
  Fixes the "unusual" decals descriptor choices so all decals show together
]]--------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__SHIP fighter wingK fixes.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.45',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.SCENE.MBIN',
		EXML_CHANGE_TABLE	= (
			function()
				vals = {
					{atr='BATCHSTARTPHYSI',	37668,		41736,		53247},
					{atr='VERTRSTARTPHYSI',	21866,		24590,		31380},
					{atr='VERTRENDPHYSICS',	24589,		29311,		33122},
					{atr='BATCHCOUNT', 		4068,		7890,		2856},
					{atr='VERTRENDGRAPHIC', 2723,		4721,		1742},
					{atr='BOUNDHULLST', 	212,		248,		328},
					{atr='BOUNDHULLED', 	248,		292,		352},
					{atr='AABBMINX', 		-2.891207,	-3.749691,	-3.733948},
					{atr='AABBMINY', 		0.836564,	nil,		0.712383},
					{atr='AABBMINZ', 		-1.380045,	-2.157869,	-2.149216},
					{atr='AABBMAXX', 		nil,		3.749691,	3.733998},
					{atr='AABBMAXY', 		1.77087,	nil,		1.885870},
					{atr='AABBMAXZ', 		0.631633,	1.163431,	0.729330},
					{atr='MESHLINK',		'WingsK_ALODShape1', 'WingsK_ALODShape1', 'WingsK_ALODShape1'}
				}
				local T = {}
				for i, lod in ipairs({'WingsK_ALOD', 'SUB1WingsK_ALOD', 'SUB3WingsK_ALOD'}) do
					for _,v in ipairs(vals) do
						if v[i] then
							T[#T+1] = {
								SECTION_ACTIVE		= -1,
								SPECIAL_KEY_WORDS	= {'Name', (lod..'0'), 'Name', v.atr},
								VALUE_CHANGE_TABLE 	= { {'Value', v[i]} }
							}
						end
					end
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'Name', (lod..'0')},
						VALUE_CHANGE_TABLE 	= { {'Name', (lod..'1')} }
					}
				end
				T[#T+1] = {
					SPECIAL_KEY_WORDS 	= {
						{'Name', 'LODDIST1'},
						{'Name', 'LODDIST2'},
						{'Name', 'LODDIST3'},
					},
					REMOVE = 'Section'
				}
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
					VALUE_CHANGE_TABLE 	= { {'Value', 5} }
				}
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
					ADD_OPTION			= 'AddAfterSection',
					ADD 				= ToExml({
						META	= {'value', 'TkSceneNodeAttributeData.xml'},
						Name	= 'ATTACHMENT',
						Value	= 'MODELS/COMMON/SPACECRAFT/SHARED/ENTITIES/SHAREDLODDISTANCES.ENTITY.MBIN'
					})
				}
				return T
			end
		)()
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.DESCRIPTOR.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Id', '_RECTANGLERIGHT_ALOD1'},
					{'Id', '_LOGORIGHT_ALOD1'},
					{'Id', '_LETTERRIGHT_ALOD1'}
				},
				REMOVE = 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', '_WINGSK_A'},
				PRECEDING_KEY_WORDS = {'TkModelDescriptorList.xml', 'List'},
				ADD				 	= (
					function()
						local T = {}
						for _,rsc in pairs({
							{id='_RECTANGLELEFT',	name='_RectangleRight_ALOD1'},
							{id='_LOGOLEFT_',		name='_logoRight_ALOD1'},
							{id='_LETTERLEFT_',		name='_LetterRight_ALOD1'}
						}) do
							T[#T+1] = {
								META		= {'value', 'TkResourceDescriptorList.xml'},
								TypeId		= rsc.id,
								Descriptors = {
									META		= {'name', 'Descriptors'},
									{
										META	= {'value', 'TkResourceDescriptorData.xml'},
										Id		= rsc.name:upper(),
										Name	= rsc.name
									}
								}
							}
						end
						return ToExml(T)
					end
				)()
			}
		}
	}
}}}}

-- local function MoveDecals()
	-- local decals = {
		-- 'logoRight_A',
		-- 'logoRight_A1',
		-- 'RectangleRight_A',
		-- 'RectangleRight_A1',
		-- 'LetterRight_A',
		-- 'LetterRight_A1'
	-- }
	-- local T = {}
	-- for _,dec in ipairs(decals) do
		-- local node = '_'..decal..'LOD'..'0'
		-- T[#T+1] = {
			-- SPECIAL_KEY_WORDS	= {'Name', node},
			-- SECTION_SAVE_TO		= 'tk_scene_node_data'
		-- }
		-- T[#T+1] = {
			-- SECTION_EDIT 		= 'tk_scene_node_data',
			-- VALUE_CHANGE_TABLE 	= {
				-- {'Name',		dec}
			-- }
		-- }
		-- T[#T+1] = {
			-- SPECIAL_KEY_WORDS	= {'Name', '_WingsK_A'},
			-- PRECEDING_KEY_WORDS	= 'Children',
			-- SECTION_ADD_NAMED 	= 'tk_scene_node_data'
		-- }
	-- end
	-- rem = #T+1
	-- T[rem] = {
		-- SKW		= {},
		-- REMOVE	= 'Section'
	-- }
	-- for _,dec in ipairs(decals) do
		-- T[rem].SKW[#T[rem].SKW+1] = {'Name', '_'..decal..'LOD'..'0'}
		-- T[rem].SKW[#T[rem].SKW+1] = {'Name', '_'..decal..'LOD'..'1'}
	-- end
	-- return T
-- end