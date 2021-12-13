------------------------------------------------------------
local desc = [[
  General better handling in water; stronger & longer boost
  Nimbler Mech handling;
  Eject on top of submarine; much longer summoning range
]]----------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC VEHICLE.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.75,
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MOD_DESCRIPTION		= desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCVEHICLEGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				VALUE_CHANGE_TABLE 	= {
					{'MechLandBrake',				1},		-- 4
					{'MechJetpackLandTime',			-0.2},	-- 0.6
					{'MechTurnSpeed',				-0.8},	-- 1.5
					{'MechJetpackTurnSpeed',		-1.8},	-- 3
					{'MechJetpackStrafeStrength',	1.6},	-- 0.5
					{'MechJetpackForce',			8},		-- 70
					{'MechJetpackMaxSpeed',			20},	-- 20
					{'MechJetpackMaxUpSpeed',		8},		-- 20
					{'MechJetpackFallForce',		-24},	-- 80
					{'MechTitanFallCameraShakeDist',-34},	-- 80
					{'MechLandCameraShakeDist',		-16},	-- 40
					{'ExitStopTime',				1.5},	-- 0.5
					{'ExitStopForce',				-40},	-- 50
					{'SubmarineEjectRadius',		-1.8},	-- 1.8 -- stand on top
					{'SubmarineEjectDownOffset',	3},		-- -2
					{'MiningLaserRadius', 			-0.5},	-- 1.3
					{'VehicleMaxSummonDistance',	4000},	-- 50
					{'SpawnRotation',				-40},	-- 10
					{'MechSpawnRotation',			-40},	-- 190

				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				VALUE_CHANGE_TABLE 	= {
					{'VehicleBoostMaxSpeed', 		1.24},
					{'VehicleBoostTime', 			1.6},
					{'VehicleBoostRechargeTime', 	0.8},
					{'PulseRange',					3},
					{'ChargeTime',					0.25}
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'BIKE'},
				VALUE_CHANGE_TABLE 	= {
					{'VehicleGravity',				0.5},	-- 17.5
					{'VehicleGravityWater',			-2},	-- 17.5
					{'VehicleJumpAirControlForce', 	40},	-- 100
					{'VehicleLinearDampingAerial',	-0.015},-- 0.05
					{'VehicleAngularDampingAerial',	-0.25}	-- 1
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'MED_BUGGY'},
				VALUE_CHANGE_TABLE 	= {
					{'TopSpeedForward', 			1},		-- 16
					{'TopSpeedReverse', 			2},		-- 8
					{'VehicleGravity',				6},		-- 20
					{'VehicleGravityWater',			4}		-- 8
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'TRUCK'},
				VALUE_CHANGE_TABLE 	= {
					{'TopSpeedForward', 			2},		-- 12
					{'TopSpeedReverse', 			2},		-- 8
					{'VehicleGravity',				10},	-- 20
					{'VehicleGravityWater',			6},		-- 8
					{'VehicleLinearDampingWater',	-1.5},	-- 3.5
					{'VehicleAngularDampingWater',	-8}		-- 20
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'WHEELEDBIKE'},
				VALUE_CHANGE_TABLE 	= {
					{'VehicleGravity',				2},		-- 20
					{'VehicleGravityWater',			6},		-- 8
					{'VehicleJumpAirControlForce', 	30},	-- 75
					{'VehicleLinearDampingAerial',	-0.01},	-- 0.05
					{'VehicleAngularDampingAerial',	-0.2},	-- 1
					{'VehicleLinearDampingWater',	-2},	-- 3.5
					{'VehicleAngularDampingWater',	-8}		-- 20
				}
			},
			{
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS	= {'Name', 'SUBMARINE'},
				VALUE_CHANGE_TABLE 	= {
					{'UnderwaterEnginePower',		2},		-- 6
					{'UnderwaterEngineMaxSpeed',	4},		-- 15
					{'UnderwaterEngineFalloff', 	-0.4},	-- 0.7
					{'TopSpeedForward', 			4},		-- 15
					{'VehicleGravityWater',			-1},	-- 17.5
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'MECH'},
				VALUE_CHANGE_TABLE 	= {
					{'TopSpeedForward', 			2.5}	-- 2
				}
			}
		}
	}
}}}}
