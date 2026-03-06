-----------------------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
-----------------------------------------------------------------------------------------
local mod_desc = [[
  Buildable Base Parts Additions:
  - add suit inventory slots page to the toy sphere (from CRYOCHAMBERINTERACTION)
   * purchases only instead of using tokens (something to do with the trigger)
  - add teleporter menu to galaxy toy
  - Add the multitool upgrade menu to the base weapons master terminal
  - Add multitool salvage to the base weapons master terminal
   * copied from: MODELS/SPACE/SPACESTATION/MODULARPARTS/DOCK/SHOPS/ ..
     WEAPONSHOP/ENTITIES/WEAPONSUPGRADETERMINAL.ENTITY.MBIN
  - Add the ship upgrade menu to the nexus orb stand
  - Add hazard protection and a small light to beacon, cooker (cheat)
  - Fix fishing skiff hazard protection
  - Add access to fish storage from cooker
  - Increase freighter extractor storage capacity
  - Spin the wirecube, beam, and engine glitch items
  - open staff building page from the utopia weapon research unit
]]---------------------------------------------------------------------------------------

local buildparts = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/'

-- interaction button attachment; full mbin or component only
local function InteractEntity(action, full_entity)
	local interact = {
		meta = {name='Components', value='GcInteractionComponentData'},
		{
			meta = {name='GcInteractionComponentData'},
			InteractionAction = 'PressButton',
			InteractionType = {
				meta = {name='InteractionType', value='GcInteractionType'},
				InteractionType = action
			},
			AttractDistanceSq	= 9,
			InteractAngle		= 360,
			InteractDistance	= 5,
		}
	}
	if full_entity then
		return ToMxmlFile({
			meta = {template='cTkAttachmentData'},
			Components = {
				meta = {name='Components'},
				interact,
				physics = {
					meta = {name='Components', value='TkPhysicsComponentData'},
					{name='TkPhysicsComponentData'}
				}
			}
		})
	else
		return interact
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ MODEL base tech additions',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	open |suit inv upgrade| with toy sphere
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/TOY_SPHERE/ENTITIES/TOY_SPHERE.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Components', 'GcSimpleInteractionComponentData'},
				PRECEDING_KEY_WORDS	= 'GcSimpleInteractionComponentData',
				VALUE_CHANGE_TABLE 	= {
					{'Name',		'INTRCT_SUITTERMINAL'}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Components',
				ADD					= ToMxml(InteractEntity('SuitTerminal'))
			}
		}
	},
	{--	|galaxy |toy open teleporter| menu
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/TOY_CORE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/COMMONPARTS/TELEPORTER_NEXUS/ENTITIES/TELEPORTERNEXUSINTERACTION.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	|multitool salvage base|
		MBIN_FILE_SOURCE	= buildparts..'NPCROOMS/NPC_WEAPONS.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Workstation'},
				PRECEDING_KEY_WORDS = 'Children',
				ADD					= AddSceneNodes({
						name	= 'WeapSalvage',
						ntype	= 'LOCATOR',
						form	= {tx=-1, ty=1.1, tz=1.6},
						attr	= {ATTACHMENT = buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAP_SALVAGE.ENTITY.MBIN'},
						child	= {
							name	= 'WeapSalvageCol',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.2
							}
						}
					}
				)
			}
		}
	},
	{--	|multitool salvage freighter|
		MBIN_FILE_SOURCE	= buildparts..'FREIGHTERBASE/ROOMS/NPCWEAROOM/PARTS/FLOOR0.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Workstation'},
				ADD_OPTION			= 'AddAfterSection',
				ADD					= AddSceneNodes({
						name	= 'WeapSalvage',
						ntype	= 'LOCATOR',
						form	= {ty=0.5, tz=-1.5},
						attr	= {ATTACHMENT = buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAP_SALVAGE.ENTITY.MBIN'},
						child	= {
							name	= 'WeapSalvageCol',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.2
							}
						}
					}
				)
			},
		}
	},
	{--	|multitool upgrade menu|
		MBIN_FILE_SOURCE	= buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAPON5SPIN.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Components',
				ADD					= ToMxml({
					InteractEntity('WeaponUpgrade'),
					Physics = {
						meta = {name='Components', value='TkPhysicsComponentData'},
						{name='TkPhysicsComponentData'}
					}
				})
			}
		}
	},
	{--	|ship upgrade menu|
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/NEXUSORBPILLAR.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Data'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.7}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	buildparts..'SHAREDDATA/ENTITIES/SHIP_SALVAGE.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	|staff build page| with the utopia weapon tech unit
		MBIN_FILE_SOURCE	= buildparts..'TECH/BLUEPRINTANALYSER_WEAP.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Data', 'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	buildparts..'SHAREDDATA/ENTITIES/ROBOT_SHOP.ENTITY.MBIN'},
				}
			}
		}
	},
	{--	heater entity
		MBIN_FILE_SOURCE	= {
			{
				buildparts..'SPACEBASE/PROPS/STANDINGLIGHT_SMALL/ENTITIES/HEATER.ENTITY.MBIN',
				buildparts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN',
				'REMOVE'
			}
		}
	},
	{--	heater entity
		MBIN_FILE_SOURCE	= buildparts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'VolumeTriggerType', 'HazardProtection'}
				}
			}
		}
	},
	{--	|tech hazard protection|
		MBIN_FILE_SOURCE	= {
			buildparts..'TECH/BEACON.SCENE.MBIN',
			buildparts..'TECH/COOKER.SCENE.MBIN',
		},
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= ToMxml({
					ScNode({
						name	= 'LocProtectSphere',
						ntype	= 'LOCATOR',
						attr	= {ATTACHMENT = buildparts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN'},
						child	= {
							name	= 'ColProtectSphere',
							ntype	= 'COLLISION',
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 8
							}
						}
					}),
					ScLight({name='redlight', ty=1.8, i=4, rd=2, c='ffc73347'})
				})
			}
		}
	},
	{--	|skiff hazard protection|
		MBIN_FILE_SOURCE	= buildparts..'TECH/FISHINGPLATFORM.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'HazardProtection'},
				PRECEDING_KEY_WORDS	= 'Children',
				CREATE_HOS			= true,
				ADD 				= AddSceneNodes({
					name	= 'HazardCollision',
					ntype	= 'COLLISION',
					form	= {ty=2.6},
					attr	= {
						TYPE	= 'Sphere',
						RADIUS	= 2.2
					}
				})
			}
		}
	},
	{--	|skiff scan icon|
		MBIN_FILE_SOURCE	= buildparts..'TECH/FISHINGPLATFORM/ENTITIES/FISHINGPLATFORM.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Components', 'GcScannableComponentData'},
				VALUE_CHANGE_TABLE 	= {
					{'ScanIconType',	'FishPlatform'},
					-- {'ScannableType',	'Marker'}
				}
			}
		}
	},
	{--	access fish storage from |fish flask|
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/BAZAAR/MILKBOTTLE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'LocFishBottle',
					ntype	= 'LOCATOR',
					attr	= {ATTACHMENT = buildparts..'TECH/FISHINGPLATFORM/ENTITIES/FISHCASES.ENTITY.MBIN'},
					child	= {
						{
							name	= 'FishBottleCollision',
							ntype	= 'COLLISION',
							form	= {ty=0.15},
							attr	= {
								TYPE	= 'Sphere',
								RADIUS	= 0.2
							}
						}
					}
				})
			}
		}
	},
	{--	|cook fish| access fish storage from cooker
		MBIN_FILE_SOURCE	= buildparts..'TECH/COOKER.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'DEPTH'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		1.2}
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= AddSceneNodes({
					name	= 'RefFishBottle',
					ntype	= 'REFERENCE',
					form	= {tx=-0.72, ty=0.785, tz=0.62, sl=0.8},
					attr	= {SCENEGRAPH = buildparts..'DECORATION/BAZAAR/MILKBOTTLE.SCENE.MBIN'}
				})
			}
		}
	},
	{--	|freighter extractor| capacity
		MBIN_FILE_SOURCE	= buildparts..'FREIGHTERBASE/ROOMS/EXTRROOM/PARTS/FLOOR0/ENTITIES/EXTRACTORTERMINAL.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'MaintenanceData', 'GcMaintenanceComponentData'},
				VALUE_MATCH			= '1',
				VALUE_MATCH_OPTIONS = '~=',
				VALUE_CHANGE_TABLE 	= {
					{'MaxCapacity',	10000}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'STELLAR2'},
				VALUE_CHANGE_TABLE 	= {
					{'Id', 'ROCKETSUB'}
				}
			}
		}
	},
	{--	|rotating foliage beamstone|
		MBIN_FILE_SOURCE	= buildparts..'FOLIAGE/BEAMSTONE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'BeamStone'},
				PRECEDING_KEY_WORDS	= 'Attributes',
				ADD 				= ToMxml(ScAttribute('ATTACHMENT', 'MODELS/COMMON/SHARED/ENTITIES/SPIN01.ENTITY.MBIN'))
			}
		}
	},
	{--	|rotating foliage weirdcube|
		MBIN_FILE_SOURCE	= buildparts..'FOLIAGE/WEIRDCUBE.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'CuboidSmallLOD0'},
				PRECEDING_KEY_WORDS	= 'Attributes',
				ADD 				= ToMxml(ScAttribute('ATTACHMENT', 'MODELS/COMMON/SHARED/ENTITIES/SPIN01.ENTITY.MBIN'))
			}
		}
	},
	{--	|rotating foliage engineorb|
		MBIN_FILE_SOURCE	= buildparts..'FOLIAGE/ENGINEORB.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Orb_LOD0'},
				PRECEDING_KEY_WORDS	= 'Attributes',
				ADD 				= ToMxml(ScAttribute('ATTACHMENT', 'MODELS/COMMON/SHARED/ENTITIES/SPIN01.ENTITY.MBIN'))
			}
		}
	},
}}},
	ADD_FILES	= {
		{
			FILE_DESTINATION = buildparts..'SHAREDDATA/ENTITIES/ROBOT_SHOP.ENTITY.MXML',
			FILE_CONTENT	 = InteractEntity('RobotShop', true)
		},
		{
			FILE_DESTINATION = buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAP_SALVAGE.ENTITY.MXML',
			FILE_CONTENT	 = InteractEntity('WeaponSalvage', true)
		},
		{
			FILE_DESTINATION = buildparts..'SHAREDDATA/ENTITIES/SHIP_SALVAGE.ENTITY.MXML',
			FILE_CONTENT	 = InteractEntity('ShipSalvage', true)
		},
		{
			FILE_DESTINATION = 'MODELS/COMMON/SHARED/ENTITIES/SPIN01.ENTITY.MXML',
			FILE_CONTENT	 = ToMxmlFile({
				meta = {template='cTkAttachmentData'},
				Components = {
					meta = {name='Components'},
					{
						meta = {name='Components', value='TkRotationComponentData'},
						TkRotationComponentData = {
							meta = {name='TkRotationComponentData'},
							Speed = 0.05,
							Axis = {
								meta = {name='Axis'},
								Y = 1
							},
							AlwaysUpdate = true,
							SyncGroup = -1
						}
					}
				},
				LodDistances = {
					meta = {name='LodDistances'},
					0,
					50,
					80,
					150,
					500
				}
			})
		}
	}
}
