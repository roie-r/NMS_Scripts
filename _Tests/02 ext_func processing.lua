
local mbin = 'METADATA/REALITY/CATALOGUECRAFTING.MBIN'

local function Processing(exml)
	return exml:gsub('name="UnseenCount" value="0"', 'name="UnseenCount" value="1"')
end

ProcessRawMxml = nil
function ProcessRawMxml(the_index)
	local norm_path	= NormalizePath(mbin, true)
	return {
		[norm_path] = Processing(table.concat(the_index.ModdedEXMLs[norm_path]))
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+  TEST 02 ext_func',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE = { mbin },
		EXT_FUNC		 = { 'ProcessRawMxml' }
	}
}}}}
