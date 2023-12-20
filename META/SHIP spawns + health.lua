--------------------------------------------------------------
local mod_desc = [[
  Increase number of attackers in bounty and pirate missions
  Reduce number of planet flybys and outpost visits
  Increase enemy and NPC ships total health
]]------------------------------------------------------------

local ECT_EX = {}
-- general flyby and pirate spawns
for _,spn in ipairs({
	{id='FlybySpawns',					pr='Count',		x=0,	y=2},
	{id='FlybySpawns',					pr='Spread',	x=30,	y=70},
	{id='FlybySpawns',					pr='StartTime',	x=0,	y=4},
	{id='FlybySpawns',					pr='MinRange',	r=200},
	{id='FlybySpawns',					pr='Offset',	r=240},
	{id='OutpostSpawns',				pr='Count',		x=-1,	y=-1},
	{id='PirateSpawns',					pr='Spread',	x=0,	y=40},
	{id='PirateSpawns',					pr='Count',		x=0,	y=1},
	{id='PlanetaryPirateFlybySpawns',	pr='Count',		x=0,	y=1},
	{id='PlanetaryPirateFlybySpawns',	pr='StartTime',	x=0,	y=3},
	{id='PlanetaryPirateRaidSpawns',	pr='Count',		x=0,	y=1},
	{id='PlanetaryPirateRaidSpawns',	pr='StartTime',	x=0,	y=3},
	{id='PirateBattleSpawns',			pr='Count',		x=0,	y=1},
	{id='FrigateFlybySpawns',			pr='MinRange',	r=800},
	{id='FrigateFlybySpawns',			pr='Count',		x=0,	y=1},
}) do
	local inx = #ECT_EX+1
	ECT_EX[inx] = {
		REPLACE_TYPE 			= 'All',
		MATH_OPERATION 			= '+',
		PRECEDING_FIRST			= true,
		PRECEDING_KEY_WORDS		= spn.id
	}
	if spn.x then
		ECT_EX[inx].SPECIAL_KEY_WORDS	= {spn.pr, 'Vector2f.xml'}
		ECT_EX[inx].VALUE_CHANGE_TABLE	= {{'x', spn.x}, {'y', spn.y}}
	else
		ECT_EX[inx].VALUE_CHANGE_TABLE	= {{spn.pr, spn.r}}
	end
end

-- bounty missions spawns
local bounty_prop = {'Count', 'Spread',	'StartTime'}
for _,bty in ipairs({
	{'BOUNTY1',			0, 2,	0, 30,	0, 2},
	{'BOUNTY2',			0, 2,	0, 35,	0, 2},
	{'BOUNTY3',			1, 1,	0, 40,	0, 3},
	{'EASYBOUNTY1',		0, 1,	0, 30,	0, 2},
	{'EASYBOUNTY2',		0, 1,	0, 30,	0, 2},
	{'MEDBOUNTY1',		0, 1,	0, 30,	0, 2},
	{'MEDBOUNTY2',		1, 1,	0, 40,	0, 2},
	{'HARDBOUNTY1',		1, 2,	0, 35,	0, 3},
	{'HARDBOUNTY2',		1, 2,	0, 40,	0, 3},
	{'WEAPGUY_BOUNTY',	0, 2,	0, 30,	0, 2},
	{'PIRATE_SQUAD',	0, 1,	0, 80,	0, 3},
	{'PP_BOUNTY',		1, 2,	0, 35,	0, 2},
}) do
	for i=2, 6, 2 do
		ECT_EX[#ECT_EX+1] = {
			MATH_OPERATION 		= '+',
			SPECIAL_KEY_WORDS	= {'Id', bty[1]},
			PRECEDING_KEY_WORDS	= bounty_prop[i/2],
			VALUE_CHANGE_TABLE	= {
				{'x',			bty[i]},
				{'y',			bty[i+1]}
			}
		}
	end
end

local ECT_AI = {}
for _,ai in ipairs({
	{'PIRATE_EASY', 	1.1,	1.2,	'PIRATELOOT_EASY'},
	{'PIRATE',		 	1.2,	1.2,	'PIRATELOOT'},
	{'PIRATE_HARD',	 	1.2,	0.9,	'PIRATELOOT_HARD'},
	{'POLICE',			1.1,	1,		'POLICELOOT'},
	{'TRADER',			1.2,	1},
	{'TRADER_ESCORT',	1.1,	0.9},
	{'RAID_BUILDING', 	1.1,	1,		'RAIDLOOT'},
	{'RAID_DOGFIGHT',	1.1,	1,		'RAIDLOOT'},
	{'PLANET_FLYBY',	1.2,	2,		'PIRATELOOT_EASY'},
	{'SQUADRON_C',		1.2,	1.1},
	{'SQUADRON_B',		1.2,	1.1},
	{'SQUADRON_A',		1.2,	1.1},
	{'SQUADRON_S',		1.2,	1.1},
}) do
	if ai[4] then
		ECT_AI[#ECT_AI+1] = {
			PRECEDING_FIRST		= true,
			PRECEDING_KEY_WORDS = 'Definitions',
			SPECIAL_KEY_WORDS	= {'Id', ai[1]},
			VALUE_CHANGE_TABLE	= {
				{'Reward', ai[4]}
			}
		}
	end
	ECT_AI[#ECT_AI+1] = {
		PRECEDING_FIRST		= true,
		PRECEDING_KEY_WORDS = 'Definitions',
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		SPECIAL_KEY_WORDS	= {'Id', ai[1]},
		VALUE_CHANGE_TABLE	= {
			{'Health',				ai[2]},
			{'LevelledExtraHealth',	ai[3]}
		}
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META ship spawns & health.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.47',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	-- {
		-- MBIN_FILE_SOURCE	= source_exp_spawn_table,
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
