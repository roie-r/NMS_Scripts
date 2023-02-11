---------------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/~LIB/scene_tools.lua')
---------------------------------------------------------------------------
mod_desc = [[
  * original by Redmas
  Adds procedural parts, more wrecks and a few wrecks and space-encounter
  items to the derelict freighter encouter mission.
  - fixes lighting of space clock to avoid issues when near other objects.
]]-------------------------------------------------------------------------

local assets = {
	{
		name	= '_Acc_A',
		form	= {-100, 770, 20, 165, 130, -10, 4, 4, 4},
		path	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER.SCENE.MBIN'
	},{
		name	= '_Acc_B',
		form	= {-700, 1200, 220, 170, 40, 60, 4, 4, 4},
		path	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI.SCENE.MBIN'
	},{
		name	= '_Acc_C',
		form	= {900, -780, 132, 180, 0, 90, 4, 4, 4},
		path	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI2.SCENE.MBIN'
	},{
		name	= '_Acc_D',
		form	= {700, -840, 132, 90, 90, 0, 4, 4, 4},
		path	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI3.SCENE.MBIN'
	},{
		name	= '_Acc_E',
		form	= {-700, 1100, 220, 100, 40, 10, 4, 4, 4},
		path	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI.SCENE.MBIN'
	},{
		name	= '_Acc_F',
		form	= {-100, 770, 20, 165, 130, -10, 4, 4, 4},
		path	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI3.SCENE.MBIN',
		isnew	= true
	},{
		name	= '_Acc_G',
		form	= {-1100, 660, 140, 10, 30, 210, 4, 4, 4},
		path	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI2.SCENE.MBIN',
		isnew	= true
	},{
		name	= '_Front_A',
		form	= {410, 475, 532, -20, 80, 60, 2.4, 2.4, 2.4},
		path	= 'MODELS/SPACE/POI/WARRIORSILOS.SCENE.MBIN',
		hasloc	= true
	},{
		name	= '_Front_B',
		form	= {-113, 191, -83, 0, 0, 0, 1, 1, 1},
		path	= 'MODELS/SPACE/POI/WEIRDOBJECT2.SCENE.MBIN',
		hasloc	= true
	},{
		name	= '_Front_C',
		form	= {-110, 185, -87, 0, 0, 0, 1.4, 1.4, 1.4},
		path	= 'MODELS/SPACE/POI/SPACECLOCK.SCENE.MBIN',
		hasloc	= true
	},{
		name	= '_Front_D',
		form	= {-110, 185, -87, 0, 0, 0, 1.4, 1.4, 1.4},
		path	= 'MODELS/SPACE/POI/SPACEGYROSCOPE.SCENE.MBIN',
		hasloc	= true
	},{
		name	= '_Front_E',
		form	= {810, 845, 832, -20, 80, 60, 1.2, 1.2, 1.2},
		path	= 'MODELS/SPACE/POI/ASTEROID_BEACON.SCENE.MBIN',
		hasloc	= true
	},{
		name	= '_Front_F',
		form	= {-510, 555, 500, 330, -25, -55, 1.6, 1.6, 1.6},
		path	= 'MODELS/SPACE/POI/GATE_POI.SCENE.MBIN',
		hasloc	= true
	},{
		name	= '_AccSide_A',
		form	= {410, 375, -800, 120, 210, 190, 0.6, 0.6, 0.6},
		path	= 'MODELS/SPACE/POI/PILLARPOI.SCENE.MBIN',
		hasloc	= true
	}
}

local function AddSceneNodes()
	local T = {}
	for _,scn in pairs(assets) do
		if not scn.hasloc then
			T[#T+1] = ScNode(scn.name, 'LOCATOR')
		end
		T[#T+1] = ScNode(
			scn.name, 'REFERENCE', {
				ScTransform(scn.form),
				ScAttributes({
					{'SCENEGRAPH', scn.path},
					{'ATTACHMENT', 'MODELS/COMMON/SHARED/ENTITIES/SPIN.ENTITY.MBIN'}
				})
			}
		)
	end
	return ToExml(T)
end

local function AddDescriptors()
	local T = {}
	for _,scn in pairs(assets) do
		if scn.isnew then
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {'TypeId', scn.name:sub(1, scn.name:len()-1):upper()},
				PRECEDING_KEY_WORDS = 'Descriptors',
				ADD 				= ToExml({
					META	= {'value', 'TkResourceDescriptorData.xml'},
					Id		= scn.name:upper(),
					Name	= scn.name
				})
			}
		end
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL procedural derelicts.pak',
	LUA_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.08',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI.DESCRIPTOR.MBIN',
				'MODELS/SPACE/POI/DUNGEON.DESCRIPTOR.MBIN',
				'REMOVE'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/SPACE/POI/DUNGEON.DESCRIPTOR.MBIN',
		EXML_CHANGE_TABLE	= AddDescriptors()
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/SPACE/POI/DUNGEON.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RefDungeonEntrance'},
				ADD_OPTION			= 'AddAfterSection',
				ADD 				= AddSceneNodes()
			}
		}
	},
	{
	--	|space clock| dimmer light
		MBIN_FILE_SOURCE	= 'MODELS/SPACE/POI/SPACECLOCK.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', 'FALLOFF'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'quadrtic'}
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', 'FALLOFF_RATE'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		1.8}
				}
			}
		}
	},
}}},
	ADD_FILES	= {
		{
		--	add a spin entity to drifting wrecks
			FILE_DESTINATION = 'MODELS/COMMON/SHARED/ENTITIES/SPIN.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping({
				META = {'template', 'TkAttachmentData'},
				Components = {
					META = {'name', 'Components'},
					{
						META = {'value', 'TkRotationComponentData.xml'},
						Speed = 0.1,
						Axis = {
							META = {'Axis', 'Vector3f.xml'},
							x = 0.01,
							y = 0.01,
							z = 0.01
						},
						AlwaysUpdate = true,
						SyncGroup = -1
					}
				}
			})
		}
	}
}

	-- {
	-- --	|crashed freighter poi2| dimmer light
		-- MBIN_FILE_SOURCE	= {
			-- 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI.SCENE.MBIN',
			-- 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI2.SCENE.MBIN'
		-- },
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- REPLACE_TYPE 		= 'All',
				-- SPECIAL_KEY_WORDS	= {'Name', 'FALLOFF'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Value',		'quadrtic'}
				-- }
			-- },
			-- {
				-- REPLACE_TYPE 		= 'All',
				-- SPECIAL_KEY_WORDS	= {'Name', 'FALLOFF_RATE'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Value',		2}
				-- }
			-- },
			-- {
				-- REPLACE_TYPE 		= 'All',
				-- MATH_OPERATION 		= '*',
				-- SPECIAL_KEY_WORDS	= {'Name', 'INTENSITY'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Value',		0.8}
				-- }
			-- }
		-- }
	-- }
