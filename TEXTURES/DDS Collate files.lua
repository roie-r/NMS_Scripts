-------------------------------
mod_desc = [[
  Collate texture replacements
]]-----------------------------

local dds_sources = {
	{
	---	blank replacers
		source = 'Blanks/',
		target = '',
		names  = {
			-- binoculars screen filters
			{'BLANK.FILTER.DDS','LUT/FILTERS/BINOCULARS.DDS'},
			{'BLANK.FILTER.DDS','LUT/FILTERS/SURVEYING1.DDS'},
			{'BLANK.FILTER.DDS','LUT/FILTERS/MISSIONSURVEY.DDS'},
			-- binoculars HUD background
			{'BLANK.64.DDS',	'UI/HUD/BINOCULARS.DDS'},
			{'BLANK.64.DDS',	'UI/HUD/BINOCULARMISSION.DDS'},
			{'BLANK.64.DDS',	'UI/HUD/SURVEYING.DDS'},
			-- laser mid part & target crosshairs
			{'BLANK.64.DDS',	'UI/HUD/CROSSHAIRLAZERMIDDLE.DDS'},
			{'BLANK.64.DDS',	'UI/HUD/CROSSHAIRS/LARGETARGET.DDS'},
			{'BLANK.64.DDS',	'UI/HUD/CROSSHAIRTARGET.DDS'},
			-- hide inv tab bulletpoint
			{'BLANK.32.DDS',	'UI/FONTS/BULLETPOINT.DDS'},
			-- just the blank
			{'BLANK.64.DDS'},
		}
	},{
	---	clean non-chipped fighter paint & white ship lights
		source = 'Ship/FighterClean/',
		target = 'COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		names  = {
			{'*.DDS'}
		}
	},{
	---	sentinel ship blue lights
		source = 'Ship/Sentinel/',
		target = 'COMMON/ROBOTS/SHARED/',
		names  = {
			{'LIGHTS.?.DDS'}
		}

	},{
	---	blue theme speeder (and bit more reflective)
		source = 'Ship/Speeder/',
		target = 'COMMON/SPACECRAFT/FIGHTERS/',
		names  = {
			{'VRSPEEDER.*.DDS'}
		}
	},{
	---	Dimmer sailship sail
		source = 'Ship/Sail/',
		target = 'COMMON/SPACECRAFT/FIGHTERS/SAILS/',
		names  = {
			{'*.DDS'}
		}
	},{
	---	vehicle buggy/bike headlights
		source = 'Vehicle/',
		target = 'COMMON/VEHICLES/BUGGY/',
		names  = {
			{'BUGGYLIGHTS.1.DDS'}
		}
	},{
	---	carbon-fiber laylaps
		source = 'FriendlyRobot/',
		target = 'COMMON/ROBOTS/',
		names  = {
			{'FRIENDLYDRONE.DDS'}
		}
	},{
	---	planetary clouds replacement
		source = 'Clouds/',
		target = 'SPACE/ATMOSPHERE/',
		names  = {
			{'ATMOSPHERE.DDS'}
		}
	},{
	---	multitool display screen & glow parts
		source = 'Weapon/',
		target = 'UI/WEAPON/',
		names  = {
			{'*SCREEN.DDS'},
		}
	},{
	---	dark blue trail (requires change in HOTDARKTRAIL.MATERIAL.MBIN)
	---	blue infraknife shot (requires change in SHIPMINIGUNPROJECTILEGRADIENT.MATERIAL.MBIN)
	---	remove sailship wing blinkers; alt warp textures
		source = 'Effects/',
		target = 'EFFECTS/',
		names  = {
			{'HeavyAir/*.DDS'},
			{'Light/*.DDS'},
			{'Particles/*.DDS'},
			{'Trails/*.DDS',	'TRAILS/HOT/*.DDS'}
		}
	},{
	---	black carbon crystals
		source = 'BlackCarbon/',
		target = 'PLANETS/BIOMES/',
		names  = {
			{'*.RED.DDS',			'COMMON/CRYSTALS/*.RED.DDS'},
			{'MINERAL2.BASE.DDS',	'CRYSTAL/LARGEPROP/MINERAL2.BASE.DDS'}
		}
	},{
	---	hangar crane; includes light used in the sentinel ship
		source = 'Building/PirateStation/',
		target = 'SPACE/SPACESTATION/PIRATES/',
		names  = {
			{'*.DDS'}
		}
	},{
	---	building parts: cleaner glass panes, decal replacers
		source = 'Building/',
		target = 'PLANETS/BIOMES/COMMON/BUILDINGS/SHARED/BUILDABLEBUILDINGS/',
		names  = {
			{'Glass/*.DDS',		'*.DDS'},
			{'Decals/*.DDS',	'DECALS/*.DDS'}
		}
	},{
	---	ICONS: base part number decals
		source = 'Icons/Base/',
		target = 'UI/FRONTEND/ICONS/BUILDABLE/',
		names  = {
			{'DECAL.NUM?.DDS'},
			-- used for the quickmenu
			{'BUILDABLE.BYTEBEAT.DDS'},
		}
	},{
	---	ICONS: inventory
		source = 'Icons/',
		target = 'UI/FRONTEND/ICONS/',
		names  = {
		---	products & substances
			{'Products/PRODUCT.*.DDS'},
			{'u4Products/PRODUCT.*.DDS'},
			{'UPDATE3/*.DDS'},
			{'Products/Ketaros/PRODUCT.*.DDS'},
			{'U4Substances/SUBSTANCE.*.DDS'},
		--- technology
			{'Technology/*.DDS'},
			{'Technology/Bio/*.DDS'},
			{'Technology/Vehicle/*.DDS'},
		}
	},{
	---	ICONS: quickmenu
		source = 'Icons/Quickmenu/',
		target = 'UI/FRONTEND/ICONS/QUICKMENU/',
		names  = {
			{'*.DDS'},
			-- THIRDPERSONSHIP is copied twice
			{'THIRDPERSONSHIP.DDS', 'THIRDPERSONCHARACTER.DDS'},
		}
	},{
	---	 ICONS: HUD translucent icons
		source = 'Icons/Hud/',
		target = 'UI/HUD/ICONS/',
		names  = {
			{'Building/*.DDS',		'BUILDINGS/*.DDS'},
			{'Pickups/*.DDS',		'PICKUPS/*.DDS'},
			{'U4Pickups/*.DDS',		'U4PICKUPS/*.DDS'},
			{'Poles/*.DDS',			'*.DDS'},
			{'Player/*.DDS',		'PLAYER/*.DDS'},
			{'BLACKHOLE.DDS',		'MISSIONS/MISSION.BLACKHOLE.DDS'},
			-- discovered creature HUD icon (requires change in SCANNERICONS.MBIN)
			{'CREATURE.*.DDS'}
		}
	},{
	---	player: vkyeen gloves
		source = 'Player/',
		target = 'COMMON/PLAYER/PLAYERCHARACTER/',
		names  = {
			{'VYKEEN*.DDS'}
		}
	},{
	---	menu: UI background
		source = 'UI/background/',
		target = 'UI/FRONTEND/BACKGROUNDS/',
		names  = {
			{'*.DDS'}
		}
	}
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TEXTURE collate dds files.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= (
		function()
			local T = {}
			for _,rp in pairs(dds_sources) do
				for _,f in ipairs(rp.names) do
					T[#T+1] = {
						EXTERNAL_FILE_SOURCE = 'E:/MODZ_stuff/NoMansSky/Sources/_Textures/'..rp.source..f[1],
						FILE_DESTINATION	 = 'TEXTURES/'..(rp.target..(f[2] or f[1])):upper(),
					}
				end
			end
			return T
		end
	)()
}
