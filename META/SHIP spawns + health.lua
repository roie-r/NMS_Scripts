--------------------------------------------------------------
local mod_desc = [[
  Increase number of attackers in bounty and pirate missions
  Reduce number of planet flybys and outpost visits
  Increase enemy and NPC ships total health
]]------------------------------------------------------------

local ECT_EX = {}
-- general flyby and pirate spawns
for fly, spawns in pairs({
	FlybySpawns					= {
		{pr='Count',	x=0,	y=2},
		{pr='Spread',	x=30,	y=70},
		{pr='StartTime',x=0,	y=4},
		{pr='MinRange',	r=200},
		{pr='Offset',	r=240}
	},
	OutpostSpawns				= {
		{pr='Count',	x=-1,	y=-1}
	},
	PirateSpawns				= {
		{pr='Spread',	x=0,	y=40},
		{pr='Count',	x=0,	y=1}
	},
	PlanetaryPirateFlybySpawns	= {
		{pr='Count',	x=0,	y=1},
		{pr='StartTime',x=0,	y=3}
	},
	PlanetaryPirateRaidSpawns	= {
		{pr='Count',	x=0,	y=1},
		{pr='StartTime',x=0,	y=3}
	},
	PirateBattleSpawns			= {
		{pr='Count',	x=0,	y=1},
	},
	FrigateFlybySpawns			= {
		{pr='Count',	x=0,	y=1},
		{pr='MinRange',	r=800},
	}
}) do
	for _,spn in ipairs(spawns) do
		local T = {
			REPLACE_TYPE 			= 'All',
			MATH_OPERATION 			= '+',
			PRECEDING_FIRST			= true,
			PRECEDING_KEY_WORDS		= fly
		}
		if spn.x then
			T.SPECIAL_KEY_WORDS		= {spn.pr, 'Vector2f.xml'}
			T.VALUE_CHANGE_TABLE	= {{'x', spn.x}, {'y', spn.y}}
		else
			T.VALUE_CHANGE_TABLE	= {{spn.pr, spn.r}}
		end
		ECT_EX[#ECT_EX+1] = T
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
		ECT_EX[#ECT_EX+1] = {
			MATH_OPERATION 		= '+',
			SPECIAL_KEY_WORDS	= {'Id', id},
			PRECEDING_KEY_WORDS	= bounty_prop[i], -- set index ??
			VALUE_CHANGE_TABLE	= {
				{'x',		bty[i][1]},
				{'y',		bty[i][2]}
			}
		}
	end
end

local ECT_AI = {}
for id, ai in pairs({
	PIRATE_EASY 	= {hl=1.1,		eh=1.2,		rw='PIRATELOOT_EASY'},
	PIRATE		 	= {hl=1.2,		eh=1.2,		rw='PIRATELOOT'},
	PIRATE_HARD	 	= {hl=1.2,		eh=0.9,		rw='PIRATELOOT_HARD'},
	POLICE			= {hl=1.1,		eh=1,		rw='POLICELOOT'},
	TRADER			= {hl=1.2,		eh=1},
	TRADER_ESCORT	= {hl=1.1,		eh=0.9},
	RAID_BUILDING 	= {hl=1.1,		eh=1,		rw='RAIDLOOT'},
	RAID_DOGFIGHT	= {hl=1.1,		eh=1,		rw='RAIDLOOT'},
	PLANET_FLYBY	= {hl=1.2,		eh=2,		rw='PIRATELOOT_EASY'},
	SQUADRON_C		= {hl=1.2,		eh=1.1},
	SQUADRON_B		= {hl=1.2,		eh=1.1},
	SQUADRON_A		= {hl=1.2,		eh=1.1},
	SQUADRON_S		= {hl=1.2,		eh=1.1},
	WEAK			= {hl=1600,					rd=9},
	STRONG			= {							rd=9},
	FAST			= {							rd=4},
	FAST_STRONG		= {							rd=6},
}) do
	if ai.rw then
		ECT_AI[#ECT_AI+1] = {
			PRECEDING_FIRST		= true,
			PRECEDING_KEY_WORDS = 'Definitions',
			SPECIAL_KEY_WORDS	= {'Id', id},
			VALUE_CHANGE_TABLE	= {
				{'Reward',		ai.rw}
			}
		}
	end
	if ai.eh then
		ECT_AI[#ECT_AI+1] = {
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
		ECT_AI[#ECT_AI+1] = {
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
	MOD_FILENAME 		= '__META ship spawns & health.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.03',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	-- {
		-- MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SCENE/EXPERIENCESPAWNTABLE.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- -- SPECIAL_KEY_WORDS	= {'Id', 'BIO_FRIG'},
				-- SPECIAL_KEY_WORDS	= {'Id', 'RELIC_GATE'},
				-- VALUE_CHANGE_TABLE	= {
					-- {'SpawnChance', 120}
				-- }
			-- }
		-- }
	-- },
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SCENE/EXPERIENCESPAWNTABLE.MBIN',
		EXML_CHANGE_TABLE	= ECT_EX
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SPACE/AISPACESHIPATTACKDATATABLE.MBIN',
		EXML_CHANGE_TABLE	= ECT_AI
	}
}}}}
