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

local function AddPlanetWeatherColor(skies)
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
	local sky_palettes = {
		{--	natural pale blue
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
			{c='FF97BBC7'}
		},
		{-- hot pale orange
			{c='FFE7AF76'},
			{c='FFEE7740'},
			{c='FFEBB178'},
			{c='FFF17468'},
			{c='FFE8E9B0'},
			{c='FF515A85'},
			{c='FFBAF3E0'},
			{2, 1, 1},
			{c='FFF6D5B3'},
			{c='FFE7E9F1'},
			{c='FFE4D2AB'}
		},
		{--	soft turquoize1
			{c='FF7CE9CA'},
			{c='FF94D3AD'},
			{c='FF66DBAC'},
			{c='FFB1D8E2'},
			{c='FFDBDBAF'},
			{c='FF2C617A'},
			{c='FF5CD8FF'},
			{2, 1.2, 1},
			{c='FFDFDFC2'},
			{c='FFE2F6F6'},
			{c='FF5CA998'}
		}
	}
	local T = {}
	for _, num in ipairs(skies) do
		local pwcd = { META = {'value', 'GcPlanetWeatherColourData.xml'} }
		for j, dat in pairs(sky_palettes[num]) do
			pwcd[#pwcd+1] = sky_part[j].f(dat, sky_part[j].n)
		end
		T[#T+1] = pwcd
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META sky dark space & nights.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	MOD_DESCRIPTION		= mod_desc,
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
				ADD				 	= ToExml(AddPlanetWeatherColor({1}))
			},
			{
				PRECEDING_KEY_WORDS = {'PerBiomeSettings', 'Swamp', 'Settings'},
				ADD				 	= ToExml(AddPlanetWeatherColor({1,3}))
			},
			{
				PRECEDING_KEY_WORDS = {'PerBiomeSettings', 'Lava', 'Settings'},
				ADD				 	= ToExml(AddPlanetWeatherColor({2}))
			}
		}
	}
}}}}
