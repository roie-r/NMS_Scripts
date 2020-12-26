--[[┎────────────────────────────────────────────────────────────────
	┃ Decrease hostile predator chance; increase creature distance
────┸────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC CRAETURES.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.13',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MOD_DESCRIPTION		= 'U',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCCREATUREGLOBALS.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				VALUE_CHANGE_TABLE 	= {
					{'RepelRange',						-3},	-- 5
					{'WeaponRepelRange',				-16},	-- 18
					{'WeaponRepelAmount',				-1},	-- 2
					{'PercentagePlayerPredators',		-0.25},	-- 0.5
					{'PlayerPredatorBoredomDistance',	-10},	-- 80
					{'PredatorRegainInterestTime',		10},	-- 30
					{'SpawnOnscreenDist',				20},	-- 100
					{'RidingTurnRadiusMultiplier',		-0.5},	-- 1
					{'FadeDistance',					20},	-- 10
					{'MinFade',							25},	-- 30
					{'CreatureHarvestAmountSmall',		1}, 	-- 1
					{'CreatureHarvestAmountMed',		1}, 	-- 1
					{'CreatureHarvestAmountLarge',		2}, 	-- 2
					{'CreatureHarvestAmountHuge',		2}		-- 3
				}
			}
		}
	}
}}}}
