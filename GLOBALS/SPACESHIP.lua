-------------------------------------------------------------------
mod_desc = [[
  Ship hover; tighter turning; no contrails; increase pulse speed
  Higher roll angle; no auto leveling; drifting;
]]-----------------------------------------------------------------

local function ShipEngineModesData()
	--								Space				Planet					Combat				AtmosCombat
	local eng_prop = {--			c  l  h  v			c  l  h  v				c  l  h  v			c  l  h  v
		{pr='ThrustForce',			0.8,				0.7,					0.96,				0.96					},
		{pr='MinSpeed',				0.001,				0.001,					0.0005,				0.0005					},
		{pr='MaxSpeed',				1.4,				1.4,					1.3,				1.3						},
		{pr='Falloff',				0.3,				0.7,					0.4,				0.5						},
		{pr='BoostThrustForce',		0.85,				{1.0, 0.6, 2.0, 0.7},	0.96,				{0.94, 0.94, 1.4, 1.4}	},
		{pr='BoostMaxSpeed',		{1.3, 1, 1.1, 1.3},	1.2,					{1.4, 1, 1.2, 1.4},	{1.2, 1.2, 1.8, 1.8}	},
		{pr='BoostFalloff',			0.4,				0.75,					0.5,				0.8						},
		{pr='DirectionBrakeMin',	0.4,				{0.7, 0.8, 1.2, 1.2},	0.5,				0.75					},
		{pr='DirectionBrake',		0.6,				0.84,					0.7,				0.8						},
		{pr='ReverseBrake',			1.1,				1.3,					1.1,				1.2						},
		{pr='OverspeedBrake',		0.6,				1.05,					0.7,				0.92					},
		{pr='TurnStrength',			{1, 1, 1, 1.3},		1,						{1, 1, 1, 1.2},		{1, 1, 1, 1.2}			},
		{pr='LowSpeedTurnDamper',	0.7,				{0.9, 6.0, 0.9, 0.88},	0.7,				1						},
		{pr='RollAutoTime',			1,					8,						1,					8						},
		{pr='BalanceTimeMin',		1,					4,						1,					4						},
		{pr='BalanceTimeMax',		1,					4,						1,					4						}
	}
	local T = {}
	for i, ctrl in ipairs({'Control', 'ControlLight', 'ControlHeavy', 'ControlHover'}) do
		for j, em in ipairs({'SpaceEngine', 'PlanetEngine', 'CombatEngine', 'AtmosCombatEngine'}) do
			T[#T+1] = {
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {
					ctrl,	'GcPlayerSpaceshipControlData.xml',
					em,		'GcPlayerSpaceshipEngineData.xml'
				},
				VALUE_CHANGE_TABLE 	= (
					function()
						tm = {}
						for _,ep in ipairs(eng_prop) do
							mul = type(ep[i]) == 'table' and ep[i][j] or ep[i]
							tm[#tm+1] = {ep.pr , mul}
						end
						return tm
					end
				)()
			}
		end
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__GC SPACESHIP.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.23',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		MBIN_FILE_SOURCE	= 'GCSPACESHIPGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= ShipEngineModesData()
	},
	{
		MBIN_FILE_SOURCE	= 'GCSPACESHIPGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'LandingMargin',						2.2},	-- 1.4
					{'LandingObstacleMinHeight',			3.2},	-- 2
					{'LowAltitudeAnimationHeight',			3300},	-- 1200 -- solar sail trigger
					{'LowAltitudeAnimationHysteresisTime',	3},		-- 4
					{'LowAltitudeAnimationTime',			4},		-- 6
					{'ApplyHeightForce',					false},
					{'WarpInTimeFreighter',					2.2},	-- 1
					{'WarpInTimeNexus',						2.2},	-- 1
					{'WarpNexusDistance',					-8000},	-- -9000
					{'MaxOverspeedBrake',					900},	-- 1000
					{'PulseDrivePlanetApproachHeight',		4000},	-- 6000
					{'_3rdPersonRollAngle',					78},	-- 75		(270)
					{'_3rdPersonRollAngleScience',			76},	-- 62
					{'_3rdPersonRollAngleDropship',			64},	-- 45
					{'_3rdPersonRollAngleAlien',			54},	-- 30
					{'_3rdPersonFlashIntensity',			0.5},	-- 0.9
					{'_3rdPersonFlashDuration',				0.6},	-- 0.9
					{'_3rdPersonWarpXWander',				3.2},	-- 6
					{'_3rdPersonWarpYWander',				1},		-- 1.5
					{'_3rdPersonWarpZWander',				2},		-- 5.5
					{'_3rdPersonWarpWanderStartTime',		1},		-- 6.5
					{'AvoidancePower',						4},		-- 3
					{'PitchCorrectHeightMax',				300},	-- 700
					{'HoverTakeoffHeight',					68},	-- 90
					{'HoverLandReachedDistance',			8},		-- 10
					{'LandingButtonMinTime',				0.3},	-- 0.5
					{'LandingPushNoseUpFactor',				-0.03},	-- 0.15
					{'ShieldRechargeMinHitTime',			24},	-- 60		(1136)
					{'HitAsteroidDamage',					40000},	-- 10000
					{'PlayerFreighterClearSpaceRadius',		2100},	-- 3000
					{'MiniWarpLinesNum',					0},		-- 4
					{'MiniWarpLinesSpacing',				0},		-- 3000
					{'MiniWarpLinesOffset',					0},		-- 1000
					{'MiniWarpLinesHeight',					0},		-- 800
					{'MiniWarpShakeStrength',				1.2},	-- 2		(1358)
					{'MiniWarpStoppingMarginPlanet',		4200},	-- 5000
					{'MiniWarpHUDArrowAttractAngle',		3},		-- 10
					{'MiniWarpHUDArrowAttractAngleStation',	3},		-- 5
					{'MiniWarpHUDArrowAttractAngleDense',	3},		-- 4
					{'MiniWarpHUDArrowNumMarkersToBeDense',	3},		-- 6
					{'DockingRotateSpeed',					0.7},	-- 1
					{'ShakeMaxPower',						0.7},	-- 1.3
					{'GroundHeightSmoothTime',				3},		-- 0
					{'MaxSpeedUpVelocity',					80},	-- 100
				}
			},
			{
			--	class bonuses
				REPLACE_TYPE 		= 'All',
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'ThrustForceMax',		0.8}
				}
			}
		}
	}
}}}}
