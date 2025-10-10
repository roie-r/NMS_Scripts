--------------------------------------------
local mod_desc = [[
  Greater and more varied storm hazards
  Decrease storms occurrence chance
  Less damaging storms in lush biome
  Remove all fog and dust in airless biome
  Remove tornados until HG fixes them
]]------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META less storms_more hazards',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
	--	|varied meteors|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/WEATHEREFFECTS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'METEOR_EFFECT'},
				VALUE_CHANGE_TABLE 	= {
					{'MinSpawnScale',				0.5},	-- 1
					{'MaxSpawnScale',				1.5},	-- 1
				}
			}
		}
	},
	{
	--	|varied storm hazard|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/WEATHERHAZARDS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			-- {
				-- REPLACE_TYPE 		= 'All',
				-- VALUE_CHANGE_TABLE 	= {
					-- {'MaxHazardsOfThisTypeActive',		'@-2'}, 	-- 5
					-- {'SpawnChancePerSecondPerAttempt',	'@*0.4'}, 	-- 0.1
				-- }
			-- },
			{
				SPECIAL_KEY_WORDS	= {'Id', 'METEOR'},
				VALUE_CHANGE_TABLE 	= {
					{'MinSpawnScale',				0.5},	-- 1
					{'MaxSpawnScale',				3},		-- 1
					{'MaxMeteors',					8},		-- 6
					{'DamageRadius',				10},	-- 3
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'LIGHTNING'},
				VALUE_CHANGE_TABLE 	= {
					{'DamageRadius',				10},	-- 3
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'TORNADO'},
				VALUE_CHANGE_TABLE 	= {
					{'MaxHazardsOfThisTypeActive',	3}, 	-- 5
					{'MaxSpawnScale',				1.2},	-- 1
					{'MinSpawnDistance',			80},	-- 50
					{'MaxSpawnDistance',			300},	-- 250
					{'MoveSpeed',					6},		-- 5
					{'SuckInRadius',				50},	-- 40
					{'SuckInStrength',				8},		-- 5
					{'SuckUpRadius',				18},	-- 7
					{'SuckUpStrength',				2.2},	-- 2
					{'SuckUpHeight',				55},	-- 50
					{'SuckUpHeightCutoff',			90},	-- 80
				}
			},
		}
	},
	-- {
	-- --	|spooky weather|
		-- MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/WEIRDWEATHER.MBIN',
		-- EXML_CREATE			= false,
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- PRECEDING_KEY_WORDS = {'SpookLevel', 'Ambient'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Normal',		6},
					-- {'Extreme',		9}
				-- }
			-- },
			-- {
				-- PRECEDING_KEY_WORDS = {'SpookLevel', 'Night'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Normal',		12},
					-- {'Extreme',		18}
				-- }
			-- }
		-- }
	-- },
	{
	--	|Decrease storms occurrence| chance
		MBIN_FILE_SOURCE	= {
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/DUSTWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/HUMIDWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SNOWWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/TOXIC.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SCORCHED.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/RADIOACTIVE.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/REDWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/GREENWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/BLUEWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SWAMPWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/LAVAWEATHER.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/FIRESTORMWEATHER.MBIN',
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'LowStormsChance',		0.7},
					{'HighStormsChance',	0.6},
					{'ExtremeWeatherChance',0.4}
				}
			}
		}
	},
	{
	--	|Decrease storms occurrence| chance
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SNOWWEATHER.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Fog', 'GcFogProperties'},
				VALUE_CHANGE_TABLE 	= {
					{'FogStrength',			0.12}	-- 0.15
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'StormFog', 'GcFogProperties'},
				VALUE_CHANGE_TABLE 	= {
					{'FogStrength',			0.4}	-- 0.8
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Storms',
				PRECEDING_FIRST		= true,
				SPECIAL_KEY_WORDS	= {'Fog', 'GcFogProperties'},
				VALUE_CHANGE_TABLE 	= {
					{'FogStrength',			0.9}	-- 1.5
				}
			},
		}
	},
	{
	--	|harmless lush weather|
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/HUMIDWEATHER.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = {'Temperature', 'Storm'},
				VALUE_CHANGE_TABLE 	= {
					{'Normal',				42},	-- 92
					{'Extreme',				57},	-- 120
				}
			}
		}
	},
	{
	--	|No dust & fog on airless biomes|
		MBIN_FILE_SOURCE	= {
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/CLEARCOLD.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/CLEARWEATHER.MBIN'
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'HeavyAir', 'GcHeavyAirSetting'},
				REMOVE				= 'Section'
			},
			{
				VALUE_CHANGE_TABLE 	= {
					{'FogStrength',			0},
					{'FogMax',				0},
					{'HeightFogStrength',	0},
					{'HeightFogMax',		0},
					{'FogHeight',			0}
				}
			}
		}
	},
}}}}
