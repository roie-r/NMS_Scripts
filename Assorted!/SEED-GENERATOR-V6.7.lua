-------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/reward_entry.lua')
-------------------------------------------------------------------
local mod_desc = [[
  Seed generator by lMonk (Original by Mjjstral)
  add action buttons to the emote menu that generate randoms ships
-------------------------------------------------------------------
  Set the number of items you want generated for each model
  (0 skips the unwanted)
  * freighters are displayed with their seed but can't be bought
]]-----------------------------------------------------------------

local model_counter = {
	Fighter			= 0,
	Dropship		= 0,
	Scientific		= 0,
	Shuttle			= 0,
	Royal			= 0,
	Bioship			= 0,
	Sailship		= 0,
	Sentinel		= 0,
	Freighter		= 0,
	Capital			= 0,
	Multitool		= 0,
	Royaltool		= 0,
	Sentineltool	= 10000,
	Stafftool		= 0,
	Atlastool		= 0
}

------------------------------------------------------
--- CODE below (!)
------------------------------------------------------

local item_inventory = {
	normal_ship = {
	--	Tech Id			Has Charge
		HYPERDRIVE		= true,
		LAUNCHER		= true,
		SHIPSHIELD		= true,
		SHIPJUMP1		= true,
		PHOTONIX_CORE	= false,
		SHIPGUN1		= false
	},
	bio_ship = {
		WARP_ALIEN		= true,
		LAUNCHER_ALIEN	= true,
		SHIELD_ALIEN	= true,
		SHIPJUMP_ALIEN	= true,
		SHIPLAS_ALIEN	= false,
		SHIPGUN_ALIEN	= false
	},
	sail_ship = {
		HYPERDRIVE		= true,
		LAUNCHER		= true,
		SHIPSHIELD		= true,
		SHIPJUMP1		= true,
		SOLAR_SAIL		= false,
		SHIPGUN1		= false
	},
	sentinel_ship = {
		LAUNCHER_ROBO	= true,
		SHIPJUMP_ROBO	= true,
		HYPERDRIVE_ROBO	= true,
		SHIPSHIELD_ROBO	= true,
		SHIPGUN_ROBO	= false,
		LIFESUP_ROBO	= false
	},
	weapon = {
		LASER			= true,
		TERRAINEDITOR	= true,
		BOLT			= false,
		SCAN1			= false,
		SCANBINOC1		= false
	},
	atlas_weapon = {
		ATLAS_LASER		= true,
		TERRAINEDITOR	= true,
		BOLT			= false,
		SCAN1			= false,
		SCANBINOC1		= false
	},
	sentinel_weapon = {
		SENT_LASER		= true,
		TERRAINEDITOR	= true,
		UT_BUI_SCAN2	= true,
		BOLT			= false,
		SCAN1			= false,
		SCANBINOC1		= false
	},
	freighter = {
		F_HYPERDRIVE	= true,
		F_TELEPORT		= true,
		F_HDRIVEBOOST1	= false
	}
}

local model_data = {
	Fighter = {
		filename	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP08.DDS',
		modeltype	= 'Fighter',
		inventory	= item_inventory.normal_ship
	},
	Dropship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.SHIP24.DDS',
		modeltype	= 'Dropship',
		inventory	= item_inventory.normal_ship
	},
	Scientific = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.SHIP23.DDS',
		modeltype	= 'Scientific',
		inventory	= item_inventory.normal_ship
	},
	Shuttle = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP05.DDS',
		modeltype	= 'Shuttle',
		inventory	= item_inventory.normal_ship
	},
	Royal = {
		filename	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.EXPEDITION.SHIP01.DDS',
		modeltype	= 'Royal',
		inventory	= item_inventory.normal_ship
	},
	Bioship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.MYSTERYEGG.DDS',
		modeltype	= 'Alien',
		inventory	= item_inventory.bio_ship
	},
	Sailship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.SHIP27.DDS',
		modeltype	= 'Sail',
		inventory	= item_inventory.sail_ship
	},
	Sentinel = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN',
		icon		= 'U4PRODUCTS/PRODUCT.WALKERBRAIN2.DDS',
		modeltype	= 'Robot',
		inventory	= item_inventory.sentinel_ship
	},
	Freighter = {
		filename	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTER_PROC.SCENE.MBIN',
		icon		= 'QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		modeltype	= 'Freighter',
		inventory	= item_inventory.freighter
	},
	Capital = {
		filename	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/CAPITALFREIGHTER_PROC.SCENE.MBIN',
		icon		= 'QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		modeltype	= 'Freighter',
		inventory	= item_inventory.freighter
	},
	Multitool =	{
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/MULTITOOL.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.GUN12.DDS',
		modeltype	= 'Rifle',
		inventory	= item_inventory.weapon
	},
	Royaltool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/ROYALMULTITOOL.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.GUN11.DDS',
		modeltype	= 'Royal',
		inventory	= item_inventory.weapon
	},
	Sentineltool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/SENTINELMULTITOOL.SCENE.MBIN',
		icon		= 'TECHNOLOGY/RENDER.LASERSENTINEL2.DDS',
		modeltype	= 'Robot',
		inventory	= item_inventory.sentinel_weapon
	},
	Stafftool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/STAFFMULTITOOL.SCENE.MBIN',
		icon		= 'ROBOTPARTS/ROBOTPARTS.STAFFCORE.1.DDS',
		modeltype	= 'Staff',
		inventory	= item_inventory.sentinel_weapon
	},
	Atlastool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/ATLASMULTITOOL.SCENE.MBIN',
		icon		= 'TECHNOLOGY/TECH.ATLASLASER.DDS',
		modeltype	= 'Atlas',
		inventory	= item_inventory.atlas_weapon
	}
}

local function TriggerActionComponent(reward_id)
	return {
		PRECEDING_KEY_WORDS	= 'Components',
		ADD_OPTION			= 'AddEndSection',
		ADD 				= ToMxml({
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
										Anim = reward_id
									}
								},
								Action = {
									meta = {name='Action'},
									{
										meta = {name='Action', value='GcGoToStateAction'},
										GcGoToStateAction = {
											meta = {name='GcGoToStateAction'},
											State = 'REWARD',
										}
									}
								}
							}
						}
					},
					{
						meta = {name='States', value='GcActionTriggerState'},
						StateID = 'REWARD',
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
										meta = {name='Action', value='GcRewardAction'},
										GcRewardAction = {
											meta = {name='GcRewardAction'},
											Reward	= reward_id
										}
									},
									{
										meta = {name='Action', value='GcGoToStateAction'},
										GcGoToStateAction = {
											meta = {name='GcGoToStateAction'},
											State = 'BOOT'
										}
									}
								}
							}
						}
					}
				}
			}
		})
	}
end

local function AnimationEntry(anim_id)
	return {
		{
			SPECIAL_KEY_WORDS	= {'Anims', 'TkAnimationData'},
			SEC_SAVE_TO			= 'tk_animation_data'
		},
		{
			SEC_EDIT 			= 'tk_animation_data',
			VALUE_CHANGE_TABLE 	= {
				{'Anim',		anim_id},
				{'Filename',	'MODELS/COMMON/SHARED/NULL.ANIM.MBIN'}
			}
		},
		{
			PRECEDING_KEY_WORDS = 'Anims',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'tk_animation_data'
		}
	}
end

local function PlayerEmoteEntry(mdata)
	return {
		{
			SPECIAL_KEY_WORDS	= {'Emotes', 'GcPlayerEmote'},
			SEC_SAVE_TO			= 'gc_player_emote'
		},
		{
			SEC_EDIT 			= 'gc_player_emote',
			VALUE_CHANGE_TABLE 	= {
				{'Title',					mdata.rewardId},
				{'ChatText',				''},
				{'ChatUsesPrefix',			false},
				{'EmoteID',					mdata.rewardId},
				{'AnimationName',			mdata.rewardId},
				{'Filename',				'TEXTURES/UI/FRONTEND/ICONS/'..mdata.icon},
				{'CloseMenuOnSelect',		true},
				{'AvailableUnderwater',		false}
			}
		},
		{
			PRECEDING_KEY_WORDS = 'Emotes',
			SEC_ADD_NAMED		= 'gc_player_emote'
		}
	}
end

-- MAIN tables
local t_emotes, t_rewards, t_player_char = {}, {}, {}

for model, mdata in pairs(model_data) do
	local rwd_entries = {}
	local BuildReward = mdata.filename:find('SPACECRAFT') and R_Ship or R_Multitool
	if model_counter[model] > 0 then
		print(('*** Generating %s %s rewards...'):format(model_counter[model], model))
		for _=1, model_counter[model] do
			-- sets the seed as the ship's name override
			mdata.seed = math.random(2^62)
			mdata.name = ('0x%X'):format(mdata.seed)
			rwd_entries[#rwd_entries+1] = BuildReward(mdata)
		end
		mdata.rewardId = 'R_'..model
		t_rewards[#t_rewards+1] = R_RewardTableEntry({id = mdata.rewardId, list = rwd_entries})

		for _,emot in ipairs(PlayerEmoteEntry(mdata)) do
			t_emotes[#t_emotes+1] = emot
		end
		t_player_char[#t_player_char+1] = TriggerActionComponent(mdata.rewardId)
		for _,anim in ipairs(AnimationEntry(mdata.rewardId)) do
			t_player_char[#t_player_char+1] = anim
		end
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ SEED-GENERATOR-v6.7',
	MOD_AUTHOR			= 'lMonk (original by Mjjstral)',
	NMS_VERSION			= '6.06',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= t_player_char
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/EMOTEMENU.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= t_emotes
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'GenericTable',
				ADD 				= ToMxml(t_rewards)
			}
		}
	}
}}}}