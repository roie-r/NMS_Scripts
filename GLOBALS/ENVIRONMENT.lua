---------------------------------------------------------
local mod_desc = [[
  LOD levels increase
  Clouds size gradient decrease, cloud movement reduced
  reduce biome lighting effects indoors
]]-------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ GC environment',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.06',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'GCENVIRONMENTGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			-- {
				-- MATH_OPERATION 		= '*',
				-- SPECIAL_KEY_WORDS	= {'Ultra', 'TkLODSettingsData'},
				-- PRECEDING_KEY_WORDS	= 'LODAdjust',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Ignore',		2},
					-- {'Ignore',		2},
					-- {'Ignore',		2},
					-- {'Ignore',		2},
					-- {'Ignore',		2}
				-- }
			-- },
			{
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS	= {'Ultra', 'TkLODSettingsData'},
				PRECEDING_KEY_WORDS	= 'RegionLODRadius',
				VALUE_CHANGE_TABLE 	= {
					{'Ignore',		0},	-- 7	0
					{'Ignore',		4},	-- 10	7
					{'Ignore',		2},	-- 16	3
					{'Ignore',		2},	-- 12	3
					{'Ignore',		4},	-- 10	5
					{'Ignore',		2}	-- 10	3
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Ultra', 'TkLODSettingsData'},
				VALUE_CHANGE_TABLE = {
					{'ImposterResolutionMultiplier', 2} -- 1
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE = {
					{'PlanetObjectSwitch',        2},
					{'PlanetLodSwitch0',          2},
					{'PlanetLodSwitch0Elevation', 2},
					{'PlanetLodSwitch1',          2},
					{'PlanetLodSwitch2',          2},
					{'PlanetLodSwitch3',          2},
				}
			},
			{
				VALUE_CHANGE_TABLE 	= {
					{'WaterChangeTime',						160	},	-- 90
					{'WaterConditionTransitionTime',		22	},	-- 12
					{'TerrainFadeTime',						1	},	-- 2
					{'TerrainFadeTimeInShip',				1	},	-- 2
					{'CreatureFadeTime',					0.7	},	-- 1.5
					{'FloraFadeTimeMin',					0.8	},	-- 0.6
					{'FloraFadeTimeMax',					1.6	},	-- 2.25
					{'AnimationScale',						30	},	-- 50 (clouds speed)
					-- {'IndoorsLightingWeightTowardsSun',		0.08},	-- 0.2
					-- {'IndoorsLightingPlanetMax',			0.6	},	-- 1.0
					{'IndoorsLightingAbandonedFreighterMax',0.92},	-- 0.95
					-- {'IndoorsLightingNexusMax',				0.03},	-- 0.1
					-- {'IndoorsLightingFreighterMax',			0.03},	-- 0.1
					-- {'IndoorsLightingSpaceStationMax',		0.03},	-- 0.1
				}
			},
			-- {
				-- PRECEDING_KEY_WORDS = 'IndoorAmbientColour',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'R',			0},
					-- {'G',			0},
					-- {'B',			0},
					-- {'A',			0.01}
				-- }
			-- }
		}
	}
}}}}
