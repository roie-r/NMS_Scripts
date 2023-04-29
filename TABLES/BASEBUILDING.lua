-------------------------------------------------------------------
mod_desc = [[
  Disable restrictions on collision, scaling, rotating & freighter
  Increase power generation and storage
  Portable exocraft summon garage
]]-----------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '__TABLE BASEBUILDING.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/BASEBUILDINGOBJECTSTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_CHANGE_TABLE 	= {
					{'CanChangeColour',				true},
					{'CanChangeMaterial',			true},
					{'CanRotate3D',					true},
					{'CanScale',					true},
					{'CheckPlaceholderCollision',	false}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'BUILD_REFINER3'},
				VALUE_CHANGE_TABLE 	= {
					{'RegionLimit',	0}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'PLANTER'},
					{'ID', 'PLANTERMEGA'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'IsPlaceable',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'COOKER'},
				VALUE_CHANGE_TABLE 	= {
					{'CloseMenuAfterBuild',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SUMMON_GARAGE'}, -- ANTENNA0
				VALUE_CHANGE_TABLE 	= {
					{'EditsTerrain',		false},
					{'CloseMenuAfterBuild',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SUMMON_GARAGE'},
				PRECEDING_KEY_WORDS = 'PlacementScene',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/ANTENNA0_PLACEMENT.SCENE.MBIN'}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'U_EXTRACTOR_S'},
					{'ID', 'U_GASEXTRACTOR'},
					{'ID', 'U_SOLAR_S'},
					{'ID', 'U_SILO_S'},
				},
				VALUE_CHANGE_TABLE 	= {
					{'Rate',		1.8},
					{'Storage',		4}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'U_BIOGENERATOR'},
				VALUE_CHANGE_TABLE 	= {
					{'DependentRate', 80}	-- 50
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'BUILDLIGHT'},
					{'ID', 'BUILDLIGHT2'},
					{'ID', 'BUILDLIGHT3'},
					{'ID', 'SUMMON_GARAGE'},
					{'ID', 'HEATER'},
					{'ID', 'BASE_TOYCUBE'},
					{'ID', 'BASE_TOYSPHERE'},
					{'ID', 'BASE_TOYJELLY'},
					{'ID', 'BASE_TOYCORE'},
					{'ID', 'S_WATERVALVE0'},
					{'ID', 'S_SIGN_BAR0'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'BaseBuildingDecorationType', 'BuildingSurfaceNormal'}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'SubGroupName', 'PLANETPORTABLE'},
					{'SubGroupName', 'DECOFOLIAGE'},
					{'SubGroupName', 'DECOGLITCHES'}
				},
				REPLACE_TYPE 		= 'All',
				SECTION_UP			= 2,
				VALUE_CHANGE_TABLE 	= {
					{'BaseBuildingDecorationType', 'BuildingSurfaceNormal'}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'BUILDSAVE'},
					{'ID', 'COOKER'},
					{'ID', 'PLANTERMEGA'},
					{'ID', 'PLANTER'},
					{'ID', 'NPCBUILDERTERM'},
					{'ID', 'NPCVEHICLETERM'},
					{'ID', 'NPCWEAPONTERM'},
					{'ID', 'NPCFARMTERM'},
					{'ID', 'NPCSCIENCETERM'},
					{'ID', 'BUILDTERMINAL'},
					{'ID', 'TELEPORTER'},
					{'ID', 'DRESSING_TABLE'},
					{'ID', 'BUILD_REFINER3'},
					{'ID', 'BUILD_REFINER2'},
					{'ID', 'BUILDANTIMATTER'},
					{'ID', 'CYLINDERSHAPE'},
					{'ID', 'CUBESHAPE'},
					{'ID', 'CURVEPIPESHAPE'},
					{'ID', 'PIPESHAPE'},
					{'ID', 'PYRAMIDSHAPE'},
					{'ID', 'SPHERESHAPE'},
					{'ID', 'WEDGESHAPE'},
					{'ID', 'WEDGESMALLSHAPE'},
					{'ID', 'BASE_NEXUS1'},
					{'ID', 'BASE_NEXUS2'},
					{'ID', 'BASE_NEXUS3'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'BuildableOnFreighter', true}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'MAINROOM_WATER'},
					{'ID', 'MAINROOMCUBE_W'},
					{'ID', 'MOONPOOL'},
					{'ID', 'BUILDDOOR_WATER'},
					{'ID', 'CORRIDOR_WATER'},
					{'ID', 'CORRIDORL_WATER'},
					{'ID', 'CORRIDORT_WATER'},
					{'ID', 'CORRIDORX_WATER'},
					{'ID', 'CORRIDORV_WATER'},
					{'ID', 'BASE_BARNACLE'},
					{'ID', 'GARAGE_SUB'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'BuildableAboveWater', true}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/BASEBUILDINGPARTSTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', '_SUMMON_GARAGE'},
				PRECEDING_KEY_WORDS = 'Model',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/ANTENNA0.SCENE.MBIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', '_SUMMON_GARAGE'},
				PRECEDING_KEY_WORDS = 'Inactive',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/ANTENNA0_LOD.SCENE.MBIN'}
				}
			}
		}
	}
}}}}
