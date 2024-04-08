---------------------------------------------------------------------------------------
-- EXCLUDED FROM BATCH
---------------------------------------------------------------------------------------
dofile('LIB/_exml_2_lua.lua')
dofile('LIB/_lua_2_exml.lua')
---------------------------------------------------------------------------------------
local mod_desc = [[
  Utilizes the SCENE files' descriptive name and path to match 'tags'
  from solar_modifiers table to each scene, then multiples the tags' values
  with the properties in object_spawn_prop table.

  Multiple modifiers in the same scene path are averaged:
  - Example:
   ROCKS/LARGE/LARGEROCK.SCENE.MBIN   >> LARGE & ROCK
   ROCKS/MEDIUM/MEDIUMROCK.SCENE.MBIN >> MEDIUM & ROCK
   FOLIAGE/MEDIUMPLANT.SCENE.MBIN     >> FOLIAGE & MEDIUM & PLANT

  - The correct tag can match anything from any scene files across all
   biomes (MODEL), to a single instance of one scene (VOLCANO).
  - solar_modifiers.biomes are modifiers for specific source files.
   They can match more than one source: LUSH will be applied to ALL lush biomes,
   and LUSHBUBBLE applied to the one source with the matching name, overwriting LUSH.
  - The biome-specific modifiers are added to -or replace solar_modifiers.global_flora
   table and are averaged with it.
  - Adding o=true makes a tag an override - Other matches will be ignored, unless the
   the tag is overwritten by a biome tag.
  - A tag with the single modifier {i=true} causes the scene to be ignored.
  - Other properties of GcObjectSpawnData.xml can be modded by adding a property's
   name to object_spawn_prop with a unique key, then adding tag modifiers for it.

  * MUST BE LAUNCHED WITH A SOURCE PRE-LOADER SCRIPT
]]-------------------------------------------------------------------------------------

--- Properties of [GcObjectSpawnData.xml] being modified
local spawn_data = {
	calcs = {
		n	= 'MinScale',				-- [*]
		x	= 'MaxScale',				-- [*]
		a	= 'MaxAngle',				-- [+]
		w	= 'ShearWindStrength',		-- [*]
		c	= 'Coverage',				-- [*]
		l	= 'LodDistances',			-- [*]
		d	= 'FlatDensity',			-- [*] affects SlopeDensity
		f	= 'FadeOutStartDistance',	-- [*] affects FadeOutEndDistance
		r	= 'MaxRegionRadius',		-- [+]
	},
	flags = {
        cp	= 'CollideWithPlayer',
        cv	= 'CollideWithPlayerVehicle',
        dv	= 'DestroyedByPlayerVehicle',
		ds	= 'DestroyedByPlayerShip'
	}
}

local solar_modifiers = {
	biomes = {
		{
			biotg = 'LUSH',
			flora = { -- applied to all LUSH sources
				TREE		= {n=1.15,	x=2.4,	c=0.9},
				BUBBLELUSH	= {n=1.15,	x=1.65,	f=2.6}
			}
		},
		{
			biotg = 'LUSHBIGPROPS',
			flora = {
				TREE		= {n=1.05,	x=2.2,	c=0.86},
				CROSS		= {a=-5}				
			}
		},
		{
			biotg = 'LUSHBUBBLE',
			flora = {
				TREE		= {x=2.25,	c=0.86},
				FERN		= {n=1.4,	x=2.6}
			}
		},
		{
			biotg = 'LUSHOBJECTSFULL',
			flora = {
				FERN		= {n=1.3,	x=1.9},
				FLOWER		= {n=1.4,	x=1.8}
			}
		},
		{
			biotg = 'LUSHHQTENTACLE',
			flora = {
				TENTACLE	= {n=1.2,	x=1.78,	c=0.94}
			}
		},
		{
			biotg = 'LUSHROOMB',
			flora = {
				SHROOMSINGL	= {n=1.8,	x=2.85,	o=true}
			}
		},
		{
			biotg = 'FROZEN',
			flora = {-- applied to all FROZEN sources
				TREE 		= {n=1.15,	x=2.45,	c=0.8}
			}
		},
		{
			biotg = 'RADIOBIG',
			flora = {
				ROCK		= {n=1.1,	x=1.3,	c=0.95}
			}
		},
		{
			biotg = 'RADIOSPIKEPOTATO',
			flora = {
				WEIRD		= {x=1.4,	c=1.2} -- potato
			}
		},
		{
			biotg = 'SCORCHED',
			flora = {
				HUGESPIRE	= {n=0.9,	x=0.95,	c=0.8}
			},
			flags = {
				MEDIUMSPIRE	= {dv=true}
			}
		},
		{
			biotg = 'TOXIC',
			flora = {
				HUGETOXIC	= {n=0.7,	x=0.96,	c=0.78}
			}
		},
		{
			biotg = 'TOXICOBJECTSFULL',
			flora = {
				LARGEBLOB	= {n=0.4,	x=0.8},
				FUNGALTREE	= {n=1.15,	x=1.75,	c=0.86}
			}
		},
		{
			biotg = 'ROCKY',
			flora = {-- less -and smaller rocks on rocky biomes
				FACEBLEND	= {n=0.8,	x=0.84,	c=0.76,	o=true},
				TOXICGRASS	= {x=1.9,			c=1.05},
			}
		},
		{
			biotg = 'SWAMP',
			flora = {
				GROVELARGEF	= {n=1.05,	x=1.55,	c=1.02,	u=true,	o=true},
				GROVELARGE	= {n=0.8,	x=-0.7, c=0.82,	u=true},
				HQTREE		= {n=1.15,	x=2.5,	c=0.9},
				FERN		= {n=1.5,	x=2.1},
				FLOWER		= {n=1.4,	x=1.8, 	w=0.94}
			}
		},
		{
			biotg = 'ALIEN',
			flora = {
				LARGE		= {n=0.95,	x=1.02,	c=0.92},
				MEDIUM		= {n=0.9,	x=1.05,	c=0.82},
				SMALL		= {n=0.95,	x=1.05},
			}
		},
		{
			biotg = 'WEIRD',
			flora = {
				WEIRD		= {f=2.5,	l=2.0},
			}
		},
		{
			biotg = 'LEVELONE',
			flora = {
				DEBRIS		= {c=0, 	o=true},
				CRATE		= {c=0, 	o=true},
				UNDERGROUND	= {c=0.1, 	o=true},
				WORDSTONE	= {c=0.33}
			}
		},
		{
			biotg = 'PLANT',
			flora = {
				INTERACTIVE	= {n=0.48,	x=0.01,	c=1.1},
				TENTACLEP	= {c=0.5},
				SPOREVENT	= {c=0.5},
				FLYTRAP		= {c=0.5}
			}
		}
	},
	global_flora = {
		SHARD		= {n=1.05,	x=1.4},
		SPIRE		= {n=1.15,	x=1.3},
		ROCK		= {n=1.2,	x=1.75},
		CACTUS		= {n=1.1,	x=1.55},
		TREE		= {n=1.15,	x=2.4,	l=1.75},
		SHROOM		= {n=1.05,	x=2.5},
		FOLIAGE		= {n=1.1,	x=1.3},
		FLOWERS		= {x=1.2,			f=1.4},
		CROSS		= {n=0.95,	x=1.1,	f=2.0,	d=0.9,	l=1.55},	-- grass   (add fix with maximum value !?!)
		LBOARD		= {n=0.95,	x=1.1,	f=1.8,	d=0.9,	l=1.55},	-- grass
		LUSHGRASS	= {x=1.4,			f=1.6,	d=0.9,	l=1.55},	-- grass
		BUBBLELUSH	= {x=1.15,			f=2.2,			l=1.55},	-- grass
		TOXICGRASS	= {n=1.2,	x=1.6,	f=1.4,	w=0},				-- shrooms not grass!
		PLANT		= {n=0.94,	x=1.5},
		TENDRIL		= {n=1.1,	x=1.55,	f=1.4},
		BOULDER		= {n=1.1,	x=1.4},
		CURVED		= {x=1.5},
		DROPLET		= {n=1.05,	x=1.55},
		SPORE		= {x=1.2},
		LARGE		= {n=1.2,	x=1.6,	c=0.92},
		MEDIUM		= {n=1.05,	x=0.95},
		SMALL		= {n=0.95,	x=0.8},
		FIENDEGG	= {c=0.4},

	--- global lod multiplier
		SCENE		= {l=1.25},

	---	skipped
		LAVA		= {i=true},
		FRAGMENT	= {i=true},
		GRAVEL		= {i=true},
		HUGEPROPS	= {i=true},
		FARM		= {i=true}
	},
	global_flags = {}
}

local source_mbins = {
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENBIGPROPSOBJECTSFULL.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENCORALOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHIVESOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHQOBJECTSFULL.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENINFESTEDOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSDEAD.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSFULL.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSLOW.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSMID.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYWEIRDOBJECTS.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSFULL.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADOBJECTSDEAD.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADWEIRDOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENALIENOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENBIGPROPSOBJECTSFULL.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENHQOBJECTSMID.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSDEAD.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSFULL.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSLOW.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSMID.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENPILLAROBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYWEIRDOBJECTS.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGELUSH/HUGELUSHOBJECTSFULL.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGERING/HUGERINGOBJECTSFULL.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEROCK/HUGEROCKOBJECTSFULL.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGESCORCHED/HUGESCORCHOBJECTSFULL.MBIN',	--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGETOXIC/HUGETOXICOBJECTSFULL.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEUWPLANT/HUGEUWPLANTOBJECTS.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LAVA/LAVAOBJECTSFULL.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBIGPROPSOBJECTSFULL.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBUBBLEOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQOBJECTSFULL.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQTENTACLEOBJECTSFULL.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHINFESTEDOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSDEAD.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSFULL.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSLOW.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSMID.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYWEIRDOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMAOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMBOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/LEVELONEOBJECTS/FULL.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/LEVELONEOBJECTS/FULLSAFE.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARREN.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARRENINFESTED.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FLYTRAPPLANT.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZEN.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZENINFESTED.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSH.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSHINFESTED.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVE.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVEINFESTED.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHED.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHEDINFESTED.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SPOREVENTPLANT.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TENTACLEPLANT.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXIC.MBIN',							--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXICINFESTED.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/RARE/FIENDEGGS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEALIENOBJECTS.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEGLOWOBJECTS.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSDEAD.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSFULL.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSLOW.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSMID.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOBIGPROPSOBJECTS.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKECRYSTALSOBJECTS.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKEPOTATOOBJECTS.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHBIGPROPSOBJECTSFULL.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHCORALOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDALIENOBJECTS.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSDEAD.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSFULL.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSLOW.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSMID.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDSHIELDTREEOBJECTS.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPOBJECTSFULL.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICBIGPROPSOBJECTSFULL.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSMOONOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICINFESTEDOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSDEAD.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSFULL.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSLOW.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSMID.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICSPORESOBJECTS.MBIN',						--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICTENTACLESOBJECTS.MBIN',					--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BEAMSTONE/BEAMSOBJECTSDEAD.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BONESPIRE/BONESPIREOBJECTSDEAD.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/CONTOUR/CONTOUROBJECTSDEAD.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/ELBUBBLE/ELBUBBLEOBJECTSDEAD.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/FRACTALCUBE/FRACTCUBEOBJECTSDEAD.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HEXAGON/HEXAGONOBJECTSDEAD.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HYDROGARDEN/HYDROGARDENOBJECTSDEAD.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/IRRISHELLS/IRRISHELLSOBJECTSDEAD.MBIN',		--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/MSTRUCTURES/MSTRUCTOBJECTSDEAD.MBIN',			--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/SHARDS/SHARDSOBJECTSDEAD.MBIN',				--<< preload_source
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/WIRECELLS/WIRECELLSOBJECTSDEAD.MBIN',			--<< preload_source
}

---------------------------------------------------------------------------
---- CODING
---------------------------------------------------------------------------

-- A deep merge of an array of tables by keys. Last value wins
-- local function UnionTables(tables)
	-- local merged = {}
	-- for _, tbl in ipairs(tables) do
		-- for k, val in pairs(tbl) do
			-- if type(val) == 'table' then
				-- merged[k] = merged[k] or {}
				-- merged[k] = UnionTables({merged[k], val})
			-- else
				-- merged[k] = val
			-- end
		-- end
	-- end
	-- return merged
-- end

--	sum scale values and counters for averaging
function spawn_data:addValues(tag)
	for k, val in pairs(tag) do
		if val ~= 1 then
			self.mods[k].v = self.mods[k].v + val
			self.mods[k].i = self.mods[k].i + 1
		end
	end
end
--	calculate scale averages into results
function spawn_data:averages()
	for k, d in pairs(self.mods) do
		if d.i > 0 then self.res[k] = d.v / d.i end
	end
end
--	copy scales to results in order to bypass averaging
function spawn_data:copyRes(tag)
	tag.o = nil
	for k, d in pairs(tag) do
		self.res[k] = d
	end
end

-- find all tags for a single spawn and return their average
-- o=true tag marks an override, values will not to be averaged with others
-- i=true tag marks ignored. results are deleted and the spawn will be unchanged
function spawn_data:averageScales(spawn, worktags)
	-- Generate the modifiers and counters tables for each spawn
	self.mods	= {}
	self.res	= {}
	self.ultra	= nil
	for k,_ in pairs(self.calcs) do
		self.mods[k] = {v=0, i=0}
		self.res[k]  = -1 -- (-1 == empty)
	end
	for key, tag in pairs(worktags) do
		if spawn:find(key) then
			-- process special flags first
			if tag.i then
				self.res = nil
				return
			end
			if tag.u then
				self.ultra = true
				tag.u = nil
			end
			if tag.o then
				self:copyRes(tag)
				return
			end
			self:addValues(tag)
		end
	end
	self:averages()
end

-- update flag modifiers for a specific biome
function spawn_data:getFlags(spawn, workflags)
	self.modflags = {}
	for tag, flags in pairs(workflags) do
		if spawn:find(tag) then
			for k, f in pairs(flags) do
				self.modflags[k] = f
			end
		end
	end
end

-- return biome-specific flora and flags modifiers
function solar_modifiers:getModifiers(mbin)
	local scales, flags = {}, {}
	for _,biome in ipairs(self.biomes) do
		if mbin:find(biome.biotg) then
			scales = UnionTables({scales, biome.flora})
			if biome.flags then
				flags = UnionTables({flags, biome.flags})
			end
		end
	end
	return scales, flags
end

--	return if result is present for a given property key
local function HasRes(k)
	return spawn_data.res and (spawn_data.res[k] ~= -1)
end

local function valueDump(mbin, spn, key)
	if mbin:find('FROZEN') then
		if spn.Resource.Filename:find('TREE') then
			print(mbin:sub(40)..'-->'..spn.Resource.Filename:sub(23)..'~> '..spn[key])
		end
	end
end

-- main work.
-- get a merged tags list for a biome and apply modifiers for every spawn
local ADF = {}
for _,mbin in pairs(source_mbins) do
	local solar_biome	= LoadRuntimeMbin(mbin)
	local gc_objs		= solar_biome.template.Objects

	local biomeflora, biomeflags = solar_modifiers:getModifiers(mbin)
	local workflora	= UnionTables({solar_modifiers.global_flora, biomeflora})
	local workflags	= UnionTables({solar_modifiers.global_flags, biomeflags})
	for key, objs in pairs(gc_objs) do
		if key ~= 'SelectableObjects' and key ~= 'META' then
			for _, spn in ipairs(objs) do
				---DEBUG---------------------------
				-- valueDump(mbin, spn, 'MaxScale')
				-----------------------------------
				spawn_data:averageScales(spn.Resource.Filename, workflora)
				if HasRes('n') then spn.MinScale		  = spn.MinScale * spawn_data.res.n end
				if HasRes('x') then spn.MaxScale		  = spn.MaxScale * spawn_data.res.x end
				if HasRes('a') then spn.MaxAngle		  = spn.MaxAngle + spawn_data.res.a end
				if HasRes('w') then spn.ShearWindStrength = spn.ShearWindStrength * spawn_data.res.w end

				-- loop thourgh GcObjectSpawnDataVariant objects
				for _,qvr in ipairs(spn.QualityVariants) do
					if HasRes('d') then
						qvr.FlatDensity  = qvr.FlatDensity * spawn_data.res.d
						qvr.SlopeDensity = qvr.FlatDensity * 1.1
					end
					if HasRes('f') then
						qvr.FadeOutStartDistance = qvr.FadeOutStartDistance * spawn_data.res.f
						qvr.FadeOutEndDistance	 = qvr.FadeOutStartDistance + 20
					end
					if HasRes('c') then qvr.Coverage = qvr.Coverage * spawn_data.res.c end

					lod = HasRes('l') and spawn_data.res.l or 1.25 -- default overwritten by SCENE global
					for i=2, #qvr.LodDistances do
						qvr.LodDistances[i].value = qvr.LodDistances[i].value * lod
					end
					if HasRes('r') then
						qvr.MaxRegionRadius = qvr.MaxRegionRadius + spawn_data.res.r
					else
						mr = tonumber(qvr.MaxRegionRadius)
						qvr.MaxRegionRadius = qvr.MaxRegionRadius + ((mr < 15 and mr > 6) and 1 or 4)
					end
				end
				-- add ultra quality (duplicates standard)
				if #spn.QualityVariants == 1 and spawn_data.ultra then
					spn.QualityVariants[2]    = UnionTables({spn.QualityVariants[1]})
					spn.QualityVariants[2].ID = 'ULTRA'
				end
				--	loop through boolean flags
				spawn_data:getFlags(spn.Resource.Filename, workflags)
				for k, prp in pairs(spawn_data.flags) do
					if spawn_data.modflags[k] ~= nil then spn[prp] = spawn_data.modflags[k] end
				end
			end
		end
	end
	ADF[#ADF+1] = {
		FILE_CONTENT	 = FileWrapping(solar_biome),
		FILE_DESTINATION = mbin:gsub('.MBIN$', '.EXML')
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_META large flora.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.64',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= ADF,
	AMUMSS_SUPPRESS_MSG	= 'UNUSED_VARIABLE'
}
