------------------------------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/~LIB/scene_tools.lua')
------------------------------------------------------------------------------------------
mod_desc = [[
  proceduraly-placed containers in the crashed freigther - instead of constant placement
]]----------------------------------------------------------------------------------------

local containers = {
	{
		name = '_OutLeft_',
		form = {
			{62.2, -4.1, -64.0, -66.2, 66.62, -33.5, 0.3, 0.3, 0.3},
			{70.8, -4.2, -52.3, -96.2, 46.62, -13.5, 0.3, 0.3, 0.3},
			{74.7, -5.8, -50.1, -26.2, 96.62, -93.5, 0.3, 0.3, 0.3},
			{77.7, -6.2, -50.1, -6.2, 6.62, -113.5, 0.3, 0.3, 0.3},
		}
	},
	{
		name = '_OutBack_',
		form = {
			{-6.2, 36.1, 83.8, 0, 0.5, 0, 0.6, 0.6, 0.6},
			{-58.49, -3.4, 23.5, -29.0, 122.0, -165.8, 0.8, 0.8, 0.8},
			{-78.5, -3.6, 19.3, -28.2, 110.8, -166.9, 0.5, 0.5, 0.5},
			{-42.4, -3.4, 16.4, -29.2, 122.9, -162.1, 0.4, 0.4, 0.4},
		}
	},
	{
		name = '_FrontLt_',
		form = {
			{40.6, -6.3, -19.3, 8.5, 2.2, 175.42, 0.5, 0.5, 0.5},
			{41.5, -6.2, -6.47, 0.5, 170.9, -10.42, 0.6, 0.6, 0.6},
			{33.0, -7.8, -6.47, -6.5, 120.0, -5.42, 0.5, 0.5, 0.5}
		}
	},
	{
		name = '_CenterDn_',
		form = {
			{44.5, -4.45, 22.5, 0, 0, 12, 0.4, 0.4, 0.4},
			{57.5, -4.8, 21.5, 39.5, 61.0, 5.2, 0.4, 0.4, 0.4},
			{52.0, -3.5, 16.0, 0.2, 15.0, -12.2, 0.6, 0.6, 0.6},
		}
	},
	{
		name = '_RightUp_',
		form = {
			{58.5, -4.5, 57.2, -70.5, 30.1, 15.4, 0.6, 0.6, 0.6},
			{52.5, 4.7, 65.7, -1.2, -5.1, 10.4, 0.6, 0.6, 0.6},
			{38.0, 1.2, 42.4, -1.2, -5.1, 10.4, 0.3, 0.3, 0.3}
		}
	},
	{
		name = '_LeftUp_',
		form = {
			{72.2, -5.2, -0.5, 240, 20, -30, 0.5, 0.5, 0.5},
			{72.2, 10.8, -2.5, 250, 50, 110, 0.6, 0.6, 0.2},
			{78.2, 5.6, -4.5, -1.2, -5.1, 10.4, 0.7, 0.7, 0.7}
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
	NMS_VERSION			= 4.08,
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
				FOREACH_SKW_GROUP 	= {
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