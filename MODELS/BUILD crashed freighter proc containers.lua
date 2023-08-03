------------------------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/scene_tools.lua')
------------------------------------------------------------------------------------------
mod_desc = [[
  proceduraly-placed containers in the crashed freigther - instead of constant placement
]]----------------------------------------------------------------------------------------

local containers = {
	{
		name = '_OutLeft_',
		form = {
			{45, -4.6, -46, 310, 65, -33.5, 0.6, 0.6, 0.6},
			{70.8, -4.2, -52.3, -96.2, 46.62, -13.5, 0.6, 0.6, 0.6},
			{27.2, -1.7, -48.5, 10, 45, 5, 0.5, 0.5, 0.5},
			{62, -4.5, -45, 0, 105, 30, 0.5, 0.5, 0.5}
		}
	},
	{
		name = '_OutBack_',
		form = {
			{-5, 35.5, 85.6, -9, 55, -28, 0.6, 0.6, 0.6},
			{-58.49, -3.4, 23.5, -29.0, 122.0, -165.8, 0.8, 0.8, 0.8},
			{-79, -3.8, 16, 0, -20, 0, 0.5, 0.5, 0.5},
			{-42.4, -3.4, 16.4, -55, 30, 115, 0.4, 0.4, 0.4}
		}
	},
	{
		name = '_FrontLt_',
		form = {
			{40.6, -5.9, -19.6, 2, -8, 175.4, 0.5, 0.5, 0.5},
			{41.5, -6.2, -6.5, 0.5, 171, -10.4, 0.6, 0.6, 0.6},
			{32.4, -7.6, -5.2, -11, 80, 0, 0.5, 0.5, 0.5}
		}
	},
	{
		name = '_CenterDn_',
		form = {
			{45.4, -4.3, 23.3, 5, 210, -2, 0.4, 0.4, 0.4},
			{57.5, -5.1, 21.5, 30, 61.0, 5.4, 0.4, 0.4, 0.4},
			{55.5, -1.9, 16.5, 260, 75, 5, 0.6, 0.6, 0.6},
			{43, -5.1, 13, -1, -10, 8, 0.6, 0.6, 0.6}
		}
	},
	{
		name = '_RightUp_',
		form = {
			{58.5, -4.5, 57.2, -70.5, 30.1, 15.4, 0.6, 0.6, 0.6},
			{52.5, 4.6, 65.7, 0, -10, 8, 0.6, 0.6, 0.6},
			{37.7, 1.2, 42.4, -1.2, -5.1, 9.8, 0.3, 0.3, 0.3},
			{31.8, 1.1, 63.6, -10, -80, 0, 0.3, 0.3, 0.3}
		}
	},
	{
		name = '_LeftUp_',
		form = {
			{72.2, -5.2, -0.5, 240, 20, -30, 0.5, 0.5, 0.5},
			{71.6, 11.1, -3.6, 280, -140, -60, 0.4, 0.4, 0.4},
			{77.5, 5.7, 3, 8, 270, 0, 0.6, 0.6, 0.6},
			{79, 5.7, -5.8, 1, -15, 10.4, 0.7, 0.7, 0.7}
		}
	}
}

local function AddSceneNodes()
	local T = {}
	for _,scn in ipairs(containers) do
		for i=1, #scn.form do
			T[#T+1] = ScNode(scn.name..string.char(64 + i), 'LOCATOR')
			T[#T+1] = ScNode(
				scn.name..string.char(64 + i), 'REFERENCE', {
					ScTransform(scn.form[i]),
					ScAttributes({
						{'SCENEGRAPH', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/PARTS/CRASH_CONTAINER.SCENE.MBIN'}
					})
				}
			)
		end
	end
	return T
end

local function AddDescriptors()
	local T = {}
	for _,scn in ipairs(containers) do
		local tmp = {
			META		= {'value', 'TkResourceDescriptorList.xml'},
			TypeId		= scn.name:upper(),
			Descriptors	= {META = {'name', 'Descriptors'}}
		}
		for i=1, #scn.form do
			tmp.Descriptors[#tmp.Descriptors+1] = {
				META	= {'value', 'TkResourceDescriptorData.xml'},
				Id		= (scn.name..string.char(64 + i)):upper(),
				Name	= scn.name..string.char(64 + i),
				Chance	= 0
			}
		end
		T[#T+1] = tmp
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL crashed freighter proc containers.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,UNUSED_VARIABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/MODULES/LARGEROOM.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/MODULES/SMALLROOM.SCENE.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'HeightAdjust1'},
				REMOVE				= 'Section'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'HeightAdjust3'},
					{'Name', 'HeightAdjust4'}
				},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LargeCargoRoomRef'},
				ADD_OPTION			= 'AddAfterSection',
				ADD 				= ToExml(AddSceneNodes())
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER.DESCRIPTOR.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'List',
				ADD					= ToExml(AddDescriptors())
			}
		}
	}
}}}}