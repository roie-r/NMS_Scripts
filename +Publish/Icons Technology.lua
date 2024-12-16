----------------------------------------------------------------------
local mod_desc = [[
  edit/replace/update/improve technology icons

  * ADD_FILES will skipped SILENTLY if new files are not found!
]]--------------------------------------------------------------------

local tech_icons = {
---	ship
	PHOTONIX_CORE	= 'TECHNOLOGY/RENDER.PULSE.YELLOW.DDS',
	UT_PULSEFUEL	= 'TECHNOLOGY/RENDER.PULSE.YELLOW.DDS',
	UT_PULSESPEED	= 'TECHNOLOGY/RENDER.PULSE.YELLOW.DDS',
	UT_SHIPDRIFT	= 'TECHNOLOGY/RENDER.PULSE.YELLOW.DDS',
	SHIPJUMP_SPEC	= 'TECHNOLOGY/RENDER.PULSESPEC.DDS',
	HYPERDRIVE_SPEC	= 'TECHNOLOGY/RENDER.HYPERSPEC.DDS',
	UT_QUICKWARP	= 'TECHNOLOGY/RENDER.HYPER.QUICK.DDS',
	LAUNCHER_SPEC	= 'TECHNOLOGY/RENDER.LANDINGSPEC.DDS',
	UT_LAUNCHER		= 'TECHNOLOGY/RENDER.LANDING.GREEN.DDS',
	UT_LAUNCHCHARGE	= 'TECHNOLOGY/RENDER.LANDING.GREEN.DDS',
	UT_SHIPLAS		= 'TECHNOLOGY/RENDER.PHASEBEAM.BLUE.DDS',
	UT_SHIPSHOT		= 'TECHNOLOGY/RENDER.SHIPSHOT.GREEN.DDS',
	UT_SHIPBLOB		= 'TECHNOLOGY/RENDER.IONBLAST.PINK.DDS',
	UT_SHIPGUN		= 'TECHNOLOGY/RENDER.SHIPGUN.GRAY.DDS',
	UT_SHIPMINI		= 'TECHNOLOGY/RENDER.PHOTONACCEL.BLUE1.DDS',
	T_SHIPSHLD		= 'TECHNOLOGY/RENDER.SHIELDMOD.DDS',
	UT_SHIPSHIELD	= 'TECHNOLOGY/RENDER.SHIELD.RED2.DDS',
	SHIP_LIFESUP	= 'TECHNOLOGY/RENDER.LIFESUP.DDS',
	SHIP_TELEPORT	= 'TECHNOLOGY/RENDER.FREIGHTERSCANNER.DDS',
---	vehicle
	EXO_RECHARGE	= 'TECHNOLOGY/VEHICLE/RENDER.ENGINE.ICARUS.DDS',
	MECH_BOOST		= 'TECHNOLOGY/VEHICLE/RENDER.MECH.BOOST.DDS',
	MECH_FUEL		= 'TECHNOLOGY/VEHICLE/RENDER.MECH.FUEL.DDS',
	MECH_MINER		= 'TECHNOLOGY/VEHICLE/RENDER.MECH.MINER.DDS',
	MECH_PROT		= 'TECHNOLOGY/VEHICLE/RENDER.MECH.PROT.DDS',
	SUB_RECHARGE	= 'U4PRODUCTS/PRODUCT.SUBMARINEUPGRADE.DDS',
	SUB_BINOCS		= 'TECHNOLOGY/VEHICLE/RENDER.SCAN.DDS',
---	weapon
	GROUND_SHIELD	= 'TECHNOLOGY/RENDER.SHIELD.BLUE3.DDS',
	LASER_XO		= 'TECHNOLOGY/RENDER.LASER.RED.DDS',
	STRONGLASER		= 'TECHNOLOGY/RENDER.LASER.YELLOW.DDS',
	UT_MINER		= 'TECHNOLOGY/RENDER.LASER.BLUE.DDS',
	BOLT_SM			= 'TECHNOLOGY/RENDER.PROJECTILE.BLUE.DDS',
	UT_BOLT			= 'TECHNOLOGY/RENDER.PROJECTILE.BLUE.DDS',
	UT_BOLTBOUNCE	= 'TECHNOLOGY/RENDER.RICOCHET.DDS',
	UT_SURVEY		= 'TECHNOLOGY/RENDER.BINOCULARS2.DDS',
	UT_SHOT			= 'TECHNOLOGY/RENDER.SCATTER.GREEN.DDS',
	UT_SMG			= 'TECHNOLOGY/RENDER.SPITTER.GREEN.DDS',
	UT_SMGBOUNCE	= 'TECHNOLOGY/RENDER.SPITTER.GREEN.DDS',
	UT_SMG_DOT		= 'TECHNOLOGY/RENDER.SPITTER.GREEN.DDS',
	UT_RAIL			= 'TECHNOLOGY/RENDER.BLAZEJAVELIN.BLUE.DDS',
	UT_CANNON		= 'TECHNOLOGY/RENDER.CANNON.GREEN.DDS',
	UT_RAIL_STUN	= 'TECHNOLOGY/RENDER.BLAZEJAVELIN.BLUE.DDS',
	UT_BUI_SCAN		= 'TECHNOLOGY/RENDER.SCAN.BUILDER.DDS',
	UT_S10_SCAN		= 'TECHNOLOGY/RENDER.SCAN.BUILDER.DDS',
	UT_SCAN			= 'TECHNOLOGY/RENDER.SCAN.RED.DDS',
	SENT_LASER		= 'TECHNOLOGY/RENDER.LASERSENTINEL2.DDS',
	WEAPSENT_DMG1	= 'TECHNOLOGY/SENTWEAP.DMG1.DDS',
	WEAPSENT_DMG2	= 'U4PRODUCTS/PRODUCT.DRONEPARTE3.DDS',
	WEAPSENT_DMG3	= 'TECHNOLOGY/SENTWEAP.DMG3.DDS',
	WEAPSENT_DMG4	= 'TECHNOLOGY/SENTWEAP.DMG4.DDS',
---	suit
	UT_ENERGY		= 'TECHNOLOGY/RENDER.CELL.BLUE.DDS',
	UT_WATERENERGY	= 'TECHNOLOGY/RENDER.CELL.BLUE.DDS',
	UT_JET			= 'TECHNOLOGY/RENDER.JETPACK.MOD.DDS',
	UT_JUMP			= 'TECHNOLOGY/RENDER.JETPACK.MOD.DDS',
	UT_MIDAIR		= 'TECHNOLOGY/RENDER.JETPACK.MOD.DDS',
	UT_WATERJET		= 'TECHNOLOGY/RENDER.JETPACK.MOD.DDS',
	UT_WATER		= 'TECHNOLOGY/RENDER.PROTECT.WATER.DDS',
	UT_PROTECT		= 'TECHNOLOGY/RENDER.PROTECT.BLUE.DDS',
	T_SHIELD		= 'TECHNOLOGY/RENDER.SHIELD.SUIT.DDS',
---	freighter
	F_TELEPORT		= 'TECHNOLOGY/RENDER.FREIGHTERSCANNER.DDS',
	F_HYPERDRIVE	= 'SPECIALSHOP/SPECIAL1.FREIGHTJETS.GRAVITY.DDS',
	F_MEGAWARP		= 'U4PRODUCTS/PRODUCT.ROGUEKEY.DDS',
	F_SCANNER		= 'TECHNOLOGY/TECHNOLOGY.FLEET.TRADE.DDS',
	T_FR_TRADE		= 'TECHNOLOGY/TECHNOLOGY.FLEET.TRADE1.DDS',
	T_FR_HYP		= 'TECHNOLOGY/RENDER.FREIGHTERHD.DDS',
	F_HACCESS1		= 'TECHNOLOGY/RENDER.FREIGHTER.GREEN.DDS',
	F_HACCESS2		= 'TECHNOLOGY/RENDER.FREIGHTER.RED.DDS',
	F_HACCESS3		= 'TECHNOLOGY/RENDER.FREIGHTER.BLUE.DDS'
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_MOD.lMonk.Technology Icons.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.29',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.MBIN',
		EXML_CHANGE_TABLE	= (
			function()
				T = {}
				for id, icon in pairs(tech_icons) do
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'ID', id},
						VALUE_CHANGE_TABLE 	= {
							{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/'..icon}
						}
					}
				end
				return T
			end
		)()
	}
}}},
	ADD_FILES	= (
		function()
			local T = {}
			local tex_path = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Icons/Technology/'
			for _,folder in ipairs({
				'',
				'Bio/',
				'Vehicle/',
			}) do
				if lfs.attributes(tex_path..folder) then
					T[#T+1] = {
						EXTERNAL_FILE_SOURCE = tex_path..folder..'/*.DDS',
						FILE_DESTINATION	 = 'TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/'..folder..'*.DDS',
					}
				end
			end
			return #T > 0 and T or nil
		end
	)()
}
