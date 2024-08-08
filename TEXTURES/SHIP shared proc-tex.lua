------------------------------------------------------------
-- EXCLUDED FROM BATCH
-------------------------------------------------------------------------
local mod_desc = [[
  - Add new ship textures - shared by fighter, dropship and sailship
]]-----------------------------------------------------------------------

local ship_new_textures = {
	{
		name	= 'TOPOMAP',
		metal	= false
	},
	{
		name	= 'PAINTSWIRL',
		metal	= false
	},
	{
		name	= 'MEZO',
		metal	= false
	},
	{
		name	= 'MAYA_SNAKE',
		metal	= true
	},
	{
		name	= 'MAYA_WALL',
		metal	= true
	},
	{
		name	= 'AZTEC_DRAGON',
		metal	= false
	},
	{
		name	= 'AZTEC_FACE',
		metal	= false
	},
	{
		name	= 'CELTIC',
		metal	= true
	},
	{
		name	= 'POLYNESIA',
		metal	= false
	},
	{
		name	= 'POLYNESIA_SEA',
		metal	= true
	},
	{
		name	= 'MAORI_FACE',
		metal	= false
	},
	{
		name	= 'EASTERN',
		metal	= false
	},
	{
		name	= 'WOVEN',
		metal	= true
	},
	{
		name	= 'WOVEN2',
		metal	= true
	},
	{
		name	= 'DEMON',
		metal	= false
	},
	{
		name	= 'TARGET',
		metal	= false
	},
	{
		name	= 'SKULLS',
		metal	= true
	},
	{
		name	= 'THE_HARING',
		metal	= true
	},
}

local PROC_TEX_CT = {}
for _,src in ipairs({
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/HQTRIM_PRIMARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/HQTRIM_SECONDARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/SECONDARY.TEXTURE.MBIN',
	'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/TERTIARY.TEXTURE.MBIN'
}) do
	local ECT = {{
		SPECIAL_KEY_WORDS	= {'Name', 'PAINTED'},
		SEC_SAVE_TO			= 'procedural_texture',
	}}
	for _,snk in ipairs(ship_new_textures) do
		ECT[#ECT+1] = {
			SEC_EDIT 			= 'procedural_texture',
			VALUE_CHANGE_TABLE 	= {
				{'Name',		snk.name},
				{'Probability',	0.005}
			}
		}
		if not src:find('TERTIARY') then
			ECT[#ECT+1] = {
				SEC_EDIT 			= 'procedural_texture',
				VALUE_MATCH			= '{%.xml$}',
				VALUE_MATCH_OPTIONS = '~=',
				VALUE_CHANGE_TABLE 	= {
					{'Palette',		src:find('/PRIM') and 'Paint' or  'Undercoat'},
					{'Multiply',	snk.multi or true},
					{'Diffuse',		'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.'..snk.name..'.DDS'},
					{'Normal',		'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.'..snk.name..'.NORMAL.DDS'},
					{'Mask',		'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/PRIMARY.'..snk.name..'.MASKS.DDS'}
				}
			}
		end
		ECT[#ECT+1] = {
			SPECIAL_KEY_WORDS	= {'Name', 'BASE'},
			PRECEDING_KEY_WORDS = 'Textures',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'procedural_texture'
		}
	end
	PROC_TEX_CT[#PROC_TEX_CT+1] = {
		MBIN_FILE_SOURCE	= src,
		EXML_CHANGE_TABLE	= ECT
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TEXTURE ship shared.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.03',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= PROC_TEX_CT
}}}
