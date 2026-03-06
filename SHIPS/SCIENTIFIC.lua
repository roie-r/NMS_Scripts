---------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
---------------------------------------------------
local mod_desc = [[
  cockpitA re-center trails.
  cockpitA move guns below body to match interior
  cockpitD guns placed on body (instead of joint)
  Decals placement tweaks.
  No foggy headlights cone on cockpits
  lod fixes
]]-------------------------------------------------

local science = {
	canopy_a  =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/CANOPY/CANOPYA/CANOPYA.SCENE.MBIN'},
	canopy_b  =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/CANOPY/CANOPYB/CANOPYB.SCENE.MBIN'},
	interior  =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/INTERIORS/CANOPYA_INTERIOR.SCENE.MBIN',      		skip=true},
	lamp	  =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/ACCESSORIES/LAMP.SCENE.MBIN',						skip=true},
	cockpit_a =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/COCKPITA.SCENE.MBIN'},
	cockbck_a =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/BACK/COCKPITABACKB.SCENE.MBIN'},
	cockpit_b =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITB/COCKPITB.SCENE.MBIN',			skip=true},
	cockpit_c =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITC/COCKPITC.SCENE.MBIN'},
	cockpit_d =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITD/COCKPITD.SCENE.MBIN'},
	wing_al   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSA/WINGSA_LEFT.SCENE.MBIN'},
	wing_ar   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSA/WINGSA_RIGHT.SCENE.MBIN'},
	wing_bl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSB/WINGSBLEFT.SCENE.MBIN'},
	wing_br   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSB/WINGSBRIGHT.SCENE.MBIN'},
	wing_cl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSC/WINGCLEFT.SCENE.MBIN'},
	wing_cr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSC/WINGCRIGHT.SCENE.MBIN'},
	wing_dl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSD/WINGDLEFT.SCENE.MBIN'},
	wing_dr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSD/WINGDRIGHT.SCENE.MBIN'},
	wing_el   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSE/WINGELEFT.SCENE.MBIN'},
	wing_er   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSE/WINGERIGHT.SCENE.MBIN'},
	wing_fl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSF/WINGFLEFT.SCENE.MBIN'},
	wing_fr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSF/WINGFRIGHT.SCENE.MBIN'},
	wing_gl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSG/WINGGLEFT.SCENE.MBIN'},
	wing_gr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSG/WINGGRIGHT.SCENE.MBIN'},
	wing_hl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSH/WINGHLEFT.SCENE.MBIN'},
	wing_hr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSH/WINGHRIGHT.SCENE.MBIN'},
	wing_il   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGILEFT.SCENE.MBIN'},
	wing_ir   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGIRIGHT.SCENE.MBIN'},
	wing_jl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSJ/WINGJLEFT.SCENE.MBIN',				skip=true},
	wing_jr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSJ/WINGJRIGHT.SCENE.MBIN',				skip=true},
	wing_kl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSK/WINGKLEFT.SCENE.MBIN'},
	wing_kr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSK/WINGKRIGHT.SCENE.MBIN'},
	wing_ll   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSL/WINGSL_LEFT.SCENE.MBIN'},
	wing_lr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSL/WINGSL_RIGHT.SCENE.MBIN'},
	wing_ml   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSM/WINGSM_L.SCENE.MBIN'},
	wing_mr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSM/WINGSM_R.SCENE.MBIN'},
	wing_tl   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGTOPJOINT/WINGTOPJOINT_LEFT.SCENE.MBIN'},
	wing_tr   =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGTOPJOINT/WINGTOPJOINT_RIGHT.SCENE.MBIN'},
	s_wing_al =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSA/SUBWINGSA_LEFT.SCENE.MBIN'},
	s_wing_ar =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSA/SUBWINGSA_RIGHT.SCENE.MBIN'},
	s_wing_bl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSB/SUBWINGSB_LEFT.SCENE.MBIN',	skip=true},
	s_wing_br =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSB/SUBWINGSB_RIGHT.SCENE.MBIN',	skip=true},
	s_wing_cl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSC/SUBWINGSC_LEFT.SCENE.MBIN',	skip=true},
	s_wing_cr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSC/SUBWINGSC_RIGHT.SCENE.MBIN',	skip=true},
	s_wing_dl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSD/SUBWINGSD_LEFT.SCENE.MBIN',	skip=true},
	s_wing_dr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSD/SUBWINGSD_RIGHT.SCENE.MBIN',	skip=true},
	s_wing_el =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSE/SUBWINGE_L.SCENE.MBIN'},
	s_wing_er =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSE/SUBWINGE_R.SCENE.MBIN'},
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ SHIP scientific',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|sci interior light|
		MBIN_FILE_SOURCE	= science.interior.src,
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= AddLightNodes({name='Light08', i=7, rd=2, ty=-0.6, tz=1.5, c='FF98A6F2'})
			}
		}
	},
	{--	|wingA_L add trail|
		MBIN_FILE_SOURCE	= science.wing_al.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'WingALeft'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= AddSceneNodes({name='Trail', ntype='LOCATOR', form={8.55, 0, -0.458, 0, 180}})
			}
		}
	},
	{--	|wingA_R add trail|
		MBIN_FILE_SOURCE	= science.wing_ar.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'WingALeft'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= AddSceneNodes({name='Trail', ntype='LOCATOR', form={-8.55, 0, -0.4, 0, 180}})
			}
		}
	},
	{--	|Scientific cockpitD re-alignments|
		MBIN_FILE_SOURCE	= science.cockpit_d.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref[34]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-0.9},
					{'TransY',		2.5},
					{'TransZ',		-0.6},
					{'RotZ',		-90},
					{'ScaleX', 		0.8},
					{'ScaleY', 		0.8},
					{'ScaleZ', 		0.8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref4'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.9},
					{'RotZ',		90}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'Trail.-'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		1.8692},	-- 2.069246
					{'TransZ',		-2.019},	-- -2.51901
					{'RotX',		0}			-- 30.782648
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', '_Number_A1'},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-38.173},
					{'RotY',		0}
				}
			}
		}
	},
	{--	|Scientific cockpitA alignments|
		MBIN_FILE_SOURCE	= science.cockpit_a.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref[12]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-0.32},
					{'TransY',		0.952},
					{'TransZ',		-0.48},
					{'RotZ',		-18},
					{'ScaleX', 		0.7},
					{'ScaleY', 		0.7},
					{'ScaleZ', 		0.7}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun1Ref2'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.32},
					{'RotZ',		18}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Trail'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		1.055},
					{'TransY',		1.5},
					{'RotX',		0}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Trail1'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-1.055},
					{'TransY',		1.5},
					{'RotX',		0}
				}
			},
		}
	},
	{--	|Scientific cockpitA back decals| fix
		MBIN_FILE_SOURCE	= science.cockbck_a.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', '_logo[12]_A'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		3.26},	-- 2.65596
					{'TransZ',		-4.72},	-- -3.72796
				}
			}
		}
	},
	{--	|Scientific subwing_E logo| fix
		MBIN_FILE_SOURCE	= {
			science.s_wing_el.src,
			science.s_wing_er.src,
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo_A1'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleZ', 		0.6}
				}
			}
		}
	},
	{-- |wing_I decals| fix
		MBIN_FILE_SOURCE	= science.wing_il.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo[12]_A[12]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		1.1},
					{'RotX',		90},
					{'RotY',		90},
					{'ScaleX', 		0.56},
					{'ScaleY', 		0.56}
				}
			}
		}
	},
	{-- |wing_I decals| fix
		MBIN_FILE_SOURCE	= science.wing_ir.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '_logo[12]_A[12]'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		-1.1},
					{'RotX',		-90},
					{'RotY',		90},
					{'ScaleX', 		0.56},
					{'ScaleY', 		0.56}
				}
			}
		}
	},
	{--	|no foggy headlights| cone from cockpits
		MBIN_FILE_SOURCE	= science.lamp.src,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|glow parts bluewhite| glow
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGILEFT/SUBMARINEPRES_LIGHTS_TEST3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGIRIGHT/SUBMARINEPRES2_LIGHTS_TEST3.MATERIAL.MBIN',

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
	}
}},{
	MBIN_CHANGE_TABLE	= (
		function()
			local T = {}
			for _,part in pairs(science) do
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
