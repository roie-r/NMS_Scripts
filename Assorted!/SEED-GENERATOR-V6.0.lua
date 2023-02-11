---------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/~LIB/gc_rewards.lua')
---------------------------------------------------------------------
mod_desc = [[
  SEED GENERATOR by lMonk (Original by Mjjstral)
  add action buttons to emote menu that generate randoms ships
---------------------------------------------------------------
  Set the number of seeds you want generated for each model
  (0 skips the unwanted)
  * freighters are displayed but can't be bought
]]-------------------------------------------------------------

local seed_counter = {
	Fighter		= 0,
	Dropship	= 0,
	Scientific	= 100,
	Shuttle		= 0,
	Royal		= 0,
	Bioship		= 100,
	Sailship	= 0,
	Freighter	= 0,
	Capital		= 0,
	Multitool	= 0,
	Royaltool	= 0
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
	freighter = {
		{id='F_HYPERDRIVE',		amount=true},
		{id='F_HDRIVEBOOST1'},
	},
	weapon = {
		{id='LASER',			amount=true},
		{id='BOLT'},
		{id='SCAN1'},
		{id='SCANBINOC1'}
	}
}

local seed_model = {
	Fighter = {
		file	= 'MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.TWITCH.SHIP08.DDS',
		tech	= item_inventory.normal_ship,
		class	= 'Fighter',
		reward	= R_Ship
	},
	Dropship = {
		file	= 'MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.TWITCH.SHIP04.DDS',
		tech	= item_inventory.normal_ship,
		class	= 'Dropship',
		reward	= R_Ship
	},
	Scientific = {
		file	= 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.TWITCH.SHIP01.DDS',
		tech	= item_inventory.normal_ship,
		class	= 'Scientific',
		reward	= R_Ship
	},
	Shuttle = {
		file	= 'MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.TWITCH.SHIP05.DDS',
		tech	= item_inventory.normal_ship,
		class	= 'Shuttle',
		reward	= R_Ship
	},
	Royal = {
		file	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.EXPEDITION.SHIP01.DDS',
		tech	= item_inventory.normal_ship,
		class	= 'Royal',
		reward	= R_Ship
	},
	Bioship = {
		file	= 'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.INFESTEDPLANT03.DDS',
		tech	= item_inventory.bio_ship,
		class	= 'Alien',
		reward	= R_Ship
	},
	Sailship = {
		file	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL1.S_SAIL_2.DDS',
		tech	= item_inventory.sail_ship,
		class	= 'Sail',
		reward	= R_Ship
	},
	Freighter = {
		file	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTER_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		tech	= item_inventory.freighter,
		-- class	= 'PlayerFreighter',
		reward	= R_Multitool
	},
	Capital = {
		file	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/CAPITALFREIGHTER_PROC.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS',
		tech	= item_inventory.freighter,
		-- class	= 'PlayerFreighter',
		reward	= R_Multitool
	},
	Multitool =	{
		file	= 'MODELS/COMMON/WEAPONS/MULTITOOL/MULTITOOL.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL.TWITCH.GUN02.DDS',
		tech	= item_inventory.weapon,
		class	= 'Rifle',
		reward	= R_Multitool
	},
	Royaltool = {
		file	= 'MODELS/COMMON/WEAPONS/MULTITOOL/ROYALMULTITOOL.SCENE.MBIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/SPECIALSHOP/SPECIAL1.EXPEDITION.PETCUSTOM05.DDS',
		tech	= item_inventory.weapon,
		class	= 'Royal',
		reward	= R_Multitool
	}
}

local function TriggerActionComponent(reward_id)
	return {
		PRECEDING_KEY_WORDS	= 'GcTriggerActionComponentData.xml',
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
	return string.format('0x%X%X', math.random(0xFFFFFFFF), math.random(0xFFFFFFFF)) -- 0f1ced8
end

-- MAIN tables
local t_emotes, t_rewards, t_player_char = {}, {}, {}
math.randomseed(os.time())
for model, mdata in pairs(seed_model) do
	local reward_itm = {}
	if seed_counter[model] > 0 then
		print(string.format('*** Generating %s %s seeds...', seed_counter[model], model))
		for _=1, seed_counter[model] do
			mdata.name = GenerateSeed()
			mdata.seed = tonumber(mdata.name)
			mdata.inventory = R_Inventory(mdata.tech)
			reward_itm[#reward_itm+1] = mdata.reward(mdata)
		end
		mdata.rewardId = 'R_'..model
		t_rewards[#t_rewards+1] = R_RewardTableEntry({id = mdata.rewardId, item_list = reward_itm})

		for _,emt in pairs(PlayerEmoteEntry(mdata.rewardId, mdata.icon)) do t_emotes[#t_emotes+1] = emt end
		t_player_char[#t_player_char+1] = TriggerActionComponent(mdata.rewardId)
		for _,anm in pairs(AnimationEntry(mdata.rewardId)) do t_player_char[#t_player_char+1] =  anm end
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__SEED-GENERATOR-v6.0.pak',
	MOD_AUTHOR			= 'lMonk (original by Mjjstral)',
	MOD_DESCRIPTION		= mod_desc,
	NMS_VERSION			= '4.0+',
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