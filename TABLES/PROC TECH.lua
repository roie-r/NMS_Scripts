--------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/table_entry.lua')
--------------------------------------------------------------------------
mod_desc = [[
  Increase SMG hit damage and reduce its fire rate
  Delete grenade bounce property upgrade
  Increase hyperdrive distance and reduce efficiency bonuses
  Increase suit jetpack tank size and refill rate
  Increase damage and reduce firing rate for the mech cannon
  Increase bioship pulse upgrades - higher speed and maneuverability
]]------------------------------------------------------------------------

local edit_stats = {
---	suit
	{id='UP_JETBOOST',		st='Suit_Jetpack_Tank',					op='*',	vn=1.8,		vx=1.8},
	{id='UP_JETBOOST',		st='Suit_Jetpack_Drain',				op='+',	vn=-0.3,	vx=-0.3},
	{id='UP_JETBOOST',		st='Suit_Jetpack_Refill',				op='+',	vn=0.5,		vx=0.5},
	{id='UP_JETBOOST',		st='Suit_Jetpack_Ignition',				op='+',	vn=0.03,	vx=0.03},
	{id='UP_UNW', 			st='Suit_Protection_WaterDrain',		vn=0.1,	vx=0.2,		wc='MaxIsUncommon',	ac=true},
---	multitool
	{id='UP_SMG',			st='Weapon_Projectile_Damage',			op='+',	vn=0.2,		vx=0.2},	-- 2, 	3
	{id='UP_SMG',			st='Weapon_Projectile_Rate',			op='+',	vn=-0.15,	vx=-0.15},	-- 1.1	1.15
	{id='UP_CANNON', 		st='Weapon_ChargedProjectile_ChargeTime',op='*',vn=1.2,		vx=1.2},	-- 0.5	0.95
	{id='UP_RAIL',			st='Weapon_Laser_ChargeTime',			op='+',vn=-0.1,		vx=-0.05},	-- 0.75	0.95
	{id='UP_GREN',			st='Weapon_Grenade_Bounce'},
	{id='UP_LASER', 		st='Weapon_Laser_ReloadTime'},
	{id='UP_LASER', 		st='Weapon_Laser_Damage',				vn=1,	vx=1},
---	vehicle
	{id='UP_EXGUN',			st='Vehicle_GunDamage',					op='*',	vn=2,		vx=2}, 		-- 30	40
	{id='UP_EXGUN',			st='Vehicle_GunRate'},
	{id='UP_EXOSUBGUN',		st='Vehicle_GunDamage',					op='*',	vn=2,		vx=2},		-- 30	40
	{id='UP_EXOSUBGUN',		st='Vehicle_GunRate'},
	{id='UP_MCGUN',			st='Vehicle_GunDamage',					op='*',	vn=2,		vx=2},		-- 30	40
	{id='UP_MCGUN',			st='Vehicle_GunRate'},
	{id='UP_MCENG',			st='Vehicle_EngineFuelUse',				op='+',	vn=0.2,		vx=0.2},
	{id='UP_MCENG',			st='Vehicle_BoostTanks',				op='+',	vn=8,		vx=8},		-- 0.1	0.3
---	ship
	{id='UP_HYPERDRIVE',	st='Ship_Hyperdrive_JumpDistance',		op='*',	vn=2.4,		vx=2.4},
	{id='UP_HYPERDRIVE',	st='Ship_Hyperdrive_JumpsPerCell',		op='*',	vn=0.4,		vx=0.6},
	{id='AP_HYPERDRIVE',	st='Ship_Hyperdrive_JumpDistance',		op='*',	vn=2.4,		vx=2.4},
	{id='AP_HYPERDRIVE',	st='Ship_Hyperdrive_JumpsPerCell',		op='*',	vn=0.4,		vx=0.6},
	{id='AP_PULSEDRIVE', 	st='Ship_Boost',						op='+',	vn=0.15,	vx=0.2},	-- 1.1	1.25
	{id='AP_PULSEDRIVE', 	st='Ship_BoostManeuverability',			op='+',	vn=0.2,		vx=0.32},	-- 1.05	1.18
	{id='AP_PULSEDRIVE', 	st='Ship_Maneuverability',				op='+',	vn=0.07,	vx=0.07},	-- 1.0065
---	freighter
	{id='UT_FR_HYP_NAME',	st='Freighter_Hyperdrive_JumpDistance',	op='*',	vn=10,		vx=10},
	{id='UT_FR_HYP_NAME',	st='Freighter_Hyperdrive_JumpsPerCell',	op='*',	vn=0.4,		vx=0.6}
}
function edit_stats:GetExmlCT()
	local T = {}
	T[1] = {
		SKW			 = {},
		REPLACE_TYPE = 'All',
		SECTION_UP   = 1,
		REMOVE		 = 'Section'
	}
	for _,x in ipairs(self) do
		if x.op then
			--- edit ---
			T[#T+1] = {
				REPLACE_TYPE		= 'All',
				INTEGER_TO_FLOAT	= 'Force',
				SPECIAL_KEY_WORDS	= {'Name', x.id, 'StatsType', x.st},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE	= {
					{'ValueMin', '@'..x.op..x.vn},
					{'ValueMax', '@'..x.op..x.vx}
				}
			}
		elseif x.vn then
			--- add new ---
			T[#T+1] = {
				REPLACE_TYPE		= 'All',
				SPECIAL_KEY_WORDS	= {'Name', x.id},
				PRECEDING_KEY_WORDS	= 'StatLevels',
				ADD 				= ToExml(ProcTechStatLevel(x))
			}
		else
			--- remove ---
			T[1].SKW[#T[1].SKW + 1] = {'Name', x.id, 'StatsType', x.st}
		end
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TABLE PROC TECH.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.45',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCPROCEDURALTECHNOLOGYTABLE.MBIN',
		EXML_CHANGE_TABLE	= edit_stats:GetExmlCT()
	}
}}}}
