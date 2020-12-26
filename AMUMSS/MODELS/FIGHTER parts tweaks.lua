--[[┎──────────────────────────────────────────────────────────────────
	┃ Shorter overhead tail fin _Acc_A (clips with engines B & D)
	┃ metal-tipped overhead tail fin
	┃ Narower _SubWings_D, so it doesn't clip the ground
	┃ Partial fix to wing_K disapearing texture when near
	┃ Relocate bobble in cockpit so it doesn't obstruct the map
	┃ Reduce ship body spotlight intensity
────┸──────────────────────────────────────────────────────────────--]]
Tail_Scales = {
	dat = {'', 1, 2, 3, 4, 5, 6, 10},
	Get = function(x)
		return {
			INTEGER_TO_FLOAT	= 'FORCE',
			SPECIAL_KEY_WORDS	= {'Name', '_Acc_A' .. x},
			VALUE_CHANGE_TABLE 	= {
				{'ScaleX',		0.88},
				{'ScaleY',		0.68},
				{'ScaleZ',		1.08}
			}
		}
	end
}

function BuildExmlChangeTable(tbl)
	local T = {}
	for i=1, #tbl.dat do table.insert(T, tbl.Get(tbl.dat[i])) end
	return T
end

function BuildExmlChangeTable_DeleteContrail(x, y)
	local T = {}
	for i = x, y do
		local section = {
			SPECIAL_KEY_WORDS	= {'Name', 'Contrail' .. i},
			REMOVE				= 'SECTION'
		}
		table.insert(T, section)
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL fighter parts tweaks.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.13',
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MOD_DESCRIPTION		= 'U',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		-- metal-tipped overhead tail fin
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\ACCESSORIES\ACCA.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Value', 'MODELS\COMMON\SPACECRAFT\FIGHTERS\ACCESSORIES\ACCA\SUBWINGSC_TERTIARY.MATERIAL.MBIN'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'MODELS\COMMON\SPACECRAFT\FIGHTERS\COCKPIT\COCKPIT_F\COCKPTF\SECONDARY2.MATERIAL.MBIN'},
				}
			}
		}
	},
	{
		-- Engine_C - Replace 3rd custom skin (tertiary) with black metal
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\ENGINE\ENGINE_C\ENGINEC.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Value', 'MODELS\COMMON\SPACECRAFT\FIGHTERS\ENGINE\ENGINE_C\ENGINEC\TERTIARY.MATERIAL.MBIN'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'MODELS\COMMON\SPACECRAFT\FIGHTERS\COCKPIT\COCKPIT_F\COCKPTF\SECONDARY2.MATERIAL.MBIN'},
				}
			}
		}
	},
	{
		-- metal-tipped WINGS_A wing tips
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_A\WINGS_A.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Value', 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_A\WINGS_A\TERTIARY.MATERIAL.MBIN'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'MODELS\COMMON\SPACECRAFT\FIGHTERS\COCKPIT\COCKPIT_F\COCKPTF\SECONDARY2.MATERIAL.MBIN'},
				}
			}
		}
	},
	{
		-- metal parts for WING_B instead of colored texture
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_B\WINGSB.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Value', 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_B\WINGSB\TERTIARY.MATERIAL.MBIN'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'MODELS\COMMON\SPACECRAFT\FIGHTERS\COCKPIT\COCKPIT_F\COCKPTF\SECONDARY2.MATERIAL.MBIN'},
				}
			}
		}
	},
	{
		-- Slightly wider _SubWings_A (just looks better)
		MBIN_FILE_SOURCE	= {
			'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_B\WINGSB.SCENE.MBIN',
			'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_E\WINGSE.SCENE.MBIN',
			'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_H\WINGSH.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_A'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleZ',		1.265},
					{'TransZ',		0.315}
				}
			}
		}
	},
	{
		-- Narower _SubWings_D, so it doesn't clip the ground
		MBIN_FILE_SOURCE	= {
			'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_B\WINGSB.SCENE.MBIN',
			'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_F\WINGS_F.SCENE.MBIN',
			'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_H\WINGSH.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_D'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleY',		0.7},
					{'ScaleZ',		1.06},
					{'TransY',		0.36}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_E\WINGSE.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_D'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleY',		0.7},
					{'ScaleZ',		1.04},
					{'TransY',		0.36},
					{'TransZ',		0.56}
				}
			}
		}
	},
	{
		-- Partial fix to wing_K disapearing texture when near
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_K\WINGSK.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST1'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		0}
				}
			},
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				SPECIAL_KEY_WORDS	= {'Name', '_SubWings_A'},
				VALUE_CHANGE_TABLE 	= {
					{'ScaleZ',		1.24}
				}
			}
		}
	},
	{
		-- Shrink and move bobble locator in fighter cockpit so it doesn't obstruct the map
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\COCKPIT\COCKPITCOMMON_INTERIOR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				INTEGER_TO_FLOAT	= 'FORCE',
				MATH_OPERATION 		= '+',
				SPECIAL_KEY_WORDS	= {'Name', 'BobbleHeadLocator'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.081},	-- 0.088366
					{'TransY',		0.0208},-- -0.485839
					{'TransZ',		0.081},	-- 1.067041
					{'ScaleX',		-0.22},
					{'ScaleY',		-0.22},
					{'ScaleZ',		-0.22}
				}
			}
		}
	},
	{
		-- Reduce ship body outer spotlight intensity
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\ACCESSORIES\HEADLAMP.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'StandingLight1', 'Name', 'FOV'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		86}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'StandingLight1', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		28000}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\FIGHTER_PROC.SCENE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(Tail_Scales)
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_B\WINGSB.SCENE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable_DeleteContrail(3, 16)
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_E\WINGSE.SCENE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable_DeleteContrail(2, 19)
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_F\WINGS_F.SCENE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable_DeleteContrail(2, 9)
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_H\WINGSH.SCENE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable_DeleteContrail(2, 14)
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS\COMMON\SPACECRAFT\FIGHTERS\WINGS\WINGS_K\WINGSK.SCENE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable_DeleteContrail(2, 13)
	}
}}}}
