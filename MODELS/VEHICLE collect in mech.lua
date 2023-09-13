-------------------------------------------------------------------------------------------------
mod_desc = [[
  collect stuff while in the mech
  resource crates, pearl, fiend egg, eye, hadal, larval, crystal sulphite, glitches and others..
]]-----------------------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL collect in mech.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.44',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/BEAMSTONE/ENTITIES/BEAMSTONE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/BONECOLLECT/ENTITIES/BONECOLLECT.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/BUBBLECOLLECT/ENTITIES/SMALLBUBBLEC.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/CONTOURPOD/ENTITIES/MAINPOD.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/ENGINEORB/ENTITIES/_ENGINEORB_1.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/HYDROPOD/ENTITIES/PODGROWING.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/MEDGEOMETRIC/ENTITIES/MEDGEOMETRIC.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/SHARD/ENTITIES/SHARD.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/SHELLWHITE/ENTITIES/SHELLWHITE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/STARJOINT/ENTITIES/SINGLEJOINT.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/FOLIAGE/WEIRDCUBE/ENTITIES/CUBOIDSMALL.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/BARREL/BARREL_MEDIUM/ENTITIES/BARREL_MEDIUM.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/BARREL/BARREL_MEDIUM_RARE/ENTITIES/BARREL_MEDIUM_RARE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/DEBRISLARGE_COMMON/ENTITIES/DEBRIS.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/DEBRISLARGE_COMMON/ENTITIES/DEBRISLARGE_COMMON.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/DEBRISSMALL_COMMON/ENTITIES/DEBRISSMALL_COMMON.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/DEBRISWARRIOR/ENTITIES/DEBRIS_COMMON.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/DEBRISWARRIOR/ENTITIES/DEBRIS_RARE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_LARGE/ENTITIES/CRATE_LARGE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_LARGE_RARE/ENTITIES/CRATE_LARGE_RARE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_MEDIUM/ENTITIES/CRATE_MEDIUM.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_MEDIUM_RARE/ENTITIES/CRATE_MEDIUM_RARE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_SMALLA/ENTITIES/CRATE_SMALLA.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_SMALLA_RARE/ENTITIES/CRATE_SMALLA_RARE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_SMALLB/ENTITIES/CRATE_SMALLB.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_SMALLB_RARE/ENTITIES/CRATE_SMALLB_RARE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/UNDERGROUNDCRATE/ENTITIES/UNDERGROUNDCRATE.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/RUINS/PARTS/CRATEKEY/ENTITIES/CRATEKEY.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/COMMODITYPLANT2/ENTITIES/COMPLANT_2.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/FUELPLANT1/ENTITIES/FUELPLANT_1.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/TECHPLANT/ENTITIES/TECHPLANT.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/GROUND/CLAMSHELL/ENTITIES/MAIN.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/COMMON/RARERESOURCE/GROUND/FIENDEGGPARTS/FIENDEGGREWARD/ENTITIES/FIENDREWARD.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/UNDERWATER/INTERACTIVE/FISHFIENDROCK/ENTITIES/FIENDPLANT.ENTITY.MBIN',
			'MODELS/PLANETS/BIOMES/UNDERWATER/INTERACTIVE/STEAMVENT/ENTITIES/GEM.ENTITY.MBIN',
			'MODELS/PLANETS/CREATURES/FISH/CLAM/ENTITIES/PEARL.ENTITY.MBIN',
			'MODELS/PLANETS/CREATURES/FISH/PARTS/GRABBYPLANTEYE/ENTITIES/GRABBYPLANTEYE.ENTITY.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'CanCollectInMech', true}
				}
			}
		}
	},
	{--	|gunkless crate| (remove rusted metal)
		MBIN_FILE_SOURCE	= 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATE_LARGE_RARE/ENTITIES/CRATE_LARGE_RARE.ENTITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'GcMaintenanceComponentData.xml',
				REMOVE				= 'Section'
			}
		}
	}
}}}}
