-----------------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
-----------------------------------------------------------------------------------
local mod_desc = [[
  - Replace wing_k missing LOD sections
  - Display all wing_k decals together
  - Add tail fin to wing_k
  - Shorter overhead tail fin _Acc_A (clips with engines B & D)
  - Narrower _SubWings_D, so it doesn't clip the ground
  - Relocate bobble in cockpit so it doesn't obstruct the map
  - Reduce ship body outer lights, remove volumetric cone
  - Blue-white little glowlights (instead of green)
  - Add trails to wingF turbines
  - Cockpit_F front fin color fix
  - Increase LOD for the various ship parts
  - 1st instead of 2nd color palette for specific parts
  - Enable metallic option on tertiary sections - switch 3rd to 2nd proc-texture
   for specific wings & engine parts.
   * Works if the metal texture is active (determined by seed).
   * Using this method in some parts (cockpit/body mostly) can change how proc-gen
     interperts the seed - might change COATING/PANELS/PAINTED selection.
]]---------------------------------------------------------------------------------

local fighter = {
	ship	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN', skip=true},
	ship_desc =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.DESCRIPTOR.MBIN', skip=true},
	turbine   =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/TURBINEAA.SCENE.MBIN'},
	tail	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/ACCA.SCENE.MBIN'},
	lamp	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/HEADLAMP.SCENE.MBIN', skip=true},
	cockpit_a =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_A/COCKPITA.SCENE.MBIN'},
	cockpit_x =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_A/GOLDCOCKPITA.SCENE.MBIN'},
	cockpit_b =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_B/COCKPITB.SCENE.MBIN'},
	cockpit_g =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_D/COCKPITD.SCENE.MBIN'},
	cockpit_e =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E.SCENE.MBIN'},
	cockpit_f =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_F/COCKPTF.SCENE.MBIN'},
	interior  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPITCOMMON_INTERIOR.SCENE.MBIN', skip=true},
	nose_a	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEA/COCKPITANOSEA.SCENE.MBIN'},
	nose_x	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEA/GOLDCOCKPITANOSEA.SCENE.MBIN'},
	nose_b	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEB/COCKPITANOSEB.SCENE.MBIN'},
	nose_c	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEC/COCKPITANOSEC.SCENE.MBIN'},
	nose_d	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSED/COCKPITANOSED.SCENE.MBIN'},
	nose_e	  = {src='MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEE/COCKPITANOSEE.SCENE.MBIN'},
	engine_b  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_B/ENGINEB.SCENE.MBIN'},
	engine_c  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_C/ENGINEC.SCENE.MBIN'},
	engine_x  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_C/GOLDENGINEC.SCENE.MBIN'},
	engine_d  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_D/ENGINED.SCENE.MBIN'},
	wing_a	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_A/WINGS_A.SCENE.MBIN'},
	wing_x	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_A/GOLDWINGS_A.SCENE.MBIN'},
	wing_b	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_B/WINGSB.SCENE.MBIN'},
	wing_d	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_D/WINGSD.SCENE.MBIN'},
	wing_e	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_E/WINGSE.SCENE.MBIN'},
	wing_f	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_F/WINGS_F.SCENE.MBIN'},
	wing_g	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_G/WINGSG.SCENE.MBIN'},
	wing_h	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_H/WINGSH.SCENE.MBIN'},
	wing_i	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_I/WINGSI.SCENE.MBIN'},
	wing_j	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_J/WINGSJ.SCENE.MBIN'},
	wing_k	  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.SCENE.MBIN'},
	wing_k_d  =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.DESCRIPTOR.MBIN', skip=true},
	s_wing_al =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSALEFT.SCENE.MBIN'},
	s_wing_ar =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSARIGHT.SCENE.MBIN'},
	s_wing_bl =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_B/SUBWINGSBLEFT.SCENE.MBIN'},
	s_wing_br =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_B/SUBWINGSBRIGHT.SCENE.MBIN'},
	s_wing_cl =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_C/SUBWINGSCLEFT.SCENE.MBIN'},
	s_wing_cr =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_C/SUBWINGSCRIGHT.SCENE.MBIN'},
	s_wing_dl =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDLEFT.SCENE.MBIN'},
	s_wing_dr =	{src='MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDRIGHT.SCENE.MBIN'}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ SHIP fighter',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{-- |wingsK missing LOD fix|
		MBIN_FILE_SOURCE	= fighter.wing_k.src,
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
						VALUE_CHANGE_TABLE 	= { {'NameHash', GNH(node_att..1)} }
					}
				end
				return T
			end
		)()
	},
	{--	display all wing_k decals together
		MBIN_FILE_SOURCE	= fighter.wing_k_d.src,
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
	},
	{--	Slightly wider _SubWings_A
		MBIN_FILE_SOURCE	= {
			fighter.wing_b.src,
			fighter.wing_e.src,
			fighter.wing_h.src
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_A'},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ',		0.315},
					{'ScaleZ',		1.265}
				}
			}
		}
	},
	{--	adds trail for Wing_F turbines
		MBIN_FILE_SOURCE	= fighter.wing_f.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Turbine'},
				ADD_OPTION			= 'AddAfterSection',
				ADD					= AddSceneNodes({
					{ name='TrailFL', ntype='LOCATOR', form={4.85,  1.19, -1.1} },
					{ name='TrailFR', ntype='LOCATOR', form={-4.85, 1.19, -1.1} }
				})
			}
		}
	},
	{--	Narower _SubWings_D
		MBIN_FILE_SOURCE	= {
			fighter.wing_f.src,
			fighter.wing_h.src
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_D'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.36},
					{'ScaleY',		0.7},
					{'ScaleZ',		1.06}
				}
			}
		}
	},
	{--	Narower _SubWings_D
		MBIN_FILE_SOURCE	= fighter.wing_b.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_D'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.31},
					{'ScaleX',		0.91},
					{'ScaleY',		0.7},
					{'ScaleZ',		1.06}
				}
			}
		}
	},
	{--	Narower _SubWings_D
		MBIN_FILE_SOURCE	= fighter.wing_e.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_D'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.36},
					{'TransZ',		0.56},
					{'ScaleY',		0.7},
					{'ScaleZ',		1.04}
				}
			}
		}
	},
	{--	|cockpit_A decals fix|
		MBIN_FILE_SOURCE	= fighter.cockpit_a.src,
		MXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS 	= {'Name', '_Number%d?_A%d?'},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ',		-0.02}
				}
			}
		}
	},
	{--	|cockpit_B decals fix|
		MBIN_FILE_SOURCE	= fighter.cockpit_b.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Rectangle_A2'}, -- left side
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0},
					{'TransY',		1.19},
					{'TransZ',		3.8},
					{'RotX', 		0},
					{'RotY', 		90},
					{'RotZ', 		0},
					{'ScaleX', 		1.48},
					{'ScaleY', 		0.68},
					{'ScaleZ', 		1.3}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Number_A2'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0},
					{'RotX', 		0},
					{'RotY', 		90},
					{'RotZ', 		0},
					{'ScaleZ', 		1.6}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', 'Rectangle_A3'},
					{'Name', 'logo_A3'},
					{'Name', 'logo_A4'},
					{'Name', 'Number_A1'},
					{'Name', 'Number_A3'},
					{'Name', 'Number_A4'}
				},
				REMOVE				= 'Section'
			}
		}
	},
	{--	nose C front decal fix
		MBIN_FILE_SOURCE	= fighter.nose_c.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', '_logoR_A'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0},
					{'TransY',		1.47},
					{'TransZ',		8.71},
					{'ScaleX', 		0.36},
					{'ScaleY', 		0.36},
					{'ScaleZ', 		0.9}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', '_logoL_A'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|cockpit_F fixs|
		MBIN_FILE_SOURCE	= fighter.cockpit_f.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'logo_A1'},
					{'Name', 'logo_A2'},
				},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleX',		0.244},	-- 0.3
					{'ScaleY',		0.244},	-- 0.3
					{'TransY', 		1.02},	-- 1.196
					{'TransZ',		6.455},	-- 6.478
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'Letter_A1'},
					{'Name', 'Letter_A3'},
				},
				VALUE_CHANGE_TABLE 	= {
					{'TransX', 		-0.82},	-- -0.843307
					{'TransY', 		1.45},	-- 1.395939
					{'TransZ',		1.88},	-- 1.963748
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'Letter_A2'},
					{'Name', 'Letter_A4'},
				},
				VALUE_CHANGE_TABLE 	= {
					{'TransX', 		0.82},	-- 0.843307
					{'TransY', 		1.45},	-- 1.395939
					{'TransZ',		1.88},	-- 1.963748
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'SUB2BodyLOD[0-3]', 'Name', 'MATERIAL'},
				VALUE_CHANGE_TABLE 	= {
					{'Value', 'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_F/COCKPTF/PRIMARY6.MATERIAL.MBIN'}
				}
			}
		}
	},
	{--	|cockpits no volumetric cone|
		MBIN_FILE_SOURCE	= {
			fighter.cockpit_b.src,
			fighter.cockpit_e.src,
			fighter.cockpit_f.src
		},
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	Shrink and |move bobble| locator in fighter cockpit so it doesn't obstruct the map
		MBIN_FILE_SOURCE	= fighter.interior.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'BobbleHeadLocator'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.1694},	-- 0.088366
					{'TransY',		-0.46504},	-- -0.485839
					{'TransZ',		1.14804},	-- 1.067041
					{'ScaleX',		0.88},
					{'ScaleY',		0.88},
					{'ScaleZ',		0.88}
				}
			}
		}
	},
	{--	|Reduce ship lights|, remove volumetric cone
		MBIN_FILE_SOURCE	= fighter.lamp.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'StandingLight1', 'Name', 'FOV'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		86}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'StandingLight1', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		7.8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'spotLight1'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|fighter ship fixes|
		MBIN_FILE_SOURCE	= fighter.ship.src,
		MXML_CHANGE_TABLE	= {
			{--	shorter tail fin
				SKW					= {'Name', '_Acc_A.-'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleX',		0.88},
					{'ScaleY',		0.68},
					{'ScaleZ',		1.08}
				}
			},
			{--	fighter long wingB short NoseC
				SPECIAL_KEY_WORDS	= {'Name', '_ANose_C'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleZ',		0.94},	-- 1
					{'TransZ',		0.12}	-- 0
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Wings_B'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleZ',		1.1},	-- 1.09
					{'TransZ',		0.2}	-- 0.18
				}
			},
			{--	add tail fin to wing K
				SPECIAL_KEY_WORDS	= {'Name', '_Wings_K'},
				PRECEDING_KEY_WORDS	= 'Children',
				CREATE_HOS			= true,
				ADD 				= AddSceneNodes({
					name	= '_Acc_A7',
					ntype	= 'REFERENCE',
					form	= {ty=2.45, tz=-0.01, sx=0.88, sy=0.68, sz=1.08},
					attr	= {SCENEGRAPH = fighter.tail.src}
				})
			}
		}
	},
	{--	|fighter descriptor wingK tail| addition
		MBIN_FILE_SOURCE	= fighter.ship_desc.src,
		MXML_CHANGE_TABLE	= {
			{--	add tail fin to wing K
				SPECIAL_KEY_WORDS	= {'TypeId', '_WINGS_', 'Children', 'TkModelDescriptorList'},
				SEC_SAVE_TO			= 'model_desc_list'
			},
			{
				SEC_EDIT 			= 'model_desc_list',
				SPECIAL_KEY_WORDS	= {'Id', '_ACC_A'},
				PRECEDING_KEY_WORDS	= 'ReferencePaths',
				REPLACE_TYPE 		= 'OnceInside',
				VALUE_CHANGE_TABLE 	= {
					{'ReferencePaths', fighter.tail.src}
				}
			},
			{
				SEC_EDIT 			= 'model_desc_list',
				SPECIAL_KEY_WORDS	= {'Id', '_ACC_A'},
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'_ACC_A7'},
					{'Name',		'_Acc_A7'},
				}
			},
			{
				SEC_EDIT 			= 'model_desc_list',
				SPECIAL_KEY_WORDS	= {'Id', '_ACC_NONE'},
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'_ACC_NONE7'},
					{'Name',		'_Acc_None7'},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', '_WINGS_K'},
				PRECEDING_KEY_WORDS	= 'Children',
				CREATE_HOS			= true,
				SEC_ADD_NAMED		= 'model_desc_list'
			}

		}
	},
	{--	|2nd instead 3rd - METAL| allow metallic option on tertiary sections
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E/TERTIARY.MATERIAL.MBIN', -- this again
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/ACCA/SUBWINGSC_TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_B/ENGINEB/TERTIARY1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_C/ENGINEC/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_D/ENGINED/TERTIARY1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_A/WINGS_A/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSALEFT/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSARIGHT/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_B/WINGSB/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_E/WINGSE/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_H/WINGSH/SUBWINGSCRIGHT_TERTIARY1.MATERIAL.MBIN',
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMasksMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.MASKS.DDS'}
				}
			}
		}
	},
	{--	|primary paint instead of 2nd|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDLEFT/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDRIGHT/TERTIARY.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK/SUBWINGSCRIGHT_TERTIARY2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK/TERTIARY1.MATERIAL.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gDiffuseMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.DDS'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMasksMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.MASKS.DDS'}
				}
			}
		}
	},
	{--	|fighter parts bluewhite| glow
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_A/COCKPITA/LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_B/COCKPITB/LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_D/COCKPITD/GLOW_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_D/COCKPITD/LIGHTS2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E/GLOW_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E/LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_F/COCKPTF/GLOW_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_F/COCKPTF/LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEA/COCKPITANOSEA/GLOW_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_H/WINGSH/LIGHTS1.MATERIAL.MBIN',
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			0.46},
					{'Y',			0.62},
					{'Z',			0.76}
				}
			}
		}
	},
	{--	|no fake orange light|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E/HQWHITELIGHT_MAT1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_B/COCKPITB/HQWHITELIGHT_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_D/COCKPITD/HQWHITELIGHT_MAT1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEC/COCKPITANOSEC/HQWHITELIGHT_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/FIGHTERS/NOSE/COCKPITA_NOSEE/COCKPITANOSEE/HQWHITELIGHT_MAT1.MATERIAL.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'Section'
			}
		}
	},
	{--	|Fix engine B| jet material flags
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_C/ENGINEC/ENGINEJET_MAT.MATERIAL.MBIN',
				'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_B/PARTS/ENGINEBTHRUSTER/ENGINEJET_MAT.MATERIAL.MBIN',
				'REMOVE'
			}
		}
	},
}},{
	MBIN_CHANGE_TABLE	= (
		function()
			local T = {}
			for _,part in pairs(fighter) do
				if not part.skip then
					T[#T+1] = {
						MBIN_FILE_SOURCE	= part.src,
						MXML_CHANGE_TABLE	= {
							{
								SPECIAL_KEY_WORDS	= {'Name', 'LODDIST1'},
								VALUE_CHANGE_TABLE 	= {
									{'Value',		180}
								}
							},
							{
								SPECIAL_KEY_WORDS	= {'Name', 'LODDIST2'},
								VALUE_CHANGE_TABLE 	= {
									{'Value',		360}
								}
							},
							{
								SPECIAL_KEY_WORDS	= {'Name', 'LODDIST3'},
								VALUE_CHANGE_TABLE 	= {
									{'Value',		480}
								}
							}
						}
					}
				end
			end
			return T
		end
	)()
}}}
