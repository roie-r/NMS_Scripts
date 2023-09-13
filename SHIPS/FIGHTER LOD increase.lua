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
	NMS_VERSION			= '4.44',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {
	{
		MBIN_CHANGE_TABLE	= (
			function()
				T = {}
				for _,scn in ipairs({
					{src='ACCESSORIES/ACCA.SCENE.MBIN',              		add=true},
					{src='ACCESSORIES/TURBINEAA.SCENE.MBIN',         		add=true},
					{src='COCKPIT/COCKPIT_B/COCKPITB.SCENE.MBIN',    		add=true},
					{src='COCKPIT/COCKPIT_A/COCKPITA.SCENE.MBIN',    		add=true},
					{src='COCKPIT/COCKPIT_A/GOLDCOCKPITA.SCENE.MBIN',		add=true},
					{src='COCKPIT/COCKPIT_D/COCKPITD.SCENE.MBIN',    		add=true},
					{src='COCKPIT/COCKPIT_E/COCKPIT_E.SCENE.MBIN',   		add=true},
					{src='COCKPIT/COCKPIT_F/COCKPTF.SCENE.MBIN',     		add=true},
					{src='NOSE/COCKPITA_NOSEA/COCKPITANOSEA.SCENE.MBIN'},
					{src='NOSE/COCKPITA_NOSEA/GOLDCOCKPITANOSEA.SCENE.MBIN'},
					{src='NOSE/COCKPITA_NOSEB/COCKPITANOSEB.SCENE.MBIN'},
					{src='NOSE/COCKPITA_NOSEC/COCKPITANOSEC.SCENE.MBIN'},
					{src='NOSE/COCKPITA_NOSED/COCKPITANOSED.SCENE.MBIN'},
					{src='NOSE/COCKPITA_NOSEE/COCKPITANOSEE.SCENE.MBIN'},
					{src='ENGINE/ENGINE_B/ENGINEB.SCENE.MBIN',    			add=true},
					{src='ENGINE/ENGINE_C/ENGINEC.SCENE.MBIN',    			add=true},
					{src='ENGINE/ENGINE_C/GOLDENGINEC.SCENE.MBIN',			add=true},
					{src='ENGINE/ENGINE_D/ENGINED.SCENE.MBIN',    			add=true},
					{src='WINGS/WINGS_A/WINGS_A.SCENE.MBIN',      			add=true},
					{src='WINGS/WINGS_A/GOLDWINGS_A.SCENE.MBIN',  			add=true},
					{src='WINGS/WINGS_B/WINGSB.SCENE.MBIN',       			add=true},
					{src='WINGS/WINGS_D/WINGSD.SCENE.MBIN',       			add=true},
					{src='WINGS/WINGS_E/WINGSE.SCENE.MBIN',       			add=true},
					{src='WINGS/WINGS_G/WINGSG.SCENE.MBIN'},
					{src='WINGS/WINGS_H/WINGSH.SCENE.MBIN'},
					{src='WINGS/WINGS_I/WINGSI.SCENE.MBIN'},
					{src='WINGS/WINGS_J/WINGSJ.SCENE.MBIN',              	add=true},
					{src='SUBWINGS/SUBWINGS_A/SUBWINGSALEFT.SCENE.MBIN', 	add=true},
					{src='SUBWINGS/SUBWINGS_A/SUBWINGSARIGHT.SCENE.MBIN',	add=true},
					{src='SUBWINGS/SUBWINGS_B/SUBWINGSBLEFT.SCENE.MBIN', 	add=true},
					{src='SUBWINGS/SUBWINGS_B/SUBWINGSBRIGHT.SCENE.MBIN',	add=true},
					{src='SUBWINGS/SUBWINGS_C/SUBWINGSCLEFT.SCENE.MBIN', 	add=true},
					{src='SUBWINGS/SUBWINGS_C/SUBWINGSCRIGHT.SCENE.MBIN',	add=true},
					{src='SUBWINGS/SUBWINGS_D/SUBWINGSDLEFT.SCENE.MBIN', 	add=true},
					{src='SUBWINGS/SUBWINGS_D/SUBWINGSDRIGHT.SCENE.MBIN', 	add=true}
				}) do
					inx = #T+1
					T[inx] = {
						MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/'..scn.src,
						EXML_CHANGE_TABLE	= {
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
					}
					if scn.add then
						T[inx].EXML_CHANGE_TABLE[#T[inx].EXML_CHANGE_TABLE+1] = {
							SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
							ADD_OPTION			= 'AddAfterSection',
							ADD 				= ToExml({
								META	= {'value', 'TkSceneNodeAttributeData.xml'},
								Name	= 'ATTACHMENT',
								Value	= 'MODELS/COMMON/SPACECRAFT/SHARED/ENTITIES/SHAREDLODDISTANCES.ENTITY.MBIN'
							})
						}
					end
				end
				return T
			end
		)()
	}
}}
