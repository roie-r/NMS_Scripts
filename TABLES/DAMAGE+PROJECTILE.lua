---------------------------------------------------------
local mod_desc = [[
  Increase hit damage all around - player, enemies & NPC
]]-------------------------------------------------------

local ECT_PR = {}
for _,gun in ipairs({
	{id='SQUADGUN',			m=8,	r=10},	-- 40
	{id='AISHIPGUN',		m=1.6},			-- 15
	{id='TRADERGUN',		m=1.2},			-- 40
	{id='POLICEGUN',		m=1.6},			-- 15
	{id='FREIGHTGUN',		m=10},			-- 15
	{id='COP_FREIGHTGUN',	m=1.1},			-- 300
	{id='BASE_TURRET_M',	m=1.6},			-- 200
	{id='BASE_TURRET_L',	m=2.2},			-- 100
	{id='AI_SHIP',			m=4},			-- 10
	{id='AI_FREIGHTER',		m=4},			-- 15
	{id='COP_FREIGHTER',	m=15},			-- 15
	{id='ROBOTGUN',			m=10},			-- 1
	{id='ROBOTGUNWEAK',		m=10},			-- 1
	{id='ROBOTBIGGUN',		m=20},			-- 1
	{id='ROBOT_WALKER',		m=20},			-- 1
	{id='MINIROBOTGUN',		m=10},			-- 1
}) do
	ECT_PR[#ECT_PR+1] = {
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		SPECIAL_KEY_WORDS	= {'Id', gun.id},
		VALUE_CHANGE_TABLE	= {
			{'DefaultDamage',	gun.m},
			gun.r and {'Radius', gun.r} or nil
		}
	}
end

local ECT_DM = {}
for _,dmg in ipairs({
	{id='BASICDAMAGE',		m=2},	-- 1
	{id='LASERDAMAGE',		m=2},	-- 3
	{id='AISHIPGUN',		m=1.5},	-- 14
	{id='POLICEGUN',		m=1.5},	-- 16
	{id='POLICELASER',		m=1.5},	-- 16
	{id='BOUNTYGUN1',		m=1.5},	-- 16
	{id='BOUNTYGUN2',		m=1.5},	-- 16
	{id='BOUNTYGUN3',		m=1.5},	-- 16
	{id='BOUNTYLASER1',		m=1.25},-- 20
	{id='FREIGHTERGUN',		m=2},	-- 20
	{id='FREIGHTERLASER',	m=2},	-- 20
	{id='SHIPLASER',		m=2},	-- 15
	{id='ROBOTGUNDMG',		m=2},	-- 2
	{id='ROBOTBIGGUN',		m=1.5},	-- 6
	{id='WALKERLASER',		m=1.4},	-- 5
	{id='MINIDRONE_DMG',	m=1.5},	-- 6
	{id='MPGUN',			m=0.001},
	{id='MPSHIPGUN',		m=0.001},
	{id='MPSHIPSHOTGUN',	m=0.001},
	{id='MPSHIPMINIGUN',	m=0.001},
	{id='MPSHIPPLASMAGUN',	m=0.001},
	{id='MPSHIPROCKET',		m=0.001},
	{id='MPVEHICLE',		m=0.001},
	{id='MPGRENADE',		m=0.001},
	{id='MPVEHICLEGUN',		m=0.001},
	{id='MPPLAYER',			m=0.001},
	{id='MPPLAYER_SHIP',	m=0.001},
	{id='MPPLAYER_RAIL',	m=0.001},
	{id='MPPLAYER_SHOT',	m=0.001},
	{id='MPPLAYER_SMG',		m=0.001},
	{id='MPPLAYER_GUN',		m=0.001},
	{id='MPPLAYER_CANNON',	m=0.001}
}) do
	ECT_DM[#ECT_DM+1] = {
		INTEGER_TO_FLOAT	= 'Force',
		MATH_OPERATION 		= '*',
		SPECIAL_KEY_WORDS	= {'Id', dmg.id},
		VALUE_CHANGE_TABLE	= {
			{'Damage',		dmg.m}
		}
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE DAMAGE+PROJECTILE.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.64',
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
