-------------------------------
local desc = [[
  Organize texture replacers
]]-----------------------------

local File_Mover = {
	-- clean non-chipped fighter paint
	Clean_Fighter = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/CleanFighter/',
		target = 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		names  = {
			{'HQTRIM_METAL.TRIMMETAL.DDS'},
			{'HQTRIM_METAL.TRIMMETAL.MASKS.DDS'},
			{'HQTRIM_METAL.TRIMMETAL.NORMAL.DDS'},
		}
	},
	-- white hardframe mech & carbon-fiber laylaps
	Friendly_Robot = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/FriendlyRobot/',
		target = 'TEXTURES/COMMON/ROBOTS/',
		names  = {
			{'FRIENDLYDRONE.DDS'},
			{'SENTINELTRIM.DDS'},
		}
	},
	blank_replacers = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/Blanks/',
		target = 'TEXTURES/',
		names  = {
			-- binoculars screen filters
			{'BLANK.FILTER.DDS','LUT/FILTERS/BINOCULARS.DDS'},
			{'BLANK.FILTER.DDS','LUT/FILTERS/SURVEYING1.DDS'},
			{'BLANK.FILTER.DDS','LUT/FILTERS/MISSIONSURVEY.DDS'},
			-- binoculars HUD background
			{'BLANK.16.DDS',	'UI/HUD/BINOCULARS.DDS'},
			{'BLANK.16.DDS',	'UI/HUD/BINOCULARMISSION.DDS'},
			{'BLANK.16.DDS',	'UI/HUD/SURVEYING.DDS'},
			-- laser mid part & target crosshairs
			{'BLANK.16.DDS',	'UI/HUD/CROSSHAIRLAZERMIDDLE.DDS'},
			{'BLANK.16.DDS',	'UI/HUD/CROSSHAIRS/LARGETARGET.DDS'},
			{'BLANK.16.DDS',	'UI/HUD/CROSSHAIRTARGET.DDS'},
		}
	},
	-- restore discovered creature HUD icon (requires change in SCANNERICONS.MBIN)
	creature_discovered = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/CreatureDiscovered/',
		target = 'TEXTURES/UI/HUD/',
		names  = {
			{'CREATURE.DISCOVERED.DDS'}
		}
	},
	-- planetary clouds replacement
	atmo_clouds = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/Clouds/',
		target = 'TEXTURES/SPACE/ATMOSPHERE/',
		names  = {
			{'ATMOSPHERE.DDS'}
		}
	},
	multitool_screen = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/MultitoolScreen/',
		target = 'TEXTURES/UI/WEAPON/',
		names  = {
			{'GUNSCREEN.DDS'},
			{'LASERSCREEN.DDS'}
		}
	},
	-- replace dark purple trail (requires change in HOTDARKTRAIL.MATERIAL.MBIN)
	blue_ship_trail = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/ShipTrail/',
		target = 'TEXTURES/EFFECTS/TRAILS/HOT/',
		names  = {
			{'BLUEDARK.DDS'}
		}
	},
	-- Number decals building parts
	base_number_decals = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/BaseNumberDecals/',
		target = 'TEXTURES/PLANETS/BIOMES/COMMON/BUILDINGS/SHARED/BUILDABLEBUILDINGS/DECALS/',
		names  = {
			{'BASEBUILDINGDECALS_NUMBERS.A0.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A0.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A1.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A1.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A2.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A2.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A3.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A3.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A4.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A4.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A5.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A5.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A6.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A6.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A7.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A7.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A8.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A8.MASKS.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A9.DDS'},
			{'BASEBUILDINGDECALS_NUMBERS.A9.MASKS.DDS'},
		}
	},
	-- Menu icons for the number decals building parts
	base_number_decal_icons = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/BaseNumberDecals/icons/',
		target = 'TEXTURES/UI/FRONTEND/ICONS/BUILDABLE/',
		names  = {
			{'DECAL.NUM0.DDS'},
			{'DECAL.NUM1.DDS'},
			{'DECAL.NUM2.DDS'},
			{'DECAL.NUM3.DDS'},
			{'DECAL.NUM4.DDS'},
			{'DECAL.NUM5.DDS'},
			{'DECAL.NUM6.DDS'},
			{'DECAL.NUM7.DDS'},
			{'DECAL.NUM8.DDS'},
			{'DECAL.NUM9.DDS'},
		}
	},
	black_carbon = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/BlackCarbon/',
		target = 'TEXTURES/PLANETS/BIOMES/',
		names  = {
			{'LARGECRYSTAL2.RED.DDS',	'COMMON/CRYSTALS/LARGECRYSTAL2.RED.DDS'},
			{'MEDIUMCRYSTAL2.RED.DDS',	'COMMON/CRYSTALS/MEDIUMCRYSTAL2.RED.DDS'},
			{'MINERAL2.BASE.DDS',		'CRYSTAL/LARGEPROP/MINERAL2.BASE.DDS'},
		}
	},
	black_carbon_icons = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/BlackCarbon/icons/',
		target = 'TEXTURES/UI/HUD/ICONS/PICKUPS/',
		names  = {
			{'PICKUP.CARBON.DDS'},
			{'PICKUP.CARBONPLUS.DDS'}
		}
	},
	--space station front deacls .. REQUIRES rebuilding of the relevant TEXTURES.MBIN
	station_decals = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/decals/station/',
		target = 'TEXTURES/SPACE/SPACESTATION/DECALS/',
		names  = {
			{'LETTERING.BASE.LETTER1.DDS'},
			{'LETTERING.BASE.LETTER2.DDS'},
			{'LETTERING.BASE.LETTER3.DDS'},
			{'LETTERING.BASE.LETTER4.DDS'},
			{'LETTERING.BASE.LETTER5.DDS'},
			{'LETTERING.BASE.LETTER6.DDS'},
			{'LETTERING.BASE.LETTER7.DDS'},
			-- {'LETTERING.OVERLAY.MASKS.DDS'},
			{'NUMBER.BASE.C1.DDS'},
			{'NUMBER.BASE.C2.DDS'},
			{'NUMBER.BASE.C3.DDS'},
			{'NUMBER.BASE.C4.DDS'},
			{'NUMBER.BASE.C5.DDS'},
			{'NUMBER.BASE.C6.DDS'},
			{'NUMBER.BASE.C7.DDS'},
			{'NUMBER.BASE.C8.DDS'},
			{'NUMBER.BASE.C9.DDS'},
		}
	},
	-- ship lettering decals .. REQUIRES rebuilding of the relevant TEXTURES.MBIN
	ship_decals_lettering = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/decals/ship/lettering/',
		target = 'TEXTURES/COMMON/DECALS/LETTERING/',
		names  = {
			{'LETTERING.BASE.LT1.DDS'},
			{'LETTERING.BASE.LT2.DDS'},
			{'LETTERING.BASE.LT3.DDS'},
			{'LETTERING.BASE.LT4.DDS'},
			{'LETTERING.BASE.LT5.DDS'},
			{'LETTERING.BASE.LT6.DDS'},
			{'LETTERING.BASE.LT7.DDS'},
			{'LETTERING.BASE.LT8.DDS'},
			{'LETTERING.BASE.LT9.DDS'},
		}
	},
	-- ship logo deacls .. REQUIRES rebuilding of the relevant TEXTURES.MBIN
	ship_decals_logo = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/decals/ship/logo/',
		target = 'TEXTURES/COMMON/DECALS/LOGO/',
		names  = {
			{'LOGO.BASE.L1.DDS'},
			{'LOGO.BASE.L2.DDS'},
			{'LOGO.BASE.L3.DDS'},
			{'LOGO.BASE.L4.DDS'},
			{'LOGO.BASE.L5.DDS'},
			{'LOGO.BASE.L6.DDS'},
			{'LOGO.BASE.L7.DDS'},
			{'LOGO.BASE.L8.DDS'},
			{'LOGO.BASE.L9.DDS'},
			{'LOGO.BASE.L10.DDS'},
			{'LOGO.BASE.L11.DDS'},
			{'LOGO.BASE.L12.DDS'},
			{'LOGO.BASE.L13.DDS'},
			{'LOGO.BASE.L14.DDS'},
			{'LOGO.BASE.L15.DDS'},
		}
	},
	-- ship number decals .. REQUIRES rebuilding of the relevant TEXTURES.MBIN
	ship_decals_number = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/decals/ship/number/',
		target = 'TEXTURES/COMMON/DECALS/NUMBER/',
		names  = {
			{'NUMBER.BASE.A1.DDS'},
			{'NUMBER.BASE.A2.DDS'},
			{'NUMBER.BASE.A3.DDS'},
			{'NUMBER.BASE.A4.DDS'},
			{'NUMBER.BASE.A5.DDS'},
			{'NUMBER.BASE.A6.DDS'},
			{'NUMBER.BASE.A7.DDS'},
			{'NUMBER.BASE.A8.DDS'},
			{'NUMBER.BASE.A9.DDS'},
			{'NUMBER.BASE.B1.DDS'},
			{'NUMBER.BASE.B2.DDS'},
			{'NUMBER.BASE.B3.DDS'},
			{'NUMBER.BASE.B4.DDS'},
			{'NUMBER.BASE.B5.DDS'},
			{'NUMBER.BASE.B6.DDS'},
			{'NUMBER.BASE.B7.DDS'},
			{'NUMBER.BASE.B8.DDS'},
			{'NUMBER.BASE.B9.DDS'},
			{'NUMBER.BASE.C1.DDS'},
			{'NUMBER.BASE.C2.DDS'},
			{'NUMBER.BASE.C3.DDS'},
			{'NUMBER.BASE.C4.DDS'},
			{'NUMBER.BASE.C5.DDS'},
			{'NUMBER.BASE.C6.DDS'},
			{'NUMBER.BASE.C7.DDS'},
			{'NUMBER.BASE.C8.DDS'},
			{'NUMBER.BASE.C9.DDS'},
		}
	},
	-- ship rectangle decals .. REQUIRES rebuilding of the relevant TEXTURES.MBIN
	ship_decals_rectangle = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/decals/ship/rectangle/',
		target = 'TEXTURES/COMMON/DECALS/RECTANGLE/',
		names  = {
			{'RECTANGLE.BASE.R1.DDS'},
			{'RECTANGLE.BASE.R2.DDS'},
			{'RECTANGLE.BASE.R3.DDS'},
			{'RECTANGLE.BASE.R4.DDS'},
			{'RECTANGLE.BASE.R5.DDS'},
			{'RECTANGLE.BASE.R6.DDS'},
			{'RECTANGLE.BASE.R7.DDS'},
			{'RECTANGLE.BASE.R8.DDS'},
			{'RECTANGLE.BASE.R9.DDS'},
			{'RECTANGLE.BASE.R10.DDS'},
			{'RECTANGLE.BASE.R11.DDS'},
			{'RECTANGLE.BASE.R12.DDS'},
			{'RECTANGLE.BASE.R13.DDS'},
			{'RECTANGLE.BASE.R14.DDS'},
			{'RECTANGLE.BASE.R15.DDS'},
		}
	},
	-- ship smallsign decals .. REQUIRES rebuilding of the relevant TEXTURES.MBIN
	ship_decals_smallsign = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/decals/ship/smallsign/',
		target = 'TEXTURES/COMMON/DECALS/SMALLSIGN/',
		names  = {
			{'SMALLSIGN.BASE.S1.DDS'},
			{'SMALLSIGN.BASE.S2.DDS'},
			{'SMALLSIGN.BASE.S3.DDS'},
			{'SMALLSIGN.BASE.S4.DDS'},
			{'SMALLSIGN.BASE.S5.DDS'},
			{'SMALLSIGN.BASE.S6.DDS'},
		}
	},
	-- Menu icons
	menu_icons = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/MenuIcons/',
		target = 'TEXTURES/UI/FRONTEND/ICONS/',
		names  = {
			{'PRODUCTS/PRODUCT.METALLIC.3.DDS'},
			{'PRODUCTS/PRODUCT.METALLIC.5.DDS'},
			{'PRODUCTS/PRODUCT.METALLIC.8.DDS'},
			{'U4PRODUCTS/PRODUCT.FRIGBOOST.COMBAT.DDS'},
			{'U4PRODUCTS/PRODUCT.FRIGBOOST.EXPLORE.DDS'},
			{'U4PRODUCTS/PRODUCT.FRIGBOOST.MINING.DDS'},
			{'U4PRODUCTS/PRODUCT.FRIGBOOST.SPEED.DDS'},
			{'U4PRODUCTS/PRODUCT.FRIGBOOST.TRADE.DDS'},
			{'U4PRODUCTS/PRODUCT.GEODE.DDS'},
			{'U4PRODUCTS/PRODUCT.RESEARCHTOKEN.DDS'},
			{'U4PRODUCTS/PRODUCT.STARCHART.BUILDING.DDS'},
			{'U4PRODUCTS/PRODUCT.STARCHART.DISTRESSSIGNAL.DDS'},
			{'U4PRODUCTS/PRODUCT.STARCHART.FACTORY.DDS'},
			{'U4PRODUCTS/PRODUCT.STARCHART.RUNE.DDS'},
			{'U4PRODUCTS/PRODUCT.STORMCRYSTAL.DDS'},
			{'U4SUBSTANCES/SUBSTANCE.ASTEROID.1.DDS'},
			{'U4SUBSTANCES/SUBSTANCE.ASTEROID.2.DDS'},
			{'U4SUBSTANCES/SUBSTANCE.ASTEROID.3.DDS'},
			{'U4SUBSTANCES/SUBSTANCE.CREATURE.1.DDS'},
			{'U4SUBSTANCES/SUBSTANCE.FUEL.1.DDS'},
			{'U4SUBSTANCES/SUBSTANCE.FUEL.2.DDS'},
			{'U4SUBSTANCES/SUBSTANCE.ROBOT.1.DDS'},
			{'UPDATE3/COMPOUND.4.DDS'},
			{'UPDATE3/MEGAPROD.1.DDS'},
			{'UPDATE3/TRADEPROD.ALLOY1.DDS'},
			{'UPDATE3/TRADEPROD.COMMODITY3.DDS'},
			{'UPDATE3/TRADEPROD.COMPONENT5.DDS'},

			-- replaces vehicle scan icon with TEXTURES/UI/FRONTEND/ICONS/STATS/STATS.SHIP.SCAN.DDS
			-- (waiting on INTERNAL file adding)
			{'QUICKMENU/VEHICLESCAN.DDS'},

			-- REQUIRES changes in NMS_REALITY_GCPRODUCTTABLE.MBIN)
			{'KETAROS/PRODUCT.ATLASPASS2.DDS'},
			{'KETAROS/PRODUCT.ATLASPASS3.DDS'},
			{'KETAROS/PRODUCT.FRIGATEMOD.DDS'},
			{'KETAROS/PRODUCT.HERMETICS.DDS'},
			{'KETAROS/PRODUCT.LOGKEY.DDS'},
			{'KETAROS/PRODUCT.MEAT.LIVER.DDS'},
			{'KETAROS/PRODUCT.MEAT.SAUSAGE.DDS'},
			{'KETAROS/PRODUCT.MEATCHUNKY.DDS'},
			{'KETAROS/PRODUCT.MEATLEG.DDS'},
			{'KETAROS/PRODUCT.MEATSTAKE.DDS'},
			{'KETAROS/PRODUCT.QUANTUMP.DDS'},
			{'KETAROS/PRODUCT.SHIPINV.DDS'},
			{'KETAROS/PRODUCT.SHIPINV2.DDS'},
		}
	},
	-- hud icons
	icons_black_hole = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/hud/',
		target = 'TEXTURES/UI/HUD/ICONS/',
		names  = {
			{'PLANETPOLENORTH.DDS'},
			{'PLANETPOLESOUTH.DDS'},
			{'MISSIONS/MISSION.BLACKHOLE.DDS'}
		}
	},
	-- transparent player HUD icons
	icons_player = {
		source = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/hud/player/',
		target = 'TEXTURES/UI/HUD/ICONS/PLAYER/',
		names  = {
			{'BASE.DDS'},
			{'BASEEDIT.DDS'},
			{'BEACON.DDS'},
			{'BIKE.DDS'},
			{'DEATH.DDS'},
			{'HOVERCRAFT.DDS'},
			{'MECH.DDS'},
			{'NETWORKPLAYERSHIP.DDS'},
			{'NETWORKPLAYERVEH.DDS'},
			{'PET.DDS'},
			{'PETACTIVE.DDS'},
			{'PETSAD.DDS'},
			{'PLAYERFREIGHTER.DDS'},
			{'PLAYERLOCATION.DDS'},
			{'SAVE.DDS'},
			{'SETTLEMENT.DDS'},
			{'SETTLEMENTOTHER.DDS'},
			{'SHIP.DDS'},
			{'STARTSYSTEM.DDS'},
			{'TRUCK.DDS'},
			{'VEHICLE.DDS'},
			{'WHEELEDBIKE.DDS'},
		}
	},
}

local function BuildAddFilesTable()
	local T = {}
	for _,p in pairs(File_Mover) do
		for _,s in pairs(p.names) do
			table.insert(T, {
				EXTERNAL_FILE_SOURCE = p.source..s[1],
				FILE_DESTINATION	 = p.target..(s[2] or s[1]),
			})
		end
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TEXTURE replacers.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.84,
	MOD_BATCHNAME		= '_TEXTURES ~@~collection.pak',
	MOD_DESCRIPTION		= desc,
	MODIFICATIONS		= {},
	ADD_FILES			= BuildAddFilesTable()
}
