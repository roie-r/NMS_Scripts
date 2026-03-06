--------------------------------------------------------------
local mod_desc = [[
  - cpital: shrink & move top fins away from hangar
  - Infraknife blue projectile
  - Dark blue instead of purple stealth trail
  - Replace gold trail with time swirl (for squadrons)
  - Remove all ships contrails
  - Remove shuttle fake headlights
  - Remove orange fake light cones
  - Remove bioship slime
  - Remove cockpit eject handle glow
  - Remove grainy shader from ship's system map
]]------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ SHIP various',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.24',
	MOD_BATCHNAME			= '+SHIPS ~@~collection',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{--	|freighter normal desc| remove unwanted proc-parts
	--	Each 2nd suffix replaces its preceding one
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTER_PROC.DESCRIPTOR.MBIN',
		MXML_CHANGE_TABLE	= (
			function()
				T = {}
				for id, sfx in pairs({
					_SideAcc		= {-- cargo gantry side panels
						'1_None1', '1_A1',
						'2_None1', '2_A1',
						'3_None1', '3_A1',
						'4_None1', '4_A1'
					}
				}) do
					for i=1, #sfx, 2 do
						T[#T+1] = {
							SPECIAL_KEY_WORDS	= {'Id', (id..sfx[i]):upper()},
							VALUE_CHANGE_TABLE 	= {
								{'Id',			(id..sfx[i+1]):upper()},
								{'Name',		id..sfx[i+1]}
							}
						}
					end
				end
				return T
			end
		)()
	},
	{--	|freighter gantry| light fix
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/GANTRY/GANTRYADOUBLEJOINT.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Light_Blue'},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ',		3.5},
					{'TransY',		54.2}
				}
			}
		}
	},
	{--	|capital top fins|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/CAPITALFREIGHTER_PROC.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'S1_Fin1'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0},
					{'TransY',		-180},
					{'TransZ',		-150},
					{'RotX', 		180},
					{'RotY', 		180},
					{'RotZ', 		0},
					{'ScaleX', 		0.8},
					{'ScaleY', 		0.8},
					{'ScaleZ', 		0.8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'S1_Fin2'},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ',		-420},
					{'ScaleX', 		0.62},
					{'ScaleY', 		0.62},
					{'ScaleZ', 		0.62}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'S1_Fin3'},
				VALUE_CHANGE_TABLE 	= {
					{'TransZ',		-570},
					{'ScaleX', 		0.48},
					{'ScaleY', 		0.48},
					{'ScaleZ', 		0.48}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'scaffolding1'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|infraknife blue shot|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PROJECTILES/SHIP_MINIGUN/SHIPMINIGUNPROJECTILEGRADIENT.MATERIAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/EFFECTS/TRAILS/HOT/INFRABLUE.DDS'}
				}
			}
		}
	},
	{--	|dark blue trail| replace purple stealth trail
		MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/TRAILS/SPACECRAFT/HOT/HOTDARKTRAIL.MATERIAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/EFFECTS/TRAILS/HOT/BLUEDARKER1.DDS'},
					-- {'MaterialClass', 'Additive'},
				}
			}
		}
	},
	-- {--	|plasma dark trail|
		-- MBIN_FILE_SOURCE	= 'MODELS/EFFECTS/TRAILS/SPACECRAFT/HOT/PLASMATRAIL.MATERIAL.MBIN',
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Map', 'TEXTURES/EFFECTS/TRAILS/HOT/TIMELOOP_DARK.DDS'}
				-- }
			-- }
		-- }
	-- },
	{--	|swirl instead of gold| trail
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/EFFECTS/TRAILS/SPACECRAFT/HOT/TIMELOOPTRAIL.SCENE.MBIN',
				'MODELS/EFFECTS/TRAILS/SPACECRAFT/HOT/HOTGOLDTRAIL.SCENE.MBIN',
				'REMOVE'
			}
		}
	},
	{--	|no foggy headlights| cone from cockpits
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYA.SCENE.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYB.SCENE.MBIN',
		},
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|ship texture removal|
		MBIN_FILE_SOURCE	= {
		--- cockpits: orange fake-light cone
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/ACCESSORIES/LANDINGGEAR_BASE/HQWHITELIGHT_MAT3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYA/HQWHITELIGHT_MAT3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/CANOPY/CANOPYB/HQWHITELIGHT_MAT2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITACCESSORIES/COCKPITACC_F/HQWHITELIGHT_MAT2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITACCESSORIES/COCKPITACC_E/HQWHITELIGHT_MAT3.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITBDOUBLECYLINDER/HQWHITELIGHT_MAT5.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHUTTLE/COCKPIT/COCKPITBSINGLECYLINDER/HQWHITELIGHT_MAT2.MATERIAL.MBIN',
		--- bioship: slime
			'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC/MEMBRANE_MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/INTERIOR/NOSTRILBURSTS/MEMBRANE_MAT1.MATERIAL.MBIN',
		---	cockpit eject handle no glow
			'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/INTERIOR/CANOPYA_INTERIOR/EJECTVFX3MAT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/EJECTHANDLEL/EJECTVFX3MAT.MATERIAL.MBIN'
		},
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'Section'
			}
		}
	},
}}}}

	-- {--	|bioship interior| remove canopy top; canopy membrane
		-- MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/INTERIOR/CANOPYA_INTERIOR.SCENE.MBIN',
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS 	= {
					-- {'Name', 'LeftCeilingFront'},
					-- {'Name', 'RightCeilingFront'},
					-- {'Name', 'Shadowmesh'},
					-- {'Name', 'Membrane'}
				-- },
				-- REMOVE 				= 'Section'
			-- }
		-- }
	-- },
