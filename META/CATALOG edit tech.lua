--------------------------------
dofile('LIB/lua_2_exml.lua')
--------------------------------
mod_desc = [[
  rearange tech catalogue
]]------------------------------

local suit = {
	'ENERGY',
	'UT_ENERGY',
	'JET1',
	'UT_JET',
	'UT_JUMP',
	'UT_MIDAIR',
	'PROTECT',
	'UT_PROTECT',
	'UT_HOT',
	'UT_COLD',
	'UT_TOX',
	'UT_RAD',
	'UT_WATER',
	'UT_WATERJET',
	'UT_WATERENERGY',
	'POWERGLOVE',
	'SUIT_REFINER',
	'SUIT_REFINER2',
	'SUIT_ROCKET',
	'U_SENTSUIT',
	'U_ROBOSUIT',
	'UT_TRANSLATE1',
	'UT_TRANSLATE2',
	'UT_TRANSLATE3',
}
local ship = {
	'SHIPJUMP1',
	'UT_PULSEFUEL',
	'UT_PULSESPEED',
	'UT_SHIPDRIFT',
	'PHOTONIX_CORE',
	'SOLAR_SAIL',
	'LAUNCHER',
	'UT_LAUNCHER',
	'UT_LAUNCHCHARGE',
	'HYPERDRIVE',
	'HDRIVEBOOST1',
	'HDRIVEBOOST2',
	'HDRIVEBOOST3',
	'UT_QUICKWARP',
	'SHIPSHIELD',
	'UT_SHIPSHIELD',
	'SHIP_TELEPORT',
	'SHIPSCAN_ECON',
	'SHIPSCAN_COMBAT',
	'CARGOSHIELD',
	'SHIPROCKETS',
	'UT_ROCKETS',
	'SHIPGUN1',
	'UT_SHIPGUN',
	'SHIPLAS1',
	'UT_SHIPLAS',
	'SHIPSHOTGUN',
	'UT_SHIPSHOT',
	'SHIPMINIGUN',
	'UT_SHIPMINI',
	'SHIPPLASMA',
	'UT_SHIPBLOB',
	'LAUNCHER_SPEC',
	'SHIPJUMP_SPEC',
	'HYPERDRIVE_SPEC',
	'SHIP_LIFESUP',
}
local tool = {
	'LASER',
	'STRONGLASER',
	'LASER_XO',
	'UT_MINER',
	'SENT_LASER',
	'ATLAS_LASER',
	'TERRAINEDITOR',
	'SCANBINOC1',
	'SCAN1',
	'UT_SCAN',
	'UT_SURVEY',
	'UT_BUI_SCAN',
	'UT_BUI_SCAN2',
	'UT_S10_SCAN',
	'GROUND_SHIELD',
	'STEALTH',
	'SCOPE',
}
local weapon = {
	'BOLT',
	'UT_BOLT',
	'BOLT_SM',
	'UT_BOLTBOUNCE',
	'RAILGUN',
	'UT_RAIL',
	'UT_RAIL_STUN',
	'SHOTGUN',
	'UT_SHOT',
	'SMG',
	'UT_SMG',
	'UT_SMG_DOT',
	'UT_SMGBOUNCE',
	'CANNON',
	'UT_CANNON',
	'GRENADE',
	'TERRAIN_GREN',
	'STUN_GREN',
	'FLAME',
	'UT_STUNDMG',
	'U_SENTGUN',
}
local vehicle = {
	'VEHICLE_ENGINE',
	'EXO_RECHARGE',
	'VEHICLE_BOOST',
	'VEHICLE_LASER',
	'VEHICLE_LASER1',
	'VEHICLE_GUN',
	'EXO_PROT_HOT',
	'EXO_PROT_COLD',
	'EXO_PROT_TOX',
	'EXO_PROT_RAD',
	'VEHICLE_SCAN',
	'VEHICLE_SCAN1',
	'VEHICLE_SCAN2',
	'VEHICLE_GRIP1',
	'VEHICLE_GRIP2',
	'VEHICLE_GRIP3',
	'SUB_ENGINE',
	'SUB_GUN',
	'SUB_LASER',
	'SUB_BINOCS',
	'SUB_RECHARGE',
	'MECH_ENGINE',
	'MECH_FUEL',
	'MECH_SCAN',
	'MECH_BOOST',
	'MECH_LASER',
	'MECH_LASER1',
	'MECH_GUN',
	'MECH_MINER',
	'MECH_PROT',
	'MECH_PILOT',
	'MECH_SENT_L_ARM',
	'MECH_SENT_R_ARM',
	'MECH_SENT_LEGS',
	'MECH_SENT_HEAD',
}
local freighter = {
	'F_HYPERDRIVE',
	'F_HDRIVEBOOST1',
	'F_HDRIVEBOOST2',
	'F_HDRIVEBOOST3',
	'F_HACCESS1',
	'F_HACCESS2',
	'F_HACCESS3',
	'F_TELEPORT',
	'F_SCANNER',
	'F_MEGAWARP',
	'U_FR_HYP4',
	'U_FR_SPE4',
	'U_FR_FUEL4',
	'U_FR_COM4',
	'U_FR_TRA4',
	'U_FR_EXP4',
	'U_FR_MINE4',
}
local weird = {
	'ATLASSUIT',
	'STARSUIT',
	'STORY_TRANSLATE',
	'SUN_LASER',
	'SOUL_LASER',
	'SHIPJUMP_ALIEN',
	'LAUNCHER_ALIEN',
	'WARP_ALIEN',
	'SHIELD_ALIEN',
	'SHIPGUN_ALIEN',
	'SHIPLAS_ALIEN',
	'CARGO_S_ALIEN',
	'CHARGER_ALIEN',
	'SHIPSCAN_ALIEN',
	'LIFESUP_ROBO',
	'LAUNCHER_ROBO',
	'SHIPJUMP_ROBO',
	'HYPERDRIVE_ROBO',
	'SHIPSHIELD_ROBO',
	'SHIPGUN_ROBO',
	'F_LIFESUPP',
	'WORMTECH',
	'WORMREADER',
}

-- keep S 				>> {^U_.+[124X]X$}
-- keep freighter S		>> {^U_FR_.+[123]$}
-- remove all proc tech	>> {^U_.+[1234X]$}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '__META tech catalogue.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.45',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/CATALOGUECRAFTING.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {
					{'CategoryID', 'UI_PORTAL_CAT_TECH_SUIT'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_SHIP'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_TOOL'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_GUN'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_VEH'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_FRE'},
					{'CategoryID', 'UI_PORTAL_CAT_TECH_WEIRD'}
				},
				PRECEDING_KEY_WORDS	= 'Items',
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_SUIT'},
				ADD					= ToExml(StringArray(suit, 'Items', 10))
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_SHIP'},
				ADD					= ToExml(StringArray(ship, 'Items', 10))
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_TOOL'},
				ADD					= ToExml(StringArray(tool, 'Items', 10))
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_GUN'},
				ADD					= ToExml(StringArray(weapon, 'Items', 10))
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_VEH'},
				ADD					= ToExml(StringArray(vehicle, 'Items', 10))
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_FRE'},
				ADD					= ToExml(StringArray(freighter, 'Items', 10))
			},
			{
				SPECIAL_KEY_WORDS	= {'CategoryID', 'UI_PORTAL_CAT_TECH_WEIRD'},
				ADD					= ToExml(StringArray(weird, 'Items', 10))
			}
		}
	}
}}}}
