--------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+  TEST 6 black box',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.7',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DISTRESSSIGNAL/PARTS/BLACKBOX/ENTITIES/BLACKBOX.ENTITY.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'Components',
				ADD 				= ToMxml({
					{
						meta	= {'value', 'GcScannableComponentData.xml'},
						ScanName					= 'SIGNAL_DISTRESS',
						ScanTime					= 30,
						CompassRangeMultiplier		= 1,
						AlwaysShowRange				= 3000,
						CanTagIcon					= true,
						ClearTagOnArrival			= true,
						{
							meta	= {'Icon', 'GcScannerIconTypes.xml'},
							ScanIconType			= 'FreighterHeater',
						},
						ScannableType				= 'Binoculars',
						MinDisplayDistanceOverride	= 10
					},
					{
						meta	= {'value', 'GcShootableComponentData.xml'},
						Health						= 2500,
						ImpactShake					= true,
						ImpactShakeEffect			= 'SHOOTABLESHAKE',
						IncreaseWantedThresholdTime	= 0.5,
						FiendCrimeModifier			= 1,
						RepairTime					= 8,
						IgnoreHitPush				= true
					},
					{
						meta	= {'value', 'GcDestructableComponentData.xml'},
						Explosion					= 'ROCKEXPLODE',
						ExplosionScale				= 1,
						VehicleDestroyEffect		= 'VEHICLECRASH',
						IncreaseFiendWantedChance	= 1,
						LootRewardAmountMin			= 50,
						LootRewardAmountMax			= 50,
						RemoveModel					= true,
						DestroyedModelUsesScale		= true,
						DestroyForce				= 10,
						DestroyForceRadius			= 50,
						DestroyEffectPoint			= 'SFX',
						DestroyEffectTime			= 2,
						ShowInteract				= true,
						ShowInteractRange			= 8,
						GrenadeSingleHit			= true
					}
				})
			}
		}
	}
}}}}
