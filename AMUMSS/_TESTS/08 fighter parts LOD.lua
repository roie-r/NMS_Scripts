
local fighter_parts = {
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/ACCA.SCENE.MBIN',			'AccALOD0'},
	-- {'MODELS/COMMON/SPACECRAFT/FIGHTERS/ACCESSORIES/TURBINEAA.SCENE.MBIN',		'Wings5LOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_B/COCKPITB.SCENE.MBIN',	'CockpitBLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_A/COCKPITA.SCENE.MBIN',	'BodyLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_D/COCKPITD.SCENE.MBIN',	'BodyLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_E/COCKPIT_E.SCENE.MBIN','BodyLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/COCKPIT/COCKPIT_F/COCKPTF.SCENE.MBIN',	'BodyLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_B/ENGINEB.SCENE.MBIN',	'EngineBLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_C/ENGINEC.SCENE.MBIN',	'EngineCLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/ENGINE/ENGINE_D/ENGINED.SCENE.MBIN',	'EngineD1LOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_A/WINGS_A.SCENE.MBIN',		'WingsALOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_B/WINGSB.SCENE.MBIN',	{'WingsLOD0','WingsBLOD0'}},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_D/WINGSD.SCENE.MBIN',	'WingsDLOD0'}, -- ??LeftLOD0 + RightLOD0
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_E/WINGSE.SCENE.MBIN',	{'WingELOD0', 'WingE2LOD0'}},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_J/WINGSJ.SCENE.MBIN',	{'_WingsJ_FullLOD0', '_WingsJ_LowLOD0', '_WingsJ_MidLOD0'}},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/WINGS/WINGS_K/WINGSK.SCENE.MBIN',		{'WingsK_ALOD0', 'WingsK_BLOD0'}},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSALEFT.SCENE.MBIN',	'SubWingsALeftLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_A/SUBWINGSARIGHT.SCENE.MBIN',	'SubWingsARightLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_B/SUBWINGSBLEFT.SCENE.MBIN',	'SubWingsBLeftLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_B/SUBWINGSBRIGHT.SCENE.MBIN',	'SubWingsBRightLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_C/SUBWINGSCLEFT.SCENE.MBIN',	'SubWingsCLeftLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_C/SUBWINGSCRIGHT.SCENE.MBIN',	'SubWingsCRightLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDLEFT.SCENE.MBIN',	'SubWingDLeftLOD0'},
	{'MODELS/COMMON/SPACECRAFT/FIGHTERS/SUBWINGS/SUBWINGS_D/SUBWINGSDRIGHT.SCENE.MBIN',	'SubWingDRightLOD0'},
}

local function Add_Fighter_LOD_Attribute()
	local function Add_Entity_Attribute(name)
		return {
			SPECIAL_KEY_WORDS	= {'Name', name},
			PRECEDING_KEY_WORDS	= 'Attributes',
			SECTION_ACTIVE		= 1,
			ADD 				= [[
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="ATTACHMENT"/>
					<Property name="AltID" value=""/>
					<Property name="Value" value="MODELS/COMMON/SPACECRAFT/SHARED/ENTITIES/SHAREDLODDISTANCES.ENTITY.MBIN"/>
				</Property>
			]]
		}
	end
	local T = {}
	for _,mbin in ipairs(fighter_parts) do
		src = {}
		src.MBIN_FILE_SOURCE = mbin[1]
		src.EXML_CHANGE_TABLE = {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST1'},
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST2'},
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'LODDIST3'},
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'NUMLODS'},
				VALUE_CHANGE_TABLE 	= { {'Value', 5} }
			}
		}
		if type(mbin[2]) == 'table' then
			for _,v in ipairs(mbin[2]) do
				table.insert(src.EXML_CHANGE_TABLE, Add_Entity_Attribute(v))
			end
		else
			table.insert(src.EXML_CHANGE_TABLE, Add_Entity_Attribute(mbin[2]))
		end
		table.insert(T, src)
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TEST fighter LOD increase.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.84,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= Add_Fighter_LOD_Attribute()
}}}
