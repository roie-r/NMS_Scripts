--[[┎──────────────────────────────────────────
	┃ 		ALWAYS EXCLUDED FROM BATCH
	┠──────────────────────────────────────────
	┃ camera POV tweaks for vehicles and ships
	┃ Remove auto-centering; photomode tweaks
	┃ Decrease caemra shake for various events
────┸──────────────────────────────────────--]]
Shake_Strength_Mult = {
	dat = {
		{'LAND',			0.5},	-- 0.01
		{'WALKERWALK',		0.5},	-- 0.03
		{'DOCKINGSHAKE', 	0.4},	-- 0.01
		{'WARP_FRT_ATMOS',	0.1},	-- 0.01
		{'LARGECREATUREWA', 0.5},	-- 0.02
		{'RUNNING',			0.8},	-- 30
		{'FLYBY',			0.6},	-- 2
		{'VENTBUILDUP',		0.4},	-- 0.05
		{'VENTEXPLODE',		0.67},	-- 0.3
		{'EXTRACTOR',		0.2},	-- 0.3
		{'MECHTITANFALL',	0.35},	-- 0.3
		{'MECHLAND',		0.35}	-- 0.3
	},
	Get = function(x)
		return {
			MATH_OPERATION 		= '*',
			INTEGER_TO_FLOAT	= 'FORCE',
			SPECIAL_KEY_WORDS	= {'Name', x[1]},
			VALUE_CHANGE_TABLE 	= { {'ShakeStrength', x[2]} }
		}
	end
}

function BuildExmlChangeTable(tbl)
	local T = {}
	for i = 1, #tbl.dat do table.insert(T, tbl.Get(tbl.dat[i])) end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC CAMERA.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.13',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MOD_DESCRIPTION		= 'U',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCCAMERAGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				VALUE_CHANGE_TABLE 	= {
					{'CenterStartTime',		42},
					{'VertRotationMin',		-80},
					{'VertRotationMax',		80},
					{'Time',				0}, -- disable charting arial view
					{'PauseTime',			0},
					{'TimeBack',			0}
				}
			},
			{
				MATH_OPERATION 		= '+',
				VALUE_CHANGE_TABLE 	= {
					{'VehicleExitFlashTime',					-0.3},	-- 0.8
					{'VehicleExitFlashStrength',				-0.3},	-- 0.8
					{'BinocularFlashTime',						-0.12},	-- 0.24
					{'BinocularFlashStrength',					-0.5},	-- 0.9
					{'InteractionHeadHeightDefault',			-0.15},	-- 1.65
					{'PhotoModeVelocitySmoothTime',				0.3},	-- 0.5
					{'PhotoModeMoveSpeed',						5},		-- 11
					{'PhotoModeTurnSpeed',						-30},	-- 60
					{'PhotoModeMaxDistance',					1000},	-- 150
					{'PhotoModeMaxDistanceSpace',				5000},	-- 200
					{'PhotoModeRollSpeed',						-10},	-- 45
					{'BuildingModeMaxDistance',					1000},	-- 60
					{'ModelViewMouseRotateSpeed',				-0.4},	-- 1.6	-- inventory models
					{'ModelViewMouseRotateSnapStrength',		-0.56},	-- 0.94
					{'BobAmountAbandFreighter',					-0.02},	-- 0.1
					{'FirstPersonCamHeight',					-0.04},	-- 0.85
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'VehicleExitFlashColour',
				VALUE_CHANGE_TABLE 	= {
					{'R',			0.08},
					{'G',			0.08},
					{'B',			0.16},
					{'A',			-0.5}	-- 1
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'BUGGY'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				-0.2},	-- 3.5
					{'OffsetZFlat',			-0.7},	-- 0
					{'BackMinDistance',		1},		-- 15
					{'BackMaxDistance',		2},		-- 22.5
					{'UpMinDistance',		1},		-- -3
					{'UpMaxDistance',		1}		-- -3
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'SUBMARINE'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				3.3},	-- 0
					{'OffsetZFlat',			-2.5},	-- -2
					{'BackMinDistance',		5},		-- 15.75
					{'BackMaxDistance',		5},		-- 24.75
					{'UpMinDistance',		3},		-- 0
					{'UpMaxDistance',		4}		-- 0
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'BikeFollowCam',
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				0},		-- 1.5
					{'OffsetZFlat',			-0.4},	-- 0
					{'BackMaxDistance',		2},		-- 21
					{'UpMinDistance',		0.2}	-- 1
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'WheeledBikeFollowCam',
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				0.4},	-- 0.2
					{'OffsetZFlat',			-0.7},	-- 0
					{'BackMaxDistance',		-7},	-- 31.5
					{'UpMaxDistance',		1}		-- 0
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				PRECEDING_KEY_WORDS = 'TruckFollowCam',
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				2.6},	-- 0
					{'OffsetZFlat',			-2},	-- 3.3
					{'BackMinDistance',		4},		-- 12
					{'BackMaxDistance',		4},		-- 27
					{'UpMinDistance',		2.5},	-- -1.5
					{'UpMaxDistance',		2.25}	-- -2.25
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'MECH'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetX',				0},		-- 1.8
					{'OffsetY',				1.8},	-- -1
					{'BackMinDistance',		6},		-- 6.5
					{'BackMaxDistance',		6},		-- 14
					{'UpMinDistance',		1.2},	-- -1
					{'UpMaxDistance',		1.4}	-- 0
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'MECHSHOOT'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				0.3},	-- 1
					{'BackMinDistance',		3},		-- 6
					{'BackMaxDistance',		4},		-- 10
					{'UpMinDistance',		0.3},	-- 0
					{'UpMaxDistance',		0.4}	-- 0
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'MECHJETPACK'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetX',				0.4},	-- 1
					{'OffsetY',				0.65},	-- -0.85
					{'BackMinDistance',		5},		-- 8
					{'BackMaxDistance',		5},		-- 20
					{'UpMaxDistance',		2}		-- 0
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'SPACESHIP'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				3.2},	-- -0.8
					{'OffsetZFlat',			-3.2},	-- 3
					{'BackMinDistance',		-2},	-- 20
					{'BackMaxDistance',		-4},	-- 50
					{'UpMinDistance',		2},		-- 2
					{'UpMaxDistance',		2},		-- 10
					{'LookStickLimitAngle',	130}
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'DROPSHIP'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				2},		-- 0
					{'OffsetZFlat',			-1.5},	-- 4
					{'BackMinDistance',		-2},	-- 18
					{'BackMaxDistance',		-4},	-- 40
					{'UpMinDistance',		2},		-- 2
					{'UpMaxDistance',		2},		-- 10
					{'LookStickLimitAngle',	130}
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'SHUTTLE'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				0.2},	-- 2.2
					{'BackMinDistance',		2},		-- 22
					{'UpMinDistance',		1},		-- 2
					{'LookStickLimitAngle',	130}
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'ROYAL'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				1.4},	-- 1.2
					{'OffsetZFlat',			-8},	-- 8
					{'BackMinDistance',		4},		-- 10
					{'BackMaxDistance',		-4},	-- 40
					{'UpMinDistance',		1},		-- 2
					{'UpMaxDistance',		1},		-- 10
					{'LookStickLimitAngle',	130}
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'SCIENCE'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				2.6},	-- 1
					{'OffsetZFlat',			-2},	-- 6.5
					{'BackMinDistance',		5},		-- 15
					{'BackMaxDistance',		6},		-- 35
					{'UpMinDistance',		2},		-- 2
					{'UpMaxDistance',		1},
					{'LookStickLimitAngle',	130}
				}
			},
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', 'ALIENSHIP'},
				VALUE_CHANGE_TABLE 	= {
					{'OffsetY',				-0.2},	-- 1
					{'OffsetZFlat',			-4},	-- 6
					{'BackMinDistance',		0},		-- 12
					{'BackMaxDistance',		0},		-- 30
					{'UpMinDistance',		-0.2},	-- 2
					{'UpMaxDistance',		-2},	-- 10
					{'LookStickLimitAngle',	130}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'GCCAMERAGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Shake_Strength_Mult)
	}
}}}}
