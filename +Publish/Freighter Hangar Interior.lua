dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
--------------------------------------------------------------------------------
local mod_desc = [[
  Freighter hangar interior changes and additions.
  - Gantry cranes moved to the back to make them less obtrusive.
  - Restored missing floor sections at the back (with some strategically-placed
   clutter to hide the open floor).
  - Loitering NPCs repositioned.
  - Starship outfitting consoles added near the teleport entrances.

  * DDS files import is skipped SILENTLY if file paths are not found!
]]------------------------------------------------------------------------------
--<<M2L marker>>--

local mx_ct = { {SKW={}, REMOVE='Section'} }
for node, form in pairs({
	NPC_01				= {tx=-9.507,	ty=-3.35,	tz=-28.34},
	NPC_02				= {tx=-56,		ty=-7.34,	tz=62.5,	ry=-150},
	NPC_03				= {tx=-8.337,	ty=-3.35,	tz=-28.03},
	NPC_04				= {tx=38.4,		ty=-7.34,	tz=69.35,	ry=35},
	NPC_06				= {tx=-21.92,	ty=-4.18,	tz=5.5},
	NPC_07				= {tx=-57.8,	ty=8.12,	tz=57.14,	ry=270},
	RefHangarCrane2		= {tx=41.88,				tz=61.2},
	RefHangarCrane		= {tx=-3.43,				tz=59.5},
	RefHangarCrane1		= {tx=-41.96,				tz=60.9},
	MonitorDesk			= {tx=-55.5,	ty=-7.35,	tz=63.2,	ry=305},
	RefFuelTank2		= {tx=35.53,	ty=-7.34,	tz=72.55,	ry=180},
	RefLargeCrate103	= {tx=-22.65,	ty=-4.31,	tz=17.17,	rx=180,		sx=4.1},		-- teleoprt entrance gap R
	RefLargeCrate113	= {tx=22.65,	ty=-4.315,	tz=17.17,	rx=180,		sx=4.1},		-- teleoprt entrance gap L
	RefLargeCrate10		= {tx=7,		ty=-7.35,	tz=66.8,	rx=180,		sx=4.3,	sz=4.3},-- crossing gap M
	RefLargeCrate6		= {tx=-52.35,	ty=-7.35,	tz=66.8,	rx=180,		sx=4.3,	sz=4.3},-- crossing gap R
	RefPallet30			= {tx=7.79,		ty=-5.72,	tz=66.7,	rz=-58.5,	sx=2.6,	sy=2.4,	sz=2.8},
	MidCeiling201		= {							tz=33.2,								sz=1.25},
	RefBiggsTeleporter	= {del=true},
	RefBiggsTeleporter1	= {del=true}
}) do
	if form.del then
		mx_ct[1].SKW[#mx_ct[1].SKW+1] = {'Name', node}
	else
		mx_ct[#mx_ct+1] = {
			SPECIAL_KEY_WORDS	= {'Name', node},
			VALUE_CHANGE_TABLE	= {
				{'TransX',	form.tx or 'IGNORE'},
				{'TransY',	form.ty or 'IGNORE'},
				{'TransZ',	form.tz or 'IGNORE'},
				{'RotX',	form.rx or 'IGNORE'},
				{'RotY',	form.ry or 'IGNORE'},
				{'RotZ',	form.rz or 'IGNORE'},
				{'ScaleX',	form.sx or 'IGNORE'},
				{'ScaleY',	form.sy or 'IGNORE'},
				{'ScaleZ',	form.sz or 'IGNORE'}
			}
		}
	end
end
mx_ct[#mx_ct+1] = {
	PRECEDING_KEY_WORDS = 'Children',
	ADD					= ToMxml( ScNode({
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
			form	= {tx=5.06, ty=-7.33, tz=65.54, ry=86, sx=2.7, sy=1.8, sz=2.7},
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
			form	= {tx=5.06, ty=-7.33, tz=67.1, ry=3, sx=0.9, sy=0.9, sz=0.9},
			attr	= {
				SCENEGRAPH = 'MODELS/SPACE/SPACESTATION/MODULARPARTSTYPEB/DOCK/PROPS/CRATE.SCENE.MBIN'
			}
		},
		{
			name	= '1RefCrateTypeb2',
			ntype	= 'REFERENCE',
			form	= {tx=5.2, ty=-7.33, tz=68.2, ry=87, sx=0.9, sy=0.9, sz=0.9},
			attr	= {
				SCENEGRAPH = 'MODELS/SPACE/SPACESTATION/MODULARPARTSTYPEB/DOCK/PROPS/CRATE.SCENE.MBIN'
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
			form	= {tx=-54, ty=-7.33, tz=66.8, ry=-90, sx=0.75, sy=0.75, sz=0.75},
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
			form	= {tx=-39.85, ty=-7.64, tz=-22.3, rx=-2, ry=-65, rz=180, sx=1.4, sy=1.4, sz=1.4},
			attr	= {
				SCENEGRAPH = 'MODELS/COMMON/ROBOTS/ROBOTHAND.SCENE.MBIN'
			}
		},
		{
			name	= '1RefBuilderHead',
			ntype	= 'REFERENCE',
			form	= {tx=-39.8, ty=-7.64, tz=-21.6, rx=50, ry=160, rz=0, sx=1.1, sy=1.1, sz=1.1},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BUILDERHEAD.SCENE.MBIN'
			}
		},
		{
			name	= '1RefGeometPlant01',
			ntype	= 'REFERENCE',
			form	= {tx=37, ty=-7.72, tz=68.3, ry=-20, rz=20, sx=0.24, sy=0.24, sz=0.24},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/MEDGEO_NONE.SCENE.MBIN'
			}
		},
		{
			name	= '1RefMetalStruct01',
			ntype	= 'REFERENCE',
			form	= {tx=11.8, ty=9.5, tz=22.7, sx=0.3, sy=0.3, sz=0.3},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/WEIRD/FRACTALCUBE/SHAPE1FLOAT.SCENE.MBIN'
			}
		},
		{
			name	= '1RefWirecell01',
			ntype	= 'REFERENCE',
			form	= {tx=-67, ty=14, tz=-18.2, sx=0.6, sy=0.6, sz=0.6},
			attr	= {
				SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/WIRECUBE.SCENE.MBIN'
			}
		}
	}) )
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= 'MOD.lMonk.Freighter Hangar Changes',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.06',
	MOD_DESCRIPTION			= mod_desc,
	AMUMSS_SUPPRESS_MSG		= 'MULTIPLE_STATEMENTS',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARINTERIOR.SCENE.MBIN',
		MXML_CHANGE_TABLE	= mx_ct
	},
	{--	|hangar teleport room| add outfitting and corvette beam
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/TELEPORTER/TELEPORTER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RefWallMonitor'},
				REMOVE				= 'Section'
			},
			{
				PRECEDING_KEY_WORDS = 'Children',
				ADD					= ToMxml( ScNode({
					{--	add ship outfitting
						name	= '1LocShipSalvage',
						ntype	= 'LOCATOR',
						form	= {tx=2.55, ty=1.4, tz=5.4},
						attr	= {
							ATTACHMENT = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/OBJECTSPAWNER/ENTITIES/SHIPSALVAGETERMINAL.ENTITY.MBIN'
						},
						child	= {
							name	= 'ColShipSalvage',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.3
							},
							child	= {
								{
									name	= 'RefMonitorShipSalvage',
									ntype	= 'REFERENCE',
									form	= {ty=-1.1, ry=135, rz=180, sx=0.55, sy=0.55, sz=0.55},
									attr	= {
										SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/ROOFMONITOR/ROOFMONITOR.SCENE.MBIN'
									}
								},
								{
									name	= 'RefBaseShipSalvage',
									ntype	= 'REFERENCE',
									form	= {ty=-1.8, sx=1.3, sy=1.3, sz=1.3},
									attr	= {
										SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/BAZAAR/CANISTER0.SCENE.MBIN'
									}
								}
							}
						}
					},
					{--	corvette beam trigger
						name	= '1LocCorvTeleport',
						ntype	= 'LOCATOR',
						form	= {tx=-1.97, ty=1.38, tz=4.55},
						attr	= {
							ATTACHMENT = 'MODELS/COMMON/SPACECRAFT/BIGGS/BIGGSTELEPORTER_FREIGHTERS/ENTITIES/BIGGSTELEPORTER_FREIGHTERS.ENTITY.MBIN'
						},
						child	= {
							{
								name	= 'ColCorvTeleport',
								ntype	= 'COLLISION',
								form	= {ry=180},
								attr	= {
									TYPE		= 'Sphere',
									RADIUS		= 0.4
								}
							},
							{--	corvette beam button
								name	= 'RefCorvButton',
								ntype	= 'REFERENCE',
								form	= {ry=180, sx=0.77, sy=0.77, sz=0.77},
								attr	= {
									SCENEGRAPH = 'MODELS/COMMON/SPACECRAFT/BIGGS/TELECONTROL.SCENE.MBIN'
								}
							},
							{--	corvette beam button base
								name	= '1RefCorvSign',
								ntype	= 'REFERENCE',
								form	= {tz=-0.06, rx=90, rz=-90, sx=0.7, sy=0.7, sz=0.6},
								attr	= {
									SCENEGRAPH = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/ABANDONED/WARNINGSIGN_1.SCENE.MBIN'
								}
							}
						}
					}
				}) )
			}
		}
	},
	{--	floor section 1
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONA.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONB.SCENE.MBIN'
			}
		}
	},
	{--	floor section 1 - remove parts
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONB.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'RefBarrier'},
					{'Name', 'RefBarrier1'},
					{'Name', 'RefBarrier2'},
				},
				REMOVE				= 'Section'
			}
		}
	},
	{--	floor section 2
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONA.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONC.SCENE.MBIN',
				'REMOVE'
			}
		}
	},
	{--	floor section 2 - remove parts
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONC.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'RefBarrier'},
					{'Name', 'RefBarrier1'},
					{'Name', 'RefBarrier2'},
					{'Name', 'SUB1HangarFloorSectionA'},
					{'Name', 'SUB2HangarFloorSectionA'},
					{'Name', 'SUB3HangarFloorSectionA'},
				},
				REMOVE				= 'Section'
			}
		}
	},
	{--	geometric plant
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/MEDGEOMETRIC.SCENE.MBIN',
				'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/MEDGEO_NONE.SCENE.MBIN',
				'REMOVE'
			}
		}
	},
	{--	inactive geometric plant
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/MEDGEO_NONE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'ATTACHMENT'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	wirecell cube
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/WEIRDCUBE.SCENE.MBIN',
				'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/WIRECUBE.SCENE.MBIN',
				'REMOVE'
			}
		}
	},
	{--	inactive wirecell cube
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/WIRECUBE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'CuboidSmallLOD0', 'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE	= {
					{'value', 'MODELS/PLANETS/BIOMES/WEIRD/FRACTALCUBE/SHAPE1FLOAT/ENTITIES/SHAPE1FLOAT.ENTITY.MBIN'}
				}
			}
		}
	}
}}},
	ADD_FILES	= (
		function()
			local tex_path = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures_mod_source/textures/space/spacestation/PIRATES/'
			if lfs.attributes(tex_path) then
				return {{
					EXTERNAL_FILE_SOURCE = tex_path..'*.DDS',
					FILE_DESTINATION	 = 'TEXTURES/SPACE/SPACESTATION/PIRATES/*.DDS'
				}}
			end
			return nil
		end
	)()
}
