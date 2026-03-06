----------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
----------------------------------------------------------------------
local mod_desc = [[
  procedurally-placed keys - Only 3 keys will appear in any instance
  4 Alternate placements for the treasure chest
]]--------------------------------------------------------------------

local key_nodes = {
	tid	 = '_CRATES_KEY_',
	name = '_Cratekey_',
	form = {
		{-26.1,	-7.45,	-3.5,	21.0,	31.0,	1.0},	-- below side walk
		{47.8,	-10.3,	8.2,	30.2,	28,		-16.7},	-- bottom of slant
		{37,	-3.3,	18.8,	-2,		5,		6},		-- in tower
		{4.6,	-7.85,	30.0,	-18,	-160,	4.0},	-- mid center & tower
		{-0.3,	-19.15,	-45,	0,		270,	5},		-- stairs bottom
		{-1,	-6.4,	-38.3,	-4.7,	9.2,	-1.3},	-- stairs top
	}
}

local lock_nodes = {
	tid	 = '_CRATES_LOCK_',
	name = '_Cratelock_',
	form = {
		{-0.9,	-8.16,	0.5,	1.7,	2.4,	4.9},		-- original center
		{-0.92,	-12,	-31,	4,		-175,	-1.2},		-- behind stairs
		{33.4,	0.55,	23.2,	2.0,	-35,	3.5, 0.8},	-- on tower
		{-25.6,	-5.84,	-17.1,	8.0,	-177,	5.0},		-- end of side walk
	}
}

local function addChar(n, i, u)
	local s = n..string.char(64 + i)
	return u and s:upper() or s
end

-- build scene nodes for crates and keys
local mx_scn = {}
for i, f in ipairs(key_nodes.form) do
	mx_scn[#mx_scn+1] = {
		name	= addChar(key_nodes.name, i),
		ntype	= 'REFERENCE',
		form	= f,
		attr	= {
			SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/CRATEKEY.SCENE.MBIN'
		}
	}
end
for i, f in ipairs(lock_nodes.form) do
	mx_scn[#mx_scn+1] = {
		name	= addChar(lock_nodes.name, i),
		ntype	= 'REFERENCE',
		form	= f,
		attr	= {
			SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/CRATELOCK.SCENE.MBIN'
		}
	}
end

local function rsrc3Group(name, ix, cmb)
	return {
		meta	= {name='Descriptors', value='TkResourceDescriptorData'},
		Id		= addChar(name, cmb[1], true),
		Name	= addChar(name, cmb[1]),
		Children= {
			meta = {name='Children'},
			{
				meta = {name='Children', value='TkModelDescriptorList'},
				TkModelDescriptorList = {
					meta = {name='TkModelDescriptorList'},
					List = {
						meta = {name='List'},
						{
							meta	= {name='List', value='TkResourceDescriptorList'},
							TypeId	= addChar(name..'ID2_', ix, true),
							Descriptors = {
								meta = {name='Descriptors'},
								{
									meta	= {name='Descriptors', value='TkResourceDescriptorData'},
									Id		= addChar(name, cmb[2], true),
									Name	= addChar(name, cmb[2]),
									Children= {
										meta = {name='Children'},
										{
											meta = {name='Children', value='TkModelDescriptorList'},
											TkModelDescriptorList = {
												meta = {name='TkModelDescriptorList'},
												List = {
													meta = {name='List'},
													{
														meta	= {name='List', value='TkResourceDescriptorList'},
														TypeId	= addChar(name..'ID3_', ix, true),
														Descriptors = {
															meta = {name='Descriptors'},
															{
																meta	= {name='Descriptors', value='TkResourceDescriptorData'},
																Id		= addChar(name, cmb[3], true),
																Name	= addChar(name, cmb[3])
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
end
-- build descriptor for proc-gen scene nodes
local mx_dsc = {
	-- file wrapper template
	meta = {template='cTkModelDescriptorList'},
	List = {
		meta = {name='List'},
		Keys = {
		-- keys descriptor
			meta		= {name='List', value='TkResourceDescriptorList'},
			TypeId		= key_nodes.tid,
			Descriptors	= {
				meta = {name='Descriptors'}
			}
		},
		Locks = {
		-- locks descriptor
			meta		= {name='List', value='TkResourceDescriptorList'},
			TypeId		= lock_nodes.tid,
			Descriptors	= {
				meta = {name='Descriptors'}
			}
		}
	}
}
local key_groups = {}
--	generate combinations of 3 from all key_nodes
for i = 1, #key_nodes.form - 2 do
	for j = i + 1, #key_nodes.form - 1 do
		for k = j + 1, #key_nodes.form do
			key_groups[#key_groups+1] = {i, j, k}
		end
	end
end
-- Add keys
for i, cmb in ipairs(key_groups) do
	table.insert(mx_dsc.List.Keys.Descriptors, rsrc3Group(key_nodes.name, i, cmb))
end
-- Add lock crates
for i=1, #lock_nodes.form do
	table.insert(mx_dsc.List.Locks.Descriptors, {
		meta	= {name='Descriptors', value='TkResourceDescriptorData'},
		Id		= addChar(lock_nodes.name, i, true),
		Name	= addChar(lock_nodes.name, i)
	})
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ MODEL treasure ruin proc crates',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/UNDERGROUNDRUINS.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'RefCrate.-'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Layout_1'},
				PRECEDING_KEY_WORDS = 'Children',
				ADD 				= AddSceneNodes(mx_scn)
			}
		}
	},
	-- {--	bug fix
		-- MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/MODULES/ROOM_ROOF.DESCRIPTOR.MBIN',
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- REPLACE_TYPE		= 'All',
				-- PRECEDING_KEY_WORDS	= 'ReferencePaths',
				-- REMOVE				= 'Section'
			-- }
		-- }
	-- }
}}},
	ADD_FILES	= {
		{
			FILE_DESTINATION = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/UNDERGROUNDRUINS.DESCRIPTOR.MXML',
			FILE_CONTENT	 = ToMxmlFile(mx_dsc)
		}
	}
}