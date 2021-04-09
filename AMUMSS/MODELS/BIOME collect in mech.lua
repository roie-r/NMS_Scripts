--[[┎───────────────────────────────────────────────────────────────────────────────
	┃ collect stuff while in the mech
	┃ all resource crates, pearl, fiend egg, eye, hadal, larval, crystal sulphite
────┸───────────────────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL collect in mech.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.35',
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\BARREL\BARREL_MEDIUM_RARE\ENTITIES\BARREL_MEDIUM_RARE.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\DEBRIS\DEBRISLARGE_COMMON\ENTITIES\DEBRIS.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\DEBRIS\DEBRISLARGE_COMMON\ENTITIES\DEBRISLARGE_COMMON.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\DEBRIS\DEBRISSMALL_COMMON\ENTITIES\DEBRISSMALL_COMMON.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\DEBRIS\DEBRISWARRIOR\ENTITIES\DEBRIS_COMMON.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\DEBRIS\DEBRISWARRIOR\ENTITIES\DEBRIS_RARE.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\CRATE_LARGE\ENTITIES\CRATE_LARGE.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\CRATE_MEDIUM\ENTITIES\CRATE_MEDIUM.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\CRATE_MEDIUM_RARE\ENTITIES\CRATE_MEDIUM_RARE.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\CRATE_SMALLA\ENTITIES\CRATE_SMALLA.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\CRATE_SMALLA_RARE\ENTITIES\CRATE_SMALLA_RARE.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\CRATE_SMALLB\ENTITIES\CRATE_SMALLB.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\CRATE_SMALLB_RARE\ENTITIES\CRATE_SMALLB_RARE.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\CRATE\UNDERGROUNDCRATE\ENTITIES\UNDERGROUNDCRATE.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\INTERACTIVEFLORA\COMMODITYPLANT\ENTITIES\COMMODITY.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\INTERACTIVEFLORA\FUELPLANT\ENTITIES\FUELPLANT.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\INTERACTIVEFLORA\TECHPLANT\ENTITIES\TECHPLANT.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\CLAMSHELL\ENTITIES\MAIN.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\FIENDEGGPARTS\FIENDEGGREWARD\ENTITIES\FIENDREWARD.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\UNDERWATER\INTERACTIVE\FISHFIENDROCK\ENTITIES\FIENDPLANT.ENTITY.MBIN',
			'MODELS\PLANETS\BIOMES\UNDERWATER\INTERACTIVE\STEAMVENT\ENTITIES\GEM.ENTITY.MBIN',
			'MODELS\PLANETS\CREATURES\FISH\CLAM\ENTITIES\PEARL.ENTITY.MBIN',
			'MODELS\PLANETS\CREATURES\FISH\PARTS\GRABBYPLANTEYE\ENTITIES\GRABBYPLANTEYE.ENTITY.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'CanCollectInMech', true}
				}
			}
		}
	}
}}}}
