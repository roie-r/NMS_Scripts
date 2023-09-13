---------------------------------------------------
dofile('LIB/lua_2_exml.lua')
---------------------------------------------------
mod_desc = [[
  open staff build page from the quickmenu
]]-------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__Open Staff build page hotkey.pak',
	MOD_AUTHOR			= 'lMonk',
	MOD_DESCRIPTION		= mod_desc,
	NMS_VERSION			= '4.44',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Anim', '0H_TURN_L'},
				SECTION_SAVE_TO		= 'tk_animation_data'
			},
			{
				SECTION_EDIT 		= 'tk_animation_data',
				VALUE_CHANGE_TABLE 	= {
					{'Anim', 'STAFF_IT_PAGE'},
					{'Filename', 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/EMOTES/NULL.ANIM.MBIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Anim', '0H_GREET_MOB_04', 'Filename', 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/INTERACTION/GENERAL/0H_INTER_GREET_07.ANIM.MBIN'},
				ADD_OPTION			= 'AddAfterSection',
				SECTION_ADD_NAMED 	= 'tk_animation_data'
			},
			{
				PRECEDING_KEY_WORDS	= 'GcCombatEffectsComponentData.xml',
				ADD_OPTION			= 'ADDAfterSection',
				ADD 				= ToExml({
					META = {'value', 'GcTriggerActionComponentData.xml'},
					{
						META = {'name', 'States'},
						{
							META	= {'value', 'GcActionTriggerState.xml'},
							StateID	= 'BOOT',
							{
								META = {'name', 'Triggers'},
								{
									META = {'value', 'GcActionTrigger.xml'},
									{
										META	= {'Event', 'GcAnimFrameEvent.xml'},
										Anim	= 'STAFF_IT_PAGE'
									},
									{
										META	= {'name', 'Action'},
										{
											META	= {'value', 'GcGoToStateAction.xml'},
											State	= 'STAFF_IT_PAGE'
										}
									}
								}
							}
						},
						{
							META	= {'value', 'GcActionTriggerState.xml'},
							StateID	= 'STAFF_IT_PAGE',
							{
								META = {'name', 'Triggers'},
								{
									META = {'value', 'GcActionTrigger.xml'},
									{
										META	= {'Event', 'GcStateTimeEvent.xml'},
										Seconds	= 0
									},
									{
										META	= {'name', 'Action'},
										{
											META	= {'value', 'GcRewardAction.xml'},
											Reward	= 'R_STAFF_PAGE'
										},
										{
											META	= {'value', 'GcGoToStateAction.xml'},
											State	= 'BOOT'
										}
									}
								}
							}
						}
					}
				})
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/EMOTEMENU.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Title', 'EMOTE_WAVE'},
				SECTION_SAVE_TO		= 'gc_player_emote'
			},
			{
				SECTION_EDIT 		= 'gc_player_emote',
				VALUE_CHANGE_TABLE 	= {
					{'Title',					'Open Staff Build'},
					{'EmoteID',					'STAFF_IT_PAGE'},
					{'AnimationName',			'STAFF_IT_PAGE'},
					{'Filename',				'TEXTURES/UI/FRONTEND/ICONS/ROBOTPARTS/ROBOTPARTS.STAFFCORE.1.DDS'},
					{'MoveToCancel',			false},
					{'AvailableUnderwater',		true}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Emotes',
				SECTION_ADD_NAMED 	= 'gc_player_emote'
			},
			{
				SECTION_EDIT 		= 'gc_player_emote',
				VALUE_CHANGE_TABLE 	= {
					{'AvailableUnderwater',		false}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Emotes',
				SECTION_ADD_NAMED 	= 'gc_player_emote'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/EFFECTS/ENGINES/SPEEDCOOL.ANIM.MBIN',
				'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/EMOTES/NULL.ANIM.MBIN',
				'REMOVE'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/EMOTES/NULL.ANIM.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'FrameCount',	10}
				}
			}
		}
	}
}}}}