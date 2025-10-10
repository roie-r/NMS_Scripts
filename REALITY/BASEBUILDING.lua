-------------------------------------------------------------------
local mod_desc = [[
  Disable restrictions on collision, scaling, rotating & freighter
  Add galaxy toy to portable tech
  Increase power generation and storage
  Portable exocraft summon garage
]]-----------------------------------------------------------------

local function AddPrx(prx, T)
	for i=1, #T do T[i] = {prx, T[i]} end
	return T
end

local function AddBuildGroup(group, subg)
	return ([[
		<Property name="Groups" value="GcBaseBuildingEntryGroup">
			<Property name="Group" value="%s"/>
			<Property name="SubGroupName" value="%s"/>
		</Property>]]):format(group, subg)
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '+ REALITY basebuilding',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/BASEBUILDINGOBJECTSTABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_CHANGE_TABLE 	= {
					{'CanChangeColour',				true},
					{'CanChangeMaterial',			true},
					{'CanRotate3D',					true},
					{'CanScale',					true},
					{'CheckPlaceholderCollision',	false},
					{'FreighterBaseLimit',			0},
					{'PlanetBaseLimit',				0},
					{'RegionLimit',					0},
					{'PlanetLimit',					0}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'HOLO_DISCO_0', 'Group', 'FURNITURE'},
				VALUE_CHANGE_TABLE 	= {
					{'Group',		'BASE_TECH'},
					{'SubGroupName','TECHTECH'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= AddPrx('ID', {
					'CUBEFRAME',
					'BASE_TOYCORE'
				}),
				VALUE_CHANGE_TABLE 	= {
					{'BuildableOnPlanet',	true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= AddPrx('ID', {
					'BUILDBEACON'
				}),
				PRECEDING_KEY_WORDS = 'Groups',
				ADD					= AddBuildGroup('FREIGHTER_TECH', 'FRE_TECH_OTHER')
			},
			{
				SPECIAL_KEY_WORDS	= AddPrx('ID', {
					'BASE_TOYCORE'
				}),
				PRECEDING_KEY_WORDS = 'Groups',
				ADD					= AddBuildGroup('PLANET_TECH', 'PLANETPORTABLE')
			},
			{
				SPECIAL_KEY_WORDS	= AddPrx('ID', {
					'S9_WEAPONTREE',
					'S9_SHIPTREE'
				}),
				VALUE_CHANGE_TABLE 	= {
					{'CloseMenuAfterBuild',		true},
					{'BuildableOnFreighter',	true},
					{'BuildableOnPlanet',		true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= AddPrx('ID', {
					'CONTAINER[0-9]'
				}),
				PRECEDING_KEY_WORDS = 'Groups',
				ADD					= AddBuildGroup('FREIGHTER_IND', 'FRE_IND_SUB')
			},
			{
				SPECIAL_KEY_WORDS	= AddPrx('ID', {
					'GARAGE_.-',
					'S9_WEAPONTREE',
					'S9_SHIPTREE',
					'NPC.-TERM',
					'HOLO_DISCO_0',
					'S16_HEATER'
				}),
				PRECEDING_KEY_WORDS = 'Groups',
				ADD					= AddBuildGroup('FREIGHTER_TECH', 'FRE_TECH_OTHER')
			},
			{
				SPECIAL_KEY_WORDS	= AddPrx('ID', {
					'PLANTERMEGA',
					'PLANTER'
				}),
				PRECEDING_KEY_WORDS = 'Groups',
				ADD					= AddBuildGroup('FREIGHTER_BIO', 'FRE_BIO_SUB')
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'COOKER'},
				VALUE_CHANGE_TABLE 	= {
					{'CloseMenuAfterBuild',	true}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS 	= AddPrx('ID', {
					'U_.-EXTRACTOR.-',
					'U_SOLAR_S',
					'U_SILO_S',
				}),
				VALUE_CHANGE_TABLE 	= {
					{'Rate',		1.2},
					{'Storage',		2}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'U_BIOGENERATOR'},
				VALUE_CHANGE_TABLE 	= {
					{'DependentRate', 80}	-- 50
				}
			},
			{
				SPECIAL_KEY_WORDS 	= AddPrx('ID', {
					'BLD_RUINS.-',
					'BUILDLIGHT.-',
					-- 'SUMMON_GARAGE',
					'HEATER',
					'BASE_TOY.-',
					'S_WATERVALVE0',
					'S_SIGN_BAR0',
				}),
				VALUE_CHANGE_TABLE 	= {
					{'BaseBuildingDecorationType', 'BuildingSurfaceNormal'}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= AddPrx('SubGroupName', {
					'PLANETPORTABLE',
					'DECOFOLIAGE',
					'DECOGLITCHES'
				}),
				REPLACE_TYPE 		= 'All',
				SECTION_UP			= 2,
				VALUE_CHANGE_TABLE 	= {
					{'BaseBuildingDecorationType', 'BuildingSurfaceNormal'}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= AddPrx('ID', {
					'GARAGE_.-',
					-- 'BUILDSAVE',
					'COOKER',
					'PLANTER.-',
					'NPC.-TERM',
					'BUILDTERMINAL',
					'TELEPORTER',
					'DRESSING_TABLE',
					'BUILD_REFINER[23]',
					'BUILDANTIMATTER',
					'.-SHAPE',
					'BASE_NEXUS[1-3]',
					'BLD_BUI_H.-',
					'S16_HEATER',
					'CONTAINER[0-9]'
				}),
				VALUE_CHANGE_TABLE 	= {
					{'BuildableOnFreighter', true}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= AddPrx('ID', {
					'MAINROOMCUBE_W',
					'MOONPOOL',
					'.-_WATER',
					'BASE_BARNACLE',
					'GARAGE_SUB'
				}),
				VALUE_CHANGE_TABLE 	= {
					{'BuildableAboveWater', true}
				}
			},
			-- {
				-- SPECIAL_KEY_WORDS	= {'ID', 'S9_SHIPTREE'},
				-- PRECEDING_KEY_WORDS = 'PlacementScene',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Filename', ''}
				-- }
			-- },
		}
	},
	-- {
		-- MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/BASEBUILDINGPARTSTABLE.MBIN',
		-- EXML_CREATE			= false,
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- REPLACE_TYPE 		= 'All',
				-- SPECIAL_KEY_WORDS	= {'ID', '_BP_ANALYSERSHIP'},
				-- PRECEDING_KEY_WORDS = 'Model',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Filename', 'MODELS/SPACE/SPACESTATION/MODULARPARTSTYPEB/DOCK/CORVETTESTORAGEBOX.SCENE.MBIN'}
				-- }
			-- },
			-- {
				-- SPECIAL_KEY_WORDS	= {'ID', '_BP_ANALYSERSHIP'},
				-- PRECEDING_KEY_WORDS = 'Inactive',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Filename', ''}
				-- }
			-- }
		-- }
	-- }
}}}}
