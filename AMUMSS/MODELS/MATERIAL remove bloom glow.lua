--[[┎──────────────────────────────────────────────────────────────
	┃ 				ALWAYS EXCLUDED FROM BATCH
	┠──────────────────────────────────────────────────────────
	┃ Remove bloom glow flag:: engines, base parts, plants
────┸──────────────────────────────────────────────────────────--]]
P = {
	ship = 'MODELS\COMMON\SPACECRAFT\\',
	exo = 'MODELS\COMMON\VEHICLES\\',
	base = 'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\\',
	farm = 'MODELS\PLANETS\BIOMES\COMMON\INTERACTIVEFLORA\\'
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL remove bloom glow.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			P.ship .. 'DROPSHIPS\ENGINES\ENGINESA\ENGINEGLOW_MAT3.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSA\THRUSTERSA_LEFT\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSA\THRUSTERSA_RIGHT\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSB\THRUSTERSB_LEFT\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSB\THRUSTERSB_RIGHT\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSC\THRUSTERSC_LEFT\ENGINEGLOW_MAT3.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSC\THRUSTERSC_RIGHT\ENGINEGLOW_MAT3.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSD\THRUSTERSD_L\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSD\THRUSTERSD_R\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'DROPSHIPS\THRUSTERS\THRUSTERSD\THRUSTERS_L\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\ACCESSORIES\TURBINEAA\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\COCKPIT\COCKPIT_F\COCKPTF\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\ENGINE\ENGINE_B\PARTS\ENGINEBTHRUSTER\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\ENGINE\ENGINE_C\ENGINEC\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\ENGINE\ENGINE_D\ENGINED\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\WINGS\WINGS_A\WINGS_A\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\WINGS\WINGS_B\WINGSB\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\WINGS\WINGS_E\WINGSE\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\WINGS\WINGS_H\WINGSH\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'FIGHTERS\WINGS\WINGS_K\WINGSK\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\BIOPARTS\ENGINE\PARTS\ENGINETHRUSTERA\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\BIOPARTS\ENGINE\PARTS\ENGINETHRUSTERB\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\ROYALPARTS\ENGINE\ENGINE_A\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\ROYALPARTS\ENGINE\ENGINE_B\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\ROYALPARTS\ENGINE\ENGINE_C\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\ROYALPARTS\TOPWING\TOPWING_B\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\ROYALPARTS\WINGS\WINGS_B\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\ROYALPARTS\WINGS\WINGS_C\ENGINEGLOW_MAT3.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\SQUIDPARTS\COCKPIT\COCKPIT_A\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\SQUIDPARTS\ENGINE\ENGINE_A\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'S-CLASS\SQUIDPARTS\NOSESECTION\NOSESECTION_A\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\COCKPIT\COCKPITA\BACK\COCKPITABACKB\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\COCKPIT\COCKPITA\COCKPITA\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\COCKPIT\COCKPITD\COCKPITD\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\SUBWINGS\SUBWINGSA\SUBWINGSA_LEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\SUBWINGS\SUBWINGSA\SUBWINGSA_RIGHT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\SUBWINGS\SUBWINGSC\SUBWINGSC_LEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\SUBWINGS\SUBWINGSC\SUBWINGSC_RIGHT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSA\WINGSA_LEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSA\WINGSA_RIGHT\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSB\WINGSBLEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSB\WINGSBRIGHT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSC\WINGCLEFT\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSC\WINGCRIGHT\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSD\WINGDLEFT\ENGINEGLOW_MAT3.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSD\WINGDRIGHT\ENGINEGLOW_MAT3.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSG\WINGGLEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSG\WINGGLEFT\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSG\WINGGRIGHT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSG\WINGGRIGHT\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSK\WINGKLEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSK\WINGKRIGHT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSL\WINGSL_LEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SCIENTIFIC\WINGS\WINGSL\WINGSL_RIGHT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\ACCESSORIES\ACCESSORYA\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\ACCESSORIES\ACCESSORYC\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\ACCESSORIES\ACCESSORYF\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\ACCESSORIES\ACCESSORYG\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\ACCESSORIES\ACCESSORYG\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\ACCESSORIES\ACCESSORYI\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\COCKPIT\COCKPITACCESSORIES\COCKPITACC_D\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\COCKPIT\COCKPITBDOUBLECYLINDER\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\COCKPIT\COCKPITBSINGLECYLINDER\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\BOXDOUBLE\BOXHULLEND\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\BOXHULL\BOXHULLEND\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\PODSHULL\BOX\BOXPOD\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\PODSHULL\CYLINDER\CYLINDERHULLEND\ENGINE_BIG_PASTED__ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\PODSHULL\CYLINDER\CYLINDERHULLEND\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\PODSHULLDOUBLE\LCYLINDERHULLDOUBLE\ENGINE_BIG_PASTED__ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\PODSHULLDOUBLE\LCYLINDERHULLDOUBLE\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\PODSHULLDOUBLE\RCYLINDERHULLDOUBLE\ENGINE_BIG_PASTED__ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\HULL\PODSHULLDOUBLE\RCYLINDERHULLDOUBLE\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\THRUSTER\THRUSTERA\LTHRUSTERA\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\THRUSTER\THRUSTERA\RTHRUSTERA\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\WINGS\WINGSE\WINGSEEND_LEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\WINGS\WINGSE\WINGSEEND_RIGHT\ENGINEGLOW_MAT1.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\WINGS\WINGSF\WINGSF_LEFT\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\WINGS\WINGSF\WINGSF_RIGHT\ENGINEGLOW_MAT2.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\WINGS\WINGSL\WINGSL_L\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.ship .. 'SHUTTLE\WINGS\WINGSL\WINGSL_R\ENGINEGLOW_MAT.MATERIAL.MBIN',

			P.exo .. 'BIKE\BIKEPRES\LIGHTS_ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.exo .. 'BUGGY\BUGGYPRES\ENGINEGLOW_MAT.MATERIAL.MBIN',
			P.exo .. 'ROVER\ROVERPRES\ENGINEGLOW_MAT1.MATERIAL.MBIN',

			P.base .. 'DECORATION\TABLE2\LIGHTS1_MAT.MATERIAL.MBIN',
			-- P.base .. 'SPACEBASE\ROOMMODULES\GARAGEFREIGHT\GARAGEFREIGHT_TERMINAL\FLATHOLOMAT.MATERIAL.MBIN',

			-- P.base .. 'FOLIAGE\BEAMSTONE\SCROLLING_MAT.MATERIAL.MBIN',
			P.base .. 'FOLIAGE\BEAMSTONE\LIGHTBEAM_MAT3.MATERIAL.MBIN',
			-- P.base .. 'SHARDGARDEN\SHARD_MAT.MATERIAL.MBIN',
			P.base .. 'FOLIAGE\STARJOINT\MSTRUCTURE_MAT.MATERIAL.MBIN',
			-- P.base .. 'BONEGARDEN\BONEGLOWCOLOURISABLE.MATERIAL.MBIN',
			P.base .. 'FOLIAGE\WEIRDCUBE\CELLSCOLOURISABLE1.MATERIAL.MBIN',
			P.base .. 'FOLIAGE\WEIRDCUBE\CELLSCOLOURISABLE2.MATERIAL.MBIN',

			P.farm .. 'FARMLUSH\STARBULB_MAT.MATERIAL.MBIN',
			P.farm .. 'FARMRADIOACTIVE\FRUITGLOW_MAT.MATERIAL.MBIN',
			P.farm .. 'FARMSCORCHED\FRUITYELLOW_MAT.MATERIAL.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'MaterialFlag', '_F34_GLOW'},
				REMOVE				= 'SECTION'
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			P.farm .. 'FARMRADIOACTIVE\FRUITGLOW_MAT.MATERIAL.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'MaterialFlag', '_F07_UNLIT'},
				REMOVE				= 'SECTION'
			}
		}
	}
}}}}
