
local ai_spn = 'GcAIShipSpawnData.xml'

-- add capital freighter spawns
local ect_ex = {

	{
		SPECIAL_KEY_WORDS	= {'AIShipRole', 'Freighter', 'AIShipRole', 'TinyFreighter', 'Count', 'Vector2f.xml'},
		SECTION_ACTIVE		= -2,
		VALUE_CHANGE_TABLE 	= {
			{'x',			1000},
			{'y',			1000}
		}
	},
	{
		SPECIAL_KEY_WORDS	= {'AIShipRole', 'Freighter', 'AIShipRole', 'TinyFreighter'},
		SECTION_ACTIVE		= -2,
		VALUE_CHANGE_TABLE 	= {
			{'AIShipRole',			'SmallFreighter'},
			{'AttackDefinition',	'FREIGHTER_SMALL'}
		}
	},

	{
		SPECIAL_KEY_WORDS	= {'AIShipRole', 'Freighter', 'Count', 'Vector2f.xml'},
		PRECEDING_KEY_WORDS	= 'Count',
		SECTION_ACTIVE		= -2,
		VALUE_CHANGE_TABLE 	= {
			{'x',			1},
			{'y',			1}
		}
	},
	{
		SPECIAL_KEY_WORDS	= {'AIShipRole', 'Freighter', 'AIShipRole', 'Frigate'},
		SECTION_ACTIVE		= -2,
		VALUE_CHANGE_TABLE 	= {
			{'MinRange',			15000},
			{'AIShipRole',			'CapitalFreighter'},
			{'AttackDefinition',	'FREIGHTER_CAP'}
		}
	},

	{--	frigate
		SEC_EDIT 			= 'gc_ai_ship_spawn',
		PRECEDING_KEY_WORDS	= {'ChildSpawns', 'Count'},
		SECTION_ACTIVE		= -1,
		VALUE_CHANGE_TABLE 	= {
			{'x',			4},
			{'y',			8}
		}
	},
	{--	child friegther
		SEC_EDIT 			= 'gc_ai_ship_spawn',
		PRECEDING_KEY_WORDS	= {'ChildSpawns', ai_spn, ai_spn},
		VALUE_CHANGE_TABLE 	= {
			{'AIShipRole',			'Freighter'},
			{'AttackDefinition',	'FREIGHTER'}
		}
	},
	{--	child friegther
		SEC_EDIT 			= 'gc_ai_ship_spawn',
		PRECEDING_KEY_WORDS	= {'ChildSpawns', ai_spn, ai_spn, 'Count'},
		VALUE_CHANGE_TABLE 	= {
			{'x',			1},
			{'y',			2}
		}
	},
	{--	child friegther
		SEC_EDIT 			= 'gc_ai_ship_spawn',
		PRECEDING_KEY_WORDS	= {'ChildSpawns', ai_spn, ai_spn, 'Spread'},
		VALUE_CHANGE_TABLE 	= {
			{'x',			3800},
			{'y',			3800}
		}
	},
	{--	sub child friegther - small
		SEC_EDIT 			= 'gc_ai_ship_spawn',
		PRECEDING_KEY_WORDS	= {'ChildSpawns', ai_spn, ai_spn, 'ChildSpawns'},
		VALUE_CHANGE_TABLE 	= {
			{'AIShipRole',			'SmallFreighter'},
			{'AttackDefinition',	'FREIGHTER_SMALL'}
		}
	},
	{--	sub child friegther - small
		SEC_EDIT 			= 'gc_ai_ship_spawn',
		PRECEDING_KEY_WORDS	= {'ChildSpawns', ai_spn, ai_spn, 'ChildSpawns', 'Count'},
		VALUE_CHANGE_TABLE 	= {
			{'x',			1},
			{'y',			3}
		}
	},
	{--	sub child friegther - small
		SEC_EDIT 			= 'gc_ai_ship_spawn',
		PRECEDING_KEY_WORDS	= {'ChildSpawns', ai_spn, ai_spn, 'ChildSpawns', 'Spread'},
		VALUE_CHANGE_TABLE 	= {
			{'x',			1000},
			{'y',			1000}
		}
	},
	{
		PRECEDING_KEY_WORDS	= 'AmbientSpawns',
		ADD_OPTION			= 'AddEndSection',
		SEC_ADD_NAMED		= 'gc_ai_ship_spawn',
	}
}

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
		{pr='Spread',		x=0,		y=40,	a=true},
		{pr='Count',		x=0,		y=1,	a=true}
	},
	PlanetaryPirateFlybySpawns = {
		{pr='Count',		x=0,		y=1},
		{pr='StartTime',	x=0,		y=3}
	},
	PlanetaryPirateRaidSpawns = {
		{pr='Count',		x=0,		y=1},
		{pr='StartTime',	x=0,		y=3}
	},
	FrigateFlybySpawns = {
		{pr='Count',		x=0,		y=1},
		{pr='MinRange',		rg=800}
	},
	-- AmbientSpawns = {
		-- {pr='Count',			x=1,	y=1,			as=-2,	skw={'AIShipRole', 'Freighter'}},
		-- {pr='MinRange',			rg=10000,				as=-2,	skw={'AIShipRole', 'Freighter'}},
		-- {pr='AIShipRole',		rl='CapitalFreighter',	as=-2,	skw={'AIShipRole', 'Freighter'}},
		-- {pr='AttackDefinition',	rl='FREIGHTER_CAP',		as=-2,	skw={'AIShipRole', 'Freighter'}},
		-- {pr='Count',			x=3,	y=6,			as=-2,	skw={'AIShipRole', 'Freighter', 'AIShipRole', 'Frigate'}},
		-- {pr='AIShipRole',		rl='Freighter',						pkw={ai_spn, ai_spn, ai_spn, 'ChildSpawns', ai_spn, ai_spn}},
		-- {pr='AttackDefinition',	rl='FREIGHTER',						pkw={ai_spn, ai_spn, ai_spn, 'ChildSpawns', ai_spn, ai_spn}},
		-- {pr='Spread',			x=2500,	y=2500,						pkw={ai_spn, ai_spn, ai_spn, 'ChildSpawns', ai_spn, ai_spn}},

		-- {pr='AIShipRole',		rl='SmallFreighter',				pkw={ai_spn, ai_spn, ai_spn, 'ChildSpawns', ai_spn, ai_spn, 'ChildSpawns', ai_spn}},
		-- {pr='AttackDefinition',	rl='FREIGHTER_SMALL',				pkw={ai_spn, ai_spn, ai_spn, 'ChildSpawns', ai_spn, ai_spn, 'ChildSpawns', ai_spn}},
		-- {pr='Spread',			x=1000,	y=1000,						pkw={ai_spn, ai_spn, ai_spn, 'ChildSpawns', ai_spn, ai_spn, 'ChildSpawns', ai_spn}},
	-- }
}) do
	for _,spn in ipairs(spawns) do
		local T = {
			REPLACE_TYPE 	= spn.a and 'All' or nil,
			PKW_1			= true,
			PKW				= fly,
			VCT				= {}
		}
		if spn.pkw then
			table.insert(spn.pkw, 1, fly)
			T.PKW = spn.pkw
		end
		if spn.y then
			T.SKW			= {spn.pr, 'Vector2f.xml'}
			T.VCT[#T.VCT+1]	= {'x',	'@ +'..spn.x}
			T.VCT[#T.VCT+1]	= {'y',	'@ +'..spn.y}
		elseif spn.rg then
			T.VCT[#T.VCT+1]	= {spn.pr, '@ +'..spn.rg}
		elseif spn.rl then
			T.VCT[#T.VCT+1]	= {spn.pr, spn.rl}
		end
		ect_ex[#ect_ex+1]	= T
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+  TEST 14 ambient freighter spawn',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SCENE/EXPERIENCESPAWNTABLE.MBIN',
		MXML_CHANGE_TABLE	= ect_ex
	}
}}}}
