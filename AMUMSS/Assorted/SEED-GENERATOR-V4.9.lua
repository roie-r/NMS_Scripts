--[[--------------------------------------------------
  SEED GENERATOR by Mjjstral - v4.9 updated by lMonk
------------------------------------------------------
  Set the desired number of seeds you want generated
  for each model (0 skips the unwanted)
----------------------------------------------------]]
local Seed_Model = {
	BIOSHIP   =	{ number=0 },
	FIGHTER   =	{ number=0 },
	DROPSHIP  =	{ number=0 },
	SCIENCE	  =	{ number=0 },
	SHUTTLE	  =	{ number=0 },
	EXOTIC	  =	{ number=0 },
	FREIGHTER =	{ number=0 },
	CAPITAL   =	{ number=0 },
	MULTITOOL =	{ number=0 }
}

------------------------------------------------------
-- CODE below(!)
------------------------------------------------------

Seed_Model.BIOSHIP.path		='MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC.SCENE.MBIN'
Seed_Model.FIGHTER.path		='MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN'
Seed_Model.DROPSHIP.path	='MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN'
Seed_Model.SCIENCE.path		='MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN'
Seed_Model.SHUTTLE.path		='MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN'
Seed_Model.EXOTIC.path		='MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN'
Seed_Model.FREIGHTER.path	='MODELS/COMMON/SPACECRAFT/INDUSTRIAL/FREIGHTER_PROC.SCENE.MBIN'
Seed_Model.CAPITAL.path		='MODELS/COMMON/SPACECRAFT/INDUSTRIAL/CAPITALFREIGHTER_PROC.SCENE.MBIN'
Seed_Model.MULTITOOL.path	='MODELS/COMMON/WEAPONS/MULTITOOL/MULTITOOL.SCENE.MBIN'

Seed_Model.BIOSHIP.icon		= 'SPECIALSHOP/SPECIAL.INFESTEDPLANT03.DDS'
Seed_Model.FIGHTER.icon		= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP03.DDS'
Seed_Model.DROPSHIP.icon	= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP04.DDS'
Seed_Model.SCIENCE.icon		= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP01.DDS'
Seed_Model.SHUTTLE.icon		= 'SPECIALSHOP/SPECIAL.TWITCH.SHIP05.DDS'
Seed_Model.EXOTIC.icon		= 'SPECIALSHOP/SPECIAL1.EXPEDITION.PETCUSTOM05.DDS'
Seed_Model.FREIGHTER.icon	= 'QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS'
Seed_Model.CAPITAL.icon		= 'QUICKMENU/BUILDINGS.CRASHEDFREIGHTER.DDS'
Seed_Model.MULTITOOL.icon	= 'SPECIALSHOP/SPECIAL.TWITCH.GUN03.DDS'

local Null_Anim = [[<?xml version="1.0" encoding="utf-8"?>
	<Data template="TkAnimMetadata">
		<Property name="FrameCount" value="10" />
		<Property name="NodeCount" value="0" />
		<Property name="NodeData" />
		<Property name="AnimFrameData">
			<Property value="TkAnimNodeFrameData.xml">
				<Property name="Rotations" />
				<Property name="Translations" />
				<Property name="Scales" />
			</Property>
		</Property>
		<Property name="StillFrameData" value="TkAnimNodeFrameData.xml">
			<Property name="Rotations" />
			<Property name="Translations" />
			<Property name="Scales" />
		</Property>
	</Data>
]]
local Null_Anim_Path = 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/EMOTES/NULL.ANIM'

local function GenerateSeed()
	return string.format('0x%X%X%X%X',
		math.random(0, 2^16), math.random(0, 2^16),
		math.random(0, 2^16), math.random(0, 2^16)
	)
end

local function HexToDec(n)
	if type(n) == 'number' then
		return n
	elseif string.find(tostring(n), '0x') then
		return tonumber(n)
	else
		return tonumber(n, 16)
	end
end

local function RewardTableItem(seed, path)
	return [[
	<Property value="GcRewardTableItem.xml">
		<Property name="PercentageChance" value="1"/>
		<Property name="Reward" value="GcRewardSpecificWeapon.xml">
			<Property name="WeaponResource" value="GcExactResource.xml">
				<Property name="Filename" value="]]..path..[["/>
				<Property name="GenerationSeed" value="GcSeed.xml">
					<Property name="Seed" value="]]..tonumber(seed)..[["/>
					<Property name="UseSeedValue" value="True"/>
				</Property>
			</Property>
			<Property name="WeaponLayout" value="GcInventoryLayout.xml">
				<Property name="Slots" value="3"/>
				<Property name="Seed" value="GcSeed.xml">
					<Property name="Seed" value="1"/>
					<Property name="UseSeedValue" value="True"/>
				</Property>
				<Property name="Level" value="1"/>
			</Property>
			<Property name="WeaponInventory" value="GcInventoryContainer.xml">
				<Property name="Slots"/>
				<Property name="ValidSlotIndices"/>
				<Property name="Class" value="GcInventoryClass.xml">
					<Property name="InventoryClass" value="C"/>
				</Property>
				<Property name="SubstanceMaxStorageMultiplier" value="0"/>
				<Property name="ProductMaxStorageMultiplier" value="0"/>
				<Property name="BaseStatValues"/>
				<Property name="SpecialSlots"/>
				<Property name="Width" value="1"/>
				<Property name="Height" value="1"/>
				<Property name="IsCool" value="False"/>
				<Property name="Name" value=""/>
				<Property name="Version" value="0"/>
			</Property>
			<Property name="NameOverride" value="]]..seed..[["/>
			<Property name="IsGift" value="False"/>
			<Property name="IsRewardWeapon" value="False"/>
			<Property name="FormatAsSeasonal" value="False"/>
		</Property>
	</Property>]]
end

local function GenRewardTableEntry(reward_id, sub_entry, choice_type)
	return [[
	<Property value="GcGenericRewardTableEntry.xml">
		<Property name="Id" value="]]..reward_id..[[" />
		<Property name="List" value="GcRewardTableItemList.xml">
			<Property name="RewardChoice" value="]]..(choice_type or 'SelectAlways')..[[" />
			<Property name="OverrideZeroSeed" value="False" />
			<Property name="List">
				]]..sub_entry..[[
			</Property>
		</Property>
	</Property>]]
end

local function AnimationEntry(anim_id)
	return [[
	<Property value="TkAnimationData.xml">
		<Property name="Anim" value="]]..anim_id..[["/>
		<Property name="Filename" value="]]..Null_Anim_Path..[[.MBIN"/>
		<Property name="AnimType" value="OneShotBlendable"/>
		<Property name="FrameStart" value="0"/>
		<Property name="FrameEnd" value="0"/>
		<Property name="StartNode" value=""/>
		<Property name="ExtraStartNodes"/>
		<Property name="Priority" value="0"/>
		<Property name="OffsetMin" value="0"/>
		<Property name="OffsetMax" value="0"/>
		<Property name="Delay" value="0"/>
		<Property name="Speed" value="1"/>
		<Property name="ActionStartFrame" value="0"/>
		<Property name="ActionFrame" value="-1"/>
		<Property name="CreatureSize" value="AllSizes"/>
		<Property name="Additive" value="False"/>
		<Property name="Mirrored" value="False"/>
		<Property name="Active" value="True"/>
		<Property name="AdditiveBaseAnim" value=""/>
		<Property name="AdditiveBaseFrame" value="0"/>
		<Property name="GameData" value="TkAnimationGameData.xml">
			<Property name="RootMotionEnabled" value="False"/>
			<Property name="BlockPlayerMovement" value="False"/>
			<Property name="BlockPlayerWeapon" value="Unblocked"/>
		</Property>
	</Property>]]
end

local function PlayerEmoteEntry(anim_id, icon)
	return [[
	<Property value="GcPlayerEmote.xml">
		<Property name="Title" value="]]..anim_id..[[" />
		<Property name="ChatText" value="" />
		<Property name="ChatUsesPrefix" value="False" />
		<Property name="AnimationName" value="]]..anim_id..[[" />
		<Property name="Icon" value="TkTextureResource.xml">
			<Property name="Filename" value="TEXTURES/UI/FRONTEND/ICONS/]]..icon..[[" />
		</Property>
		<Property name="LinkedSpecialID" value="" />
		<Property name="NeverShowInMenu" value="False" />
		<Property name="LoopAnimUntilMove" value="" />
		<Property name="CloseMenuOnSelect" value="False" />
		<Property name="MoveToCancel" value="False" />
		<Property name="GekAnimationName" value="" />
		<Property name="GekLoopAnimUntilMove" value="" />
		<Property name="AvailableUnderwater" value="True" />
		<Property name="RidingAnimationName" value="" />
		<Property name="IsPetCommand" value="False" />
		<Property name="PetCommandTitle" value="" />
		<Property name="PetCommandIcon" value="TkTextureResource.xml">
			<Property name="Filename" value="" />
		</Property>
	</Property>
	<Property value="GcPlayerEmote.xml">
		<Property name="Title" value="]]..anim_id..[[" />
		<Property name="ChatText" value="" />
		<Property name="ChatUsesPrefix" value="False" />
		<Property name="AnimationName" value="]]..anim_id..[[" />
		<Property name="Icon" value="TkTextureResource.xml">
			<Property name="Filename" value="TEXTURES/UI/FRONTEND/ICONS/]]..icon..[[" />
		</Property>
		<Property name="LinkedSpecialID" value="" />
		<Property name="NeverShowInMenu" value="False" />
		<Property name="LoopAnimUntilMove" value="" />
		<Property name="CloseMenuOnSelect" value="False" />
		<Property name="MoveToCancel" value="False" />
		<Property name="GekAnimationName" value="" />
		<Property name="GekLoopAnimUntilMove" value="" />
		<Property name="AvailableUnderwater" value="False" />
		<Property name="RidingAnimationName" value="" />
		<Property name="IsPetCommand" value="False" />
		<Property name="PetCommandTitle" value="" />
		<Property name="PetCommandIcon" value="TkTextureResource.xml">
			<Property name="Filename" value="" />
		</Property>
	</Property>]]
end

local function ActionTrigRewardEntry(reward_id)
	return [[
	<Property value="GcActionTrigger.xml">
		<Property name="Event" value="GcAnimFrameEvent.xml">
			<Property name="Anim" value="]]..reward_id..[[" />
			<Property name="FrameStart" value="0" />
			<Property name="StartFromEnd" value="False" />
		</Property>
		<Property name="Action">
			<Property value="GcRewardAction.xml">
				<Property name="Reward" value="]]..reward_id..[[" />
			</Property>
		</Property>
	</Property>]]
end

local function TriggerActComponent(triggersList)
	return [[
	<Property value="GcTriggerActionComponentData.xml">
		<Property name="HideModel" value="False" />
		<Property name="StartInactive" value="False" />
		<Property name="States">
			<Property value="GcActionTriggerState.xml">
				<Property name="StateID" value="BOOT" />
				<Property name="Triggers">
					]]..triggersList..[[
				</Property>
			</Property>
		</Property>
		<Property name="Persistent" value="False" />
		<Property name="PersistentState" value="" />
		<Property name="ResetShotTimeOnStateChange" value="False" />
		<Property name="LinkStateToBaseGrid" value="False" />
	</Property>]]
end

local function CreateSeedRewardLists()
	-- Initialize a seed for the random generator
	math.randomseed(82398 * os.time()); math.random()
	local T_entries = {
		Emotes = {},
		Rewards = {},
		Anims = {},
		Triggers = {}
	}
	for model, mdata in pairs(Seed_Model) do
		T_rewards = {}
		if mdata.number > 0 then
			print(string.format('Generating %s %s seeds...', mdata.number, model))
			for _=1, mdata.number do
				table.insert(T_rewards, RewardTableItem(GenerateSeed(), mdata.path))
			end
			mdata.rewardId = model..'_REWARD'
			table.insert(T_entries.Emotes, PlayerEmoteEntry(mdata.rewardId, mdata.icon))
			table.insert(T_entries.Rewards, GenRewardTableEntry(mdata.rewardId, table.concat(T_rewards)))
			table.insert(T_entries.Anims, AnimationEntry(mdata.rewardId))
			table.insert(T_entries.Triggers, TriggerActComponent(ActionTrigRewardEntry(mdata.rewardId)))
		end
	end
	return T_entries
end

local T_entries = CreateSeedRewardLists()

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__SEED-GENERATOR-v4.9.pak',
	MOD_AUTHOR			= 'lMonk (original by Mjjstral)',
	MOD_DESCRIPTION		= 'Adds random seed buttons to the quick action emote menu',
	NMS_VERSION			= '3.8+',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Filename', 'MODELS/COMMON/PLAYER/PLAYERCHARACTER/ANIMS/EMOTES/0H_EMOTE_CALL_PET.ANIM.MBIN'},
				ADD_OPTION			= 'ADDAfterSection',
				ADD 				= table.concat(T_entries.Anims)
			},
			{
				SPECIAL_KEY_WORDS	= {'StateID', 'BOOT'},
				SECTION_UP			= 2,
				ADD_OPTION			= 'ADDAfterSection',
				ADD 				= table.concat(T_entries.Triggers)
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'GenericTable',
				ADD 				= table.concat(T_entries.Rewards)
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/EMOTEMENU.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'Emotes',
				ADD 				= table.concat(T_entries.Emotes)
			}
		}
	},
}}},
	ADD_FILES	= {
		{
			FILE_DESTINATION = Null_Anim_Path..'.EXML',
			FILE_CONTENT	 = Null_Anim
		}
	}
}