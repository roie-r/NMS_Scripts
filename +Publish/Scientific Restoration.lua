dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
-------------------------------------------------------------------------------------
local mod_desc = [[
  cockpitA re-center trails
  cockpit_A back & tail fins decals fix
  cockpitA move guns below body to match interior
  cockpitD guns placed on body (instead of joint)
  Decals placement tweaks.
  lod fixes
]]-----------------------------------------------------------------------------------
--<<M2L marker>>--

local science = {
	interior =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/INTERIORS/CANOPYA_INTERIOR.SCENE.MBIN',      		skip=true},
	lamp =		{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/ACCESSORIES/LAMP.SCENE.MBIN',						skip=true},
	cockpit_a =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/COCKPITA.SCENE.MBIN',			add=true},
	cockbck_a =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITA/BACK/COCKPITABACKB.SCENE.MBIN',	add=true},
	cockpit_b =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITB/COCKPITB.SCENE.MBIN',    		add=true,	lod1=true},
	cockpit_c =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITC/COCKPITC.SCENE.MBIN',    		add=true},
	cockpit_d =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/COCKPIT/COCKPITD/COCKPITD.SCENE.MBIN',    		add=true},
	wing_al	=	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSA/WINGSA_LEFT.SCENE.MBIN',      		add=true},
	wing_ar =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSA/WINGSA_RIGHT.SCENE.MBIN',      		add=true},
	wing_bl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSB/WINGSBLEFT.SCENE.MBIN',      		add=true},
	wing_br =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSB/WINGSBRIGHT.SCENE.MBIN',      		add=true},
	wing_cl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSC/WINGCLEFT.SCENE.MBIN',      			add=true},
	wing_cr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSC/WINGCRIGHT.SCENE.MBIN',      		add=true},
	wing_dl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSD/WINGDLEFT.SCENE.MBIN',      			add=true},
	wing_dr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSD/WINGDRIGHT.SCENE.MBIN',      		add=true},
	wing_el =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSE/WINGELEFT.SCENE.MBIN',      			add=true},
	wing_er =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSE/WINGERIGHT.SCENE.MBIN',      		add=true},
	wing_fl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSF/WINGFLEFT.SCENE.MBIN',      			add=true},
	wing_fr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSF/WINGFRIGHT.SCENE.MBIN',      		add=true},
	wing_gl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSG/WINGGLEFT.SCENE.MBIN',      			add=true},
	wing_gr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSG/WINGGRIGHT.SCENE.MBIN',      		add=true},
	wing_hl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSH/WINGHLEFT.SCENE.MBIN',      			add=true},
	wing_hr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSH/WINGHRIGHT.SCENE.MBIN',      		add=true},
	wing_il =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGILEFT.SCENE.MBIN',  				add=true},
	wing_ir =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSI/WINGIRIGHT.SCENE.MBIN',  			add=true},
	wing_jl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSJ/WINGJLEFT.SCENE.MBIN',  				add=true,	lod1=true},
	wing_jr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSJ/WINGJRIGHT.SCENE.MBIN',  			add=true,	lod1=true},
	wing_kl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSK/WINGKLEFT.SCENE.MBIN',  				add=true},
	wing_kr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSK/WINGKRIGHT.SCENE.MBIN',  			add=true},
	wing_ll =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSL/WINGSL_LEFT.SCENE.MBIN',  			add=true},
	wing_lr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSL/WINGSL_RIGHT.SCENE.MBIN',  			add=true},
	wing_ml =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSM/WINGSM_L.SCENE.MBIN',  				add=true},
	wing_mr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGSM/WINGSM_R.SCENE.MBIN',  				add=true},
	wing_tl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGTOPJOINT/WINGTOPJOINT_LEFT.SCENE.MBIN',	add=true},
	wing_tr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/WINGS/WINGTOPJOINT/WINGTOPJOINT_RIGHT.SCENE.MBIN',add=true},
	s_wing_al =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSA/SUBWINGSA_LEFT.SCENE.MBIN', 	add=true},
	s_wing_ar =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSA/SUBWINGSA_RIGHT.SCENE.MBIN', 	add=true},
	s_wing_bl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSB/SUBWINGSB_LEFT.SCENE.MBIN', 	add=true,	lod1=true},
	s_wing_br =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSB/SUBWINGSB_RIGHT.SCENE.MBIN', 	add=true,	lod1=true},
	s_wing_cl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSC/SUBWINGSC_LEFT.SCENE.MBIN', 	add=true,	lod1=true},
	s_wing_cr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSC/SUBWINGSC_RIGHT.SCENE.MBIN', 	add=true,	lod1=true},
	s_wing_dl =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSD/SUBWINGSD_LEFT.SCENE.MBIN', 	add=true,	lod1=true},
	s_wing_dr =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSD/SUBWINGSD_RIGHT.SCENE.MBIN', 	add=true,	lod1=true},
	s_wing_el =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSE/SUBWINGE_L.SCENE.MBIN', 		add=true},
	s_wing_er =	{src='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SUBWINGS/SUBWINGSE/SUBWINGE_R.SCENE.MBIN', 		add=true},
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= 'MOD.lMonk.Scientific Restoration',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.06',
	AMUMSS_SUPPRESS_MSG		= 'MULTIPLE_STATEMENTS',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|sci interior light|
		MBIN_FILE_SOURCE	= science.interior.src,
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= ToMxml(ScLight({name='Light08', i=7000, ty=-0.6, tz=1.5, c='FF98A6F2'}))
			}
		}
	},
	{--	|wingA_L add trail|
		MBIN_FILE_SOURCE	= science.wing_al.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'WingALeft'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= ToMxml(ScNode({name='Trail', ntype='LOCATOR', form={8.55, 0, -0.458, 0, 180}}))
			}
		}
	},
	{--	|wingA_R add trail|
		MBIN_FILE_SOURCE	= science.wing_ar.src,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'WingALeft'},
				PRECEDING_KEY_WORDS	= 'Children',
				ADD					= ToMxml(ScNode({name='Trail', ntype='LOCATOR', form={-8.55, 0, -0.4, 0, 180}}))
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
			}
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
	}
}},
	{
		MBIN_CHANGE_TABLE = (
			function()
				T = {}
				for _,part in pairs(science) do
					if not part.skip then
						local inx = #T+1
						T[inx] = {
							MBIN_FILE_SOURCE	= part.src,
							MXML_CHANGE_TABLE	= {
								{
									SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
									VALUE_CHANGE_TABLE 	= {
										{'Value',		4}
									}
								}
							}
						}
						local mct = T[inx].MXML_CHANGE_TABLE
						if not part.lod1 then
							mct[#mct+1] = {
								SPECIAL_KEY_WORDS 	= {'Name', 'LODDIST[1-3]'},
								REMOVE				= 'Section'
							}
						end
						if part.add then
							mct[#mct+1] = {
								SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
								ADD_OPTION			= 'AddAfterSection',
								ADD 				= ToMxml({
									meta	= {name='Attributes', value='TkSceneNodeAttributeData'},
									Name	= 'ATTACHMENT',
									Value	= 'MODELS/COMMON/SPACECRAFT/SHARED/ENTITIES/SHAREDLODDISTANCES.ENTITY.MBIN'
								})
							}
						end
					end
				end
				return T
			end
		)()
	}
}}
