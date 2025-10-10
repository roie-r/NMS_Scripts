--------------------------------------------------------------
local mod_desc = [[
  Increase number of attackers in bounty and pirate missions
  Reduce number of planet flybys and outpost visits
  Increase enemy and NPC ships total health and varied loot
]]------------------------------------------------------------

local mxc_ex = {}
--	ship spawns
for fly, spawns in pairs({
	FlybySpawns = {
		{pr='Count',		x=0,	y=2},
		{pr='Spread',		x=30,	y=70},
		{pr='StartTime',	x=0,	y=4},
		{pr='MinRange',		rg=200},
		{pr='Offset',		rg=240}
	},
	OutpostSpawns = {
		{pr='Count',		x=-1,	y=-1}
	},
	PirateSpawns = {
		{pr='Spread',		x=0,	y=40,	a=true},
		{pr='Count',		x=0,	y=1,	a=true}
	},
	PlanetaryPirateFlybySpawns = {
		{pr='Count',		x=0,	y=1},
		{pr='StartTime',	x=0,	y=3}
	},
	PlanetaryPirateRaidSpawns = {
		{pr='Count',		x=0,	y=1},
		{pr='StartTime',	x=0,	y=3}
	},
	FrigateFlybySpawns = {
		{pr='Count',		x=0,	y=1},
		{pr='MinRange',		rg=800}
	}
}) do
	for _,spn in ipairs(spawns) do
		local T = {
			REPLACE_TYPE 	= spn.a and 'All' or nil,
			SKW				= {fly, 'GcAIShipSpawnData'},
			VCT				= {}
		}
		if spn.y then
			T.PKW			= spn.pr
			T.VCT[#T.VCT+1]	= {'X',	'@ +'..spn.x}
			T.VCT[#T.VCT+1]	= {'Y',	'@ +'..spn.y}
		elseif spn.rg then
			T.VCT[#T.VCT+1]	= {spn.pr, '@ +'..spn.rg}
		end
		mxc_ex[#mxc_ex+1]	= T
	end
end

-- bounty missions spawns
local bounty_prop	= {'Count', 'Spread',	'StartTime'}
for id, bty in pairs({
	BOUNTY1			= {{0, 2},	{0, 30},	{0, 2}},
	BOUNTY2			= {{0, 2},	{0, 35},	{0, 2}},
	BOUNTY3			= {{1, 1},	{0, 40},	{0, 3}},
	EASYBOUNTY1		= {{0, 1},	{0, 30},	{0, 2}},
	EASYBOUNTY2		= {{0, 1},	{0, 30},	{0, 2}},
	MEDBOUNTY1		= {{0, 1},	{0, 30},	{0, 2}},
	MEDBOUNTY2		= {{1, 1},	{0, 40},	{0, 2}},
	HARDBOUNTY1		= {{1, 2},	{0, 35},	{0, 3}},
	HARDBOUNTY2		= {{1, 2},	{0, 40},	{0, 3}},
	WEAPGUY_BOUNTY	= {{0, 2},	{0, 30},	{0, 2}},
	PIRATE_SQUAD	= {{0, 1},	{0, 80},	{0, 3}},
	PP_BOUNTY		= {{1, 2},	{0, 35},	{0, 2}},
}) do
	for i=1, #bounty_prop do
		mxc_ex[#mxc_ex+1] = {
			MATH_OPERATION 		= '+',
			SPECIAL_KEY_WORDS	= {'Id', id},
			PRECEDING_KEY_WORDS	= bounty_prop[i], -- set index ??
			VALUE_CHANGE_TABLE	= {
				{'X',		bty[i][1]},
				{'Y',		bty[i][2]}
			}
		}
	end
end

local mxc_ai = {}
for id, ai in pairs({
	PIRATE_NOSHIELD	= {hl=1.2,		eh=1.1,	rw='PIRATELOOT_EASY'},
	PIRATE_EASY 	= {hl=1.1,		eh=1.2,	rw='PIRATELOOT_EASY'},
	PIRATE		 	= {hl=1.2,		eh=1.2,	rw='PIRATELOOT'},
	PIRATE_HARD	 	= {hl=1.2,		eh=0.9,	rw='PIRATELOOT_HARD'},
	PIRATE_FREIGHT 	= {hl=0.95,		eh=0.95,rw='PIRATELOOT_EASY'},
	POLICE			= {hl=1.1,		eh=1,	rw='POLICELOOT'},
	TRADER			= {hl=1.2,		eh=1},
	TRADER_ESCORT	= {hl=1.1,		eh=0.9},
	['RAID_.-'] 	= {hl=1.1,		eh=1,	rw='RAIDLOOT'},
	PLANET_FLYBY	= {hl=1.2,		eh=2,	rw='PIRATELOOT_EASY'},
	['SQUADRON_.-']	= {hl=1.2,		eh=1.1},
	WEAK			= {hl=1600,				rd=9},
	STRONG			= {						rd=9},
	FAST			= {						rd=4},
	FAST_STRONG		= {						rd=6},
}) do
	if ai.rw then
		mxc_ai[#mxc_ai+1] = {
			PRECEDING_FIRST		= true,
			PRECEDING_KEY_WORDS = 'Definitions',
			SPECIAL_KEY_WORDS	= {'Id', id},
			VALUE_CHANGE_TABLE	= {
				{'Reward',		ai.rw}
			}
		}
	end
	if ai.eh then
		mxc_ai[#mxc_ai+1] = {
			PRECEDING_FIRST		= true,
			PRECEDING_KEY_WORDS = 'Definitions',
			MATH_OPERATION 		= '*',
			INTEGER_TO_FLOAT	= 'Preserve',
			SPECIAL_KEY_WORDS	= {'Id', id},
			VALUE_CHANGE_TABLE	= {
				{'Health',				ai.hl},
				{'LevelledExtraHealth',	ai.eh}
			}
		}
	end
	if ai.rd then
		mxc_ai[#mxc_ai+1] = {
			PRECEDING_FIRST		= true,
			PRECEDING_KEY_WORDS = 'ShieldTable',
			SPECIAL_KEY_WORDS	= {'Id', id},
			VALUE_CHANGE_TABLE	= {
				{'RechargeDelayTime',	ai.rd},
				{'Health',				ai.hl or 'IGNORE'}
			}
		}
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META ambient spawns & ship health',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SCENE/EXPERIENCESPAWNTABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= mxc_ex
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SPACE/AISPACESHIPATTACKDATATABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= mxc_ai
	}
}}}}
