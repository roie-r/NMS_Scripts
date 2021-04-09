--[[┎────────────────────────────────────────────────────────────────
	┃ Decrease hostile predator chance; increase creature distance
	┃ Increase harvet yield;
────┸────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC CRAETURES.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.35',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
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
					{'CreatureRidingMedMinSize',		-2},	-- 5
					{'CreatureRidingLargeMinSize',		-4},	-- 12
					{'CreatureRidingHugeMinSize',		-8},	-- 20
					{'RideSpeedSlow', 					0.7},	-- 0.5
					{'RideSpeedFast',					1},		-- 2
					{'TurnRadiusMultiplier',			-0.2},	-- 1
					{'PetMaxTurnRad',					-0.3},	-- 1
					{'PetMaxSizeOffPlanet',				0.5},	-- 1
					{'PetTeleportDistOnPlanet',			-30},	-- 150
				}
			},
			{
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'CreatureHarvestAmountSmall',		2}, 	-- 1
					{'CreatureHarvestAmountMed',		2}, 	-- 1
					{'CreatureHarvestAmountLarge',		2}, 	-- 2
					{'CreatureHarvestAmountHuge',		2},		-- 3
					{'PetGrowthTime',					0.5},	-- 1209600 (14d)
					{'PetIncubationTime',				0.33},	-- 86400 (24h)
					{'PetEggLayingInterval',			0.5},	-- 86400
					{'PetEggFirstEggDelay',				0.5}	-- 86400
				}
			}
		}
	}
}}}}
