---------------------------------------------------------
local mod_desc = [[
  Increase hit damage all around - player, enemies & NPC
]]-------------------------------------------------------

local prj_ct = {}
for prj, dmg in pairs({
	SQUADGUN		= 8,	-- 40
	AISHIPGUN		= 1.6,	-- 15
	TRADERGUN		= 1.2,	-- 40
	POLICEGUN		= 1.6,	-- 15
	FREIGHTGUN		= 10,	-- 15
	COP_FREIGHTGUN	= 1.1,	-- 300
	BASE_TURRET_M	= 1.6,	-- 200
	BASE_TURRET_L	= 2.2,	-- 100
	AI_SHIP			= 4,	-- 10
	AI_FREIGHTER	= 4,	-- 15
	COP_FREIGHTER	= 15,	-- 15
	['.-ROBOTGUN.-']= 10,	-- 1
	['ROBOT.-GUN']	= 20,	-- 1
	ROBOT_WALKER	= 20	-- 1
}) do
	prj_ct[#prj_ct+1] = {
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		SPECIAL_KEY_WORDS	= {'Id', prj},
		VALUE_CHANGE_TABLE	= {
			{'DefaultDamage', dmg}
		}
	}
end

local dmg_ct = {}
for id, dmg in pairs({
	BASICDAMAGE		= 2,	-- 1
	LASERDAMAGE		= 2,	-- 3
	AISHIPGUN		= 1.5,	-- 14
	POLICEGUN		= 1.5,	-- 16
	POLICELASER		= 1.3,	-- 16
	['BOUNTYGU.-']	= 1.5,	-- 16
	['BOUNTYL.-']	= 1.1,	-- 20
	FREIGHTERGUN	= 2,	-- 20
	FREIGHTERLASER	= 2,	-- 20
	SHIPLASER		= 2,	-- 15
	ROBOTGUNDMG		= 2,	-- 2
	ROBOTBIGGUN		= 1.5,	-- 6
	WALKERLASER		= 1.4,	-- 5
	MINIDRONE_DMG	= 1.5,	-- 6
}) do
	dmg_ct[#dmg_ct+1] = {
		MATH_OPERATION 		= '*',
		SPECIAL_KEY_WORDS	= {'Id', id},
		VALUE_CHANGE_TABLE	= {
			{'Damage',		dmg}
		}
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY damage-projectile',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/PROJECTILES/PROJECTILETABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= prj_ct
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/DAMAGETABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= dmg_ct
	}
}}}}
