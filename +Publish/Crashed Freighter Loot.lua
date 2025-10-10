dofile('LIB/_lua_2_mxml.lua')
dofile('LIB/reward_entry.lua')
-------------------------------------------------------------------------------
local mod_desc = [[
  Update crashed freighters loot with a better selection
  including a small chance for freighter upgrades

  TODO: maybe replace reward ID at:
  MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRASHEDFREIGHTER/PARTS/CONTAINERTERMINAL/ENTITIES/TERMINALCHAR.ENTITY.MBIN
  to use EXML
]]-----------------------------------------------------------------------------
--<<M2L marker>>--

local new_rewards = {
	{--- crashed freighter containers ---
		id			= 'CRASHCONT_M',
		choice		= RC_.ONE,
		overwrite	= true,
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
	}
}

-- loop through the rewards list and return the generated exml
local function AddNewRewardsToChangeTable()
	local T	= {}
	local rewards = {}
	local rw_rd = #T+1
	T[rw_rd] = { SKW={}, REMOVE='Section' }

	for _,rwd in ipairs(new_rewards) do
		if rwd.overwrite then
		-- collect exisitng rewards to be removed in SKW
			T[rw_rd].SKW[#T[rw_rd].SKW+1] = {'Ignore', 'GcGenericRewardTableEntry', 'Id', rwd.id}
		end
		rewards[#rewards+1] = R_RewardTableEntry(rwd)
	end
	-- remove SKW if none added
	if #T[rw_rd].SKW <= 0 then T[rw_rd] = nil end

	T[#T+1] = {
		PRECEDING_KEY_WORDS	= 'GenericTable',
		ADD					= ToMxml(rewards)
	}
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.Crashed Freighter Loot',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE,MULTIPLE_STATEMENTS',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',
		MXML_CHANGE_TABLE	= AddNewRewardsToChangeTable()
	}
}}}}