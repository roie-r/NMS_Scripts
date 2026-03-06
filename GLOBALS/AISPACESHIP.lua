----------------------------------------------
local mod_desc = [[
  squadron formation & battle tweaks;
  freighter summon delay
]]--------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ GC aispaceship',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCAISPACESHIPGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'FormationOffsetZOffsetVarianceMaxSpeedScale',		80	},	-- 150
					{'FormationOffsetCylinderWidth',					60	},	-- 80
					{'FormationOffsetCylinderHeight',					28	},	-- 40
					{'FormationOffsetCylinderLength',					8	},	-- 10
					{'CombatFormationOffsetCylinderWidth',				160	},	-- 80
					{'CombatFormationOffsetCylinderHeight',				80	},	-- 40
					{'CombatFormationOffsetCylinderLength',				24	},	-- 10
					{'CombatFormationOffsetCylinderWidthThirdPerson',	160	},	-- 75
					{'CombatFormationOffsetCylinderHeightThirdPerson',	70	},	-- 40
					{'CombatFormationOffsetCylinderLengthThirdPerson',	24	},	-- 5
					{'MaintainFormationInCombatMinTime',				3	},	-- 10
					{'MaintainFormationInCombatMaxTime',				12	},	-- 20
					{'MaintainFormationLockStrengthCombat',				1.5	},	-- 4.5
					{'OutOfFormationMinTime',							2	},	-- 8
					{'OutOfFormationMaxTime',							32	},	-- 16
					{'PoliceStationEngageRange',						6000},	-- 10000
					{'PoliceStationNumToLaunch',						3	},	-- 9
					{'AbandonedSystemShipSpawnProbablity',				0.05},	-- 0
					{'FlybyHeight',										200	},	-- 120
					{'FlybyOffset',										360	},	-- 320
					{'FlybyCloseOdds',									35	},	-- 20
					{'FreighterSpawnViewAngle',							60	},	-- 30
					{'TradeRouteFlickerFreq',							0	},
					{'TradeRouteFlickerAmp',							0	},
					{'WarpInTimeFreighter',								2	},	-- 0.6
				}
			}
		}
	}
}}}}
