--[[
*** trigger reward from frigate control room ***

BP_ANALYSER = UI_BP_ANALYSTER_OPTB (BP_FIRST_MSG)

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

-- generate GcRewardTableItem
F_ = {
	Product = function(item)
		local exml = [[
			<Property name="Default" value="GcDefaultMissionProductEnum.xml">
				<Property name="DefaultProductType" value="None" />
			</Property>
			<Property name="ID" value="]]..item.id..[[" />
			<Property name="ForceSpecialMessage" value="False" />
			<Property name="HideInSeasonRewards" value="False" />
		]]
		return F_.TableItem(item, exml, 'GcRewardSpecificProduct.xml')
	end,
	ProductList = function(item)
		local exml = '<Property name="ProductList">'
		for i = 1, #item.id do
			exml = exml..[[
				<Property value="NMSString0x10.xml">
					<Property name="Value" value="]] ..item.id[i]..[[" />
				</Property>]]
		end
		exml = exml..'</Property><Property name="ForceSpecialMessage" value="False" />'
		return F_.TableItem(item, exml, 'GcRewardSystemSpecificProductFromList.xml')
	end,
	Substance = function(item)
		local exml = [[
			<Property name="Default" value="GcDefaultMissionProduct.xml">
				<Property name="Product" value="GcProductTableEnum.xml">
					<Property name="gcproducttableEnum" value="None" />
				</Property>
			</Property>
			<Property name="ID" value="]]..item.id..[[" />
			<Property name="HardModeMultiplier" value="1" />
			<Property name="DisableMultiplier" value="False" />
			<Property name="RewardAsBlobs" value="False" />
			<Property name="UseFuelMultiplier" value="False" />
		]]
		return F_.TableItem(item, exml, 'GcRewardSpecificSubstance.xml')
	end,
	Units = function(item)
		local exml = [[
			<Property name="Currency" value="GcCurrency.xml">
				<Property name="Currency" value="Units" />
			</Property>
		]]
		return F_.TableItem(item, exml, 'GcRewardMoney.xml')
	end,
	Nanites = function(item)
		local exml = [[
			<Property name="Currency" value="GcCurrency.xml">
				<Property name="Currency" value="Nanites" />
			</Property>
		]]
		return F_.TableItem(item, exml, 'GcRewardMoney.xml')
	end,
	TableItem = function(item, reward, type)
		return [[
			<Property value="GcRewardTableItem.xml">
				<Property name="PercentageChance" value="]]..item[3]..[[" />
				<Property name="Reward" value="]]..type..[[">
					]]..reward..[[
					<Property name="AmountMin" value="]]..item[1]..[[" />
					<Property name="AmountMax" value="]]..item[2]..[[" />
				</Property>
				<Property name="LabelID" value="" />
			</Property>
		]]
	end
}

-- SCRAP_GOODS  SCRAP_TECH  SCRAP_WEAP

Rewards = {
	FreightLoot_Explorer = {
		id = 'FREIGHTERLOOT_E',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	1,		1,		100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_TECH',	1,		1,		100,	f=F_.Product},	--
			{id='STARCHART_A',	3,		3,		100,	f=F_.Product},	-- chart
			-- {id='GEODE_RARE',	1,		1,		20,		f=F_.Product},	-- Glowing crystal
			-- {id='FRIG_TOKEN',	1,		1,		20,		f=F_.Product},	-- Frigate Module
			{id='ASTEROID3',	150,	160,	100,	f=F_.Substance},-- Platinum
			-- {id='AF_METAL',		210,	230,	10,		f=F_.Substance},-- tainted metal
			-- {id='BASE_MEDGEOMETR',1,	1,		5,		f=F_.Product},
			{id='nanites',		360,	380,	100,	f=F_.Nanites},
		}
	},
	FreightLoot_Trader = {
		id = 'FREIGHTERLOOT_T',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	1,		1,		100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_GOODS',	1,		1,		100,	f=F_.Product},
			{id='FRIG_TOKEN',	1,		1,		100,	f=F_.Product},	-- Frigate Module
			-- {id='POI_LOCATOR',	1,		1,		35,		f=F_.Product},	-- anomaly locator
			-- {id='GEODE_RARE',	1,		1,		20,		f=F_.Product},	-- Glowing crystal
			{id='ASTEROID2',	190,	195,	100,	f=F_.Substance},-- Platinum
			-- {id='AF_METAL',		210,	230,	10,		f=F_.Substance},-- tainted metal
			-- {id='BASE_CONTOURPOD',1,	1,		5,		f=F_.Product},
			{id='units',		40100,	50200,	100,	f=F_.Units},
		}
	},
	FreightLoot_Warrior = {
		id = 'FREIGHTERLOOT_W',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	1,		1,		100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_WEAP',	1,		1,		100,	f=F_.Product},
			{id='GEODE_RARE',	1,		1,		100,	f=F_.Product},	-- Glowing crystal
			-- {id='POI_LOCATOR',	1,		1,		35,		f=F_.Product},	-- anomaly locator
			-- {id='FRIG_TOKEN',	1,		1,		20,		f=F_.Product},	-- Frigate Module
			{id='ASTEROID3',	150,	160,	100,	f=F_.Substance},-- Platinum
			-- {id='AF_METAL',		210,	230,	10,		f=F_.Substance},-- tainted metal
			-- {id='BASE_WEIRDCUBE',1,		1,		5,		f=F_.Product},
			{id='nanites',		315,	335,	100,	f=F_.Nanites},
		}
	},
	Test_Loot_09 = {
		id = 'TEST_REWARD_07',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%	function
			{
				id={
					'ASTEROID2',
					'ASTEROID3',
					'STELLAR2',
					'AF_METAL',
					'SOULFRAG',
					'SUNGOLD',
					'SPACEGUNK2',
				},
				120, 180, 100, f=F_.ProductList,
			}
		}
	},
	Test_Loot_09 = {
		id = 'TEST_REWARD_09',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%	function
			{id='HYPERFUEL1',	1,		1,		35,		f=F_.Product},	-- Hyperdrive fuel
			{id='POI_LOCATOR',	1,		1,		35,		f=F_.Product},
			{id='FOOD_MM_CACTUS',1,		1,		35,		f=F_.Product},
			{id='FRIG_TOKEN',	1,		1,		20,		f=F_.Product},	-- Frigate Module
			{id='GEODE_RARE',	1,		1,		20,		f=F_.Product},	-- Glowing crystal
			{id='ASTEROID2',	170,	180,	30,		f=F_.Substance},-- Gold
			{id='ASTEROID3',	150,	160,	30,		f=F_.Substance},-- Platinum
			{id='nanites',		170,	180,	100,	f=F_.Nanites},
		}
	},
	Test_Loot_08 = {
		id = 'TEST_RRWARD_08',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%	function
			{
				id={
					'HYPERFUEL1',
					'FOOD_MM_CACTUS',
					'POLICE_TOKEN',
				},
				1, 1, 100, f=F_.ProductList,
			},
			{
				id={
					'GEODE_RARE',
					'FRIG_TOKEN',
				},
				1, 1, 60, f=F_.ProductList,
			},
			{id='nanites',		170,	180,	100,	f=F_.Nanites},
			-- {id='POI_LOCATOR',	1,		1,		40,	f=F_.Product},
			{id='ASTEROID2',	100,	100,	10,	f=F_.Substance},-- Gold
			{id='ASTEROID3',	100,	100,	10,	f=F_.Substance},-- Platinum
			-- {id='HYPERFUEL1',	1,		1,		38,	f=F_.Product},	-- Hyperdrive fuel
			-- {id='FRIG_TOKEN',	1,		1,		36,	f=F_.Product},	-- Frigate Module
			-- {id='STELLAR2',		100,	100,	35,	f=F_.Substance},-- chromatic metal
			-- {id='GEODE_RARE',	1,		1,		20,	f=F_.Product},	-- Glowing crystal
			-- {id='FOOD_MM_CACTUS',1,		1,		33,	f=F_.Product},
			-- {id='AF_METAL',		100,	100,	32,	f=F_.Substance},
			{id='SUNGOLD',		100,	100,	10,	f=F_.Substance},
			-- {id='POLICE_TOKEN',	1,		1,		29,	f=F_.Product},
			-- {id='FOOD_DNUT_MEAT',5,		5,		28,	f=F_.Product},
			{id='SOULFRAG',		100,	100,	10,	f=F_.Substance},
			{id='SPACEGUNK2',	100,	100,	10,	f=F_.Substance},
			-- {id='WALKER_PROD',	1,		1,		25,	f=F_.Product},
			-- {id='ODD_EGG',		1,		1,		24,	f=F_.Product},
			-- {id='units',		100,	100,	23,	f=F_.Units},
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
			exml = exml..lst[i].f(lst[i])
		end
		return exml..'</Property>'
	end
}

-- print(Rewards.GetRewardsList(Rewards.Test_Loot_09.rewardlist))

--[
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 03 replace add rewards.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.42',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\REWARDTABLE.MBIN',
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
--[[
	{
		-- insert the test reward into the construction recipe analyser 'Cancel' menu option
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\NMS_DIALOG_GCALIENPUZZLETABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', '?BLUEPRINT_ANALYSER', 'Name', 'ALL_REQUEST_LEAVE'},
				PRECEDING_KEY_WORDS	= 'Rewards',
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'TEST_REWARD_09'}
				}
			}
		}
	}
--]]
}}}}
--]]