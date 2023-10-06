-------------------------------------------
mod_desc = [[
  camera POV tweaks for vehicles and ships
  Remove auto-centering; photo-mode tweaks
]]-----------------------------------------
	
local ECT = {}
for _,cam in ipairs({
---	PRECEDING_KEY				offsetX		offsetY		offsetZ		backMin		backMax		upMin		upMax	lookStick
	{k='CharacterRideCamMedium',0	+2.2,	0	+0.6,	0	+1,		10	+0.6,	15	+0.6,	0	+0.6,	0	+0.8,	0	},
	{k='CharacterRideCamLarge',	0	+2.2,	0	+0.6,	0	+1,		18	+0.6,	25	+0.6,	0	+0.6,	0	+0.8,	0	},
	{k='CharacterRideCamHuge',	0	+2.8,	0	+1,		0	+1.2,	38	-8,		50	-6,		0	+1,		0	+1.4,	0	},
	{k='BuggyFollowCam',		0,			3.5	-0.2,	0	-0.7,	15	+1,		22.5 +2,	-3	+1,		-3	+1,		0	},
	{k='SubmarineFollowCam',	0,			0	+3.3,	0	-2.5,	15.7 +5.5,	24.7 +5.5,	0	+3,		0	+4,		0	},
	{k='BikeFollowCam',			0,			1.5	+0.02,	0	-0.4,	16.5,		21	+2,		1	+0.2,	4.5,		0	},
	{k='WheeledBikeFollowCam',	0,			0.2	+0.4,	0	-0.7,	15.25,		31.5 -7,	0,			0	+1,		0	},
	{k='TruckFollowCam',		0,			2.1	+2.6,	3.3	-2,		12	+4,		27	+4,		-1.5 +2.5,	-2 +2,		0	},
	{k='MechFollowCam',			2.2	+0.3,	-0.5 +1.9,	0,			6.5	+5,		14	+3,		-1	+1.1,	0	+1,		0	},
	{k='MechCombatCam',			5	-2.2,	-1	+2.4,	0,			6.5	+5,		14	+3,		-1	+1.1,	0	+1,		0	},
	{k='MechJetpackCam',		1	+0.4,	-0.8 +0.8,	0,			8	+5,		20	+3,		0	+0.5,	0	+1.5,	0	},
	{k='SpaceshipFollowCam',	0,			-0.8 +2.6,	3	-3.2,	20	-1.4,	50,			2	+1.8,	10,			254	},
	{k='DropshipFollowCam',		0,			-1.5 +2.4,	4	-3.8,	18	+0.2,	40,			2	+2.2,	10	+1.2,	254	},
	{k='ShuttleFollowCam',		0,			2.2	+0.2,	3	-1,		22	+1,		45	+1,		2	+1,		10,			254	},
	{k='RoyalShipFollowCam',	0,			1.2	+1.4,	8	-8,		10	+5,		40	+5,		2	+1,		10	+1,		254	},
	{k='SailShipFollowCam',		0,			1.2	+1.2,	8	-7,		10	+6,		40	+6,		2	+0.8,	10,			254	},
	{k='ScienceShipFollowCam',	0,			1	+2.4,	6.5	-2,		15	+5,		35	+4,		2	+2.2,	10	+1.2,	254	},
	{k='AlienShipFollowCam',	0,			1	-0.2,	6	-4,		12	+2,		30,			2	-0.2,	10	-2,		254	},
	{k='RobotShipFollowCam',	0,			-1.5 +0.8,	4,			18,			40,			2	+0.2,	10,			254	}
}) do
	ECT[#ECT+1] = {
		INTEGER_TO_FLOAT	= 'Force',
		PRECEDING_KEY_WORDS = cam.k,
		VALUE_CHANGE_TABLE 	= {
			{'OffsetX',				cam[1]},
			{'OffsetY',				cam[2]},
			{'OffsetZFlat',			cam[3]},
			{'BackMinDistance',		cam[4]},
			{'BackMaxDistance',		cam[5]},
			{'UpMinDistance',		cam[6]},
			{'UpMaxDistance',		cam[7]},
			{'LookStickLimitAngle',	cam[8]}
		}
	}
end

ECT[#ECT+1] = {
	REPLACE_TYPE 		= 'All',
	VALUE_CHANGE_TABLE 	= {
		{'CenterStartTime',		42},
		{'VertRotationMin',		-80},
		{'VertRotationMax',		80},
		{'Time',				0}, -- disable charting arial view
		{'PauseTime',			0},
		{'TimeBack',			0},
	}
}
ECT[#ECT+1] = {
	INTEGER_TO_FLOAT	= 'Force',
	VALUE_CHANGE_TABLE 	= {
		{'VehicleExitFlashTime',			0.5},	-- 0.8		361
		{'VehicleExitFlashStrength',		0.5},	-- 0.8
		{'BinocularFlashTime',				0.12},	-- 0.24
		{'BinocularFlashStrength',			0.4},	-- 0.9
		{'MechCameraArmShootOffsetY',		2},		-- 1
		{'InteractionHeadHeightDefault',	1.5},	-- 1.65		3313
		{'PhotoModeVelocitySmoothTime',		1.5},	-- 0.5
		{'PhotoModeMoveSpeed',				14},	-- 11
		{'PhotoModeTurnSpeed',				22},	-- 60
		{'PhotoModeMaxDistance',			1200},	-- 150
		{'PhotoModeMaxDistanceSpace',		5500},	-- 200
		{'PhotoModeRollSpeed',				35},	-- 45
		{'BuildingModeMaxDistance',			1500},	-- 60
		{'MechCamSpringStrengthMin',		0.1},	-- 0.6
		{'MechCamSpringStrengthMax',		0.1},	-- 0.6
		{'ModelViewMouseRotateSpeed',		1.2},	-- 1.6	-- inventory models
		{'ModelViewMouseRotateSnapStrength',0.38},	-- 0.94
		{'BobAmountAbandFreighter',			0.08},	-- 0.1		6129
		{'FirstPersonCamHeight',			0.79},	-- 0.85
	}
}
ECT[#ECT+1] = {
	REPLACE_TYPE 		= 'All',
	MATH_OPERATION 		= '+',
	VALUE_CHANGE_TABLE 	= {
		{'OffsetYStartBias',	5.8},	-- 3.5	-- Warp tunnel POV
		{'OffsetZStartBias',	60},	-- 15 50
	}
}
ECT[#ECT+1] = {
	INTEGER_TO_FLOAT	= 'Force',
	PRECEDING_KEY_WORDS = 'VehicleExitFlashColour',
	VALUE_CHANGE_TABLE 	= {
		{'R',			0.08},
		{'G',			0.08},
		{'B',			0.16},
		{'A',			0.5}
	}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC CAMERA.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.45',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCCAMERAGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= ECT
	}
}}}}


	-- for _,shk in ipairs({
	-- 	{'LAND',			1, 	0.5	},	-- 1	0.01
	-- 	{'WALKERWALK',		1, 	0.5	},	-- 1	0.03
	-- 	{'DOCKINGSHAKE', 	8,	0.4	},	-- 1	0.01
	-- 	{'WARP_FRT_ATMOS',	4,	0.33},	-- 0.6	0.01
	-- 	{'WARP_FRG_ATMOS',	4,	0.33},	-- 0.6	0.01
	-- 	{'LARGECREATUREWA', 1, 	0.6	},	-- 1	0.02
	-- 	{'RUNNING',			1, 	0.8	},	-- 2000	30
	-- 	{'FLYBY',			10,	0.6	},	-- 100	2
	-- 	{'VENTBUILDUP',		2, 	0.8	},	-- 5	0.05
	-- 	{'VENTEXPLODE',		2, 	0.6	},	-- 1	0.3
	-- 	{'EXTRACTOR',		4,	0.2	},	-- 8	0.3
	-- 	{'MECHTITANFALL',	1, 	0.5 },	-- 1	0.03
	-- 	{'MECHLAND',		1, 	0.5 },	-- 1	0.03
	-- 	{'SANDWORMEMERGE',	2, 	0.5	},	-- 1.5	0.06
	-- 	{'SANDWORMSHAKE',	2, 	0.8	},	-- 1.5	0.004
	-- 	{'WORMGRNDEMERGE',	2, 	0.5	},	-- 1.5	0.06
	-- 	{'WORMGRNDROAR',	2, 	0.8	},	-- 1.5	0.004
	-- }) do
	-- 	ECT[#ECT+1] = {
	-- 		MATH_OPERATION 		= '*',
	-- 		INTEGER_TO_FLOAT	= 'Force',
	-- 		SPECIAL_KEY_WORDS	= {'Name', shk[1]},
	-- 		VALUE_CHANGE_TABLE 	= {
	-- 			{'StrengthScale', shk[2]},
	-- 			{'ShakeStrength', shk[3]},
	-- 		}
	-- 	}
	-- end
