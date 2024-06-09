--------------------------------------------------------------------------
local mod_desc = [[

TkVoxelGeneratorSettingsElement
	FloatingIslands
	GrandCanyon
	MountainRavines
	HugeArches
	Alien
	Craters
	Caverns
	Alpine
	LilyPad
	Desert
	WaterworldPrime
	FloatingIslandsPrime
	GrandCanyonPrime
	MountainRavinesPrime
	HugeArchesPrime
	AlienPrime
	CratersPrime
	CavernsPrime
	AlpinePrime
	LilyPadPrime
	DesertPrime

TkVoxelGeneratorData
	Min
	Max

	NoiseLayers
		TkNoiseUberLayerData
			Base
			Hill
			Mountain
			Rock
			UnderWater
			Texture
			Elevation
			Continent

	GridLayers
		TkNoiseGridData
			Small
			Large
			Resources_Heridium
			Resources_Iridium
			Resources_Copper
			Resources_Nickel
			Resources_Aluminium
			Resources_Gold
			Resources_Emeril

	Features
		TkNoiseFeatureData
			River
			Crater
			Arches
			ArchesSmall
			Blobs
			BlobsSmall
			Substance

	Caves
		Underground
			Mouth
			Tunnel

]]------------------------------------------------------------------------

local building_density_mod = {
	Shelter						= -3,
	Abandoned					= -1,
	Terminal					= -1,
	Shop						= -1,
	Outpost						= -0.2,
	Waypoint					= -2,
	Beacon						= -3,
	RadioTower					= -1,
	Observatory					= -1,
	Depot						= -1,
	Factory						= -2,
	Harvester					= -0.2,
	Plaque						= -2,
	Monolith					= -1,
	Portal						= 0,
	Ruin						= -0.2,
	Debris						= -1,
	DamagedMachine				= -2,
	DistressSignal				= -0.2,
	LandingPad					= 0,
	Base						= 0,
	MissionTower				= -1,
	CrashedFreighter			= -0.2,
	GraveInCave					= -0.2,
	StoryGlitch					= 0,
	TreasureRuins				= -0.2,
	GameStartSpawn				= 0,
	WaterCrashedFreighter		= -0.2,
	WaterTreasureRuins			= -0.2,
	WaterAbandoned				= -1,
	WaterDistressSignal			= -0.2,
	NPCDistressSignal			= -0.2,
	NPCDebris					= -0.2,
	LargeBuilding				= -0.2,
	Settlement_Hub				= 0,
	Settlement_LandingZone		= 0,
	Settlement_Bar				= 0,
	Settlement_Tower			= 0,
	Settlement_Market			= 0,
	Settlement_Small			= 0,
	Settlement_SmallIndustrial	= 0,
	Settlement_Medium			= 0,
	Settlement_Large			= 0,
	Settlement_Monument			= 0,
	Settlement_SheriffsOffice	= 0,
	Settlement_Double			= 0,
	Settlement_Farm				= 0,
	Settlement_Factory			= 0,
	Settlement_Clump			= 0,
	DroneHive					= 0,
	SentinelDistressSignal		= -0.4,
	AbandonedRobotCamp			= -0.2,
	RobotHead					= 0
}
local ECT = {}
for build, mod in pairs(building_density_mod) do
	if not build:find('Water') then
		ECT[#ECT+1] = {
			PRECEDING_KEY_WORDS	= {'BuildingPlacement', build},
			VALUE_CHANGE_TABLE 	= {
				{'MinHeight',		120},
				{'WaterPlacement',	'Underwater'}
			}
		}
	end
	if mod ~= 0 then
		ECT[#ECT+1] = {
			MATH_OPERATION 		= '+',
			PRECEDING_KEY_WORDS	= {'BuildingPlacement', build, 'Density'},
			VALUE_CHANGE_TABLE 	= {
				{'Low',			mod},
				{'Mid',			mod},
				{'Full',		mod},
				{'HalfWeird',	mod / 3}
			}
		}
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__TEST 10 terra firma 2.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.72',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/ENVIRONMENT/PLANETBUILDINGTABLE.MBIN',
		EXML_CHANGE_TABLE	= ECT
	},
	-- {
		-- MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/VOXELGENERATORSETTINGS.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- PRECEDING_KEY_WORDS	= {'FloatingIslands', 'NoiseLayers', 'Base'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'MaximumLOD',	3}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS	= {'FloatingIslands', 'NoiseLayers', 'Hill'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Height',		32}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS	= {'FloatingIslands', 'NoiseLayers', 'Mountain'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'RidgeErosion',0.01},
					-- {'Height',		64}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS	= {'FloatingIslands', 'NoiseLayers', 'Rock'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'MaximumLOD',	3}
				-- }
			-- },

		-- }
	-- },
	{
		MBIN_FILE_SOURCE	= {
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENBIGPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENCORALBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHIVESBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHQBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENINFESTEDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYWEIRDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADFROZENBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADFROZENWEIRDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENBIGPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENHQBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENINFESTEDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENPILLARBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYWEIRDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGELUSH/HUGELUSHBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGERING/HUGERINGBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEROCK/HUGEROCKBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGESCORCHED/HUGESCORCHBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGETOXIC/HUGETOXICBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEUWPLANT/HUGEUVWPLANTBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LAVA/LAVABIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBIGPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBUBBLESBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQTENTACLEBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHINFESTEDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYWEIRDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMABIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMBBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHULTRABIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/PLACEMENTVALUES/SPAWNDENSITYLIST.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEGLOWBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVERUINSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOBIGPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOINFESTEDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKECRYSTALSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHBIGPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHCORALBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDSHIELDTREEBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHINFESTEDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICBIGPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICINFESTEDBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICROCKYBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICSPORESBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICTENTACLESBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BEAMSTONE/BEAMSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BONESPIRE/BONESPIREBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/CONTOUR/CONTOURBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/ELBUBBLE/ELBUBBLEBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/FRACTALCUBE/FRACTCUBEBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HEXAGON/HEXAGONBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HOUDINIPROPS/HOUDINIPROPSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HYDROGARDEN/HYDROGARDENBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/IRRISHELLS/IRRISHELLSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/MSTRUCTURES/MSTRUCTBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/SHARDS/SHARDSBIOME.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/WIRECELLS/WIRECELLSBIOME.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Continent', 1},
					{'ForceContinentalNoise', true}
				}
			}
		}
	}
}}}}
