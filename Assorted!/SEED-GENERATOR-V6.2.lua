-------------------------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
dofile('LIB/reward_entry.lua')
-------------------------------------------------------------------
local mod_desc = [[
  Seed generator by lMonk (Original by Mjjstral)
  add action buttons to the emote menu that generate randoms ships
-------------------------------------------------------------------
  Set the number of seeds you want generated for each model
  (0 skips the unwanted)
  * freighters are displayed with their seed but can't be bought
]]-----------------------------------------------------------------

local seed_counter = {
	Fighter			= 0,
	Dropship		= 100000,
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
	Sentineltool	= 0,
	Stafftool		= 0,
	Atlastool		= 0
}

------------------------------------------------------
--- CODE below(!)
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

local seed_model = {
	Fighter = {
		filename	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP08.DDS',
		inventory	= item_inventory.normal_ship,
		modeltype	= 'Fighter',
		reward		= R_Ship
	},
	Dropship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.SHIP24.DDS',
		inventory	= item_inventory.normal_ship,
		modeltype	= 'Dropship',
		reward		= R_Ship
	},
	Scientific = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.SHIP23.DDS',
		inventory	= item_inventory.normal_ship,
		modeltype	= 'Scientific',
		reward		= R_Ship
	},
	Shuttle = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP05.DDS',
		inventory	= item_inventory.normal_ship,
		modeltype	= 'Shuttle',
		reward		= R_Ship
	},
	Royal = {
		filename	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.EXPEDITION.SHIP01.DDS',
		inventory	= item_inventory.normal_ship,
		modeltype	= 'Royal',
		reward		= R_Ship
	},
	Bioship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL.MYSTERYEGG.DDS',
		inventory	= item_inventory.bio_ship,
		modeltype	= 'Alien',
		reward		= R_Ship
	},
	Sailship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.SHIP27.DDS',
		inventory	= item_inventory.sail_ship,
		modeltype	= 'Sail',
		reward		= R_Ship
	},
	Sentinel = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN',
		icon		= 'U4PRODUCTS/PRODUCT.WALKERBRAIN2.DDS',
		inventory	= item_inventory.sentinel_ship,
		modeltype	= 'Robot',
		reward		= R_Ship
	},
	Freighter = {
		filename	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTER_PROC.SCENE.MBIN',
		icon		= 'QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		inventory	= item_inventory.freighter,
		modeltype	= 'Freighter',
		reward		= R_Ship
	},
	Capital = {
		filename	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/CAPITALFREIGHTER_PROC.SCENE.MBIN',
		icon		= 'QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		inventory	= item_inventory.freighter,
		modeltype	= 'Freighter',
		reward		= R_Ship
	},
	Multitool =	{
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/MULTITOOL.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.GUN12.DDS',
		inventory	= item_inventory.weapon,
		modeltype	= 'Rifle',
		reward		= R_Multitool
	},
	Royaltool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/ROYALMULTITOOL.SCENE.MBIN',
		icon		= 'SPECIALSHOP/SPECIAL1.TWITCH.GUN11.DDS',
		inventory	= item_inventory.weapon,
		modeltype	= 'Royal',
		reward		= R_Multitool
	},
	Sentineltool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/SENTINELMULTITOOL.SCENE.MBIN',
		icon		= 'TECHNOLOGY/RENDER.LASERSENTINEL2.DDS',
		inventory	= item_inventory.sentinel_weapon,
		modeltype	= 'Robot',
		reward		= R_Multitool
	},
	Stafftool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/STAFFNPCMULTITOOL.SCENE.MBIN',
		icon		= 'ROBOTPARTS/ROBOTPARTS.STAFFCORE.1.DDS',
		inventory	= item_inventory.sentinel_weapon,
		modeltype	= 'Staff',
		reward		= R_Multitool
	},
	Atlastool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/ATLASMULTITOOL.SCENE.MBIN',
		icon		= 'TECHNOLOGY/TECH.ATLASLASER.DDS',
		inventory	= item_inventory.atlas_weapon,
		modeltype	= 'Atlas',
		reward		= R_Multitool
	}
}

local function TriggerActionComponent(reward_id)
	return {
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
								Anim	= reward_id
							},
							{
								meta	= {'name', 'Action'},
								{
									meta	= {'value', 'GcGoToStateAction.xml'},
									State	= 'REWARD'
								}
							}
						}
					}
				},
				{
					meta	= {'value', 'GcActionTriggerState.xml'},
					StateID	= 'REWARD',
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
									Reward	= reward_id
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
end

local function AnimationEntry(anim_id)
	return {
		{
			PRECEDING_KEY_WORDS = {'Anims', 'TkAnimationData.xml'},
			SEC_SAVE_TO			= 'tk_animation_data'
		},
		{
			SEC_EDIT 			= 'tk_animation_data',
			VALUE_CHANGE_TABLE 	= {
				{'Anim',		anim_id},
				{'Filename',	'MODELS/TESTS/EFFECTTEST.ANIM.MBIN'}
			}
		},
		{
			SPECIAL_KEY_WORDS	= {'Anim', '2H_STAFF_WALK'},
			ADD_OPTION			= 'ADDAfterSection',
			SEC_ADD_NAMED		= 'tk_animation_data'
		}
	}
end

local function PlayerEmoteEntry(mdata)
	return {
		{
			PRECEDING_KEY_WORDS = 'GcPlayerEmote.xml',
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

local function GenerateSeed()
	return string.format('0x%X%X', math.random(0xFFFFFFFF), math.random(0xFFFFFFFF))
end

-- MAIN tables
local t_emotes, t_rewards, t_player_char = {}, {}, {}

for model, mdata in pairs(seed_model) do
	local rwd_entries = {}
	if seed_counter[model] > 0 then
		print(string.format('*** Generating %s %s rewards...', seed_counter[model], model))
		for _=1, seed_counter[model] do
			-- sets the seed as the ship's name override
			mdata.name = GenerateSeed()
			mdata.seed = mdata.name
			rwd_entries[#rwd_entries+1] = mdata.reward(mdata)
		end
		mdata.rewardId = 'R_'..model
		t_rewards[#t_rewards+1] = R_RewardTableEntry({id = mdata.rewardId, list = rwd_entries})

		for _,emot in pairs(PlayerEmoteEntry(mdata)) do
			t_emotes[#t_emotes+1] = emot
		end
		t_player_char[#t_player_char+1] = TriggerActionComponent(mdata.rewardId)
		for _,anim in pairs(AnimationEntry(mdata.rewardId)) do
			t_player_char[#t_player_char+1] = anim
		end
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__SEED-GENERATOR-v6.2.pak',
	MOD_AUTHOR			= 'lMonk (original by Mjjstral)',
	NMS_VERSION			= '4.72',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= t_player_char
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/EMOTEMENU.MBIN',
		EXML_CHANGE_TABLE	= t_emotes
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'GenericTable',
				ADD 				= ToExml(t_rewards)
			}
		}
	}
}}}}