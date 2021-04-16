--[[┎──────────────────────────────────────────────────
	┃ META folder tweaks collection
────┸──────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META various tweaks.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.37',
	MOD_BATCHNAME		= '_META ~@~collection.pak',
	MOD_DESCRIPTION		= [[
							Replace the creature-scanned icon
							Faster screen text
							Disable ship weapons overheat warning
							Remove spawn chance of random cargo drops
							Increase suit tech inventory size; round stack to 10000
							remove startup logo splash
							better cloud map  ]],
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		-- replace the creature-scanned icon
		MBIN_FILE_SOURCE	= 'METADATA\UI\HUD\SCANNERICONS.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'CreatureDiscovered',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/CREATURE.SCANNED2.DDS'}
				}
			}
		}
	},
	{
		-- Faster screen text
		MBIN_FILE_SOURCE	= 'METADATA\UI\SPECIALTEXTPUNCTUATIONDELAYDATA.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				INTEGER_TO_FLOAT	= 'FORCE',
				MATH_OPERATION 		= '*',
				VALUE_CHANGE_TABLE 	= {
					{'Delay',			0.25},
					{'DefaultDelay',	0.25}
				}
			}
		}
	},
	{
		-- Disable ship -switch weapon when overheated- warning
		MBIN_FILE_SOURCE	= 'METADATA\REALITY\DEFAULTREALITY.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				PRECEDING_KEY_WORDS = 'ShipWeapons',
				VALUE_CHANGE_TABLE 	= {
					{'ShowOverheatSwitch', false}
				}
			}
		}
	},
	{
		-- Remove spawn chance of random cargo drops
		MBIN_FILE_SOURCE	= {
			'METADATA\SIMULATION\SOLARSYSTEM\BIOMES\OBJECTS\LEVELONEOBJECTS\FULL.MBIN',
			'METADATA\SIMULATION\SOLARSYSTEM\BIOMES\OBJECTS\LEVELONEOBJECTS\FULLSAFE.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	 = {'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/DEBRIS/DEBRISLARGE_COMMON.SCENE.MBIN'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'MaxHeight',	-1}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/RUINPARTS/WORDSTONE.SCENE.MBIN'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'DestroyedByPlayerVehicle', false} -- bug fix
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'Filename', 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/CRATE/CRATELAYOUTS.SCENE.MBIN'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'MaxHeight',	-1}
				}
			}
		}
	},
	{
		-- Increase suit tech inventory size; round stack to 10000
		MBIN_FILE_SOURCE	= {
			'METADATA\GAMESTATE\DEFAULTINVENTORYBALANCE.MBIN',
			'METADATA\GAMESTATE\DEFAULTINVENTORYBALANCESURVIVAL.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'DefaultSubstanceMaxAmount',			10000},
					{'SubstanceMaxAmountLimit',				10000},
					{'ProductMaxAmountLimit',				10000},
					{'ShipProductStorageMultiplier',		10},	-- 5
					{'PlayerPersonalInventoryTechWidth',	5},
					{'PlayerPersonalInventoryTechHeight',	5},
					{'DeconstructRefundPercentage',			0.75}	-- 0.5
				}
			}
		}
	},
	{
		-- Increase substance stack in survival mode
		MBIN_FILE_SOURCE	= 'METADATA\GAMESTATE\DEFAULTINVENTORYBALANCESURVIVAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'DefaultSubstanceMaxAmount',			500}
				}
			}
		}
	},
	{
		-- remove startup logo splash
		MBIN_FILE_SOURCE	= 'METADATA\UI\BOOTLOGOPC.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Texture1',		''},
					{'Texture1',		''},
					{'DisplayTime1',	0},
					{'DisplayTime2',	0},
					{'DisplayTime3',	0},
					{'DisplayTime4',	0}
				}
			}
		}
	},
	{
		-- better cloud map
		MBIN_FILE_SOURCE	= 'MATERIALS\ATMOSPHERE.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gaSpecularValuesVec4'},
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gCloudMap'},
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/SPACE/ATMOSPHERE/ATMOSPHERE.DDS'}
				}
			}
		}
	}
}}}}
