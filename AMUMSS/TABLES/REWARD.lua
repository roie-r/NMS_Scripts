--[[┎────────────────────────────────────────────────────────────
	┃ Replace police loot trade boost with speed boost
	┃ Increase wild plants yield
────┸────────────────────────────────────────────────────────--]]
f_min = 1.2
w_min = 2
mult  = 1.2

Plant_Harvest = {
	dat = {
		{'FOOD_P_ALL1',		f_min,	f_min * mult},	-- Heptaploid Wheat
		{'FOOD_P_ALL2',		f_min,	f_min * mult},	-- Sweetroot
		{'FOOD_P_ALL3',		f_min,	f_min * mult},	-- Pulpy Roots
		{'FOOD_P_HOTWILD',	f_min,	f_min * mult},	-- Fireberry
		{'FOOD_P_RADWILD',	f_min,	f_min * mult},	-- Grahberry
		{'FOOD_P_DUSTWILD',	f_min,	f_min * mult},	-- Aloe Flesh
		{'FOOD_P_COLDWILD',	f_min,	f_min * mult},	-- Frozen Tubers
		{'FOOD_P_TOXWILD',	f_min,	f_min * mult},	-- Jade Peas
		{'FOOD_P_LUSHWILD',	f_min,	f_min * mult},	-- Impulse Beans
		{'FOOD_P_GLITCH',	f_min,	f_min * mult},	-- Hexaberry
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

function BuildExmlChangeTable(tbl)
	local T = {}
	for i = 1, #tbl.dat do table.insert(T, tbl.Get(tbl.dat[i])) end
	return T
end

function AddRewardItem(id, min, max, chance)
	return [[
		<Property value="GcRewardTableItem.xml">
			<Property name="PercentageChance" value="]] .. chance .. [[" />
			<Property name="Reward" value="GcRewardSpecificProduct.xml">
				<Property name="Default" value="GcDefaultMissionProductEnum.xml">
					<Property name="DefaultProductType" value="None" />
				</Property>
				<Property name="Id" value="]] .. id .. [[" />
				<Property name="AmountMin" value="]] .. min .. [[" />
				<Property name="AmountMax" value="]] .. max .. [[" />
				<Property name="ForceSpecialMessage" value="False" />
			</Property>
			<Property name="LabelID" value="" />
		</Property>
	]]
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE REWARD.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.35',
	MOD_BATCHNAME		= '_TABLES ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'POLICELOOT', 'Id', 'FRIG_BOOST_TRA'},
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'FRIG_BOOST_SPD'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'PIRATELOOT'},
				PRECEDING_KEY_WORDS = 'List',
				ADD					= AddRewardItem('ALLOY2', 1, 1, 30)
			},
			{
				SPECIAL_KEY_WORDS	= {'Id', 'PIRAT_LOOT_HARD'},
				PRECEDING_KEY_WORDS = 'List',
				ADD					= AddRewardItem('ALLOY2', 1, 1, 30)
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\REWARDTABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Plant_Harvest)
	}
}}}}
