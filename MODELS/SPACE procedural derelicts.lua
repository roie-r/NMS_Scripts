---------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/scene_tools.lua')
---------------------------------------------------------------------------
mod_desc = [[
  Adds procedural parts, more wrecks and a few wreck -and space-encounter
  items to the derelict freighter encounter mission.
  Adds a slow tumble to floating items to make the scene more dynamic
  * fixes space clock lighting to avoid issues when near other objects.
  * original mod by Redmas
]]-------------------------------------------------------------------------

local assets = {
	{
		name = '_Acc_',
		{
			form	= {-100, 770, 20, 165, 130, -10, 4, 4, 4},
			model	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER.SCENE.MBIN',
			addloc	= true
		},
		{
			form	= {-700, 1200, 220, 170, 40, 60, 4, 4, 4},
			model	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI.SCENE.MBIN',
			addloc	= true
		},
		{
			form	= {900, -780, 132, 180, 0, 90, 4, 4, 4},
			model	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI2.SCENE.MBIN',
			addloc	= true
		},
		{
			form	= {700, -840, 132, 90, 90, 0, 4, 4, 4},
			model	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI3.SCENE.MBIN',
			addloc	= true
		},
		{
			form	= {-700, 1100, 220, 100, 40, 10, 4, 4, 4},
			model	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI.SCENE.MBIN',
			addloc	= true
		},
		{
			form	= {-100, 770, 20, 165, 130, -10, 4, 4, 4},
			model	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI3.SCENE.MBIN',
			addloc	= true
		},
		{
			form	= {-1100, 660, 140, 10, 30, 210, 4, 4, 4},
			model	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/CRASHEDFREIGHTER_SPACEPOI2.SCENE.MBIN',
			addloc	= true
		}
	},
	{
		name = '_Front_',
		{
			form	= {410, 475, 532, -20, 80, 60, 2.4, 2.4, 2.4},
			model	= 'MODELS/SPACE/POI/WARRIORSILOS.SCENE.MBIN'
		},
		{
			form	= {-113, 191, -83, 16, 16, 16, 1, 1, 1},
			model	= 'MODELS/SPACE/POI/WEIRDOBJECT2.SCENE.MBIN'
		},
		{
			form	= {-110, 185, -87, 16, 16, 16, 1.4, 1.4, 1.4},
			model	= 'MODELS/SPACE/POI/SPACECLOCK.SCENE.MBIN'
		},
		{
			form	= {-110, 185, -87, 16, 16, 16, 1.4, 1.4, 1.4},
			model	= 'MODELS/SPACE/POI/SPACEGYROSCOPE.SCENE.MBIN'
		},
		{
			form	= {810, 845, 832, -20, 80, 60, 1.2, 1.2, 1.2},
			model	= 'MODELS/SPACE/POI/ASTEROID_BEACON.SCENE.MBIN'
		},
		{
			form	= {-510, 585, 500, 330, -25, -55, 1.2, 1.2, 1.2},
			model	= 'MODELS/SPACE/POI/GATE_POI.SCENE.MBIN'
		},
		{
			form	= {32, 100, -296, 16, 16, 16, 1.4, 1.4, 1.4},
			model	= 'MODELS/SPACE/POI/MEMORYLIFEBOAT.SCENE.MBIN'
		}
	},
	{
		name = '_AccSide_',
		{
			form	= {410, 375, -800, 120, 210, 190, 0.6, 0.6, 0.6},
			model	= 'MODELS/SPACE/POI/PILLARPOI.SCENE.MBIN'
		},
		{
			form	= {410, 375, -800, 120, 210, 190, 1, 1, 1},
			model	= 'MODELS/SPACE/POI/SPACECLOCK.SCENE.MBIN'
		}
	}
}

local function AddSceneNodes()
	local T = {}
	for _, ast in ipairs(assets) do
		for i, scn in ipairs(ast) do
			if scn.addloc then
				T[#T+1] = ScNode(ast.name..string.char(64 + i), 'LOCATOR')
			end
			T[#T+1] = ScNode(
				ast.name..string.char(64 + i), 'REFERENCE', {
					ScTransform(scn.form),
					ScAttributes({
						{'SCENEGRAPH', scn.model},
					--	add a spin entity to drifting wrecks
						{'ATTACHMENT', 'MODELS/COMMON/SHARED/ENTITIES/SPIN.ENTITY.MBIN'}
					})
				}
			)
		end
	end
	return ToExml(T)
end

local function GenerateDescriptor()
	local T = {
		META = {'template', 'TkModelDescriptorList'},
		List = {META = {'name', 'List'}}
	}
	for _,ast in ipairs(assets) do
		local tmp = {
			META		= {'value', 'TkResourceDescriptorList.xml'},
			TypeId		= ast.name:upper(),
			Descriptors	= {META = {'name', 'Descriptors'}}
		}
		for i,scn in ipairs(ast) do
			tmp.Descriptors[#tmp.Descriptors+1] = {
				META	= {'value', 'TkResourceDescriptorData.xml'},
				Id		= (ast.name..string.char(64 + i)):upper(),
				Name	= ast.name..string.char(64 + i),
			}
		end
		T.List[#T.List+1] = tmp
	end
	return T
end

local spin_entity = {
	META = {'template', 'TkAttachmentData'},
	Components = {
		META = {'name', 'Components'},
		{
			META  = {'value', 'TkRotationComponentData.xml'},
			Speed = 0.001,
			Axis  = {
				META = {'Axis', 'Vector3f.xml'},
				x = 1,
				y = 1,
				z = 1
			},
			AlwaysUpdate = true,
			SyncGroup    = -1
		}
	}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL procedural derelicts.pak',
	LUA_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.36',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
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
			FILE_DESTINATION = 'MODELS/SPACE/POI/DUNGEON.DESCRIPTOR.EXML',
			FILE_CONTENT	 = FileWrapping(GenerateDescriptor())
		},
		{
			FILE_DESTINATION = 'MODELS/COMMON/SHARED/ENTITIES/SPIN.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping(spin_entity)
		}
	}
}
