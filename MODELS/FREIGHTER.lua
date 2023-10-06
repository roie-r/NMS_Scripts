--------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/scene_tools.lua')
--------------------------------------------------------
mod_desc = [[
  - Full system scan activated from the bridge terminal
  - Hangar & landing pad lights changed to near-white
  - Hangar missing back floor crossing restored
  - Hangar cranes moved to the back
  - Hangar loitering NPC moved or removed
]]------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__MODEL ferighter.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.45',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|freighter hangar|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARINTERIOR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= (
function()
	local T = { {
		SKW		= {},
		REMOVE	= 'Section'
	} }
	for _,node in ipairs({
		{k='NPC_01',			tx=-9.507,	ty=-3.355,	tz=-28.34},
		{k='NPC_02',			tx=-50,		ty=-7.3,	tz=66.5,	ry=120},
		{k='NPC_03',			tx=-8.337,	ty=-3.355,	tz=-28.03},
		{k='NPC_04',			tx=39.3,	ty=-7.75,	tz=65.4,	ry=135},
		{k='NPC_06',			tx=-21.92,	ty=-4.2,	tz=5.5},
		{k='NPC_07',			tx=-57.8,	ty=8.1,		tz=57.14,	ry=270},
		{k='RefHangarCrane2',	tx=41.88,				tz=61.2},
		{k='RefHangarCrane',	tx=-3.43,				tz=59.5},
		{k='RefHangarCrane1',	tx=-41.96,				tz=60.9},
		{k='Container',			tx=-53.5,	ty=-7.4,	tz=67.25,	rx=0,	ry=7,	rz=0,	sx=1.2,	sy=1.14,	sz=1.1},
		{k='RefPallet15',		tx=-51.95,	ty=-7.48,	tz=66.7,	rx=0,	ry=0,	rz=0,	sx=2,	sy=1,		sz=2.6},
		{k='RefPallet30',		tx=7.79,	ty=-5.72,	tz=66.7,	rx=0,	ry=0,	rz=-58.5,sx=2.6,sy=2.4,		sz=2.8},
		{k='RefLargeCrate23',	tx=6.8,		ty=-7.4,	tz=65.5,	rx=0,	ry=180,	rz=0,	sx=1.8,	sy=1.8,		sz=1.8},
		{k='RefLargeCrate28',	tx=6.8,		ty=-7.4,	tz=67.7,	rx=0,	ry=0,	rz=0,	sx=1.8,	sy=1.8,		sz=1.8},
		{k='RefLargeCrate103',	tx=5.25,	ty=-7.33,	tz=67.85,	rx=0,	ry=5,	rz=0,	sx=1,	sy=1,		sz=1},
		{k='RefFuelTank2',		tx=35.53,	ty=-7.34,	tz=72.55,			ry=180},
		{k='pointLight70',					del=true},
		{k='pointLight7501',				del=true},
		{k='REFFreighterHangerMistVFX',		del=true}
	}) do
		if node.del then
			T[1].SKW[#T[1].SKW+1] = {'Name', node.k}
		else
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {'Name', node.k},
				VALUE_CHANGE_TABLE	= {
					{'TransX',	node.tx or 'IGNORE'},
					{'TransY',	node.ty or 'IGNORE'},
					{'TransZ',	node.tz or 'IGNORE'},
					{'RotX',	node.rx or 'IGNORE'},
					{'RotY',	node.ry or 'IGNORE'},
					{'RotZ',	node.rz or 'IGNORE'},
					{'ScaleX',	node.sx or 'IGNORE'},
					{'ScaleY',	node.sy or 'IGNORE'},
					{'ScaleZ',	node.sz or 'IGNORE'}
				}
			}
		end
	end
	T[#T+1] = {
		SPECIAL_KEY_WORDS 	= {
			{'Name', 'lightorange1', 'Name', 'INTENSITY'},
			{'Name', 'pointLight8', 'Name', 'INTENSITY'}
		},
		VALUE_CHANGE_TABLE 	= {
			{'Value',		35000}  -- 20000
		}
	}
	T[#T+1] = {
		SPECIAL_KEY_WORDS 	= {
			{'Name', 'lightorange1', 'Name', 'COL_R'},
			{'Name', 'pointLight8', 'Name', 'COL_R'}
		},
		VALUE_CHANGE_TABLE	= {
			{'Value',		0.3}
		}
	}
	T[#T+1] = {
		SPECIAL_KEY_WORDS 	= {
			{'Name', 'lightorange1', 'Name', 'COL_G'},
			{'Name', 'pointLight8', 'Name', 'COL_G'}
		},
		VALUE_CHANGE_TABLE	= {
			{'Value',		0.5}
		}
	}
	T[#T+1] = {
		SPECIAL_KEY_WORDS 	= {
			{'Name', 'lightorange1', 'Name', 'COL_B'},
			{'Name', 'pointLight8', 'Name', 'COL_B'}
		},
		VALUE_CHANGE_TABLE	= {
			{'Value',		0.6}
		}
	}
	T[#T+1] = {
		PRECEDING_KEY_WORDS = 'Children',
		ADD					= ToExml({
			[1] = ScNode('1RefCrossingB1', 'REFERENCE', {
				ScTransform({tx=-45.35, ty=-7.341775, tz=66.73, ry=180}),
				ScAttributes({
					{'SCENEGRAPH', 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONC.SCENE.MBIN'}
				})
			}),
			[2] = ScNode('1RefCrossingB2', 'REFERENCE', {
				ScTransform({tx=0, ty=-7.341775, tz=66.73}),
				ScAttributes({
					{'SCENEGRAPH', 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONC.SCENE.MBIN'}
				})
			}),
			[3] = ScNode('1RefCrossingB3', 'REFERENCE', {
				ScTransform({tx=45.35, ty=-7.341775, tz=66.73, ry=180}),
				ScAttributes({
					{'SCENEGRAPH', 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARPROPS/HANGARFLOORSECTIONB.SCENE.MBIN'}
				})
			}),
			[4] = ScNode('1RefMonitorShip1', 'REFERENCE', {
				ScTransform({tx=20.2, ty=-4, tz=16.2, rx=0, ry=-42, rz=180, sx=0.55, sy=0.55, sz=0.55}),
				ScAttributes({
					{'SCENEGRAPH', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/ROOFMONITOR/ROOFMONITOR.SCENE.MBIN'}
				})
			}),
			[5] = ScNode('1LocMonitorShip1', 'LOCATOR', {
				ScTransform({tx=20.2, ty=-2.8, tz=16.2}),
				ScAttributes({
					{'ATTACHMENT', 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/ENTITIES/SHIP_SALVAGE.ENTITY.MBIN'}
				}),
				ScChildren({
					ScNode('ColShipSalvage1', 'COLLISION', {
						ScTransform(),
						ScAttributes({
							{'TYPE',	'Sphere'},
							{'RADIUS',	0.2}
						})
					})
				})
			}),
			[6] = ScNode('1RefMonitorShip2', 'REFERENCE', {
				ScTransform({tx=-20.2, ty=-4, tz=16.2, rx=0, ry=42, rz=180, sx=0.55, sy=0.55, sz=0.55}),
				ScAttributes({
					{'SCENEGRAPH', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/ROOFMONITOR/ROOFMONITOR.SCENE.MBIN'}
				})
			}),
			[7] = ScNode('1LocMonitorShip2', 'LOCATOR', {
				ScTransform({tx=-20.2, ty=-2.8, tz=16.2}),
				ScAttributes({
					{'ATTACHMENT', 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/ENTITIES/SHIP_SALVAGE.ENTITY.MBIN'}
				}),
				ScChildren({
					ScNode('ColShipSalvage2', 'COLLISION', {
						ScTransform(),
						ScAttributes({
							{'TYPE',	'Sphere'},
							{'RADIUS',	0.2}
						})
					})
				})
			}),
			[8] = ScNode('1RefScreenContainer', 'REFERENCE', {
				ScTransform({tx=-51.58, ty=-5.4, tz=67.05, ry=-83, rz=180}),
				ScAttributes({
					{'SCENEGRAPH', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PROPS/WALLMONITORS/WALLMONITORA.SCENE.MBIN'}
				})
			}),
			[9] = ScNode('1RefCrateLarge2', 'REFERENCE', {
				ScTransform({tx=4.94, ty=-7.33, tz=65.9, ry=178, sx=1.3, sy=1.3, sz=1.3}),
				ScAttributes({
					{'SCENEGRAPH', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_LARGE.SCENE.MBIN'}
				})
			}),
			---	left stairs light (copied from Relight)
			[10] = ScLight({name='pointLight125d', c='FFFACFA8', tx=-22.6657, ty=5.3848, tz=-15,8617, g=0.851, b=0.745}),
			[11] = ScLight({name='pointLight125e', c='FFFACFA8', tx=-22.6657, ty=2.6848, tz=-10,3617, g=0.851, b=0.745}),
			[12] = ScLight({name='pointLight125f', c='FFFACFA8', tx=-22.6657, ty=0.0, tz=-4,36167, g=0.851, b=0.745}),
			[13] = ScLight({name='pointLight125z', c='FFFACFA8', tx=-16.6657, ty=14.0848, tz=-30,8617}),
			[14] = ScLight({name='pointLight125b', c='FFFACFA8', tx=-22.6657, ty=11.0848, tz=-25,8617, rx=-135, fov=180, g=0.851, b=0.745}),
			[15] = ScLight({name='pointLight125c', c='FFFACFA8', tx=-22.6657, ty=8.0848, tz=-20,8617, g=0.851, b=0.745}),
			---	right stairs light (copied from Relight)
			[16] = ScLight({name='pointLight70d', c='FFFACFA8', tx=22.6657, ty=5.3848, tz=-15,8617, g=0.851, b=0.745}),
			[17] = ScLight({name='pointLight70e', c='FFFACFA8', tx=22.6657, ty=2.6848, tz=-10,3617, g=0.851, b=0.745}),
			[18] = ScLight({name='pointLight70f', c='FFFACFA8', tx=22.6657, ty=0.0, tz=-4,36167, g=0.851, b=0.745}),
			[19] = ScLight({name='pointLight8b', c='FFFACFA8', tx=8.0, ty=12.128, tz=48.882, i=27000, r=0.947, g=0.59, b=0.306}),
			[20] = ScLight({name='pointLight8b', c='FFFACFA8', tx=0.0, ty=12.128, tz=48.882, i=27000, r=0.947, g=0.59, b=0.306}),
			[21] = ScLight({name='pointLight70z', c='FFFACFA8', tx=16.6657, ty=14.0848, tz=-30,8617}),
			[22] = ScLight({name='pointLight70b', c='FFFACFA8', tx=22.6657, ty=11.0848, tz=-25,8617, rx=-135, fov=180, g=0.851, b=0.745}),
			[23] = ScLight({name='pointLight70c', c='FFFACFA8', tx=22.6657, ty=8.0848, tz=-20,8617, g=0.851, b=0.745}),
		})
	}
	return T
end
		)()
	},
	{--	activate |system scan from bridge| terminal
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/BRIDGETERMINAL.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Base'},
				PRECEDING_KEY_WORDS = 'Children',
				ADD 				= ToExml({
					[1] = ScNode(
						'SystemScanner', 'LOCATOR', {
							ScTransform({ty=1.8, sx=0.2, sz=0.2}),
							ScAttributes({
								{'ATTACHMENT', 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/BRIDGETERMINAL.INTERACTION.ENTITY.MBIN'}
							}),
							ScChildren({
								ScNode(
									'SysScanCol', 'COLLISION', {
										ScTransform(),
										ScAttributes({
											{'TYPE',	'Sphere'},
											{'RADIUS',	1}
										})
									}
								)
							})
						}
					)
				})
			}
		}
	},
	{--	|freighter landing pad lights|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/ACCESSORIES/LANDINGPAD_HANGAR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE		= 'All',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'OrangeLights'},
				ADD_OPTION			= 'AddAfterSection',
				ADD 				= ToExml({
					[1] = ScLight({name='left', fov=100, tx=16, ty=10, rx=-22, ry=90, f='l', fr=1.2, c='FFF5F7FA'}),
					[2] = ScLight({name='right', fov=100, tx=-16, ty=10, rx=-22, ry=-90, f='l', fr=1.2, c='FFF5F7FA'}),
					[3] = ScLight({name='ne', i=44000, fov=120, tx=4.8, ty=0.25, tz=4.8, rx=30, ry=45, c='FFF5F7FA'}),
					[4] = ScLight({name='nw', i=44000, fov=120, tx=-4.8, ty=0.25, tz=4.8, rx=30, ry=-45, c='FFF5F7FA'}),
					[5] = ScLight({name='se', i=44000, fov=120, tx=4.8, ty=0.25, tz=-4.8, rx=30, ry=135, c='FFF5F7FA'}),
					[6] = ScLight({name='sw', i=44000, fov=120, tx=-4.8, ty=0.25, tz=-4.8, rx=30, ry=-135, c='FFF5F7FA'})
				})
			}
		}
	},
	{--	|freighter extend buildable| area
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGAR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'BaseBuildingArea'},
				VALUE_CHANGE_TABLE	= {
					{'TransZ',		-28.6235},
					{'ScaleX',		1.3},
					{'ScaleZ',		1.3}
				}

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
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'RefBarrier'},
					{'Name', 'RefBarrier1'},
					{'Name', 'RefBarrier2'}
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
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'RefBarrier'},
					{'Name', 'RefBarrier1'},
					{'Name', 'RefBarrier2'},
					{'Name', 'SUB1HangarFloorSectionA'},
					{'Name', 'SUB2HangarFloorSectionA'},
					{'Name', 'SUB3HangarFloorSectionA'}
				},
				REMOVE				= 'Section'
			}
		}
	}
}}},
	ADD_FILES	= {
		{--	bridge system scanner entity
			FILE_DESTINATION = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/BRIDGETERMINAL.INTERACTION.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping({
				META = {'template','TkAttachmentData'},
				Components = {
					META = {'name','Components'},
					{
						META = {'value','GcSimpleInteractionComponentData.xml'},
						SimpleInteractionType = 'SuperDoopaScanner',
						Size = {
							META	= {'Size','GcSizeIndicator.xml'},
							SizeIndicator	= 'Medium',
						},
						TriggerAction	= 'INACTIVE',
						HideContents	= true,
						Name			= 'UI_SCAN_ROOM_LABEL',
						ScanType		= 'BINOC_INTERACTABLE'
					},
					-- component stub
					value = 'TkPhysicsComponentData.xml'
				}
			})
		},
		{--	hangar ship salvage terminal entity
			FILE_DESTINATION = 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/ENTITIES/SHIP_SALVAGE.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping({
				META = {'template','TkAttachmentData'},
				Components = {
					META = {'name','Components'},
					{
						META = {'value','GcSimpleInteractionComponentData.xml'},
						Name = 'UI_SALVAGE_TITLE'
					},
					{
						META = {'value','GcInteractionComponentData.xml'},
						InteractionAction	= 'PressButton',
						InteractionType		= {
							META = {'InteractionType','GcInteractionType.xml'},
							InteractionType	= 'StoryUtility'
						},
						AttractDistanceSq	= 3,
						InteractAngle		= 360,
						InteractDistance	= 3,
						PuzzleMissionOverrideTable = {
							META = {'name','PuzzleMissionOverrideTable'},
							{
								META = {'value','GcAlienPuzzleMissionOverride.xml'},
								Mission		= 'EXPLORE_LOG', -- must be a valid mission id
								Puzzle		= 'SHIP_SALVAGE'
							}
						}
					},
					{value = 'TkPhysicsComponentData.xml'}
				}
			})
		}
	}
}
