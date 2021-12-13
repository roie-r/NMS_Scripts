--[[----------------------------
  TESTS! -- Scale biome props
------------------------------]]

-- Properties of [GcObjectSpawnData.xml] being modified
local Object_Spawn_Prop = {
	n='MinScale', x='MaxScale', c='Coverage', w='ShearWindStrength'
}
-- Modfiers and counters for Object_Spawn_Prop
local Object_Spawn_Mods = {
	n={v=0, i=0}, x={v=0, i=0}, c={v=0, i=0}, w={v=0, i=0}
}

local Scale_tags = {
	biome = {
		{
			'LUSH', { -- applied to all LUSH sources
				TREE		= {n=1.2,	x=2.5,	c=0.9},
				BUBBLELUSH	= {n=1.15,	x=1.65},
			}
		},{
			'LUSHBIGPROPSOBJECTSFULL', {
				TREE		= {n=1.1,	x=2.3,	c=0.86},
			}
		},{
			'LUSHBUBBLEOBJECTS', {
				TREE		= {x=2.4,	c=0.86},
				FERN		= {n=1.4,	x=2.6},
			}
		},{
			'LUSHOBJECTSFULL', {
				FERN		= {n=1.3,	x=1.9},
				FLOWER		= {n=1.4,	x=1.8},
			}
		},{
			'TENTACLEOBJECTSFULL', {
				TENTACLE	= {n=1.2,	x=1.9,	c=0.94},
			}
		},{
			'LUSHROOMBOBJECTS', {
				SHROOMSINGL	= {n=1.8,	x=2.9,	u=true},
			}
		},{
			'FROZENOBJECTSFULL', {
				TREE 		= {n=1.2,	x=2.7,	c=0.9},
			}
		},{
			'RADIOBIGPROPS', {
				ROCK		= {n=1.1,	x=1.3,	c=0.95},
			}
		},{
			'RADIOSPIKEPOTATO', {
				WEIRD		= {x=1.4,	c=1.2}, -- potato
			}
		},{
			'TOXIC', { -- applied to all TOXIC sources
				TENDRIL		= {n=1.4,	x=1.9},
			}
		},{
			'TOXICBIGPROPS', {
				HUGEPROPS	= {n=0.7,	x=1.05,	c=0.84},
			}
		},{
			'TOXICOBJECTSFULL', {
				LARGEBLOB	= {n=0.4,	x=0.8,	c=1.03},
				FUNGALTREE	= {n=1.3,	x=1.9,	c=0.86},
			}
		},{
			'ROCKY', { -- less -and smaller rocks on rocky biomes
				FACEBLEND	= {n=0.8,	x=0.9,	c=0.84,	u=true},
			}
		},{
			'SWAMPOBJECTSFULL', {
				GROVELARGEF	= {n=1.8,	x=3.0,	u=true}, -- where is it !?
				GROVELARGE	= {n=0.8,	x=-0.7, c=0.86},
				HQTREE		= {n=1.4,	x=2.7,	c=0.9,	u=true},
				FERN		= {n=1.5,	x=2.1},
				FLOWER		= {n=1.4,	x=1.8, 	w=0.94},
			}
		}
	},
	global = {
		SHARD		= {n=1.05,	x=1.4},
		SPIRE		= {n=1.15,	x=1.3},
		ROCK		= {n=1.2,	x=1.75},
		CACTUS		= {n=1.1,	x=1.55},
		TREE		= {n=1.2,	x=2.8},
		SHROOM		= {n=1.05,	x=2.5},
		FOLIAGE		= {n=1.1,	x=1.3},
		FLOWER		= {x=1.2},
		CROSS		= {n=0.95,	x=1.1},	      -- grass
		LBOARD		= {n=0.95,	x=1.1},		  -- grass
		TOXICGRASS	= {n=1.2,	x=1.6,	w=0}, -- not grass!
		PLANT		= {n=0.94,	x=1.5},
		BUBBLELUSH	= {x=1.15},
		BOULDER		= {n=1.1,	x=1.4},
		CURVED		= {x=1.5},
		DROPLET		= {n=1.05,	x=1.55},
		SPORE		= {x=1.2},
		LARGE		= {n=1.2,	x=1.6},
		MEDIUM		= {n=1.05,	x=0.95},
		SMALL		= {n=0.95,	x=0.8},
		INTERACTIVE	= {n=0.48,	x=0.01,	c=1.1},

		-- skipped
		LAVA		= {u=true},
		WEIRD		= {u=true},
		LIVINGSHIP	= {u=true},
		FRAGMENT	= {u=true},
		GRAVEL		= {u=true},
		HUGEPROPS	= {u=true},
		FARM		= {u=true}
	}
}

---------------------------------------------------------------------------
---- CODING
---------------------------------------------------------------------------

-- return a deep copy of a table
local function DeepCopy(org)
    local copy
    if type(org) == 'table' then
        copy = {}
        for k, v in pairs(org) do copy[k] = DeepCopy(v) end
    else
        copy = org
    end
    return copy
end

-- return a deep copy a tables array in a single merged table
-- Identical keys are overwritten
local function MergeTables(n)
	local tbl = {}
	for _,t in ipairs(n) do
		for k, v in pairs(t) do tbl[k] = DeepCopy(v) end
	end
	return tbl
end

-- return biome-specific prop scales
local function GetBiomeScales(biome, src)
	local tbl = {}
	for _,d in ipairs(biome) do
		if src:find(d[1]) ~= nil then tbl = MergeTables({tbl, d[2]}) end
	end
	return tbl
end

-- find all tags for a single spawn and return their average
-- unless a tag includes u=true, then return just the one
local function AverageScales(spawn, worktags)
	local function addVal(m, val)
		if val ~= 1 then
			m.v = m.v + val
			m.i = m.i + 1
		end
	end
	local function avgs(m)
		if m.i > 0 then
			m.v = m.v / m.i
		else
			m.v = 1
		end
	end
	local mods = DeepCopy(Object_Spawn_Mods)
	for key, tag in pairs(worktags) do
		if spawn:find(key) ~= nil then
			if tag.u or false then
				for i, d in pairs(mods) do d.v = (tag[i] or 1) end
				return mods
			end
			for i, d in pairs(tag) do addVal(mods[i], d) end
		end
	end
	for _,m in pairs(mods) do avgs(m) end
	return mods
end

-- main work.
-- get a merged tags list for a biome and add modifiers for every spawn
local function SetTheScales(biomeObjects, globalTags, biomeTags)
	local function addVal(T, prop, mod)
		if mod.v ~= 1 then table.insert(T, {prop, mod.v}) end
	end
	mbin_change = {}

	for _,src in pairs(biomeObjects) do
		mods_tbl = {
			MBIN_FILE_SOURCE = src.source,
			EXML_CHANGE_TABLE = {}
		}
		local worktags = MergeTables( {globalTags, GetBiomeScales(biomeTags, src.source)} )
		for _,spn in pairs(src.spawn) do
			local mods = AverageScales(spn, worktags)
			local mod_changes = {}
			for k, m in pairs(mods) do
				addVal(mod_changes, Object_Spawn_Prop[k], m)
			end
			if #mod_changes > 0 then
				local spawn_props = {
					REPLACE_TYPE 		= 'ALL',
					INTEGER_TO_FLOAT	= 'FORCE',
					MATH_OPERATION 		= '*',
					SPECIAL_KEY_WORDS	= {'Filename', spn},
					SECTION_UP			= 1,
					VALUE_CHANGE_TABLE 	= mod_changes
				}
				table.insert(mods_tbl.EXML_CHANGE_TABLE, spawn_props)
			end
		end
		table.insert(mbin_change, mods_tbl)
	end
	return mbin_change
end

local Biome_Objects = {
	{
		source = 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICTENTACLESOBJECTS.MBIN',
		spawn = {
			'MODELS/PLANETS/BIOMES/LUSHROOM/SMALLBLUESHROOMS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/MEDIUMPROPS/MEDIUMBOULDER02.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/SMALLPROPS/SMALLROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/TOXIC/SMALL/SPORETUBESMALL.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/GRASS/BUBBLELUSHGRASS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/TOXIC/HOUDINIPROPS/LARGETENTACLE.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/TOXIC/HOUDINIPROPS/MEDIUMTENTACLEBLOB.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/UNDERWATER/MEDIUMPLANTS/MEDIUMJELLYPLANT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/BARREN/PLANTS/GROUNDFLOWER.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/MEDIUM/MEDIUMROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/UNDERWATER/UPDATEPROPS/ANENOMESHAPE.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/GRASS/TALLGRASSBILLBOARD.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/BARREN/HQ/FOLIAGE/BARRENGRASSLARGE.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/SMALLPROPS/SMALLBOULDER.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/RADIOACTIVE/SMALL/CURVEDSMALL.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/TOXIC/SMALL/TOXICGRASS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/SURFACEBLEND/MEDIUMSANDBLENDROCK.SCENE.MBIN',
	}}
}

-- naming names
local function GetSourceName(S)
	local name = S:match("[^/]*.MBIN$")
	return name:sub(0, #name - 5)
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST big props '..GetSourceName(Biome_Objects[1].source)..'.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.75,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= SetTheScales(Biome_Objects, Scale_tags.global, Scale_tags.biome)
}}}
