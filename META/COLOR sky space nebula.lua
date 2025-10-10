--------------------------------------------------------------------
-- dofile('LIB/_lua_2_mxml.lua')
--------------------------------------------------------------------
local mod_desc = [[
  Modifiers for ambient space color..near-black space and night sky
  Darker nights, and darker swamp and lava biomes
  Added cool blue day sky color
]]------------------------------------------------------------------

local function NightSkyColors()
	local T = {}
	for rgb, mod in pairs({
		--				 generic	swamp	lava
		SkyColour		= {0.48,	0.1,	0.92},
		SkyUpperColour	= {0.58,	0.06,	0.92},
		SkySolarColour	= {0.62,	0.38,	0.84},
		HorizonColour	= {0.62,	0.48,	0.94},
		SunColour		= {0.8,		0.8,	0.8},
		FogColour		= {0.7,		0.7,	0.7},
		HeightFogColour	= {0.52,	0.18,	0.52},
		LightColour		= {0.8,		0.6,	1	},
		-- LightColourUnderground
		CloudColour1	= {0.8,		0.52,	0.88},
		CloudColour2	= {0.8,		0.52,	0.88}
	}) do
		for i, bio in ipairs({
			'GenericSettings', 'Swamp', 'Lava'
		}) do
			T[#T+1] = {
				MATH_OPERATION		= '*',
				PRECEDING_KEY_WORDS	= {bio, rgb},
				VALUE_CHANGE_TABLE 	= {
					{'R',	mod[i]},
					{'G',	mod[i]},
					{'B',	mod[i]}
				}
			}
		end
	end
	return T
end

local function SpaceColors()
	local T = {}
	for rgb, mod in pairs({
		TopColour			= 0.26,
		MidColour			= 0.22,
		BottomColour		= 0.18,
		TopColourPlanet		= 0.54,
		MidColourPlanet		= 0.5,
		BottomColourPlanet	= 0.46,
		CloudColour			= 0,
		LightColour			= 1.02, -- sun brightness
		NebulaColour1		= 1.06,
		NebulaColour2		= 1.08,
		NebulaColour3		= 1.04,
		FogColour			= 0.1,
		FogColour2			= 0.1
	}) do
		T[#T+1] = {
			REPLACE_TYPE		= 'All',
			MATH_OPERATION		= '*',
			PRECEDING_KEY_WORDS	= rgb,
			VALUE_CHANGE_TABLE 	= {
				{'R', mod}, {'G', mod}, {'B', mod}
			}
		}
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META sky dark space & nights',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SKYSETTINGS/SPACESKYCOLOURS.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SKYSETTINGS/SPACERARESKYCOLOURS.MBIN',
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= SpaceColors()
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SKYSETTINGS/NIGHTSKYCOLOURS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= NightSkyColors()
	},
}}}}
