-------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/reward_entry.lua')
-------------------------------------------------------------------
mod_desc = [[
  Seed generator by lMonk (Original by Mjjstral)
  add action buttons to the emote menu that generate randoms ships
-------------------------------------------------------------------
  Set the number of seeds you want generated for each model
  (0 skips the unwanted)
  * freighters are displayed with their seed but can't be bought
]]-----------------------------------------------------------------

local seed_counter = {
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
	Multitool		= 140000,
	Royaltool		= 0,
	Sentineltool	= 0
}

------------------------------------------------------
--- CODE below(!)
------------------------------------------------------

local item_inventory = {
	normal_ship = {
		{id='HYPERDRIVE',		amount=true},
		{id='LAUNCHER',			amount=true},
		{id='SHIPSHIELD',		amount=true},
		{id='SHIPJUMP1',		amount=true},
		{id='PHOTONIX_CORE'},
		{id='SHIPGUN1'}
	},
	bio_ship = {
		{id='WARP_ALIEN',		amount=true},
		{id='LAUNCHER_ALIEN',	amount=true},
		{id='SHIELD_ALIEN',		amount=true},
		{id='SHIPJUMP_ALIEN',	amount=true},
		{id='SHIPLAS_ALIEN'},
		{id='SHIPGUN_ALIEN'}
	},
	sail_ship = {
		{id='HYPERDRIVE',		amount=true},
		{id='LAUNCHER',			amount=true},
		{id='SHIPSHIELD',		amount=true},
		{id='SHIPJUMP1',		amount=true},
		{id='SOLAR_SAIL'},
		{id='SHIPGUN1'}
	},
	sentinel_ship = {	
		{id='LAUNCHER_ROBO',	amount=true},
		{id='SHIPJUMP_ROBO',	amount=true},
		{id='HYPERDRIVE_ROBO',	amount=true},
		{id='SHIPSHIELD_ROBO',	amount=true},
		{id='SHIPGUN_ROBO'},
		{id='LIFESUP_ROBO'}
	},
	weapon = {
		{id='LASER',			amount=true},
		{id='TERRAINEDITOR',	amount=true},
		{id='BOLT'},
		{id='SCAN1'},
		{id='SCANBINOC1'}
	},
	sentinel_weapon = {
		{id='SENT_LASER',		amount=true},
		{id='TERRAINEDITOR',	amount=true},
		{id='BOLT'},
		{id='SCAN1'},
		{id='SCANBINOC1'}
	},
	freighter = {
		{id='F_HYPERDRIVE',		amount=true},
		{id='F_HDRIVEBOOST1'},
	}
}

local seed_model = {
	Fighter = {
		filename	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.TWITCH.SHIP08.DDS',
		inventory	= item_inventory.normal_ship,
		shiptype	= 'Fighter',
		reward		= R_Ship
	},
	Dropship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL1.TWITCH.SHIP24.DDS',
		inventory	= item_inventory.normal_ship,
		shiptype	= 'Dropship',
		reward		= R_Ship
	},
	Scientific = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL1.TWITCH.SHIP23.DDS',
		inventory	= item_inventory.normal_ship,
		shiptype	= 'Scientific',
		reward		= R_Ship
	},
	Shuttle = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.TWITCH.SHIP05.DDS',
		inventory	= item_inventory.normal_ship,
		shiptype	= 'Shuttle',
		reward		= R_Ship
	},
	Royal = {
		filename	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.EXPEDITION.SHIP01.DDS',
		inventory	= item_inventory.normal_ship,
		shiptype	= 'Royal',
		reward		= R_Ship
	},
	Bioship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.MYSTERYEGG.DDS',
		inventory	= item_inventory.bio_ship,
		shiptype	= 'Alien',
		reward		= R_Ship
	},
	Sailship = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL1.TWITCH.SHIP27.DDS',
		inventory	= item_inventory.sail_ship,
		shiptype	= 'Sail',
		reward		= R_Ship
	},
	Sentinel = {
		filename	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/U4PRODUCTS/PRODUCT.WALKERBRAIN2.DDS',
		inventory	= item_inventory.sentinel_ship,
		shiptype	= 'Robot',
		reward		= R_Ship
	},
	Freighter = {
		filename	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTER_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		inventory	= item_inventory.freighter,
		-- class	= 'PlayerFreighter',
		reward		= R_Multitool
	},
	Capital = {
		filename	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/CAPITALFREIGHTER_PROC.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		inventory	= item_inventory.freighter,
		-- class	= 'PlayerFreighter',
		reward		= R_Multitool
	},
	Multitool =	{
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/MULTITOOL.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL1.TWITCH.GUN12.DDS',
		inventory	= item_inventory.weapon,
		weapontype	= 'Rifle',
		reward		= R_Multitool
	},
	Royaltool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/ROYALMULTITOOL.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL1.TWITCH.GUN11.DDS',
		inventory	= item_inventory.weapon,
		weapontype	= 'Royal',
		reward		= R_Multitool
	},
	Sentineltool = {
		filename	= 'MODELS/COMMON/WEAPONS/MULTITOOL/SENTINELMULTITOOL.SCENE.MBIN',
		icon		= 'TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.LASERSENTINEL2.DDS',
		inventory	= item_inventory.sentinel_weapon,
		weapontype	= 'Robot',
		reward		= R_Multitool
	}
}

local function TriggerActionComponent(reward_id)
	return {
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
								Anim	= reward_id
							},
							{
								META	= {'name', 'Action'},
								{
									META	= {'value', 'GcGoToStateAction.xml'},
									State	= 'REWARD'
								}
							}
						}
					}
				},
				{
					META	= {'value', 'GcActionTriggerState.xml'},
					StateID	= 'REWARD',
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
									Reward	= reward_id
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
end

local function AnimationEntry(anim_id)
	return {
		{
			SPECIAL_KEY_WORDS	= {'Anim', '0H_TURN_L'},
			SECTION_SAVE_TO		= 'tk_animation_data'
		},
		{
			SECTION_EDIT 		= 'tk_animation_data',
			VALUE_CHANGE_TABLE 	= {
				{'Anim', anim_id},
				{'Filename', 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/EMOTES/NULL.ANIM.MBIN'}
			}
		},
		{
			SPECIAL_KEY_WORDS	= {'Anim', '0H_GREET_MOB_04', 'Filename', 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/INTERACTION/GENERAL/0H_INTER_GREET_07.ANIM.MBIN'},
			ADD_OPTION			= 'ADDAfterSection',
			SECTION_ADD_NAMED 	= 'tk_animation_data'
		}
	}
end

local function PlayerEmoteEntry(anim_id, icon)
	return {
		{
			SPECIAL_KEY_WORDS	= {'Title', 'EMOTE_WAVE'},
			SECTION_SAVE_TO		= 'gc_player_emote'
		},
		{
			SECTION_EDIT 		= 'gc_player_emote',
			VALUE_CHANGE_TABLE 	= {
				{'Title',					anim_id},
				{'EmoteID',					anim_id},
				{'AnimationName',			anim_id},
				{'Filename',				icon},
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
end

local function GenerateSeed()
	return string.format('0x%X%X', math.random(0xFFFFFFFF), math.random(0xFFFFFFFF))
end

-- MAIN tables
local t_emotes, t_rewards, t_player_char = {}, {}, {}
for model, mdata in pairs(seed_model) do
	local reward_item = {}
	if seed_counter[model] > 0 then
		print(string.format('*** Generating %s %s rewards...', seed_counter[model], model))
		for _=1, seed_counter[model] do
			mdata.name = GenerateSeed()
			mdata.seed = mdata.name
			reward_item[#reward_item+1] = mdata.reward(mdata)
		end
		mdata.rewardId = 'R_'..model
		t_rewards[#t_rewards+1] = R_RewardTableEntry({id = mdata.rewardId, item_list = reward_item})

		for _,emt in pairs(PlayerEmoteEntry(mdata.rewardId, mdata.icon)) do
			t_emotes[#t_emotes+1] = emt
		end
		t_player_char[#t_player_char+1] = TriggerActionComponent(mdata.rewardId)
		for _,anm in pairs(AnimationEntry(mdata.rewardId)) do
			t_player_char[#t_player_char+1] = anm
		end
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__SEED-GENERATOR-v6.1.pak',
	MOD_AUTHOR			= 'lMonk (original by Mjjstral)',
	MOD_DESCRIPTION		= mod_desc,
	NMS_VERSION			= '4.36',
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