dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/reward_entry.lua')
-------------------------------------------------------------------
local mod_desc = [[
	Replace space pirates & raids loot with a more varied selection
]]-----------------------------------------------------------------
--<<M2L marker>>--

local new_rewards = {
	{--- pirate attack :: easy ---
		id			= 'PIRATELOOT_EASY',
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
	{--- pirate attack :: normal ---
		id			= 'PIRATELOOT_NORM',
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
	{--- pirate attack :: hard level ---
		id			= 'PIRATELOOT_HARD',
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
	{--- pirate attack :: building raid ---
		id			= 'RAIDLOOT',
		choice 		= RC_.G1_ONE,
		zeroseed	= true,
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

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.Loot pirates loot',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.5+',
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		MXML_CHANGE_TABLE	= (
			function()
				local rewards = {}
				for _,rwd in ipairs(new_rewards) do
					rewards[#rewards+1] = R_RewardTableEntry(rwd)
				end
				return {{
					PRECEDING_KEY_WORDS	= 'GenericTable',
					ADD					= ToMxml(rewards)
				}}
			end
		)()
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SPACE/AISPACESHIPATTACKDATATABLE.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'Definitions',
				SPECIAL_KEY_WORDS	= {'Id', 'PIRATE_EASY'},
				VALUE_CHANGE_TABLE	= {
					{'Reward',		'PIRATELOOT_EASY'}
				}
			},
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'Definitions',
				SPECIAL_KEY_WORDS	= {'Id', 'PIRATE'},
				VALUE_CHANGE_TABLE	= {
					{'Reward',		'PIRATELOOT_NORM'}
				}
			},
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'Definitions',
				SPECIAL_KEY_WORDS	= {'Id', 'PIRATE_HARD'},
				VALUE_CHANGE_TABLE	= {
					{'Reward',		'PIRATELOOT_HARD'}
				}
			},
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'Definitions',
				SPECIAL_KEY_WORDS	= {'Id', 'RAID_BUILDING'},
				VALUE_CHANGE_TABLE	= {
					{'Reward',		'RAIDLOOT'}
				}
			},
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'Definitions',
				SPECIAL_KEY_WORDS	= {'Id', 'RAID_DOGFIGHT'},
				VALUE_CHANGE_TABLE	= {
					{'Reward',		'RAIDLOOT'}
				}
			},
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'Definitions',
				SPECIAL_KEY_WORDS	= {'Id', 'POLICE'},
				VALUE_CHANGE_TABLE	= {
					{'Reward',		'POLICELOOT'}
				}
			},
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'Definitions',
				SPECIAL_KEY_WORDS	= {'Id', 'PLANET_FLYBY'},
				VALUE_CHANGE_TABLE	= {
					{'Reward',		'PIRATELOOT_EASY'}
				}
			}
		}
	}
}}}}