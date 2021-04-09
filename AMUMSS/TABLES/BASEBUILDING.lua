--[[┎────────────────────────────────────────────────────────────
	┃ General tweaks to building parts
	┃ Set beacon and summon garage as the default of their group
────┸──────────────────────────────────────────────────────────]]
Build_On_Freighter = {
	dat = {
		'NPCVEHICLETERM',
		'PYRAMIDSHAPE',
		'WEDGESHAPE',
		'WEDGESMALLSHAPE',
		'CURVEPIPESHAPE',
		'SPHERESHAPE',
		'CUBESHAPE',
		'CYLINDERSHAPE'
	},
	Get = function(x)
		return {
			SPECIAL_KEY_WORDS	= {'ID', x},
			VALUE_CHANGE_TABLE 	= {
				{'BuildableOnFreighter', true}
			}
		}
	end
}

Build_Above_Water = {
	dat = {
		'MAINROOM_WATER',
		'MAINROOMCUBE_W',
		'MOONPOOL',
		'BUILDDOOR_WATER',
		'CORRIDOR_WATER',
		'CORRIDORL_WATER',
		'CORRIDORT_WATER',
		'CORRIDORX_WATER',
		'CORRIDORV_WATER',
		'BASE_BARNACLE',
		'WATERBUBBLE',
		'GARAGE_SUB'
	},
	Get = function(x)
		return {
			SPECIAL_KEY_WORDS	= {'ID', x},
			VALUE_CHANGE_TABLE 	= { {'BuildableAboveWater', true} }
		}
	end
}

Decoration_Type = {
	dat = {
		{'ID',		'BASE_WPLANT1',		nil,	0},
		{'ID',		'BASE_WPLANT2',		nil,	0},
		{'ID',		'BASE_WPLANT3',		nil,	0},
		{'ID',		'BASE_TOYCUBE',		nil,	0},
		{'ID',		'BASE_TOYSPHERE',	nil,	0},
		{'ID',		'BASE_TOYJELLY',	nil,	0},
		{'ID',		'BASE_TOYCORE',		nil,	0},
		{'ID',		'HEATER',			nil,	0},
		{'Value',	'GLITCH',			'ALL',	2}
	},
	Get = function(x)
		return {
			REPLACE_TYPE 		= x[3],
			SPECIAL_KEY_WORDS	= {x[1], x[2]},
			SECTION_UP			= x[4],
			VALUE_CHANGE_TABLE 	= { {'BaseBuildingDecorationType', 'SurfaceNormal'} }
		}
	end
}

function BuildExmlChangeTable(tbl)
	local T = {}
	for i = 1, #tbl.dat do table.insert(T, tbl.Get(tbl.dat[i])) end
	return T
end

Source_Table_Basebuild = 'METADATA\REALITY\TABLES\BASEBUILDINGTABLE.MBIN'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '__TABLE BASEBUILDING.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.35',
	MOD_BATCHNAME		= '_TABLES ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= Source_Table_Basebuild,
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				VALUE_CHANGE_TABLE 	= {
					{'CheckPlaceholderCollision',	false},
					{'CanChangeColour',				true},
					{'CanChangeMaterial',			true},
					{'CanRotate3D',					true},
					{'CanScale',					true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BUILD_REFINER3'},
				VALUE_CHANGE_TABLE 	= {
					{'RegionLimit',			8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'PLANTER'},
				VALUE_CHANGE_TABLE 	= {
					{'IsPlaceable',			true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'PLANTERMEGA'},
				VALUE_CHANGE_TABLE 	= {
					{'IsPlaceable',			true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'COOKER'},
				VALUE_CHANGE_TABLE 	= {
					{'CloseMenuAfterBuild',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SUMMON_GARAGE'},
				VALUE_CHANGE_TABLE 	= {
					{'CanPickUp',			true},
					{'EditsTerrain',		false},
					{'CloseMenuAfterBuild',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'WATERBUBBLE'},
				VALUE_CHANGE_TABLE 	= {
					{'CanPickUp',			true},
					{'BuildableOnPlanet',	true},
					{'EditsTerrain',		false},
					{'CloseMenuAfterBuild',	true},
					{'Value',				'PLANET_TECH'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SUMMON_GARAGE'},
				PRECEDING_KEY_WORDS = 'Model',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/SIGNALSCANNER.SCENE.MBIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SUMMON_GARAGE'},
				PRECEDING_KEY_WORDS = 'InactiveModel',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/SIGNALSCANNER/SIGNALSCANNER_LOD.SCENE.MBIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'U_PORTALLINE'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'UTILITY_POWER'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BUILDHARVESTER', 'Value', 'BASE_TECH'},
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BUILDGASHARVEST', 'Value', 'BASE_TECH'},
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS = {'Name', 'UI_BUILD_PATH_PLANET_TECH'},
				VALUE_CHANGE_TABLE 	= {
					{'DefaultItem', 'BUILDBEACON'}
				}
			},
			{
				SPECIAL_KEY_WORDS = {'Name', 'UI_BUILD_PATH_VEHICLES'},
				VALUE_CHANGE_TABLE 	= {
					{'DefaultItem', 'SUMMON_GARAGE'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Basebuild,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Build_On_Freighter)
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Basebuild,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Build_Above_Water)
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Basebuild,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Decoration_Type)
	}
}}}}
