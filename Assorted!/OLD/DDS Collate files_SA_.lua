------------------------------------------------
---	Collate textures into a mod folder
---	A stand-alone and so is EXCLUDED FROM BATCH
------------------------------------------------

local texture_collection = {
	{--	blank replacers
		source = 'Blanks/',
		target = '',
		jobs   = {
		--	binoculars screen filters
			{s='BLANK.FILTER.DDS',			t='lut/filters/BINOCULARS.DDS'},
			{s='BLANK.FILTER.DDS',			t='lut/filters/SURVEYING1.DDS'},
			{s='BLANK.FILTER.DDS',			t='lut/filters/MISSIONSURVEY.DDS'},
		--	direction marker at screen edge
			{s='BLANK.BC7.128.DDS',			t='ui/hud/ARROW.MINI.DDS'},
		--	binoculars HUD background
			{s='BLANK.BC7.64.DDS',			t='ui/hud/BINOCULARS.DDS'},
			{s='BLANK.BC7.64.DDS',			t='ui/hud/BINOCULARMISSION.DDS'},
			{s='BLANK.BC7.64.DDS',			t='ui/hud/SURVEYING.DDS'},
		--	laser mid part & target crosshairs
			{s='BLANK.BC7.64.DDS',			t='ui/hud/CROSSHAIRLAZERMIDDLE.DDS'},
			{s='BLANK.BC7.64.DDS',			t='ui/hud/crosshairs/LARGETARGET.DDS'},
			{s='BLANK.BC7.64.DDS',			t='ui/hud/CROSSHAIRTARGET.DDS'},
		--	inv tab bulletpoint
			{s='BLANK.BC7.32.DDS',			t='ui/fonts/BULLETPOINT.DDS'},
		--	'new item' notification in menus
			{s='BLANK.BC7.32.DDS',			t='ui/frontend/components/NEWEXCLAMATION.DDS'},
		--	just the blank
			{s='BLANK.BC7.64.DDS'}
		}
	},
	{--	ships
		source = 'Ship/',
		target = 'common/',
		jobs   = {
		--	ship fabricator additions
			{s='Embossed/Ship/*.DDS',		t='spacecraft/fighters/shared/*.DDS'},
			{s='Embossed/Scientific/*.DDS', t='spacecraft/scientific/shared/*.DDS'},
		--	clean non-chipped fighter paint & white ship lights
			{s='FighterClean/*.DDS', 		t='spacecraft/fighters/shared/*.DDS'},
		--	dropship vulture lights
			{s='Dropship/*.DDS', 			t='spacecraft/dropship/shared/*.DDS'},
		--	B & W racer
			{s='Racer/WRACER*.DDS',			t='spacecraft/fighters/WRACER*.DDS'},
		--	blue theme speeder (and bit more reflective)
			{s='Speeder/VRSPEEDER*.DDS',	t='spacecraft/fighters/VRSPEEDER*.DDS'},
		--	black cockpit interior
			{s='Interior/*.DDS',			t='spacecraft/shared/cockpitinteriors/*.DDS'},
		--	sentinel ship blue lights
			{s='Sentinel/LIGHT*.DDS',		t='robots/shared/LIGHT*.DDS'},
		--	royal
			{s='Royal/*.DDS',				t='spacecraft/s-class/*.DDS'},
		}
	},
	{--	ship decals
		source = 'Decals/ship/',
		target = 'common/decals/',
		jobs   = {
			{s='*.DDS'} -- all
		}
	},
	{--	spacestation decals
		source = 'Decals/station/',
		target = 'space/spacestation/decals/',
		jobs   = {
			{s='*.DDS'} -- number + lettering
		}
	},
	{--	vehicle buggy/bike headlights
		source = 'Vehicle/',
		target = 'common/vehicles/buggy/',
		jobs   = {
			{s='BUGGYLIGHTS.1.DDS'}
		}
	},
	{--	carbon-fiber laylaps, sentinel ship guns; mech hardframe
		source = 'FriendlyRobot/',
		target = 'common/robots/',
		jobs   = {
			{s='*.DDS'}
		}
	},
	{--	planetary clouds replacement
		source = 'Clouds/',
		target = 'space/atmosphere/',
		jobs   = {
			{s='ATMOSPHERE03.DDS'}
		}
	},
	{--	multitool display screen & glow parts
		source = 'Weapon/',
		target = 'ui/weapon/',
		jobs   = {
			{s='*SCREEN.DDS'}
		}
	},
	{--	multitool dark pristine + glow
		source = 'Weapon/',
		target = 'common/weapons/multitool/',
		jobs   = {
			{s='MULTITOOL*.DDS'}
		}
	},
	{--	effects
	--	wordstone white beam fix
	--	dark blue trail (requires change in HOTDARKTRAIL.MATERIAL.MBIN)
	--	blue infraknife shot (requires change in SHIPMINIGUNPROJECTILEGRADIENT.MATERIAL.MBIN)
	--	remove sailship wing blinkers; alt warp textures
	--	Fix ship engine jet outer circle
		source = 'Effects/',
		target = 'effects/',
		jobs   = {
			{s='Beam/*.DDS'},
			{s='Light/*.DDS'},
			{s='Particles/*.DDS'},
			{s='Ship/*.DDS'},
			{s='Trails/*.DDS',				t='trails/HOT/*.DDS'}
		}
	},
	{--	black carbon crystals
		source = 'BlackCarbon/',
		target = 'planets/biomes/',
		jobs   = {
			{s='*.RED.DDS',					t='common/crystals/*.RED.DDS'},
			{s='MINERAL2.BASE.DDS',			t='crystal/largeprop/MINERAL2.BASE.DDS'}
		}
	},
	{--	Stations: crane, atlas red beam
		source = 'Building/',
		target = 'space/',
		jobs   = {
			{s='ATLASSTATION/*.DDS'},
			{s='PirateStation/*.DDS',		t='spacestation/PIRATES/*.DDS'}
		}
	},
	{--	building parts: cleaner glass panes, decal replacers
		source = 'Building/',
		target = 'planets/biomes/common/buildings/shared/buildablebuildings/',
		jobs   = {
			-- {s='Glass/*.DDS',				t='*.DDS'},
			-- {s='Decals/*NUMBER*.DDS',		t='Decals/*NUMBER*.DDS'}
			{s='Decals/DECAL*.DDS',				t='decals/DECAL*.DDS'}
		}
	},
	{--	ICONS: FRONTEND general
		source = 'Icons/',
		target = 'ui/frontend/icons/',
		jobs   = {
		--	personal-use (separated from published)
			{s='Personals/PRODUCT.*.DDS',		t='products/PRODUCT.*.DDS'},
			{s='Personals/BIOTECH.*.DDS',		t='technology/bio/BIOTECH.*.DDS'},
		--	base parts number decals
			-- {s='Buildable/DECAL.NUM?.DDS'},
		--	for the quickmenu bytebeat
			{s='Buildable/BUILDABLE.BYTEBEAT.DDS'},
		--	popup menu categories
			{s='Categories/INVCAT.*.DDS'},
		--	missions on/off
			{s='Missions/mission.*.DDS'},
		--	products
			{s='Products/Products/*.DDS', 		t='products/*.DDS'},
			{s='Products/CookingProducts/*.DDS',t='cookingproducts/*.DDS'},
			{s='Products/ShipIcons/*.DDS',		t='shipicons/*.DDS'},
			{s='Products/u4Products/*.DDS',		t='u4products/*.DDS'},
			{s='Products/Update3/*.DDS',		t='update3/*.DDS'},
		--	substances
			{s='U4Substances/SUBSTANCE.*.DDS'},
		-- technology
			{s='Technology/*.DDS'},
			{s='Technology/Bio/*.DDS'},
			{s='Technology/Vehicle/*.DDS'},
		}
	},
	{--	ICONS: HUD translucent icons
		source = 'Icons/Hud/',
		target = 'ui/hud/icons/',
		jobs   = {
			{s='Building/*.DDS',			t='buildings/*.DDS'},
			{s='Pickups/*.DDS',				t='pickups/*.DDS'},
			{s='U4Pickups/*.DDS',			t='u4pickups/*.DDS'},
			{s='Player/*.DDS',				t='player/*.DDS'},
			{s='BLACKHOLE.DDS',				t='missions/MISSION.BLACKHOLE.DDS'},
			{s='PLANETPOLE*.DDS'},
			{s='CREATURE.*.DDS'}
		}
	},
	{--	ICONS: quickmenu
		source = 'Icons/Quickmenu/',
		target = 'ui/frontend/icons/quickmenu/',
		jobs   = {
			{s='*.DDS'},
			-- THIRDPERSONSHIP is copied twice
			{s='THIRDPERSONSHIP.DDS', 		t='THIRDPERSONCHARACTER.DDS'},
		}
	},
	{--	menu: galactic map part
		source = 'UI/galactic/',
		target = 'ui/frontend/galacticmap/',
		jobs   = {
			{s='VISITEDSYSTEMS.DDS'}
		}
	},
	{--	menu: UI background
		source = 'UI/background/',
		target = 'ui/frontend/backgrounds/',
		jobs   = {
			{s='*.DDS'}
		}
	},
	{--	player: vkyeen gloves
		source = 'Player/',
		target = 'common/player/playercharacter/',
		jobs   = {
			{s='VYKEEN*.DDS'}
		}
	},
	{--	player: builder cloth padding
		source = 'Player/',
		target = 'common/robots/cloth/canvas/',
		jobs   = {
			{s='CLOTHTILEABLEPAD*.DDS'}
		}
	}
}

local mod_path	= 'D:/SteamLibrary/steamapps/common/No Man\'s Sky/GAMEDATA/MODS/dds ~@~resouces/textures/'
local src_path	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/'

local function lsh(p) return p:gsub('/', '\\') end

os.execute(('if not exist "<>" md "<>"'):gsub('<>', mod_path))

for _,dds in ipairs(texture_collection) do
	for _,cpy in ipairs(dds.jobs) do
		os.execute(
			('xcopy "%s" "%s" /-I /ECYQ'):format(
				lsh(src_path..dds.source..cpy.s),
				lsh(mod_path..dds.target..(cpy.t or cpy.s))
			)
		)
	end
end

print('\nDDS collection mod folder created.\n')
