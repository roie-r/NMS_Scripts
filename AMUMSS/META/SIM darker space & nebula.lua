--[[┎─────────────────────────────────────────────────────────────────────────────
	┃ Modifers for ambient space colour .. near-black space and night sky
────┸─────────────────────────────────────────────────────────────────────────--]]

M = { space=0.32, planet=0.5, nebula=0.84, biome2=0.28 }

General_Colour_Modifier = {
	dat = {
		{'TopColour', 			M.space},
		{'MidColour',			M.space - 0.04},
		{'BottomColour',		M.space - 0.08},
		{'TopColourPlanet',		M.planet},
		{'MidColourPlanet',		M.planet - 0.04},
		{'BottomColourPlanet',	M.planet - 0.08},
		{'NebulaColour1',		M.nebula},
		{'NebulaColour2',		M.nebula},
		{'NebulaColour3',		M.nebula}
	},
	Get = function(x)
		return {
			INTEGER_TO_FLOAT	= 'FORCE',
			REPLACE_TYPE		= 'ALL',
			MATH_OPERATION		= '*',
			PRECEDING_KEY_WORDS	= x[1],
			VALUE_CHANGE_TABLE 	= { {'R', x[2]}, {'G', x[2]}, {'B', x[2]} }
		}
	end
}

New_Colour_Modifier = {
	dat = {
		{{'GenericSettings', 'SkyColour'}, 		M.biome2},
		{{'GenericSettings', 'SkyUpperColour'},	M.biome2},
		{{'GenericSettings', 'SkySolarColour'},	M.biome2 + 0.2},
		{{'GenericSettings', 'HorizonColour'},	M.biome2 + 0.2},
		{{'GenericSettings', 'HeightFogColour'},M.biome2},
		{{'GenericSettings', 'LightColour'},	M.biome2 + 0.52},
		{{'GenericSettings', 'CloudColour1'},	M.biome2 + 0.24},
		{{'GenericSettings', 'CloudColour2'},	M.biome2 + 0.24},
		{{'Swamp', 'SkyColour'}, 		M.biome2 - 0.18},
		{{'Swamp', 'SkyUpperColour'}, 	M.biome2 - 0.22},
		{{'Swamp', 'SkySolarColour'},	M.biome2 + 0.1},
		{{'Swamp', 'HorizonColour'},	M.biome2 + 0.2},
		{{'Swamp', 'HeightFogColour'},	M.biome2 - 0.1},
		{{'Swamp', 'LightColour'},		M.biome2 + 0.52},
		{{'Swamp', 'CloudColour1'},		M.biome2 + 0.24},
		{{'Swamp', 'CloudColour2'},		M.biome2 + 0.24},
		{{'Lava', 'SkyColour'}, 		M.biome2 + 0.4},
		{{'Lava', 'SkyUpperColour'}, 	M.biome2 + 0.4},
		{{'Lava', 'SkySolarColour'},	M.biome2 + 0.32},
		{{'Lava', 'HorizonColour'},		M.biome2 + 0.42},
		{{'Lava', 'HeightFogColour'},	M.biome2},
		{{'Lava', 'LightColour'},		M.biome2 + 0.52},
		{{'Lava', 'CloudColour1'},		M.biome2 + 0.36},
		{{'Lava', 'CloudColour2'},		M.biome2 + 0.36}
	},
	Get = function(x)
		return {
			INTEGER_TO_FLOAT	= 'FORCE',
			MATH_OPERATION		= '*',
			PRECEDING_KEY_WORDS	= x[1],
			VALUE_CHANGE_TABLE 	= { {'R', x[2]}, {'G', x[2]}, {'B', x[2]} }
		}
	end
}

function BuildExmlChangeTable(tbl)
	local T = {}
	for i = 1, #tbl.dat do table.insert(T, tbl.Get(tbl.dat[i])) end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META Darker Space & nebula.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_META ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'METADATA\SIMULATION\SOLARSYSTEM\WEATHER\SKYSETTINGS\SPACESKYCOLOURS.MBIN',
			'METADATA\SIMULATION\SOLARSYSTEM\WEATHER\SKYSETTINGS\SPACERARESKYCOLOURS.MBIN',
		},
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(General_Colour_Modifier)
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\SIMULATION\SOLARSYSTEM\WEATHER\SKYSETTINGS\NIGHTSKYCOLOURS.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(New_Colour_Modifier)
	}
}}}}
