-------------------------------
mod_desc = [[
  TESTS! -- Scale biome props
]]-----------------------------

local scale_tags = {
	biome = {
		{
			'LUSH', { --- applied to all LUSH sources
				TREE		= {n=1.15,	x=2.4,	c=0.9},
				BUBBLELUSH	= {n=1.15,	x=1.65},
				-- CROSS		= {n=0.95,	x=1.1,	s=0.0005},
				-- LBOARD		= {n=0.95,	x=1.1,	s=0.0005}
			}
		},
		{
			'LUSHBIGPROPSOBJECTSFULL', {
				TREE		= {n=1.05,	x=2.2,	c=0.86},
			}
		},
		{
			'LUSHBUBBLEOBJECTS', {
				TREE		= {x=2.25,	c=0.86},
				FERN		= {n=1.4,	x=2.6},
			}
		},
		{
			'LUSHOBJECTSFULL', {
				FERN		= {n=1.3,	x=1.9},
				FLOWER		= {n=1.4,	x=1.8},
			}
		},
		{
			'TENTACLEOBJECTSFULL', {
				TENTACLE	= {n=1.2,	x=1.9,	c=0.94},
			}
		},
		{
			'LUSHROOMBOBJECTS', {
				SHROOMSINGL	= {n=1.8,	x=2.9,	u=true},
			}
		},
		{
			'FROZEN', {
				TREE 		= {n=1.15,	x=2.45,	c=0.85},
			}
		},
		{
			'RADIOBIGPROPS', {
				ROCK		= {n=1.1,	x=1.3,	c=0.95},
			}
		},
		{
			'RADIOSPIKEPOTATO', {
				WEIRD		= {x=1.4,	c=1.2}, -- potato
			}
		},
		{
			'TOXIC', { --- applied to all TOXIC sources
				TENDRIL		= {n=1.4,	x=1.9},
			}
		},
		{
			'TOXICBIGPROPS', {
				HUGEPROPS	= {n=0.7,	x=1.05,	c=0.84},
			}
		},
		{
			'TOXICOBJECTSFULL', {
				LARGEBLOB	= {n=0.4,	x=0.8},
				FUNGALTREE	= {n=1.15,	x=1.75,	c=0.86},
			}
		},
		{
			'ROCKY', { --- less -and smaller rocks on rocky biomes
				FACEBLEND	= {n=0.8,	x=0.9,	c=0.84,	u=true},
			}
		},
		{
			'SWAMPOBJECTSFULL', {
				GROVELARGEF	= {n=1.05,	x=1.55,	c=1.1,	u=true},
				GROVELARGE	= {n=0.8,	x=-0.7, c=0.82},
				HQTREE		= {n=1.15,	x=2.5,	c=0.9,	u=true},
				CROSS		= {n=0.95,	x=1.1,	s=1.5},
				FERN		= {n=1.5,	x=2.1},
				FLOWER		= {n=1.4,	x=1.8, 	w=0.94},
			}
		},
		{
			'ALIEN', {
				LARGE		= {n=0.95,	x=1.02,	c=0.92},
				MEDIUM		= {n=0.9,	x=1.05,	c=0.82},
				SMALL		= {n=0.95,	x=1.05},
			}
		}
	},
	globals = {
		SHARD		= {n=1.05,	x=1.4},
		SPIRE		= {n=1.15,	x=1.3},
		ROCK		= {n=1.2,	x=1.75},
		CACTUS		= {n=1.1,	x=1.55},
		TREE		= {n=1.15,	x=2.4},
		SHROOM		= {n=1.05,	x=2.5},
		FOLIAGE		= {n=1.1,	x=1.3},
		FLOWER		= {x=1.2},
		CROSS		= {n=0.95,	x=1.1,},		-- grass
		LBOARD		= {n=0.95,	x=1.1},		  	-- grass
		TOXICGRASS	= {n=1.2,	x=1.6,	w=0}, 	-- not grass!
		PLANT		= {n=0.94,	x=1.5},
		BUBBLELUSH	= {x=1.15},
		BOULDER		= {n=1.1,	x=1.4},
		CURVED		= {x=1.5},
		DROPLET		= {n=1.05,	x=1.55},
		SPORE		= {x=1.2},
		LARGE		= {n=1.2,	x=1.6,	c=0.94},
		MEDIUM		= {n=1.05,	x=0.95},
		SMALL		= {n=0.95,	x=0.8},
		INTERACTIVE	= {n=0.48,	x=0.01,	c=1.1},

	---	skipped
		LAVA		= {u=true},
		WEIRD		= {u=true},
		FRAGMENT	= {u=true},
		GRAVEL		= {u=true},
		HUGEPROPS	= {u=true},
		FARM		= {u=true}
	}
}

--- Properties of [GcObjectSpawnData.xml] being modified
local spawn_props = {
	n = 'MinScale',
	x = 'MaxScale',
	c = 'Coverage',
	w = 'ShearWindStrength',
	s = 'SlopeDensity'
}

---------------------------------------------------------------------------
---- CODING
---------------------------------------------------------------------------

-- return a deep copy of a tables array in a single merged table
-- Identical keys are overwritten
local function MergeTables(n)
	local function DeepCopy(org)
		local copy
		if type(org) == 'table' then
			copy = {}
			for k, v in pairs(org) do
				copy[k] = DeepCopy(v)
			end
		else
			copy = org
		end
		return copy
	end
	local tbl = {}
	for _,t in ipairs(n) do
		for k, v in pairs(t) do
			tbl[k] = DeepCopy(v)
		end
	end
	return tbl
end

-- find all tags for a single spawn and return their average
-- unless a tag includes u=true, then return just the one
local function AverageScales(spawn, worktags)
	local mods = {}
	function mods:addvals(tag)
		for k, val in pairs(tag) do
			if val ~= 1 then
				self[k].v = self[k].v + val
				self[k].i = self[k].i + 1
			end
		end
	end
	function mods:avgs()
		for _,d in pairs(self) do
			if type(d) ~= 'function' then d.v = d.v / d.i end
		end
	end
	function mods:merge(tag)
		for k, d in pairs(tag) do
			if k ~= 'u' then self[k].v = d end
		end
	end

	-- Generate the modfiers and counters table for object_spawn_prop
	for k,_ in pairs(spawn_props) do
		mods[k] = {v=0, i=0}
	end

	for key, tag in pairs(worktags) do
		if spawn:find(key) then
			if tag.u or false then
				mods:merge(tag)
				return mods
			end
			mods:addvals(tag)
		end
	end
	mods:avgs()
	return mods
end

-- return biome-specific prop scales
local function GetBiomeScales(src)
	local tbl = {}
	for _,d in ipairs(scale_tags.biome) do
		if src:find(d[1]) then
			tbl = MergeTables({tbl, d[2]})
		end
	end
	return tbl
end

-- main work.
-- get a merged tags list for a biome and add modifiers for every spawn
local function SetTheScales(biome_objects)
	local mbin_change = {}
	for _,src in pairs(biome_objects) do
		local mods_tbl = {
			MBIN_FILE_SOURCE	= src.source,
			EXML_CHANGE_TABLE	= {}
		}
		local worktags = MergeTables( {scale_tags.globals, GetBiomeScales(src.source)} )
		for _,spn in pairs(src.spawn) do
			local mods = AverageScales(spn, worktags)
			local vct = {}
			--	Insert modifiers to the change table for multiplication
			for k, pr in pairs(spawn_props) do
				if mods[k].v ~= 1 and mods[k].v > 0 then
					vct[#vct+1] = {pr, mods[k].v}
				end
			end
			if #vct > 0 then
				table.insert(mods_tbl.EXML_CHANGE_TABLE, {
					REPLACE_TYPE 		= 'All',
					INTEGER_TO_FLOAT	= 'Force',
					MATH_OPERATION		= '*',
					SPECIAL_KEY_WORDS	= {'Filename', spn},
					SECTION_UP			= 1,
					VALUE_CHANGE_TABLE	= vct
				})
			end
		end
		table.insert(mbin_change, mods_tbl)
	end
	return mbin_change
end

local biome_objects = {
	{
		source = 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPOBJECTSFULL.MBIN',
		spawn = {
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/HUTS/MOSSHUT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/FLOWERS/BUTTERCUP.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/FLOWERS/SCABIOUS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/FLOWERS/YARROW.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/GRASS/NEWCROSSGRASS.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/FERNLARGEALT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/FERNLIGHT.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/PLANTS/MEDIUMBUSH.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/MEDIUM/MEDIUMROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/ROCKS/SMALL/SMALLROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/HQTREES/HQTREEREF.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/LARGEPROPS/MOUNTAINROCK_1.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/MEDIUMPROPS/MEDIUMBOULDER02.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/SMALLPROPS/SMALLROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/HQLUSH/SMALLPROPS/SMALLBOULDER.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/SWAMP/MEDIUMPLANT/YUKKA.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/SWAMP/LARGEPROP/GROUNDREVEALROCK01.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/DEADTREE.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/SWAMP/LARGEPROP/LARGEMOSSROCK.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/LUSHROOM/MEDIUMSHROOM.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/LUSHROOM/SMALLSHROOMCLUSTER.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/MANGROVELARGE.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/SWAMP/LARGEPLANT/MANGROVELARGEFULL.SCENE.MBIN',
			'MODELS/PLANETS/BIOMES/TOXIC/LARGE/FUNGALTREE.SCENE.MBIN',
	}},
}

-- naming names
local function GetSourceName(s)
	local name = s:match('[^/]*.MBIN$')
	return name:sub(0, #name - 5)
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST big props '..GetSourceName(biome_objects[1].source)..'.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.08',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
		MBIN_CHANGE_TABLE	= SetTheScales(biome_objects)
	}
}}
