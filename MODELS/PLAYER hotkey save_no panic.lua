----------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
----------------------------------------------
local mod_desc = [[
  Add hotkey saving (quick action emote menu)
  Disable panic falling animation
]]--------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ MODEL hotkey save_no panic',
	MOD_AUTHOR			= 'lMonk (original by Mjjstral)',
	NMS_VERSION			= '6.24',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
			---	disable panic fall anime
				SPECIAL_KEY_WORDS	= {'Id', '0H_AIRBORNE', 'AnimId', '0H_FALL_PANIC'},
				VALUE_CHANGE_TABLE 	= {
					{'AnimId',		'0H_FALL_CTRL'},
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', '1H_AIRBORNE', 'AnimId', '0H_FALL_PANIC'},
				VALUE_CHANGE_TABLE 	= {
					{'AnimId',		'1H_FALL_CTRL'},
				}
			},
			-- {
				-- SPECIAL_KEY_WORDS	= {'Id', 'MAINT_FUEL1'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'AmountEmptyTimePeriod', 900}
				-- }
			-- },
			{
				PRECEDING_KEY_WORDS	= 'Components',
				ADD_OPTION			= 'AddEndSection',
				ADD 				= ToMxml({
					{
						meta = {name='Components', value='GcSimpleInteractionComponentData'},
						{
							meta = {name='value', value='GcSimpleInteractionComponentData'},
							SimpleInteractionType	= 'Save',
							TriggerAction			= 'INACTIVE',
							HideContents			= true
						}
					},
					{
						meta = {name='Components', value='GcTriggerActionComponentData'},
						{
							meta = {name='value', value='GcTriggerActionComponentData'},
							States = {
								meta = {name='States'},
								{
									meta = {name='States', value='GcActionTriggerState'},
									StateID = 'BOOT',
									Triggers = {
										meta = {name='Triggers'},
										{
											meta = {name='Triggers', value='GcActionTrigger'},
											Event = {
												meta = {name='Event', value='GcAnimFrameEvent'},
												GcAnimFrameEvent = {
													meta = {name='GcAnimFrameEvent'},
													Anim = 'SAVEGAME'
												}
											},
											Action = {
												meta = {name='Action'},
												{
													meta = {name='Action', value='GcGoToStateAction'},
													GcGoToStateAction = {
														meta = {name='GcGoToStateAction'},
														State = 'SAVE',
														{
															meta = {name='BroadcastLevel', value='GcBroadcastLevel'},
															BroadcastLevel = 'Scene'
														}
													}
												}
											}
										}
									}
								},
								{
									meta = {name='States', value='GcActionTriggerState'},
									StateID = 'SAVE',
									Triggers = {
										meta = {name='Triggers'},
										{
											meta = {name='Triggers', value='GcActionTrigger'},
											Event = {
												meta = {name='Event', value='GcStateTimeEvent'},
												GcStateTimeEvent = {
													meta = {name='GcStateTimeEvent'},
													Seconds = 0.1
												}
											},
											Action = {
												meta = {name='Action'},
												{
													meta = {name='Action', value='GcPlayAudioAction'},
													GcPlayAudioAction = {
														meta = {name='GcPlayAudioAction'},
														Sound = 'SignalScanner',
														OcclusionRadius = 2
													}
												},
												{
													meta = {name='Action', value='GcGoToStateAction'},
													GcGoToStateAction = {
														meta = {name='GcGoToStateAction'},
														State = 'BOOT',
														{
															meta = {name='BroadcastLevel', value='GcBroadcastLevel'},
															BroadcastLevel = 'Scene'
														}
													}
												},
												{
													meta = {name='Action', value='GcFireSimpleInteractionAction'},
													{name = 'GcFireSimpleInteractionAction'}
												}
											}
										}
									}
								}
							}
						}
					}
				})
			},
			{
				SPECIAL_KEY_WORDS	= {'Components', 'TkAnimationComponentData'},
				PRECEDING_KEY_WORDS = {'Anims', 'Anims'},
				SEC_SAVE_TO			= 'tk_animation_data'
			},
			{
				SEC_EDIT 			= 'tk_animation_data',
				VALUE_CHANGE_TABLE 	= {
					{'Anim',		'SAVEGAME'},
					{'Filename',	'MODELS/COMMON/SHARED/NULL.ANIM.MBIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Components', 'TkAnimationComponentData'},
				PRECEDING_KEY_WORDS = 'Anims',
				ADD_OPTION			= 'AddEndSection',
				SEC_ADD_NAMED		= 'tk_animation_data'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/EMOTEMENU.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Emotes', 'GcPlayerEmote'},
				SEC_SAVE_TO			= 'gc_player_emote'
			},
			{
				SEC_EDIT 			= 'gc_player_emote',
				VALUE_CHANGE_TABLE 	= {
					{'Title',					'Save'},
					{'ChatText',				''},
					{'ChatUsesPrefix',			false},
					{'EmoteID',					'SAVEGAME'},
					{'AnimationName',			'SAVEGAME'},
					{'RidingAnimationName',		'SAVEGAME'},
					{'Filename',				'TEXTURES/UI/HUD/ICONS/PLAYER/SAVE.DDS'},
					{'CloseMenuOnSelect',		true},
					{'AvailableUnderwater',		true}
				}
			},
			{
				PRECEDING_KEY_WORDS = 'Emotes',
				SEC_ADD_NAMED		= 'gc_player_emote'
			},
			{
				SEC_EDIT 			= 'gc_player_emote',
				VALUE_CHANGE_TABLE 	= {
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
