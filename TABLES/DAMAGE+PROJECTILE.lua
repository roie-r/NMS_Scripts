---------------------------------------------------------
mod_desc = [[
  Increase hit damage all around - player, enemies & NPC
]]-------------------------------------------------------

local ECT_PR = {}
for _,gun in ipairs({
	{'SQUADGUN',		8, 10},	-- 40
	{'AISHIPGUN',		1.6},	-- 15
	{'TRADERGUN',		1.2},	-- 40
	{'POLICEGUN',		1.6},	-- 15
	{'FREIGHTGUN',		10},	-- 15
	{'COP_FREIGHTGUN',	1.1},	-- 300
	{'BASE_TURRET_M',	1.6},	-- 200
	{'BASE_TURRET_L',	2.2},	-- 100
	{'AI_SHIP',			4},		-- 10
	{'AI_FREIGHTER',	4},		-- 15
	{'COP_FREIGHTER',	15},	-- 15
	{'ROBOTGUN',		10},	-- 1
	{'ROBOTGUNWEAK',	10},	-- 1
	{'ROBOTBIGGUN',		20},	-- 1
	{'ROBOT_WALKER',	20},	-- 1
	{'MINIROBOTGUN',	10},	-- 1
}) do
	ECT_PR[#ECT_PR+1] = {
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		SPECIAL_KEY_WORDS	= {'Id', gun[1]},
		VALUE_CHANGE_TABLE	= {
			[1] = {'DefaultDamage',	gun[2]},
			[2] = gun[3] and {'Radius', gun[3]} or nil
		}
	}
end

local ECT_DM = {}
for _,dmg in ipairs({
	{'BASICDAMAGE',		2},		-- 1
	{'LASERDAMAGE',		2},		-- 3
	{'AISHIPGUN',		1.5},	-- 14
	{'POLICEGUN',		1.5},	-- 16
	{'POLICELASER',		1.5},	-- 16
	{'BOUNTYGUN1',		1.5},	-- 16
	{'BOUNTYGUN2',		1.5},	-- 16
	{'BOUNTYGUN3',		1.5},	-- 16
	{'BOUNTYLASER1',	1.25},	-- 20
	{'FREIGHTERGUN',	2},		-- 20
	{'FREIGHTERLASER',	2},		-- 20
	{'SHIPLASER',		2},		-- 15
	{'ROBOTGUNDMG',		2},		-- 2
	{'ROBOTBIGGUN',		1.5},	-- 6
	{'WALKERLASER',		1.4},	-- 5
	{'MINIDRONE_DMG',	1.5},	-- 6
	{'MPGUN',			0.001},
	{'MPSHIPGUN',		0.001},
	{'MPSHIPSHOTGUN',	0.001},
	{'MPSHIPMINIGUN',	0.001},
	{'MPSHIPPLASMAGUN',	0.001},
	{'MPSHIPROCKET',	0.001},
	{'MPVEHICLE',		0.001},
	{'MPGRENADE',		0.001},
	{'MPVEHICLEGUN',	0.001},
	{'MPPLAYER',		0.001},
	{'MPPLAYER_SHIP',	0.001},
	{'MPPLAYER_RAIL',	0.001},
	{'MPPLAYER_SHOT',	0.001},
	{'MPPLAYER_SMG',	0.001},
	{'MPPLAYER_GUN',	0.001},
	{'MPPLAYER_CANNON',	0.001}
}) do
	ECT_DM[#ECT_DM+1] = {
		INTEGER_TO_FLOAT	= 'Force',
		MATH_OPERATION 		= '*',
		SPECIAL_KEY_WORDS	= {'Id', dmg[1]},
		VALUE_CHANGE_TABLE	= {
			{'Damage',		dmg[2]}
		}
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE DAMAGE+PROJECTILE.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.45',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/PROJECTILES/PROJECTILETABLE.MBIN',
		EXML_CHANGE_TABLE	= ECT_PR
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/DAMAGETABLE.MBIN',
		EXML_CHANGE_TABLE	= ECT_DM
	}
}}}}
