-------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/scene_tools.lua')
-------------------------------------------------------
mod_desc = [[
  - Full system scan activated from the bridge terminal
  - Hangar & landing pad lights changed to near-white
  - Hangar cranes moved to the back
  - Hangar loitering NPC moved or removed
]]-----------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL ferighter changes.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.44',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
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
					[1] = ScLight({name='left', fov=100, tx=16, ty=10, rx=-22, ry=90, f='l', fr=1.2, c='fff5f7fa'}),
					[2] = ScLight({name='right', fov=100, tx=-16, ty=10, rx=-22, ry=-90, f='l', fr=1.2, c='fff5f7fa'}),
					[3] = ScLight({name='ne', i=44000, fov=120, tx=4.8, ty=0.25, tz=4.8, rx=30, ry=45, c='fff5f7fa'}),
					[4] = ScLight({name='nw', i=44000, fov=120, tx=-4.8, ty=0.25, tz=4.8, rx=30, ry=-45, c='fff5f7fa'}),
					[5] = ScLight({name='se', i=44000, fov=120, tx=4.8, ty=0.25, tz=-4.8, rx=30, ry=135, c='fff5f7fa'}),
					[6] = ScLight({name='sw', i=44000, fov=120, tx=-4.8, ty=0.25, tz=-4.8, rx=30, ry=-135, c='fff5f7fa'})
				})
			}
		}
	},
	{--	|freighter hangar|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARINTERIOR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'NPC_01'},	-- middle chatterer 1
				VALUE_CHANGE_TABLE	= {
					{'TransX',		-9.507},
					{'TransY',		-3.355},
					{'TransZ',		-28.34},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'NPC_03'},	-- middle chatterer 3
				VALUE_CHANGE_TABLE	= {
					{'TransX',		-8.337},
					{'TransY',		-3.355},
					{'TransZ',		-28.03},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'NPC_06'},	-- middle loiterer
				VALUE_CHANGE_TABLE	= {
					{'TransX',		-21.92},
					{'TransY',		-4.2},
					{'TransZ',		5.5},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'NPC_07'},	-- left high loiterer
				VALUE_CHANGE_TABLE	= {
					{'TransX',		-57.8},
					{'TransY',		8.1},
					{'TransZ',		57.14},
					{'RotY',		270},
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'NPC_02'},		-- middle lifted
					{'Name', 'NPC_04'},		-- left middle loiterer
				},
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RefHangarCrane2'}, -- right (1)
				VALUE_CHANGE_TABLE	= {
					{'TransX',		41.88},	-- 41.488213
					{'TransZ',		61.2},	-- -16.480017
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RefHangarCrane'}, -- middle (2)
				VALUE_CHANGE_TABLE	= {
					{'TransX',		-3.43},	-- -3.840476
					{'TransZ',		60.7},	-- 50.21371
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'RefHangarCrane1'}, -- left (3)
				VALUE_CHANGE_TABLE	= {
					{'TransX',		-41.96},-- -41.83136
					{'TransZ',		60.9},	-- -3.715493
				}
			},
		---	middle orange lights
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'lightorange1', 'Name', 'INTENSITY'},
					{'Name', 'pointLight8', 'Name', 'INTENSITY'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		35000}  -- 20000
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'lightorange1', 'Name', 'COL_R'},
					{'Name', 'pointLight8', 'Name', 'COL_R'}
				},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.3}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'lightorange1', 'Name', 'COL_G'},
					{'Name', 'pointLight8', 'Name', 'COL_G'}
				},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.5}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'lightorange1', 'Name', 'COL_B'},
					{'Name', 'pointLight8', 'Name', 'COL_B'}
				},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.6}
				}
			},
		---------------- copied from Relight ----------------
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight8'},  -- left stairs light
				REPLACE_TYPE		= 'AddAfterSection',
				ADD					= ToExml({
				---	left stairs light
					[1] = ScLight({name='pointLight125z',tx=-16.6657, ty=14.0848, tz=-30,8617}),
					[2] = ScLight({name='pointLight125b',tx=-22.6657, ty=11.0848, tz=-25,8617, rx=-135, fov=180, g=0.851, b=0.745}),
					[3] = ScLight({name='pointLight125c',tx=-22.6657, ty=8.0848, tz=-20,8617, g=0.851, b=0.745}),
					[4] = ScLight({name='pointLight125d',tx=-22.6657, ty=5.3848, tz=-15,8617, g=0.851, b=0.745}),
					[5] = ScLight({name='pointLight125e',tx=-22.6657, ty=2.6848, tz=-10,3617, g=0.851, b=0.745}),
					[6] = ScLight({name='pointLight125f',tx=-22.6657, ty=0.0, tz=-4,36167, g=0.851, b=0.745}),
				---	right stairs light
					[7] = ScLight({name='pointLight70z',tx=16.6657, ty=14.0848, tz=-30,8617}),
					[8] = ScLight({name='pointLight70b',tx=22.6657, ty=11.0848, tz=-25,8617, rx=-135, fov=180, g=0.851, b=0.745}),
					[9] = ScLight({name='pointLight70c',tx=22.6657, ty=8.0848, tz=-20,8617, g=0.851, b=0.745}),
					[10] = ScLight({name='pointLight70d',tx=22.6657, ty=5.3848, tz=-15,8617, g=0.851, b=0.745}),
					[11] = ScLight({name='pointLight70e',tx=22.6657, ty=2.6848, tz=-10,3617, g=0.851, b=0.745}),
					[12] = ScLight({name='pointLight70f',tx=22.6657, ty=0.0, tz=-4,36167, g=0.851, b=0.745}),
					[13] = ScLight({name='pointLight8b',tx=8.0, ty=12.128, tz=48.882, i=27000, r=0.947, g=0.59, b=0.306}),
					[14] = ScLight({name='pointLight8b',tx=0.0, ty=12.128, tz=48.882, i=27000, r=0.947, g=0.59, b=0.306})
				})
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'pointLight7501'},	-- middle of left stairs
					{'Name', 'pointLight70'},	-- middle of right stairs
				},
				REMOVE				= 'Section'
			}
		}
	}
}}},
	ADD_FILES	= {
		{
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
		}
	}
}
