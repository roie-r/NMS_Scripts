-------------------------------------------
local mod_desc = [[
  camera POV tweaks for vehicles and ships
  Remove auto-centering; photo-mode tweaks
]]-----------------------------------------

local cam_ect = {}
for cam, prop in pairs({
---							offsetX		offsetY		offsetZ		backMin		backMax		upMin		upMax		lookStick
	CharacterRideCamMedium	={ox=2.2,	oy=0.6,		oz=1,		bn=10.6,	bx=15.6,	un=0.6,		ux=0.8,		},
	CharacterRideCamLarge	={ox=2.2,	oy=0.6,		oz=1,		bn=18.6,	bx=25.6,	un=0.6,		ux=0.8,		},
	CharacterRideCamHuge	={ox=2.8,	oy=1,		oz=1.2,		bn=30,		bx=44,		un=1,		ux=1.4,		},
	BuggyFollowCam			={			oy=3.3,		oz=-0.7,	bn=16,		bx=24.5,	un=-2,		ux=-2,		},
	SubmarineFollowCam		={			oy=3.3,		oz=-2.5,	bn=20.2,	bx=30.2,	un=3,		ux=4,		},
	BikeFollowCam			={			oy=1.52,	oz=-0.4,	bn=16.5,	bx=23,		un=1.2,		ux=4.5,		},
	WheeledBikeFollowCam	={			oy=0.6,		oz=-0.7,	bn=15.25,	bx=24.5,				ux=1,		},
	TruckFollowCam			={			oy=4.7,		oz=3.1,		bn=16,		bx=31,		un=1,					},
	MechFollowCam			={ox=2.5,	oy=1.4,					bn=11.5,	bx=17,		un=0.1,		ux=1,		},
	MechCombatCam			={ox=3,		oy=0.6,					bn=11.5,	bx=17,		un=0.1,		ux=1,		},
	MechJetpackCam			={ox=1.4,							bn=13,		bx=23,		un=0.5,		ux=1.5,		},
	SpaceshipFollowCam		={			oy=1.8,		oz=-0.2,	bn=18.6,	bx=50,		un=3.8,		ux=10,		ls=254	},
	DropshipFollowCam		={			oy=0.9,		oz=0.2,		bn=18.2,	bx=40,		un=4.2,		ux=11.2,	ls=254	},
	ShuttleFollowCam		={			oy=2.4,		oz=2,		bn=23,		bx=46,		un=3,		ux=10,		ls=254	},
	RoyalShipFollowCam		={			oy=2.6,					bn=15,		bx=45,		un=3,		ux=11,		ls=254	},
	SailShipFollowCam		={			oy=2.4,		oz=1,		bn=16,		bx=46,		un=2.8,		ux=10,		ls=254	},
	ScienceShipFollowCam	={			oy=3.4,		oz=4.5,		bn=20,		bx=39,		un=4.2,		ux=11.2,	ls=254	},
	AlienShipFollowCam		={			oy=1.1,		oz=2,		bn=14,		bx=30,		un=2.1,		ux=10.5,	ls=254	},
	RobotShipFollowCam		={			oy=-0.7,	oz=4,		bn=18,		bx=40,		un=2.2,		ux=10,		ls=254	}
}) do
	cam_ect[cam].OffsetX				= prop.ox or cam_ect[cam].OffsetX			
	cam_ect[cam].OffsetY				= prop.oy or cam_ect[cam].OffsetY			
	cam_ect[cam].OffsetZFlat			= prop.oz or cam_ect[cam].OffsetZFlat		
	cam_ect[cam].BackMinDistance		= prop.bn or cam_ect[cam].BackMinDistance	
	cam_ect[cam].BackMaxDistance		= prop.bx or cam_ect[cam].BackMaxDistance	
	cam_ect[cam].UpMinDistance			= prop.un or cam_ect[cam].UpMinDistance		
	cam_ect[cam].UpMaxDistance			= prop.ux or cam_ect[cam].UpMaxDistance		
	cam_ect[cam].LookStickLimitAngle	= prop.ls or cam_ect[cam].LookStickLimitAngle
end

for _,follow in pairs(cam_ect) do
	if type(follow) == 'table' and follow.meta[2] == 'GcCameraFollowSettings.xml' then
		follow.CenterStartTime	= 42
		follow.VertRotationMin	= -80
		follow.VertRotationMax	= 80
	end
end

for _,aerial in ipairs(cam_ect.AerialViewDataTable) do
	aerial.CameraAerialViewData.Time		= 0
	aerial.CameraAerialViewData.PauseTime	= 0
	aerial.CameraAerialViewData.TimeBack	= 0
end

cam_ect.VehicleExitFlashTime				= 0.5	-- 0.8		361
cam_ect.VehicleExitFlashStrength			= 0.5	-- 0.8
cam_ect.BinocularFlashTime					= 0.12	-- 0.24
cam_ect.BinocularFlashStrength				= 0.4	-- 0.9
cam_ect.MechCameraArmShootOffsetY			= 2		-- 1
cam_ect.InteractionHeadHeightDefault		= 1.5	-- 1.65		3313
cam_ect.PhotoModeVelocitySmoothTime			= 1.5	-- 0.5
cam_ect.PhotoModeMoveSpeed					= 14	-- 11
cam_ect.PhotoModeTurnSpeed					= 22	-- 60
cam_ect.PhotoModeMaxDistance				= 1200	-- 150
cam_ect.PhotoModeMaxDistanceSpace			= 5500	-- 200
cam_ect.PhotoModeRollSpeed					= 35	-- 45
cam_ect.BuildingModeMaxDistance				= 1500	-- 60
cam_ect.MechCamSpringStrengthMin			= 0.1	-- 0.6
cam_ect.MechCamSpringStrengthMax			= 0.1	-- 0.6
cam_ect.ModelViewMouseRotateSpeed			= 1.2	-- 1.6	-- inventory models
cam_ect.ModelViewMouseRotateSnapStrength	= 0.38	-- 0.94
cam_ect.BobAmountAbandFreighter				= 0.08	-- 0.1		6129
cam_ect.FirstPersonCamHeight				= 0.79	-- 0.85


for _,warp in ipairs({
	'WarpSettings',
	'FreighterWarpSettings',
	'PirateFreighterWarpSettings'
}) do
	cam_ect[warp].OffsetYStartBias = cam_ect[warp].OffsetYStartBias + 8
	cam_ect[warp].OffsetZStartBias = cam_ect[warp].OffsetZStartBias + 66
end

cam_ect.VehicleExitFlashColour.R = 0.08
cam_ect.VehicleExitFlashColour.G = 0.08
cam_ect.VehicleExitFlashColour.B = 0.16
cam_ect.VehicleExitFlashColour.A = 0.5 
