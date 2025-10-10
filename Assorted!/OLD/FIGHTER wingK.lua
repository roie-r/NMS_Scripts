----------------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
----------------------------------------------------------------------------------
local mod_desc = [[
  Fixes fighter's wingsK missing LOD sections and increases it to to 4 LOD stages
  Fixes the "unusual" decals descriptor choices so all decals show together
]]--------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ SHIP fighter wingK fixes',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '5.5+',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.SCENE.MBIN',
		MXML_CHANGE_TABLE	= (
			function()
				local T = {}
				for _,node_att in ipairs({'WingsK_ALOD', 'SUB1WingsK_ALOD', 'SUB3WingsK_ALOD'}) do
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'Name', node_att..0},
						PRECEDING_KEY_WORDS = 'Attributes',
						REMOVE				= 'Section'
					}
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'Name', node_att..1},
						PRECEDING_KEY_WORDS = 'Attributes',
						SEC_SAVE_TO			= 'scene_node_attributes'
					}
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'Name', node_att..0},
						SEC_ADD_NAMED		= 'scene_node_attributes'
					}
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'Name', node_att..0, 'Name', 'LODLEVEL'},
						VALUE_CHANGE_TABLE 	= { {'Value', 0} }
					}
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'Name', node_att..0},
						VALUE_MATCH			= node_att..0,
						VALUE_CHANGE_TABLE 	= { {'Name', node_att..1} }
					}
				end
				T[#T+1] = {
					SPECIAL_KEY_WORDS 	= {'Name', 'LODDIST[1-3]'},
					REMOVE				= 'Section'
				}
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
					VALUE_CHANGE_TABLE 	= { {'Value', 4} }
				}
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
					ADD_OPTION			= 'AddAfterSection',
					ADD 				= ToMxml({
						meta	= {name='Attributes', value='TkSceneNodeAttributeData'},
						Name	= 'ATTACHMENT',
						Value	= 'MODELS/COMMON/SPACECRAFT/SHARED/ENTITIES/SHAREDLODDISTANCES.ENTITY.MBIN'
					})
				}
				return T
			end
		)()
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.DESCRIPTOR.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Id', '_RECTANGLERIGHT_ALOD1'},
					{'Id', '_LOGORIGHT_ALOD1'},
					{'Id', '_LETTERRIGHT_ALOD1'}
				},
				REMOVE = 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', '_WINGSK_A'},
				PRECEDING_KEY_WORDS = {'TkModelDescriptorList', 'List'},
				ADD				 	= (
					function()
						local T = {}
						for id, name in pairs({
							_RECTANGLELEFT	= '_RectangleRight_ALOD1',
							_LOGOLEFT_		= '_logoRight_ALOD1',
							_LETTERLEFT_	= '_LetterRight_ALOD1',
						}) do
							T[#T+1] = {
								meta	= {name='List', value='TkResourceDescriptorList'},
								TypeId	= id,
								Desc	= {
									meta	= {name='Descriptors'},
									Rsc		= {
										meta = {name='Descriptors', value='TkResourceDescriptorData'},
										Id	 = name:upper(),
										Name = name
									}
								}
							}
						end
						return ToMxml(T)
					end
				)()
			}
		}
	}
}}}}
