--[[┎──────────────────────────────────────────────────────────────────
	┃ Ship float; tighter turning; no contrails; increase pulse speed
	┃ Higher roll angle; milder auto leveling
────┸──────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC SPACESHIP.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCSPACESHIPGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				VALUE_CHANGE_TABLE 	= {
					{'LandingMargin',					0.4},	-- 1.4
					{'LandingObstacleMinHeight',		1},		-- 2
					{'_3rdPersonRollAngle',				3},		-- 75
					{'_3rdPersonRollAngleScience',		8},		-- 62
					{'_3rdPersonRollAngleDropship',		20},	-- 45
					{'_3rdPersonRollAngleAlien',		22},	-- 30
					{'MiniWarpHUDArrowAttractAngle',	-7},	-- 10
					{'HoverTakeoffHeight',				-22},	-- 90
					{'HoverLandReachedDistance',		-2},	-- 10
					{'LandingButtonMinTime',			-0.2},	-- 0.5
					{'LandingPushNoseUpFactor',			-0.16},	-- 0.15
					{'DefaultTrailInitialSpeed',		160},	-- 200
					{'DefaultTrailMinForwardSpeed',		50},	-- 45
					{'PulseDrivePlanetApproachHeight',	3000},	-- 6000
					{'ContrailDefaultAlpha',			-0.4},	-- 0.4
					{'ShieldRechargeMinHitTime',		2},		-- 3
					{'ShieldRechargeRate',				-3},	-- 6
					{'SurvivalTakeOffCostMultiplier',	-0.8},	-- 2
					{"MiniWarpLinesNum",				-4},	-- 4
					{'HitAsteroidDamage',				30000},	-- 10000
					{'LootAttractDistance',				240},	-- 120
					{'LootCollectDistance',				32},	-- 20
					{'DockingRotateSpeed',				-0.3},	-- 1
					{'MiniWarpSpeed',					6000},	-- 30000
					{'MiniWarpStoppingMarginPlanet',	1000},	-- 5000
					{'LaunchThrustersRegenTimePeriod',	-360}	-- 1440
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'SpaceEngine',
				VALUE_CHANGE_TABLE 	= {
					{'MinSpeed',		0.001},	-- 1
					{'Falloff',			-0.4},	-- 0.7
					{'TurnStrength',	1.16},
					{'RollAmount',		1.16},
					{'RollForce', 		1.3},
					{'RollAutoTime',	8}
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'PlanetEngine',
				VALUE_CHANGE_TABLE 	= {
					{'MinSpeed',		0.0001},
					{'TurnStrength',	1.12},
					{'RollAmount',		1.12},
					{'RollForce', 		1.2},
					{'RollAutoTime',	8}
				}
			},
			{
				REPLACE_TYPE 		= 'ALL',
				MATH_OPERATION 		= '*',
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'CombatEngine',
				VALUE_CHANGE_TABLE 	= {
					{'MinSpeed',		0.0005},
					{'TurnStrength',	1.44},
					{'RollAmount',		1.16},
					{'RollForce', 		1.32},
					{'RollAutoTime',	8}
				}
			}
		}
	}
}}}}
