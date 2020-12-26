--[[┎────────────────────────────────────────────────────────────
	┃ Increase number of attackers for bounty and pirate missions
	┃ Reduce number of planet flybys and outpost visits
	┃ Increase enemy and NPC ships total health and damage
────┸────────────────────────────────────────────────────────--]]
Bounty_Spawn_Count = {
	dat = {
		{'BOUNTY1',			0, 1},
		{'BOUNTY2',			2, 3},
		{'BOUNTY3',			1, 2},
		{'EASYBOUNTY1',		2, 3},
		{'EASYBOUNTY2',		2, 3},
		{'MEDBOUNTY1',		3, 4},
		{'MEDBOUNTY2',		3, 4},
		{'HARDBOUNTY1',		5, 6},
		{'HARDBOUNTY2',		5, 6},
		{'WEAPGUY_BOUNTY',	5, 6},
		{'PIRATE_SQUAD',	5, 6},
		{'PP_BOUNTY',		4, 5}
	},
	Get = function(x)
		return {{
			MATH_OPERATION 		= '+',
			SPECIAL_KEY_WORDS	= {'Id',x[1]},
			PRECEDING_KEY_WORDS	= 'Count',
			VALUE_CHANGE_TABLE	= { {'x', x[2]}, {'y', x[3]} }
		}}
	end
}

Pirate_Spawn_Count = {
	dat = {
		{ {'FlybySpawns',	'Spread'},			12, 14},
		{ {'FlybySpawns',	'Count'},			-1, -1},
		{ {'OutpostSpawns',	'Spread'},			12, 14},
		{ {'OutpostSpawns',	'Count'},			-1, -1},
		{ {'PirateSpawns',	'Count'},			0,  2},
		{ {'PirateSpawns',	'Count', 'Count'},	1,  1},
		{ {'PirateBattleSpawns', 'Count'},		0,  2}
	},
	Get = function(x)
		return {{
			MATH_OPERATION 		= '+',
			PRECEDING_KEY_WORDS	= x[1],
			VALUE_CHANGE_TABLE	= { {'x', x[2]}, {'y', x[3]} }
		}}
	end
}

Ship_Stats = {
	dat = {
		{'PIRATE_FREIGHT',	'MEDIUM',	4},		-- 3600
		{'AI_EASY',			'MEDIUM',	2.2},	-- 6200
		{'AI_MEDIUM',		'HARD',		2.2},	-- 8000
		{'AI_HARD',			'HARD',		1.8},	-- 14000
		{'AI_SOLO',			'SOLO',		1.2},	-- 30000
		{'PIRATE',			'MEDIUM',	2.4},	-- 6200
		{'POLICE',			'HARD',		2},		-- 14000
		{'TRADE_EASY',		'MEDIUM',	2.4},	-- 6000
		{'TRADE_MED',		'HARD',		2.2},	-- 8000
		{'TRADE_HARD',		'HARD',		1.8},	-- 14000
		{'BOUNTY',			'HARD',		1.6}	-- 20000
	},
	Get = function(x)
		return {{
			SPECIAL_KEY_WORDS	= {'Id', x[1]},
			VALUE_CHANGE_TABLE	= { {'Behaviour', x[2]} }
		},{
			MATH_OPERATION 		= '*',
			SPECIAL_KEY_WORDS	= {'Id', x[1]},
			VALUE_CHANGE_TABLE	= { {'Health', x[3]} }
		}}
	end
}

Player_Damage_Table = {
	dat = {
		{'BASICDAMAGE',		2},	-- 1
		{'LASERDAMAGE',		2},	-- 5
		{'AISHIPGUN',		3},	-- 14
		{'POLICEGUN',		4},	-- 16
		{'BOUNTYGUN1',		4},	-- 16
		{'BOUNTYGUN2',		4},	-- 16
		{'BOUNTYGUN3',		4},	-- 16
		{'FREIGHTERGUN',	4},	-- 20
		{'FREIGHTERLASER',	4},	-- 20
		{'SHIPLASER',		3}	-- 15
	},
	Get = function(x)
		return {{
			MATH_OPERATION 		= '*',
			SPECIAL_KEY_WORDS	= {'Id', x[1]},
			VALUE_CHANGE_TABLE	= { {'Damage', x[2]} }
		}}
	end
}

Projectile_Damage = {
	dat = {
		{'AISHIPGUN',		12},	-- 15
		{'TRADERGUN',		4},		-- 40
		{'POLICEGUN',		12},	-- 15
		{'BOUNTYGUN1',		1.6},	-- 200
		{'BOUNTYGUN2',		1.6},	-- 400
		{'BOUNTYGUN3',		1.6},	-- 800
		{'FREIGHTGUN',		14},	-- 15
		{'COP_FREIGHTGUN',	2.2},	-- 300
		{'BASE_TURRET_M',	1.6},	-- 200
		{'BASE_TURRET_L',	2.2},	-- 100
		{'AI_SHIP',			16},	-- 9
		{'AI_FREIGHTER',	14},	-- 15
		{'COP_FREIGHTER',	22}		-- 15
	},
	Get = function(x)
		return {{
			MATH_OPERATION 		= '*',
			SPECIAL_KEY_WORDS	= {'Id', x[1]},
			VALUE_CHANGE_TABLE	= { {'Damage', x[2]} }
		}}
	end
}

function BuildExmlChangeTable(tbl)
	local T = {}
	for i = 1, #tbl.dat do
		local T2 = tbl.Get(tbl.dat[i])
		for j = 1, #T2 do table.insert(T, T2[j]) end
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META ship damage + health + spawns.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.13',
	MOD_BATCHNAME		= '_META ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA\SIMULATION\SCENE\EXPERIENCESPAWNTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				PRECEDING_KEY_WORDS	= 'PirateBountySpawns',
				VALUE_CHANGE_TABLE	= {
					{'AttackData',	'AI_HARD'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\SIMULATION\SCENE\EXPERIENCESPAWNTABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Bounty_Spawn_Count)
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\SIMULATION\SCENE\EXPERIENCESPAWNTABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Pirate_Spawn_Count)
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\SIMULATION\SPACE\AISPACESHIPATTACKDATATABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Ship_Stats)
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\TABLES\DAMAGETABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Player_Damage_Table)
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA\PROJECTILES\PROJECTILETABLE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Projectile_Damage)
	}
}}}}
