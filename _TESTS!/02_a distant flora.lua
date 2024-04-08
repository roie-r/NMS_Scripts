--------------------------------------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
dofile('LIB/_exml_2_lua.lua')
--------------------------------------------------------------------------------
local mod_desc = [[

  * MUST BE LAUNCHED WITH A SOURCE PRE-LOADER SCRIPT
]]------------------------------------------------------------------------------

local solar_biomes = {
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/WIRECELLS/WIRECELLSOBJECTSDEAD.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/SHARDS/SHARDSOBJECTSDEAD.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/MSTRUCTURES/MSTRUCTOBJECTSDEAD.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/IRRISHELLS/IRRISHELLSOBJECTSDEAD.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HYDROGARDEN/HYDROGARDENOBJECTSDEAD.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HOUDINIPROPS/HOUDINIPROPSOBJECTS.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HEXAGON/HEXAGONOBJECTSDEAD.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/FRACTALCUBE/FRACTCUBEOBJECTSDEAD.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/ELBUBBLE/ELBUBBLEOBJECTSDEAD.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/CONTOUR/CONTOUROBJECTSDEAD.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BONESPIRE/BONESPIREOBJECTSDEAD.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BEAMSTONE/BEAMSOBJECTSDEAD.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICTENTACLESOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICSPORESOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSMID.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSLOW.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSFULL.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSDEAD.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICINFESTEDOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSMOONOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICBIGPROPSOBJECTSFULL.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPOBJECTSFULL.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDSHIELDTREEOBJECTS.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSMID.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSLOW.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSFULL.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSDEAD.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDALIENOBJECTS.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHCORALOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHBIGPROPSOBJECTSFULL.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKEPOTATOOBJECTS.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKECRYSTALSOBJECTS.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOBIGPROPSOBJECTS.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSMID.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSLOW.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSFULL.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSDEAD.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEGLOWOBJECTS.MBIN',			--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEALIENOBJECTS.MBIN',			--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/RARE/FIENDEGGS.MBIN',						--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXICINFESTED.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXIC.MBIN',							--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TENTACLEPLANT.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SPOREVENTPLANT.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHEDINFESTED.MBIN',				--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHED.MBIN',						--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVEINFESTED.MBIN',			--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVE.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSHINFESTED.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSH.MBIN',							--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZENINFESTED.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZEN.MBIN',							--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FLYTRAPPLANT.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARRENINFESTED.MBIN',					--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARREN.MBIN',							--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/LEVELONEOBJECTS/FULLSAFE.MBIN',				--<< preload_source_discard
	-- 'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/LEVELONEOBJECTS/FULL.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/ULTRAEXTERNALOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHULTRAOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMBOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMAOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYWEIRDOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSMID.MBIN',							--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSLOW.MBIN',							--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSFULL.MBIN',							--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSDEAD.MBIN',							--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHINFESTEDOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQTENTACLEOBJECTSFULL.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQOBJECTSFULL.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBUBBLEOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBIGPROPSOBJECTSFULL.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LAVA/LAVAOBJECTSFULL.MBIN',							--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEUWPLANT/HUGEUWPLANTOBJECTS.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGETOXIC/HUGETOXICOBJECTSFULL.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGESCORCHED/HUGESCORCHOBJECTSFULL.MBIN',	--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEROCK/HUGEROCKOBJECTSFULL.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGERING/HUGERINGOBJECTSFULL.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGELUSH/HUGELUSHOBJECTSFULL.MBIN',		--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYWEIRDOBJECTS.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENPILLAROBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSMID.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSLOW.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSFULL.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSDEAD.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENHQOBJECTSMID.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENBIGPROPSOBJECTSFULL.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENALIENOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADWEIRDOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADOBJECTS.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADOBJECTSDEAD.MBIN',							--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSVAR3.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSVAR2.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSVAR1.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSFULL.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYWEIRDOBJECTS.MBIN',				--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSMID.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSLOW.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSFULL.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSDEAD.MBIN',						--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENINFESTEDOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHQOBJECTSFULL.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHIVESOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENCORALOBJECTS.MBIN',					--<< preload_source_discard
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENBIGPROPSOBJECTSFULL.MBIN',				--<< preload_source_discard
}
			
local ADF = {}
for _,biome in ipairs(solar_biomes) do
	local gc_object_list	= LoadRuntimeMbin(biome)
	local gc_objs			= gc_object_list.template.Objects

	if not gc_objs.DistantObjects then
		gc_objs.DistantObjects = { META = {'name', 'DistantObjects'} }
	end
	-- move landmarks to distant objects
	if gc_objs.Landmarks then
		for _,objs in ipairs(gc_objs.Landmarks) do
			gc_objs.DistantObjects[#gc_objs.DistantObjects+1] = objs
		end
		gc_objs.Landmarks = nil
	end

	-- move objects to landmarks
	if gc_objs.Objects then
		gc_objs.Landmarks = { META = {'name', 'Landmarks'} }
		for _,objs in ipairs(gc_objs.Objects) do
			-- gc_objs.DistantObjects[#gc_objs.DistantObjects+1] = objs
			gc_objs.Landmarks[#gc_objs.Landmarks+1] = objs
		end
		gc_objs.Objects = nil
	end

	ADF[#ADF+1] = {
		FILE_CONTENT	 = FileWrapping(gc_object_list),
		FILE_DESTINATION = biome:gsub('.MBIN$', '.EXML')
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST distant props.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.64',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= ADF
}
