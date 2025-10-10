dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/scene_tools.lua')
--------------------------------------------------------------------------------
local mod_desc = [[
  Access the upgrade menus at your base/freighter.
  The multitool upgrade and salvage menus from the weapons specialist terminal.
  The ship salavage and upgrade menu from the old monitor station.
]]------------------------------------------------------------------------------
--<<M2L marker>>--

-- interaction button attachment; full mbin or component only
local function InteractEntity(action, full_entity)
	local interact = {
		meta = {name='Components', value='GcInteractionComponentData'},
		{
			meta = {name='value', value='GcInteractionComponentData'},
			InteractionAction = 'PressButton',
			InteractionType = {
				meta = {name='InteractionType', value='GcInteractionType'},
				InteractionType = action
			},
			AttractDistanceSq	= 9,
			InteractAngle		= 360,
			InteractDistance	= 5
		}
	}
	if full_entity then
		return ToMxmlFile({
			meta = {template='cTkAttachmentData'},
			Components = {
				meta = {name='Components'},
				Interaction	= interact,
				Physics		= {
					meta = {name='Components', value='TkPhysicsComponentData'},
					{name='TkPhysicsComponentData'}
				}
			}
		})
	else
		return interact
	end
end

local buildparts = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.ship and multitool upgrade terminals',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,MIXED_TABLE',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|ship upgrade menu|
		MBIN_FILE_SOURCE	= buildparts..'DECORATION/NEXUSORBPILLAR.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'DATA'},
				VALUE_CHANGE_TABLE 	= {
					{'TransY',		0.7}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'ATTACHMENT'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',	buildparts..'TECH/OBJECTSPAWNER/ENTITIES/SHIPSALVAGETERMINAL.ENTITY.MBIN'}
				}
			}
		}
	},
	{--	|multitool upgrade menu|
		MBIN_FILE_SOURCE	= buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAPON5SPIN.ENTITY.MBIN',
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
	{--	|multitool salvage base|
		MBIN_FILE_SOURCE	= buildparts..'NPCROOMS/NPC_WEAPONS.SCENE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'Workstation'},
				PRECEDING_KEY_WORDS = 'Children',
				ADD					= ToMxml(
					ScNode({
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
					})
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
				ADD					= ToMxml(
					ScNode({
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
					})
				)
			},
		}
	}
}}},
	ADD_FILES	= {
		{
			FILE_DESTINATION = buildparts..'NPCROOMS/NPC_WEAPONS/ENTITIES/WEAP_SALVAGE.ENTITY.MXML',
			FILE_CONTENT	 = InteractEntity('WeaponSalvage', true)
		}
	}
}