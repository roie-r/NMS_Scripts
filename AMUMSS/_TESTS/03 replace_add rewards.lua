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

-- jetpack bonus food

FOOD_R_DONUT		Lumpen Doughnut
FOOD_R_GONUT		Proto-Beignet
FOOD_DNUT_CUST		Custard Doughnut
FOOD_DNUT_FCUST		Salty Doughnut
FOOD_DNUT_MCUST		Monstrous Doughnut
FOOD_DNUT_SCUST		The Stellarator
FOOD_DNUT_HON		Honey Doughnut
FOOD_DNUT_HONB		Honeybutter Doughnut
FOOD_DNUT_BLOB		Gooey ProtoDoughnut
FOOD_DNUT_CARM		Caramel Doughnut
FOOD_DNUT_CHOC		Cocoa Doughnut
FOOD_DNUT_MEAT		Proteinous Doughnut
FOOD_DNUT_JAM		Jam Doughnut
FOOD_DNUT_CJAM		Wriggling Doughnut
FOOD_DNUT_AJAM		Anomalous Doughnut
FOOD_CM_CREAM		Doomed Cream Cake
FOOD_CM_CHOC		Haunted Chocolate Dreams
FOOD_CM_CARM		Wailing Caramel Cake
FOOD_CM_APPLE		'Apple' Cake of Lost Souls
FOOD_CM_CACTUS		Choking Monstrosity Cake
FOOD_CM_JAM			Appalling Jam Sponge
FOOD_CM_JHOT		Cake of Burning Dread
FOOD_CM_JGLITCH		Cake of Glass
FOOD_MC_HONEY		Honied Angel Cake
FOOD_MC_BLOB		Gooey Honey Puff
FOOD_MC_CREAM		Extra-Fluffy Cream Cake
FOOD_MC_CHOC		Chocolate Dream
FOOD_MC_CARM		Fluffy Caramel Delight
FOOD_MC_APPLE		Angelic Fruitcake
FOOD_MC_CACTUS		Soft and Spiky Surprise
FOOD_MC_JAM			Jam Fluffer
FOOD_MC_JHOT		Burning Jam Fluffer
FOOD_MC_JGLITCH		Perpetual Jam Fluffer
FOOD_MC_CUST		Soft Custard Fancy
FOOD_MM_HONEY		Tortured Honey Cake
FOOD_MM_BLOB		Itching, Creeping Honey Sponge
FOOD_MM_CREAM		Unbound Cream Horn
FOOD_MM_CHOC		Volatile Chocolate Fancy
FOOD_MM_CARM		Caramelised Nightmare
FOOD_MM_APPLE		Cake of Sin
FOOD_MM_CACTUS		Fluffy Throatripper
FOOD_MM_JAM			Writhing Jam Puff
FOOD_MM_JHOT		Burning Jam Surprise
FOOD_MM_JGLITCH		Unbound Monstrosity
FOOD_MM_CUST		Cake of the Lost
FOOD_CM_BLOBBUT		Gooey Screamer
FOOD_CM_HONEY		Monstrous Honey Cake
FOOD_CG_HONEY		Honied Proto-Cake
FOOD_R_BREAD		Bread
FOOD_R_PASTRY
--]]

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
		return F_.TableItemSingle(item, exml, 'GcRewardSpecificProduct.xml')
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
		return F_.TableItemSingle(item, exml, 'GcRewardSpecificSubstance.xml')
	end,
	Units = function(item)
		local exml = [[
			<Property name="Currency" value="GcCurrency.xml">
				<Property name="Currency" value="Units" />
			</Property>
		]]
		return F_.TableItemSingle(item, exml, 'GcRewardMoney.xml')
	end,
	Nanites = function(item)
		local exml = [[
			<Property name="Currency" value="GcCurrency.xml">
				<Property name="Currency" value="Nanites" />
			</Property>
		]]
		return F_.TableItemSingle(item, exml, 'GcRewardMoney.xml')
	end,
	Shield = function(item)
		return F_.TableItemSingle(item, '', 'GcRewardShield.xml')
	end,
	TableItemSingle = function(item, reward, type)
		return [[
			<Property value="GcRewardTableItem.xml">
				<Property name="PercentageChance" value="]]..item.c..[[" />
				<Property name="Reward" value="]]..type..[[">
					]]..reward..[[
					<Property name="AmountMin" value="]]..item.n..[[" />
					<Property name="AmountMax" value="]]..item.x..[[" />
				</Property>
				<Property name="LabelID" value="" />
			</Property>
		]]
	end,
	ItemList = function(item)
		local exml = '<Property name="Items">'
		for i=1, #item do
			exml = exml..[[
				<Property value="GcMultiSpecificItemEntry.xml">
					<Property name="MultiItemRewardType" value="]]..item[i].t..[[" />
					<Property name="Id" value="]]..item[i].id..[[" />
					<Property name="Amount" value="]]..item[i].n..[[" />
					<Property name="ProcTechGroup" value="" />
					<Property name="ProcTechQuality" value="0" />
					<Property name="ProcProdType" value="GcProceduralProductCategory.xml">
						<Property name="ProceduralProductCategory" value="Loot" />
					</Property>
					<Property name="ProcProdRarity" value="GcRarity.xml">
						<Property name="Rarity" value="Common" />
					</Property>
					<Property name="HideInSeasonRewards" value="False" />
				</Property>]]
		end
		exml = exml..'</Property>'
		return F_.TableItemMulti(item, exml, 'GcRewardMultiSpecificItems.xml')
	end,
	TableItemMulti = function(item, reward, type)
		return [[
			<Property value="GcRewardTableItem.xml">
				<Property name="PercentageChance" value="]]..item.c..[[" />
				<Property name="Reward" value="]]..type..[[">
					]]..reward..[[
				</Property>
				<Property name="LabelID" value="" />
			</Property>
		]]
	end
}

Rewards = {
	FreightLoot_Explorer = {
		id = 'FREIGHTERLOOT_E',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min			Max			%		function
			{id='HYPERFUEL1',	n=1,		x=1,		c=100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_TECH',	n=1,		x=1,		c=100,	f=F_.Product},	--
			{id='STARCHART_A',	n=3,		x=3,		c=100,	f=F_.Product},	-- chart
			{id='GEODE_RARE',	n=1,		x=1,		c=20,	f=F_.Product},	-- Glowing crystal
			{id='FRIG_TOKEN',	n=1,		x=1,		c=20,	f=F_.Product},	-- Frigate Module
			{id='ASTEROID3',	n=150,		x=160,		c=100,	f=F_.Substance},-- Platinum
			{id='AF_METAL',		n=210,		x=230,		c=10,	f=F_.Substance},-- tainted metal
			{id='nanites',		n=360,		x=380,		c=100,	f=F_.Nanites},
		}
	},
	FreightLoot_Trader = {
		id = 'FREIGHTERLOOT_T',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min			Max			%		function
			{id='HYPERFUEL1',	n=1,		x=1,		c=100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_GOODS',	n=1,		x=1,		c=100,	f=F_.Product},
			{id='FRIG_TOKEN',	n=1,		x=1,		c=100,	f=F_.Product},	-- Frigate Module
			{id='POI_LOCATOR',	n=1,		x=1,		c=35,	f=F_.Product},	-- anomaly locator
			{id='GEODE_RARE',	n=1,		x=1,		c=20,	f=F_.Product},	-- Glowing crystal
			{id='ASTEROID2',	n=190,		x=195,		c=100,	f=F_.Substance},-- Platinum
			{id='AF_METAL',		n=210,		x=230,		c=10,	f=F_.Substance},-- tainted metal
			{id='units',		n=40100,	x=50200,	c=100,	f=F_.Units},
		}
	},
	FreightLoot_Warrior = {
		id = 'FREIGHTERLOOT_W',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min			Max			%		function
			{id='HYPERFUEL1',	n=1,		x=1,		c=100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_WEAP',	n=1,		x=1,		c=100,	f=F_.Product},
			{id='GEODE_RARE',	n=1,		x=1,		c=100,	f=F_.Product},	-- Glowing crystal
			{id='POI_LOCATOR',	n=1,		x=1,		c=35,	f=F_.Product},	-- anomaly locator
			{id='FRIG_TOKEN',	n=1,		x=1,		c=20,	f=F_.Product},	-- Frigate Module
			{id='ASTEROID3',	n=150,		x=160,		c=100,	f=F_.Substance},-- Platinum
			{id='AF_METAL',		n=210,		x=230,		c=10,	f=F_.Substance},-- tainted metal
			{id='nanites',		n=315,		x=335,		c=100,	f=F_.Nanites},
			{id='shield',		n=50,		x=70,		c=100,	f=F_.Shield},
		}
	},
	Test_Loot_09 = {
		id = 'TEST_REWARD_09',
		choice = 'GiveAll',
		rewardlist = {
			{
				{id='HYPERFUEL1',		n=1, 	t='Product'},
				{id='POI_LOCATOR',		n=1, 	t='Product'},
				{id='FOOD_MM_CACTUS',	n=2, 	t='Product'},
				{id='ASTEROID3',		n=240,	t='Substance'},
				{id='SOULFRAG',			n=128,	t='Substance'},
				{id='AF_METAL',			n=243,	t='Substance'},
				{id='SPACEGUNK2',		n=1200,	t='Substance'},
				c = 100,
				f = F_.ItemList
			}
		}
	},
	Test_Loot_08 = {
		id = 'TEST_RRWARD_08',
		choice = 'GiveAll',
		rewardlist = {
			{
				{id='HYPERFUEL1',		n=1, 	t='Product'},
				{id='POI_LOCATOR',		n=1, 	t='Product'},
				{id='AF_METAL',			n=243,	t='Substance'},
				{id='SPACEGUNK2',		n=1200,	t='Substance'},
				c = 100,
				f = F_.ItemList
			},
			--	Id					Min		Max		%	function
			{id='nanites',			n=170,	x=180,	c=100,	f=F_.Nanites},
			{id='POI_LOCATOR',		n=1,	x=1,	c=40,	f=F_.Product},
			{id='ASTEROID2',		n=100,	x=100,	c=10,	f=F_.Substance},-- Gold
			{id='ASTEROID3',		n=100,	x=100,	c=10,	f=F_.Substance},-- Platinum
			{id='FOOD_MM_CACTUS',	n=1,	x=1,	c=33,	f=F_.Product},
			{id='AF_METAL',			n=100,	x=100,	c=32,	f=F_.Substance},
			{id='SUNGOLD',			n=100,	x=100,	c=10,	f=F_.Substance},
			{id='POLICE_TOKEN',		n=1,	x=1,	c=29,	f=F_.Product},
			{id='FOOD_DNUT_MEAT',	n=5,	x=5,	c=28,	f=F_.Product},
			{id='SOULFRAG',			n=100,	x=100,	c=10,	f=F_.Substance},
			{id='SPACEGUNK2',		n=100,	x=100,	c=10,	f=F_.Substance},
			{id='units',			n=100,	x=100,	c=23,	f=F_.Units}
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

-- print(Rewards.GetRewardsList(Rewards.FreightLoot_Warrior.rewardlist))

--[
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 03 replace add rewards.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.51',
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
}}}}
--]]