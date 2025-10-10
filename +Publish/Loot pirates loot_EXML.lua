-------------------------------------------------------------------------------
-- Replace space pirates & raids loot with a more varied selection
-------------------------------------------------------------------------------

local mod_path	= 'D:/MODZ_stuff/NoMansSky/Published/Loot pirates loot/_MOD.lMonk.Loot pirates loot/'

local function WriteExmlFile(path, data, template)
	local function PathSplit(p)
		return {p:gsub('/', '\\'):match('^(.-)([^\\/]-)(%.[^.]-)$')}
	end
	os.execute(('if not exist "<>" md "<>"'):gsub('<>', PathSplit(path)[1]))
	local w_src = io.open(path, 'w')
	w_src:write(ToMxmlFile(data, template))
	w_src:close()

	print(('File %s.exml created.'):format(PathSplit(path)[2]))
end

--- write aispaceshipattackdatatable ------------------------------------------
dofile('../LIB/_lua_2_mxml.lua')

local aiship_data_reward = {
	PIRATE_NOSHIELD	= 'PIRATELOOT_EASY',
	PIRATE_EASY 	= 'PIRATELOOT_EASY',
	PIRATE		 	= 'PIRATELOOT_NORM',
	PIRATE_HARD	 	= 'PIRATELOOT_HARD',
	PIRATE_FREIGHT 	= 'PIRATELOOT_EASY',
	POLICE			= 'POLICELOOT',
	RAID_BUILDING	= 'RAIDLOOT',
	RAID_DOGFIGHT	= 'RAIDLOOT',
	PLANET_FLYBY	= 'PIRATELOOT_EASY',
}

local shp_ai = { meta = {name='Definitions'} }
for id, rwd in pairs(aiship_data_reward) do
	shp_ai[#shp_ai+1] = {
		meta = {name='Definitions', value='GcShipAICombatDefinition', _id=id},
		ID		= id,
		Reward	= rwd
	}
end

WriteExmlFile(
	mod_path..'METADATA/SIMULATION/SPACE/AISPACESHIPATTACKDATATABLE.EXML',
	shp_ai,
	'cGcShipAIAttackDataTable'
)
--- write rewardtable ---------------------------------------------------------
dofile('../LIB/reward_entry.lua')

local new_rewards = {
	PIRATELOOT_EASY = {--- pirate attack :: easy ---
		choice 		= RC_.G1_ONE,
		zeroseed	= true,
		itemlist	= {
			--id					Min			Max			%		function
			{id='PIRATE_PROD',					mx=1,		c=0,	f=R_Product},
			{id='SHIPCHARGE',					mx=1,		c=50,	f=R_Product},
			{id='TRA_ALLOY1',		mn=1,		mx=2,		c=40,	f=R_Product},
			{id='TRA_ENERGY1',		mn=1,		mx=2,		c=40,	f=R_Product},
			{id='TRA_EXOTICS1',		mn=1,		mx=2,		c=40,	f=R_Product},
			{id='ILLEGAL_PROD3',	mn=1,		mx=2,		c=40,	f=R_Product},
			{pc=PC_.DBI,			rt=RT_.C,				c=30,	f=R_ProcProduct},
			{pc=PC_.DTC,			rt=RT_.C,				c=30,	f=R_ProcProduct},
			{id=CU_.UT,				mn=18000,	mx=30000,	c=30,	f=R_Money}
		}
	},
	PIRATELOOT_NORM = {--- pirate attack :: normal ---
		choice 		= RC_.G1_ONE,
		zeroseed 	= true,
		itemlist	= {
			--id					Min			Max			%		function
			{id='PIRATE_PROD',					mx=1,		c=0,	f=R_Product},
			{id='SHIPCHARGE',		mn=1,		mx=2,		c=50,	f=R_Product},
			{id='SCRAP_GOODS',					mx=1,		c=60,	f=R_Product},
			{id='SCRAP_TECH',					mx=1,		c=60,	f=R_Product},
			{id='SCRAP_WEAP',					mx=1,		c=60,	f=R_Product},
			{id='TRA_ALLOY3',		mn=1,		mx=3,		c=40,	f=R_Product},
			{id='TRA_ENERGY3',		mn=1,		mx=3,		c=40,	f=R_Product},
			{id='TRA_COMPONENT3',	mn=1,		mx=3,		c=40,	f=R_Product},
			{id='TRA_MINERALS3',	mn=1,		mx=3,		c=40,	f=R_Product},
			{id='ILLEGAL_PROD4',	mn=1,		mx=2,		c=30,	f=R_Product},
			{id='AF_METAL',			mn=100,		mx=130,		c=30,	f=R_Substance},
			{pc=PC_.DBI,			ort=true,	rt=RT_.U,	c=30,	f=R_ProcProduct},
			{pc=PC_.DTC,			ort=true,	rt=RT_.U,	c=30,	f=R_ProcProduct},
			{id=CU_.NN,				mn=100,		mx=250,		c=20,	f=R_Money}
		}
	},
	PIRATELOOT_HARD = {--- pirate attack :: hard level ---
		choice 		= RC_.G1_ONE,
		zeroseed	= true,
		itemlist	= {
			--id					Min			Max			%		function
			{id='PIRATE_PROD',					mx=1,		c=0,	f=R_Product},
			{id='SHIPCHARGE',		mn=1,		mx=3,		c=50,	f=R_Product},
			{id='WATER2',			mn=260,		mx=360,		c=40,	f=R_Substance},
			{id='EX_GREEN',			mn=150,		mx=250,		c=40,	f=R_Substance},
			{id='EX_BLUE',			mn=120,		mx=220,		c=40,	f=R_Substance},
			{id='AF_METAL',			mn=110,		mx=180,		c=40,	f=R_Substance},
			{id='SCRAP_GOODS',					mx=1,		c=40,	f=R_Product},
			{id='SCRAP_TECH',					mx=1,		c=40,	f=R_Product},
			{id='SCRAP_WEAP',					mx=1,		c=40,	f=R_Product},
			{id='TRA_ENERGY4',		mn=1,		mx=3,		c=50,	f=R_Product},
			{id='TRA_ALLOY4',		mn=1,		mx=3,		c=50,	f=R_Product},
			{id='TRA_EXOTICS4',		mn=1,		mx=3,		c=50,	f=R_Product},
			{id='TRA_TECH4',		mn=1,		mx=3,		c=50,	f=R_Product},
			{id='ILLEGAL_PROD5',	mn=1,		mx=2,		c=30,	f=R_Product},
			{id='GEODE_RARE',					mx=1,		c=20,	f=R_Product},
			{pc=PC_.DBI,			ort=true,	rt=RT_.U,	c=20,	f=R_ProcProduct},
			{pc=PC_.DTC,			ort=true,	rt=RT_.U,	c=20,	f=R_ProcProduct},
			{id=CU_.NN,				mn=300,		mx=400,		c=20,	f=R_Money}
		}
	},
	RAIDLOOT		= {--- pirate attack :: building raid ---
		choice 		= RC_.G1_ONE,
		itemlist	= {
			--id					Min			Max			%		function
			{id='PIRATE_PROD',					mx=1,		c=0,	f=R_Product},
			{id='SHIPCHARGE',					mx=1,		c=50,	f=R_Product},
			{id='SCRAP_GOODS',					mx=1,		c=40,	f=R_Product},
			{id='SCRAP_TECH',					mx=1,		c=40,	f=R_Product},
			{id='ILLEGAL_PROD2',	mn=1,		mx=4,		c=30,	f=R_Product},
			{id='WATER2',			mn=260,		mx=280,		c=30,	f=R_Substance},
			{id='GEODE_RARE',					mx=1,		c=20,	f=R_Product},
			{pc=PC_.DBI,			ort=true,	rt=RT_.U,	c=20,	f=R_ProcProduct},
			{pc=PC_.DTC,			ort=true,	rt=RT_.U,	c=20,	f=R_ProcProduct},
			{id=CU_.UT,				mn=25000,	mx=35000,	c=20,	f=R_Money}
		}
	}
}

local reward_generic = { meta = {name='GenericTable'} }
for id, rwd in pairs(new_rewards) do
	rwd.id = id
	reward_generic[#reward_generic+1] = R_RewardTableEntry(rwd)
end

WriteExmlFile(
	mod_path..'METADATA/REALITY/TABLES/REWARDTABLE.EXML',
	reward_generic,
	'cGcRewardTable'
)
