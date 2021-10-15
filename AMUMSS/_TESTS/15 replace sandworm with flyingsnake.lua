--[[┎──────────────────────────────────────────────────────────────────────────────────
	┃ make the sandworm into skyworm a high-flying giant (instead of ground-breaking)
	┃ replace the sandworm model with a normal flying snake
────┸──────────────────────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 02 replace sandworm with flyingsnake.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.68',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			-- *** rebuild full reward table item ***
			-- {
			-- 	SPECIAL_KEY_WORDS	= {'Id', 'FREIGHTERLOOT'},
			-- 	REMOVE				= 'SECTION'
			-- },
			{
				PRECEDING_KEY_WORDS	= 'GenericTable',
				ADD					= Rewards.BuildRewardTableEntry(Rewards.Test_Loot_09),
			},

			-- *** replace table item reward list ***
			-- {
			-- 	SPECIAL_KEY_WORDS	= {'Id', 'FREIGHTERLOOT', 'ID', 'FRIG_TOKEN'},
			-- 	SECTION_UP			= 2,
			-- 	REMOVE				= 'SECTION'
			-- },
			-- {
			-- 	SPECIAL_KEY_WORDS	= {'Id', 'FREIGHTERLOOT', 'RewardChoice', 'SelectAlways'},
			-- 	PRECEDING_KEY_WORDS = 'List',
			-- ADD					= Rewards.GetRewardsList(Rewards.Test_Loot_09.rewardlist)
			-- },
		}
	},
}}}}
