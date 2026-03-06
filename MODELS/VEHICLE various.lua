---------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
---------------------------------------------------------------------------
local mod_desc = [[
  - colossus brighter headlights, less volumetrics
  - Mech: Faster step anime (adjusted for faster speed in vehicle globals)
   Hardframe blue front 3part light
  - Bike: reduce turret scale for the Nomad exocraft
   Rescale engine nozzle, re-position the engine bloom glow
   Remove light shafts
  - Add spotlight to exocraft turret
  - remove glow from bike & buggy parts
  - (deprecated) Remove installed tech check for vehicle turret
]]-------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ MODEL vehicles various',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.24',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|colossus lights|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/VEHICLES/ROVER/ROVER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', 'spotLight[13]_2_3'},
					{'Name', 'spotLight[15]_2_1'},
					{'Name', 'spotLight[13]_2_2_2'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-10}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', 'spotLight[13]_2_3',	'Name', 'INTENSITY'},
					{'Name', 'spotLight[15]_2_1',	'Name', 'INTENSITY'},
					{'Name', 'spotLight[13]_2_2_2',	'Name', 'INTENSITY'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		120}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'Name', 'spotLight[13]_2_3',	'Name', 'RADIUS'},
					{'Name', 'spotLight[15]_2_1',	'Name', 'RADIUS'},
					{'Name', 'spotLight[13]_2_2_2',	'Name', 'RADIUS'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		105}
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', 'VOLUMETRIC'},
				VALUE_MATCH			= '1.000000',
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.001}
				}
			},
		}
	},
	{--	|submarine lights|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/VEHICLES/SUBMARINE/SUBMARINEPRES.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', '.-FinLight', 'Name', 'VOLUMETRIC'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.06}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight[12]', 'Name', 'VOLUMETRIC'}, -- boost
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.08}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'spotLight[12]', 'Name', 'VOLUMETRIC'}, -- front lights
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'spotLight[56]', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'spotLight[56]', 'Name', 'VOLUMETRIC'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0.06}
				}
			}
		}
	},
	{--	|nomad tweaks|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/VEHICLES/BIKE/BIKEPRES.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'EngineCenterRotate'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleX',		1.52},
					{'ScaleY',		1.52},
					{'ScaleZ',		1.52}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'EngineCircles'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.585},
					{'TransZ',		-1.192},
					{'ScaleX',		0.44},
					{'ScaleY',		0.44},
					{'ScaleZ',		0.44}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Gun'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.78},
					{'TransZ',		-0.44},
					{'ScaleX',		0.56},
					{'ScaleY',		0.56},
					{'ScaleZ',		0.56}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'spotLight[45]'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|buggy no fog cone|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/VEHICLES/BUGGY/BUGGYPRES.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'Name', 'spotLight[34]'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|bike blue lights|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/VEHICLES/WHEELEDBIKE/WHEELEDBIKEPRES/LIGHTFADE_MAT.MATERIAL.MBIN',	-- green
			'MODELS/COMMON/VEHICLES/WHEELEDBIKE/WHEELEDBIKEPRES/LIGHTS_MAT.MATERIAL.MBIN',		-- green
		},
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			0.56},
					{'Y',			0.52},
					{'Z',			0.86}
				}
			}
		}
	},
	{--	|hardframe blue neon|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/VEHICLES/MECH_SUIT/MECH_SUIT/REDGLOW_MAT5.MATERIAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE 	= {
					{'X',			0.1},
					{'Y',			0.1},
					{'Z',			0.45}
				}
			}
		}
	},
	{--	|mech faster step| animation speed
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/VEHICLES/MECH_SUIT/MECH_SUIT/ENTITIES/MECH.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'Components', 'TkPhysicsComponentData'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Mass',		40},	-- 10
					-- {'Gravity',		20},	-- 20
				-- }
			-- },
			{
				SPECIAL_KEY_WORDS	= {'Components', 'GcCreatureFullBodyIKComponentData'},
				VALUE_CHANGE_TABLE 	= {
					{'MaxHeadYaw',		120},	-- 125
					{'MaxFootAngle',	65},	-- 45
					{'MovementDamp',	0.45},	-- 0.2
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Filename','MODELS/COMMON/VEHICLES/MECH_SUIT/ANIMS/MECH_WALK.ANIM.MBIN'},
				VALUE_CHANGE_TABLE 	= {
					{'Speed',		1.12}	-- 1
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Filename','MODELS/COMMON/VEHICLES/MECH_SUIT/ANIMS/MECH_FASTWALK.ANIM.MBIN'},
				VALUE_CHANGE_TABLE 	= {
					{'Speed',		1.24}	-- 0.8
				}
			}
		}
	},
	{--	Add |turret spotlight| to vehicle
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/VEHICLES/SHARED/MININGLASER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'GunLight'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.516},	-- 0.530418
					{'TransY',		-2.024},-- -2.16751
					{'TransZ',		1.244},	-- 1.25
					{'ScaleX',		0.94},	-- 1
					{'ScaleY',		0.94},	-- 1
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'MiningLaser'},
				ADD_OPTION			= 'AddAfterSection',
				ADD 				= AddLightNodes({
					name='turret_light',
					tx=	0.25,	ty=	0.45,	tz=	0.4,
					rx= 10.6,	ry=	180,	v = 0.0001,
					fov=66,		i = 148,	c =	'FFF0F5FF',
					f =	1,		rd= 136
				})
			}
		}
	},
	{--	|no vehicle muzzle flare|
		MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/MUZZLE/VEHICLELASERMUZZLE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Flare'},
				REMOVE				= 'Section'
			}
		}
	}
}}}}
