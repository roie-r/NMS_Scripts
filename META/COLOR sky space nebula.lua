--------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
--------------------------------------------------------------------
mod_desc = [[
  Modifiers for ambient space color..near-black space and night sky
  Darker nights, and darker swamp and lava biomes
  Added cool blue day sky color
]]------------------------------------------------------------------

local function SpaceColorModifiers()
	local T = {}
	for _,x in ipairs({
		{'TopColour', 			0.26},
		{'MidColour',			0.22},
		{'BottomColour',		0.18},
		{'TopColourPlanet',		0.54},
		{'MidColourPlanet',		0.5},
		{'BottomColourPlanet',	0.46},
		{'CloudColour',			0},
		{'LightColour',			1.02}, -- sun brightness
		{'NebulaColour1',		1.06},
		{'NebulaColour2',		1.08},
		{'NebulaColour3',		1.04},
		{'FogColour',			0.4},
		{'FogColour2',			0.4}
	}) do
		T[#T+1] = {
			REPLACE_TYPE		= 'All',
			INTEGER_TO_FLOAT	= 'Force',
			MATH_OPERATION		= '*',
			PRECEDING_KEY_WORDS	= x[1],
			VALUE_CHANGE_TABLE 	= {
				{'R', x[2]}, {'G', x[2]}, {'B', x[2]}
			}
		}
	end
	return T
end

function NightColorModifiers()
	local T = {}
	for i, bio in pairs({
		{k='GenericSettings',	m=0.42},
		{k='Swamp',				m=0.28},
		{k='Lava',				m=0.52}
	}) do
		for _,x in ipairs({
			--						generic	swamp	lava
			{k='SkyColour',			-0.04,	-0.18,	0.4},
			{k='SkyUpperColour',	-0.04,	-0.22,	0.4},
			{k='SkySolarColour',	0.1,	0.1,	0.32},
			{k='HorizonColour',		0.1,	0.2,	0.42},
			{k='HeightFogColour',	0,		-0.1,	0},
			{k='LightColour',		0.28,	0.32,	0.48},
			{k='CloudColour1',		0.28,	0.24,	0.36},
			{k='CloudColour2',		0.28,	0.24,	0.36}
		}) do
			T[#T+1] = {
				INTEGER_TO_FLOAT	= 'Force',
				MATH_OPERATION		= '*',
				PRECEDING_KEY_WORDS	= {bio.k, x.k},
				VALUE_CHANGE_TABLE 	= {
					{'R', x[i] + bio.m},
					{'G', x[i] + bio.m},
					{'B', x[i] + bio.m}
				}
			}
		end
	end
	return T
end

local function AddBlueSkyWeather()
	local sky_color = {
		{c='FF81C0E9'},
		{c='FF57749A'},
		{c='FFB3DCEC'},
		{c='FFBBE0F3'},
		{c='FFFEFFD4'},
		{c='FFB3DCEC'},
		{c='FFFACFA0'},
		{1, 1, 1},
		{c='FFFFFFE7'},
		{c='FFEEF9F1'},
		{c='FFECEFF0'}
	}
	local sky_part = {
		{f = ColorData, n='SkyColour'},
		{f = ColorData, n='SkyUpperColour'},
		{f = ColorData, n='SkySolarColour'},
		{f = ColorData, n='HorizonColour'},
		{f = ColorData, n='SunColour'},
		{f = ColorData, n='FogColour'},
		{f = ColorData, n='HeightFogColour'},
		{f = VectorData,n='SkyGradientSpeed'},
		{f = ColorData, n='LightColour'},
		{f = ColorData, n='CloudColour1'},
		{f = ColorData, n='CloudColour2'}
	}
	local pwcd = { META = {'value', 'GcPlanetWeatherColourData.xml'} }
	for i, dat in pairs(sky_color) do
		pwcd[#pwcd+1] = sky_part[i].f(dat, sky_part[i].n)
	end
	return pwcd
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META sky dark space & nights.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.36',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SKYSETTINGS/SPACESKYCOLOURS.MBIN',
			'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SKYSETTINGS/SPACERARESKYCOLOURS.MBIN',
		},
		EXML_CHANGE_TABLE	= SpaceColorModifiers()
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SKYSETTINGS/NIGHTSKYCOLOURS.MBIN',
		EXML_CHANGE_TABLE	= NightColorModifiers()
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/WEATHER/SKYSETTINGS/DAYSKYCOLOURS.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = {'GenericSettings', 'Settings'},
				ADD				 	= ToExml(AddBlueSkyWeather())
			},
			{
				PRECEDING_KEY_WORDS = {'PerBiomeSettings', 'Swamp', 'Settings'},
				ADD				 	= ToExml(AddBlueSkyWeather())
			}
		}
	}
}}}}
