---@diagnostic disable: param-type-mismatch
--------------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
--------------------------------------------------------------------------------
mod_desc = [[
  Increase LOD for all fighter parts - making figther LOD equal to other ships.
  Deletes the in-scene LODDIST attributes and attaches a LodDistances entity to
  the main LOD0 node/s of the model.
  * Needs to be merged with other fighter script(!)
]]------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__SHIP fighter LOD increase.pak',
	MOD_AUTHOR			= 'lMonk',
	MOD_BATCHNAME		= '__SHIP fighter merged.pak',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'UNUSED_VARIABLE',
	MODIFICATIONS 		= {
	{
		MBIN_CHANGE_TABLE	= (
			function()
				main_lod_nodes = {
					{ mbin='ACCESSORIES/ACCA.SCENE.MBIN',					scn={'AccALOD0'} },
					{ mbin='ACCESSORIES/TURBINEAA.SCENE.MBIN',				scn={'Wings5LOD0'} },
					{ mbin='COCKPIT/COCKPIT_B/COCKPITB.SCENE.MBIN',			scn={'CockpitBLOD0'} },
					{ mbin='COCKPIT/COCKPIT_A/COCKPITA.SCENE.MBIN',			scn={'BodyLOD0'} },
					{ mbin='COCKPIT/COCKPIT_A/GOLDCOCKPITA.SCENE.MBIN',		scn={'BodyLOD0'} },
					{ mbin='COCKPIT/COCKPIT_D/COCKPITD.SCENE.MBIN',			scn={'BodyLOD0'} },
					{ mbin='COCKPIT/COCKPIT_E/COCKPIT_E.SCENE.MBIN',		scn={'BodyLOD0'} },
					{ mbin='COCKPIT/COCKPIT_F/COCKPTF.SCENE.MBIN',			scn={'BodyLOD0'} },
					{ mbin='NOSE/COCKPITA_NOSEA/COCKPITANOSEA.SCENE.MBIN'},
					{ mbin='NOSE/COCKPITA_NOSEA/GOLDCOCKPITANOSEA.SCENE.MBIN'},
					{ mbin='NOSE/COCKPITA_NOSEB/COCKPITANOSEB.SCENE.MBIN'},
					{ mbin='NOSE/COCKPITA_NOSEC/COCKPITANOSEC.SCENE.MBIN'},
					{ mbin='NOSE/COCKPITA_NOSED/COCKPITANOSED.SCENE.MBIN'},
					{ mbin='NOSE/COCKPITA_NOSEE/COCKPITANOSEE.SCENE.MBIN'},
					{ mbin='ENGINE/ENGINE_B/ENGINEB.SCENE.MBIN',			scn={'EngineBLOD0'} },
					{ mbin='ENGINE/ENGINE_C/ENGINEC.SCENE.MBIN',			scn={'EngineCLOD0'} },
					{ mbin='ENGINE/ENGINE_C/GOLDENGINEC.SCENE.MBIN',		scn={'EngineCLOD0'} },
					{ mbin='ENGINE/ENGINE_D/ENGINED.SCENE.MBIN',			scn={'EngineD1LOD0'} },
					{ mbin='WINGS/WINGS_A/WINGS_A.SCENE.MBIN',				scn={'WingsALOD0'} },
					{ mbin='WINGS/WINGS_A/GOLDWINGS_A.SCENE.MBIN',			scn={'WingsALOD0'} },
					{ mbin='WINGS/WINGS_B/WINGSB.SCENE.MBIN',				scn={'WingsLOD0','WingsBLOD0'} },
					{ mbin='WINGS/WINGS_D/WINGSD.SCENE.MBIN',				scn={'WingsDLOD0'} },
					{ mbin='WINGS/WINGS_E/WINGSE.SCENE.MBIN',				scn={'WingELOD0', 'WingE2LOD0'} },
					{ mbin='WINGS/WINGS_G/WINGSG.SCENE.MBIN'},
					{ mbin='WINGS/WINGS_H/WINGSH.SCENE.MBIN'},
					{ mbin='WINGS/WINGS_I/WINGSI.SCENE.MBIN'},
					{ mbin='WINGS/WINGS_J/WINGSJ.SCENE.MBIN',				scn={'_WingsJ_FullLOD0', '_WingsJ_LowLOD0', '_WingsJ_MidLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_A/SUBWINGSALEFT.SCENE.MBIN',	scn={'SubWingsALeftLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_A/SUBWINGSARIGHT.SCENE.MBIN',	scn={'SubWingsARightLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_B/SUBWINGSBLEFT.SCENE.MBIN',	scn={'SubWingsBLeftLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_B/SUBWINGSBRIGHT.SCENE.MBIN',	scn={'SubWingsBRightLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_C/SUBWINGSCLEFT.SCENE.MBIN',	scn={'SubWingsCLeftLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_C/SUBWINGSCRIGHT.SCENE.MBIN',	scn={'SubWingsCRightLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_D/SUBWINGSDLEFT.SCENE.MBIN',	scn={'SubWingDLeftLOD0'} },
					{ mbin='SUBWINGS/SUBWINGS_D/SUBWINGSDRIGHT.SCENE.MBIN',	scn={'SubWingDRightLOD0'} },
				}
				T = {}
				for _,src in ipairs(main_lod_nodes) do
					tmp = {}
					tmp.MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/'..src.mbin
					tmp.EXML_CHANGE_TABLE	= {
						{
							SPECIAL_KEY_WORDS 	= {
								{'Name', 'LODDIST1'},
								{'Name', 'LODDIST2'},
								{'Name', 'LODDIST3'},
							},
							REMOVE = 'Section'
						},
						{
							SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
							VALUE_CHANGE_TABLE 	= { {'Value', 5} }
						}
					}
					if src.scn then
						for _,nm in ipairs(src.scn) do
							table.insert(tmp.EXML_CHANGE_TABLE, {
								SPECIAL_KEY_WORDS	= {'Name', nm},
								PRECEDING_KEY_WORDS	= 'Attributes',
								SECTION_ACTIVE		= 1,
								ADD 				= ToExml({
									META	= {'value', 'TkSceneNodeAttributeData.xml'},
									Name	= 'ATTACHMENT',
									Value	= 'MODELS/COMMON/SPACECRAFT/SHARED/ENTITIES/SHAREDLODDISTANCES.ENTITY.MBIN'
								})
							})
						end
					end
					T[#T+1] = tmp
				end
				return T
			end
		)()
	}
}}
