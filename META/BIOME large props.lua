--------------------------------------------------------------------------------
dofile('LIB/exml_2_lua.lua') -- ALWAYS EXCLUDED FROM BATCH
--------------------------------------------------------------------------------
local mod_desc = [[
  Utilizes the SCENE files' descriptive name and path to match 'tags'
  from scale_tags table to each scene, then multiples the tags' values with the
  properties in object_spawn_prop table.

  * MUST BE LAUNCHED WITH A SOURCE PRE-LOADER SCRIPT
]]------------------------------------------------------------------------------

--- Properties of [GcObjectSpawnData.xml] being modified
local obj_spawn_data = {
	props = {
		n = 'MinScale',
		x = 'MaxScale',
		c = 'Coverage',
		w = 'ShearWindStrength'
	}
}

local scale_tags = {
	biomes = {
		{
			biome = 'LUSH',
			flora = { -- applied to all LUSH sources
				TREE		= {n=1.15,	x=2.4,	c=0.9},
				BUBBLELUSH	= {n=1.15,	x=1.65}
			}
		},
		{
			biome = 'LUSHBIGPROPSOBJECTSFULL',
			flora = {
				TREE		= {n=1.05,	x=2.2,	c=0.86}
			}
		},
		{
			biome = 'LUSHBUBBLEOBJECTS',
			flora = {
				TREE		= {x=2.25,	c=0.86},
				FERN		= {n=1.4,	x=2.6}
			}
		},
		{
			biome = 'LUSHOBJECTSFULL',
			flora = {
				FERN		= {n=1.3,	x=1.9},
				FLOWER		= {n=1.4,	x=1.8}
			}
		},
		{
			biome = 'TENTACLEOBJECTSFULL',
			flora = {
				TENTACLE	= {n=1.2,	x=1.8,	c=0.94}
			}
		},
		{
			biome = 'LUSHROOMBOBJECTS',
			flora = {
				SHROOMSINGL	= {n=1.8,	x=2.9,	u=true}
			}
		},
		{
			biome = 'FROZEN',
			flora = {-- applied to all FROZEN sources
				TREE 		= {n=1.15,	x=2.45,	c=0.85}
			}
		},
		{
			biome = 'RADIOBIGPROPS',
			flora = {
				ROCK		= {n=1.1,	x=1.3,	c=0.95}
			}
		},
		{
			biome = 'RADIOSPIKEPOTATO',
			flora = {
				WEIRD		= {x=1.4,	c=1.2} -- potato
			}
		},
		{
			biome = 'TOXIC',
			flora = {-- applied to all TOXIC sources
				TENDRIL		= {n=1.4,	x=1.9}
			}
		},
		{
			biome = 'TOXICBIGPROPS',
			flora = {
				HUGEPROPS	= {n=0.7,	x=1.05,	c=0.84}
			}
		},
		{
			biome = 'TOXICOBJECTSFULL',
			flora = {
				LARGEBLOB	= {n=0.4,	x=0.8},
				FUNGALTREE	= {n=1.15,	x=1.75,	c=0.86}
			}
		},
		{
			biome = 'ROCKY',
			flora = {-- less -and smaller rocks on rocky biomes
				FACEBLEND	= {n=0.8,	x=0.9,	c=0.84,	u=true}
			}
		},
		{
			biome = 'SWAMPOBJECTSFULL',
			flora = {
				GROVELARGEF	= {n=1.05,	x=1.55,	c=1.1,	u=true},
				GROVELARGE	= {n=0.8,	x=-0.7, c=0.82},
				HQTREE		= {n=1.15,	x=2.5,	c=0.9,	u=true},
				FERN		= {n=1.5,	x=2.1},
				FLOWER		= {n=1.4,	x=1.8, 	w=0.94}
			}
		},
		{
			biome = 'ALIEN',
			flora = {
				LARGE		= {n=0.95,	x=1.02,	c=0.92},
				MEDIUM		= {n=0.9,	x=1.05,	c=0.82},
				SMALL		= {n=0.95,	x=1.05}
			}
		},
		{
			biome = 'LEVELONE',
			flora = {
				DEBRIS		= {c=0.00001,	u=true},
				CRATE		= {c=0.00001,	u=true},
				UNDERGROUND	= {c=0.1},
				WORDSTONE	= {c=0.33}
			}
		},
		{
			biome = 'PLANT',
			flora = {
				INTERACTIVE	= {n=0.48,	x=0.01,	c=1.1},
				TENTACLEP	= {c=0.6,	u=true},
				SPOREVENT	= {c=0.6,	u=true},
				FLYTRAP		= {c=0.6,	u=true}
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
		CROSS		= {n=0.95,	x=1.1},	      -- grass
		LBOARD		= {n=0.95,	x=1.1},		  -- grass
		TOXICGRASS	= {n=1.2,	x=1.6,	w=0}, -- not grass!
		PLANT		= {n=0.94,	x=1.5},
		BUBBLELUSH	= {x=1.15},
		BOULDER		= {n=1.1,	x=1.4},
		CURVED		= {x=1.5},
		DROPLET		= {n=1.05,	x=1.55},
		SPORE		= {x=1.2},
		LARGE		= {n=1.2,	x=1.6,	c=0.94},
		MEDIUM		= {n=1.05,	x=0.95},
		SMALL		= {n=0.95,	x=0.8},
		FIENDEGG	= {c=0.4},

	---	skipped
		LAVA		= {u=true},
		WEIRD		= {u=true},
		FRAGMENT	= {u=true},
		GRAVEL		= {u=true},
		HUGEPROPS	= {u=true},
		FARM		= {u=true}
	}
}

local solar_biomes = {
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/WIRECELLS/WIRECELLSOBJECTSDEAD.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/SHARDS/SHARDSOBJECTSDEAD.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/MSTRUCTURES/MSTRUCTOBJECTSDEAD.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/IRRISHELLS/IRRISHELLSOBJECTSDEAD.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HYDROGARDEN/HYDROGARDENOBJECTSDEAD.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HOUDINIPROPS/HOUDINIPROPSOBJECTS.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HEXAGON/HEXAGONOBJECTSDEAD.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/FRACTALCUBE/FRACTCUBEOBJECTSDEAD.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/ELBUBBLE/ELBUBBLEOBJECTSDEAD.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/CONTOUR/CONTOUROBJECTSDEAD.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BONESPIRE/BONESPIREOBJECTSDEAD.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BEAMSTONE/BEAMSOBJECTSDEAD.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICTENTACLESOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICSPORESOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSMID.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSLOW.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSFULL.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSDEAD.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICINFESTEDOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSMOONOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICBIGPROPSOBJECTSFULL.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPOBJECTSFULL.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDSHIELDTREEOBJECTS.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSMID.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSLOW.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSFULL.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSDEAD.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDALIENOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHCORALOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHBIGPROPSOBJECTSFULL.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKEPOTATOOBJECTS.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKECRYSTALSOBJECTS.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOBIGPROPSOBJECTS.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSMID.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSLOW.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSFULL.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSDEAD.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEGLOWOBJECTS.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEALIENOBJECTS.MBIN'] = {},			--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/RARE/FIENDEGGS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXICINFESTED.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXIC.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TENTACLEPLANT.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SPOREVENTPLANT.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHEDINFESTED.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHED.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVEINFESTED.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVE.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSHINFESTED.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSH.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZENINFESTED.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZEN.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FLYTRAPPLANT.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARRENINFESTED.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARREN.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/LEVELONEOBJECTS/FULLSAFE.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/LEVELONEOBJECTS/FULL.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/ULTRAEXTERNALOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHULTRAOBJECTS.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMBOBJECTS.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMAOBJECTS.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYWEIRDOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYOBJECTS.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSMID.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSLOW.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSFULL.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSDEAD.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHINFESTEDOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQTENTACLEOBJECTSFULL.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQOBJECTSFULL.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBUBBLEOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBIGPROPSOBJECTSFULL.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LAVA/LAVAOBJECTSFULL.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEUWPLANT/HUGEUWPLANTOBJECTS.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGETOXIC/HUGETOXICOBJECTSFULL.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGESCORCHED/HUGESCORCHOBJECTSFULL.MBIN'] = {},	--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEROCK/HUGEROCKOBJECTSFULL.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGERING/HUGERINGOBJECTSFULL.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGELUSH/HUGELUSHOBJECTSFULL.MBIN'] = {},		--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYWEIRDOBJECTS.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENPILLAROBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSMID.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSLOW.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSFULL.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSDEAD.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENHQOBJECTSMID.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENBIGPROPSOBJECTSFULL.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENALIENOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADWEIRDOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADOBJECTSDEAD.MBIN'] = {},							--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSVAR3.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSVAR2.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSVAR1.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSFULL.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYWEIRDOBJECTS.MBIN'] = {},				--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSMID.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSLOW.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSFULL.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSDEAD.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENINFESTEDOBJECTS.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHQOBJECTSFULL.MBIN'] = {},					--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHIVESOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENCORALOBJECTS.MBIN'] = {},						--<< preload_source
	['METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENBIGPROPSOBJECTSFULL.MBIN'] = {},				--<< preload_source
}

---------------------------------------------------------------------------
---- CODING
---------------------------------------------------------------------------
local function GetBiomeFlora(biome)
	local gc_spawn_file	= LoadRuntimeMbin(biome)
	local gc_objs		= gc_spawn_file.template.Objects
	local flora			= {}

	for key, objs in pairs(gc_objs) do
		if key ~= 'SelectableObjects' and key ~= 'META' then
			for _, spn in ipairs(objs) do
				flora[spn.Resource.Filename] = 0
				-- if spn.QualityVariants then
					-- c = spn.QualityVariants[#spn.QualityVariants].Coverage
				-- else
					-- c = spn.QualityVariantData.Coverage
				-- end
				-- flora[spn.Resource.Filename] = {
					-- n	= spn.MinScale,
					-- x	= spn.MaxScale,
					-- w	= spn.ShearWindStrength,
					-- c	= c
				-- }
			end
		end
	end
	return flora
end

--	populate solar_biomes with flora data
for mbin,_ in pairs(solar_biomes) do
	solar_biomes[mbin] = GetBiomeFlora(mbin)
end

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

--	property modifier functions for object spawns
function obj_spawn_data:addvalues(tag)
	for k, val in pairs(tag) do
		if val ~= 1 then
			self.mods[k].v = self.mods[k].v + val
			self.mods[k].i = self.mods[k].i + 1
		end
	end
end
function obj_spawn_data:averages()
	for _,d in pairs(self.mods) do
		d.v = d.i > 0 and (d.v / d.i) or 1
	end
end
function obj_spawn_data:copy(tag)
	for k, d in pairs(self.mods) do
		if k ~= 'u' then
			d.v = tag[k] or 1
		end
	end
end

-- find all tags for a single spawn and return their average
-- unless a tag includes u=true, then return just the one
local function AverageScales(spawn, worktags)
	-- Generate the modfiers and counters table for each spawn
	obj_spawn_data.mods = {}
	for k,_ in pairs(obj_spawn_data.props) do
		obj_spawn_data.mods[k] = {v=0, i=0}
	end
	for key, tag in pairs(worktags) do
		if spawn:find(key) then
			if tag.u or false then
				obj_spawn_data:copy(tag)
				break
			end
			obj_spawn_data:addvalues(tag)
		end
	end
	obj_spawn_data:averages()
end

-- main work.
-- get a merged tags list for a biome and add modifiers for every spawn
local function SetTheScales()
	-- return biome-specific prop scales
	local function GetBiomeScales(src)
		local tbl = {}
		for _,d in ipairs(scale_tags.biomes) do
			if src:find(d.biome) then
				tbl = MergeTables({tbl, d.flora})
			end
		end
		return tbl
	end
	local mbin_chg_tbl = {}
	for mbin_sf, flora in pairs(solar_biomes) do
		local mods_tbl = {
			MBIN_FILE_SOURCE	= mbin_sf,
			EXML_CHANGE_TABLE	= {}
		}
		local worktags = MergeTables( {scale_tags.globals, GetBiomeScales(mbin_sf)} )
		-- use the flora properties (t_props) if I ever figure what to do with them
		for mbin,_ in pairs(flora) do
			local vct = {}
			AverageScales(mbin, worktags)
			for k, property in pairs(obj_spawn_data.props) do
				if obj_spawn_data.mods[k].v ~= 1 then
					vct[#vct+1] = {property, obj_spawn_data.mods[k].v}
				end
			end
			if #vct > 0 then
				local spawn_props = {
					REPLACE_TYPE 		= 'All',
					INTEGER_TO_FLOAT	= 'Force',
					MATH_OPERATION 		= '*',
					SPECIAL_KEY_WORDS	= {'Filename', mbin},
					SECTION_UP			= 1,
					VALUE_CHANGE_TABLE 	= vct
				}
				table.insert(mods_tbl.EXML_CHANGE_TABLE, spawn_props)
			end
		end
		table.insert(mbin_chg_tbl, mods_tbl)
	end
	return mbin_chg_tbl
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_META large props.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.47',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'UNDEFINED_VARIABLE,UNUSED_VARIABLE',
	MODIFICATIONS 		= {{
		MBIN_CHANGE_TABLE	= SetTheScales()
	}}
}
