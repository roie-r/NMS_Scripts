---------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
---------------------------------------------------
local mod_desc = [[
  open staff build page from the quickmenu
]]-------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__Open Staff build page hotkey.pak',
	MOD_AUTHOR			= 'lMonk',
	MOD_DESCRIPTION		= mod_desc,
	NMS_VERSION			= '4.72',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = {'Anims', 'TkAnimationData.xml'},
				SEC_SAVE_TO			= 'tk_animation_data'
			},
			{
				SEC_EDIT 			= 'tk_animation_data',
				VALUE_CHANGE_TABLE 	= {
					{'Anim',		'STAFF_IT_PAGE'},
					{'Filename',	'MODELS/TESTS/EFFECTTEST.ANIM.MBIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Anim', '2H_STAFF_WALK'},
				ADD_OPTION			= 'ADDAfterSection',
				SEC_ADD_NAMED		= 'tk_animation_data'
			},
			{
				PRECEDING_KEY_WORDS	= 'GcSpringAttachmentComponentData.xml',
				ADD_OPTION			= 'ADDAfterSection',
				ADD 				= ToExml({
					meta = {'value', 'GcTriggerActionComponentData.xml'},
					{
						meta = {'name', 'States'},
						{
							meta	= {'value', 'GcActionTriggerState.xml'},
							StateID	= 'BOOT',
							{
								meta = {'name', 'Triggers'},
								{
									meta = {'value', 'GcActionTrigger.xml'},
									{
										meta	= {'Event', 'GcAnimFrameEvent.xml'},
										Anim	= 'STAFF_IT_PAGE'
									},
									{
										meta	= {'name', 'Action'},
										{
											meta	= {'value', 'GcGoToStateAction.xml'},
											State	= 'STAFF_IT_PAGE'
										}
									}
								}
							}
						},
						{
							meta	= {'value', 'GcActionTriggerState.xml'},
							StateID	= 'STAFF_IT_PAGE',
							{
								meta = {'name', 'Triggers'},
								{
									meta = {'value', 'GcActionTrigger.xml'},
									{
										meta	= {'Event', 'GcStateTimeEvent.xml'},
										Seconds	= 0
									},
									{
										meta	= {'name', 'Action'},
										{
											meta	= {'value', 'GcRewardAction.xml'},
											-- where the action happens
											Reward	= 'R_STAFF_PAGE'
										},
										{
											meta	= {'value', 'GcGoToStateAction.xml'},
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
				SEC_SAVE_TO			= 'gc_player_emote'
			},
			{
				SEC_EDIT 			= 'gc_player_emote',
				VALUE_CHANGE_TABLE 	= {
					{'Title',					'Open Staff Build'},
					{'EmoteID',					'STAFF_IT_PAGE'},
					{'AnimationName',			'STAFF_IT_PAGE'},
					{'Filename',				'TEXTURES/UI/FRONTEND/ICONS/ROBOTPARTS/ROBOTPARTS.STAFFHEAD.2.DDS'},
					{'AvailableUnderwater',		false}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Emotes',
				SEC_ADD_NAMED		= 'gc_player_emote'
			}
		}
	}
}}}}