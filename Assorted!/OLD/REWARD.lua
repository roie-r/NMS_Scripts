-----------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/reward_entry.lua')
-----------------------------------------------------------------------
local mod_desc = [[
  A system for adding & replacing rewards.
  - freighter defense reward (requires changes in AlienPuzzle)
  - crashed freighter containers
  - salvaged glass (sentinel loot)
  - pirate battles loot
  - jetpack boost bonuses
  - wild plants harvest higher and more varid yield
  - caltivated plants harvest varid yield
  - more words learned at word stones and other places
]]---------------------------------------------------------------------

local new_rewards = {
	{--- "metal fingers" rare resource ---
		active		= true,
		id			= 'DE_RARE_GOLD',
		choice		= RC_.ONE,
		overwrite	= true,
		itemlist	= {
			--id					Min		Max			%		function
			{id='ASTEROID2',		mn=100,	mx=200,		c=90,	f=R_Substance,	bb=true},
			{id='RADIO1',			mn=200,	mx=250,		c=80,	f=R_Substance,	bb=true},
			{id='DUSTY1',			mn=120,	mx=240,		c=40,	f=R_Substance,	bb=true},
			{id='YELLOW2',			mn=210,	mx=260,		c=40,	f=R_Substance,	bb=true},
		}
	},
	{--- huge flora prop ---
		active		= true,
		id			= 'DE_PLANT_HUGE',
		choice		= RC_.ALL,
		itemlist	= {
			--id					Min		Max			%		function
			{id='FUEL2',			mn=50,	mx=150,		c=100,	f=R_Substance},
			{id='SPACEGUNK5',		mn=15,	mx=45,		c=100,	f=R_Substance},
		}
	},
	{--- huge rock prop ---
		active		= true,
		id			= 'DE_ROCK_HUGE',
		choice		= RC_.ALL,
		itemlist	= {
			--id					Min		Max			%		function
			{id='LAND2',			mn=50,	mx=150,		c=100,	f=R_Substance},
			{id='GEODE_LAND', 		mn=1,	mx=2,		c=10,	f=R_DisguisedProduct,	display='LAND2'}
		}
	},
	{--- sentinel salvaged glass shard ---
		active		= true,
		id			= 'DE_SENT_LOOT',
		choice		= RC_.ONE,
		overwrite	= true,
		itemlist	= {
			--id					Min		Max			%		function
			{id='CHART_HIVE',				mx=1,		c=2,	f=R_Product},
			{id='U_SENTGUN',				mx=1,		c=25,	f=R_Product},
			{id='U_SENTSUIT',				mx=1,		c=25,	f=R_Product},
			{id='COMPUTER',     	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='ANTIMATTER',   	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='MAGNET',       	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='HYDRALIC',     	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='MIRROR',       	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='BIO',          	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='MECH_PROD',    	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='WALKER_PROD',  	mn=1,	mx=2,		c=6,	f=R_Product},
			{id='ALLOY1',    				mx=1,		c=4,	f=R_Product},
			{id='ALLOY2',    				mx=1,		c=4,	f=R_Product},
			{id='ALLOY3',    				mx=1,		c=4,	f=R_Product},
			{id='ALLOY4',    				mx=1,		c=4,	f=R_Product},
			{id='ALLOY5',    				mx=1,		c=4,	f=R_Product},
			{id='ALLOY6',    				mx=1,		c=4,	f=R_Product},
			{id='ALLOY7',    				mx=1,		c=1,	f=R_Product},
			{id='ALLOY8',    				mx=1,		c=1,	f=R_Product},
			{id=CU_.HG,				mn=100,	mx=160,		c=10,	f=R_Money}
		}
	},
	{--- crashed freighter containers ---
		active		= true,
		id			= 'CRASHCONT_M',
		overwrite	= true,
		choice		= RC_.ONE,
		itemlist	= {
			{id=CU_.UT,	mn=25000,	mx=75000,	c=50,	f=R_Money},
			{
				f	= R_MultiItem,
				c	= 45,
				lst	= {
					{id='LAUNCHFUEL',		am=1, 	mi=MI_.PRD},
					{id='BP_SALVAGE',		am=3, 	mi=MI_.PRD},
					{pc=PC_.DTC, 			qt=2,	mi=MI_.PRP}
				}
			},
			{
				f	= R_MultiItem,
				c	= 45,
				lst	= {
					{id='ANTIMATTER',		am=2, 	mi=MI_.PRD},
					{id='AM_HOUSING',		am=2, 	mi=MI_.PRD},
					{id='TECHFRAG',			am=230, mi=MI_.SBT}
				}
			},
			{
				f	= R_MultiItem,
				c	= 35,
				lst	= {
					{id='FRIG_TOKEN',		am=1, 	mi=MI_.PRD},
					{id='TIMEMILK',			am=94, 	mi=MI_.SBT}
				}
			},
			{
				f	= R_MultiItem,
				c	= 35,
				lst	= {
					{id='WEAP_INV_TOKEN',	am=1, 	mi=MI_.PRD},
					{id='AF_METAL',			am=117, mi=MI_.SBT}
				}
			},
			{id=CU_.UT,	mn=150000,	mx=260000,	c=20,	f=R_Money},
			{
				f	= R_MultiItem,
				c	= 25,
				lst	= {
					{id='FARMPROD1',		am=1, 	mi=MI_.PRD},	-- Acid
					{id='WATER1',			am=243, mi=MI_.SBT}
				}
			},
			{
				f	= R_MultiItem,
				c	= 25,
				lst	= {
					{id='FARMPROD5',		am=1, 	mi=MI_.PRD},	-- Poly Fibre
					{id='WATER2',			am=189, mi=MI_.SBT}
				}
			},
			{
				f	= R_MultiItem,
				c	= 25,
				lst	= {
					{id='SALVAGE_TECH8',	am=1, 	mi=MI_.PRD},	-- Subatomic Regulators
					{id='ROBOT1',			am=203, mi=MI_.SBT}
				}
			},
			{
				f	= R_MultiItem,
				c	= 25,
				lst	= {
					{id='SALVAGE_TECH7',	am=1, 	mi=MI_.PRD},	-- Recycled Circuitry
					{id='ROBOT2',			am=180, mi=MI_.SBT}
				}
			},
			{
				f	= R_MultiItem,
				c	= 2,
				lst	= {
					{id='FREI_INV_TOKEN',	am=2, 	mi=MI_.PRD},	-- freighter inv
					{id='SENTFREI_PROD',	am=3, 	mi=MI_.PRD}		-- AI Fragment
				}
			},
			-- freighter hyper
			{
				f	= R_MultiItem,
				c	= 5,
				lst	= {
					{pc=PC_.FRH, 			qt=0,	mi=MI_.PRP},
					{id='CASING',			am=5, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 2,
				lst	= {
					{pc=PC_.FRH, 			qt=1,	mi=MI_.PRP},
					{id='COMPOUND6',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRH, 			qt=2,	mi=MI_.PRP},
					{id='PRODFUEL2',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRH, 			qt=3,	mi=MI_.PRP},
					{id='ILLEGAL_PROD6',	am=1, 	mi=MI_.PRD}
				}
			},
			-- freighter fuel
			{
				f	= R_MultiItem,
				c	= 5,
				lst	= {
					{pc=PC_.FRF, 			qt=0,	mi=MI_.PRP},
					{id='NANOTUBES',		am=5, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 2,
				lst	= {
					{pc=PC_.FRF, 			qt=1,	mi=MI_.PRP},
					{id='COMPOUND5',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRF, 			qt=2,	mi=MI_.PRP},
					{id='REPAIRKIT',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRF, 			qt=3,	mi=MI_.PRP},
					{id='ILLEGAL_PROD5',	am=1, 	mi=MI_.PRD}
				}
			},
			-- freighter trade
			{
				f	= R_MultiItem,
				c	= 5,
				lst	= {
					{pc=PC_.FRT, 			qt=0,	mi=MI_.PRP},
					{id='JELLY',			am=5, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 2,
				lst	= {
					{pc=PC_.FRT, 			qt=1,	mi=MI_.PRP},
					{id='COMPOUND4',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRT, 			qt=2,	mi=MI_.PRP},
					{id='BIO',				am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRT, 			qt=3,	mi=MI_.PRP},
					{id='ILLEGAL_PROD4',	am=1, 	mi=MI_.PRD}
				}
			},
			-- freighter combat
			{
				f	= R_MultiItem,
				c	= 5,
				lst	= {
					{pc=PC_.FRC, 			qt=0,	mi=MI_.PRP},
					{id='POWERCELL',		am=5, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 2,
				lst	= {
					{pc=PC_.FRC, 			qt=1,	mi=MI_.PRP},
					{id='COMPOUND3',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRC, 			qt=2,	mi=MI_.PRP},
					{id='MIRROR',			am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRC, 			qt=3,	mi=MI_.PRP},
					{id='ILLEGAL_PROD3',	am=1, 	mi=MI_.PRD}
				}
			},
			-- freighter mining
			{
				f	= R_MultiItem,
				c	= 5,
				lst	= {
					{pc=PC_.FRM, 			qt=0,	mi=MI_.PRP},
					{id='HYDRALIC',			am=3, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 2,
				lst	= {
					{pc=PC_.FRM, 			qt=1,	mi=MI_.PRP},
					{id='COMPOUND2',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRM, 			qt=2,	mi=MI_.PRP},
					{id='MICROCHIP',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRM, 			qt=3,	mi=MI_.PRP},
					{id='ILLEGAL_PROD2',	am=1, 	mi=MI_.PRD}
				}
			},
			-- freighter explore
			{
				f	= R_MultiItem,
				c	= 5,
				lst	= {
					{pc=PC_.FRE, 			qt=0,	mi=MI_.PRP},
					{id='CARBON_SEAL',		am=3, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 2,
				lst	= {
					{pc=PC_.FRE, 			qt=1,	mi=MI_.PRP},
					{id='COMPOUND1',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRE, 			qt=2,	mi=MI_.PRP},
					{id='TRA_ENERGY5',		am=1, 	mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 1,
				lst	= {
					{pc=PC_.FRE, 			qt=3,	mi=MI_.PRP},
					{id='ILLEGAL_PROD1',	am=1, 	mi=MI_.PRD}
				}
			}
		}
	},
	{--- freighter defense :: explorer ---
		active		= true,
		id			= 'FREIGHTERSAVE_E',
		choice		= RC_.ALL,
		itemlist	= {
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{id='HYPERFUEL1',		am=1, 		mi=MI_.PRD},	-- Hyperdrive fuel
					{id='SCRAP_TECH',		am=1, 		mi=MI_.PRD},
					{id='FREI_INV_TOKEN',	am=1, 		mi=MI_.PRD},	-- freighter inv slot
					{id='ASTEROID3',		am=169, 	mi=MI_.SBT},	-- Platinum
					{pc=PC_.SPB,			qt=1,		mi=MI_.PRP},	-- Space Bones Procedural
				}
			},
			{id=CU_.HG,	mn=50,		mx=60,		c=100,	f=R_Money},
		}
	},
	{--- freighter defense :: trader ---
		active		= true,
		id			= 'FREIGHTERSAVE_T',
		choice		= RC_.ALL,
		itemlist	= {
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{id='HYPERFUEL1',		am=1, 		mi=MI_.PRD},
					{id='GEODE_RARE',		am=1, 		mi=MI_.PRD},
					{id='FREI_INV_TOKEN',	am=1, 		mi=MI_.PRD},
					{id='ASTEROID1',		am=523, 	mi=MI_.SBT},	-- silver
					{pc=PC_.SLV,			qt=1,		mi=MI_.PRP},	-- Salvage Procedural
				}
			},
			{id=CU_.UT,	mn=35100,	mx=50200,	c=100,	f=R_Money},
		}
	},
	{--- freighter defense :: warior ---
		active		= true,
		id			= 'FREIGHTERSAVE_W',
		choice		= RC_.ALL,
		itemlist	= {
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{id='HYPERFUEL1',		am=1, 		mi=MI_.PRD},
					{id='SCRAP_WEAP',		am=1, 		mi=MI_.PRD},
					{id='FREI_INV_TOKEN',	am=1, 		mi=MI_.PRD},
					{id='ASTEROID2',		am=387, 	mi=MI_.SBT},	-- gold
					{pc=PC_.DTC,			qt=1,		mi=MI_.PRP}		-- Procedural
				}
			},
			{id=CU_.NN,	mn=190,		mx=270,		c=100,	f=R_Money},
		}
	},
	{--- pirate freighter defeat tribute ---
		active		= true,
		-- id			= 'R_PIR_TRIBUTE',
		id			= 'FR_PIR_TRIB',
		choice		= RC_.ONE,
		-- overwrite	= true,
		itemlist	= {
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{tg='SENTINEL_GUN_NAME_L',	qt=3,	mi=MI_.PRT,	sen=true},
					{tg='SENTINEL_SUIT_NAME_L',	qt=3,	mi=MI_.PRT,	sen=true},
					{id='MEGAPROD3',					mi=MI_.PRD}
				},
			},
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{pc=PC_.FRH,				qt=3,	mi=MI_.PRP},
					{id='MEGAPROD2',					mi=MI_.PRD}
				},
			},
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{pc=PC_.FRC,				qt=3,	mi=MI_.PRP},
					{id='MEGAPROD1',					mi=MI_.PRD}
				},
			},
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{tg='CANNON_NAME_L',		qt=4,	mi=MI_.PRT,	igl=true},
					{tg='RAILGUN1_NAME_L',		qt=4,	mi=MI_.PRT,	igl=true},
					{id='MEGAPROD3',					mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{tg='BOLTSHOTGUN_NAME_L',	qt=4,	mi=MI_.PRT,	igl=true},
					{tg='LASER_NAME_L',			qt=4,	mi=MI_.PRT,	igl=true},
					{id='MEGAPROD3',					mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{tg='UI_RAD_NAME_CORE_L',	qt=4,	mi=MI_.PRT,	igl=true},
					{tg='UI_TOX_NAME_CORE_L',	qt=4,	mi=MI_.PRT,	igl=true},
					{id='MEGAPROD3',					mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{tg='UI_ENERGY_NAME_CORE_L',qt=4,	mi=MI_.PRT,	igl=true},
					{tg='UI_JETPACK_NAME_CORE_L',qt=4,	mi=MI_.PRT,	igl=true},
					{id='MEGAPROD3',					mi=MI_.PRD}
				}
			},
			{
				f	= R_MultiItem,
				c	= 100,
				lst	= {
					{tg='SHIPMINIGUN_NAME_L',	qt=4,	mi=MI_.PRT,	igl=true},
					{tg='SHIPJUMP_NAME_L',		qt=4,	mi=MI_.PRT,	igl=true},
					{id='MEGAPROD2',					mi=MI_.PRD}
				}
			}
		},
		multiadd	= {
			{id='STATION_KEY',					mi=MI_.PRD},
			{id='FREI_INV_TOKEN',		am=2,	mi=MI_.PRD}
		}
	},
	{--- pirate attack :: easy ---
		active		= true,
		id			= 'PIRATELOOT_EASY',
		choice 		= RC_.G1_ONE,
		zeroseed 	= true,
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
		active		= true,
		id			= 'PIRATELOOT',
		choice 		= RC_.G1_ONE,
		zeroseed 	= true,
		overwrite	= true,
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
		active		= true,
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
		active		= true,
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
	},
	{--- jetpack boost :: tech plant ---
		active		= true,
		id			= 'JETPACK_BOOST',
		choice		= RC_.ALL,
		overwrite	= true,
		itemlist	= {
			{id='jetboost',			tm=5,	pw=1.25,	c=100,	f=R_Jetboost}
		}
	},
	{--- jetpack boost :: ? ---
		active		= true,
		id			= 'MIXER_JETPACK',
		choice		= RC_.ALL,
		overwrite	= true,
		itemlist	= {
			{id='jetboost',			tm=4,	pw=1.2,		c=100,	f=R_Jetboost}
		}
	},
	{--- jetpack boost :: consumable product ---
		active		= true,
		id			= 'DE_FOOD_JETPACK',
		choice		= RC_.ALL,
		overwrite	= true,
		itemlist	= {
			{id='jetboost',			tm=3,	pw=1.15,	c=100,	f=R_Jetboost}
		}
	},
	{--- health + shield + stamina + hazard + jetboost = balatant cheat! ---
		active		= true,
		id			= 'HEALTH_MAJOR',
		choice		= RC_.ALL_S,
		itemlist	= {
			{id='wanted_level',		lvl=0,				c=98,	f=R_Wanted},
			{id='no_sentinels',		tm=20,				c=98,	f=R_NoSentinels},
			{id='health',			mn=3,	mx=5,		c=98,	f=R_Health},
			{id='shield',			mn=70,	mx=100,		c=98,	f=R_Shield},
			{id='hazard',			am=-80,				c=98,	f=R_Hazard},
			{id='stamina',			tm=6,				c=98,	f=R_Stamina},
			{id='jetboost',			tm=4,	pw=1.2,		c=98,	f=R_Jetboost}
		}
	},
	{--- quicksilver tiny=30 ---
		active		= true,
		id			= 'RS_QUICKSILV_T',
		choice		= RC_.ALL,
		itemlist	= {
			{id=CU_.HG,	mx=36,			c=100,	f=R_Money}
		}
	},
	{--- restore hazard protection w/extras ---
		active		= true,
		id			= 'REFRESH_HAZ',
		choice		= RC_.ALL,
		overwrite	= true,
		itemlist	= {
			{id='hazard',	bl='UI_RESTORE_HAZARD',	am=-100,	c=100,	f=R_Hazard},
			{
				id={'STRONGLASER', 'VEHICLESTUN'},
				nm='tech list',					c=100,	f=R_TechnologyList},
			{
				id={'SUPERFOOD', 'RAMMOULD5'},
				nm='prod recipe list',			c=100,	f=R_ProductRecipeList
			}
		}
	},
	{--- open page ---
		active		= false,
		id			= 'R_OPEN_PAGE_0',
		choice		= RC_.ALL,
		itemlist	= {
			{id='WeaponCustomisation',	c=100,	f=R_OpenPage}
		}
	},
	{--- open unlockable recipe tree ---
		active		= false,
		id			= 'R_OPEN_TREE_0',
		choice		= RC_.ALL,
		itemlist	= {
			{id='BaseParts',			c=100,	f=R_UnlockTree}
		}
	},
	{--- test 9 ---
		active		= true,
		id			= 'TEST_09',
		choice		= RC_.ONE,
		itemlist	= {
			-- {id='storm',			tm=180,					c=95,	f=R_Storm},
			{id='FOOD_CM_JHOT',					mx=1,		c=98,	f=R_Product},
			{id='BIO',				mn=1,		mx=2,		c=92,	f=R_Product},
			-- {tg='BOLT_NAME_L',					w4=92,		c=95,	f=R_ProcTechProduct},
			-- {pc=PC_.PLT,			rt=RT_.R,				c=92,	f=R_ProcProduct},
			-- {id='SCRAP_WEAP',					mx=1,		c=52,	f=R_Product},
			-- {id='WATER2',			mn=260,		mx=280,		c=2,	f=R_Substance},
			-- {id='WORMDUST',			mn=1060,	mx=1180,	c=2,	f=R_Substance},
		}
	},
	{--- more tests ---
		active		= false,
		id			= 'TEST_99',
		choice		= RC_.ONE,
		itemlist	= {
			-- id					details					%		function
			{id='wanted_level',		lvl=1,					c=95,	f=R_Wanted},
			{id='no_sentinels',		tm=20,					c=95,	f=R_NoSentinels},
			{id='flyby',			tm=5,					c=95,	f=R_FlyBy},
			{id='ROGUE_HAZBOX',					mx=1,		c=10,	f=R_Product},
			{id='UT_SHIPLAS',					mx=1,		c=10,	f=R_Product},
			{pc=PC_.FOS,			rt=RT_.R,				c=10,	f=R_ProcProduct},
			{pc=PC_.SPH,			rt=RT_.U,				c=10,	f=R_ProcProduct},
			{id='SCRAP_WEAP',					mx=1,		c=10,	f=R_Product},
			{id='STEALTH',			sl=true,				c=10,	f=R_Technology},
			{id='ACCESS1',			sl=true,				c=10,	f=R_ProductRecipe},
			{id={'ALLOY4','ALLOY5'},						c=2,	f=R_ProductAllList},
			{id=CU_.NN,				mn=101,		mx=202,		c=100,	f=R_Money}
		}
	}
}

-- loop through the rewards list and return the generated exml
local function AddNewRewardsToChangeTable(T)
	local rewards = {}
	local inx = #T+1
	T[inx] = { SKW={}, REMOVE='Section' }

	for _,rwd in ipairs(new_rewards) do
		if rwd.active == nil or rwd.active == true then
			if rwd.overwrite then
			-- collect exisitng rewards to be removed in SKW
				T[inx].SKW[#T[inx].SKW+1] = {'Ignore', 'GcGenericRewardTableEntry', 'Id', rwd.id}
			end
			if rwd.multiadd then
			-- add repeating items to MultiItem
				for _,rw in ipairs(rwd.itemlist) do
					if rw.f == R_MultiItem then
						for _,ad in ipairs(rwd.multiadd) do
							rw.lst[#rw.lst + 1] = ad
						end
					end
				end
			end
			rewards[#rewards+1] = R_RewardTableEntry(rwd)
		end
	end
	-- remove SKW if none added
	if #T[inx].SKW <= 0 then T[inx] = nil end

	T[#T+1] = {
		PRECEDING_KEY_WORDS	= 'GenericTable',
		ADD					= ToMxml(rewards)
	}
end

local function IncreasePlantHarvest(T)
	for rwd, amnt in pairs({
		['DE_COOK_.-']	= { mn=1.25,	mx=1.55	},
		['WILD_.-']		= { mn=1.5,		mx=1.8	},
		['PLANT_.-']	= { mn=0.9,		mx=1.1	}
	}) do
		T[#T+1] = {
			INTEGER_TO_FLOAT	= 'Preserve',
			SPECIAL_KEY_WORDS	= {'Id', rwd},
			VALUE_CHANGE_TABLE 	= {
				{'AmountMin',	'@ *'..amnt.mn},
				{'AmountMax',	'@ *'..amnt.mx}
			}
		}
	end
end

local function LearnMoreWords(T)
	for id, word in pairs({
		WORD			= {ar=AR_.NON,	n=3},
		EXP_WORD		= {ar=AR_.XPR,	n=3},
		TRA_WORD		= {ar=AR_.TRD,	n=3},
		WAR_WORD		= {ar=AR_.WAR,	n=3},
		TEACHWORD_EXP	= {ar=AR_.XPR,	n=3},
		TEACHWORD_TRA	= {ar=AR_.TRD,	n=3},
		TEACHWORD_WAR	= {ar=AR_.WAR,	n=3},
		TEACHWORD_ATLAS	= {ar=AR_.ATL,	n=3},
		TEACHWORD_BUI	= {ar=AR_.BLD,	n=3},
	}) do
		for _=1, (word.n - 1) do
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {'Id', id},
				PRECEDING_KEY_WORDS = {'List', 'List'},
				ADD					= ToMxml(R_Word({ar=word.ar, mx=1, c=45}))
			}
		end
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY REWARD',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.5+',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		MXML_CHANGE_TABLE	= (
			function()
				local mx_ct = {}
				AddNewRewardsToChangeTable(mx_ct)
				IncreasePlantHarvest(mx_ct)
				LearnMoreWords(mx_ct)

				mx_ct[#mx_ct+1] = {
					REPLACE_TYPE 		= 'All',
					VALUE_CHANGE_TABLE 	= {
						{'DoAerialScan', false}
					}
				}
				-- mx_ct[#mx_ct+1] = {
					-- REPLACE_TYPE 		= 'All',
					-- MATH_OPERATION 		= '*',
					-- SPECIAL_KEY_WORDS	= {'Currency', 'Specials'},
					-- SECTION_UP			= 1,
					-- VALUE_CHANGE_TABLE 	= {
						-- {'AmountMin',	2},
						-- {'AmountMax',	2}
					-- }
				-- }
				return mx_ct
			end
		)()
	}
}}}}
