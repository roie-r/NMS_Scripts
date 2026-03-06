---------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_mxml_2_lua.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_mxml.lua')
---------------------------------------------------------------------------------------

--	Properties of [GcObjectSpawnData] being modified
local spawn_data = {
	numeral = {
		ns	= 'MinScale ',				-- [*] The space is NOT a bug!
		xs	= 'MaxScale',				-- [*] multiplier modifier
		an	= 'MaxAngle',				-- [+] additive modifier
		sw	= 'ShearWindStrength',		-- [*]
		cr	= 'Coverage',				-- [*]
		ld	= 'LodDistances',			-- [*]
		df	= 'FlatDensity',			-- [*] affects SlopeDensity
		ds	= 'SlopeDensity',
		fs	= 'FadeOutStartDistance',	-- [*] affects FadeOutEndDistance
		fe	= 'FadeOutEndDistance',
		rr	= 'MaxRegionRadius',		-- [+]
		pr	= 'MaxImposterRadius',		-- [+] *10 multiplier
	},
	flags = {
        cp	= 'CollideWithPlayer',
        cv	= 'CollideWithPlayerVehicle',
        dv	= 'DestroyedByPlayerVehicle',
		ds	= 'DestroyedByPlayerShip',
		fd	= 'IsFloatingIsland',		-- fix that helps to stabilize big props
	}
}

local solar_modifiers = {
	biomes = {
		{--	lush
			biotg = 'LUSH',
			flora = {-- applied to all LUSH sources
				TREE		= {ns=1.15,	xs=2.4,		cr=0.9,	ld=1.25},
				BUBBLELUSH	= {ns=1.15,	xs=1.65,	fs=2.6}
			}
		},
		{--	lushbigprops
			biotg = 'LUSHBIGPROPS',
			flora = {
				TREE		= {ns=1.05,	xs=2.2,		cr=0.86},
				CROSS		= {an=-5}
			}
		},
		{--	lushbubble
			biotg = 'LUSHBUBBLE',
			flora = {
				TREE		= {xs=2.25,	cr=0.86},
				FERN		= {ns=1.4,	xs=2.6}
			}
		},
		{--	lushobjectsfull
			biotg = 'LUSHOBJECTSFULL',
			flora = {
				FERN		= {ns=1.3,	xs=1.9},
				FLOWER		= {ns=1.4,	xs=1.8}
			}
		},
		{--	lushhqtentacle
			biotg = 'LUSHHQTENTACLE',
			flora = {
				TENTACLE	= {ns=1.2,	xs=1.78,	cr=0.94}
			}
		},
		{--	lushroomb
			biotg = 'LUSHROOMB',
			flora = {
				SHROOMSINGL	= {ns=1.8,	xs=2.85,	ov=true}
			}
		},
		{--	frozen
			biotg = 'FROZEN',
			flora = {-- applied to all FROZEN sources
				TREE 		= {ns=1.15,	xs=2.45,	cr=0.8,	ld=1.22},
				LIVINGSHIP	= {rr=-1,	ld=1.02}
			}
		},
		{--	radiobig
			biotg = 'RADIOBIG',
			flora = {
				ROCK		= {ns=1.1,	xs=1.3,		cr=0.95}
			}
		},
		{--	radiospikepotato
			biotg = 'RADIOSPIKEPOTATO',
			flora = {
				WEIRD		= {xs=1.4,	cr=1.2} -- potato
			}
		},
		{--	irradiate
			biotg = 'IRRADIATE',
			flora = {
				HUGETREE	= {ns=0.75,	xs=3.6,		cr=0.8,		ld=2.2}
			}
		},
		{--	scorched
			biotg = 'SCORCHED',
			flora = {
				HUGESPIRE	= {ns=0.9,	xs=1.02,	cr=0.9,		ov=true}
			},
			flags = {
				MEDIUMSPIRE	= {dv=true}
			}
		},
		{--	toxic
			biotg = 'TOXIC',
			flora = {
				HUGETOXIC	= {ns=0.7,	xs=0.97,	cr=0.88,	ov=true}
			}
		},
		{--	toxicobjectsfull
			biotg = 'TOXICOBJECTSFULL',
			flora = {
				LARGEBLOB	= {ns=0.4,	xs=0.8},
				FUNGALTREE	= {ns=1.15,	xs=1.75,	cr=0.86}
			}
		},
		{--	rocky
			biotg = 'ROCKY',
			flora = {-- less -and smaller rocks on rocky biomes
				FACEBLEND	= {ns=0.8,	xs=0.84,	cr=0.76,	ov=true},
				TOXICGRASS	= {xs=1.9,				cr=1.05},
			}
		},
		{--	swamp
			biotg = 'SWAMP',
			flora = {
				GROVELARGEF	= {ns=1.05,	xs=1.55,	cr=1.02,	ov=true},
				GROVELARGE	= {ns=0.8,	xs=-0.7, 	cr=0.82},
				HQTREE		= {ns=1.15,	xs=2.5,		cr=0.9},
				FERN		= {ns=1.5,	xs=2.1},
				FLOWER		= {ns=1.4,	xs=1.8, 	sw=0.94}
			},
			flags = {
				GROVELARGEF	= {fd=true},
				GROVELARGE	= {fd=true}
			}

		},
		{--	alien
			biotg = 'ALIEN',
			flora = {
				LARGE		= {ns=0.95,	xs=1.02,	cr=0.92},
				MEDIUM		= {ns=0.9,	xs=1.05,	cr=0.82},
				SMALL		= {ns=0.95,	xs=1.05},
			}
		},
		{--	island
			biotg = 'ISLAND',
			flora = {
				ISLAND		= {cr=0.84}
			}
		},
		{--	weird
			biotg = 'WEIRD',
			flora = {
				WEIRD		= {ld=2.6,	rr=6,		ul=true},
				BONESPIRE	= {pr=7},
				CONTOUR		= {pr=7},
				SHELLSAIL	= {pr=8},
				SHELLSHARD	= {pr=8},
				HYDROGARDEN	= {pr=7},
				MSTRUCTURE	= {pr=7},
			}
		},
		{--	levelone
			biotg = 'LEVELONE',
			flora = {
				DEBRIS		= {cr=0, 	ov=true},
				CRATE		= {cr=0, 	ov=true},
				UNDERGROUND	= {cr=0.1, 	ov=true},
				WORDSTONE	= {cr=0.33}
			}
		},
		{--	stormcrystal
			biotg = 'STORMCRYSTAL',
			flags = {
				STORMCRYST	= {cv=true,	dv=false}
			}
		},
		{--	fiendegg
			biotg = 'FIENDEGG',
			flora = {
				FIENDEGG	= {cr=0.4}
			}
		},
		{--	objects/plant
			biotg = 'OBJECTS/PLANT',
			flora = {
				TENTACLE	= {xs=0.75,	df=0.5,		cr=0.2,	ov=true},
				SPIKEY		= {xs=0.75,	df=0.5,		cr=0.2,	ov=true},
				SPOREVENT	= {xs=0.75,	df=0.5,		cr=0.2,	ov=true},
				FLYTRAP		= {xs=0.75,	df=0.5,		cr=0.2,	ov=true},
				INTERACTIVE	= {ns=0.48,	xs=0.01,	cr=1.1}
			}
		},
		{--	underwater
			biotg = 'UNDERWATER',
			flora = {
				CRYSTAL		= {xs=0.95,	cr=0.5,	df=0.8, 	ov=true},
				GASBAG		= {xs=0.85,	cr=0.5,	df=0.9}
			}
		},
		{--	hugeprops
			biotg = 'HUGEPROPS',
			flora = {
				ROCKRING	= {cr=0.85},
				HUGEPROPS	= {ov=true},
			},
			flags = {
				HUGEPROPS	= {fd=true}
			}
		},
		{--	bigprops
			biotg = 'BIGPROPS',
			flora = {
				HUGEPROPS	= {ov=true},
			},
			flags = {
				HUGEPROPS	= {fd=true}
			}
		}
	},
	global_flora = {
		SHARD		= {ns=1.05,	xs=1.4},
		SPIRE		= {ns=1.15,	xs=1.3},
		ROCK		= {ns=1.2,	xs=1.75},
		CACTUS		= {ns=1.1,	xs=1.55},
		TREE		= {ns=1.15,	xs=2.4,	ld=1.8},
		SHROOM		= {ns=1.05,	xs=2.5},
		FOLIAGE		= {ns=1.1,	xs=1.3},
		FLOWERS		= {xs=1.2,			fs=1.4},
		CROSS		= {ns=0.95,	xs=1.1,	fs=1.8,	df=0.88,	ld=1.5},	-- grass
		LBOARD		= {ns=0.95,	xs=1.1,	fs=1.8,	df=0.88,	ld=1.5},	-- grass
		LUSHGRASS	= {xs=1.4,			fs=1.6,	df=0.88,	ld=1.5},	-- grass
		BUBBLELUSH	= {xs=1.15,			fs=2.2,				ld=1.5},	-- grass
		TOXICGRASS	= {ns=1.2,	xs=1.6,	fs=1.4,	sw=0},					-- shrooms!
		PLANT		= {ns=0.94,	xs=1.5},
		TENDRIL		= {ns=1.1,	xs=1.55,		fs=1.4},
		BOULDER		= {ns=1.1,	xs=1.4},
		CURVED		= {xs=1.5},
		DROPLET		= {ns=1.05,	xs=1.55},
		SPORE		= {xs=1.2},
		LARGE		= {ns=1.2,	xs=1.6,	cr=0.92},
		MEDIUM		= {ns=1.05,	xs=0.95},
		SMALL		= {ns=0.95,	xs=0.8},

	--- global lod multiplier
		SCENE		= {ld=1.25},

	---	ignored
		LAVA		= {ig=true},
		FRAGMENT	= {ig=true},
		GRAVEL		= {ig=true},
		FARM		= {ig=true}
	},
	global_flags = {
		TREE		= {fd=true}
	}
}

---------------------------------------------------------------------------
--	sum scale values and counters for averaging
function spawn_data:addValues(tag)
	for k, val in pairs(tag) do
		if val ~= 1 and k ~= 'ul' then
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
	for k, d in pairs(tag) do
		self.res[k] = d
	end
end

--	find all tags for a single spawn and return their average
--	ov=true tag marks an override, values will not to be averaged with others
--	ig=true tag marks ignored. results are deleted and the spawn will be unchanged
function spawn_data:averageScales(spawn, worktags)
	-- Generate/reset the modifiers and counters tables for each spawn
	self.mods	= {}
	self.res	= {} -- will store the calculated result
	self.ultra	= nil
	for k,_ in pairs(self.numeral) do
		self.mods[k] = {v=0, i=0}
		self.res[k]  = -1 -- (-1 == empty)
	end
	for key, tag in pairs(worktags) do
		if spawn:find(key) then
			-- process special flags first
			if tag.ul then
				self.ultra = true
			end
			if tag.ov then
				self:copyRes(tag)
				return
			end
			if tag.ig then
				self.res = nil
				return
			end
			self:addValues(tag)
		end
	end
	self:averages()
end

--	update flag modifiers for a specific biome
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

--	True if result exists for a given property key
function spawn_data:HasMod(k)
	return self.res and self.res[k] ~= -1
end

--	return biome-specific flora and flags modifiers
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

--	main work process (Receives the exml file from amumss)
local function ProcessBiome(exml, mbin)
	local function getHighVariant(qvars)
	--	Select the highest GcObjectSpawnDataVariant (between LOW STANDARD ULTRA)
	--	Add ULTRA section if flagged and return it for editing
		for _,qv in ipairs(qvars) do
			-- map variant id for direct access
			-- key ending with [_] is ignored by ToMxml
			qvars.meta[qv.ID..'_'] = qv
		end
		if qvars.meta.ULTRA_ then
			return qvars.meta.ULTRA_
		elseif spawn_data.ultra then -- add ultra section
			local qhigh		= UnionTables({qvars.meta.STANDARD_})
			qhigh.ID		= 'ULTRA'
			qvars[#qvars+1] = qhigh
			return qhigh
		else
			return qvars.meta.STANDARD_
		end
	end
	-- if [QualityVariants] is missing then mbin is deprecated
	local function hasQVariant(t)
		for k, v in pairs(t) do
			if k == 'QualityVariants' then
				return true
			elseif type(v) == 'table' then
				if hasQVariant(v) then return true end
			end
		end
		return false
	end
	local solar_biome = ToLua(exml)
	if not hasQVariant(solar_biome) then return 'IGNORE' end

	local prp = spawn_data.numeral -- shorter reference to GcObjectSpawnData property names
	local biomeflora, biomeflags = solar_modifiers:getModifiers(mbin)
	-- merged, biome-specific modifiers table
	local workflora	= UnionTables({solar_modifiers.global_flora, biomeflora})
	-- merged, biome-specific flags table
	local workflags	= UnionTables({solar_modifiers.global_flags, biomeflags})
	for key, objs in pairs(solar_biome.Objects) do
		if key ~= 'meta' and objs[1] and objs[1].meta.value == 'GcObjectSpawnData' then
			for _, spn in ipairs(objs) do
				spawn_data:averageScales(spn.Resource.Filename, workflora)
				if spawn_data:HasMod('ns') then spn[prp.ns] = spn[prp.ns] * spawn_data.res.ns end	-- MinScale
				if spawn_data:HasMod('xs') then spn[prp.xs]	= spn[prp.xs] * spawn_data.res.xs end	-- MaxScale
				if spawn_data:HasMod('an') then spn[prp.an]	= spn[prp.an] + spawn_data.res.an end	-- MaxAngle
				if spawn_data:HasMod('sw') then spn[prp.sw] = spn[prp.sw] * spawn_data.res.sw end	-- ShearWindStrength

				-- edit GcObjectSpawnDataVariant
				local qvr = getHighVariant(spn.QualityVariants)
				if spawn_data:HasMod('df') then
					qvr[prp.df] = qvr[prp.df] * spawn_data.res.df	-- FlatDensity
					qvr[prp.ds] = qvr[prp.df] * 1.06				-- SlopeDensity
				end
				if spawn_data:HasMod('fs') and qvr[prp.fs] < 9000 then
					qvr[prp.fs] = qvr[prp.fs] * spawn_data.res.fs	-- FadeOutStartDistance
					qvr[prp.fe] = qvr[prp.fs] + 20					-- FadeOutEndDistance
				end
				if spawn_data:HasMod('cr') then qvr[prp.cr] = qvr[prp.cr] * spawn_data.res.cr end	-- Coverage

				lod = spawn_data:HasMod('ld') and spawn_data.res.ld or 1.22 -- default overwritten by SCENE global
				for i=2, #qvr[prp.ld] do
					qvr[prp.ld][i] = qvr[prp.ld][i] * lod			-- LodDistances
				end
				local rr = qvr[prp.rr]
				if spawn_data:HasMod('rr') then
					qvr[prp.rr] = math.floor(rr + spawn_data.res.rr)-- MaxRegionRadius
				elseif rr < 90 then
					qvr[prp.rr] = rr + ((rr < 15 and rr > 6) and 1 or 3)
				end
				if spawn_data:HasMod('pr') and qvr[prp.pr] < 90 and rr < 90 then
					qvr[prp.pr] = math.floor(qvr[prp.pr] + spawn_data.res.pr * 10) -- MaxImposterRadius
				end
				--	loop through boolean flags
				spawn_data:getFlags(spn.Resource.Filename, workflags)
				for k, flg in pairs(spawn_data.flags) do
					if spawn_data.modflags[k] ~= nil then spn[flg] = spawn_data.modflags[k] end
				end
			end
		end
	end
	return ToMxmlFile(solar_biome)
end

---------------------------------------------------------------------------------------
local function GetFileName(f)
	return f:match('([^\\/]+)%.')
end

local biome = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TENTACLEPLANT.MBIN'
local r_src = io.open(biome:gsub('.MBIN$', '.MXML'), 'r')
local w_src = io.open('d:/_dump/'..GetFileName(biome)..'.mxml', 'w')

w_src:write(ProcessBiome(r_src:read('*a'), biome))
print('saved processed '..GetFileName(biome)..'.mxml')
r_src:close()
w_src:close()
