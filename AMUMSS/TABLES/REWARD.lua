--[[┎────────────────────────────────────────────────────────────
	┃ Replace police loot trade boost with speed boost
	┃ Increase wild plants yield
────┸────────────────────────────────────────────────────────--]]
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

local function AddRewardItem(id, min, max, chance)
	return [[
	<Property value="GcRewardTableItem.xml">
		<Property name="PercentageChance" value="]] .. chance .. [[" />
		<Property name="Reward" value="GcRewardSpecificProduct.xml">
			<Property name="Default" value="GcDefaultMissionProductEnum.xml">
				<Property name="DefaultProductType" value="None" />
			</Property>
			<Property name="ID" value="]] .. id .. [[" />
			<Property name="AmountMin" value="]] .. min .. [[" />
			<Property name="AmountMax" value="]] .. max .. [[" />
			<Property name="ForceSpecialMessage" value="False" />
			<Property name="HideInSeasonRewards" value="False" />
			<Property name="Silent" value="False" />
		</Property>
		<Property name="LabelID" value="" />
	</Property>]]
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE REWARD.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.38',
	MOD_BATCHNAME		= '_TABLES ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'POLICELOOT', 'ID', 'FRIG_BOOST_TRA'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'FRIG_BOOST_SPD'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'PIRATELOOT', 'ID', 'STELLAR2'},
				SECTION_UP			= 1,
				REPLACE_TYPE		= 'ADDAFTERSECTION',
				ADD					= AddRewardItem('ALLOY2', 1, 1, 30)
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'PIRAT_LOOT_HARD', 'ID', 'STELLAR2'},
				SECTION_UP			= 1,
				REPLACE_TYPE		= 'ADDAFTERSECTION',
				ADD					= AddRewardItem('ALLOY2', 1, 1, 30)
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Plant_Harvest)
	}
}}}}
