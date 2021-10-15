--[[┎─────────────────────────────────────────────────────────────────────
	┃ Replace freighter defense reward (requires changes in AlienPuzzle)
	┃ Changes to pirate battle loot
	┃ Add all 5 boosters to police loot
	┃ Increase wild plants harvest yield
────┸─────────────────────────────────────────────────────────────────--]]
F_ = {
	Product = function(item)
		local exml = [[
			<Property name="Default" value="GcDefaultMissionProductEnum.xml">
				<Property name="DefaultProductType" value="None" />
			</Property>
			<Property name="ID" value="]]..item.id..[[" />
			<Property name="ForceSpecialMessage" value="False" />
			<Property name="HideInSeasonRewards" value="False" />
			<Property name="Silent" value="False"/>
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
			<Property name="Silent" value="False"/>
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
	Word = function(item)
		local exml = [[
			<Property name="Race" value="GcAlienRace.xml">
				<Property name="AlienRace" value="]]..item.id..[[" />
			</Property>
			<Property name="UseCategory" value="False" />
			<Property name="Category" value="GcWordCategoryTableEnum.xml">
				<Property name="gcwordcategorytableEnum" value="MISC" />
			</Property>
		]]
		return F_.TableItemSingle(item, exml, 'GcRewardTeachWord.xml')
	end,
	Shield = function(item)
		return F_.TableItemSingle(item, '', 'GcRewardShield.xml')
	end,
	TableItemSingle = function(item, data, reward)
		return [[
			<Property value="GcRewardTableItem.xml">
				<Property name="PercentageChance" value="]]..item.c..[[" />
				<Property name="Reward" value="]]..reward..[[">
					]]..data..[[
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
	TableItemMulti = function(item, data, reward)
		return [[
			<Property value="GcRewardTableItem.xml">
				<Property name="PercentageChance" value="]]..item.c..[[" />
				<Property name="Reward" value="]]..reward..[[">
					]]..data..[[
				</Property>
				<Property name="LabelID" value="" />
			</Property>
		]]
	end
}

Learn_More_Words = {
	dat = {
		{'WORD',			'None',			2},
		{'EXP_WORD',		'Explorers',	2},
		{'TRA_WORD',		'Traders',		2},
		{'WAR_WORD',		'Warriors',		2},
		{'TEACHWORD_EXP',	'Explorers',	2},
		{'TEACHWORD_TRA',	'Traders',		2},
		{'TEACHWORD_WAR',	'Warriors',		2},
		{'TEACHWORD_ATLAS',	'Atlas',		2},
	},
	Get = function(x)
		return {
			-- SPECIAL_KEY_WORDS	= {'Id', x[1]},
			SPECIAL_KEY_WORDS	= {'Id', x[1], 'Reward', 'GcRewardTeachWord.xml'},
			SECTION_UP			= 1,
			-- PRECEDING_KEY_WORDS = 'GcRewardTableItem.xml',
			REPLACE_TYPE		= 'ADDAFTERSECTION',
			ADD					= F_.Word({id=x[2], n=1, x=1, c=100})
		}
	end
}

local function BuildExmlChangeTable(tbl)
	local T = {}
	for _,v in pairs(tbl.dat) do table.insert(T, tbl.Get(v)) end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TEST 03 REWARDs.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.68',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Learn_More_Words)
	}
}}}}
