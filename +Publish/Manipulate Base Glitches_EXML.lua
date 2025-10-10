------------------------------------------------------------------------
-- Enable 3D rotation and scaling for Glitch items
------------------------------------------------------------------------

local basepart_id = {
	'BUILDLIGHT',
	'BUILDLIGHT2',
	'BUILDLIGHT3',
	'HEATER',
	'BASE_TOYCUBE',
	'BASE_TOYSPHERE',
	'BASE_TOYJELLY',
	'BASE_TOYCORE',
	'BASE_ENGINEORB',
	'BASE_BEAMSTONE',
	'BASE_BUBBLECLUS',
	'BASE_MEDGEOMETR',
	'BASE_SHARD',
	'BASE_STARJOINT',
	'BASE_BONEGARDEN',
	'BASE_CONTOURPOD',
	'BASE_HYDROPOD',
	'BASE_SHELLWHITE',
	'BASE_WEIRDCUBE',
	'BASE_FLAG',
	'BUILD_REFINER1',
	'COOKER',
	'BP_ANALYSER',
	'AM_SUITTREE',
	'AM_WEAPONTREE',
	'AM_SHIPTREE',
	'AM_EXOCRAFTTREE',
	'S9_SUITTREE',
	'S9_WEAPONTREE',
	'S9_EXOCRAFTTREE',
	'S9_SHIPTREE',
	'S9_BUILDERTREE',
	'BUILDSIGNAL',
	'BUILDBEACON',
	'BUILDSAVE',
	'MESSAGE',
	'BUILDHARVESTER',
	'BUILDGASHARVEST',
	'BUILDSEAHARVEST',
	'WATERBUBBLE',
	'S16_HEATER',
	'U_PARAGON',
	'BASE_HOTPLANT01',
	'BASE_HOTPLANT02',
	'BASE_HOTPLANT03',
	'BASE_RADPLANT01',
	'BASE_RADPLANT02',
	'BASE_RADPLANT03',
	'BASE_TOXPLANT01',
	'BASE_TOXPLANT02',
	'BASE_TOXPLANT03',
	'BASE_DUSTPLANT1',
	'BASE_DUSTPLANT2',
	'BASE_DUSTPLANT3',
	'BASE_COLDPLANT1',
	'BASE_COLDPLANT2',
	'BASE_COLDPLANT3',
	'BASE_HOUDINI1',
	'BASE_HOUDINI2',
	'BASE_HOUDINI3',
	'BASE_SWAMP1',
	'BASE_SWAMP2',
	'BASE_SWAMP3',
	'BASE_INFEST1',
	'BASE_INFEST2',
	'BASE_INFEST3',
	'BASE_ROCK01',
	'BASE_ROCK02',
	'BASE_ROCK03',
	'BASE_LAVA1',
	'BASE_LAVA2',
	'BASE_CAVE1',
	'BASE_CAVE2',
	'BASE_CAVE3',
	'BASE_CAVE4',
	'BASE_CAVE5',
	'BASE_FLOWER1',
	'BASE_FLOWER2',
	'BASE_FLOWER3',
	'BASE_GRASS1',
	'BASE_GRASS2',
	'BASE_GRASS3',
	'BASE_GRASS4',
	'BASE_GRASS5',
	'BASE_GRASS6',
	'BASE_GRASS7',
	'SLIME_MED',
	'SPOOKY_PLANT',
	'BASE_TREE01',
	'BASE_TREE02',
	'BASE_TREE03',
	'BASE_BARNACLE',
	'BASE_WPLANT1',
	'BASE_WPLANT2',
	'BASE_WPLANT3',
	'BASE_WPLANT4',
	'BASE_WPLANT5',
	'BASE_WPLANT6',
	'BASE_MEDPLANT01',
	'BASE_MEDPLANT02',
	'BASE_MEDPLANT03',
	'BASE_FOXGLOVE01',
	'BASE_FLORAL01',
	'BASE_FLORAL04',
	'BASE_FLORAL02',
	'BASE_FLORAL03',
	'BASE_PEACOCK01',
	'BASE_PEACOCK02',
	'BASE_PEACOCK03',
	'BASE_SPRIGBUSH',
	'BASE_FLYINGFERN',
	'BASE_SUBZPLANT1',
	'BASE_SUBZPLANT2',
	'BASE_SUBZPLANT3',
	'BASE_SUBZPLANT4',
	'BASE_SUBZPLANT6',
	'BASE_SUBZPLANT5',
	'BASE_SUBZPLANT7',
	'BASE_SUBZPLANT8',
	'BLD_CRYS_SENT0',
	'BLD_CRYS_SENT1',
	'BLD_CRYS_DRONE',
}

local mod_path	= 'D:/MODZ_stuff/NoMansSky/Published/Manipulate Glitches/_MOD.lMonk.Manipulate Glitches/'

local gc_base = { meta = {name='Objects'} }
for _,id in ipairs(basepart_id) do
	gc_base[#gc_base+1] = {
		meta = {name='Objects', value='GcBaseBuildingEntry', _id=id},
		ID = id,
		DecorationType = {
			meta = {name='DecorationType', value='GcBaseBuildingObjectDecorationTypes'},
			BaseBuildingDecorationType = 'BuildingSurfaceNormal'
		},
		CanRotate3D = true,
		CanScale = true
	}
end

dofile('../LIB/_lua_2_mxml.lua')

local function WriteExmlFile(path, data, template)
	local function PathSplit(p)
		return {p:gsub('/', '\\'):match('^(.-)([^\\/]-)(%.[^.]-)$')}
	end
	os.execute(('if not exist "<>" md "<>"'):gsub('<>', PathSplit(path)[1]))
	local w_src = io.open(path, 'w')
	w_src:write(ToMxmlFile(data, template))
	w_src:close()

	print(('File %s.exml created.'):format(PathSplit(path)[2]))
end

WriteExmlFile(
	mod_path..'METADATA/REALITY/TABLES/BASEBUILDINGOBJECTSTABLE.EXML',
	gc_base,
	'cGcBaseBuildingTable'
)
