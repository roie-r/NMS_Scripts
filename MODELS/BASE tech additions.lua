-----------------------------------------------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
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
  - Add hazard protection and a small light to beacon, cooker and signal booster (cheat)
  - Increase freighter extractor storage capacity
  - Spin the wirecube, beam, and engine glitch items
  - open staff building page from the utopia weapon research unit
]]---------------------------------------------------------------------------------------

local buildparts = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/'

-- interaction button attachment
-- component only; needs the template container for a file
local function InteractComponent(action)
	return {
		META = {'value','GcInteractionComponentData.xml'},
		InteractionAction	= 'PressButton',
		InteractionType		= {
			META = {'InteractionType','GcInteractionType.xml'},
			InteractionType	= action
		},
		AttractDistanceSq	= 9,
		InteractAngle		= 360,
		InteractDistance	= 5
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL base tech additions.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.64',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	open |suit page| with toy
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/TOY_SPHERE/ENTITIES/TOY_SPHERE.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'GcSimpleInteractionComponentData.xml',
				VALUE_CHANGE_TABLE 	= {
					{'Name',		'INTRCT_SUITTERMINAL'}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Components',
				ADD					= ToExml(InteractComponent('SuitTerminal'))
			}
		}
	},
	{--	|add teleporter| menu to galaxy toy
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/TOY_CORE.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT' },
				VALUE_CHANGE_TABLE 	= {
					{'Value', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/COMMONPARTS/TELEPORTER_NEXUS/ENTITIES/TELEPORTERNEXUSINTERACTION.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	|multitool salvage base|
		MBIN_FILE_SOURCE	= buildparts..'NPCROOMS/NPC_WEAPONS.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Workstation'},
				PRECEDING_KEY_WORDS = 'Children',
				ADD					= ToExml(
					ScNode({
						name	= 'WeapSalvage',
						stype	= 'LOCATOR',
						form	= {tx=-1, ty=1.1, tz=1.6},
						attr	= {
							{'ATTACHMENT', buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAP_SALVAGE.ENTITY.MBIN'}
						},
						child	= {
							ScNode({
								name	= 'WeapSalvageCol',
								stype	= 'COLLISION',
								attr	= {
									{'TYPE',	'Sphere'},
									{'RADIUS',	0.2}
								}
							})
						}
					})
				)
			}
		}
	},
	{--	|multitool salvage freighter|
		MBIN_FILE_SOURCE	= buildparts..'FREIGHTERBASE/ROOMS/NPCWEAROOM/PARTS/FLOOR0.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Workstation'},
				ADD_OPTION			= 'AddAfterSection',
				ADD					= ToExml(
					ScNode({
						name	= 'WeapSalvage',
						stype	= 'LOCATOR',
						form	= {ty=0.5, tz=-1.5},
						attr	= {
							{'ATTACHMENT', buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAP_SALVAGE.ENTITY.MBIN'}
						},
						child	= {
							ScNode({
								name	= 'WeapSalvageCol',
								stype	= 'COLLISION',
								attr	= {
									{'TYPE',	'Sphere'},
									{'RADIUS',	0.2}
								}
							})
						}
					})
				)
			},
		}
	},
	{--	|multitool upgrade menu|
		MBIN_FILE_SOURCE	= buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAPON5SPIN.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Components',
				ADD					= ToExml({
					InteractComponent('WeaponUpgrade'),
					{value = 'TkPhysicsComponentData.xml'}
				})
			}
		}
	},
	{--	|ship upgrade menu|
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/NEXUSORBPILLAR.SCENE.MBIN',
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
					{'Value',	buildparts..'SHAREDDATA/ENTITIES/SHIP_SALVAGE.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	|ship salvage| with the utopia ship tech unit
		MBIN_FILE_SOURCE	= buildparts..'TECH/BLUEPRINTANALYSER_SHIP.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Data', 'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	buildparts..'SHAREDDATA/ENTITIES/SHIP_SALVAGE.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	|staff build page| with the utopia weapon tech unit
		MBIN_FILE_SOURCE	= buildparts..'TECH/BLUEPRINTANALYSER_WEAP.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Data', 'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	buildparts..'SHAREDDATA/ENTITIES/ROBOT_SHOP.ENTITY.MBIN'},
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			{
				buildparts..'SPACEBASE/PROPS/STANDINGLIGHT_SMALL/ENTITIES/HEATER.ENTITY.MBIN',
				buildparts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN',
				'REMOVE'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= buildparts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'VolumeTriggerType', 'HazardProtection'}
				}
			}
		}
	},
	{--	add |antenna0 scanner| entity
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/BAZAAR/ANTENNA0.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	buildparts..'TECH/SIGNALSCANNER/ENTITIES/SIGNALSCANNER.ENTITY.MBIN'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			buildparts..'TECH/BEACON.SCENE.MBIN',
			buildparts..'TECH/COOKER.SCENE.MBIN',
			buildparts..'DECORATION/BAZAAR/ANTENNA0.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				SECTION_ACTIVE		= -1,
				ADD 				= ToExml({
					ScNode({
						name	= 'ShieldSphere',
						stype	= 'LOCATOR',
						attr	= { {'ATTACHMENT', buildparts..'TECH/BEACON/ENTITIES/HEATER.ENTITY.MBIN'} },
						child	= {
							ScNode({
								name	= 'HeaterCollision',
								stype	= 'COLLISION',
								attr	= {
									{'TYPE',	'Sphere'},
									{'RADIUS',	8}
								}
							})
						}
					}),
					ScLight({name='redlight', ty=1.8, i=20000, c='ffc73347', fr=3.8})
				})
			}
		}
	},
	{--	|freighter extractor| capacity
		MBIN_FILE_SOURCE	= buildparts..'FREIGHTERBASE/ROOMS/EXTRROOM/PARTS/FLOOR0/ENTITIES/EXTRACTORTERMINAL.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_MATCH			= 1,
				VALUE_MATCH_TYPE	= 'Number',
				VALUE_MATCH_OPTIONS = '>',
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
	{--	|rotating foliage|
		MBIN_FILE_SOURCE	= {
			buildparts..'FOLIAGE/WEIRDCUBE.SCENE.MBIN',
			buildparts..'FOLIAGE/BEAMSTONE.SCENE.MBIN',
			buildparts..'FOLIAGE/ENGINEORB.SCENE.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Attributes',
				ADD 				= ToExml({
					META	= {'value', 'TkSceneNodeAttributeData.xml'},
					Name	= 'ATTACHMENT',
					Value	= 'MODELS/COMMON/SHARED/ENTITIES/SPIN01.ENTITY.MBIN'
				})
			}
		}
	}
}}},
	ADD_FILES	= {
		{
			FILE_DESTINATION = buildparts..'SHAREDDATA/ENTITIES/ROBOT_SHOP.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping({
				META = {'template','TkAttachmentData'},
				Components = {
					META = {'name','Components'},
					Interaction	= (InteractComponent('RobotShop')),
					{value = 'TkPhysicsComponentData.xml'}
				}
			})
		},
		{
			FILE_DESTINATION = buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAP_SALVAGE.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping({
				META = {'template','TkAttachmentData'},
				Components = {
					META = {'name','Components'},
					Interaction	= (InteractComponent('WeaponSalvage')),
					{value = 'TkPhysicsComponentData.xml'}
				}
			})
		},
		{
			FILE_DESTINATION = buildparts..'SHAREDDATA/ENTITIES/SHIP_SALVAGE.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping({
				META = {'template','TkAttachmentData'},
				Components = {
					META = {'name','Components'},
					Interaction	= (InteractComponent('ShipSalvage')),
					{value = 'TkPhysicsComponentData.xml'}
				}
			})
		},
		{
			FILE_DESTINATION = 'MODELS/COMMON/SHARED/ENTITIES/SPIN01.ENTITY.EXML',
			FILE_CONTENT	 = FileWrapping({
				META = {'template', 'TkAttachmentData'},
				Components = {
					META = {'name', 'Components'},
					Rotation = {
						META  = {'value', 'TkRotationComponentData.xml'},
						Speed = 0.01,
						Axis  = {
							META = {'Axis', 'Vector3f.xml'},
							y = 1
						},
						AlwaysUpdate = true,
						SyncGroup    = -1
					}
				},
				LodDistances = {
					META = {'name','LodDistances'},
					{value	= 0},
					{value	= 50},
					{value	= 80},
					{value	= 150},
					{value	= 500}
				}
			})
		}
	}
}
