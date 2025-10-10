------------------------------------------------------------
local mod_desc = [[
  General better handling in water; stronger & longer boost
  Nimbler Mech handling;
  Eject on top of submarine; longer summoning range
]]----------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '+ GC vehicle',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '6.06',
	MOD_DESCRIPTION			= mod_desc,
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'GCVEHICLEGLOBALS.GLOBAL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'MechJetpackTurnSpeed',				1.8	},	-- 3
					{'MechLandBrake',						5	},	-- 4
					{'MechJetpackStrafeStrength',			1.8	},	-- 0.5
					{'MechJetpackLandTime',					0.4	},	-- 0.6
					{'MechJetpackForce',					78	},	-- 70
					{'MechJetpackMaxSpeed',					42	},	-- 20
					{'MechJetpackMaxUpSpeed',				28	},	-- 20
					{'MechJetpackFallForce',				68	},	-- 80
					{'MechArmPitchAngleMin',				-45	},	-- -30
					{'MechArmPitchAngleMax',				75	},	-- 60
					{'MechPlayerGroundTurnSpeed',			0.7	},	-- 0.5
					{'ExitStopTime',						2	},	-- 0.5
					{'ExitStopForce',						10	},	-- 50
					{'SubmarineEjectRadius',				0	},	-- 1.8 		549 stand on top
					{'SubmarineEjectDownOffset',			1	},	-- -2
					{'MiningLaserRadius', 					0.8	},	-- 1.3
					{'VehicleMaxSummonDistance',			2000},	-- 50
					{'VehicleMaxSummonDistanceUnderwater',	2000},	-- 50
					{'SpawnRotation',						-30	},	-- 10
					{'MechSpawnRotation',					150	},	-- 190
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'VehicleBoostMaxSpeed', 		2.1},
					{'VehicleBoostTime', 			1.6},
					{'VehicleBoostRechargeTime', 	0.8}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'BIKE'},
				VALUE_CHANGE_TABLE 	= {
					{'TopSpeedForward', 			19},	-- 18
					{'VehicleGravity',				18},	-- 17.5
					{'VehicleGravityWater',			15.5},	-- 17.5
					{'VehicleJumpAirControlForce', 	140},	-- 100
					{'VehicleLinearDampingAerial',	0.035},	-- 0.05
					{'VehicleAngularDampingAerial',	0.78}	-- 1
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'MED_BUGGY'},
				VALUE_CHANGE_TABLE 	= {
					{'TopSpeedForward', 			17},	-- 16
					{'TopSpeedReverse', 			10},	-- 8
					{'VehicleGravity',				26},	-- 20
					{'VehicleGravityWater',			12}		-- 8
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'TRUCK'},
				VALUE_CHANGE_TABLE 	= {
					{'TopSpeedForward', 			14},	-- 12
					{'TopSpeedReverse', 			10},	-- 8
					{'VehicleGravity',				30},	-- 20
					{'VehicleGravityWater',			15},	-- 8
					{'VehicleLinearDampingWater',	2},		-- 3.5
					{'VehicleAngularDampingWater',	12}		-- 20
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'WHEELEDBIKE'},
				VALUE_CHANGE_TABLE 	= {
					{'VehicleGravity',				22},	-- 20
					{'VehicleGravityWater',			14},	-- 8
					{'VehicleJumpAirControlForce', 	105},	-- 75
					{'VehicleLinearDampingAerial',	0.04},	-- 0.05
					{'VehicleAngularDampingAerial',	0.8},	-- 1
					{'VehicleLinearDampingWater',	1.5},	-- 3.5
					{'VehicleAngularDampingWater',	12}		-- 20
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'SUBMARINE'},
				VALUE_CHANGE_TABLE 	= {
					{'UnderwaterEnginePower',		10.5},	-- 10
					{'UnderwaterEngineMaxSpeed',	22.5},	-- 22
					{'UnderwaterEngineFalloff', 	0.35},	-- 0.7
					{'TopSpeedForward', 			22.5},	-- 22
					{'VehicleGravityWater',			16.5},	-- 17.5
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'MECH'},
				VALUE_CHANGE_TABLE 	= {
					{'TopSpeedForward', 			3.6}	-- 2
				}
			}
		}
	}
}}}}
