--------------------------------------------------------------------
dofile('LIB/_mxml_2_lua.lua')
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
--------------------------------------------------------------------

local hangar_forms = {
	NPC_01				= {TransX=-9.507,	TransY=-3.35,	TransZ=-28.34},
	NPC_02				= {TransX=-56,		TransY=-7.34,	TransZ=62.5,	RotY=-150},
	NPC_03				= {TransX=-8.337,	TransY=-3.35,	TransZ=-28.03},
	NPC_04				= {TransX=38.4,		TransY=-7.34,	TransZ=69.35,	RotY=35},
	NPC_06				= {TransX=-21.92,	TransY=-4.18,	TransZ=5.5},
	NPC_07				= {TransX=-57.8,	TransY=8.12,	TransZ=57.14,	RotY=270},
	RefHangarCrane2		= {TransX=41.88,					TransZ=61.2},
	RefHangarCrane		= {TransX=-3.43,					TransZ=59.5},
	RefHangarCrane1		= {TransX=-41.96,					TransZ=60.9},
	MonitorDesk			= {TransX=-55.5,	TransY=-7.35,	TransZ=63.2,	RotY=305},
	RefFuelTank2		= {TransX=35.53,	TransY=-7.34,	TransZ=72.55,	RotY=180},
	RefLargeCrate103	= {TransX=-22.65,	TransY=-4.31,	TransZ=17.17,	RotX=180,	ScaleX=4.1},		-- teleoprt entrance gap R
	RefLargeCrate113	= {TransX=22.65,	TransY=-4.315,	TransZ=17.17,	RotX=180,	ScaleX=4.1},		-- teleoprt entrance gap L
	RefLargeCrate10		= {TransX=7,		TransY=-7.35,	TransZ=66.8,	RotX=180,	ScaleX=4.3,	ScaleZ=4.3},-- crossing gap M
	RefLargeCrate6		= {TransX=-52.35,	TransY=-7.35,	TransZ=66.8,	RotX=180,	ScaleX=4.3,	ScaleZ=4.3},-- crossing gap R
	RefPallet30			= {TransX=7.79,		TransY=-5.72,	TransZ=66.7,	RotZ=-58.5,	ScaleX=2.6,	ScaleY=2.4,	ScaleZ=2.8},
	MidCeiling201		= {									TransZ=33.2,				ScaleZ=1.25},
}

local hangar_attrs = {
	lightorange1	= {INTENSITY=35000,	COL_R=0.3,	COL_G=0.5,	COL_B=0.6},
	pointLight8		= {INTENSITY=35000,	COL_R=0.3,	COL_G=0.5,	COL_B=0.6},
}

local hangar_forms_del = {
	'pointLight70',
	'pointLight7501',
	'REFFreight.-MistVFX',
	'REFFreight.-VolumeL.-'
}

local hangar_additions = {
	refs = ScNode({
		{
			name	= '1RefBarrelBaz1',
			ntype	= 'REFERENCE',
			form	= {tx=8.18, ty=-7.02, tz=66.4, rx=270, sx=0.9, sy=1.4, sz=0.9},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/BARREL1.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrossingB1',
			ntype	= 'REFERENCE',
			form	= {tx=-45.35, ty=-7.341775, tz=66.73, ry=180},
			attr	= {
				SCENEGRAPH = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONC.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrossingB2',
			ntype	= 'REFERENCE',
			form	= {tx=0, ty=-7.341775, tz=66.73},
			attr	= {
				SCENEGRAPH = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONC.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrossingB3',
			ntype	= 'REFERENCE',
			form	= {tx=45.35, ty=-7.341775, tz=66.73, ry=180},
			attr	= {
				SCENEGRAPH = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONB.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateMilk01',
			ntype	= 'REFERENCE',
			form	= {tx=5.06, ty=-7.33, tz=65.05, ry=86, sx=2.7, sy=1.8, sz=2.7},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/MILKCRATE.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateHazBig1',
			ntype	= 'REFERENCE',
			form	= {tx=6.74, ty=-7.34, tz=66.5, ry=90, sx=1.7, sy=1.4, sz=1.6},
			attr	= {
				SCENEGRAPH = 'MODELS/SPACE/SPACESTATION/MODULARPARTSTYPEB/DOCK/PROPS/CRATEHAZARDOUS.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateTypeb1',
			ntype	= 'REFERENCE',
			form	= {tx=4.92, ty=-7.33, tz=66.7, ry=3, s_=0.9},
			attr	= {
				SCENEGRAPH = 'MODELS/SPACE/NEXUS/PARTS/PROPS/CRATE.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateTypeb2',
			ntype	= 'REFERENCE',
			form	= {tx=4.95, ty=-7.33, tz=68.2, ry=87, s_=0.9},
			attr	= {
				SCENEGRAPH = 'MODELS/SPACE/NEXUS/PARTS/PROPS/CRATE.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateHazBig2',
			ntype	= 'REFERENCE',
			form	= {tx=-53.3, ty=-6.67, tz=64.1, ry=13, rz=90, sx=0.57, sy=0.9, sz=0.9},
			attr	= {
				SCENEGRAPH = 'MODELS/SPACE/SPACESTATION/MODULARPARTSTYPEB/DOCK/PROPS/CRATEHAZARDOUS.SCENE.MBIN'
			}
		},
		{
			name	= '1RefScreenSilo',
			ntype	= 'REFERENCE',
			form	= {tx=-55.32, ty=-5.82, tz=63.46, ry=35.1, sx=0.36, sy=0.6, sz=0.4},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/WALLMONITORS/WALLMONITORA.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCoveredSilos',
			ntype	= 'REFERENCE',
			form	= {tx=-54, ty=-7.33, tz=66.8, ry=-90, s_=0.75},
			attr	= {
				SCENEGRAPH = 'MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/PIRATES/COVEREDSILOS.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateMould01',
			ntype	= 'REFERENCE',
			form	= {tx=-52.8, ty=-3.65, tz=65.65, rx=10, ry=-85, rz=180, sx=1.4},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/CRATE1.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateMould02',
			ntype	= 'REFERENCE',
			form	= {tx=-52.7, ty=-3.6, tz=67.7, rx=-10, ry=85, rz=175, sx=1.4},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/CRATE1.SCENE.MBIN'
			}
		},
		{
			name	= '1RefBuilderHand',
			ntype	= 'REFERENCE',
			form	= {tx=-39.85, ty=-7.64, tz=-22.3, rx=-2, ry=-65, rz=180, s_=1.4},
			attr	= {
				SCENEGRAPH = 'MODELS/COMMON/ROBOTS/ROBOTHAND.SCENE.MBIN'
			}
		},
		{
			name	= '1RefBuilderHead',
			ntype	= 'REFERENCE',
			form	= {tx=-39.8, ty=-7.64, tz=-21.6, rx=50, ry=160, rz=0, s_=1.1},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BUILDERHEAD.SCENE.MBIN'
			}
		},
		{
			name	= '1RefGeometPlant01',
			ntype	= 'REFERENCE',
			form	= {tx=37, ty=-7.6, tz=68.3, rx=45, ry=180, s_=0.12},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/WEIRD/HEXAGON/MEDGEOMETRIC.SCENE.MBIN'
			}
		},
		{
			name	= '1RefMetalStruct01',
			ntype	= 'REFERENCE',
			form	= {tx=11.8, ty=9.5, tz=22.7, s_=0.3},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/WEIRD/FRACTALCUBE/SHAPE1FLOAT.SCENE.MBIN'
			}
		},
		{
			name	= '1RefWirecell01',
			ntype	= 'REFERENCE',
			form	= {tx=-67, ty=13, tz=-21, rx=45, ry=45, rz=45, s_=0.6},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/WEIRD/WIRECELLS/WCUBE_NONE.SCENE.MBIN'
			}
		}
	}),
	lights = ScLight({
		{name='1HexPltLight',	c='FFEABF88',	tx=37,		ty=-7.6,	tz=68.3, i=4000, v=0.002},
		--	left stairs light (copied from Relight)
		{name='pointLight125d',	c='FFFACFA8',	tx=-22.666,	ty=5.3848,	tz=-15,8617, g=0.851, b=0.745},
		{name='pointLight125e',	c='FFFACFA8',	tx=-22.666,	ty=2.6848,	tz=-10,3617, g=0.851, b=0.745},
		{name='pointLight125f',	c='FFFACFA8',	tx=-22.666,	ty=0.0,		tz=-4,36167, g=0.851, b=0.745},
		{name='pointLight125z',	c='FFFACFA8',	tx=-16.666,	ty=14.0848,	tz=-30,8617},
		{name='pointLight125b',	c='FFFACFA8',	tx=-22.666,	ty=11.0848,	tz=-25,8617, g=0.851, b=0.745, rx=-135, fov=180},
		{name='pointLight125c',	c='FFFACFA8',	tx=-22.666,	ty=8.0848,	tz=-20,8617, g=0.851, b=0.745},
		--	right stairs light (copied from Relight)
		{name='pointLight70d',	c='FFFACFA8',	tx=22.666,	ty=5.3848,	tz=-15,8617, g=0.851, b=0.745},
		{name='pointLight70e',	c='FFFACFA8',	tx=22.666,	ty=2.6848,	tz=-10,3617, g=0.851, b=0.745},
		{name='pointLight70f',	c='FFFACFA8',	tx=22.666,	ty=0.0,		tz=-4,36167, g=0.851, b=0.745},
		{name='pointLight8b',	c='FFFACFA8',	tx=8.0,		ty=12.128,	tz=48.882,   g=0.59,  b=0.306, i=27000, r=0.947},
		{name='pointLight8b',	c='FFFACFA8',	tx=0.0,		ty=12.128,	tz=48.882,   g=0.59,  b=0.306, i=27000, r=0.947},
		{name='pointLight70z',	c='FFFACFA8',	tx=16.666,	ty=14.0848,	tz=-30,8617},
		{name='pointLight70b',	c='FFFACFA8',	tx=22.666,	ty=11.0848,	tz=-25,8617, g=0.851, b=0.745, rx=-135, fov=180},
		{name='pointLight70c',	c='FFFACFA8',	tx=22.666,	ty=8.0848,	tz=-20,8617, g=0.851, b=0.745}
	})
}

local function ProcessScene(exml)
	local hangar_scene = ToLua(exml)
	local scene_nodes = ScNodeNameIndex(hangar_scene)

	for name, forms in pairs(hangar_forms) do
		for prop, val in pairs(forms) do
			scene_nodes[name].Transform[prop] = val
		end
	end

	for name, attrs in pairs(hangar_attrs) do
		for att, val in pairs(attrs) do
			scene_nodes[name].Attributes[att].Value = val
		end
	end

	for _,pattern in ipairs(hangar_forms_del) do
		ScNodeDelete(hangar_scene, pattern)
	end

	for _,adds in pairs(hangar_additions) do
		for _,node in pairs(adds) do
				table.insert(hangar_scene.Children, node)
		end
	end

	return ToMxmlFile(hangar_scene)
end

local hangar_interior = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARINTERIOR.SCENE.MBIN'

ProcessRawMxml = nil
function ProcessRawMxml(the_index)
	local norm_path = NormalizePath(hangar_interior, true)
	return {
		[norm_path]	= ProcessScene(table.concat(the_index.ModdedEXMLs[norm_path]))
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ MODEL ferighter interior',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.24',
	AMUMSS_SUPPRESS_MSG		= 'MULTIPLE_STATEMENTS,MIXED_TABLE',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE 	= {hangar_interior},
		EXT_FUNC		 	= {'ProcessRawMxml'}
	}
}}}}
