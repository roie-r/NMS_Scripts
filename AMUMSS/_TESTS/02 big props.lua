--[[┎────────────────────────────────────────────────────────────────────
	┃ -- TESTS! -- Scale biome props & increase their LOD --
────┸────────────────────────────────────────────────────────────────--]]
Include_LOD_Increase = true

Scales = {
	biome = {
		FROZENOBJECTSFULL = {
			TREE				= {1.2,		2.7,	0.78},
		},
		HUGELUSHOBJECTSFULL = {
			HQTREE				= {1.1,		2.4,	0.74},
		},
		LUSHBIGPROPSOBJECTSFULL = {
			TREE				= {1.2,		2.7,	0.76},
		},
		LUSHHQTENTACLEOBJECTSFULL = {
			TENTACLE			= {1.2,		1.9,	0.9},
			TREE				= {1.0,		2.8,	0.78},
		},
		LUSHBUBBLEOBJECTS = {
			HQTREE				= {1.2,		2.7,	0.86},
			FERN				= {1.4,		2.6},
		},
		LUSHROOMBOBJECTS = {
			SHROOMSINGL			= {2.3,		4.6},
		},
		RADIOSPIKECRYSTAL = {
			BUBBLELUSH			= {1.0,		1.1},
		},
		RADIOSPIKEPOTATO = {
			HOUDINIPROP			= {1.0,		1.2,	1.6},
			BUBBLELUSH			= {1.0,		1.1},
		},
		SWAMPOBJECTSFULL = {
			MANGROVELARGEFULL	= {2.2,		7.8}, -- where is it !?
			MANGROVELARGE		= {0.8,		-0.7, 	0.8},
		},
	},
	prop = {
		SHARD		= {0.98,	1.4},
		SPIRE		= {0.9,		1.05},
		ROCK		= {1.2,		1.8},
		CACTUS		= {1.1,		1.6},
		TREE		= {1.2,		2.8},
		SHROOM		= {1.05,	2.5},
		FLOWER		= {1.0,		1.3},
		FOLIAGE		= {1.1,		1.3},
		PLANT		= {0.94,	1.5},
		BUBBLELUSH	= {1.2,		1.7},
		BOULDER		= {1.1,		1.4},
		CURVED		= {1.0,		1.5},
		DROPLET		= {1.05,	1.55},
		TENDRIL		= {1.1,		1.7},
		EGG			= {0.98,	1.0},
		SPORE		= {1.0,		1.2},
		LARGE		= {1.1,		1.6},
		MEDIUM		= {0.85,	0.9},
		SMALL		= {0.8,		0.58},
		INTERACTIVE	= {0.48,	0.01},
	},
	skip = {
		'LAVA',
		'FRAGMENT',
		'GRAVEL',
		'HUGEPROP',
		'FARM',
	}
}

Biomes = {
	{
		source = 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBIGPROPSOBJECTSFULL.MBIN',
		scene = {
			'MODELS/PLANETS/BIOMES/HQLUSH/HQTREES/PARTS/HQTREE10.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/TOXIC/SMALL/TOXICGRASS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/FLOWERS/YARROW.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/SMALL/SMALLROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/SURFACEBLEND/GRAVELPATCHMOSSBLEND.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/BARREN/HQ/FOLIAGE/BARRENGRASSLARGE.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/MEDIUMPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/LARGEPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/SMALLFLOWERS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSHULTRA/DECORATIVEFERN.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/LARGE/LARGEROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/GRASS/NEWCROSSGRASS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/HQTREES/PARTS/HQTREE21.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/SMALLPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/MEDIUM/MEDIUMROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/FLOWERS/SCABIOUS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/GRASS/TALLGRASSBILLBOARD.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSHULTRA/DECORATIVESMALLFLOWERS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/SMALLPROPS/SMALLBOULDER.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/BARREN/PLANTS/GROUNDFLOWER.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/HQTREES/PARTS/HQTREE17.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/SPRIGBUSH.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/MEDIUMBUSH.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/FLOWERS/BUTTERCUP.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/HQTREES/PARTS/HQTREE63.SCENE.MBIN',
	}}
}

-- Return biome-specific scales key
local function GetBiomeScaleKey(s)
	for k,_ in pairs(Scales.biome) do
		if string.find(s, k) ~= nil then return k end
	end
	return nil
end

-- return a copy of multiple arrays in a single array
local function CopyArrays(n)
	local Arr = {}
	for _, ar in ipairs(n) do
		for k, v in pairs(ar) do Arr[k] = v end
	end
	return Arr
end

-- add biome-specific modifier and prop scales to work array
local function UpdateBiomeProps(src)
	key = GetBiomeScaleKey(src)
	Scales.workprop = CopyArrays({Scales.prop, Scales.biome[key]})
end

-- search the scene name for matching phrases from the scales table
local function FindScale(scene)
	local mins, maxs, cover, i = 0, 0, 0, 0
	for k, v in pairs(Scales.workprop) do
		if string.find(scene, k) ~= nil then
			i = i + 1
			mins = mins + v[1]
			maxs = maxs + v[2]
			cover = cover + (v[3] or 1)
		end
	end
	if cover == i then cover = nil else cover = cover / i end
	return mins / i, maxs / i, cover
end

-- return true if none of the skip values are found in the scene
local function IsNotSkipped(scene)
	for _,v in pairs(Scales.skip) do
		if string.find(scene, v) ~= nil then return false end
	end
	return true
end

local function SetTheScales()
	mbin_change = {}
	for _,src in pairs(Biomes) do
		mods_tbl = {
			MBIN_FILE_SOURCE = src.source,
			EXML_CHANGE_TABLE = {}
		}
		UpdateBiomeProps(src.source)

		-- add prop modifiers
		for _,scn in pairs(src.scene) do
			if IsNotSkipped(scn) then
				local mins, maxs, cover = FindScale(scn)
				if mins > 0 then
					exml_change = {
						REPLACE_TYPE 		= 'ALL',
						INTEGER_TO_FLOAT	= 'FORCE',
						MATH_OPERATION 		= '*',
						SPECIAL_KEY_WORDS	= {'Filename', scn},
						SECTION_UP			= 1,
						VALUE_CHANGE_TABLE 	= {
							{'MinScale',	mins},
							{'MaxScale',	maxs}
						}
					}
					if cover ~= nil then
						table.insert(exml_change.VALUE_CHANGE_TABLE, {'Coverage', cover})
					end
					table.insert(mods_tbl.EXML_CHANGE_TABLE, exml_change)
				end
			end
		end
		-- LOD increase (unrelated to big props) --
		if (Include_LOD_Increase or false) then
			exml_change = {
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = 'LodDistances',
				VALUE_CHANGE_TABLE 	= { {'IGNORE', 1.2} }
			}
			table.insert(mods_tbl.EXML_CHANGE_TABLE, exml_change)
		end

		table.insert(mbin_change, mods_tbl)
	end
	return mbin_change
end


NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 02 Big props.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.68',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= SetTheScales()
}}}
