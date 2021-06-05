--[[
*** trigger reward from frigate control room ***

ALL_FLEET_COMM_POST_OPT..FLEET_COMM_POST_EMPTY
          <Property name="Rewards">
            <Property value="NMSString0x10.xml">
              <Property name="Value" value="FREIGHTERLOOT" />
            </Property>
          </Property>

*** RewardChoiceEnum ***
	GiveAll
	Select
	SelectAlways
	TryEach
	SelectSilent
	GiveAllSilent
	TryFirst_ThenSelectAlways
	SelectFromSuccess
	SelectFromSuccessSilent
--]]

Rewards = {
	FreightLoot = {
		id = 'FREIGHTERLOOT',
		choice = 'SelectAlways',
		rewardlist = {
		--	  Id			Min		Max		%		IsProduct
			{'POI_LOCATOR',	1,		1,		40,		true},
			{'FOOD_MM_CACTUS',1,	1,		40,		true},
			{'FOOD_R_EYEICE',1,		1,		40,		true},
			{'AF_METAL',	10,		10,		40,		false},
			{'SUNGOLD',		10,		10,		40,		false},
			{'POLICE_TOKEN',1,		1,		40,		true},
			{'EXP_CURIO3',	1,		1,		40,		true},
			{'FOOD_DNUT_MEAT',5,	5,		40,		true},
			{'SOULFRAG',	10,		10,		40,		false},
			{'ASTEROID2',	10,		10,		40,		false},	-- Gold
			{'HYPERFUEL1',	1,		1,		40,		true},	-- Hyperdrive fuel
			{'ASTEROID3',	10,		10,		40,		false},	-- Platinum
			{'FRIG_TOKEN',	1,		1,		40,		true},	-- Frigate Module
			{'STELLAR2',	10,		10,		40,		false},	-- chromatic metal
			{'GEODE_RARE',	1,		1,		40,		true},	-- Glowing crystal
			{'SPACEGUNK2',	10,		10,		40,		false},
			{'WALKER_PROD',	1,		1,		40,		true},
			{'ODD_EGG',		1,		1,		40,		true},
			{'FOOD_PIE_CRAB',1,		1,		40,		true},
		}
	},
	BuildRewardTableEntry = function(rte)
		return [[
		<Property value="GcGenericRewardTableEntry.xml">
			<Property name="Id" value="]]..rte.id..[[" />
			<Property name="List" value="GcRewardTableItemList.xml">
				<Property name="RewardChoice" value="]]..rte.choice..[[" />
				<Property name="OverrideZeroSeed" value="False" />
				]]..Rewards.GetRewardsList(rte.rewardlist)..[[
			</Property>
		</Property>]]
	end,
	GetRewardsList = function(lst)
		local exml = '<Property name="List">'
		for i = 1, #lst do
			exml = exml..AddRewardItem(lst[i])
		end
		return exml..'</Property>'
	end
}

function AddRewardItem(x)
	-- variables:: id, min, max, chance, isProduct
   local exml = [[
	   <Property value="GcRewardTableItem.xml">
		   <Property name="PercentageChance" value="]]..x[4]..[[" />]]
   if x[5] then
	   exml = exml..[[
		   <Property name="Reward" value="GcRewardSpecificProduct.xml">
			   <Property name="Default" value="GcDefaultMissionProductEnum.xml">
				   <Property name="DefaultProductType" value="None" />
			   </Property>
			   <Property name="ForceSpecialMessage" value="False" />
			   <Property name="HideInSeasonRewards" value="False" />]]
   else
	   exml = exml..[[
		   <Property name="Reward" value="GcRewardSpecificSubstance.xml">
			   <Property name="Default" value="GcDefaultMissionProduct.xml">
				   <Property name="Product" value="GcProductTableEnum.xml">
					   <Property name="gcproducttableEnum" value="None" />
				   </Property>
			   </Property>
			   <Property name="HardModeMultiplier" value="1" />
			   <Property name="DisableMultiplier" value="False" />
			   <Property name="RewardAsBlobs" value="False" />
			   <Property name="UseFuelMultiplier" value="False" />]]
   end
   return exml..[[
			   <Property name="ID" value="]]..x[1]..[[" />
			   <Property name="AmountMin" value="]]..x[2]..[[" />
			   <Property name="AmountMax" value="]]..x[3]..[[" />
			   <Property name="Silent" value="False" />
		   </Property>
		   <Property name="LabelID" value="" />
	   </Property>]]
end
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TEST replace freighter rewards.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.51',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Id', 'FREIGHTERLOOT', 'RewardChoice', 'SelectAlways'},
				PRECEDING_KEY_WORDS = 'GcRewardTableItem.xml',
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FREIGHTERLOOT', 'RewardChoice', 'SelectAlways'},
				PRECEDING_KEY_WORDS = 'List',
				ADD					=
									AddRewardItem('ASTEROID2',	180,	200,	30,	false) ..
									AddRewardItem('ASTEROID3',	160,	180,	30,	false) ..
									AddRewardItem('HYPERFUEL1',	1,		1,		20,	true) ..
									AddRewardItem('STELLAR2',	200,	220,	10,	false) ..
									AddRewardItem('FRIG_TOKEN',	1,		1,		5,	true) ..
									AddRewardItem('GEODE_RARE',	1,		1,		5,	true)
			},
		}
	}
}}}}
