dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/reward_entry.lua')
--------------------------------------------------------------------------
local mod_desc = [[
  Replace freighter after-warp-battle reward with better a selection
  with something different from each race
  * (the lists are non-random because a bug causes them to misbehave)
]]------------------------------------------------------------------------
--<<M2L marker>>--

local new_rewards = {
	R_PIR_TRIBUTE	= {--- pirate freighter defeat tribute ---
		overwrite	= true,
		choice		= RC_.ONE,
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
	FREIGHTERSAVE_E	= {--- freighter defense :: explorer ---
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
	FREIGHTERSAVE_T	= {--- freighter defense :: trader ---
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
	FREIGHTERSAVE_W	= {--- freighter defense :: warior ---
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
			{id='MIRROR',       	mn=1,	mx=2,		c=6,	f=R_Product},
		}
	}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.Freighter Defense Rewards',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		MXML_CHANGE_TABLE	= (
			function()
				local rewards = {}
				for id, rwd in pairs(new_rewards) do
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
					rwd.id = id
					rewards[#rewards+1] = R_RewardTableEntry(rwd)
				end
				return {{
					PRECEDING_KEY_WORDS	= 'GenericTable',
					ADD					= ToMxml(rewards)
				}}
			end
		)()
	},
	-- {
		-- MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_DIALOG_GCALIENPUZZLETABLE.MBIN',
		-- MXML_CHANGE_TABLE	= {
			-- {
				-- VALUE_MATCH			= 'FREIGHTER_SAVED',
				-- SPECIAL_KEY_WORDS	= {'Id', '%?FREIGHTER', 'AlienRace', 'Warriors'},
				-- SECTION_UP			= 1,
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Rewards',		'FREIGHTERSAVE_W'}
				-- }
			-- },
			-- {
				-- VALUE_MATCH			= 'FREIGHTER_SAVED',
				-- SPECIAL_KEY_WORDS	= {'Id', '%?FREIGHTER', 'AlienRace', 'Explorers'},
				-- SECTION_UP			= 1,
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Rewards',		'FREIGHTERSAVE_E'}
				-- }
			-- },
			-- {
				-- VALUE_MATCH			= 'FREIGHTER_SAVED',
				-- SPECIAL_KEY_WORDS	= {'Id', '%?FREIGHTER', 'AlienRace', 'Traders'},
				-- SECTION_UP			= 1,
				-- VALUE_CHANGE_TABLE 	= {
					-- {'Rewards',		'FREIGHTERSAVE_T'}
				-- }
			-- },
		-- }
	-- }
}}}}
