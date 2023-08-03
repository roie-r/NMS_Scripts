-----------------------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/scene_tools.lua')
-----------------------------------------------------------------------------------------
mod_desc = [[
  - Add the weapons upgrade menu to the base weapons master terminal
   copied from: MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/ ..
   WEAPONSHOP/ENTITIES/WEAPONSUPGRADETERMINAL.ENTITY.MBIN
  - Add the ship upgrade menu to the nexus orb stand
  - Add hazard protection and a small light to beacon, cooker and signal booster (cheat)
  - Increase freighter extractor storage capacity
]]---------------------------------------------------------------------------------------

local build_parts = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL tech additions.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,UNUSED_VARIABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|multitool upgrade menu|
		MBIN_FILE_SOURCE	= build_parts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAPON5SPIN.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Components',
				ADD					= ToExml({
					{
						META	= {'value', 'GcInteractionComponentData.xml'},
						{
							META	= {'InteractionType', 'GcInteractionType.xml'},
							InteractionType	= 'WeaponUpgrade'
						},
						InteractionAction				= 'PressButton',
						AttractDistanceSq				= 9,
						BlendToCameraTime				= 0.5,
						BlendFromCameraTime				= -1,
						InteractAngle					= 360,
						InteractDistance				= 3,
						SecondaryCameraTransitionTime	= 1
					},
					-- component stub
					{value = 'TkPhysicsComponentData.xml'}
				})
			}
		}
	},
	{--	|ship upgrade menu|
		MBIN_FILE_SOURCE	= build_parts..'DECORATION/NEXUSORBPILLAR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'DATA'},
				INTEGER_TO_FLOAT	= 'Force',
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.7}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	build_parts..'TECH/OBJECTSPAWNER/ENTITIES/SHIPSALVAGETERMINAL.ENTITY.MBIN'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			{
				build_parts..'SPACEBASE/PROPS/STANDINGLIGHT_SMALL/ENTITIES/HEATER.ENTITY.MBIN',
				build_parts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN',
				'REMOVE'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= build_parts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'VolumeTriggerType', 'HazardProtection'}
				}
			}
		}
	},
	{--	add |antenna0 scanner| entity
		MBIN_FILE_SOURCE	= build_parts..'DECORATION/BAZAAR/ANTENNA0.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	build_parts..'TECH/SIGNALSCANNER/ENTITIES/SIGNALSCANNER.ENTITY.MBIN'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			build_parts..'TECH/BEACON.SCENE.MBIN',
			build_parts..'TECH/COOKER.SCENE.MBIN',
			build_parts..'DECORATION/BAZAAR/ANTENNA0.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				SECTION_ACTIVE		= -1,
				ADD 				= ToExml({
					[1] = ScNode(
						'ShieldSphere', 'LOCATOR', {
							ScTransform(),
							ScAttributes({ {'ATTACHMENT', build_parts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN'} }),
							ScChildren({
								ScNode(
									'HeaterCollision', 'COLLISION', {
										ScTransform(),
										ScAttributes({
											{'TYPE',	'Sphere'},
											{'RADIUS',	8}
										})
									}
								)
							})
						}
					),
					[2] = ScLight({name='redlight', ty=1.8, i=20000, c='ffc73347', fr=3.8})
				})
			}
		}
	},
	{--	|freighter extractor| capacity
		MBIN_FILE_SOURCE	= build_parts..'FREIGHTERBASE/ROOMS/EXTRROOM/PARTS/FLOOR0/ENTITIES/EXTRACTORTERMINAL.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_MATCH			= 1,
				VALUE_MATCH_TYPE	= 'Number',
				VALUE_MATCH_OPTIONS = '>',
				VALUE_CHANGE_TABLE 	= {
					{'MaxCapacity',	10000}
				}
			}
		}
	}
}}}}
