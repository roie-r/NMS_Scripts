--[[┎────────────────────────────────────────────────────────────
	┃ Replace police loot trade booster with speed booster
	┃ Replace freighter defence reward with better selection
	┃ Increase wild plants harvest yield
────┸────────────────────────────────────────────────────────--]]
Mult = { D=1.2, W=2, M=1.2 }

Plant_Harvest = {
	dat = {
		'DE_COOK_ALL1',		-- Heptaploid Wheat
		'DE_COOK_ALL2',		-- Sweetroot
		'DE_COOK_ALL3',		-- Pulpy Roots
		'DE_COOK_HOT',		-- Fireberry
		'DE_COOK_RAD',		-- Grahberry
		'DE_COOK_DUST',		-- Aloe Flesh
		'DE_COOK_COLD',		-- Frozen Tubers
		'DE_COOK_TOX',		-- Jade Peas
		'DE_COOK_LUSH',		-- Impulse Beans
		'DE_COOK_WEIRD',	-- Hexaberry
		'WILD_SCORCHED',	-- Solanium
		'WILD_RADIO',		-- Gamma Root
		'WILD_BARREN',		-- Cactus Flesh
		'WILD_SNOW',		-- Frost Crystal
		'WILD_TOXIC',		-- Fungal Mould
		'WILD_LUSH',		-- Star Bulb
	},
	Get = function(x)
		local v = Mult[string.sub(x, 1, 1)]
		return {
			MATH_OPERATION 		= '*',
			SPECIAL_KEY_WORDS	= {'Id', x},
			VALUE_CHANGE_TABLE 	= { {'AmountMin', v}, {'AmountMax', v * Mult.M} }
		}
	end
}

local function BuildExmlChangeTable(tbl)
	local T = {}
	for i = 1, #tbl.dat do table.insert(T, tbl.Get(tbl.dat[i])) end
	return T
end

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

T_ = { PRD='Product', SBT='Substance', PCT='ProcTech', PCP='ProcProduct'}

Rewards = {
	FreightLoot_Explorer = {
		id = 'FREIGHTERLOOT_E',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	n=1,	x=1,	c=100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_TECH',	n=1,	x=1,	c=100,	f=F_.Product},	-- anomaly locator
			{id='STARCHART_A',	n=3,	x=3,	c=100,	f=F_.Product},	-- chart
			{id='ASTEROID3',	n=150,	x=160,	c=100,	f=F_.Substance},-- Platinum
			{id='nanites',		n=360,	x=380,	c=100,	f=F_.Nanites},
		}
	},
	FreightLoot_Trader = {
		id = 'FREIGHTERLOOT_T',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	n=1,	x=1,	c=100,	f=F_.Product},
			{id='SCRAP_GOODS',	n=1,	x=1,	c=100,	f=F_.Product},
			{id='FRIG_TOKEN',	n=1,	x=1,	c=100,	f=F_.Product},
			{id='GEODE_ASTEROID',n=5,	x=6,	c=100,	f=F_.Product},	-- gold nugget
			{id='units',		n=40100,x=50200,c=100,	f=F_.Units},
		}
	},
	FreightLoot_Warrior = {
		id = 'FREIGHTERLOOT_W',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	n=1,	x=1,	c=100,	f=F_.Product},
			{id='SCRAP_WEAP',	n=1,	x=1,	c=100,	f=F_.Product},
			{id='GEODE_RARE',	n=1,	x=1,	c=100,	f=F_.Product},	-- Glowing crystal
			{id='ASTEROID2',	n=180,	x=190,	c=100,	f=F_.Substance},
			{id='nanites',		n=315,	x=335,	c=100,	f=F_.Nanites},
		}
	},
	Cook_Shield = {
		id = 'BAKE_SHIELD',
		choice = 'GiveAllSilent',
		rewardlist = {
			{id='shield',		n=50,	x=70,	c=100,	f=F_.Shield}
		}
	},
	Test_Loot_09 = {
		id = 'TEST_REWARD_09',
		choice = 'SelectAlways',
		rewardlist = {
			{
				{id='HYPERFUEL1',		n=1, 	t=T_.PRD},
				{id='POI_LOCATOR',		n=1, 	t=T_.PRD},
				{id='FOOD_MM_CACTUS',	n=2, 	t=T_.PRD},
				{id='ASTEROID3',		n=240,	t=T_.SBT},
				{id='SOULFRAG',			n=128,	t=T_.SBT},
				{id='AF_METAL',			n=243,	t=T_.SBT},
				{id='SPACEGUNK2',		n=1200,	t=T_.SBT},
				c=75,
				f=F_.ItemList
			},
			{id='nanites',		n=305,	x=335,	c=80,	f=F_.Nanites}
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

Source_Table_Reward = 'METADATA\REALITY\TABLES\REWARDTABLE.MBIN'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE REWARD.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.51',
	MOD_BATCHNAME		= '_TABLES ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= Source_Table_Reward,
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'PIRATELOOT', 'ID', 'STELLAR2'},
				SECTION_UP			= 1,
				REPLACE_TYPE		= 'ADDAFTERSECTION',
				ADD					= F_.Product({id='ALLOY2', n=1, x=1, c=30})
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'PIRAT_LOOT_HARD', 'ID', 'STELLAR2'},
				SECTION_UP			= 1,
				REPLACE_TYPE		= 'ADDAFTERSECTION',
				ADD					= F_.Product({id='ALLOY2', n=1, x=1, c=30})
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'POLICELOOT', 'ID', 'FRIG_BOOST_TRA'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'FRIG_BOOST_SPD'}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Id', 'JETPACK_BOOST'},
				VALUE_CHANGE_TABLE 	= {
					{'Duration',		2.2},	-- 10
					{'ForwardBoost',	1.5},	-- 4.5
					{'UpBoost',			1.2},	-- 0.8
					{'IgnitionBoost',	1.2},	-- 1.9
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Id', 'MIXER_JETPACK'},
				VALUE_CHANGE_TABLE 	= {
					{'Duration',		2.2},
					{'ForwardBoost',	1.5},
					{'UpBoost',			1.2},
					{'IgnitionBoost',	1.2},
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Id', 'DE_FOOD_JETPACK'},
				VALUE_CHANGE_TABLE 	= {
					{'Duration',		2.2},
					{'ForwardBoost',	1.5},
					{'UpBoost',			1.2},
					{'IgnitionBoost',	1.2},
				}
			},
			{
				PRECEDING_KEY_WORDS	= 'GenericTable',
				ADD					= Rewards.BuildRewardTableEntry(Rewards.FreightLoot_Explorer)
									  ..
									  Rewards.BuildRewardTableEntry(Rewards.FreightLoot_Trader)
									  ..
									  Rewards.BuildRewardTableEntry(Rewards.FreightLoot_Warrior)
									  ..
									  Rewards.BuildRewardTableEntry(Rewards.Cook_Shield)
									  ..
									  Rewards.BuildRewardTableEntry(Rewards.Test_Loot_09)
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= Source_Table_Reward,
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Plant_Harvest)
	}
}}}}
