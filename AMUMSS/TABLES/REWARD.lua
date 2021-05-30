--[[┎────────────────────────────────────────────────────────────
	┃ Replace police loot trade booster with speed booster
	┃ Replace freighter defence reward with better selection
	┃ Increase wild plants harvest yield
────┸────────────────────────────────────────────────────────--]]
-- harvest multipliers
f_min = 1.2
w_min = 2
mult  = 1.2

Plant_Harvest = {
	dat = {
		{'DE_COOK_ALL1',	f_min,	f_min * mult},	-- Heptaploid Wheat
		{'DE_COOK_ALL2',	f_min,	f_min * mult},	-- Sweetroot
		{'DE_COOK_ALL3',	f_min,	f_min * mult},	-- Pulpy Roots
		{'DE_COOK_HOT',		f_min,	f_min * mult},	-- Fireberry
		{'DE_COOK_RAD',		f_min,	f_min * mult},	-- Grahberry
		{'DE_COOK_DUST',	f_min,	f_min * mult},	-- Aloe Flesh
		{'DE_COOK_COLD',	f_min,	f_min * mult},	-- Frozen Tubers
		{'DE_COOK_TOX',		f_min,	f_min * mult},	-- Jade Peas
		{'DE_COOK_LUSH',	f_min,	f_min * mult},	-- Impulse Beans
		{'DE_COOK_WEIRD',	f_min,	f_min * mult},	-- Hexaberry
		{'WILD_SCORCHED',	w_min,	w_min * mult},	-- Solanium
		{'WILD_RADIO',		w_min,	w_min * mult},	-- Gamma Root
		{'WILD_BARREN',		w_min,	w_min * mult},	-- Cactus Flesh
		{'WILD_SNOW',		w_min,	w_min * mult},	-- Frost Crystal
		{'WILD_TOXIC',		w_min,	w_min * mult},	-- Fungal Mould
		{'WILD_LUSH',		w_min,	w_min * mult}	-- Star Bulb
	},
	Get = function(x)
		return {
			MATH_OPERATION 		= '*',
			SPECIAL_KEY_WORDS	= {'Id', x[1]},
			VALUE_CHANGE_TABLE 	= { {'AmountMin', x[2]}, {'AmountMax', x[3]} }
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

Rewards = {
	FreightLoot_Explorer = {
		id = 'FREIGHTERLOOT_E',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	1,		1,		100,	f=F_.Product},	-- Hyperdrive fuel
			{id='SCRAP_TECH',	1,		1,		100,	f=F_.Product},	-- anomaly locator
			{id='STARCHART_A',	3,		3,		100,	f=F_.Product},	-- chart
			{id='ASTEROID3',	150,	160,	100,	f=F_.Substance},-- Platinum
			{id='nanites',		360,	380,	100,	f=F_.Nanites},
		}
	},
	FreightLoot_Trader = {
		id = 'FREIGHTERLOOT_T',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	1,		1,		100,	f=F_.Product},
			{id='SCRAP_GOODS',	1,		1,		100,	f=F_.Product},
			{id='FRIG_TOKEN',	1,		1,		100,	f=F_.Product},
			{id='ASTEROID2',	190,	195,	100,	f=F_.Substance},-- gold
			{id='units',		40100,	50200,	100,	f=F_.Units},
		}
	},
	FreightLoot_Warrior = {
		id = 'FREIGHTERLOOT_W',
		choice = 'GiveAll',
		rewardlist = {
		--	Id					Min		Max		%		function
			{id='HYPERFUEL1',	1,		1,		100,	f=F_.Product},
			{id='SCRAP_WEAP',	1,		1,		100,	f=F_.Product},
			{id='GEODE_RARE',	1,		1,		100,	f=F_.Product},	-- Glowing crystal
			{id='ASTEROID3',	150,	160,	100,	f=F_.Substance},
			{id='nanites',		315,	335,	100,	f=F_.Nanites},
		}
	},
	Test_Loot_09 = {
		id = 'TEST_REWARD_09',
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
	NMS_VERSION			= '3.42',
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
				ADD					= F_.Product({id='ALLOY2', 1, 1, 30})
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'PIRAT_LOOT_HARD', 'ID', 'STELLAR2'},
				SECTION_UP			= 1,
				REPLACE_TYPE		= 'ADDAFTERSECTION',
				ADD					= F_.Product({id='ALLOY2', 1, 1, 30})
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
					{'Duration',		2.4},	-- 10
					{'ForwardBoost',	1.5},	-- 4.5
					{'UpBoost',			1.2},	-- 0.8
					{'IgnitionBoost',	1.2},	-- 1.9
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Id', 'MIXER_JETPACK'},
				VALUE_CHANGE_TABLE 	= {				
					{'Duration',		2.4},	-- 10
					{'ForwardBoost',	1.5},	-- 4.5
					{'UpBoost',			1.2},	-- 0.8
					{'IgnitionBoost',	1.2},	-- 1.9
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Id', 'DE_FOOD_JETPACK'},
				VALUE_CHANGE_TABLE 	= {				
					{'Duration',		2.4},	-- 10
					{'ForwardBoost',	1.5},	-- 4.5
					{'UpBoost',			1.2},	-- 0.8
					{'IgnitionBoost',	1.2},	-- 1.9
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'FREIGHTERLOOT'},
				REMOVE				= 'SECTION'
			},
			{
				PRECEDING_KEY_WORDS	= 'GenericTable',
				ADD					= Rewards.BuildRewardTableEntry(Rewards.FreightLoot_Explorer)
									  ..
									  Rewards.BuildRewardTableEntry(Rewards.FreightLoot_Trader)
									  ..
									  Rewards.BuildRewardTableEntry(Rewards.FreightLoot_Warrior)
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
